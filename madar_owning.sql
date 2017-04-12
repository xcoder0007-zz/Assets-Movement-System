-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 23, 2016 at 02:17 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `esign_reservation`
--

-- --------------------------------------------------------

--
-- Table structure for table `madar_owning_form`
--

CREATE TABLE IF NOT EXISTS `madar_owning_form` (
`id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `num_of_offers` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_cost` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sup_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sup_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sup_3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sup_4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sup_5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sup_6` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `consultant` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recommendation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `balance` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purchasing_notes` text COLLATE utf8_unicode_ci,
  `financial_notes` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `madar_owning_form`
--

INSERT INTO `madar_owning_form` (`id`, `project_id`, `date`, `place`, `num_of_offers`, `total_cost`, `sup_1`, `sup_2`, `sup_3`, `sup_4`, `sup_5`, `sup_6`, `consultant`, `recommendation`, `balance`, `purchasing_notes`, `financial_notes`) VALUES
(1, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 18, NULL, 'fffffffffff', 'fffffffffffffffff', '5555555555', 'fffffffff', 'ffffffffff', 'ffffffffff', 'fffffffffff', 'ffffffffff', 'fffffffffff', 'dddddddddd', 'ddddddddddd', 'dddddddd', 'dddddddddddd', 'ddddddddddddddd'),
(5, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 21, NULL, '', '', '500000000', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `madar_owning_signatures`
--

CREATE TABLE IF NOT EXISTS `madar_owning_signatures` (
`id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rank` int(5) NOT NULL,
  `project_id` int(11) NOT NULL,
  `reject` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `madar_owning_signatures`
--

INSERT INTO `madar_owning_signatures` (`id`, `user_id`, `role_id`, `timestamp`, `rank`, `project_id`, `reject`) VALUES
(1, NULL, 2, '2016-06-23 09:41:05', 1, 21, 0),
(2, NULL, 3, '2016-06-23 09:41:05', 2, 21, 0),
(3, NULL, 4, '2016-06-23 09:41:05', 3, 21, 0),
(4, NULL, 4, '2016-06-23 09:41:05', 4, 21, 0),
(5, NULL, 14, '2016-06-23 09:41:05', 5, 21, 0),
(6, NULL, 13, '2016-06-23 09:41:05', 6, 21, 0),
(7, NULL, 9, '2016-06-23 09:41:05', 7, 21, 0),
(8, NULL, 11, '2016-06-23 09:41:05', 8, 21, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `madar_owning_form`
--
ALTER TABLE `madar_owning_form`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `madar_owning_signatures`
--
ALTER TABLE `madar_owning_signatures`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `madar_owning_form`
--
ALTER TABLE `madar_owning_form`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `madar_owning_signatures`
--
ALTER TABLE `madar_owning_signatures`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
