-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2022 at 05:43 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uniproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `Bus_no` int(10) NOT NULL,
  `Bus_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Bus_category` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `bfrom` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `To` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Seat_status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`Bus_no`, `Bus_name`, `Bus_category`, `bfrom`, `To`, `Seat_status`) VALUES
(1, 'Hanif Enterprise', 'Business', 'Dhaka', 'Cox\'s Bazar', 0),
(2, 'Hanif Enterprise', 'Economy', 'Dhaka', 'Cox\'s Bazar', 38),
(3, 'Green Line Paribahan', 'Business', 'Dhaka', 'Cox\'s Bazar', 42),
(4, 'Green Line Paribahan', 'Economy', 'Dhaka', 'Cox\'s Bazar', 44),
(5, 'TR Travels', 'Business', 'Dhaka', 'Cox\'s Bazar', 47),
(6, 'TR Travels', 'Economy', 'Dhaka', 'Cox\'s Bazar', 42),
(7, 'Hanif Enterprise', 'Business', 'Cox\'s Bazar', 'Dhaka', 50),
(8, 'Hanif Enterprise', 'Economy', 'Cox\'s Bazar', 'Dhaka', 32),
(9, 'Green Line Paribahan', 'Business', 'Cox\'s Bazar', 'Dhaka', 46),
(10, 'Green Line Paribahan', 'Economy', 'Cox\'s Bazar', 'Dhaka', 50),
(11, 'TR Travels', 'Business', 'Cox\'s Bazar', 'Dhaka', 50),
(12, 'TR Travels', 'Economy', 'Cox\'s Bazar', 'Dhaka', 48);

-- --------------------------------------------------------

--
-- Table structure for table `payment_history`
--

CREATE TABLE `payment_history` (
  `serial` int(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `vehicle_name` varchar(50) NOT NULL,
  `vehicle_type` varchar(50) NOT NULL,
  `vfrom` varchar(50) NOT NULL,
  `vto` varchar(50) NOT NULL,
  `total_ticket` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment_history`
--

INSERT INTO `payment_history` (`serial`, `username`, `vehicle_name`, `vehicle_type`, `vfrom`, `vto`, `total_ticket`) VALUES
(4, 'Rock', 'Green Line Paribahan', 'Business', 'Dhaka', 'Cox\'s Bazar', 2),
(5, 'Fahim Ahmed', 'TR Travels', 'Economy', 'Dhaka', 'Cox\'s Bazar', 2),
(6, '', '', '', '', '', 0),
(7, 'Fahim Ahmed', 'TR Travels', 'Business', 'Dhaka', 'Cox\'s Bazar', 3),
(8, 'Rock', 'TR Travels', 'Economy', 'Dhaka', 'Cox\'s Bazar', 3),
(9, 'Rock', 'Subarna Express', 'First Class', 'Dhaka', 'Cox\'s Bazar', 10);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_info`
--

CREATE TABLE `ticket_info` (
  `Type` varchar(50) NOT NULL,
  `Price` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ticket_info`
--

INSERT INTO `ticket_info` (`Type`, `Price`) VALUES
('Business', 1200),
('Economy', 900),
('First Class', 1100),
('Second Class', 460);

-- --------------------------------------------------------

--
-- Table structure for table `train`
--

CREATE TABLE `train` (
  `Train_no` int(10) NOT NULL,
  `Train_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Train_class` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `tfrom` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `To` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Seat_status` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `train`
--

INSERT INTO `train` (`Train_no`, `Train_name`, `Train_class`, `tfrom`, `To`, `Seat_status`) VALUES
(1, 'Karnafuli Express', 'First class', 'Dhaka', 'Cox\'s Bazar', 58),
(2, 'Karnafuli Express', 'Second class', 'Dhaka', 'Cox\'s Bazar', 38),
(3, 'Subarna Express', 'First class', 'Dhaka', 'Cox\'s Bazar', 30),
(4, 'Subarna Express', 'Second class', 'Dhaka', 'Cox\'s Bazar', 40),
(5, 'Sonar Bangla Express', 'First class', 'Dhaka', 'Cox\'s Bazar', 50),
(6, 'Sonar Bangla Express', 'Second class', 'Dhaka', 'Cox\'s Bazar', 50),
(7, 'Karnafuli Express', 'First class', 'Cox\'s Bazar', 'Dhaka', 50),
(8, 'Karnafuli Express', 'Second class', 'Cox\'s Bazar', 'Dhaka', 50),
(9, 'Subarna Express', 'First class', 'Cox\'s Bazar', 'Dhaka', 50),
(10, 'Subarna Express', 'Second class', 'Cox\'s Bazar', 'Dhaka', 50),
(11, 'Sonar Bangla Express', 'First class', 'Cox\'s Bazar', 'Dhaka', 50),
(12, 'Sonar Bangla Express', 'Second class', 'Cox\'s Bazar', 'Dhaka', 50);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `age` int(2) NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `confirm_password` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`name`, `phone_number`, `age`, `email`, `password`, `confirm_password`) VALUES
('ahad', '01221551656', 33, 'ahad@gmail.com', 'ahad123', 'ahad123'),
('Fahim Ahmed', '01724718500', 24, 'kuddusisman10@gmail.com', '121212', '121212'),
('farin', '01745033559', 22, 'farin@gmail.com', 'farin123', 'farin123'),
('fahad', '01771551656', 22, 'fahadislam887@gmail.com', 'fahad123', 'fahad123'),
('dip', '01771661656', 24, 'dip@gmail.com', 'dip123', 'dip123'),
('Rock', '01794047277', 12, 'khandakar1+h13@yandex.com', '123456', '123456');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`Bus_no`);

--
-- Indexes for table `payment_history`
--
ALTER TABLE `payment_history`
  ADD PRIMARY KEY (`serial`);

--
-- Indexes for table `ticket_info`
--
ALTER TABLE `ticket_info`
  ADD PRIMARY KEY (`Type`);

--
-- Indexes for table `train`
--
ALTER TABLE `train`
  ADD PRIMARY KEY (`Train_no`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`phone_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `payment_history`
--
ALTER TABLE `payment_history`
  MODIFY `serial` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
