-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2023 at 04:38 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pt`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userId` int(11) NOT NULL,
  `userName` varchar(200) NOT NULL,
  `userEmail` varchar(200) NOT NULL,
  `userPassword` varchar(200) NOT NULL,
  `userType` enum('admin','customer') NOT NULL,
  `phoneNumber` varchar(400) NOT NULL,
  `userHobbies` varchar(400) DEFAULT NULL
) ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userId`, `userName`, `userEmail`, `userPassword`, `userType`, `phoneNumber`, `userHobbies`) VALUES
(0, 'Thimasha', 'ugtt@gmail.com', '1234', 'admin', 'Home: 0112223333 Personal Number: 0711112222', NULL),
(1, 'tt', 'tt@mail.com', '1234', 'customer', 'Home: 0122266666', 'Dancing'),
(2, 'Thim Tha', 'ugth@gmail.com', '1234', 'admin', 'Home: 0312224444', NULL),
(3, 'ddtt', 'dt@gmai.com', 'abcd', 'customer', 'Work Mobile: 0112345678', 'Singing'),
(4, 'pm', 'pm@gmail.com', 'abcd', 'admin', 'Home: 0112224444', ''),
(12, 'kivi', 'kivi@gmail.com', 'abcd', 'customer', 'Personal Number: 0701115555', 'Watching Anime'),
(14, 'hk', 'hk@mail.com', 'abcd', 'admin', 'Home: 0112228888', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `userEmail` (`userEmail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
