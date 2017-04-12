-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2016 at 02:19 PM
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
-- Table structure for table `madar`
--

CREATE TABLE IF NOT EXISTS `madar` (
`id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hotel_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reasons` text COLLATE utf8_unicode_ci,
  `code` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `origin_id` int(11) NOT NULL,
  `scope` text COLLATE utf8_unicode_ci,
  `EUR_EX` float DEFAULT NULL,
  `USD_EX` float DEFAULT NULL,
  `budget_EGP` double DEFAULT NULL,
  `budget_USD` double DEFAULT NULL,
  `budget_EUR` double DEFAULT NULL,
  `budget` double DEFAULT NULL,
  `cost_EGP` double DEFAULT NULL,
  `cost_USD` double DEFAULT NULL,
  `cost_EUR` double DEFAULT NULL,
  `cost` double DEFAULT NULL,
  `true_EGP` double DEFAULT NULL,
  `true_USD` double DEFAULT NULL,
  `true_EUR` double DEFAULT NULL,
  `true` double DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `year` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8_unicode_ci,
  `state_id` int(11) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `progress_id` int(11) NOT NULL DEFAULT '0',
  `progress` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `madar`
--

INSERT INTO `madar` (`id`, `timestamp`, `hotel_id`, `name`, `reasons`, `code`, `type`, `origin_id`, `scope`, `EUR_EX`, `USD_EX`, `budget_EGP`, `budget_USD`, `budget_EUR`, `budget`, `cost_EGP`, `cost_USD`, `cost_EUR`, `cost`, `true_EGP`, `true_USD`, `true_EUR`, `true`, `user_id`, `department_id`, `start`, `end`, `year`, `remarks`, `state_id`, `deleted`, `progress_id`, `progress`) VALUES
(1, '2016-06-21 20:25:31', 23, 'ddddddddd', 'ddddddddddddddd', NULL, 'Budgeted', 0, NULL, 18, 13, 18, 20, 15, 548, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 'ccccccccccccccccccccccccccc', 0, 0, 0, NULL),
(2, '2016-06-21 20:26:36', 7, 'ddddddddd', 'ddddddddddddddddddddd', NULL, 'Budgeted', 0, NULL, 18, 14, 23, 19, 21, 667, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 'ddddddddddddddddddddddd', 0, 0, 0, NULL),
(3, '2016-06-22 00:51:45', 7, 'fffffffffffffffff', 'fvvvvvvvvvvxxxxxxxxxxxxxxxxx', NULL, 'Unplanned', 0, NULL, 0, 10, 50, 50, 50, 550, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 'ccccccccccccccccccccccc', 0, 0, 0, NULL),
(4, '2016-06-22 08:38:12', 7, 'ccccccc', 'cccccccccccccc', NULL, 'Budgeted', 0, NULL, 6, 3, 12, 0, 0, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 'vvvvvvvvvvvvvvvvvvvvvv', 0, 0, 0, NULL),
(5, '2016-06-22 08:40:25', 13, 'vbvvvvvvvvvvvv', 'v\\vvvvvvvvvvvvvvvvvvvvvv', NULL, 'Budgeted', 0, NULL, 11, 8, 15, 0, 0, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 'ccccccccccccccccccccccccc', 0, 0, 0, NULL),
(6, '2016-06-22 10:56:17', 7, 'cccccccccc', 'cccccccccccccc', NULL, 'Budgeted', 0, NULL, 0, 9, 7, 12, 11, 115, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 'cccccccccccccccc', 0, 0, 0, NULL),
(7, '2016-06-22 10:58:11', 28, 'cccccccccccc', 'cccccccccccccccccc', NULL, 'Unplanned', 0, NULL, 8, 7, 10, 13, 0, 101, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 'cccccccccccccccccccccc', 0, 0, 0, NULL),
(8, '2016-06-22 10:59:04', 28, 'ccccccccccc', 'ccccccccccccc', NULL, 'Budgeted', 0, NULL, 8, 6, 5, 7, 10, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 'ccccccccccccccccccccccccc', 2, 0, 0, NULL),
(9, '2016-06-22 12:12:59', 28, 'ddddddddddd', 'vccccccccccccccccc', NULL, 'Budgeted', 0, NULL, 10, 6, 8, 7, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 'cccccccccccccc', 0, 0, 0, NULL),
(10, '2016-06-22 12:13:51', 28, 'cccccccc', 'ccccccccccccccc', NULL, 'Budgeted', 0, NULL, 7, 3, 8, 0, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 'cccccccccccc', 0, 0, 0, NULL),
(11, '2016-06-22 12:14:33', 28, 'cccccccc', 'cccccccccccccc', NULL, 'Budgeted', 0, NULL, 8, 6, 7, 0, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 'ccccccccccccc', 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `madar_approvals`
--

CREATE TABLE IF NOT EXISTS `madar_approvals` (
`id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `timestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `rank` int(5) NOT NULL,
  `project_id` int(11) NOT NULL,
  `reject` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `madar_approvals`
--

INSERT INTO `madar_approvals` (`id`, `user_id`, `role_id`, `timestamp`, `rank`, `project_id`, `reject`) VALUES
(1, NULL, 0, NULL, 0, 3, 0),
(2, NULL, 0, NULL, 0, 4, 0),
(3, NULL, 17, NULL, 1, 6, 0),
(4, NULL, 4, NULL, 2, 6, 0),
(5, NULL, 3, NULL, 3, 6, 0),
(6, NULL, 16, NULL, 4, 6, 0),
(7, NULL, 2, NULL, 5, 6, 0),
(8, 1, 3, '2016-06-22 12:05:07', 1, 8, 0),
(9, 1, 3, '2016-06-22 12:05:10', 2, 8, 0),
(10, 1, 4, '2016-06-22 12:05:23', 3, 8, 0),
(11, 1, 3, '2016-06-22 12:05:39', 4, 8, 0),
(12, NULL, 3, NULL, 1, 9, 0),
(13, NULL, 3, NULL, 2, 9, 0),
(14, NULL, 4, NULL, 3, 9, 0),
(15, NULL, 3, NULL, 4, 9, 0),
(16, NULL, 3, NULL, 1, 10, 0),
(17, NULL, 3, NULL, 2, 10, 0),
(18, NULL, 4, NULL, 3, 10, 0),
(19, NULL, 3, NULL, 4, 10, 0),
(20, NULL, 3, NULL, 1, 11, 0),
(21, NULL, 3, NULL, 2, 11, 0),
(22, NULL, 4, NULL, 3, 11, 0),
(23, NULL, 3, NULL, 4, 11, 0);

-- --------------------------------------------------------

--
-- Table structure for table `madar_comments`
--

CREATE TABLE IF NOT EXISTS `madar_comments` (
`id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `privilege` int(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `madar_comments`
--

INSERT INTO `madar_comments` (`id`, `project_id`, `user_id`, `comment`, `created`, `privilege`) VALUES
(1, 8, 1, 'ddddddddddddddd', '2016-06-22 11:08:27', 0),
(2, 8, 1, 'ddddddddddddddd', '2016-06-22 11:10:00', 0),
(3, 8, 1, 'ccccccccccccc', '2016-06-22 11:10:06', 0);

-- --------------------------------------------------------

--
-- Table structure for table `madar_files`
--

CREATE TABLE IF NOT EXISTS `madar_files` (
`id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `project_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `madar_files`
--

INSERT INTO `madar_files` (`id`, `name`, `project_id`) VALUES
(1, 'Android-Courses2.pdf', '4'),
(2, 'medical_proposal_damanhour.pdf', '5');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `madar`
--
ALTER TABLE `madar`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `madar_approvals`
--
ALTER TABLE `madar_approvals`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `madar_comments`
--
ALTER TABLE `madar_comments`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `madar_files`
--
ALTER TABLE `madar_files`
 ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `madar`
--
ALTER TABLE `madar`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `madar_approvals`
--
ALTER TABLE `madar_approvals`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `madar_comments`
--
ALTER TABLE `madar_comments`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `madar_files`
--
ALTER TABLE `madar_files`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `madar_owning_form`
--
ALTER TABLE `madar_owning_form`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `madar_owning_signatures`
--
ALTER TABLE `madar_owning_signatures`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
