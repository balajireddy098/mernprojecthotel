import React from 'react';
import { Booking } from '../types';
import { format } from 'date-fns';
import { Calendar, Users } from 'lucide-react';

interface BookingListProps {
  bookings: Booking[];
}

export function BookingList({ bookings }: BookingListProps) {
  return (
    <div className="space-y-6">
      {bookings.map((booking) => (
        <div key={booking.id} className="bg-white rounded-lg shadow-md overflow-hidden">
          <div className="p-6">
            <div className="flex justify-between items-start mb-4">
              <div>
                <h3 className="text-xl font-semibold mb-2">{booking.room?.name}</h3>
                <p className="text-gray-600">{booking.room?.description}</p>
              </div>
              <div className="flex flex-col items-end">
                <span className="text-sm font-medium text-gray-500">Booking #{booking.booking_number}</span>
                <span className={`mt-2 px-3 py-1 rounded-full text-sm font-medium ${
                  booking.status === 'confirmed' ? 'bg-green-100 text-green-800' :
                  booking.status === 'cancelled' ? 'bg-red-100 text-red-800' :
                  'bg-yellow-100 text-yellow-800'
                }`}>
                  {booking.status.charAt(0).toUpperCase() + booking.status.slice(1)}
                </span>
              </div>
            </div>
            <div className="grid grid-cols-2 gap-4 mb-4">
              <div className="flex items-center gap-2">
                <Calendar className="h-5 w-5 text-gray-400" />
                <div>
                  <p className="text-sm text-gray-500">Check-in</p>
                  <p className="font-medium">
                    {format(new Date(booking.check_in_date), 'MMM d, yyyy')}
                  </p>
                </div>
              </div>
              <div className="flex items-center gap-2">
                <Calendar className="h-5 w-5 text-gray-400" />
                <div>
                  <p className="text-sm text-gray-500">Check-out</p>
                  <p className="font-medium">
                    {format(new Date(booking.check_out_date), 'MMM d, yyyy')}
                  </p>
                </div>
              </div>
            </div>
            <div className="flex items-center gap-2 mb-4">
              <Users className="h-5 w-5 text-gray-400" />
              <span>{booking.guests_count} guests</span>
            </div>
            <div className="border-t pt-4">
              <div className="flex justify-between items-center">
                <span className="font-medium">Total Price</span>
                <span className="text-xl font-bold">${booking.total_price}</span>
              </div>
            </div>
          </div>
        </div>
      ))}
    </div>
  );
}