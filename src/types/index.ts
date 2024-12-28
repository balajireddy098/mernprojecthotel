export interface Room {
  id: string;
  name: string;
  description: string;
  price_per_night: number;
  category: string;
  image_url: string;
  max_guests: number;
  created_at: string;
}

export interface Booking {
  id: string;
  user_id: string;
  room_id: string;
  check_in_date: string;
  check_out_date: string;
  guests_count: number;
  total_price: number;
  status: 'pending' | 'confirmed' | 'cancelled';
  booking_number: string;
  created_at: string;
  room?: Room;
}