-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 17, 2017 at 10:31 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dictionaries`
--

-- --------------------------------------------------------

--
-- Table structure for table `arabic-english`
--

CREATE TABLE `arabic-english` (
  `id` int(11) NOT NULL,
  `word` varchar(100) NOT NULL,
  `meaning` text NOT NULL,
  `savedDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `arabic-english`
--

-- --------------------------------------------------------

--
-- Table structure for table `english-arabic`
--

CREATE TABLE `english-arabic` (
  `id` int(11) NOT NULL,
  `word` varchar(50) NOT NULL,
  `meaning` text NOT NULL,
  `savedDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `english-arabic`
--


-- --------------------------------------------------------

--
-- Table structure for table `english-english`
--

CREATE TABLE `english-english` (
  `id` tinyint(4) NOT NULL,
  `word` varchar(100) NOT NULL,
  `meaning` text NOT NULL,
  `savedDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `english-english`
--


-- --------------------------------------------------------

--
-- Table structure for table `english-italian`
--

CREATE TABLE `english-italian` (
  `id` int(11) NOT NULL,
  `word` varchar(100) NOT NULL,
  `meaning` text NOT NULL,
  `savedDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `english-italian`
--

-- --------------------------------------------------------

--
-- Table structure for table `italian-english`
--

CREATE TABLE `italian-english` (
  `id` int(11) NOT NULL,
  `word` varchar(100) NOT NULL,
  `meaning` text NOT NULL,
  `savedDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `italian-english`
--


--
-- Indexes for dumped tables
--

--
-- Indexes for table `arabic-english`
--
ALTER TABLE `arabic-english`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `english-arabic`
--
ALTER TABLE `english-arabic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `english-english`
--
ALTER TABLE `english-english`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `english-italian`
--
ALTER TABLE `english-italian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `italian-english`
--
ALTER TABLE `italian-english`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `arabic-english`
--
ALTER TABLE `arabic-english`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `english-arabic`
--
ALTER TABLE `english-arabic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `english-english`
--
ALTER TABLE `english-english`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `english-italian`
--
ALTER TABLE `english-italian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `italian-english`
--
ALTER TABLE `italian-english`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
