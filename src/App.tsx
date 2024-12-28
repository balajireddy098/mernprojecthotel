import React, { useEffect, useState } from 'react';
import { BrowserRouter as Router, Routes, Route, Navigate } from 'react-router-dom';
import { Toaster } from 'react-hot-toast';
import { AuthForm } from './components/AuthForm';
import { RoomList } from './components/RoomList';
import { BookingForm } from './components/BookingForm';
import { BookingList } from './components/BookingList';
import { Hotel } from 'lucide-react';
import { supabase } from './lib/supabase';
import { Room } from './types';

function App() {
  const [user, setUser] = useState(null);
  const [rooms, setRooms] = useState<Room[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    // Check current auth status
    supabase.auth.getSession().then(({ data: { session } }) => {
      setUser(session?.user || null);
      setLoading(false);
    });

    // Listen for auth changes
    const { data: { subscription } } = supabase.auth.onAuthStateChange((_event, session) => {
      setUser(session?.user || null);
    });

    return () => subscription.unsubscribe();
  }, []);

  useEffect(() => {
    async function fetchRooms() {
      const { data, error } = await supabase
        .from('rooms')
        .select('*');
      
      if (error) {
        console.error('Error fetching rooms:', error);
        return;
      }

      setRooms(data);
    }

    if (user) {
      fetchRooms();
    }
  }, [user]);

  if (loading) {
    return <div className="flex items-center justify-center min-h-screen">Loading...</div>;
  }

  return (
    <Router>
      <div className="min-h-screen bg-gray-100">
        <nav className="bg-white shadow-sm">
          <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div className="flex justify-between h-16">
              <div className="flex items-center">
                <Hotel className="h-8 w-8 text-blue-600" />
                <span className="ml-2 text-xl font-bold">LuxStay</span>
              </div>
              {user && (
                <div className="flex items-center gap-4">
                  <button
                    onClick={() => supabase.auth.signOut()}
                    className="text-gray-600 hover:text-gray-900"
                  >
                    Sign Out
                  </button>
                </div>
              )}
            </div>
          </div>
        </nav>
        
        <main className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
          <Routes>
            <Route 
              path="/" 
              element={user ? <RoomList rooms={rooms} selectedCategory="all" /> : <AuthForm />} 
            />
            <Route 
              path="/rooms" 
              element={user ? <RoomList rooms={rooms} selectedCategory="all" /> : <Navigate to="/" />} 
            />
            <Route 
              path="/book/:id" 
              element={user ? (
                <BookingForm 
                  room={rooms.find(r => r.id === window.location.pathname.split('/').pop()) || {
                    id: '',
                    name: '',
                    description: '',
                    price_per_night: 0,
                    category: '',
                    image_url: '',
                    max_guests: 0,
                    created_at: ''
                  }} 
                />
              ) : (
                <Navigate to="/" />
              )} 
            />
            <Route 
              path="/bookings" 
              element={user ? <BookingList bookings={[]} /> : <Navigate to="/" />} 
            />
          </Routes>
        </main>
        <Toaster position="top-right" />
      </div>
    </Router>
  );
}

export default App;