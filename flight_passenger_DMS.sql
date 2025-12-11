-- Drop database if exists
DROP DATABASE IF EXISTS flight_booking_system;

-- Create database
CREATE DATABASE flight_booking_system;
USE flight_booking_system;

-- Drop all tables if they exist (in reverse dependency order)
DROP TABLE IF EXISTS Payment;
DROP TABLE IF EXISTS Ticket;
DROP TABLE IF EXISTS Seat;
DROP TABLE IF EXISTS Booking;
DROP TABLE IF EXISTS Passenger;
DROP TABLE IF EXISTS Flight;

-- ============================
-- Create tables in proper order
-- ============================

-- Flight Table
CREATE TABLE Flight (
    Flight_ID INT PRIMARY KEY,
    Flight_Name VARCHAR(100) NOT NULL,
    Flight_Model VARCHAR(50) NOT NULL
);

-- Passenger Table
CREATE TABLE Passenger (
    Passenger_ID INT PRIMARY KEY,
    Passenger_Name VARCHAR(100) NOT NULL,
    Passenger_Email VARCHAR(100) NOT NULL UNIQUE
);

-- Booking Table
CREATE TABLE Booking (
    Booking_ID INT PRIMARY KEY,
    Booking_Date DATE NOT NULL,
    Flight_ID INT NULL,
    Passenger_ID INT NULL,
    Booking_Status VARCHAR(50) NOT NULL,
    CONSTRAINT FK_Flight FOREIGN KEY (Flight_ID) REFERENCES Flight(Flight_ID),
    CONSTRAINT FK_Passenger FOREIGN KEY (Passenger_ID) REFERENCES Passenger(Passenger_ID)
);

-- Seat Table
CREATE TABLE Seat (
    Seat_ID INT PRIMARY KEY,
    Seat_Number VARCHAR(10) NOT NULL
);

-- Ticket Table
CREATE TABLE Ticket (
    Ticket_ID INT PRIMARY KEY,
    Ticket_Price DECIMAL(10,2) NOT NULL,
    Seat_ID INT UNIQUE,
    CONSTRAINT FK_Seat FOREIGN KEY (Seat_ID) REFERENCES Seat(Seat_ID)
);

-- Payment Table
CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY,
    Payment_Status VARCHAR(50) NOT NULL,
    Passenger_ID INT,
    Ticket_ID INT,
    CONSTRAINT FK_Payment_Passenger FOREIGN KEY (Passenger_ID) REFERENCES Passenger(Passenger_ID),
    CONSTRAINT FK_Payment_Ticket FOREIGN KEY (Ticket_ID) REFERENCES Ticket(Ticket_ID)
);


INSERT INTO Flight (Flight_ID, Flight_Name, Flight_Model)
VALUES
(1, 'SkyJet 101', 'Boeing 737'),
(2, 'AirBlue 202', 'Airbus A320');




-- ============================
-- Passengers (20 rows)
-- ============================
INSERT INTO Passenger (Passenger_ID, Passenger_Name, Passenger_Email)
VALUES
(1, 'Alice Johnson', 'alice@example.com'),
(2, 'Bob Smith', 'bob@example.com'),
(3, 'Charlie Brown', 'charlie@example.com'),
(4, 'Diana Prince', 'diana@example.com'),
(5, 'Ethan Hunt', 'ethan@example.com'),
(6, 'Fiona Apple', 'fiona@example.com'),
(7, 'George Clooney', 'george@example.com'),
(8, 'Hannah Montana', 'hannah@example.com'),
(9, 'Ian Somerhalder', 'ian@example.com'),
(10, 'Julia Roberts', 'julia@example.com'),
(11, 'Kevin Hart', 'kevin@example.com'),
(12, 'Laura Linney', 'laura@example.com'),
(13, 'Mike Tyson', 'mike@example.com'),
(14, 'Nina Dobrev', 'nina@example.com'),
(15, 'Oscar Isaac', 'oscar@example.com'),
(16, 'Pam Beesly', 'pam@example.com'),
(17, 'Quentin Tarantino', 'quentin@example.com'),
(18, 'Rachel Green', 'rachel@example.com'),
(19, 'Steve Rogers', 'steve@example.com'),
(20, 'Tina Fey', 'tina@example.com');

