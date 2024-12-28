/*
  # Initial Schema for Hotel Management System

  1. New Tables
    - rooms
      - id (uuid, primary key)
      - name (text)
      - description (text)
      - price_per_night (numeric)
      - category (text)
      - image_url (text)
      - max_guests (integer)
      - created_at (timestamp)
      
    - bookings
      - id (uuid, primary key)
      - user_id (uuid, foreign key)
      - room_id (uuid, foreign key)
      - check_in_date (date)
      - check_out_date (date)
      - guests_count (integer)
      - total_price (numeric)
      - status (text)
      - booking_number (text)
      - created_at (timestamp)

  2. Security
    - Enable RLS on all tables
    - Add policies for authenticated users
*/

-- Create rooms table
CREATE TABLE rooms (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  description text NOT NULL,
  price_per_night numeric NOT NULL,
  category text NOT NULL,
  image_url text NOT NULL,
  max_guests integer NOT NULL,
  created_at timestamptz DEFAULT now()
);

-- Create bookings table
CREATE TABLE bookings (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES auth.users NOT NULL,
  room_id uuid REFERENCES rooms NOT NULL,
  check_in_date date NOT NULL,
  check_out_date date NOT NULL,
  guests_count integer NOT NULL,
  total_price numeric NOT NULL,
  status text NOT NULL DEFAULT 'pending',
  booking_number text NOT NULL UNIQUE DEFAULT 'BK-' || substr(gen_random_uuid()::text, 1, 8),
  created_at timestamptz DEFAULT now()
);

-- Enable RLS
ALTER TABLE rooms ENABLE ROW LEVEL SECURITY;
ALTER TABLE bookings ENABLE ROW LEVEL SECURITY;

-- Policies for rooms
CREATE POLICY "Anyone can view rooms"
  ON rooms
  FOR SELECT
  TO authenticated
  USING (true);

-- Policies for bookings
CREATE POLICY "Users can view own bookings"
  ON bookings
  FOR SELECT
  TO authenticated
  USING (auth.uid() = user_id);

CREATE POLICY "Users can create bookings"
  ON bookings
  FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own bookings"
  ON bookings
  FOR UPDATE
  TO authenticated
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- Insert sample rooms
INSERT INTO rooms (name, description, price_per_night, category, image_url, max_guests) VALUES
('Deluxe Ocean View', 'Spacious room with stunning ocean views', 299.99, 'suite', 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b', 2),
('Family Suite', 'Perfect for families with separate living area', 399.99, 'suite', 'https://images.unsplash.com/photo-1591088398332-8a7791972843', 4),
('Standard Double', 'Comfortable room with modern amenities', 199.99, 'double', 'https://images.unsplash.com/photo-1566665797739-1674de7a421a', 2),
('Single Room', 'Cozy room for solo travelers', 149.99, 'single', 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304', 1);