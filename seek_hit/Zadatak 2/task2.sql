-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2017 at 07:13 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `task2`
--

-- --------------------------------------------------------

--
-- Table structure for table `aircraft`
--

CREATE TABLE `aircraft` (
  `id` int(11) NOT NULL,
  `model` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aircraft`
--

INSERT INTO `aircraft` (`id`, `model`) VALUES
(1, 'Lockhead SR-72'),
(2, 'B-747'),
(3, 'Mig-25'),
(4, 'Henschel hs 129'),
(5, 'Boeing 747');

-- --------------------------------------------------------

--
-- Table structure for table `pilot`
--

CREATE TABLE `pilot` (
  `id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `age` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pilot`
--

INSERT INTO `pilot` (`id`, `first_name`, `last_name`, `age`) VALUES
(1, 'Ivan', 'Ivanic', 22),
(2, 'Luka', 'Maric', 25),
(3, 'Marin', 'Palinic', 27),
(4, 'Marko', 'Roglic', 25),
(5, 'Darko', 'Simunovic', 30);

-- --------------------------------------------------------

--
-- Table structure for table `pilot_aircraft`
--

CREATE TABLE `pilot_aircraft` (
  `pid` int(11) NOT NULL,
  `aid` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pilot_aircraft`
--

INSERT INTO `pilot_aircraft` (`pid`, `aid`, `id`) VALUES
(5, 2, 1),
(5, 5, 2),
(5, 3, 3),
(1, 3, 4),
(2, 4, 5),
(3, 5, 6),
(3, 3, 7),
(4, 1, 8),
(1, 1, 9),
(2, 2, 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aircraft`
--
ALTER TABLE `aircraft`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pilot`
--
ALTER TABLE `pilot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pilot_aircraft`
--
ALTER TABLE `pilot_aircraft`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `aid` (`aid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aircraft`
--
ALTER TABLE `aircraft`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pilot`
--
ALTER TABLE `pilot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pilot_aircraft`
--
ALTER TABLE `pilot_aircraft`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pilot_aircraft`
--
ALTER TABLE `pilot_aircraft`
  ADD CONSTRAINT `pilot_aircraft_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `pilot` (`id`),
  ADD CONSTRAINT `pilot_aircraft_ibfk_2` FOREIGN KEY (`aid`) REFERENCES `aircraft` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
