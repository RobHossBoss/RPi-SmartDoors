-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 29, 2015 at 09:43 AM
-- Server version: 5.5.40-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `DoorAccess`
--

-- --------------------------------------------------------

--
-- Table structure for table `Management`
--

CREATE TABLE IF NOT EXISTS `Management` (
  `username` varchar(255) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Management`
--

INSERT INTO `Management` (`username`, `level`) VALUES
('farmerau', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Rooms`
--

CREATE TABLE IF NOT EXISTS `Rooms` (
  `ID` int(255) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`),
  KEY `ID_2` (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Rooms`
--

INSERT INTO `Rooms` (`ID`, `Name`) VALUES
(1, 'Danforth 104\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `Scanners`
--

CREATE TABLE IF NOT EXISTS `Scanners` (
  `ID` varchar(255) NOT NULL,
  `Room` int(255) NOT NULL,
  `Mode` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Room` (`Room`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Scanners`
--

INSERT INTO `Scanners` (`ID`, `Room`, `Mode`) VALUES
('202481602051178', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE IF NOT EXISTS `Users` (
  `ID` varchar(255) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`ID`, `Name`) VALUES
(';006878550100000031715?', NULL),
(';006878550100000031715?', NULL),
(';006878550100000031715?', NULL),
(';006878550100000031715?', NULL),
(';006878550100000031715?', NULL),
(';006878550100000031715?', NULL),
(';006878550100000031715?', NULL),
(';006878550100000031715?', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `UsersInRoom`
--

CREATE TABLE IF NOT EXISTS `UsersInRoom` (
  `URID` int(255) NOT NULL AUTO_INCREMENT,
  `User` varchar(255) NOT NULL,
  `Room` int(255) NOT NULL,
  PRIMARY KEY (`URID`),
  KEY `User` (`User`),
  KEY `Room` (`Room`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `UsersInRoom`
--

INSERT INTO `UsersInRoom` (`URID`, `User`, `Room`) VALUES
(11, ';006878550100000031715?', 1),
(12, ';006878550100000031715?', 1),
(13, ';006878550100000031715?', 1),
(14, ';006878550100000031715?', 1),
(15, ';006878550100000031715?', 1),
(16, ';006878550100000031715?', 1),
(17, ';006878550100000031715?', 1),
(18, ';006878550100000031715?', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Scanners`
--
ALTER TABLE `Scanners`
  ADD CONSTRAINT `Scanners_ibfk_1` FOREIGN KEY (`Room`) REFERENCES `Rooms` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `UsersInRoom`
--
ALTER TABLE `UsersInRoom`
  ADD CONSTRAINT `UsersInRoom_ibfk_1` FOREIGN KEY (`User`) REFERENCES `Users` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `UsersInRoom_ibfk_2` FOREIGN KEY (`Room`) REFERENCES `Rooms` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
