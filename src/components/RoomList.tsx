import React from 'react';
import { Room } from '../types';
import { Users, Calendar } from 'lucide-react';
import { Link } from 'react-router-dom';

interface RoomListProps {
  rooms: Room[];
  selectedCategory: string;
}

export function RoomList({ rooms, selectedCategory }: RoomListProps) {
  const filteredRooms = selectedCategory === 'all' 
    ? rooms 
    : rooms.filter(room => room.category === selectedCategory);

  return (
    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
      {filteredRooms.map((room) => (
        <div key={room.id} className="bg-white rounded-lg shadow-md overflow-hidden">
          <img
            src={room.image_url}
            alt={room.name}
            className="w-full h-48 object-cover"
          />
          <div className="p-4">
            <h3 className="text-xl font-semibold mb-2">{room.name}</h3>
            <p className="text-gray-600 mb-4">{room.description}</p>
            <div className="flex items-center gap-4 mb-4">
              <div className="flex items-center gap-1">
                <Users className="h-4 w-4 text-gray-500" />
                <span className="text-sm">Up to {room.max_guests} guests</span>
              </div>
              <div className="flex items-center gap-1">
                <Calendar className="h-4 w-4 text-gray-500" />
                <span className="text-sm">Available now</span>
              </div>
            </div>
            <div className="flex items-center justify-between">
              <span className="text-2xl font-bold">${room.price_per_night}</span>
              <Link
                to={`/book/${room.id}`}
                className="bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700"
              >
                Book Now
              </Link>
            </div>
          </div>
        </div>
      ))}
    </div>
  );
}