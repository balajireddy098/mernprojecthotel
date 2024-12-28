/*
  # Add 50 Additional Hotel Rooms
  
  1. Changes
    - Adds 50 new rooms with diverse categories, prices, and amenities
    - Includes luxury suites, family rooms, ocean view rooms, and standard rooms
    - Prices range from $150 to $1500 per night
    - Room capacities from 1 to 8 guests
*/

INSERT INTO rooms (name, description, price_per_night, category, image_url, max_guests) VALUES
-- Luxury Suites
('Presidential Suite', 'Ultimate luxury with panoramic views, private terrace, and butler service', 1500.00, 'luxury', 'https://images.unsplash.com/photo-1590073242678-70ee3fc28f8e', 6),
('Royal Penthouse', 'Exclusive top-floor suite with private dining and spa', 1200.00, 'luxury', 'https://images.unsplash.com/photo-1578683010236-d716f9a3f461', 4),
('Grand Suite', 'Elegant suite with separate living area and city views', 800.00, 'luxury', 'https://images.unsplash.com/photo-1591088398332-8a7791972843', 4),

-- Ocean View Rooms
('Premium Ocean View', 'Breathtaking ocean views with private balcony', 450.00, 'ocean-view', 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b', 2),
('Deluxe Ocean Suite', 'Spacious suite with panoramic ocean views', 550.00, 'ocean-view', 'https://images.unsplash.com/photo-1615874959474-d609969a20ed', 3),
('Oceanfront Villa', 'Private villa steps from the beach', 750.00, 'ocean-view', 'https://images.unsplash.com/photo-1602002418082-a4443e081dd1', 4),

-- Family Rooms
('Family Comfort Suite', 'Perfect for families with connecting rooms', 400.00, 'family', 'https://images.unsplash.com/photo-1598928506311-c55ded91a20c', 5),
('Family Deluxe Room', 'Spacious room with extra beds for children', 350.00, 'family', 'https://images.unsplash.com/photo-1566665797739-1674de7a421a', 4),
('Family Garden Suite', 'Ground floor suite with direct garden access', 450.00, 'family', 'https://images.unsplash.com/photo-1598928636135-d146006ff4be', 6),

-- Standard Rooms
('Classic Double', 'Comfortable room with modern amenities', 200.00, 'standard', 'https://images.unsplash.com/photo-1505693314120-0d443867891c', 2),
('Superior Twin', 'Spacious room with twin beds', 220.00, 'standard', 'https://images.unsplash.com/photo-1590490360182-c33d57733427', 2),
('Deluxe King', 'Large room with king-size bed', 250.00, 'standard', 'https://images.unsplash.com/photo-1587985064135-0366536eab42', 2),

-- Business Rooms
('Business Suite', 'Perfect for business travelers with work desk', 300.00, 'business', 'https://images.unsplash.com/photo-1594560913095-8cf34baf3b0d', 2),
('Executive Room', 'Modern room with business facilities', 280.00, 'business', 'https://images.unsplash.com/photo-1566665797739-1674de7a421a', 2),
('Corporate Suite', 'Suite with meeting area', 350.00, 'business', 'https://images.unsplash.com/photo-1590381105924-c72589b9ef3f', 3),

-- Honeymoon Suites
('Romantic Suite', 'Perfect for couples with romantic amenities', 400.00, 'honeymoon', 'https://images.unsplash.com/photo-1605346475807-2088fef7c8f9', 2),
('Love Nest Suite', 'Intimate suite with private jacuzzi', 450.00, 'honeymoon', 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b', 2),
('Paradise Suite', 'Luxurious suite for romantic getaways', 500.00, 'honeymoon', 'https://images.unsplash.com/photo-1590073242678-70ee3fc28f8e', 2),

-- Additional Standard Rooms
('Comfort Single', 'Cozy room for solo travelers', 150.00, 'standard', 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304', 1),
('Double Comfort', 'Standard double room', 180.00, 'standard', 'https://images.unsplash.com/photo-1505693314120-0d443867891c', 2),
('Twin Comfort', 'Standard twin room', 180.00, 'standard', 'https://images.unsplash.com/photo-1590490360182-c33d57733427', 2),

-- Additional Family Rooms
('Family Triple', 'Room with three beds', 280.00, 'family', 'https://images.unsplash.com/photo-1598928506311-c55ded91a20c', 3),
('Family Quad', 'Room with four beds', 320.00, 'family', 'https://images.unsplash.com/photo-1598928636135-d146006ff4be', 4),
('Family Suite Plus', 'Two-bedroom family suite', 450.00, 'family', 'https://images.unsplash.com/photo-1591088398332-8a7791972843', 6),

-- Additional Ocean View Rooms
('Sunset View Room', 'Perfect views of the sunset', 380.00, 'ocean-view', 'https://images.unsplash.com/photo-1615874959474-d609969a20ed', 2),
('Horizon View Suite', 'Panoramic ocean views', 420.00, 'ocean-view', 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b', 3),
('Beach Access Room', 'Direct access to beach', 450.00, 'ocean-view', 'https://images.unsplash.com/photo-1602002418082-a4443e081dd1', 2),

-- Additional Luxury Rooms
('Diamond Suite', 'Premium luxury accommodation', 900.00, 'luxury', 'https://images.unsplash.com/photo-1590073242678-70ee3fc28f8e', 4),
('Platinum Suite', 'High-end luxury suite', 1000.00, 'luxury', 'https://images.unsplash.com/photo-1578683010236-d716f9a3f461', 4),
('Gold Suite', 'Elegant luxury suite', 850.00, 'luxury', 'https://images.unsplash.com/photo-1591088398332-8a7791972843', 3),

-- Additional Business Rooms
('Business Plus', 'Enhanced business room', 320.00, 'business', 'https://images.unsplash.com/photo-1594560913095-8cf34baf3b0d', 2),
('Executive Plus', 'Superior business accommodation', 350.00, 'business', 'https://images.unsplash.com/photo-1566665797739-1674de7a421a', 2),
('Corporate Deluxe', 'Deluxe business suite', 380.00, 'business', 'https://images.unsplash.com/photo-1590381105924-c72589b9ef3f', 2),

-- Additional Honeymoon Suites
('Romance Deluxe', 'Deluxe romantic suite', 480.00, 'honeymoon', 'https://images.unsplash.com/photo-1605346475807-2088fef7c8f9', 2),
('Love Palace', 'Luxurious romantic suite', 520.00, 'honeymoon', 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b', 2),
('Cupid Suite', 'Ultimate romantic experience', 550.00, 'honeymoon', 'https://images.unsplash.com/photo-1590073242678-70ee3fc28f8e', 2),

-- Premium Suites
('Ambassador Suite', 'Diplomatic luxury suite', 1100.00, 'luxury', 'https://images.unsplash.com/photo-1578683010236-d716f9a3f461', 4),
('Chairman Suite', 'Ultimate business luxury', 1300.00, 'luxury', 'https://images.unsplash.com/photo-1590073242678-70ee3fc28f8e', 6),
('Royal Family Villa', 'Exclusive family accommodation', 1400.00, 'luxury', 'https://images.unsplash.com/photo-1591088398332-8a7791972843', 8),

-- Garden View Rooms
('Garden Deluxe', 'Peaceful garden views', 280.00, 'garden', 'https://images.unsplash.com/photo-1598928506311-c55ded91a20c', 2),
('Garden Suite', 'Suite with garden access', 350.00, 'garden', 'https://images.unsplash.com/photo-1598928636135-d146006ff4be', 3),
('Garden Family Room', 'Family room with garden', 380.00, 'garden', 'https://images.unsplash.com/photo-1566665797739-1674de7a421a', 4),

-- City View Rooms
('City View Deluxe', 'Stunning city views', 300.00, 'city-view', 'https://images.unsplash.com/photo-1594560913095-8cf34baf3b0d', 2),
('Metropolitan Suite', 'Luxury city viewing', 400.00, 'city-view', 'https://images.unsplash.com/photo-1590381105924-c72589b9ef3f', 3),
('Urban Luxury Room', 'Premium city experience', 450.00, 'city-view', 'https://images.unsplash.com/photo-1566665797739-1674de7a421a', 2),

-- Connecting Rooms
('Family Connect Suite', 'Two connecting rooms', 500.00, 'family', 'https://images.unsplash.com/photo-1598928506311-c55ded91a20c', 6),
('Business Connect', 'Connecting business rooms', 550.00, 'business', 'https://images.unsplash.com/photo-1594560913095-8cf34baf3b0d', 4),
('Group Suite Connect', 'Multiple connecting rooms', 600.00, 'family', 'https://images.unsplash.com/photo-1598928636135-d146006ff4be', 8),

-- Accessible Rooms
('Accessible Comfort', 'Fully accessible room', 200.00, 'accessible', 'https://images.unsplash.com/photo-1566665797739-1674de7a421a', 2),
('Accessible Suite', 'Accessible luxury suite', 300.00, 'accessible', 'https://images.unsplash.com/photo-1590381105924-c72589b9ef3f', 3),
('Accessible Family', 'Accessible family room', 350.00, 'accessible', 'https://images.unsplash.com/photo-1598928506311-c55ded91a20c', 4);