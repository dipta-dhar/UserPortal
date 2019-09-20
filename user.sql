-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 20, 2019 at 05:19 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `userportal`
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `version` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `is_active` bit(1) NOT NULL,
  `date_created` datetime NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `last_updated` datetime NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` varchar(255) NOT NULL,
  `birth_date` datetime NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `version`, `address`, `is_active`, `date_created`, `first_name`, `age`, `last_updated`, `password`, `user_type`, `birth_date`, `last_name`, `email`, `phone_number`) VALUES
(1, 0, 'Mohakhali DOHS', b'1', '2019-09-20 02:22:08', 'System', 30, '2019-09-20 02:22:08', '21232f297a57a5a743894a0e4a801fc3', 'ADMIN', '2019-09-02 06:24:06', 'Admin', 'admin@localhost.local', '01800000000'),
(2, 0, 'Komlapur', b'1', '2019-09-20 02:22:08', 'Dipta', 24, '2019-09-20 02:22:08', 'd93591bdf7860e1e4ee2fca799911215', 'USER', '1996-03-07 04:19:10', 'Dhar', 'dipta@gmail.com', '01700000000'),
(3, 0, 'Mirpur - 01', b'1', '2019-09-20 02:22:08', 'Sohel', 25, '2019-09-20 02:22:08', '81dc9bdb52d04dc20036dbd8313ed055', 'USER', '1996-03-07 04:19:10', 'Rana', 'sohel.rana@gmail.com', '01700000000'),
(4, 0, 'Mid Badda', b'1', '2019-09-20 02:22:08', 'Kazi', 25, '2019-09-20 02:22:08', '81dc9bdb52d04dc20036dbd8313ed055', 'USER', '1996-03-07 04:19:10', 'Imran', 'kazi.imran@gmail.com', '01700000000'),
(5, 0, 'Jatrabari', b'1', '2019-09-20 02:22:08', 'Rusho', 25, '2019-09-20 02:22:08', '81dc9bdb52d04dc20036dbd8313ed055', 'USER', '1996-03-07 04:19:10', 'Gazi', 'rusho@gmail.com', '01700000000'),
(6, 0, 'South Badda', b'1', '2019-09-20 02:22:08', 'Kobir', 26, '2019-09-20 02:22:08', '81dc9bdb52d04dc20036dbd8313ed055', 'USER', '1994-03-07 04:19:10', 'Sheikh', 'kobir@gmail.com', '01700000000'),
(7, 0, 'Savar', b'1', '2019-09-20 02:22:08', 'Boshir', 25, '2019-09-20 02:22:08', '81dc9bdb52d04dc20036dbd8313ed055', 'USER', '1996-03-07 04:19:10', 'Shrabon', 'boshir.shrabon@gmail.com', '01600000000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