-- ============================
-- Bookings (20 rows)
-- ============================
INSERT INTO Booking (Booking_ID, Booking_Date, Flight_ID, Passenger_ID, Booking_Status)
VALUES
(1, '2025-12-01', 1, 1, 'Confirmed'),
(2, '2025-12-01', 1, 2, 'Confirmed'),
(3, '2025-12-01', 1, 3, 'Pending'),
(4, '2025-12-02', 2, 4, 'Confirmed'),
(5, '2025-12-02', 2, 5, 'Cancelled'),
(6, '2025-12-03', 1, 6, 'Confirmed'),
(7, '2025-12-03', 1, 7, 'Pending'),
(8, '2025-12-04', 2, 8, 'Confirmed'),
(9, '2025-12-04', 2, 9, 'Confirmed'),
(10, '2025-12-05', 1, 10, 'Confirmed'),
(11, '2025-12-05', 1, 11, 'Pending'),
(12, '2025-12-06', 2, 12, 'Confirmed'),
(13, '2025-12-06', 2, 13, 'Cancelled'),
(14, '2025-12-07', 1, 14, 'Confirmed'),
(15, '2025-12-07', 1, 15, 'Confirmed'),
(16, '2025-12-08', 2, 16, 'Pending'),
(17, '2025-12-08', 2, 17, 'Confirmed'),
(18, '2025-12-09', 1, 18, 'Confirmed'),
(19, '2025-12-09', 1, 19, 'Confirmed'),
(20, '2025-12-10', 2, 20, 'Pending');

-- ============================
-- Seats (20 rows)
-- ============================
INSERT INTO Seat (Seat_ID, Seat_Number)
VALUES
(1, '1A'), (2, '1B'), (3, '1C'), (4, '1D'), (5, '2A'),
(6, '2B'), (7, '2C'), (8, '2D'), (9, '3A'), (10, '3B'),
(11, '3C'), (12, '3D'), (13, '4A'), (14, '4B'), (15, '4C'),
(16, '4D'), (17, '5A'), (18, '5B'), (19, '5C'), (20, '5D');

-- ============================
-- Tickets (20 rows)
-- ============================
INSERT INTO Ticket (Ticket_ID, Ticket_Price, Seat_ID)
VALUES
(1, 200.00, 1), (2, 200.00, 2), (3, 210.00, 3), (4, 210.00, 4), (5, 220.00, 5),
(6, 220.00, 6), (7, 230.00, 7), (8, 230.00, 8), (9, 240.00, 9), (10, 240.00, 10),
(11, 250.00, 11), (12, 250.00, 12), (13, 260.00, 13), (14, 260.00, 14), (15, 270.00, 15),
(16, 270.00, 16), (17, 280.00, 17), (18, 280.00, 18), (19, 290.00, 19), (20, 290.00, 20);

-- ============================
-- Payments (20 rows)
-- ============================
INSERT INTO Payment (Payment_ID, Payment_Status, Passenger_ID, Ticket_ID)
VALUES
(1, 'Paid', 1, 1), (2, 'Paid', 2, 2), (3, 'Pending', 3, 3), (4, 'Paid', 4, 4), (5, 'Cancelled', 5, 5),
(6, 'Paid', 6, 6), (7, 'Pending', 7, 7), (8, 'Paid', 8, 8), (9, 'Paid', 9, 9), (10, 'Paid', 10, 10),
(11, 'Pending', 11, 11), (12, 'Paid', 12, 12), (13, 'Cancelled', 13, 13), (14, 'Paid', 14, 14), (15, 'Paid', 15, 15),
(16, 'Pending', 16, 16), (17, 'Paid', 17, 17), (18, 'Paid', 18, 18), (19, 'Paid', 19, 19), (20, 'Pending', 20, 20);



SELECT 
    Passenger.Passenger_ID,
    Passenger.Passenger_Name,
    Passenger.Passenger_Email,
    Booking.Booking_Status
FROM Passenger
JOIN Booking
    ON Passenger.Passenger_ID = Booking.Passenger_ID
WHERE Booking.Booking_Status = 'Cancelled';





