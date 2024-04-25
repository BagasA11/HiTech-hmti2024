-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2024 at 01:53 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `level` varchar(10) NOT NULL,
  `score` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `email`, `level`, `score`) VALUES
(1, 'joko', '12345', 'joko@gmai.com', 'admin', '17'),
(3, 'budi', '12345', 'budi@gmail.com', 'admin', '10'),
(4, 'bejo', '12345', 'bejo@gmail.com', 'member', '0');

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `id` int(11) NOT NULL,
  `question` varchar(30) NOT NULL,
  `option_a` varchar(20) NOT NULL,
  `option_b` varchar(20) NOT NULL,
  `option_c` varchar(20) NOT NULL,
  `option_d` varchar(20) NOT NULL,
  `answear` varchar(20) NOT NULL,
  `correct_option` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`id`, `question`, `option_a`, `option_b`, `option_c`, `option_d`, `answear`, `correct_option`) VALUES
(1, 'gajah memiliki kaki berapa', 'satu', 'dua', 'tiga', 'empat', 'empat', 'd'),
(2, 'sapi memiliki kaki berapa', 'empat', 'tiga', 'dua ', 'satu', 'empat', 'a'),
(3, 'sapi punya telinga berapa', 'satu', 'dua', 'tiga', 'empat', 'dua', 'b'),
(4, 'kucing punya mata berapa', 'satu', 'dua', 'tiga', 'empat', 'dua', 'b'),
(5, 'manusia punya kaki berapa', 'satu', 'dua', 'tiga', 'empat', 'dua', 'b'),
(6, 'ikan punya mata berapa', 'satu', 'dua', 'tiga', 'empat', 'dua', 'b'),
(7, 'burung punya mata berapa', 'satu', 'dua', 'tiga', 'empat', 'dua', 'b');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
