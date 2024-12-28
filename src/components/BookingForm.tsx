import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { supabase } from '../lib/supabase';
import { Room } from '../types';
import { differenceInDays } from 'date-fns';
import { Loader2 } from 'lucide-react';
import toast from 'react-hot-toast';

interface BookingFormProps {
  room: Room;
}

export function BookingForm({ room }: BookingFormProps) {
  const navigate = useNavigate();
  const [isLoading, setIsLoading] = useState(false);
  const [checkIn, setCheckIn] = useState('');
  const [checkOut, setCheckOut] = useState('');
  const [guestsCount, setGuestsCount] = useState(1);

  const calculateTotalPrice = () => {
    if (!checkIn || !checkOut) return 0;
    const days = differenceInDays(new Date(checkOut), new Date(checkIn));
    return days * room.price_per_night;
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setIsLoading(true);

    try {
      const { data: { user } } = await supabase.auth.getUser();
      if (!user) throw new Error('Please sign in to book a room');

      const totalPrice = calculateTotalPrice();
      const { error } = await supabase.from('bookings').insert({
        room_id: room.id,
        user_id: user.id,
        check_in_date: checkIn,
        check_out_date: checkOut,
        guests_count: guestsCount,
        total_price: totalPrice,
      });

      if (error) throw error;
      
      toast.success('Booking created successfully!');
      navigate('/bookings');
    } catch (error: any) {
      toast.error(error.message);
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <form onSubmit={handleSubmit} className="space-y-6">
      <div>
        <label className="block text-sm font-medium mb-1">Check-in Date</label>
        <input
          type="date"
          value={checkIn}
          onChange={(e) => setCheckIn(e.target.value)}
          min={new Date().toISOString().split('T')[0]}
          className="w-full px-4 py-2 border rounded-md"
          required
        />
      </div>
      <div>
        <label className="block text-sm font-medium mb-1">Check-out Date</label>
        <input
          type="date"
          value={checkOut}
          onChange={(e) => setCheckOut(e.target.value)}
          min={checkIn || new Date().toISOString().split('T')[0]}
          className="w-full px-4 py-2 border rounded-md"
          required
        />
      </div>
      <div>
        <label className="block text-sm font-medium mb-1">Number of Guests</label>
        <input
          type="number"
          value={guestsCount}
          onChange={(e) => setGuestsCount(Number(e.target.value))}
          min={1}
          max={room.max_guests}
          className="w-full px-4 py-2 border rounded-md"
          required
        />
      </div>
      <div className="bg-gray-50 p-4 rounded-md">
        <div className="flex justify-between mb-2">
          <span>Price per night</span>
          <span>${room.price_per_night}</span>
        </div>
        <div className="flex justify-between font-bold">
          <span>Total Price</span>
          <span>${calculateTotalPrice()}</span>
        </div>
      </div>
      <button
        type="submit"
        disabled={isLoading}
        className="w-full bg-blue-600 text-white py-2 px-4 rounded-md hover:bg-blue-700 flex items-center justify-center"
      >
        {isLoading ? (
          <Loader2 className="animate-spin h-5 w-5" />
        ) : (
          'Confirm Booking'
        )}
      </button>
    </form>
  );
}