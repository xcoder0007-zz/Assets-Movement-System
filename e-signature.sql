-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 01, 2016 at 02:40 PM
-- Server version: 5.5.47-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `e-signature`
--

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `ip_address` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `user_agent` varchar(150) COLLATE utf8_bin NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('b47cac67bbedf04bcdec7868a4c417e9', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.82 Safari/537.36', 1454320656, 'a:7:{s:9:"user_data";s:0:"";s:7:"user_id";s:1:"1";s:8:"username";s:5:"admin";s:6:"status";s:1:"1";s:8:"is_admin";s:1:"1";s:9:"user_type";s:2:"19";s:4:"role";s:2:"23";}'),
('f1804e53c88c686fdb7dc504eac37bf1', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.82 Safari/537.36', 1454329815, 'a:7:{s:9:"user_data";s:0:"";s:7:"user_id";s:1:"1";s:8:"username";s:5:"admin";s:6:"status";s:1:"1";s:8:"is_admin";s:1:"1";s:9:"user_type";s:2:"19";s:4:"role";s:2:"23";}');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `form_id`, `user_id`, `comment`, `created`) VALUES
(1, 20, 95, 'OK', '2014-12-18 11:36:52'),
(2, 32, 102, 'ok', '2014-12-28 09:16:01'),
(3, 58, 119, '??? ?????? ??? ???? ???????  ???? ?????', '2015-02-09 14:52:23'),
(4, 58, 119, '??? ?????? ??? ???? ??????? ???? ??? ?????', '2015-02-09 15:01:12'),
(5, 63, 119, 'These assets on a loan and not a transfer of ownership', '2015-02-09 15:13:09'),
(6, 58, 119, 'These assets on a loan and not a transfer of ownership', '2015-02-09 15:15:04'),
(7, 72, 99, '??????? ???? ????? ???????? ? ????? ????? ?????? ?????? ?????? ????????', '2015-03-16 08:44:00'),
(8, 79, 119, '??? ?????? ??? ???? ??????? ????? ??? ?????', '2015-03-16 09:47:35'),
(9, 79, 119, 'These assets on a loan and not a transfer of ownership', '2015-03-16 09:50:01'),
(10, 79, 119, 'These assets on a loan and not a transfer of ownership', '2015-03-16 09:50:02'),
(11, 79, 119, 'These assets on a loan and not a transfer of ownership', '2015-03-16 09:50:04'),
(12, 82, 119, 'cod no :40411000014', '2015-05-04 08:07:28'),
(13, 91, 119, 'These assets on a loan and not a transfer of ownership - are given in case of request', '2015-06-24 11:17:35');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE IF NOT EXISTS `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `deleted` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `deleted`) VALUES
(1, 'كريستال للاستثمار السياحي', 0),
(2, 'Oasis Group', 0),
(4, 'رويال مكادي للاستثمار', 0),
(5, 'بلوسكاي للاستثمارلت', 0),
(6, 'صن رايز لاداره الفنادق العائمه', 0),
(7, 'غناظه للفنادق والقري السياحيه', 0),
(8, 'دايموند شارم السياحيه', 0),
(9, 'شارمينج', 0),
(10, 'شركه الربيع للاستثمارات الفندقيه', 0),
(11, 'SUNRISE for floating hotels management', 0),
(12, 'Villa Mr Hossam Cairo', 0),
(13, 'EL Forsan Housing', 0);

-- --------------------------------------------------------

--
-- Table structure for table `company_signatures`
--

CREATE TABLE IF NOT EXISTS `company_signatures` (
  `company_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `rank` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `company_signatures`
--

INSERT INTO `company_signatures` (`company_id`, `role_id`, `rank`) VALUES
(1, 11, 6),
(1, 13, 5),
(1, 15, 4),
(1, 12, 3),
(1, 10, 2),
(1, 22, 1),
(1, 23, 7),
(1, 14, 8),
(2, 11, 6),
(2, 13, 5),
(2, 15, 4),
(2, 12, 3),
(2, 10, 2),
(2, 22, 1),
(2, 23, 7),
(2, 14, 8),
(3, 11, 6),
(3, 13, 5),
(3, 15, 4),
(3, 12, 3),
(3, 10, 2),
(3, 22, 1),
(3, 23, 7),
(3, 14, 8),
(4, 11, 6),
(4, 13, 5),
(4, 15, 4),
(4, 12, 3),
(4, 10, 2),
(4, 22, 1),
(4, 23, 7),
(4, 14, 8),
(5, 26, 3),
(5, 25, 2),
(5, 24, 1),
(6, 11, 6),
(6, 13, 5),
(6, 15, 4),
(6, 12, 3),
(6, 10, 2),
(6, 22, 1),
(6, 23, 7),
(6, 14, 8),
(7, 11, 6),
(7, 13, 5),
(7, 15, 4),
(7, 12, 3),
(7, 10, 2),
(7, 22, 1),
(7, 23, 7),
(7, 14, 8),
(8, 11, 6),
(8, 13, 5),
(8, 15, 4),
(8, 12, 3),
(8, 10, 2),
(8, 22, 1),
(8, 23, 7),
(8, 14, 8),
(9, 11, 6),
(9, 13, 5),
(9, 15, 4),
(9, 12, 3),
(9, 10, 2),
(9, 22, 1),
(9, 23, 7),
(9, 14, 8),
(10, 11, 6),
(10, 13, 5),
(10, 15, 4),
(10, 12, 3),
(10, 10, 2),
(10, 22, 1),
(10, 23, 7),
(10, 14, 8),
(11, 11, 6),
(11, 13, 5),
(11, 15, 4),
(11, 12, 3),
(11, 10, 2),
(11, 22, 1),
(11, 23, 7),
(11, 14, 8),
(12, 11, 6),
(12, 13, 5),
(12, 15, 4),
(12, 12, 3),
(12, 10, 2),
(12, 22, 1),
(12, 23, 7),
(12, 14, 8),
(13, 11, 6),
(13, 13, 5),
(13, 15, 4),
(13, 12, 3),
(13, 10, 2),
(13, 22, 1),
(13, 23, 7),
(13, 14, 8);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE IF NOT EXISTS `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `devision_id` int(11) DEFAULT NULL,
  `code` varchar(5) NOT NULL DEFAULT 'DEP',
  `dummy` tinyint(1) NOT NULL DEFAULT '0',
  `rank` int(5) NOT NULL DEFAULT '99',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `devision_id`, `code`, `dummy`, `rank`) VALUES
(2, 'IT', 4, 'IT', 0, 3),
(3, 'Accounting', 4, 'ACC', 0, 2),
(4, 'Engineering ', 5, 'ENG', 0, 1),
(5, 'Laundry', 1, 'LND', 0, 99),
(6, 'Kitchen', 2, 'KIT', 0, 2),
(7, 'Food & Beverage', 2, 'FB', 0, 1),
(8, 'A&G', 4, 'AG', 0, 1),
(9, 'Cluster Account', NULL, 'DEP', 1, 99),
(10, 'Reservation Centre', 6, 'DEP', 0, 3),
(11, 'Regional Office', NULL, 'DEP', 1, 0),
(12, 'House Keeping ', 1, 'HK', 0, 2),
(13, 'Recreation ', 1, 'REC', 0, 3),
(14, 'Security', 4, 'SEC', 0, 4),
(15, 'Human Resource', 3, 'HR', 0, 1),
(16, 'Gardens', 5, 'GRD', 0, 2),
(18, 'Front Office', 1, 'FO', 0, 1),
(19, 'Owning Company', NULL, 'DEP', 1, 99),
(22, 'Housing', 3, 'HO', 0, 99),
(23, 'Staff Cafateria', 3, 'STA', 0, 2),
(24, 'Steward', 2, 'STE', 0, 3),
(25, 'Sales ', 6, 'SAL', 0, 1),
(26, 'Marketing', 6, 'MAK', 0, 2),
(27, 'Major Projects', 7, 'Maj', 0, 0),
(28, 'Purchasing', NULL, 'PUR', 1, 99);

-- --------------------------------------------------------

--
-- Table structure for table `devisions`
--

CREATE TABLE IF NOT EXISTS `devisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rank` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `devisions`
--

INSERT INTO `devisions` (`id`, `name`, `rank`) VALUES
(1, 'Rooms', 1),
(2, 'Food & Beverage', 2),
(3, 'Human Resources', 4),
(4, 'A & G ', 3),
(5, 'Engneering', 6),
(6, 'Sales & Marketing', 5),
(7, 'Major Projects', 7);

-- --------------------------------------------------------

--
-- Table structure for table `employees_hotels`
--

CREATE TABLE IF NOT EXISTS `employees_hotels` (
  `employee_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees_hotels`
--

INSERT INTO `employees_hotels` (`employee_id`, `hotel_id`) VALUES
(6, 1),
(9, 1),
(9, 2),
(4, 2),
(3, 13),
(3, 11),
(3, 12),
(3, 10),
(3, 2),
(3, 9),
(3, 1),
(3, 7),
(3, 3),
(3, 8),
(3, 5),
(3, 6),
(3, 4),
(4, 13),
(4, 11),
(4, 12),
(4, 10),
(4, 1),
(4, 3),
(4, 5),
(2, 13),
(2, 11),
(2, 12),
(2, 10),
(2, 2),
(2, 9),
(2, 1),
(2, 7),
(2, 3),
(2, 8),
(2, 5),
(2, 6),
(2, 4),
(17, 1),
(18, 2),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 2),
(23, 1),
(23, 3),
(6, 2),
(9, 3),
(24, 2),
(25, 3),
(26, 13),
(26, 11),
(26, 12),
(26, 10),
(26, 2),
(26, 1),
(26, 3),
(26, 5),
(27, 3),
(28, 3),
(29, 3),
(31, 4),
(32, 4),
(33, 4),
(34, 4),
(35, 4),
(36, 4),
(37, 4),
(39, 4),
(40, 5),
(41, 5),
(42, 5),
(43, 5),
(44, 4),
(45, 4),
(46, 4),
(47, 4),
(49, 7),
(53, 7),
(59, 7),
(59, 8),
(59, 6),
(53, 8),
(53, 6),
(60, 6),
(61, 6),
(63, 6),
(64, 6),
(65, 6),
(66, 6),
(67, 6),
(68, 11),
(68, 12),
(69, 11),
(69, 12),
(70, 13),
(70, 11),
(70, 12),
(70, 10),
(71, 11),
(71, 12),
(72, 11),
(72, 12),
(73, 13),
(73, 11),
(73, 12),
(73, 10),
(74, 13),
(74, 11),
(74, 12),
(74, 10),
(75, 11),
(75, 12),
(76, 11),
(76, 12),
(77, 10),
(78, 10),
(81, 10),
(82, 4),
(85, 8),
(5, 5),
(86, 2),
(86, 1),
(90, 10),
(91, 10),
(92, 3),
(93, 8),
(94, 10),
(95, 13),
(95, 11),
(95, 12),
(95, 10),
(95, 2),
(95, 9),
(95, 16),
(95, 1),
(95, 7),
(95, 3),
(95, 8),
(95, 5),
(95, 6),
(95, 4),
(96, 3),
(97, 1),
(1, 13),
(1, 11),
(1, 12),
(1, 10),
(1, 9),
(1, 16),
(1, 1),
(1, 7),
(1, 3),
(1, 8),
(1, 5),
(1, 6),
(1, 4),
(1, 14),
(1, 15),
(99, 13),
(99, 11),
(99, 12),
(99, 10),
(99, 2),
(99, 9),
(99, 16),
(99, 1),
(99, 7),
(99, 3),
(99, 8),
(99, 5),
(99, 6),
(99, 4),
(100, 13),
(100, 11),
(100, 12),
(100, 10),
(100, 2),
(100, 9),
(100, 16),
(100, 1),
(100, 7),
(100, 3),
(100, 8),
(100, 5),
(100, 6),
(100, 4),
(101, 13),
(101, 11),
(101, 12),
(101, 10),
(101, 2),
(101, 9),
(101, 16),
(101, 1),
(101, 7),
(101, 3),
(101, 8),
(101, 5),
(101, 6),
(101, 4),
(102, 13),
(102, 11),
(102, 12),
(102, 10),
(102, 2),
(102, 9),
(102, 16),
(102, 1),
(102, 7),
(102, 3),
(102, 8),
(102, 5),
(102, 6),
(102, 4),
(103, 10),
(104, 8),
(104, 16),
(84, 16),
(49, 16),
(59, 16),
(106, 6),
(102, 17),
(108, 2),
(109, 3),
(110, 7),
(111, 7),
(113, 8),
(114, 17),
(115, 17),
(25, 19),
(86, 19),
(116, 19),
(117, 7),
(9, 9),
(118, 9),
(4, 4),
(119, 13),
(119, 19),
(119, 11),
(119, 12),
(119, 10),
(119, 2),
(119, 9),
(119, 16),
(119, 17),
(119, 1),
(119, 7),
(119, 3),
(119, 8),
(119, 5),
(119, 6),
(119, 4),
(119, 18),
(121, 7),
(122, 7),
(30, 16),
(30, 7),
(123, 3),
(124, 3),
(126, 8),
(127, 7),
(128, 11),
(128, 12),
(129, 4),
(130, 17),
(132, 8),
(133, 8),
(134, 8),
(131, 8),
(135, 8),
(136, 8),
(50, 8),
(137, 6),
(138, 10),
(30, 8),
(30, 6),
(139, 7),
(139, 8),
(139, 6),
(139, 16),
(55, 13),
(55, 19),
(55, 11),
(55, 12),
(55, 10),
(55, 2),
(55, 9),
(55, 17),
(55, 1),
(55, 7),
(55, 3),
(55, 8),
(55, 5),
(55, 6),
(55, 4),
(55, 16),
(55, 14),
(55, 15),
(55, 18),
(83, 14),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 17),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(140, 8),
(83, 18),
(83, 13),
(83, 19),
(83, 11),
(83, 12),
(83, 10),
(83, 2),
(83, 20),
(83, 21),
(83, 22),
(83, 9),
(83, 7),
(83, 3),
(83, 6),
(83, 17),
(83, 1),
(83, 5),
(83, 8),
(83, 23),
(83, 24),
(83, 25),
(83, 26),
(83, 4),
(83, 27),
(83, 16),
(83, 15),
(141, 7),
(143, 7),
(80, 7),
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE IF NOT EXISTS `forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `from_hotel_id` int(11) NOT NULL,
  `to_hotel_id` int(11) NOT NULL,
  `issue_date` date NOT NULL,
  `delivery_date` date DEFAULT NULL,
  `department_id` int(11) NOT NULL,
  `location` text COLLATE utf8_unicode_ci NOT NULL,
  `movement_reason` text COLLATE utf8_unicode_ci NOT NULL,
  `destination` text COLLATE utf8_unicode_ci NOT NULL,
  `rcv_user_date` datetime DEFAULT NULL,
  `rcv_user_id` int(11) DEFAULT NULL,
  `rcv_hotel_acc_id` int(11) DEFAULT NULL,
  `rcv_dpt_head_id` int(11) DEFAULT NULL,
  `rcv_chrmn_cai_id` int(11) DEFAULT NULL,
  `src_dpt_head_id` int(11) DEFAULT NULL,
  `src_hotel_gm_id` int(11) DEFAULT NULL,
  `src_hotel_fc_id` int(11) DEFAULT NULL,
  `dstn_dpt_head_id` int(11) DEFAULT NULL,
  `dstn_hotel_gm_id` int(11) DEFAULT NULL,
  `dstn_hotel_fc_id` int(11) DEFAULT NULL,
  `fin_cluster_fc_id` int(11) DEFAULT NULL,
  `fin_rdof_id` int(11) DEFAULT NULL,
  `fin_chrmn_cai_id` int(11) DEFAULT NULL,
  `pur_sec_mgr_id` int(11) DEFAULT NULL,
  `tech_mgr_id` int(11) DEFAULT NULL,
  `pur_dpt_mgr_id` int(11) DEFAULT NULL,
  `acc_mgr_id` int(11) DEFAULT NULL,
  `inv_dpt_mgr_id` int(11) DEFAULT NULL,
  `con_acc_mgr_id` int(11) DEFAULT NULL,
  `state_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=140 ;

--
-- Dumping data for table `forms`
--

INSERT INTO `forms` (`id`, `user_id`, `from_hotel_id`, `to_hotel_id`, `issue_date`, `delivery_date`, `department_id`, `location`, `movement_reason`, `destination`, `rcv_user_date`, `rcv_user_id`, `rcv_hotel_acc_id`, `rcv_dpt_head_id`, `rcv_chrmn_cai_id`, `src_dpt_head_id`, `src_hotel_gm_id`, `src_hotel_fc_id`, `dstn_dpt_head_id`, `dstn_hotel_gm_id`, `dstn_hotel_fc_id`, `fin_cluster_fc_id`, `fin_rdof_id`, `fin_chrmn_cai_id`, `pur_sec_mgr_id`, `tech_mgr_id`, `pur_dpt_mgr_id`, `acc_mgr_id`, `inv_dpt_mgr_id`, `con_acc_mgr_id`, `state_id`) VALUES
(14, 9, 8, 3, '2014-11-11', '2014-12-01', 2, 'IT', 'For Zero Client Project', 'Data Center Room', NULL, NULL, NULL, NULL, NULL, 83, 93, 85, 9, 25, 92, 4, 3, 2, 95, 99, 100, 101, 102, 0, 5),
(20, 91, 3, 10, '2014-11-14', '2014-11-20', 6, 'Sunrise Grand Select Crystal BY', 'It is needed as in shedwan proffer cabinet is out of order and can not be repaired.', 'FESTIVAL SHEDWAN ( KITCHEN )', NULL, NULL, NULL, NULL, NULL, NULL, 25, 92, 91, 77, 103, 4, 3, 2, 95, 99, 100, 101, 102, 0, 3),
(22, 94, 3, 10, '2014-11-22', '2014-11-29', 12, 'Sunrise Grand Select Crystal Bay Resort', 'For Renewal', 'Lobby Shedwan', '2014-12-30 09:31:38', 94, NULL, NULL, NULL, 96, 25, 92, 94, 77, 103, 4, 3, 2, 95, 99, 100, 101, 102, 0, 7),
(23, 20, 3, 16, '2014-11-24', '2014-11-24', 13, 'Sun Rise El Rabae', 'to cover the shortage in the sun Beds by Sun Rise crystal bay', 'Sun Rise Grand Select Crystal Bay', NULL, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL, 30, 49, 59, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2),
(24, 6, 7, 1, '2014-12-06', '2014-12-06', 4, '<p>\n	Arabian Beach Rooms</p>\n', '<p>\n	New TVs Needed</p>\n', '<p>\n	Garden Beach Rooms</p>\n', NULL, NULL, NULL, NULL, NULL, NULL, 30, 49, 97, 6, 86, 59, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3),
(26, 24, 3, 2, '2014-12-06', '2014-12-10', 4, 'CB', 'TVs Needed', 'MP', NULL, NULL, NULL, NULL, NULL, 123, 25, 92, 24, 6, 86, 4, 3, 2, 95, NULL, 100, 101, 102, 0, 5),
(27, 24, 3, 2, '2014-12-06', '2014-12-10', 4, 'CB', 'Needed TV for rooms', 'MP', NULL, NULL, NULL, NULL, NULL, 123, 25, 92, 24, 6, 86, 4, 3, 2, 95, NULL, 100, 101, 102, 0, 5),
(28, 24, 7, 2, '2014-12-06', '2014-12-10', 4, 'Arabian Beach Rooms', 'TV s Needed for rooms', 'MP', NULL, NULL, NULL, NULL, NULL, NULL, 30, 49, 24, 6, 86, 59, 3, NULL, 95, NULL, 100, NULL, 102, 0, 3),
(29, 24, 7, 2, '2014-12-06', '2014-12-10', 4, 'Arabian Beach Rooms', 'TV needed for our rooms', 'MP', NULL, NULL, NULL, NULL, NULL, NULL, 30, 49, 24, 6, 86, 59, 3, NULL, 95, NULL, 100, NULL, 102, 0, 3),
(31, 94, 1, 10, '2014-12-14', '2014-12-21', 12, 'SUNRISE Select Garden Beach Resort & Spa', 'Transfer to Festival Shedwan', 'Festival Shedwan Golden Beach Resort', '2014-12-30 09:30:53', 94, NULL, NULL, NULL, 18, 6, 86, 94, 77, 103, 4, 3, 2, 95, 99, 100, 101, 102, 0, 7),
(32, 104, 1, 16, '2014-12-16', '2014-12-25', 12, 'Garden Beach Hurgada', 'El Rabei hotel requirements', 'El Rabei hotel, sharm el sheikh', NULL, NULL, NULL, NULL, NULL, 18, 6, 86, 104, 84, 49, 4, 3, 2, 95, 99, 100, 101, 102, 0, 5),
(35, 83, 9, 8, '2014-12-25', '2015-01-01', 2, 'Hurgada', 'No color printer in Montemare, no printer in HR department', 'Montemare Resort, Sharm el Sheikh', NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, 83, 93, 85, 59, 3, 2, 95, 99, 100, 101, 102, 0, 3),
(38, 91, 16, 10, '2014-12-26', '2014-12-31', 6, 'SUNRISE EL RABAE ( KITCHEN )', 'The new equipments requested for the newly renovated kitchen of Festival Shedwan.', 'FESTIVAL SHEDWAN ( KITCHEN )', NULL, NULL, NULL, NULL, NULL, NULL, 84, 49, 91, 77, 103, 4, 3, NULL, 95, 99, 100, 101, 102, 0, 3),
(39, 84, 3, 16, '2014-12-29', '2015-01-07', 4, 'Crystal Bay hotel', 'needed', 'Rabie Hotel, Sharm el Sheikh', NULL, NULL, NULL, NULL, NULL, 109, 25, 92, NULL, 84, 49, 59, 3, 2, 95, NULL, 100, 101, NULL, 0, 2),
(40, 84, 8, 16, '2014-12-29', '2015-01-07', 16, 'Montemare Resort', 'needed', 'Rabie Hotel, Sharm el Sheikh', NULL, NULL, NULL, NULL, NULL, NULL, 93, 85, NULL, 84, 49, 59, 3, 2, 95, 99, 100, 101, 102, 0, 2),
(41, 94, 10, 11, '2014-12-29', '2014-12-29', 12, 'beach of shedwan', 'For Renewal', 'beach of le jardin', NULL, NULL, NULL, NULL, NULL, 94, 77, 103, NULL, 68, 75, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(42, 106, 17, 6, '2015-01-02', '2015-01-17', 7, 'Sunrise Floating Hotel', 'to be install in Diamond Resort', 'Lobby Bar and Pool or Beach Bars', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 106, 60, 63, 59, 3, 2, 95, 99, 100, 101, 102, 0, 3),
(43, 107, 17, 8, '2015-01-02', '2015-01-09', 7, 'floating', 'needed', 'Montwmare, Sharm el Sheikh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 107, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2),
(44, 94, 17, 10, '2015-01-03', '2015-01-13', 7, 'Sunrise for floating hotels management', 'For opertion', 'Lobby SmartLine', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80, 77, 103, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3),
(45, 80, 17, 10, '2015-01-03', '2015-01-13', 7, 'Sunrise for floating hotels management', 'For opertion', 'Festival Shedwan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80, 77, 103, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3),
(46, 17, 3, 1, '2015-01-04', '2015-01-07', 7, 'Sunrise Crystal bay', 'To cover all F&B outlets for juice cooling', 'Sunrise Garden Beach', NULL, NULL, NULL, NULL, NULL, NULL, 25, NULL, 17, 6, 86, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3),
(47, 17, 3, 2, '2015-01-04', '2015-01-07', 7, 'Sunrise Crystal bay', 'To cover all F&B outlets for juice cooling', 'SENTIDO Mamlouk Palace Resort', NULL, NULL, NULL, NULL, NULL, NULL, 25, 92, 108, 6, 86, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3),
(49, 34, 17, 4, '2015-01-04', '2015-01-08', 6, '<p>\n	Sharm EL Shiekh</p>\n', '<p>\n	needed for Royal Makadi as the exist 2 PCS are discard since 2 months ago</p>\n', '<p>\n	Royal Makadi</p>\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, 30, 32, 59, 3, NULL, 95, 99, 100, NULL, NULL, 0, 3),
(50, 93, 10, 8, '2015-01-05', '2015-01-10', 15, '<p>\n	Festival Shedwan</p>\n', '<p>\n	Old guest mattresses to be used for Montemare staff housing</p>\n', '<p>\n	Grand Select Montemare - Staff Housing</p>\n', NULL, NULL, NULL, NULL, NULL, 94, 77, 103, 113, 93, 85, 59, 3, 2, 95, 99, 100, 101, 102, 0, 7),
(51, 41, 3, 5, '2015-01-08', '2015-01-10', 7, 'House Keeping CrystalBay', 'To use it in swimming pool & lobby bar', 'F&B Holidays', NULL, NULL, NULL, NULL, NULL, NULL, 25, NULL, 41, 40, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3),
(52, 41, 3, 5, '2015-01-08', '2015-01-10', 7, 'House Keeping CrystalBay', 'To use it in swimming pool & lobby bar', 'F&B Holidays', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(54, 112, 3, 7, '2015-01-10', '2015-01-12', 7, 'Sunrise grand select crystal bay', 'Operational needs as per MR. Philippe.', 'Sunrise grand select Arabian beach', NULL, NULL, NULL, NULL, NULL, NULL, 25, NULL, 112, 111, 49, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3),
(58, 117, 16, 7, '2015-01-12', '2015-01-14', 6, 'Sunrise Elrabea', 'Urgently needed for the operation in Sunrise Arabian Beach as been requested in Project Number 136', 'Sunrise Arabian Beach', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 49, 117, 111, 49, 59, 3, NULL, 95, NULL, 100, 101, 102, 0, 3),
(60, 72, 3, 11, '2015-01-12', '2015-01-13', 7, 'Sunrise grand select crystal bay', 'to using in F&B outlets', 'Festival Le Jardin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 72, 68, 75, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3),
(61, 72, 3, 12, '2015-01-12', '2015-01-13', 7, 'Sunrise grand select crystal bay', 'to using in F&B outlets', 'Festival Riviera', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 72, 68, 75, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3),
(62, 32, 17, 4, '2015-01-13', '2015-01-17', 7, 'Sunrise Crystal Bay', 'Need to Royal Makadi', 'Sunrise Royal Makadi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, 30, 32, 59, 3, 2, 95, 99, 100, 101, 102, 0, 3),
(63, 117, 16, 7, '2015-01-13', '2015-01-17', 6, 'Sunrise Elrabea', 'As per approved project number 136, needed at the butchery department in the Sunrise Arabia Beach', 'Sunrise Arabian beach', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 49, 117, 111, 49, 59, 3, NULL, 95, NULL, 100, 101, 102, 0, 3),
(64, 23, 10, 19, '2015-01-16', '2015-01-16', 15, '<p>\n	shedwan</p>\n', '<p>\n	مراتب للاستخدام لسكن الفرسان</p>\n', '<p>\n	elforsan Housing</p>\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(65, 23, 10, 19, '2015-01-17', '2015-01-17', 15, 'shedwan', 'مرتبة واحد متر للاستخدام للموظفين', 'Elforsan Housing.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(66, 18, 7, 1, '2015-01-17', '2015-01-31', 12, 'SUNRISE Grand Select Arabian Beach', 'For Cleaning', 'SUNRISE Garden Beach', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 49, 18, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2),
(67, 109, 7, 3, '2015-01-18', '2015-01-31', 4, 'Arabian', 'Not used there and we need it here', 'Crystal Bay', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(68, 109, 7, 3, '2015-01-18', '2015-01-31', 4, 'Arabian', 'Not used there and we need it here', 'Crystal Bay', NULL, NULL, NULL, NULL, NULL, NULL, 111, 49, 109, 25, 92, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3),
(69, 18, 7, 1, '2015-01-24', '2015-01-24', 12, 'Sunrise Grand Select Arabian Beach Resort', 'As per Charmian', 'Sunrise Garden Beach Resort', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 49, 18, 6, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2),
(70, 91, 4, 10, '2015-01-29', '2015-01-29', 6, 'SUNRISE Select Royal Makadi', 'To be used in Shedwan kitchen and the tilting pan in the staff cafeteria', 'Festival Shedwan Golden Beach Resort, and the staff caferteria', NULL, NULL, NULL, NULL, NULL, NULL, 30, 32, 91, 77, 103, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3),
(71, 73, 4, 11, '2015-01-30', '2015-02-01', 6, 'فندق رويال مكادي', 'للاستخدام بفنادق فيستيفال الاحياء', 'فنادق صن ريز فيستيفال الاحياء', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 68, 75, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(72, 64, 7, 6, '2015-02-08', '2015-02-14', 4, 'Sunrise Arabian Beach', 'For Sunconnect System', 'install in Sunrise Diamond Beach Rooms', NULL, NULL, NULL, NULL, NULL, 122, 111, 49, 64, 60, 63, 59, 3, NULL, 95, 99, 100, 101, 102, 0, 3),
(73, 64, 7, 6, '2015-02-08', '2015-02-14', 4, 'Sunrise Arabian Beach', 'for SUNCONNECT system', 'install in Sunrise Diamond Beach Rooms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 49, 64, 60, 63, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3),
(74, 64, 8, 6, '2015-02-08', '2015-02-14', 4, 'Sunrise Grand Select Montemare', 'to be install in rooms of sunrise Diamond Beach', 'Sunrise Diamond Beach', NULL, NULL, NULL, NULL, NULL, NULL, 93, NULL, 64, 60, 63, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(75, 64, 8, 6, '2015-02-08', '2015-02-14', 4, 'Sunrise Grand Select Montemare', 'to be install in Diamond Rooms', 'Sunrise Diamond Beach', NULL, NULL, NULL, NULL, NULL, 131, 93, 85, 64, 60, 63, 59, 3, NULL, 95, NULL, 100, NULL, 102, NULL, 3),
(76, 50, 8, 7, '2015-02-16', '2015-02-16', 18, 'Arabian Beach', 'Operation wise', 'Arabian Beach', NULL, NULL, NULL, NULL, NULL, NULL, 93, 85, 50, 111, 49, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(77, 23, 19, 3, '2015-02-23', '2015-02-23', 15, 'Elforsan Housing', 'Heater', 'Staff Housing Crystal Bay', NULL, NULL, NULL, NULL, NULL, 116, 25, 86, 23, 25, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4),
(78, 122, 4, 7, '2015-03-01', '2015-03-15', 4, 'sun rise royal makadi', 'to be use in Arabian hotel luandry', 'sun rise arabian beach', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, 122, NULL, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(79, 106, 16, 6, '2015-03-03', '2015-03-10', 7, 'Sunrise EL Rabea', 'to Install in Sunrise Diamond', 'Sunrise Diamond', NULL, NULL, NULL, NULL, NULL, NULL, 30, 49, 106, 60, 63, 59, 3, NULL, 95, 99, 100, 101, 102, 119, 3),
(80, 93, 7, 8, '2015-04-06', '2015-04-08', 4, 'Arabian Beach - Not in use', 'To replace the curtain motors the have been stolen from Montemare''s Main restaurant', 'Montemare''s Main Restaurant', NULL, NULL, NULL, NULL, NULL, NULL, 30, 49, 125, 93, 85, 59, 3, NULL, 95, NULL, 100, 101, 102, NULL, 3),
(81, 25, 16, 3, '2015-04-07', '2015-04-07', 13, 'Sunrise El Rabae Sharm ElShiekh', 'Needed for operation', 'Sunrise Crystal Bay Hurghada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 124, 25, 92, 59, 3, 2, 95, NULL, 100, 101, 102, 119, 3),
(82, 60, 16, 6, '2015-04-20', '2015-04-24', 8, 'Sunrise Orchid', 'to be install in sunrise diamond', 'Sunrise Diamond', NULL, NULL, NULL, NULL, NULL, NULL, 30, 49, NULL, 60, 63, 59, 3, 2, 95, 99, 100, 101, 102, 119, 1),
(83, 126, 6, 8, '2015-05-04', '2015-05-09', 14, 'sunrise select diamond beach', 'To be on duty on the main gate', 'Sunrise grand select montemare', NULL, NULL, NULL, NULL, NULL, NULL, 60, 63, 126, 93, 85, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(84, 127, 8, 7, '2015-05-07', '2015-05-07', 12, 'Arabian Beach Hotel', 'Operation', 'Arabian Beach Hotel', NULL, NULL, NULL, NULL, NULL, 134, 93, 85, 127, 30, 49, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4),
(85, 27, 7, 3, '2015-05-11', '2015-05-11', 12, 'Sunrise Grand Select Arabian Sharm El_Sheikh - Stores', 'To be used for reupholstering Crystal Bay furniture', 'Sunrise Grand Select Crystal Bay Hurghada', NULL, NULL, NULL, NULL, NULL, NULL, 30, 49, 27, 25, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(86, 9, 5, 3, '2015-05-11', '2015-05-23', 2, 'Sunrise Holdays', 'For (Mail- MC -Sun) for Holidays Operation', 'Sunrise Grand Select Crystal Bay (DataCenter)', NULL, NULL, NULL, NULL, NULL, 43, 40, 5, 9, 25, 92, 4, 3, 2, 95, NULL, 100, 101, 102, NULL, 5),
(87, 128, 1, 11, '2015-06-03', '2015-06-04', 13, 'sunrise Mall', 'to cover all our beach', 'Beach Le Jardin', NULL, NULL, NULL, NULL, NULL, NULL, 6, 86, 128, 68, 75, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(90, 74, 4, 10, '2015-06-11', '2015-06-20', 2, 'Sunrise Select Royal Makadi', 'Need For Color Beach The Main Entrance', 'color beach', NULL, NULL, NULL, NULL, NULL, 82, 129, 32, 74, 77, 103, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4),
(91, 60, 16, 6, '2015-06-15', '2015-06-20', 8, 'Sunrise Orchid', 'to be in sunrise diamond', 'sunrise diamond', NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, 60, 63, 59, 3, 2, 95, NULL, 100, 101, NULL, 119, 1),
(92, 74, 11, 10, '2014-10-03', '2014-10-03', 2, 'IT Le Jardin', 'to use in color beach', 'IT Shedwan', NULL, NULL, NULL, NULL, NULL, 74, 68, NULL, 74, 68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(93, 74, 11, 10, '2014-04-27', '2014-04-27', 2, 'IT Le Jardin', 'to use in color beach', 'IT Shedwan', NULL, NULL, NULL, NULL, NULL, 74, 68, NULL, 74, 68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(94, 74, 11, 10, '2014-04-14', '2014-04-14', 2, 'IT Le Jardin', 'to use in color beach', 'IT Shedwan', NULL, NULL, NULL, NULL, NULL, 74, 68, NULL, 74, 68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(95, 130, 3, 17, '2015-06-27', '2015-07-04', 2, 'Crystal Bay', 'Needed new printer', 'Sunrise Luxor Head Office', NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(96, 131, 8, 6, '2015-07-01', '2015-07-04', 16, 'Sunrise Montemare', 'to be install in Sunrise Diamond', 'Sunrise Diamond', NULL, NULL, NULL, NULL, NULL, NULL, 93, 85, NULL, 60, 63, 59, 3, 2, 95, NULL, 100, 101, NULL, NULL, 1),
(97, 93, 16, 8, '2015-07-03', '2015-07-05', 12, 'El Rabea', 'To complete the missing terrace tables in building 4 - opening', 'Montemare rooms - building 4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 134, 93, 85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(98, 134, 16, 8, '2015-07-14', '2015-07-18', 12, 'relax pool', 'we have short on it', 'Montemary hotel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 134, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(99, 126, 7, 8, '2015-04-01', '2015-07-14', 14, 'Sunrise grand select arabian beach', 'To be on duty on receiving gate', 'Sunrise grand select montemare', NULL, NULL, NULL, NULL, NULL, NULL, 30, 49, 126, 93, 85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(100, 132, 7, 8, '2015-03-06', '2015-03-06', 6, 'Butcher section', 'heavy duty', 'Butcher- Montemare kitchen', NULL, NULL, NULL, NULL, NULL, NULL, 30, 49, 132, 93, 85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(101, 132, 7, 8, '2014-08-09', '2014-08-09', 6, 'kitchen', 'for baking toast', 'Bakery - kitchen montemare', NULL, NULL, NULL, NULL, NULL, NULL, 30, 49, 132, 93, 85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(102, 134, 7, 8, '2015-07-15', '2015-07-16', 12, 'Sun rise Arabian', 'For suits', 'Sun rise montemare', NULL, NULL, NULL, NULL, NULL, NULL, 30, 49, NULL, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(103, 134, 7, 8, '2015-07-15', '2015-07-16', 12, 'Sun rise Arabian', 'for suits', 'Sun rise montemare', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 49, 134, 93, 85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(104, 49, 8, 7, '2015-08-10', '2015-08-12', 15, 'Montemare', 'Rent new housing', 'Arabian Beach', NULL, NULL, NULL, NULL, NULL, NULL, 93, 85, NULL, 30, 49, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(105, 60, 8, 6, '2015-08-16', '2015-08-20', 8, 'Sunrise Montemare', 'to to in sunrise diamond', 'sunrise diamond', NULL, NULL, NULL, NULL, NULL, NULL, 93, 85, NULL, 60, 63, 59, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(106, 74, 1, 11, '2015-08-17', '2015-08-17', 12, 'Garden Beach', 'Operations Need', 'Festival Resorts', NULL, NULL, NULL, NULL, NULL, 18, 6, 86, 76, 68, 75, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4),
(107, 136, 6, 8, '2015-08-24', '2015-08-28', 2, '<p>\n	SUNRISE Diamond Beach</p>\n', '<p>\n	For Central workshop</p>\n', '<p>\n	SUNRISE Montemare</p>\n', NULL, NULL, NULL, NULL, NULL, 67, 60, 63, 136, 93, 85, 59, 3, 2, 95, NULL, 100, 101, 102, NULL, 5),
(108, 77, 3, 10, '2015-08-31', '2015-08-31', 12, 'SUNRISE Grand Select Crystal Bay Resort', 'For New Rooms', 'Festival Shedwan Golden Beach Resort', NULL, NULL, NULL, NULL, NULL, 27, 25, 92, 94, 77, 138, 4, 3, 2, 95, NULL, 100, 101, 102, NULL, 5),
(109, 136, 4, 8, '2015-09-01', '2015-09-08', 2, 'SUNRISE Royal Makadi', 'For used in outlets Montemare', 'SUNRISE Montemare', NULL, NULL, NULL, NULL, NULL, 82, 129, 32, 136, 93, 85, 59, 3, 2, 95, NULL, 100, 101, 102, NULL, 5),
(110, 122, 16, 6, '2015-09-01', '2015-09-05', 4, 'Sunrise EL Rabea Rooms', 'to installing in Diamond staff housing', 'new Diamond housing staff ( ElWaha)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 137, 63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(111, 30, 8, 16, '2015-09-03', '2015-09-10', 4, 'montemare hotel', 'for el rabae hotel', 'el rabae hotel', NULL, NULL, NULL, NULL, NULL, NULL, 93, 85, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(112, 134, 1, 8, '2015-09-08', '2015-09-16', 12, 'Garden Beach', 'For house us  rooms', 'Montemary hotel', NULL, NULL, NULL, NULL, NULL, 18, 6, 86, 134, 93, 85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4),
(113, 134, 7, 8, '2015-09-12', '2015-09-13', 12, 'Sun rise Arabian', 'To fabricate the suite 10107 & 10207 curtain', 'Sun rise montemare', NULL, NULL, NULL, NULL, NULL, NULL, 30, 49, 134, 93, 85, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(114, 134, 7, 8, '2015-09-21', '2015-09-30', 12, 'Sun rise Arabian', 'To keep toilet napkin on it', 'Sun rise montemare', NULL, NULL, NULL, NULL, NULL, NULL, 30, 49, 134, 93, 85, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(116, 117, 8, 7, '2015-09-25', '2015-09-30', 6, 'Sunrise Grand Select Montemare', 'Some Utensils can be used in Sunrise Arabian beach.', 'Sunrise Arabian Beach', NULL, NULL, NULL, NULL, NULL, 132, 93, NULL, 117, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(117, 137, 8, 6, '2015-09-28', '2015-10-01', 8, 'Sunrise Montemare', 'to be install in Sunrise Diamond', 'sunrise diamond', NULL, NULL, NULL, NULL, NULL, 93, 93, 85, 137, 137, 63, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(118, 30, 8, 6, '2015-09-29', '2015-10-10', 20, 'sunrise grand select montemare resort', 'for sunrise diamond beach resort', 'sunrise diamond beach resort', NULL, NULL, NULL, NULL, NULL, NULL, 93, 85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(119, 30, 8, 16, '2015-09-29', '2015-10-10', 20, 'sunrise grand select montemare resort', 'for orchid hotel', 'orchid hotel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(120, 77, 4, 10, '2015-09-29', '2015-09-29', 12, 'SUNRISE Select Royal Makadi', 'to put in  smartline', 'Festival Shedwan Golden Beach Resort', NULL, NULL, NULL, NULL, NULL, 36, 129, 32, 94, 77, 138, 4, 3, 2, 95, NULL, 100, 101, 102, NULL, 5),
(121, 134, 7, 8, '2015-09-30', '2015-10-10', 12, 'SUNRISE Grand Select Arabian Beach', 'to Keep Toilet napkin on it', 'SUNRISE Grand Select Montemare Resorts', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 49, 134, 93, 85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(122, 122, 8, 6, '2015-09-30', '2015-09-30', 15, 'SSH Workshope', 'to install in Diamond Staff housing ( ElWaha new)', 'to be  install in Diamond Staff housing ( ElWaha new)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(123, 122, 8, 6, '2015-09-30', '2015-09-30', 4, 'Sunrise SSH Workshop', 'to install in Diamond Staff housing ( ElWaha new)', 'to install in Diamond Staff housing ( ElWaha new)', NULL, NULL, NULL, NULL, NULL, NULL, 93, 85, NULL, 137, 63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(124, 93, 16, 8, '2015-10-01', '2015-10-03', 4, 'Sharm Orchid Stores', 'Tiling of the training room at MM', 'Training room of MM', NULL, NULL, NULL, NULL, NULL, NULL, 139, 49, NULL, 93, 85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(125, 36, 7, 4, '2015-10-04', '2015-10-04', 12, 'sunrise Grand select arabian beach', 'To but in the rooms', 'sunrise select royal makadi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 129, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(126, 94, 7, 10, '2015-10-06', '2015-10-21', 12, 'sunrise grand select arabian beach', '44 T.V for Shedwan new rooms', 'festival shedwan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 94, 77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(127, 94, 3, 10, '2015-10-06', '2015-10-21', 12, 'sunrise grand select crystal bay', 'for smart line rooms', 'festival shedwan', NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL, 94, 77, 138, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(128, 49, 8, 7, '2015-10-07', '2015-10-07', 3, 'Montemare', 'Covering Chairs minus in the amphitheater , covering sunbed minus at relax pool', 'Arabian Beach', NULL, NULL, NULL, NULL, NULL, NULL, 93, 85, NULL, 139, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(129, 134, 4, 8, '2015-10-21', '2015-10-31', 12, 'SUNRISE Royal Makadi', 'to montemare Rooms', 'SUNRISE Montemare', NULL, NULL, NULL, NULL, NULL, 36, 129, 32, 134, 93, 85, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4),
(131, 6, 16, 2, '2015-11-02', '2015-11-14', 6, 'SUNRISE SHARM Orchid', 'Need It Urgently at Sentido Mamlouk Palace Kitchen - project Number was 2012.', 'SENTIDO Mamlouk Palace', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(132, 49, 8, 7, '2015-11-04', '2015-11-04', 18, 'Montemare', 'high occupancy', 'Arabian Beach', NULL, NULL, NULL, NULL, NULL, 50, 93, 85, 141, 139, 49, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4),
(133, 49, 8, 7, '2015-11-04', '2015-11-04', 7, 'Montemare', 'needed for conferences', 'Arabian Beach', NULL, NULL, NULL, NULL, NULL, 135, 93, 85, 80, 139, 49, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(134, 49, 8, 7, '2015-11-04', '2015-11-04', 2, 'Montemare', 'Big screen for chirchil bar + myfair', 'Arabian Beach', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(135, 49, 8, 7, '2015-11-04', '2015-11-04', 2, 'Montemare', 'Big screen for chirchil bar + myfair', 'Arabian Beach', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 110, NULL, 49, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(136, 49, 8, 7, '2015-11-04', '2015-11-04', 13, 'Montemare', 'high occupancy', 'Arabian Beach', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 143, 139, 49, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(137, 6, 1, 2, '2015-11-09', '2015-11-14', 4, 'Sunrise  SELECT Garden Beach', 'For installation At Sentido Mamlouk Palace', 'SENTIDO Mamlouk Palace', NULL, NULL, NULL, NULL, NULL, 97, 6, 86, 24, 6, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4),
(138, 6, 1, 2, '2015-11-09', '2015-11-14', 4, 'Sunrise  SELECT Garden Beach', 'To install it At Sentido Mamlouk Palace', 'SENTIDO Mamlouk Palace', NULL, NULL, NULL, NULL, NULL, 97, 6, 86, 24, 6, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4),
(139, 49, 8, 7, '2015-11-10', '2015-11-10', 13, 'Montemare', 'High Occupancy', 'Arabian Beach', NULL, NULL, NULL, NULL, NULL, NULL, 93, 85, NULL, NULL, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `form_states`
--

CREATE TABLE IF NOT EXISTS `form_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `form_states`
--

INSERT INTO `form_states` (`id`, `state`) VALUES
(1, 'Submitted'),
(2, 'Awaiting approval'),
(3, 'Request hotel approved'),
(4, 'Source hotel approved'),
(5, 'approved'),
(6, 'Recieved'),
(7, 'Confirmed');

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE IF NOT EXISTS `hotels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `company_id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL DEFAULT 'SUN',
  `logo` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `dummy` tinyint(4) DEFAULT NULL,
  `dummy2` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`id`, `name`, `company_id`, `code`, `logo`, `deleted`, `dummy`, `dummy2`) VALUES
(1, 'SUNRISE Garden Beach', 2, 'GB', '448c7-sunrise-logo-small-stripped.jpg', 0, 0, 0),
(2, 'SENTIDO Mamlouk Palace', 2, 'MP', '448c7-sunrise-logo-small-stripped.jpg', 0, 0, 0),
(3, 'SUNRISE Crystal Bay', 1, 'CB', '448c7-sunrise-logo-small-stripped.jpg', 0, 0, 0),
(4, 'SUNRISE Royal Makadi', 4, 'RM', '448c7-sunrise-logo-small-stripped.jpg', 0, 0, 0),
(5, 'SUNRISE Holidays', 5, 'HO', '448c7-sunrise-logo-small-stripped.jpg', 0, 0, 0),
(6, 'SUNRISE Diamond Beach', 8, 'DB', '448c7-sunrise-logo-small-stripped.jpg', 0, 0, 0),
(7, 'SUNRISE Arabian Beach', 7, 'AB', '448c7-sunrise-logo-small-stripped.jpg', 0, 0, 0),
(8, 'SUNRISE Montemare', 9, 'MO', '448c7-sunrise-logo-small-stripped.jpg', 0, 0, 0),
(9, 'SENTIDO Oriental Dream', 6, 'OD', '448c7-sunrise-logo-small-stripped.jpg', 0, 0, 0),
(10, 'Festival Shedwan', 6, 'SH', '448c7-sunrise-logo-small-stripped.jpg', 0, 0, 0),
(11, 'Festival Le Jardin', 6, 'LJ', '448c7-sunrise-logo-small-stripped.jpg', 0, 0, 0),
(12, 'Festival Riviera', 6, 'RV', '448c7-sunrise-logo-small-stripped.jpg', 0, 0, 0),
(13, 'Color Beach Club', 6, 'CC', '448c7-sunrise-logo-small-stripped.jpg', 0, 0, 0),
(14, 'test hotel 1', 1, 'T1', '448c7-sunrise-logo-small-stripped.jpg', 0, 0, 0),
(15, 'test hotel 2', 8, 'T2', '448c7-sunrise-logo-small-stripped.jpg', 0, 0, 0),
(16, 'SUNRISE Sharm Orchid Resort', 10, 'SO', '448c7-sunrise-logo-small-stripped.jpg', 0, 0, 0),
(17, 'SUNRISE for floating hotels management', 11, 'FL', '448c7-sunrise-logo-small-stripped.jpg', 0, 0, 0),
(18, 'CA', 12, 'VI', '448c7-sunrise-logo-small-stripped.jpg', 0, 0, 0),
(19, 'EL Forsan Housing', 13, 'FR', '448c7-sunrise-logo-small-stripped.jpg', 0, 0, 0),
(20, 'SENTIDO MS Mahrousa', 6, 'MAH', NULL, 0, 0, 0),
(21, 'SENTIDO MS Mahrousa', 6, 'MAH', NULL, 1, 0, 0),
(22, 'SENTIDO MS Nile Saray', 6, 'NS', NULL, 0, 0, 0),
(23, 'SUNRISE MS African Dreams', 6, 'AFD', NULL, 0, 0, 0),
(24, 'SUNRISE MS Semiramis I', 6, 'SEM1', NULL, 0, 0, 0),
(25, 'SUNRISE MS Semiramis II', 6, 'SEM11', NULL, 0, 0, 0),
(26, 'Sunrise MS Semiramis III', 6, 'SEIII', NULL, 0, 0, 0),
(27, 'SUNRISE Select MS Terramar,', 6, 'TER', NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `hotel_approvals`
--

CREATE TABLE IF NOT EXISTS `hotel_approvals` (
  `hotel_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `rank` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hotel_approvals`
--

INSERT INTO `hotel_approvals` (`hotel_id`, `role_id`, `rank`) VALUES
(1, 6, 1),
(1, 16, 2),
(1, 4, 3),
(1, 3, 4),
(1, 2, 5),
(3, 6, 1),
(3, 16, 2),
(3, 4, 3),
(3, 3, 4),
(3, 2, 5),
(2, 6, 1),
(2, 16, 2),
(2, 4, 3),
(2, 3, 4),
(2, 2, 5),
(4, 6, 1),
(4, 16, 2),
(4, 4, 3),
(4, 3, 4),
(4, 2, 5),
(5, 6, 1),
(5, 16, 2),
(5, 4, 3),
(5, 3, 4),
(5, 2, 5),
(6, 6, 1),
(6, 16, 2),
(6, 4, 3),
(6, 3, 4),
(6, 2, 5),
(7, 6, 1),
(7, 16, 2),
(7, 4, 3),
(7, 3, 4),
(7, 2, 5),
(8, 6, 1),
(8, 16, 2),
(8, 4, 3),
(8, 3, 4),
(8, 2, 5),
(9, 6, 1),
(9, 16, 2),
(9, 4, 3),
(9, 3, 4),
(9, 2, 5),
(10, 6, 1),
(10, 16, 2),
(10, 4, 3),
(10, 3, 4),
(10, 2, 5),
(11, 6, 1),
(11, 16, 2),
(11, 4, 3),
(11, 3, 4),
(11, 2, 5),
(12, 6, 1),
(12, 16, 2),
(12, 4, 3),
(12, 3, 4),
(12, 2, 5),
(13, 6, 1),
(13, 16, 2),
(13, 4, 3),
(13, 3, 4),
(13, 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `hotel_planned_signatures`
--

CREATE TABLE IF NOT EXISTS `hotel_planned_signatures` (
  `hotel_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `rank` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hotel_planned_signatures`
--

INSERT INTO `hotel_planned_signatures` (`hotel_id`, `role_id`, `rank`) VALUES
(3, 2, 9),
(1, 2, 9),
(8, 16, 9),
(7, 16, 9),
(6, 16, 9),
(14, 2, 8),
(14, 16, 7),
(14, 3, 6),
(14, 6, 5),
(14, 4, 4),
(14, 5, 3),
(14, 19, 2),
(14, 18, 1),
(13, 16, 8),
(13, 3, 7),
(13, 6, 6),
(13, 4, 5),
(13, 5, 4),
(13, 19, 3),
(13, 20, 2),
(13, 18, 1),
(12, 16, 8),
(12, 3, 7),
(12, 6, 6),
(12, 4, 5),
(12, 5, 4),
(12, 19, 3),
(12, 20, 2),
(12, 18, 1),
(11, 16, 8),
(11, 3, 7),
(11, 6, 6),
(11, 4, 5),
(11, 5, 4),
(11, 19, 3),
(11, 20, 2),
(11, 18, 1),
(10, 16, 8),
(10, 3, 7),
(10, 6, 6),
(10, 4, 5),
(10, 5, 4),
(10, 19, 3),
(10, 20, 2),
(10, 18, 1),
(9, 16, 8),
(9, 3, 7),
(9, 6, 6),
(9, 4, 5),
(9, 5, 4),
(9, 19, 3),
(9, 20, 2),
(9, 18, 1),
(8, 3, 8),
(8, 17, 7),
(8, 6, 6),
(8, 4, 5),
(8, 5, 4),
(8, 19, 3),
(8, 20, 2),
(8, 18, 1),
(7, 3, 8),
(7, 17, 7),
(7, 6, 6),
(7, 4, 5),
(7, 5, 4),
(7, 19, 3),
(7, 20, 2),
(7, 18, 1),
(6, 3, 8),
(6, 17, 7),
(6, 6, 6),
(6, 4, 5),
(6, 5, 4),
(6, 19, 3),
(6, 20, 2),
(6, 18, 1),
(4, 16, 8),
(4, 3, 7),
(4, 6, 6),
(4, 4, 5),
(4, 5, 4),
(4, 19, 3),
(4, 20, 2),
(4, 18, 1),
(5, 16, 8),
(5, 3, 7),
(5, 6, 6),
(5, 4, 5),
(5, 5, 4),
(5, 19, 3),
(5, 20, 2),
(5, 18, 1),
(3, 16, 8),
(3, 3, 7),
(3, 6, 6),
(3, 4, 5),
(3, 5, 4),
(3, 19, 3),
(3, 20, 2),
(3, 18, 1),
(2, 16, 8),
(2, 3, 7),
(2, 6, 6),
(2, 4, 5),
(2, 5, 4),
(2, 19, 3),
(2, 20, 2),
(2, 18, 1),
(1, 16, 8),
(1, 3, 7),
(1, 6, 6),
(1, 4, 5),
(1, 5, 4),
(1, 19, 3),
(1, 20, 2),
(1, 18, 1),
(2, 2, 9),
(4, 2, 9),
(5, 2, 9),
(6, 2, 10),
(7, 2, 10),
(8, 2, 10),
(9, 2, 9),
(10, 2, 9),
(11, 2, 9),
(12, 2, 9),
(13, 2, 9);

-- --------------------------------------------------------

--
-- Table structure for table `hotel_signatures`
--

CREATE TABLE IF NOT EXISTS `hotel_signatures` (
  `hotel_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `rank` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hotel_signatures`
--

INSERT INTO `hotel_signatures` (`hotel_id`, `role_id`, `rank`) VALUES
(13, 2, 5),
(13, 16, 4),
(13, 3, 3),
(14, 2, 5),
(14, 16, 4),
(14, 3, 3),
(14, 18, 2),
(14, 6, 1),
(13, 18, 2),
(13, 6, 1),
(12, 2, 5),
(12, 16, 4),
(12, 3, 3),
(12, 18, 2),
(12, 6, 1),
(11, 2, 5),
(11, 16, 4),
(11, 3, 3),
(11, 18, 2),
(11, 6, 1),
(10, 2, 5),
(10, 16, 4),
(10, 3, 3),
(10, 18, 2),
(10, 6, 1),
(9, 2, 5),
(9, 16, 4),
(9, 3, 3),
(9, 18, 2),
(9, 6, 1),
(8, 2, 6),
(8, 16, 5),
(8, 3, 4),
(8, 18, 3),
(8, 17, 2),
(7, 2, 6),
(7, 16, 5),
(7, 3, 4),
(7, 18, 3),
(7, 17, 2),
(6, 2, 6),
(6, 16, 5),
(6, 3, 4),
(6, 18, 3),
(6, 17, 2),
(5, 2, 5),
(5, 16, 4),
(5, 3, 3),
(5, 18, 2),
(5, 6, 1),
(4, 2, 5),
(4, 16, 4),
(4, 3, 3),
(4, 18, 2),
(4, 6, 1),
(3, 2, 5),
(3, 16, 4),
(3, 3, 3),
(3, 18, 2),
(3, 6, 1),
(2, 2, 5),
(2, 16, 4),
(2, 3, 3),
(2, 18, 2),
(2, 6, 1),
(1, 2, 5),
(1, 16, 4),
(1, 3, 3),
(1, 18, 2),
(1, 6, 1),
(6, 6, 1),
(7, 6, 1),
(8, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=297 ;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `form_id`, `name`, `description`, `quantity`, `deleted`) VALUES
(1, 1, '-', 'first item', 1, 0),
(2, 1, '-', 'second item', 2, 0),
(3, 1, '-', 'longer description for the forth item!', 13, 0),
(4, 2, '-', 'test', 1, 0),
(5, 3, '-', 'dsfdsf', 2, 0),
(6, 4, '-', 'vdsvad', 1, 0),
(7, 4, '-', '', 0, 0),
(8, 5, '-', 'test', 1, 0),
(9, 6, '-', 'test', 2, 0),
(10, 6, '-', '', 0, 0),
(11, 7, '-', 'test', 1, 0),
(12, 8, '-', 'test', 1, 0),
(13, 9, 'PC ', 'PC test', 1, 0),
(14, 9, 'printer', 'test', 2, 0),
(15, 10, 'Color Xerox Printer 7120', 'To provide Color printer at Montemare', 1, 0),
(16, 10, 'firewwall Fortigate 80 C', 'install firewall at Montemare hotel', 1, 0),
(17, 11, 'server 530', 'intinstall new domian', 1, 0),
(18, 11, 'printer', 'move tp it office', 2, 0),
(19, 12, 'test', 'test', 1, 0),
(20, 13, 'test', 'nddfkg', 1, 0),
(21, 13, 'glragl/', 'gmr.', 2, 0),
(22, 14, 'HP Proliant Server', 'HP Proliant Server', 1, 0),
(23, 15, 'xz', 'x', 1, 0),
(24, 16, 'a', 'ds', 1, 0),
(25, 17, 'x', 's', 1, 0),
(26, 18, 'sa', 'a', 1, 0),
(27, 19, 'q', 'ws', 1, 0),
(28, 20, 'Proffer cabinet', 'local made (height 230 cm & width 140 cm)', 1, 0),
(29, 21, 'Server HP ML 370 G6', 'For Invoice System Migration', 1, 0),
(30, 22, 'Chair One Seat', 'For Lobby Terrace Shedwan', 33, 0),
(31, 22, 'Sofa 2 Seat', 'For Lobby Terrace Shedwan', 13, 0),
(32, 22, 'Large Table', 'For Lobby Terrace Shedwan', 17, 0),
(33, 23, 'sun beds ', 'sun beds ', 40, 0),
(34, 23, 'table ', 'tables ', 40, 0),
(35, 24, 'TV', 'LG 32&quot;', 44, 0),
(36, 25, 'TV', 'LG 32"', 96, 0),
(37, 26, 'Tv', '<p>\n	LG 32&quot;</p>\n', 224, 0),
(38, 27, 'TV', 'Hisense', 8, 0),
(39, 28, 'Tv', 'LG 32"', 256, 0),
(40, 29, 'TV', '<p>\n	Hisense</p>\n', 132, 0),
(41, 30, 'TV', 'LG 32"', 4, 0),
(42, 31, 'Mattress', '<p>\n	Matress 110 cm * 200 cm</p>\n', 111, 0),
(43, 31, 'Mattress', '<p>\n	Matress 120 cm * 200 cm</p>\n', 36, 0),
(44, 32, 'Mattress', '<p>\n	180cm x 200cm</p>\n', 85, 0),
(45, 32, 'Mattress', '<p>\n	110cm x 200cm</p>\n', 250, 0),
(46, 33, '-', 'Color laser printer', 1, 0),
(47, 33, '-', 'Laser printer', 1, 0),
(48, 34, '-', '', 1, 0),
(49, 35, 'Xerox 7120', '<p>\n	color laser printer</p>\n', 1, 0),
(50, 35, 'Xerox 5330', '<p>\n	heavy-duty printer</p>\n', 1, 0),
(51, 36, '-', 'for kitchen', 3, 0),
(52, 36, '-', 'for kitchen ', 1, 0),
(53, 36, '-', 'For Kitchen ', 1, 0),
(54, 36, '-', 'for kitchen', 1, 0),
(55, 36, '-', 'for kitchen ', 1, 0),
(56, 36, '-', 'for kitchen', 1, 0),
(57, 36, '-', 'for kitchen ', 1, 0),
(58, 36, '-', 'for kitchen', 1, 0),
(59, 36, '-', 'for kitchen ', 1, 0),
(60, 36, '-', 'for kitcken ', 1, 0),
(61, 37, '-', 'for kitchen', 3, 0),
(62, 37, '-', 'for kitchen ', 1, 0),
(63, 37, '-', 'For Kitchen ', 1, 0),
(64, 37, '-', 'for kitchen', 1, 0),
(65, 37, '-', 'for kitchen ', 1, 0),
(66, 37, '-', 'for kitchen', 1, 0),
(67, 37, '-', 'for kitchen ', 1, 0),
(68, 37, '-', 'for kitchen', 1, 0),
(69, 37, '-', 'for kitchen ', 1, 0),
(70, 37, '-', 'for kitcken ', 1, 0),
(71, 37, '-', 'FOR KITCHEN ', 1, 0),
(72, 38, '-Knee type star basin 304# 1.2mm', '<p>\n	for shedwan new kitchen</p>\n', 3, 0),
(73, 38, '-The wall mounted faucet', '<p>\n	for shedwan new kitchen</p>\n', 1, 0),
(74, 38, '-3Gl Microwave oven', '<p>\n	for shedwan new kitchen</p>\n', 1, 0),
(75, 38, '-mfc32 275*280*120KG/0.25KW', '<p>\n	for shedwan new kitchen</p>\n', 1, 0),
(76, 38, '-Slicer Meat', '<p>\n	for shedwan new kitchen</p>\n', 1, 0),
(77, 38, '-GAS TILTING BRASING PAN 800*900*60', '<p>\n	for shedwan new kitchen</p>\n', 1, 0),
(78, 38, '-XW)-2A DISH WASHER 705*830*1500/0735KW WASHING CAPACITY 900PLATES', '<p>\n	for shedwan new kitchen</p>\n', 1, 0),
(79, 38, '-ZH-TC ELECTIC1-TANK FRYER WITH capinet 800*900*850+60', '<p>\n	for shedwan new kitchen</p>\n', 1, 0),
(80, 38, '-WR-10-11 steaming and baking oven 867*930*930', '<p>\n	for shedwan new kitchen</p>\n', 1, 0),
(81, 38, '-food crushor 370*445*615/220v 109kw', '<p>\n	for shedwan new kitchen</p>\n', 1, 0),
(82, 38, '-ZH-RO100 GASSOUP KETTLE 800*900*850+60', '<p>\n	for shedwan new kitchen</p>\n', 1, 0),
(83, 39, 'Boiler', '', 2, 0),
(84, 40, '-', '', 4, 0),
(85, 41, '-Sheslong Blastic', '<p>\n	sheslong beach le jardin</p>\n', 106, 0),
(86, 41, '-Sheslong Wood', '<p>\n	sheslong beach le jardin</p>\n', 94, 0),
(87, 42, '-juice dispensers', '<p>\n	juice dispensers</p>\n', 4, 0),
(88, 43, 'juice dispensers ', '<p>\n	juice dispensers</p>\n', 3, 0),
(89, 44, '-Juice Dispensers', '<p>\n	For Lobby SmartLine</p>\n', 1, 0),
(90, 44, '-Juice Dispensers', '<p>\n	For Pool SmartLine</p>\n', 1, 0),
(91, 45, '-Juice Dispensers', '<p>\n	Festival Shedwan</p>\n', 3, 0),
(92, 46, 'juice dispensers ', '<p>\n	juice dispensers</p>\n', 3, 0),
(93, 47, 'juice dispensers ', '<p>\n	juice dispensers</p>\n', 3, 0),
(94, 48, '-', '2 slice machines', 2, 0),
(95, 49, '-slice machines', '<p>\n	2 slice machines</p>\n', 2, 0),
(96, 50, 'mattresses', '<p>\n	100 cm width</p>\n', 64, 0),
(97, 50, 'mattresses', '<p>\n	120 cm Width</p>\n', 33, 0),
(98, 50, 'mattresses', '<p>\n	110 cm Width</p>\n', 44, 0),
(99, 51, '-juice dispenser', '<p>\n	juice dispenser</p>\n', 2, 0),
(100, 52, '-juice dispenser', '<p>\n	juice dispenser</p>\n', 2, 0),
(101, 53, '-', 'To Diamond Kitchen ', 2, 0),
(102, 53, '-', 'To Diamond Kitchen ', 3, 0),
(103, 53, '-', 'To Diamond Kitchen ', 4, 0),
(104, 53, '-', 'To Diamond Kitchen', 4, 0),
(105, 53, '-', 'To Diamond Kitchen', 2, 0),
(106, 53, '-', 'To Diamond Kitchen', 1, 0),
(107, 53, '-', 'To Diamond Kitchen', 2, 0),
(108, 53, '-', 'To Diamond Kitchen', 1, 0),
(109, 53, '-', 'To Diamond Kitchen', 2, 0),
(110, 53, '-', 'To Diamond Kitchen', 1, 0),
(111, 53, '-', 'To Diamond Kitchen', 2, 0),
(112, 53, '-', 'To Diamond Kitchen', 1, 0),
(113, 53, '-', 'To Diamond Kitchen', 2, 0),
(114, 53, '-', 'To Diamond Kitchen', 1, 0),
(115, 53, '-', 'To Diamond Kitchen', 1, 0),
(116, 53, '-', 'To Diamond Kitchen', 1, 0),
(117, 53, '-', 'To Diamond Kitchen', 1, 0),
(118, 54, 'Juice Dispenser', '<p>\n	<u>Juice Dispenser</u></p>\n', 4, 0),
(119, 55, '-', '', 4, 0),
(120, 56, '-', '', 4, 0),
(121, 57, '-', '', 4, 0),
(122, 58, 'Commercial Microwaves', '<p>\n	Heavey Duty Commercial Microwave</p>\n', 2, 0),
(123, 59, '-', 'Heavey Duty Commercial Microwave', 2, 0),
(124, 60, '-Juice Dispensers', '', 3, 0),
(125, 61, '-Juice Dispensers', '', 3, 0),
(126, 62, '-Juice Dispensers From Chine', '<p>\n	Juice Dispensers From Chine</p>\n', 4, 0),
(127, 63, 'Meat Mincer', '<p>\n	Heavy Duty Meay Mincer</p>\n', 1, 0),
(128, 64, 'مرتبه', '<p>\n	لسكن الفرسان</p>\n', 64, 0),
(129, 65, 'مرتبة', 'مرتبة واحد متر للاستخدام للموظفين', 64, 0),
(130, 66, 'Cleaning Machine ', '', 1, 0),
(131, 67, 'Electric Leader', 'Electric Leader', 1, 0),
(132, 68, 'Electric Leader', 'Electric Leader', 1, 0),
(133, 69, 'Big white chair ', 'big white chair ', 8, 0),
(134, 69, 'Big blue cochin', 'big blue cochin', 8, 0),
(135, 69, 'Small  withe chair ', 'small withe chair ', 4, 0),
(136, 69, 'Small blue cochin ', 'small blue cochin ', 4, 0),
(137, 69, 'Small Round table ', 'small round table ', 1, 0),
(138, 69, 'Big Round Table ', 'Big Round Table ', 1, 0),
(139, 69, 'Big Mattress', 'Big Mattress', 1, 0),
(140, 69, 'Small Cochin ', 'Small Cochin ', 7, 0),
(141, 69, 'Big Swimming Pool Sunbed ', 'Big Swimming Pool Sunbed ', 2, 0),
(142, 69, 'Sunbed Big Blue cochin', 'Sunbed Big Blue cochin', 2, 0),
(143, 70, 'Gas Grill', 'Used', 1, 0),
(144, 70, 'Gas Tilting Pan ', 'Used', 1, 0),
(145, 70, 'Gas Deep Fryer', 'used', 1, 0),
(146, 70, 'Toaster Machine', 'Used', 2, 0),
(147, 71, 'ماكينة توست ', 'مستعمله ', 2, 0),
(148, 71, 'مكبس جزار ', 'مستعمل', 1, 0),
(149, 71, 'جريله كهربا دائريه 40سم', 'مستعمله', 1, 0),
(150, 72, 'LCD Hisense 32"', 'to diamond Rooms', 100, 0),
(151, 73, 'LCD 32"', 'to diamond Rooms', 135, 0),
(152, 74, 'LCD 32"', 'to diamond Rooms', 135, 0),
(153, 75, 'LCD 32" LG', 'to diamond Rooms', 100, 0),
(154, 75, 'LCD 32'''' SAMSUNG', '<p>\n	to diamond Rooms</p>\n', 40, 0),
(155, 76, 'Club Car', 'Club Car', 1, 0),
(156, 77, 'Heater', 'heater', 10, 0),
(157, 78, 'Chicago Flat iron', 'flat iron for luandry', 1, 0),
(158, 79, 'Galss washer ', '', 2, 0),
(159, 79, 'Iceamaker', 'For a new aqua parck', 2, 0),
(160, 80, 'Curtain motors', 'Smofi Roll up motors - for main restaurant', 12, 0),
(161, 80, 'Curtain Motors', 'Gladyie motors - for main restaurant', 5, 0),
(162, 81, 'Sunbed ', '', 63, 0),
(163, 82, 'Convection Model Angelopo', '1', 1, 0),
(164, 83, 'sniffer', 'جهاز كشف المفرقعات', 1, 0),
(165, 84, 'Suzuki Car', '', 1, 0),
(166, 85, 'Upholstery Fabics (1)', 'Shanilia Green in Beige color', 51, 0),
(167, 85, 'Upholstery Fabics (2)', 'Plush Fabrics Brown in Light Blue', 21, 0),
(168, 85, 'Upholstery Fabics (3)', 'Shanilia Fabrics Dark Beige Stripped', 19, 0),
(169, 85, 'Upholstery Fabics (4)', 'Plush Fabrics Beige Bright', 42, 0),
(170, 85, 'Upholstery Fabics (5)', 'Shanilia Orange in Beige color', 25, 0),
(171, 86, 'Sever ML370 G5', 'Sever ML370 G5', 1, 0),
(172, 87, 'Sun Bed', 'we need to send sun bed to center workshop for maintenance', 82, 0),
(173, 87, 'Matres with cover', '', 100, 0),
(174, 88, 'micros with printer ', 'micros for color beach ', 1, 0),
(175, 89, 'micros + printer ckeck ', 'micros for color beach', 1, 0),
(176, 90, 'Micros + Printer ', 'micros for color beach', 1, 0),
(177, 91, 'Small icemaker', 'To install in diamond beach', 1, 0),
(178, 91, 'small glasswasher', 'To install in diamond beach', 1, 0),
(179, 92, 'Switch Cisco', '', 1, 0),
(180, 93, 'Micros Kitchen Printer', '', 1, 0),
(181, 94, 'Micros workstation', '1- SN 8101021722    2- SN 8081021185    3- SN 8081021157    4- SN 8081021190', 4, 0),
(182, 94, 'Micros Kitchen Printer', '1- SN GM3G003890 2- SN GM3G003214 3- SN GM3G003222 4- SN GM3G003063', 4, 0),
(183, 95, 'xerox workcentre 5020', 'Printer', 1, 0),
(184, 96, 'Plant pot big', '', 8, 0),
(185, 96, 'Plant pot small', '', 5, 0),
(186, 97, 'Rattan Tables', 'Rattan tables for rooms terraces - Building 4', 34, 0),
(187, 98, 'Pools ratan tabels ', 'Small tablewith brown color ', 35, 0),
(188, 99, 'sneffer', 'جهاز الكشف عن المفرقعات', 1, 0),
(189, 100, 'Meat Cutter ', 'Italian meat mincer(40 kg.)', 1, 0),
(190, 101, 'Toast Forms', 'For bakery- black steel', 5, 0),
(191, 102, 'Dark brown fabric ', '', 30, 0),
(192, 102, 'Brown * Bege striped fabric', '', 36, 0),
(193, 102, 'Brown wool with dotted fabric', '', 15, 0),
(194, 102, 'Beige fabric', '', 35, 0),
(195, 102, 'Beige velour fabric', '', 28, 0),
(196, 102, 'Red * Black fabric', '', 5, 0),
(197, 103, 'Dark brown fabric', '', 25, 0),
(198, 103, 'Brown * Bege striped fabric', '', 35, 0),
(199, 103, 'brown wool with dotted fabric', '', 25, 0),
(200, 103, 'beige fabric', '', 35, 0),
(201, 103, 'beige velour fabric ', '', 28, 0),
(202, 103, 'Red* black fabric ', '', 5, 0),
(203, 103, 'Brown Mzarkh fabric ', '', 25, 0),
(204, 103, 'Dark brown Fabric sick ', '', 35, 0),
(205, 103, 'Coppery strip fabric ', '', 7, 0),
(206, 104, 'Bed', 'Staff housing bed', 55, 0),
(207, 104, 'cupboard', 'staff housing cupboard', 100, 0),
(208, 105, 'Wear Dropp', '', 50, 0),
(209, 106, 'TV', '', 30, 0),
(210, 107, 'Computer Desktop', '<p>\n	For Central workshop</p>\n', 1, 0),
(211, 108, 'TV LCD plus holder and remote', ' LG  (26") ', 168, 0),
(212, 109, 'Device MICROS', '', 8, 0),
(213, 109, 'Printer MICROS', '', 8, 0),
(214, 110, 'TV', 'to be in new Diamond housing staff', 25, 0),
(215, 110, 'Minibar', 'to be in new Diamond housing staff', 25, 0),
(216, 109, 'Drawer MICROS', '', 8, 0),
(217, 111, 'pump grundfos ', '', 3, 0),
(218, 111, 'pump controller panel', '', 3, 0),
(219, 112, 'T V  20 L  C H ', '', 30, 0),
(220, 113, 'Beige  FabricNO 4', 'Velvet  beige fabric', 31, 0),
(221, 113, 'Beige fabric NO 17', 'Normal beige Fabric', 25, 0),
(222, 114, 'Tissues box ', 'Brass tisses box ', 249, 0),
(223, 114, 'Tissues Box ', 'Estanles tisses Box ', 51, 0),
(224, 115, 'ترولي أطباق كامبرو', '', 2, 0),
(225, 115, 'حوض (02) عين', '', 5, 0),
(226, 115, 'حوض عين واحدة', '', 2, 0),
(227, 115, 'كونتر بباب جرار', '', 1, 0),
(228, 115, 'إسطوانة غاز25', '', 12, 0),
(229, 115, 'ظهر كونتر', '', 1, 0),
(230, 115, 'قاعدة ستانليس ستيل لفرن', '', 2, 0),
(231, 115, 'ترولي مطبخ', '', 3, 0),
(232, 115, 'حوض 3 عين', '', 3, 0),
(233, 115, 'ثلاجة اندر كونتر', '', 1, 0),
(234, 115, 'ثلاجة بإدراج  أندر كونتر', '', 1, 0),
(235, 115, 'ترولي نقع مياه', '', 2, 0),
(236, 115, 'دولاب حائط معلق', '', 2, 0),
(237, 115, 'كونتر مثل الروشو', '', 1, 0),
(238, 115, 'ترولي 02 رف', '', 4, 0),
(239, 115, 'قاعدة إستانليس ستيل', '', 8, 0),
(240, 116, 'S/S Three Compartments Sink', 'Stainless Steel Triple Sink', 1, 0),
(241, 116, 'S/S Kitchen Trolley', 'Stainless Steel Kitchen Trolley ', 3, 0),
(242, 116, 'S/S Oven Table', 'Stainless Steel Double Dooer table to be used for counter top oven', 2, 0),
(243, 116, 'Large Gas Cylinder', 'Large Size Gas Cylinder ', 12, 0),
(244, 116, 'S/S Counter with sliding door', 'Sliding Double Door Counter', 1, 0),
(245, 116, 'S/S Dipping Trolley', 'Stainless Steel Dipping Trolley', 2, 0),
(246, 116, 'Double Door Under Counter Fridge', 'Double Door Under Counter Fridge', 1, 0),
(247, 117, 'تروللي نقع مياه', '', 2, 0),
(248, 117, 'كونتر مثل الروشو', '', 1, 0),
(249, 117, 'تروللي 2 رف', '', 4, 0),
(250, 117, 'تروللي اطباق كمبرو', '', 2, 0),
(251, 117, 'ظهر كونتر', '', 1, 0),
(252, 117, 'قاعدة ستانلس لفرن', '', 2, 0),
(253, 117, 'كونتر باب جرار', '', 1, 0),
(254, 118, 'ترولي أطباق كامبرو', '', 2, 0),
(255, 118, 'كونتر بباب جرار', '', 1, 0),
(256, 118, 'ظهر كونتر', '', 1, 0),
(257, 118, 'قاعدة ستانليس ستيل لفرن', '', 2, 0),
(258, 118, 'ترولي نقع مياه', '', 2, 0),
(259, 118, 'كونتر مثل الروشو', '', 1, 0),
(260, 118, 'ترولي 02 رف', '', 4, 0),
(261, 119, 'حوض (02) عين', '', 5, 0),
(262, 119, 'حوض عين واحدة', '', 2, 0),
(263, 119, 'إسطوانة غاز25', '', 12, 0),
(264, 119, 'ترولي مطبخ', '', 3, 0),
(265, 119, 'حوض 3 عين', '', 3, 0),
(266, 119, 'ثلاجة اندر كونتر', '', 1, 0),
(267, 119, 'ثلاجة بإدراج  أندر كونتر', '', 1, 0),
(268, 119, 'دولاب حائط معلق', '', 2, 0),
(269, 119, 'قاعدة إستانليس ستيل', '', 8, 0),
(270, 120, 'TV LCD plus holder and remote', '26 inch', 64, 0),
(271, 121, 'Tissues box	', 'Brass tisses box', 15, 0),
(272, 122, 'Wooden Cupboard', '', 50, 0),
(273, 123, 'Wooden Cupboard', '', 50, 0),
(274, 124, 'Ceramic tiles', '60 SQM of ceramic tiles', 60, 0),
(275, 125, 'TV L C D Plus holder and remot', '32 inch', 26, 0),
(276, 126, 'T.V', '44TVfor shedwan new rooms', 44, 0),
(277, 127, 'T.V', '168 T.V from sunrise select crystal bay for smart line rooms', 168, 0),
(278, 128, 'Chairs ', 'Ratan Chairs', 130, 0),
(279, 128, 'Sunbed', 'Sunbed', 30, 0),
(280, 129, 'LCD 32&#39;&#39; SAMSUNG', 'to montemare Rooms', 40, 0),
(281, 130, 'test', 'test', 1, 0),
(282, 131, 'Food Processor (Rahaya رحايه)', '15 L - Made in China', 1, 0),
(283, 132, 'Suzuki Car ', 'bellman', 1, 0),
(284, 133, 'table', 'table', 1, 0),
(285, 133, 'stand', 'stand', 1, 0),
(286, 133, 'table ', '180 *180', 10, 0),
(287, 134, 'TV LG 55 inch', 'tv', 1, 0),
(288, 135, 'TV LG 55 inch', 'tv', 2, 0),
(289, 136, 'umbrella ', 'umprela', 25, 0),
(290, 136, 'skuna', 'skuna', 15, 0),
(291, 136, 'bed matress', 'bed matress', 100, 0),
(292, 136, 'bed mattress white', 'bed mattress white', 50, 0),
(293, 137, 'Central Unit', '', 1, 0),
(294, 138, 'Satellite Unit', '', 1, 0),
(295, 139, 'Sunbed', 'Metal white', 100, 0),
(296, 139, 'sunbed', 'Metall white', 50, 0);

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `target_id` int(11) NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=960 ;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id`, `user_id`, `action`, `target`, `target_id`, `data`, `comments`, `log_time`) VALUES
(1, 1, 'view', 'projects', 0, 'view operation', NULL, '0000-00-00 00:00:00'),
(2, 3, 'request', 'projects', 3, '{"user_id":"3","department_id":"5","hotel_id":"2","type_id":"2","origin_id":3,"name":"Gg","reasons":"ggg","EUR_EX":"5.6","USD_EX":"8.9","budget_EGP":"456","budget_USD":"55","budget_EUR":"","budget":"945.5","remarks":"","state_id":0}', 'user created project approval request', '0000-00-00 00:00:00'),
(3, 3, 'approve', 'projects', 3, 'user self approved', NULL, '0000-00-00 00:00:00'),
(4, 3, 'stage', 'projects', 3, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(5, 3, 'notify', 'projects', 3, 'notification sent to marwan.gendy@sunrise-resorts.com', 'approval request', '0000-00-00 00:00:00'),
(6, 3, 'request', 'projects', 4, '{"user_id":"3","department_id":"","hotel_id":"10","type_id":"2","origin_id":3,"name":"yftyf","reasons":"yut","EUR_EX":"9.9","USD_EX":"8.8","budget_EGP":"10000000","budget_USD":"","budget_EUR":"","budget":"10000000","remarks":"","state_id":0}', 'user created project approval request', '0000-00-00 00:00:00'),
(7, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(8, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(9, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(10, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(11, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(12, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(13, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(14, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(15, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(16, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(17, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(18, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(19, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(20, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(21, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(22, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(23, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(24, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(25, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(26, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(27, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(28, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(29, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(30, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(31, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(32, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(33, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(34, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(35, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(36, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(37, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(38, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(39, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(40, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(41, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(42, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(43, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(44, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(45, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(46, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(47, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(48, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(49, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(50, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(51, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(52, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(53, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(54, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(55, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(56, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(57, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(58, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(59, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(60, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(61, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(62, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(63, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(64, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(65, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(66, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(67, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(68, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(69, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(70, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(71, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(72, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(73, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(74, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(75, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(76, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(77, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(78, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(79, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(80, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(81, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(82, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(83, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(84, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(85, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(86, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(87, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(88, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(89, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(90, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(91, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(92, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(93, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(94, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(95, 3, 'approve', 'projects', 4, 'user self approved', NULL, '0000-00-00 00:00:00'),
(96, 3, 'stage', 'projects', 4, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(97, 3, 'request', 'projects', 5, '{"user_id":"3","department_id":"4","hotel_id":"2","type_id":"1","origin_id":3,"name":"ewrwer","reasons":"wer","EUR_EX":".6","USD_EX":"5.5","budget_EGP":"100000000","budget_USD":"","budget_EUR":"","budget":"100000000","remarks":"","state_id":0}', 'user created project approval request', '0000-00-00 00:00:00'),
(98, 3, 'approve', 'projects', 5, 'user self approved', NULL, '0000-00-00 00:00:00'),
(99, 3, 'stage', 'projects', 5, 'project state updated to 1', NULL, '0000-00-00 00:00:00'),
(100, 3, 'notify', 'projects', 5, 'notification sent to marwan.gendy@sunrise-resorts.com', 'approval request', '0000-00-00 00:00:00'),
(101, 6, 'Approve', 'projects', 5, 'user signed approval', NULL, '0000-00-00 00:00:00'),
(102, 6, 'notify', 'projects', 5, 'notification sent to marwan.gendy@sunrise-resorts.com', 'approval request', '0000-00-00 00:00:00'),
(103, 3, 'Approve', 'projects', 5, 'user signed approval', NULL, '0000-00-00 00:00:00'),
(104, 3, 'notify', 'projects', 5, 'notification sent to marwan.gendy@sunrise-resorts.com', 'approval request', '0000-00-00 00:00:00'),
(105, 55, 'Approve', 'projects', 5, 'user signed approval', NULL, '0000-00-00 00:00:00'),
(106, 55, 'notify', 'projects', 5, 'notification sent to marwan.gendy@sunrise-resorts.com', 'approval request', '0000-00-00 00:00:00'),
(107, 2, 'Approve', 'projects', 5, 'user signed approval', NULL, '0000-00-00 00:00:00'),
(108, 2, 'notify', 'projects', 5, 'notification sent to owner marwan.gendy@sunrise-resorts.com', 'code exists = approved. code:27727', '0000-00-00 00:00:00'),
(109, 2, 'stage', 'projects', 5, 'project state updated to 2', NULL, '0000-00-00 00:00:00'),
(110, 1, 'Request', 'projects', 10, '{"user_id":"1","department_id":"","hotel_id":"3","type_id":"1","origin_id":3,"name":"hgfds","reasons":"dd","EUR_EX":"3.3","USD_EX":"8.8","budget_EGP":"","budget_USD":"","budget_EUR":"","budget":"0","remarks":"","state_id":0}', 'user created project approval request', '2015-12-31 08:22:56'),
(111, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:22:56'),
(112, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:22:56'),
(113, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:22:56'),
(114, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:22:56'),
(115, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:22:57'),
(116, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:22:57'),
(117, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:22:57'),
(118, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:22:57'),
(119, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:22:57'),
(120, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:22:57'),
(121, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:22:57'),
(122, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:22:57'),
(123, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:22:57'),
(124, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:22:57'),
(125, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:22:57'),
(126, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:22:57'),
(127, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:22:57'),
(128, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:22:57'),
(129, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:22:57'),
(130, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:22:57'),
(131, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:22:57'),
(132, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:22:57'),
(133, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:22:57'),
(134, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:22:57'),
(135, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:22:57'),
(136, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:22:57'),
(137, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:22:58'),
(138, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:22:58'),
(139, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:22:58'),
(140, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:22:58'),
(141, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:22:58'),
(142, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:22:58'),
(143, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:22:58'),
(144, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:22:58'),
(145, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:22:58'),
(146, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:22:58'),
(147, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:22:58'),
(148, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:22:58'),
(149, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:22:58'),
(150, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:22:58'),
(151, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:22:58'),
(152, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:22:58'),
(153, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:22:58'),
(154, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:22:58'),
(155, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:22:58'),
(156, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:22:58'),
(157, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:22:58'),
(158, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:22:58'),
(159, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:22:58'),
(160, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:22:58'),
(161, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:22:59'),
(162, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:22:59'),
(163, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:22:59'),
(164, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:22:59'),
(165, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:22:59'),
(166, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:22:59'),
(167, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:22:59'),
(168, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:22:59'),
(169, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:22:59'),
(170, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:22:59'),
(171, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:22:59'),
(172, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:22:59'),
(173, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:22:59'),
(174, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:22:59'),
(175, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:22:59'),
(176, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:22:59'),
(177, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:22:59'),
(178, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:22:59'),
(179, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:22:59'),
(180, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:00'),
(181, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:00'),
(182, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:00'),
(183, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:00'),
(184, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:00'),
(185, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:00'),
(186, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:00'),
(187, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:00'),
(188, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:00'),
(189, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:00'),
(190, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:00'),
(191, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:00'),
(192, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:00'),
(193, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:05'),
(194, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:05'),
(195, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:05'),
(196, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:05'),
(197, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:05'),
(198, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:05'),
(199, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:05'),
(200, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:05'),
(201, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:05'),
(202, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:05'),
(203, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:05'),
(204, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:05'),
(205, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:06'),
(206, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:06'),
(207, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:06'),
(208, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:06'),
(209, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:06'),
(210, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:06'),
(211, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:06'),
(212, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:07'),
(213, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:07'),
(214, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:07'),
(215, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:07'),
(216, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:07'),
(217, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:07'),
(218, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:07'),
(219, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:07'),
(220, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:07'),
(221, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:07'),
(222, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:07'),
(223, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:07'),
(224, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:07'),
(225, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:07'),
(226, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:07'),
(227, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:07'),
(228, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:07'),
(229, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:07'),
(230, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:08'),
(231, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:08'),
(232, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:08'),
(233, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:08'),
(234, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:08'),
(235, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:38'),
(236, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:38'),
(237, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:38'),
(238, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:38'),
(239, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:38'),
(240, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:38'),
(241, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:39'),
(242, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:39'),
(243, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:39'),
(244, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:39'),
(245, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:39'),
(246, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:39'),
(247, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:39'),
(248, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:39'),
(249, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:39'),
(250, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:39'),
(251, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:39'),
(252, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:39'),
(253, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:39'),
(254, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:39'),
(255, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:39'),
(256, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:39'),
(257, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:39'),
(258, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:39'),
(259, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:39'),
(260, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:39'),
(261, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:39'),
(262, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:39'),
(263, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:40'),
(264, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:40'),
(265, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:40'),
(266, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:40'),
(267, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:40'),
(268, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:40'),
(269, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:40'),
(270, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:40'),
(271, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:40'),
(272, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:40'),
(273, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:40'),
(274, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:40'),
(275, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:23:40'),
(276, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:23:40'),
(277, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:24:40'),
(278, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:24:40'),
(279, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:24:40'),
(280, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:24:40'),
(281, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:24:40'),
(282, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:24:40'),
(283, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:24:40'),
(284, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:24:40'),
(285, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:24:40'),
(286, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:24:40'),
(287, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:24:40'),
(288, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:24:41'),
(289, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:24:41'),
(290, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:24:41'),
(291, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:24:41'),
(292, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:24:41'),
(293, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:24:41'),
(294, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:24:41'),
(295, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:24:41'),
(296, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:24:41'),
(297, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:24:41'),
(298, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:24:41'),
(299, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:24:41'),
(300, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:24:41'),
(301, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:24:41'),
(302, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:24:41'),
(303, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:24:41'),
(304, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:24:41'),
(305, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:24:41'),
(306, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:24:41'),
(307, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:24:41'),
(308, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:24:41'),
(309, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:24:41'),
(310, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:24:41'),
(311, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:24:41'),
(312, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:24:41'),
(313, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:24:41'),
(314, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:24:42'),
(315, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:24:42'),
(316, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:24:42'),
(317, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:24:42'),
(318, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:24:42'),
(319, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:29:42'),
(320, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:29:42'),
(321, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:29:42'),
(322, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:29:42'),
(323, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:29:42'),
(324, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:29:42'),
(325, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:29:42'),
(326, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:29:42'),
(327, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:29:42'),
(328, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:29:42'),
(329, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:29:42'),
(330, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:29:42'),
(331, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:29:42'),
(332, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:29:42'),
(333, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:29:42'),
(334, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:29:43'),
(335, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:29:43'),
(336, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:29:43'),
(337, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:29:43'),
(338, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:29:43'),
(339, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:29:43'),
(340, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:29:43'),
(341, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:29:43'),
(342, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:29:43'),
(343, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:29:43'),
(344, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:29:43'),
(345, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:29:43'),
(346, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:29:43'),
(347, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:29:43'),
(348, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:29:43'),
(349, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:29:43'),
(350, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:29:43'),
(351, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:29:43'),
(352, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:29:43'),
(353, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:29:43'),
(354, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:29:43'),
(355, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:29:43'),
(356, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:29:43'),
(357, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:29:43'),
(358, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:29:43'),
(359, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:29:43'),
(360, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:29:44'),
(361, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:31:48'),
(362, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:31:48'),
(363, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:31:48'),
(364, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:31:48'),
(365, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:31:48'),
(366, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:31:48'),
(367, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:31:49'),
(368, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:31:49'),
(369, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:31:49'),
(370, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:31:49'),
(371, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:31:49'),
(372, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:31:49'),
(373, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:31:49'),
(374, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:31:49'),
(375, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:31:49'),
(376, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:31:49'),
(377, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:31:49'),
(378, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:31:49'),
(379, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:31:49'),
(380, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:31:49'),
(381, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:31:49'),
(382, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:31:49'),
(383, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:31:49'),
(384, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:31:49'),
(385, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:31:49'),
(386, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:31:49'),
(387, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:31:49'),
(388, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:31:49'),
(389, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:31:49'),
(390, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:31:49'),
(391, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:31:50'),
(392, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:31:50'),
(393, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:31:50'),
(394, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:31:50'),
(395, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:31:50'),
(396, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:31:50'),
(397, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:31:50'),
(398, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:31:50'),
(399, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:31:50'),
(400, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:31:50'),
(401, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:31:50'),
(402, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:31:50'),
(403, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:41:50'),
(404, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:41:50'),
(405, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:41:50'),
(406, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:41:50'),
(407, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:41:50'),
(408, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:41:50'),
(409, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:41:51'),
(410, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:41:51'),
(411, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:41:51'),
(412, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:41:51'),
(413, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:41:51'),
(414, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:41:51'),
(415, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:41:51'),
(416, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:41:51'),
(417, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:41:51'),
(418, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:41:51'),
(419, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:41:51'),
(420, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:41:51'),
(421, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:41:51'),
(422, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:41:51'),
(423, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:41:51'),
(424, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:41:51'),
(425, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:41:51'),
(426, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:41:51'),
(427, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:41:51'),
(428, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:41:51'),
(429, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:41:51'),
(430, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:41:51'),
(431, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:41:51'),
(432, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:41:51'),
(433, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:41:52'),
(434, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:41:52'),
(435, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:41:52'),
(436, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:41:52'),
(437, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:41:52'),
(438, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:41:52'),
(439, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:41:52'),
(440, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:41:52'),
(441, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:41:52'),
(442, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:41:52'),
(443, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 08:41:52'),
(444, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 08:41:52'),
(445, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:47'),
(446, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:47'),
(447, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:47'),
(448, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:47'),
(449, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:47'),
(450, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:47'),
(451, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:47'),
(452, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:47'),
(453, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:47'),
(454, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:47'),
(455, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:47'),
(456, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:47'),
(457, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:47'),
(458, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:47'),
(459, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:47'),
(460, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:48'),
(461, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:48'),
(462, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:48'),
(463, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:48'),
(464, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:48'),
(465, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:48'),
(466, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:48'),
(467, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:48'),
(468, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:48'),
(469, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:48'),
(470, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:48'),
(471, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:48'),
(472, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:48'),
(473, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:48'),
(474, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:48'),
(475, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:48'),
(476, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:48'),
(477, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:48'),
(478, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:48'),
(479, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:48'),
(480, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:48'),
(481, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:49'),
(482, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:49'),
(483, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:49'),
(484, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:49'),
(485, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:49'),
(486, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:49'),
(487, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:50'),
(488, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:50'),
(489, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:50'),
(490, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:50'),
(491, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:50'),
(492, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:50'),
(493, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:50'),
(494, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:50'),
(495, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:50'),
(496, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:50'),
(497, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:50'),
(498, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:50'),
(499, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:50'),
(500, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:50'),
(501, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:51'),
(502, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:51'),
(503, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:51'),
(504, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:51'),
(505, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:51'),
(506, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:51'),
(507, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:51'),
(508, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:51'),
(509, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:51'),
(510, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:51'),
(511, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:51'),
(512, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:51'),
(513, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:51'),
(514, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:51'),
(515, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:51'),
(516, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:51'),
(517, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:51'),
(518, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:51'),
(519, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:51'),
(520, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:51'),
(521, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:51'),
(522, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:51'),
(523, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:51'),
(524, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:51'),
(525, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:45:51'),
(526, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:45:52'),
(527, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:49:57'),
(528, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:49:57'),
(529, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:49:57'),
(530, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:49:57'),
(531, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:49:57'),
(532, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:49:57'),
(533, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:49:57'),
(534, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:49:57'),
(535, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:49:57'),
(536, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:49:57'),
(537, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:49:57'),
(538, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:49:57'),
(539, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:49:57');
INSERT INTO `log` (`id`, `user_id`, `action`, `target`, `target_id`, `data`, `comments`, `log_time`) VALUES
(540, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:49:57'),
(541, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:49:57'),
(542, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:49:58'),
(543, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:49:58'),
(544, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:49:58'),
(545, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:49:58'),
(546, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:49:58'),
(547, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:49:58'),
(548, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:49:58'),
(549, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:49:58'),
(550, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:49:58'),
(551, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:49:58'),
(552, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:49:58'),
(553, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:49:58'),
(554, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:49:58'),
(555, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:49:58'),
(556, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:49:58'),
(557, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:49:58'),
(558, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:49:58'),
(559, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:49:58'),
(560, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:49:58'),
(561, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:49:58'),
(562, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:49:58'),
(563, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:49:58'),
(564, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:49:58'),
(565, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:49:58'),
(566, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:49:58'),
(567, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:49:59'),
(568, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:49:59'),
(569, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:04'),
(570, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:04'),
(571, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:04'),
(572, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:04'),
(573, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:04'),
(574, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:04'),
(575, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:04'),
(576, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:04'),
(577, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:04'),
(578, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:04'),
(579, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:04'),
(580, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:04'),
(581, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:04'),
(582, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:04'),
(583, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:04'),
(584, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:04'),
(585, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:04'),
(586, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:05'),
(587, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:05'),
(588, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:05'),
(589, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:05'),
(590, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:05'),
(591, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:05'),
(592, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:05'),
(593, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:05'),
(594, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:05'),
(595, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:05'),
(596, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:05'),
(597, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:05'),
(598, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:05'),
(599, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:05'),
(600, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:05'),
(601, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:05'),
(602, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:05'),
(603, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:05'),
(604, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:05'),
(605, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:05'),
(606, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:05'),
(607, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:05'),
(608, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:05'),
(609, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:05'),
(610, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:05'),
(611, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:36'),
(612, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:36'),
(613, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:36'),
(614, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:36'),
(615, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:36'),
(616, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:36'),
(617, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:36'),
(618, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:36'),
(619, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:36'),
(620, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:36'),
(621, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:36'),
(622, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:36'),
(623, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:36'),
(624, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:36'),
(625, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:36'),
(626, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:36'),
(627, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:36'),
(628, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:36'),
(629, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:36'),
(630, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:36'),
(631, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:37'),
(632, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:37'),
(633, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:37'),
(634, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:37'),
(635, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:37'),
(636, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:37'),
(637, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:37'),
(638, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:37'),
(639, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:37'),
(640, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:37'),
(641, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:37'),
(642, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:37'),
(643, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:37'),
(644, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:37'),
(645, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:37'),
(646, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:37'),
(647, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:37'),
(648, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:37'),
(649, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:37'),
(650, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:37'),
(651, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:38'),
(652, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:38'),
(653, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:47'),
(654, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:47'),
(655, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:47'),
(656, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:47'),
(657, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:47'),
(658, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:48'),
(659, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:48'),
(660, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:48'),
(661, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:48'),
(662, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:48'),
(663, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:48'),
(664, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:48'),
(665, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:48'),
(666, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:48'),
(667, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:48'),
(668, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:48'),
(669, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:48'),
(670, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:48'),
(671, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:48'),
(672, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:48'),
(673, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:48'),
(674, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:48'),
(675, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:48'),
(676, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:48'),
(677, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:48'),
(678, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:48'),
(679, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:48'),
(680, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:48'),
(681, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:48'),
(682, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:48'),
(683, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:49'),
(684, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:49'),
(685, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:49'),
(686, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:49'),
(687, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:49'),
(688, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:49'),
(689, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:49'),
(690, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:49'),
(691, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:49'),
(692, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:49'),
(693, 1, 'Approve', 'projects', 10, NULL, 'user self approved', '2015-12-31 12:50:49'),
(694, 1, 'Stage', 'projects', 10, '{"state":1}', 'project state updated', '2015-12-31 12:50:49'),
(695, 1, 'Notify', 'projects', 10, '{"to":"marwan.gendy@sunrise-resorts.com"}', 'user requested approval', '2015-12-31 12:56:20'),
(696, 1, 'Notify', 'projects', 10, '{"to":"marwan.gendy@sunrise-resorts.com"}', 'user requested approval', '2015-12-31 12:56:20'),
(697, 1, 'Approve', 'projects', 10, '{"approval_id":"15"}', 'user signed approval', '2015-12-31 12:56:35'),
(698, 1, 'Notify', 'projects', 10, '{"to":"marwan.gendy@sunrise-resorts.com"}', 'user requested approval', '2015-12-31 12:56:35'),
(699, 1, 'Request', 'projects', 11, '{"user_id":"1","department_id":"7","hotel_id":"3","type_id":"2","origin_id":3,"name":"hgfds","reasons":"qewq","EUR_EX":"6.6","USD_EX":"4.4","budget_EGP":"1000000","budget_USD":"","budget_EUR":"","budget":"1000000","remarks":"","state_id":0}', 'user created project approval request', '2015-12-31 13:00:06'),
(700, 1, 'Approve', 'projects', 11, NULL, 'user self approved', '2015-12-31 13:00:06'),
(701, 1, 'Stage', 'projects', 11, '{"state":1}', 'project state updated', '2015-12-31 13:00:06'),
(702, 1, 'Notify', 'projects', 11, '{"to":"marwan.gendy@sunrise-resorts.com"}', 'user requested approval', '2015-12-31 13:00:06'),
(703, 1, 'Notify', 'projects', 11, '{"to":"marwan.gendy@sunrise-resorts.com"}', 'user requested approval', '2015-12-31 13:00:06'),
(704, 1, 'Request', 'projects', 12, '{"user_id":"1","department_id":"7","hotel_id":"3","type_id":"2","origin_id":3,"name":"kkk","reasons":"yky","EUR_EX":"7.7","USD_EX":"5.5","budget_EGP":"","budget_USD":"","budget_EUR":"","budget":"0","remarks":"","state_id":0}', 'user created project approval request', '2015-12-31 13:00:36'),
(705, 1, 'Approve', 'projects', 12, NULL, 'user self approved', '2015-12-31 13:00:36'),
(706, 1, 'Stage', 'projects', 12, '{"state":1}', 'project state updated', '2015-12-31 13:00:36'),
(707, 1, 'Notify', 'projects', 12, '{"to":"marwan.gendy@sunrise-resorts.com"}', 'user requested approval', '2015-12-31 13:00:37'),
(708, 1, 'Notify', 'projects', 12, '{"to":"marwan.gendy@sunrise-resorts.com"}', 'user requested approval', '2015-12-31 13:00:37'),
(709, 1, 'Approve', 'projects', 12, '{"approval_id":"23"}', 'user signed approval', '2015-12-31 13:00:57'),
(710, 1, 'Notify', 'projects', 12, '{"to":"marwan.gendy@sunrise-resorts.com"}', 'user requested approval', '2015-12-31 13:00:57'),
(711, 3, 'Approve', 'projects', 12, '{"approval_id":"24"}', 'user signed approval', '2015-12-31 13:01:27'),
(712, 3, 'Notify', 'projects', 12, '{"to":"marwan.gendy@sunrise-resorts.com","code":"CDE3C"}', 'code exists => approved. else disapproved', '2015-12-31 13:01:28'),
(713, 3, 'Stage', 'projects', 12, '{"state":2}', 'project state updated', '2015-12-31 13:01:28'),
(714, 3, 'Submit', 'projects', 12, '{"user_id":"3","scope":"jhgfds","cost":"","cost_EGP":"","cost_USD":"","cost_EUR":"","start":"2015-12-16","end":"2016-01-07","year":"2016","remarks":"","state_id":3}', 'user created project (unplanned)', '2015-12-31 13:19:57'),
(715, 3, 'Sign', 'projects', 12, NULL, 'user self signed', '2015-12-31 13:19:57'),
(716, 3, 'Stage', 'projects', 12, '{"state":"Purchasing"}', 'project state updated, purchasing should be notified', '2015-12-31 13:19:57'),
(717, 3, 'Edit', 'projects', 12, '{"scope":"jhgfdsf","name":"kkkuy","type_id":"3","reasons":"gyky","cost_EGP":"0","cost_USD":"0","cost_EUR":"0","cost":"0","start":"2015-12-16","end":"2016-01-07","remarks":"","suppliers":["5"]}', 'user edited project, signature modified', '2015-12-31 13:25:12'),
(718, 1, 'Purchasing_Edit', 'projects', 12, '{"cost":"5510000","cost_EGP":"010000","cost_USD":"01000000","cost_EUR":"0","state_id":4,"suppliers":["5","7","8"]}', 'Purchasing employee visited this project, State updated to 4, signature updated accordingly', '2015-12-31 13:28:40'),
(719, 1, 'Notify', 'projects', 12, '{"to":null}', 'Project signature notification sent', '2015-12-31 13:28:40'),
(720, 1, 'Notify', 'projects', 12, '{"to":null}', 'Project signature notification sent', '2015-12-31 13:28:40'),
(721, 123, 'Reject', 'projects', 12, '{"signature_id":"49"}', 'user rejected project', '2016-01-02 07:37:51'),
(722, 123, 'Stage', 'projects', 12, '{"state_id":12}', 'project state updated', '2016-01-02 07:37:51'),
(723, 123, 'Undo', 'projects', 12, '{"signature_id":"49"}', 'user unsigned project', '2016-01-02 08:35:24'),
(724, 123, 'Stage', 'projects', 12, '{"state_id":4}', 'project state forced', '2016-01-02 08:35:24'),
(725, 123, 'Reject', 'projects', 12, '{"signature_id":"49"}', 'user rejected project', '2016-01-02 08:35:26'),
(726, 123, 'Stage', 'projects', 12, '{"state_id":12}', 'project state updated', '2016-01-02 08:35:26'),
(727, 123, 'Undo', 'projects', 12, '{"signature_id":"49"}', 'user unsigned project', '2016-01-02 08:35:27'),
(728, 123, 'Stage', 'projects', 12, '{"state_id":4}', 'project state forced', '2016-01-02 08:35:27'),
(729, 123, 'Reject', 'projects', 12, '{"signature_id":"49"}', 'user rejected project', '2016-01-02 08:36:12'),
(730, 123, 'Stage', 'projects', 12, '{"state_id":12}', 'project state updated', '2016-01-02 08:36:12'),
(731, 123, 'Undo', 'projects', 12, '{"signature_id":"49"}', 'user unsigned project', '2016-01-02 08:36:19'),
(732, 123, 'Stage', 'projects', 12, '{"state_id":4}', 'project state forced', '2016-01-02 08:36:19'),
(733, 123, 'Sign', 'projects', 12, '{"signature_id":"49"}', 'user signed project', '2016-01-02 08:36:29'),
(734, 123, 'Notify', 'projects', 12, '{"to":null}', 'Project signature notification sent', '2016-01-02 08:36:29'),
(735, 83, 'Sign', 'projects', 12, '{"signature_id":"50"}', 'user signed project', '2016-01-02 08:38:17'),
(736, 83, 'Notify', 'projects', 12, '{"to":null}', 'Project signature notification sent', '2016-01-02 08:38:17'),
(737, 3, 'Sign', 'projects', 12, '{"signature_id":"62"}', 'user signed project', '2016-01-02 08:38:26'),
(738, 3, 'Notify', 'projects', 12, '{"to":null}', 'Project signature notification sent', '2016-01-02 08:38:26'),
(739, 2, 'Sign', 'projects', 12, '{"signature_id":"64"}', 'user signed project', '2016-01-02 08:38:53'),
(740, 2, 'Stage', 'projects', 12, '{"state":"Approved"}', 'project state updated, owner notified', '2016-01-02 08:38:53'),
(741, 1, 'Offer', 'projects', 0, '{"offer_name":"The-Strategic-Marketing-Process-eBook.pdf"}', 'user uploaded an offer', '2016-01-02 09:05:59'),
(742, 1, 'Planned', 'projects', 13, '{"user_id":"1","department_id":"4","hotel_id":"14","type_id":"1","origin_id":2,"name":"test5","reasons":"test","EUR_EX":"","USD_EX":"","budget":"91750.00","budget_EGP":false,"budget_USD":false,"budget_EUR":false,"code":"A73F3","scope":"test","cost":"10000","cost_EGP":"10000","cost_USD":"","cost_EUR":"","start":"2016-01-02","end":"2016-01-15","year":"2016","remarks":"test","state_id":3,"suppliers":["5"]}', 'user created project (planned)', '2016-01-02 09:06:07'),
(743, 1, 'Sign', 'projects', 13, NULL, 'user self signed', '2016-01-02 09:06:07'),
(744, 1, 'Stage', 'projects', 13, '{"state":"Purchasing"}', 'project state updated, purchasing should be notified', '2016-01-02 09:06:07'),
(745, 1, 'Sign', 'projects', 13, '{"signature_id":"66"}', 'user signed project', '2016-01-02 09:16:22'),
(746, 1, 'Undo', 'projects', 13, '{"signature_id":"66"}', 'user unsigned project', '2016-01-02 09:16:25'),
(747, 1, 'Stage', 'projects', 13, '{"state_id":4}', 'project state forced', '2016-01-02 09:16:25'),
(748, 1, 'Sign', 'projects', 13, '{"signature_id":"66"}', 'user signed project', '2016-01-02 09:17:02'),
(749, 1, 'Undo', 'projects', 13, '{"signature_id":"66"}', 'user unsigned project', '2016-01-02 09:17:40'),
(750, 1, 'Stage', 'projects', 13, '{"state_id":4}', 'project state forced', '2016-01-02 09:17:40'),
(751, 1, 'Reject', 'projects', 13, '{"signature_id":"66"}', 'user rejected project', '2016-01-02 09:17:42'),
(752, 1, 'Stage', 'projects', 13, '{"state_id":12}', 'project state updated', '2016-01-02 09:17:42'),
(753, 1, 'Undo', 'projects', 13, '{"signature_id":"66"}', 'user unsigned project', '2016-01-02 09:18:24'),
(754, 1, 'Stage', 'projects', 13, '{"state_id":4}', 'project state forced', '2016-01-02 09:18:24'),
(755, 1, 'Sign', 'projects', 13, '{"signature_id":"66"}', 'user signed project', '2016-01-02 09:18:26'),
(756, 1, 'Sign', 'projects', 13, '{"signature_id":"67"}', 'user signed project', '2016-01-02 09:18:55'),
(757, 1, 'Sign', 'projects', 13, '{"signature_id":"68"}', 'user signed project', '2016-01-02 09:19:59'),
(758, 1, 'Sign', 'projects', 13, '{"signature_id":"69"}', 'user signed project', '2016-01-02 09:21:13'),
(759, 1, 'Sign', 'projects', 13, '{"signature_id":"70"}', 'user signed project', '2016-01-02 09:21:33'),
(760, 1, 'Stage', 'projects', 13, '{"state":"Approved"}', 'project state updated, owner notified', '2016-01-02 09:21:33'),
(761, 1, 'Request', 'projects', 14, '{"user_id":"1","department_id":"4","hotel_id":"1","type_id":"1","origin_id":3,"name":"test6","reasons":"test","EUR_EX":"8.43","USD_EX":"8.00","budget_EGP":"1000","budget_USD":"","budget_EUR":"","budget":"1000","remarks":"tes","state_id":0}', 'user created project approval request', '2016-01-02 09:46:48'),
(762, 1, 'Approve', 'projects', 14, NULL, 'user self approved', '2016-01-02 09:46:48'),
(763, 1, 'Stage', 'projects', 14, '{"state":1}', 'project state updated', '2016-01-02 09:46:49'),
(764, 1, 'Notify', 'projects', 14, '{"to":"marwan.gendy@sunrise-resorts.com"}', 'user requested approval', '2016-01-02 09:46:49'),
(765, 1, 'Notify', 'projects', 14, '{"to":"marwan.gendy@sunrise-resorts.com"}', 'user requested approval', '2016-01-02 09:46:49'),
(766, 1, 'Approve', 'projects', 14, '{"approval_id":"26"}', 'user signed approval', '2016-01-02 09:48:38'),
(767, 1, 'Notify', 'projects', 14, '{"to":"marwan.gendy@sunrise-resorts.com"}', 'user requested approval', '2016-01-02 09:48:38'),
(768, 1, 'Approve', 'projects', 14, '{"approval_id":"27"}', 'user signed approval', '2016-01-02 09:49:00'),
(769, 1, 'Notify', 'projects', 14, '{"to":"marwan.gendy@sunrise-resorts.com","code":"CF898"}', 'code exists => approved. else disapproved', '2016-01-02 09:49:00'),
(770, 1, 'Stage', 'projects', 14, '{"state":2}', 'project state updated', '2016-01-02 09:49:00'),
(771, 1, 'Edit', 'projects', 9, '{"scope":"sdf","name":"edf","type_id":"2","reasons":"sdfsdf","cost_EGP":"50000","cost_USD":"0","cost_EUR":"0","cost":"50000","start":"2015-12-01","end":"2015-12-31","remarks":"","suppliers":false}', 'user edited project, signature modified', '2016-01-05 12:29:35'),
(772, 1, 'Notify', 'projects', 9, '{"to":null}', 'Project signature notification sent', '2016-01-05 12:29:36'),
(773, 1, 'Edit', 'projects', 9, '{"scope":"sdf","name":"edf","type_id":"2","reasons":"sdfsdf","cost_EGP":"50000","cost_USD":"0","cost_EUR":"0","cost":"50000","start":"2015-12-01","end":"2015-12-31","remarks":"","suppliers":false}', 'user edited project, signature modified', '2016-01-05 12:32:13'),
(774, 1, 'Notify', 'projects', 9, '{"to":null}', 'Project signature notification sent', '2016-01-05 12:32:13'),
(775, 83, 'Reject', 'projects', 6, '{"signature_id":"16"}', 'user rejected project', '2016-01-05 12:34:12'),
(776, 83, 'Stage', 'projects', 6, '{"state_id":12}', 'project state updated', '2016-01-05 12:34:12'),
(777, 83, 'Undo', 'projects', 6, '{"signature_id":"16"}', 'user unsigned project', '2016-01-05 12:57:28'),
(778, 83, 'Stage', 'projects', 6, '{"state_id":4}', 'project state forced', '2016-01-05 12:57:29'),
(779, 83, 'Reject', 'projects', 6, '{"signature_id":"16"}', 'user rejected project', '2016-01-05 12:57:31'),
(780, 83, 'Stage', 'projects', 6, '{"state_id":12}', 'project state updated', '2016-01-05 12:57:31'),
(781, 83, 'Undo', 'projects', 6, '{"signature_id":"16"}', 'user unsigned project', '2016-01-05 12:58:52'),
(782, 83, 'Stage', 'projects', 6, '{"state_id":4}', 'project state forced', '2016-01-05 12:58:52'),
(783, 83, 'Reject', 'projects', 6, '{"signature_id":"16"}', 'user rejected project', '2016-01-05 12:58:54'),
(784, 83, 'Stage', 'projects', 6, '{"state_id":12}', 'project state updated', '2016-01-05 12:58:54'),
(785, 83, 'Notify', 'projects', 6, '{"to":null}', 'Project signature notification sent', '2016-01-05 12:58:55'),
(786, 1, 'Request', 'projects', 15, '{"user_id":"1","department_id":"3","hotel_id":"11","type_id":"2","origin_id":3,"name":"gfds","reasons":"qdq","EUR_EX":"","USD_EX":"","budget_EGP":"1000000000000","budget_USD":"","budget_EUR":"","budget":"1000000000000","remarks":"","state_id":0}', 'user created project approval request', '2016-01-06 14:58:20'),
(787, 1, 'Approve', 'projects', 15, NULL, 'user self approved', '2016-01-06 14:58:20'),
(788, 1, 'Stage', 'projects', 15, '{"state":1}', 'project state updated', '2016-01-06 14:58:20'),
(789, 1, 'Notify', 'projects', 15, '{"to":"marwan.gendy@sunrise-resorts.com"}', 'user requested approval', '2016-01-06 14:58:21'),
(790, 1, 'Notify', 'projects', 15, '{"to":"marwan.gendy@sunrise-resorts.com"}', 'user requested approval', '2016-01-06 14:58:21'),
(791, 1, 'Request', 'projects', 16, '{"user_id":"1","department_id":"5","hotel_id":"12","type_id":"2","origin_id":3,"name":"5rew","reasons":"54","EUR_EX":"","USD_EX":"","budget_EGP":"30000","budget_USD":"","budget_EUR":"","budget":"30000","remarks":"","state_id":0}', 'user created project approval request', '2016-01-06 14:58:40'),
(792, 1, 'Approve', 'projects', 16, NULL, 'user self approved', '2016-01-06 14:58:40'),
(793, 1, 'Stage', 'projects', 16, '{"state":1}', 'project state updated', '2016-01-06 14:58:41'),
(794, 1, 'Notify', 'projects', 16, '{"to":"marwan.gendy@sunrise-resorts.com"}', 'user requested approval', '2016-01-06 14:58:41'),
(795, 1, 'Notify', 'projects', 16, '{"to":"marwan.gendy@sunrise-resorts.com"}', 'user requested approval', '2016-01-06 14:58:41'),
(796, 1, 'Request', 'projects', 17, '{"user_id":"1","department_id":"6","hotel_id":"19","type_id":"2","origin_id":3,"name":"er","reasons":"er","EUR_EX":"","USD_EX":"","budget_EGP":"30001","budget_USD":"","budget_EUR":"","budget":"30001","remarks":"","state_id":0}', 'user created project approval request', '2016-01-06 14:59:04'),
(797, 1, 'Approve', 'projects', 17, NULL, 'user self approved', '2016-01-06 14:59:04'),
(798, 1, 'Stage', 'projects', 17, '{"state":1}', 'project state updated', '2016-01-06 14:59:04'),
(799, 1, 'Notify', 'projects', 17, '{"to":"marwan.gendy@sunrise-resorts.com","code":"E6D9E"}', 'code exists => approved. else disapproved', '2016-01-06 14:59:04'),
(800, 1, 'Stage', 'projects', 17, '{"state":2}', 'project state updated', '2016-01-06 14:59:04'),
(801, 1, 'Request', 'projects', 18, '{"user_id":"1","department_id":"4","hotel_id":"10","type_id":"3","origin_id":3,"name":"dtgh","reasons":"ssere","EUR_EX":"","USD_EX":"","budget_EGP":"30001","budget_USD":"","budget_EUR":"","budget":"30001","remarks":"","state_id":0}', 'user created project approval request', '2016-01-06 15:00:08'),
(802, 1, 'Approve', 'projects', 18, NULL, 'user self approved', '2016-01-06 15:00:08'),
(803, 1, 'Stage', 'projects', 18, '{"state":1}', 'project state updated', '2016-01-06 15:00:08'),
(804, 1, 'Notify', 'projects', 18, '{"to":"marwan.gendy@sunrise-resorts.com"}', 'user requested approval', '2016-01-06 15:00:08'),
(805, 1, 'Notify', 'projects', 18, '{"to":"marwan.gendy@sunrise-resorts.com"}', 'user requested approval', '2016-01-06 15:00:08'),
(806, 1, 'Request', 'projects', 19, '{"user_id":"1","department_id":"3","hotel_id":"8","type_id":"1","origin_id":3,"name":"sss","reasons":"www","EUR_EX":"","USD_EX":"","budget_EGP":"30001","budget_USD":"","budget_EUR":"","budget":"30001","remarks":"","state_id":0}', 'user created project approval request', '2016-01-06 15:18:04'),
(807, 1, 'Approve', 'projects', 19, NULL, 'user self approved', '2016-01-06 15:18:05'),
(808, 1, 'Stage', 'projects', 19, '{"state":1}', 'project state updated', '2016-01-06 15:18:05'),
(809, 1, 'Notify', 'projects', 19, '{"to":"marwan.gendy@sunrise-resorts.com"}', 'user requested approval', '2016-01-06 15:18:05'),
(810, 1, 'Notify', 'projects', 19, '{"to":"marwan.gendy@sunrise-resorts.com"}', 'user requested approval', '2016-01-06 15:18:05'),
(811, 1, 'Notify', 'projects', 19, '{"to":"marwan.gendy@sunrise-resorts.com"}', 'user requested approval', '2016-01-06 15:18:05'),
(812, 1, 'Request', 'projects', 20, '{"user_id":"1","department_id":"4","hotel_id":"9","type_id":"1","origin_id":3,"name":"232","reasons":"333","EUR_EX":"","USD_EX":"","budget_EGP":"29999","budget_USD":"","budget_EUR":"","budget":"29999","remarks":"","state_id":0}', 'user created project approval request', '2016-01-06 15:18:29'),
(813, 1, 'Approve', 'projects', 20, NULL, 'user self approved', '2016-01-06 15:18:29'),
(814, 1, 'Stage', 'projects', 20, '{"state":1}', 'project state updated', '2016-01-06 15:18:29'),
(815, 1, 'Notify', 'projects', 20, '{"to":"marwan.gendy@sunrise-resorts.com"}', 'user requested approval', '2016-01-06 15:18:29'),
(816, 1, 'Notify', 'projects', 20, '{"to":"marwan.gendy@sunrise-resorts.com"}', 'user requested approval', '2016-01-06 15:18:29'),
(817, 1, 'Review', 'projects', 13, '{"place":"www","num_of_offers":"","total_cost":"","sup_1":"","sup_2":"","sup_3":"","sup_4":"","sup_5":"","sup_6":"","consultant":"","recommendation":"","balance":"","purchasing_notes":"","financial_notes":"","suppliers":["5"]}', 'Owning company form updated', '2016-01-14 15:29:21'),
(818, 1, 'Review', 'projects', 13, '{"place":"sds","num_of_offers":"","total_cost":"","sup_1":"","sup_2":"","sup_3":"","sup_4":"","sup_5":"","sup_6":"","consultant":"","recommendation":"","balance":"","purchasing_notes":"","financial_notes":"","suppliers":["5"]}', 'Owning company form updated', '2016-01-14 15:29:53'),
(819, 1, 'Review', 'projects', 13, '{"place":"","num_of_offers":"","total_cost":"","sup_1":"","sup_2":"","sup_3":"","sup_4":"","sup_5":"","sup_6":"","consultant":"ddd","recommendation":"","balance":"","purchasing_notes":"","financial_notes":"","suppliers":["5"]}', 'Owning company form updated', '2016-01-14 15:30:41'),
(820, 1, 'Review', 'projects', 13, '{"place":"","num_of_offers":"","total_cost":"","sup_1":"","sup_2":"","sup_3":"","sup_4":"","sup_5":"","sup_6":"","consultant":"ddd","recommendation":"","balance":"","purchasing_notes":"","financial_notes":"","suppliers":["5","6"]}', 'Owning company form updated', '2016-01-14 15:30:49'),
(821, 1, 'Review', 'projects', 13, '{"place":"","num_of_offers":"","total_cost":"","sup_1":"","sup_2":"rr","sup_3":"","sup_4":"","sup_5":"","sup_6":"","consultant":"ddd","recommendation":"","balance":"","purchasing_notes":"","financial_notes":"","suppliers":["5"]}', 'Owning company form updated', '2016-01-14 15:33:17'),
(822, 1, 'Review', 'projects', 13, '{"place":"ewd","num_of_offers":"","total_cost":"","sup_1":"","sup_2":"rr","sup_3":"","sup_4":"","sup_5":"","sup_6":"","consultant":"ddd","recommendation":"","balance":"","purchasing_notes":"","financial_notes":"","suppliers":["5"]}', 'Owning company form updated', '2016-01-16 09:20:20'),
(823, 1, 'Request', 'projects', 21, '{"user_id":"1","department_id":"8","hotel_id":"10","type_id":"1","origin_id":3,"name":"ee","reasons":"rr","EUR_EX":"","USD_EX":"0","budget_EGP":"","budget_USD":"","budget_EUR":"","budget":"0","remarks":"","state_id":0}', 'user created project approval request', '2016-01-17 13:58:58'),
(824, 1, 'Approve', 'projects', 21, NULL, 'user self approved', '2016-01-17 13:58:58'),
(825, 1, 'Stage', 'projects', 21, '{"state":1}', 'project state updated', '2016-01-17 13:58:58'),
(826, 1, 'Notify', 'projects', 21, '{"to":"marwan.gendy@sunrise-resorts.com"}', 'user requested approval', '2016-01-17 13:58:59'),
(827, 1, 'Notify', 'projects', 21, '{"to":"marwan.gendy@sunrise-resorts.com"}', 'user requested approval', '2016-01-17 13:58:59'),
(828, 1, 'Approve', 'projects', 21, '{"approval_id":"51"}', 'user signed approval', '2016-01-17 13:59:04'),
(829, 1, 'Notify', 'projects', 21, '{"to":"marwan.gendy@sunrise-resorts.com"}', 'user requested approval', '2016-01-17 13:59:04'),
(830, 3, 'Approve', 'projects', 21, '{"approval_id":"52"}', 'user signed approval', '2016-01-17 13:59:47'),
(831, 3, 'Notify', 'projects', 21, '{"to":"marwan.gendy@sunrise-resorts.com"}', 'user requested approval', '2016-01-17 13:59:47'),
(832, 55, 'Approve', 'projects', 21, '{"approval_id":"53"}', 'user signed approval', '2016-01-17 14:00:36'),
(833, 55, 'Notify', 'projects', 21, '{"to":"marwan.gendy@sunrise-resorts.com","code":"18310"}', 'code exists => approved. else disapproved', '2016-01-17 14:00:36'),
(834, 55, 'Stage', 'projects', 21, '{"state":2}', 'project state updated', '2016-01-17 14:00:36'),
(835, 55, 'Submit', 'projects', 21, '{"user_id":"55","scope":"ddd","cost":"","cost_EGP":"","cost_USD":"","cost_EUR":"","start":"2016-01-26","end":"2016-02-06","year":"2019","remarks":"","state_id":3,"suppliers":false}', 'user created project (unplanned)', '2016-01-17 14:01:24'),
(836, 55, 'ERROR', 'owning_project', 21, NULL, 'owning form not created, project ID included instead', '2016-01-17 14:02:33'),
(837, 55, 'Submit', 'projects', 21, '{"user_id":"55","scope":"ddd","cost":"","cost_EGP":"","cost_USD":"","cost_EUR":"","start":"2016-01-26","end":"2016-02-06","year":"2019","remarks":"","state_id":3,"suppliers":false}', 'user created project (unplanned)', '2016-01-17 14:03:32'),
(838, 55, 'ERROR', 'owning_project', 21, NULL, 'owning form not created, project ID included instead', '2016-01-17 14:03:32'),
(839, 55, 'Submit', 'projects', 21, '{"user_id":"55","scope":"s","cost":"","cost_EGP":"","cost_USD":"","cost_EUR":"","start":"2016-01-20","end":"2016-01-31","year":"2019","remarks":"","state_id":3,"suppliers":false}', 'user created project (unplanned)', '2016-01-17 14:09:43'),
(840, 55, 'ERROR', 'owning_project', 21, NULL, 'owning form not created, project ID included instead', '2016-01-17 14:09:43'),
(841, 55, 'Submit', 'projects', 21, '{"user_id":"55","scope":"8iuyth","cost":"","cost_EGP":"","cost_USD":"","cost_EUR":"","start":"2016-01-27","end":"2016-01-30","year":"2019","remarks":"","state_id":3,"suppliers":false}', 'user created project (unplanned)', '2016-01-17 14:10:17'),
(842, 55, 'ERROR', 'owning_project', 21, NULL, 'owning form not created, project ID included instead', '2016-01-17 14:10:17'),
(843, 55, 'Submit', 'projects', 21, '{"user_id":"55","scope":"es","cost":"","cost_EGP":"","cost_USD":"","cost_EUR":"","start":"2016-01-26","end":"2016-01-30","year":"2019","remarks":"","state_id":3,"suppliers":false}', 'user created project (unplanned)', '2016-01-17 14:14:49'),
(844, 55, 'ERROR', 'owning_project', 21, NULL, 'owning form not created, project ID included instead', '2016-01-17 14:14:49'),
(845, 55, 'Submit', 'projects', 21, '{"user_id":"55","scope":"x","cost":"0","cost_EGP":"0","cost_USD":"","cost_EUR":"","start":"2016-01-17","end":"2016-02-27","year":"2019","remarks":"","state_id":3,"suppliers":false}', 'user created project (unplanned)', '2016-01-17 14:21:34'),
(846, 55, 'ERROR', 'owning_project', 21, NULL, 'owning form not created, project ID included instead', '2016-01-17 14:21:34'),
(847, 55, 'Submit', 'projects', 21, '{"user_id":"55","scope":"rr","cost":"","cost_EGP":"","cost_USD":"","cost_EUR":"","start":"2016-01-26","end":"2016-02-05","year":"2019","remarks":"","state_id":3,"suppliers":false}', 'user created project (unplanned)', '2016-01-17 14:22:09'),
(848, 55, 'ERROR', 'owning_project', 21, NULL, 'owning form not created, project ID included instead', '2016-01-17 14:22:10'),
(849, 55, 'Submit', 'projects', 21, '{"user_id":"55","scope":"","cost":"","cost_EGP":"","cost_USD":"","cost_EUR":"","start":"2016-01-27","end":"2016-02-04","year":"2019","remarks":"","state_id":3,"suppliers":false}', 'user created project (unplanned)', '2016-01-17 14:27:08'),
(850, 55, 'ERROR', 'owning_project', 21, NULL, 'owning form not created, project ID included instead', '2016-01-17 14:27:09'),
(851, 55, 'Create', 'owning_project', 14, '{"project_id":"21"}', 'owning form created', '2016-01-17 14:46:30'),
(852, 55, 'Submit', 'projects', 21, '{"user_id":"55","scope":"","cost":"","cost_EGP":"","cost_USD":"","cost_EUR":"","start":"2016-01-27","end":"2016-02-04","year":"2019","remarks":"","state_id":3,"suppliers":false}', 'user created project (unplanned)', '2016-01-17 14:47:14'),
(853, 55, 'Create', 'owning_project', 15, '{"project_id":"21"}', 'owning form created', '2016-01-17 14:47:14'),
(854, 55, 'Sign', 'projects', 21, NULL, 'user self signed', '2016-01-17 14:47:14'),
(855, 55, 'Stage', 'projects', 21, '{"state":"Purchasing"}', 'project state updated, purchasing should be notified', '2016-01-17 14:47:14'),
(856, 55, 'Edit', 'projects', 21, '{"scope":"","name":"ee","type_id":"1","reasons":"rr","cost_EGP":"10000000","cost_USD":"1000000","cost_EUR":"0","cost":"10000000","start":"2016-01-27","end":"2016-02-04","remarks":"","suppliers":false}', 'user edited project, signature modified', '2016-01-17 14:48:29'),
(857, 55, 'Notify', 'projects', 21, '{"to":null}', 'Project signature notification sent', '2016-01-17 14:48:29'),
(858, 1, 'Planned', 'projects', 22, '{"user_id":"1","department_id":"2","hotel_id":"14","type_id":"2","origin_id":2,"name":"qweqwe","reasons":"qqqq","EUR_EX":"55","USD_EX":"44","budget":"7000.00","budget_EGP":false,"budget_USD":false,"budget_EUR":false,"code":"0B2CC","scope":"qq","cost":"0","cost_EGP":"","cost_USD":"","cost_EUR":"","start":"2016-01-19","end":"2016-01-23","year":"2016","remarks":"","state_id":3,"suppliers":false}', 'user created project (planned)', '2016-01-17 15:16:27'),
(859, 1, 'Create', 'owning_project', 16, '{"project_id":"22"}', 'owning form created', '2016-01-17 15:16:28'),
(860, 1, 'Sign', 'projects', 22, NULL, 'user self signed', '2016-01-17 15:16:28'),
(861, 1, 'Stage', 'projects', 22, '{"state":"Purchasing"}', 'project state updated, purchasing should be notified', '2016-01-17 15:16:28'),
(862, 1, 'Sign', 'projects', 22, '{"signature_id":"147"}', 'user signed project', '2016-01-17 15:18:17'),
(863, 1, 'Sign', 'projects', 22, '{"signature_id":"148"}', 'user signed project', '2016-01-17 15:18:32'),
(864, 1, 'Sign', 'projects', 22, '{"signature_id":"149"}', 'user signed project', '2016-01-17 15:19:02'),
(865, 1, 'Sign', 'projects', 22, '{"signature_id":"150"}', 'user signed project', '2016-01-17 15:19:12'),
(866, 1, 'Sign', 'projects', 22, '{"signature_id":"151"}', 'user signed project', '2016-01-17 15:19:22'),
(867, 1, 'Edit', 'projects', 22, '{"scope":"qq","name":"qweqwe","type_id":"2","reasons":"qqqq","cost_EGP":"10000000000000000000000000000","cost_USD":"0","cost_EUR":"0","cost":"1e+28","start":"2016-01-19","end":"2016-01-23","remarks":"","suppliers":false}', 'user edited project, signature modified', '2016-01-17 15:19:44'),
(868, 1, 'Notify', 'projects', 22, '{"to":null}', 'Project signature notification sent', '2016-01-17 15:19:44'),
(869, 1, 'Sign', 'projects', 22, '{"signature_id":"152"}', 'user signed project', '2016-01-17 15:19:56'),
(870, 1, 'Undo', 'projects', 22, '{"signature_id":"153"}', 'user unsigned project', '2016-01-17 15:25:11'),
(871, 1, 'Stage', 'projects', 22, '{"state_id":4}', 'project state forced', '2016-01-17 15:25:11'),
(872, 1, 'Sign', 'projects', 22, '{"signature_id":"153"}', 'user signed project', '2016-01-17 15:25:14'),
(873, 1, 'Undo', 'projects', 22, '{"signature_id":"153"}', 'user unsigned project', '2016-01-17 15:25:48'),
(874, 1, 'Stage', 'projects', 22, '{"state_id":4}', 'project state forced', '2016-01-17 15:25:48'),
(875, 1, 'Sign', 'projects', 22, '{"signature_id":"153"}', 'user signed project', '2016-01-17 15:26:01'),
(876, 1, 'Request', 'projects', 23, '{"user_id":"1","department_id":"2","hotel_id":"14","type_id":"1","origin_id":3,"name":"sdasd","reasons":"asas","EUR_EX":"","USD_EX":"","budget_EGP":"1e+30","budget_USD":"","budget_EUR":"","budget":"1e+30","remarks":"","state_id":0}', 'user created project approval request', '2016-01-17 15:33:13'),
(877, 1, 'Approve', 'projects', 23, NULL, 'user self approved', '2016-01-17 15:33:13'),
(878, 1, 'Stage', 'projects', 23, '{"state":1}', 'project state updated', '2016-01-17 15:33:13'),
(879, 1, 'Notify', 'projects', 23, '{"to":"marwan.gendy@sunrise-resorts.com"}', 'user requested approval', '2016-01-17 15:33:13'),
(880, 1, 'Planned', 'projects', 24, '{"user_id":"1","department_id":"2","hotel_id":"14","type_id":"2","origin_id":2,"name":"sss","reasons":"Sss","EUR_EX":"","USD_EX":"-3","budget":"12000.00","budget_EGP":false,"budget_USD":false,"budget_EUR":false,"code":"FF636","scope":"sss","cost":"0","cost_EGP":"","cost_USD":"","cost_EUR":"","start":"2016-01-17","end":"2016-01-17","year":"2016","remarks":"","state_id":3,"suppliers":false}', 'user created project (planned)', '2016-01-17 15:35:39'),
(881, 1, 'Create', 'owning_project', 21, '{"project_id":"24"}', 'owning form created', '2016-01-17 15:37:14'),
(882, 1, 'Sign', 'projects', 24, NULL, 'user self signed', '2016-01-17 15:37:14'),
(883, 1, 'Stage', 'projects', 24, '{"state":"Purchasing"}', 'project state updated, purchasing should be notified', '2016-01-17 15:37:14'),
(884, 1, 'Planned', 'projects', 25, '{"user_id":"1","department_id":"2","hotel_id":"14","type_id":"2","origin_id":2,"name":"sss","reasons":"Sss","EUR_EX":"","USD_EX":"-3","budget":"0.00","budget_EGP":false,"budget_USD":false,"budget_EUR":false,"code":"EB277","scope":"sss","cost":"0","cost_EGP":"","cost_USD":"","cost_EUR":"","start":"2016-01-17","end":"2016-01-17","year":"2016","remarks":"","state_id":3,"suppliers":false}', 'user created project (planned)', '2016-01-17 15:38:54'),
(885, 1, 'Create', 'owning_project', 22, '{"project_id":"25"}', 'owning form created', '2016-01-17 15:38:54'),
(886, 1, 'Create', 'owning_project', 23, '{"project_id":"25"}', 'owning form created', '2016-01-17 15:42:36'),
(887, 1, 'Request', 'projects', 26, '{"user_id":"1","department_id":"6","hotel_id":"14","type_id":"2","origin_id":3,"name":"fr3","reasons":"rf","EUR_EX":"","USD_EX":"","budget_EGP":"54321","budget_USD":"","budget_EUR":"","budget":"54321","remarks":"","state_id":0}', 'user created project approval request', '2016-01-18 13:21:13'),
(888, 1, 'Approve', 'projects', 26, NULL, 'user self approved', '2016-01-18 13:21:13'),
(889, 1, 'Stage', 'projects', 26, '{"state":1}', 'project state updated', '2016-01-18 13:21:13'),
(890, 1, 'Notify', 'projects', 26, '{"to":"marwan.gendy@sunrise-resorts.com"}', 'user requested approval', '2016-01-18 13:21:14'),
(891, 1, 'Create', 'owning_project', 24, '{"project_id":"25"}', 'owning form created', '2016-01-18 13:46:46'),
(892, 1, 'Sign', 'projects', 25, NULL, 'user self signed', '2016-01-18 13:46:46'),
(893, 1, 'Stage', 'projects', 25, '{"state":"Purchasing"}', 'project state updated, purchasing should be notified', '2016-01-18 13:46:46'),
(894, 1, 'Planned', 'projects', 27, '{"user_id":"1","department_id":"2","hotel_id":"5","type_id":"2","origin_id":2,"name":"34rdw","reasons":"rfwsq","EUR_EX":"","USD_EX":"","budget":"3000.00","budget_EGP":false,"budget_USD":false,"budget_EUR":false,"code":"4AE48","scope":"ww","cost":"","cost_EGP":"","cost_USD":"","cost_EUR":"","start":"2016-01-18","end":"2016-01-18","year":"2016","remarks":"","state_id":3,"suppliers":false}', 'user created project (planned)', '2016-01-18 13:58:17'),
(895, 1, 'Create', 'owning_project', 25, '{"project_id":"27"}', 'owning form created', '2016-01-18 13:58:17'),
(896, 1, 'Sign', 'projects', 27, NULL, 'user self signed', '2016-01-18 13:58:17'),
(897, 1, 'Stage', 'projects', 27, '{"state":"Purchasing"}', 'project state updated, purchasing should be notified', '2016-01-18 13:58:18'),
(898, 1, 'Planned', 'projects', 28, '{"user_id":"1","department_id":"2","hotel_id":"5","type_id":"2","origin_id":2,"name":"cxz","reasons":"asddas","EUR_EX":"","USD_EX":"","budget":"1400.00","budget_EGP":false,"budget_USD":false,"budget_EUR":false,"code":"35CD9","scope":"aa","cost":"","cost_EGP":"","cost_USD":"","cost_EUR":"","start":"2016-01-18","end":"2016-01-18","year":"2016","remarks":"","state_id":3,"suppliers":false}', 'user created project (planned)', '2016-01-18 15:52:23'),
(899, 1, 'Create', 'owning_project', 26, '{"project_id":"28"}', 'owning form created', '2016-01-18 15:52:23'),
(900, 1, 'Sign', 'projects', 28, NULL, 'user self signed', '2016-01-18 15:52:23'),
(901, 1, 'Stage', 'projects', 28, '{"state":"Purchasing"}', 'project state updated, purchasing should be notified', '2016-01-18 15:52:23'),
(902, 83, 'Review', 'projects', 22, '{"place":"","num_of_offers":"","total_cost":"","sup_1":"","sup_2":"","sup_3":"","sup_4":"","sup_5":"","sup_6":"","consultant":"","recommendation":"","balance":"","purchasing_notes":"","financial_notes":"","suppliers":false}', 'Owning company form updated', '2016-01-19 12:18:31'),
(903, 83, 'Review', 'projects', 22, '{"place":"","num_of_offers":"","total_cost":"","sup_1":"","sup_2":"","sup_3":"","sup_4":"","sup_5":"","sup_6":"","consultant":"","recommendation":"","balance":"","purchasing_notes":"","financial_notes":"","suppliers":false}', 'Owning company form updated', '2016-01-19 12:18:55'),
(904, 1, 'Planned', 'projects', 29, '{"user_id":"1","department_id":"2","hotel_id":"5","type_id":"2","origin_id":2,"name":"fwdcsxa","reasons":"rfwdcsaz","EUR_EX":"","USD_EX":"","budget":"30000.00","budget_EGP":false,"budget_USD":false,"budget_EUR":false,"code":"77E27","scope":"fgdsa","cost":"","cost_EGP":"","cost_USD":"","cost_EUR":"","start":"2016-01-19","end":"2016-01-19","year":"2016","remarks":"","state_id":3,"suppliers":false}', 'user created project (planned)', '2016-01-19 12:32:25'),
(905, 1, 'Create', 'owning_project', 27, '{"project_id":"29"}', 'owning form created', '2016-01-19 12:32:26'),
(906, 1, 'Sign', 'projects', 29, NULL, 'user self signed', '2016-01-19 12:32:26'),
(907, 1, 'Stage', 'projects', 29, '{"state":"Purchasing"}', 'project state updated, purchasing should be notified', '2016-01-19 12:32:26'),
(908, 1, 'Edit', 'projects', 29, '{"scope":"fgdsa","name":"fwdcsxa","type_id":"2","reasons":"rfwdcsaz","cost_EGP":"010000000000000000000","cost_USD":"0","cost_EUR":"0","cost":"10000000000000000000","start":"2016-01-19","end":"2016-01-19","remarks":"","suppliers":false}', 'user edited project, signature modified', '2016-01-19 12:32:42'),
(909, 1, 'Notify', 'projects', 29, '{"to":null}', 'Project signature notification sent', '2016-01-19 12:32:43'),
(910, 1, 'Planned', 'projects', 30, '{"user_id":"1","department_id":"2","hotel_id":"3","type_id":"3","origin_id":2,"name":"eeee","reasons":"e3e3","EUR_EX":"","USD_EX":"","budget":"7000.00","budget_EGP":false,"budget_USD":false,"budget_EUR":false,"code":"84A98","scope":"3e","cost":"","cost_EGP":"","cost_USD":"","cost_EUR":"","start":"2016-01-19","end":"2016-01-19","year":"2016","remarks":"","state_id":3,"suppliers":false}', 'user created project (planned)', '2016-01-19 13:47:00'),
(911, 1, 'Create', 'owning_project', 28, '{"project_id":"30"}', 'owning form created', '2016-01-19 13:47:00'),
(912, 1, 'Sign', 'projects', 30, NULL, 'user self signed', '2016-01-19 13:47:00'),
(913, 1, 'Stage', 'projects', 30, '{"state":"Purchasing"}', 'project state updated, purchasing should be notified', '2016-01-19 13:47:00'),
(914, 1, 'Edit', 'projects', 30, '{"scope":"3e","name":"eeee","type_id":"3","reasons":"e3e3","cost_EGP":"111111111111111111111111110","cost_USD":"0","cost_EUR":"0","cost":"1.111111111111111e+26","start":"2016-01-19","end":"2016-01-19","remarks":"","suppliers":false}', 'user edited project, signature modified', '2016-01-19 13:48:06'),
(915, 1, 'Notify', 'projects', 30, '{"to":null}', 'Project signature notification sent', '2016-01-19 13:48:24'),
(916, 1, 'Review', 'projects', 26, '{"place":"","num_of_offers":"","total_cost":"","sup_1":"","sup_2":"","sup_3":"","sup_4":"","sup_5":"","sup_6":"","consultant":"","recommendation":"","balance":"","purchasing_notes":"","financial_notes":"","suppliers":false}', 'Owning company form updated', '2016-01-20 09:23:20'),
(917, 1, 'Review', 'projects', 26, '{"place":"","num_of_offers":"","total_cost":"","sup_1":"","sup_2":"","sup_3":"","sup_4":"","sup_5":"","sup_6":"","consultant":"","recommendation":"","balance":"","purchasing_notes":"","financial_notes":"","suppliers":false}', 'Owning company form updated', '2016-01-20 09:23:24');
INSERT INTO `log` (`id`, `user_id`, `action`, `target`, `target_id`, `data`, `comments`, `log_time`) VALUES
(918, 1, 'Review', 'projects', 26, '{"place":"","num_of_offers":"","total_cost":"","sup_1":"","sup_2":"","sup_3":"","sup_4":"","sup_5":"","sup_6":"","consultant":"","recommendation":"","balance":"","purchasing_notes":"","financial_notes":"","suppliers":false}', 'Owning company form updated', '2016-01-20 09:23:28'),
(919, 1, 'Review', 'projects', 26, '{"place":"","num_of_offers":"","total_cost":"","sup_1":"","sup_2":"","sup_3":"","sup_4":"","sup_5":"","sup_6":"","consultant":"","recommendation":"","balance":"","purchasing_notes":"","financial_notes":"","suppliers":false}', 'Owning company form updated', '2016-01-20 09:23:32'),
(920, 1, 'Review', 'projects', 26, '{"place":"","num_of_offers":"","total_cost":"","sup_1":"","sup_2":"","sup_3":"","sup_4":"","sup_5":"","sup_6":"","consultant":"","recommendation":"","balance":"","purchasing_notes":"","financial_notes":"","suppliers":false}', 'Owning company form updated', '2016-01-20 09:25:06'),
(921, 1, 'Review', 'projects', 26, '{"place":"","num_of_offers":"","total_cost":"","sup_1":"","sup_2":"","sup_3":"","sup_4":"","sup_5":"","sup_6":"","consultant":"","recommendation":"","balance":"","purchasing_notes":"","financial_notes":"","suppliers":false}', 'Owning company form updated', '2016-01-20 09:52:15'),
(922, 1, 'Review', 'projects', 26, '{"place":"","num_of_offers":"","total_cost":"","sup_1":"","sup_2":"","sup_3":"","sup_4":"","sup_5":"","sup_6":"","consultant":"","recommendation":"","balance":"","purchasing_notes":"","financial_notes":"","suppliers":false}', 'Owning company form updated', '2016-01-20 09:52:40'),
(923, 1, 'Review', 'projects', 26, '{"place":"","num_of_offers":"","total_cost":"","sup_1":"","sup_2":"","sup_3":"","sup_4":"","sup_5":"","sup_6":"","consultant":"","recommendation":"","balance":"","purchasing_notes":"","financial_notes":"","suppliers":false}', 'Owning company form updated', '2016-01-20 09:54:04'),
(924, 1, 'Sign', 'projects', 30, '{"signature_id":"203"}', 'user signed project', '2016-01-21 12:59:54'),
(925, 1, 'Notify', 'owning_project', 30, '{"to":null}', 'Project owning signature notification sent', '2016-01-21 13:04:26'),
(926, 1, 'Notify', 'owning_project', 30, '{"to":null}', 'Project owning signature notification sent', '2016-01-21 13:04:27'),
(927, 1, 'Notify', 'owning_project', 30, '{"to":null}', 'Project owning signature notification sent', '2016-01-21 13:04:27'),
(928, 1, 'Notify', 'owning_project', 30, '{"to":null}', 'Project owning signature notification sent', '2016-01-21 13:04:28'),
(929, 1, 'Notify', 'owning_project', 30, '{"to":null}', 'Project owning signature notification sent', '2016-01-21 13:04:29'),
(930, 1, 'Notify', 'owning_project', 30, '{"to":null}', 'Project owning signature notification sent', '2016-01-21 13:04:31'),
(931, 1, 'Planned', 'projects', 31, '{"user_id":"1","department_id":"5","hotel_id":"5","type_id":"2","origin_id":2,"name":"3w4","reasons":"33","EUR_EX":"","USD_EX":"","budget":"1000.00","budget_EGP":false,"budget_USD":false,"budget_EUR":false,"code":"8E761","scope":"4","cost":"","cost_EGP":"","cost_USD":"","cost_EUR":"","start":"2016-01-21","end":"2016-01-21","year":"2016","remarks":"","state_id":3,"suppliers":false}', 'user created project (planned)', '2016-01-21 13:08:59'),
(932, 1, 'Create', 'owning_project', 29, '{"project_id":"31"}', 'owning form created', '2016-01-21 13:08:59'),
(933, 1, 'Sign', 'projects', 31, NULL, 'user self signed', '2016-01-21 13:09:01'),
(934, 1, 'Stage', 'projects', 31, '{"state":"Purchasing"}', 'project state updated, purchasing should be notified', '2016-01-21 13:09:01'),
(935, 1, 'Sign', 'owning_project', 31, '{"signature_id":"26"}', 'user signed project', '2016-01-21 13:30:18'),
(936, 1, 'Sign', 'owning_project', 30, '{"signature_id":"22"}', 'user signed project', '2016-01-21 13:32:01'),
(937, 1, 'Edit', 'projects', 31, '{"scope":"4","name":"3w4","type_id":"2","reasons":"33","cost_EGP":"0","cost_USD":"0","cost_EUR":"0","cost":"0","start":"2016-01-21","end":"2016-01-21","remarks":"","suppliers":false}', 'user edited project, signature modified', '2016-01-21 14:21:19'),
(938, 1, 'Notify', 'projects', 31, '{"to":null}', 'Project signature notification sent', '2016-01-21 14:21:20'),
(939, 1, 'Edit', 'projects', 31, '{"scope":"4","name":"3w4","type_id":"2","reasons":"33","cost_EGP":"0","cost_USD":"0","cost_EUR":"0","cost":"0","start":"2016-01-21","end":"2016-01-21","remarks":"","suppliers":false}', 'user edited project, signature modified', '2016-01-21 14:27:09'),
(940, 1, 'Notify', 'projects', 31, '{"to":null}', 'Project signature notification sent', '2016-01-21 14:27:10'),
(941, 1, 'Edit', 'projects', 31, '{"scope":"4","name":"3w4","type_id":"2","reasons":"33","cost_EGP":"0","cost_USD":"0","cost_EUR":"0","cost":"0","start":"2016-01-21","end":"2016-01-21","remarks":"","suppliers":false}', 'user edited project, signature modified', '2016-01-21 14:27:25'),
(942, 1, 'Notify', 'projects', 31, '{"to":null}', 'Project signature notification sent', '2016-01-21 14:27:25'),
(943, 1, 'Review', 'owning_project', 30, '{"place":"","num_of_offers":"","total_cost":"","sup_1":"","sup_2":"","sup_3":"","sup_4":"","sup_5":"","sup_6":"","consultant":"","recommendation":"","balance":"","purchasing_notes":"","financial_notes":"sss","suppliers":false}', 'Owning company form updated', '2016-01-21 14:37:01'),
(944, 1, 'Undo', 'owning_project', 30, '{"signature_id":"22"}', 'user unsigned project', '2016-01-26 14:00:57'),
(945, 1, 'Undo', 'owning_project', 30, '{"signature_id":"22"}', 'user unsigned project', '2016-01-26 14:01:00'),
(946, 1, 'Undo', 'owning_project', 30, '{"signature_id":"22"}', 'user unsigned project', '2016-01-26 14:01:29'),
(947, 1, 'Reject', 'owning_project', 30, '{"signature_id":"22"}', 'user rejected project', '2016-01-26 14:01:32'),
(948, 1, 'Undo', 'owning_project', 30, '{"signature_id":"22"}', 'user unsigned project', '2016-01-26 14:01:33'),
(949, 1, 'Sign', 'owning_project', 30, '{"signature_id":"22"}', 'user signed project', '2016-01-26 14:01:35'),
(950, 1, 'Undo', 'owning_project', 30, '{"signature_id":"22"}', 'user unsigned project', '2016-01-26 14:01:37'),
(951, 1, 'Reject', 'owning_project', 30, '{"signature_id":"22"}', 'user rejected project', '2016-01-26 14:01:38'),
(952, 1, 'Request_Edit', 'projects', 26, '{"type_id":"2","name":"fr3","reasons":"rf","EUR_EX":"0","USD_EX":"0","budget_EGP":"54321","budget_USD":"0","budget_EUR":"0","budget":"54321","remarks":"wwwwww"}', 'user edited project approval request', '2016-01-28 10:19:08'),
(953, 1, 'Request_Edit', 'projects', 26, '{"type_id":"3","name":"fr3","reasons":"rf","EUR_EX":"0","USD_EX":"0","budget_EGP":"54321","budget_USD":"0","budget_EUR":"0","budget":"54321","remarks":"wwwwww"}', 'user edited project approval request', '2016-01-28 10:19:21'),
(954, 1, 'Request_Edit', 'projects', 26, '{"type_id":"3","name":"fr3 d d","reasons":"rf d d","EUR_EX":"0","USD_EX":"6","budget_EGP":"54321","budget_USD":"8000","budget_EUR":"0","budget":"102321","remarks":"wwwwww"}', 'user edited project approval request', '2016-01-28 10:19:45'),
(955, 1, 'Undo', 'projects', 31, '{"signature_id":"205"}', 'user unsigned project', '2016-01-28 10:29:34'),
(956, 1, 'Stage', 'projects', 31, '{"state_id":4}', 'project state forced', '2016-01-28 10:29:34'),
(957, 1, 'Request_Edit', 'projects', 23, '{"type_id":"1","name":"sdasdds","reasons":"asas","EUR_EX":"0","USD_EX":"0","budget_EGP":"1e30","budget_USD":"0","budget_EUR":"0","budget":"1e30","remarks":""}', 'user edited project approval request', '2016-01-28 10:45:41'),
(958, 1, 'Request_Edit', 'projects', 26, '{"type_id":"3","name":"fr3 d d","reasons":"rf d d","EUR_EX":"0","USD_EX":"6","budget_EGP":"54321","budget_USD":"8000","budget_EUR":"0","budget":"102321","remarks":"wwwwww"}', 'user edited project approval request', '2016-01-28 10:52:42'),
(959, 1, 'Request_Edit', 'projects', 26, '{"type_id":"3","name":"fr3 d d","reasons":"rf d d","EUR_EX":"0","USD_EX":"6","budget_EGP":"54321","budget_USD":"8000","budget_EUR":"0","budget":"102321","remarks":"wwwwww"}', 'user edited project approval request', '2016-01-28 10:52:46');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE IF NOT EXISTS `login_attempts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(40) COLLATE utf8_bin NOT NULL,
  `login` varchar(50) COLLATE utf8_bin NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE IF NOT EXISTS `offers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `project_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `name`, `project_id`) VALUES
(1, 'City.php', '1'),
(2, 'City1.php', '2'),
(3, 'The-Strategic-Marketing-Process-eBook.pdf', '13');

-- --------------------------------------------------------

--
-- Table structure for table `owning_signatures`
--

CREATE TABLE IF NOT EXISTS `owning_signatures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rank` int(5) NOT NULL,
  `project_id` int(11) NOT NULL,
  `reject` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=27 ;

--
-- Dumping data for table `owning_signatures`
--

INSERT INTO `owning_signatures` (`id`, `user_id`, `role_id`, `timestamp`, `rank`, `project_id`, `reject`) VALUES
(1, NULL, 10, '2016-01-17 15:37:14', 1, 21, 0),
(2, NULL, 14, '2016-01-17 15:37:14', 2, 21, 0),
(3, NULL, 15, '2016-01-17 15:37:14', 3, 21, 0),
(4, NULL, 10, '2016-01-17 15:38:54', 1, 22, 0),
(5, NULL, 14, '2016-01-17 15:38:54', 2, 22, 0),
(6, NULL, 15, '2016-01-17 15:38:54', 3, 22, 0),
(7, NULL, 10, '2016-01-17 15:42:36', 1, 25, 0),
(8, NULL, 14, '2016-01-17 15:42:36', 2, 25, 0),
(9, NULL, 15, '2016-01-17 15:42:36', 3, 25, 0),
(10, NULL, 10, '2016-01-18 13:46:46', 1, 25, 0),
(11, NULL, 14, '2016-01-18 13:46:46', 2, 25, 0),
(12, NULL, 15, '2016-01-18 13:46:46', 3, 25, 0),
(13, NULL, 24, '2016-01-19 12:32:25', 1, 29, 0),
(14, NULL, 25, '2016-01-19 12:32:26', 2, 29, 0),
(15, NULL, 26, '2016-01-19 12:32:26', 3, 29, 0),
(16, NULL, 22, '2016-01-19 13:47:00', 1, 30, 0),
(17, NULL, 10, '2016-01-19 13:47:00', 2, 30, 0),
(18, NULL, 12, '2016-01-19 13:47:00', 3, 30, 0),
(19, NULL, 15, '2016-01-19 13:47:00', 4, 30, 0),
(20, NULL, 13, '2016-01-19 13:47:00', 5, 30, 0),
(21, NULL, 11, '2016-01-19 13:47:00', 6, 30, 0),
(22, 1, 23, '2016-01-26 14:01:38', 7, 30, 1),
(23, NULL, 14, '2016-01-19 13:47:00', 8, 30, 0),
(24, NULL, 24, '2016-01-21 13:08:59', 1, 31, 0),
(25, NULL, 25, '2016-01-21 13:08:59', 2, 31, 0),
(26, 1, 26, '2016-01-21 13:30:18', 3, 31, 0);

-- --------------------------------------------------------

--
-- Table structure for table `planned_limitations`
--

CREATE TABLE IF NOT EXISTS `planned_limitations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `limit` int(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `planned_limitations`
--

INSERT INTO `planned_limitations` (`id`, `role_id`, `limit`) VALUES
(1, 16, 40000),
(2, 2, 85000);

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE IF NOT EXISTS `plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `total` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `year_pos` int(11) DEFAULT NULL,
  `cf_pos` int(11) DEFAULT NULL,
  `hotel_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=30 ;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `year`, `total`, `user_id`, `timestamp`, `year_pos`, `cf_pos`, `hotel_id`, `state_id`, `deleted`) VALUES
(16, '2016', 0, 77, '2015-10-06 13:33:03', 2, 1, 10, 2, 0),
(21, '2016', 0, 6, '2015-10-09 08:12:14', NULL, NULL, 14, 2, 0),
(22, '2016', 0, 129, '2015-10-09 09:42:10', NULL, NULL, 4, 2, 0),
(23, '2016', 0, 6, '2015-10-09 10:07:51', NULL, NULL, 2, 2, 0),
(24, '2016', 0, 139, '2015-10-09 13:09:29', 4094336, 3132211, 7, 2, 0),
(25, '2016', 0, 25, '2015-10-10 11:59:42', NULL, NULL, 3, 2, 0),
(26, '2016', 0, 93, '2015-10-10 13:50:47', 2604846, 1353978, 8, 2, 0),
(27, '2016', 0, 1, '2015-10-10 21:43:09', 63173076, 2907229, 5, 2, 0),
(28, '2016', 0, 137, '2015-10-11 10:22:06', 3434939, 1883660, 6, 2, 0),
(29, '2016', 0, 68, '2015-10-11 11:24:13', NULL, NULL, 11, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `plan_items`
--

CREATE TABLE IF NOT EXISTS `plan_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `value` double NOT NULL,
  `remarks` text COLLATE utf8_unicode_ci,
  `department_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `priority_id` int(11) NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT '0',
  `cancelled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1288 ;

--
-- Dumping data for table `plan_items`
--

INSERT INTO `plan_items` (`id`, `code`, `name`, `quantity`, `value`, `remarks`, `department_id`, `plan_id`, `priority_id`, `used`, `cancelled`) VALUES
(63, 'SH-FB-2016-001', 'Plate Warmer 2 eyes', 2, 17500, 'To heat the plates in smartline Restaurant', 7, 16, 1, 0, 2),
(70, 'SH-REC-2016-001', 'sun bed', 100, 450, 'for lagoon beach , Smartline pool', 13, 16, 1, 0, 2),
(71, 'SH-REC-2016-002', 'sun bed Mattresses', 100, 225, 'lagoon beach , Smartline pool', 13, 16, 1, 0, 2),
(72, 'SH-REC-2016-003', 'Moveble Umbrella', 25, 850, 'lagoon beach , Smartline pool', 13, 16, 1, 0, 2),
(76, 'SH-FB-2016-003', 'New Table with marble ', 25, 500, 'for Italian Restaurant upgrad', 7, 16, 1, 0, 2),
(77, 'SH-FB-2016-004', 'New chair', 100, 300, 'New chair can use it in Italian Restaurant upgrad', 7, 16, 1, 0, 2),
(78, 'SH-FB-2016-005', 'Wooden Pergola For Bar', 1, 30000, 'For Guest shadow in Italian Restaurant', 7, 16, 1, 0, 2),
(79, 'SH-FB-2016-006', 'Glass Washing Machine ', 2, 15000, 'in Italian Restaurant pool bar ', 7, 16, 1, 0, 2),
(83, 'T1-FO-2016-001', 'testtete', 1, 1, '', 18, 19, 1, 0, 0),
(84, 'T1-FO-2016-002', 'test', 10, 100, 'mdlvmldmvl', 18, 19, 1, 0, 0),
(85, 'T1-FB-2016-001', 'tets', 1, 1, '', 7, 19, 1, 0, 0),
(86, 'T1-FO-2016-001', 'test', 1, 1, 'jbhkjkjb', 18, 20, 1, 0, 0),
(87, 'T1-FO-2016-002', 'test', 1, 1, 'jbkjbkjbkjb', 18, 20, 1, 0, 0),
(88, 'T1-FO-2016-003', 'tyfdfy', 1, 1, 'nknknlk', 18, 20, 1, 0, 0),
(89, 'T1-HK-2016-001', 'nknlkn', 1, 1, '1', 12, 20, 1, 0, 0),
(90, 'T1-HK-2016-002', 'test', 1, 1, 'n,nlknlk', 12, 20, 1, 0, 0),
(91, 'T1-HK-2016-003', 'test', 1, 1, 'jbkjbkjnb', 12, 20, 1, 0, 0),
(92, 'T1-HK-2016-004', 'hgjhgb', 1, 1, 'knlklkn', 12, 20, 1, 0, 0),
(93, 'T1-ENG-2016-001', 'trdeytftf', 1, 1, 'bkjbkjbkjbkjb', 4, 20, 1, 0, 0),
(94, 'T1-ENG-2016-002', 'khklnlknhl', 1, 1, 'b,jbmbkjn', 4, 20, 1, 0, 0),
(95, 'T1-ENG-2016-003', 'knklnlknlk', 1, 1, 'bnkjnkjnbkjb', 4, 20, 1, 0, 0),
(96, 'T1-ENG-2016-004', 'mlm;lm', 1, 1, 'knlknln', 4, 20, 1, 0, 0),
(99, 'GB-FO-2016-003', 'Club Car Full Renovation', 1, 20000, 'Renew Club Car Tires, Body and Electric Kit.', 18, 21, 1, 0, 2),
(101, 'GB-REC-2016-001', 'Vacuum Set', 3, 5000, 'for daily cleaning swimming Pool (cleaner& Hose & brush & Net & Telescope )', 13, 21, 1, 0, 2),
(102, 'GB-REC-2016-002', 'Umbrellas Head', 140, 250, 'to replace the old damaged one', 13, 21, 1, 0, 2),
(104, 'GB-REC-2016-004', 'Chess game Maintenance', 1, 15000, 'to replace the old damaged one', 13, 21, 1, 0, 2),
(106, 'GB-REC-2016-006', 'wooden Bench', 3, 5000, 'for Football court and archery', 13, 21, 1, 0, 2),
(108, 'GB-REC-2016-008', 'Wind breaker', 100, 250, 'to protect guests from wind on the beach', 13, 21, 1, 0, 2),
(109, 'SH-FO-2016-001', 'Hotel cash deposit Box', 1, 5000, 'for cash delivering to hotel', 18, 16, 1, 0, 2),
(110, 'GB-HK-2016-001', 'Ironer & Board', 10, 800, '<p>\n	for extra service as guest satisfaction</p>\n', 12, 21, 1, 0, 2),
(111, 'GB-HK-2016-002', 'Garbage basket stainless 05 liter', 100, 300, 'to replace the old one at all public area ', 12, 21, 1, 85, 2),
(112, 'GB-HK-2016-003', 'Garbage basket stainless 03 liter', 100, 250, 'to replace the old one at guest room', 12, 21, 1, 100, 2),
(113, 'GB-HK-2016-004', 'Garbage basket Blue leather (with logo)', 100, 250, 'to replace the old one at guest room', 12, 21, 1, 100, 2),
(115, 'GB-HK-2016-006', 'Houseman trolley', 10, 4500, '<p>\n	To replace the O.O.O</p>\n', 12, 21, 1, 0, 2),
(116, 'GB-HK-2016-007', 'Public area cleaning  trolley', 5, 3500, 'for standard service', 12, 21, 2, 5, 2),
(117, 'GB-HK-2016-008', 'Stainless Toilet Brush', 100, 350, '<p>\n	to change the old one at guest room</p>\n', 12, 21, 1, 100, 2),
(118, 'GB-HK-2016-009', 'Telephone Set- Panasonic', 40, 400, '<p>\n	to change the old one at guest rooms</p>\n', 12, 21, 2, 0, 2),
(119, 'GB-HK-2016-010', 'Renew lobby curtain', 1, 50000, 'to change the old one ', 12, 21, 2, 0, 2),
(120, 'GB-HK-2016-011', 'Renew lobby furniture', 1, 100000, 'to change the old and damage one', 12, 21, 2, 0, 2),
(121, 'GB-HK-2016-012', 'high pressure machine', 1, 18000, 'for standard service', 12, 21, 1, 0, 2),
(123, 'GB-HK-2016-014', 'Renew guest room blackout', 1000, 35, '<p>\n	to change the old and damaged one</p>\n', 12, 21, 1, 0, 2),
(125, 'GB-HK-2016-016', 'Gloria machine', 2, 2000, '<p>\n	for the pest control to make standard service</p>\n', 12, 21, 1, 0, 2),
(127, 'GB-HK-2016-018', 'Digital telephone for order taker office', 1, 2000, 'for standard service', 12, 21, 1, 0, 2),
(129, 'GB-HK-2016-020', 'trocycle', 2, 2200, 'for standard service', 12, 21, 1, 0, 2),
(132, 'SH-FO-2016-002', 'A5 Acrylic board', 500, 38, 'in all rooms on the back of room door', 18, 16, 1, 0, 2),
(134, 'SH-FO-2016-004', 'Wheel Chair', 2, 2000, 'for handicapped guest ', 18, 16, 2, 0, 2),
(135, 'SH-FO-2016-005', 'Computer Desktop +  Screen 19"  +  Keyboard + Mouse', 1, 7500, 'for shedwan desk + smartline back area.', 18, 16, 1, 0, 2),
(139, 'SH-HK-2016-001', 'Queen Mattress', 162, 1050, '140*2m  for SmartLine rooms upgrade', 12, 16, 1, 0, 2),
(140, 'SH-HK-2016-002', 'Twin Mattress', 162, 720, '1*2m for smartline ', 12, 16, 1, 0, 2),
(141, 'SH-HK-2016-003', 'Shower Curtain', 162, 500, ' for SmartLine rooms upgrade', 12, 16, 1, 0, 2),
(144, 'SH-HK-2016-006', 'Rubbish Basket Leather', 162, 250, ' for SmartLine rooms upgrade', 12, 16, 1, 0, 2),
(146, 'SH-HK-2016-007', 'Balcony Table (forforget)', 162, 100, ' for SmartLine rooms upgrade', 12, 16, 1, 0, 2),
(175, 'SH-ENG-2016-003', 'Heat exchanger 10 ton vertical(to connect all the rooms as well as any future expansions)', 2, 75000, 'For main hot water', 4, 16, 1, 0, 2),
(176, 'SH-ENG-2016-004', 'Pump 5.5 K.W Grundfos according characterization', 2, 20000, 'For main hot water', 4, 16, 1, 0, 2),
(179, 'MP-FO-2016-003', 'Luggage Trolly', 1, 4500, 'Replacing the old one which is totally damaged', 18, 23, 1, 0, 2),
(181, 'MP-REC-2016-001', 'Vacuum Set ', 3, 5000, '', 13, 23, 1, 0, 2),
(182, 'MP-REC-2016-002', 'Umbrellas Head', 40, 250, 'to replace the old damaged one', 13, 23, 1, 0, 2),
(183, 'MP-REC-2016-003', 'Anti slippery Mats', 50, 600, 'to be around the Pool', 13, 23, 1, 0, 2),
(184, 'MP-REC-2016-004', 'table Tennis', 1, 7000, 'to replace the old damaged one', 13, 23, 1, 0, 2),
(185, 'MP-REC-2016-005', 'Wind breaker', 100, 250, 'to protect guests from wind on the beach', 13, 23, 1, 0, 2),
(186, 'RM-HK-2016-001', 'Twintc Machine 120 Liter ', 1, 29000, 'for washing restaurants and corridors', 12, 22, 1, 0, 2),
(187, 'RM-HK-2016-002', 'Vacumm Machine', 5, 3000, 'for rooms'' cleaning', 12, 22, 2, 0, 2),
(188, 'RM-HK-2016-003', 'Water Vacuum', 1, 5000, 'for washing all areas that has no drain', 12, 22, 2, 0, 2),
(189, 'RM-HK-2016-004', 'Baby cot ', 20, 950, 'to replace the very old wooden beds', 12, 22, 1, 0, 2),
(190, 'RM-HK-2016-005', 'Mini Bar', 200, 800, 'we have 400 minibars are not working', 12, 22, 1, 0, 2),
(193, 'RM-HK-2016-008', 'Rubbish Basket 60 Liter for PA toilet', 20, 1150, 'old baskets are broken and very small', 12, 22, 1, 0, 2),
(194, 'RM-HK-2016-009', 'Ruber Mat for P.A  (1.50*200cm)', 20, 2000, 'to be placed in front of public toilets and lobby as we don''t have', 12, 22, 3, 0, 2),
(195, 'RM-HK-2016-010', 'Housekeeping Trolleys', 10, 6600, 'replacement for the very old trolleys had been fixed many many times', 12, 22, 1, 0, 2),
(196, 'MP-HK-2016-001', 'Ironer & Board', 10, 800, '<p>\n	for extra service as guest satisfaction</p>\n', 12, 23, 2, 0, 2),
(197, 'MP-HK-2016-002', 'Garbage basket stainless 05 liter', 100, 300, 'to replace the old one at all public area ', 12, 23, 1, 0, 2),
(198, 'MP-HK-2016-003', 'Garbage basket stainless 03 liter', 100, 250, '<p>\n	to replace the old one at guest room</p>\n', 12, 23, 1, 0, 2),
(199, 'MP-HK-2016-004', 'Garbage basket Blue leather (with logo)', 100, 250, '<p>\n	to replace the old one at guest room</p>\n', 12, 23, 1, 0, 2),
(200, 'MP-HK-2016-005', 'Extra bed standard', 30, 1200, '<p>\n	for extra service as guest satisfaction</p>\n', 12, 23, 1, 0, 2),
(201, 'MP-HK-2016-006', 'Baby Cot', 5, 800, '<p>\n	for guest room</p>\n', 12, 23, 1, 0, 2),
(203, 'MP-HK-2016-008', 'Houseman Trolley ', 10, 4500, '<p>\n	to replace the o.o.o and for standard service</p>\n', 12, 23, 1, 0, 2),
(204, 'MP-HK-2016-009', 'Coffee Tray For Guests'' Rooms ', 50, 300, '<p>\n	for more guest satisfaction</p>\n', 12, 23, 1, 0, 2),
(205, 'MP-HK-2016-010', 'Stainless Toilet Brush', 100, 350, '<p>\n	to change the old one at guest room</p>\n', 12, 23, 1, 0, 2),
(206, 'MP-HK-2016-011', 'Telephone Set', 50, 400, '<p>\n	to change the old one at guest room</p>\n', 12, 23, 2, 0, 2),
(207, 'MP-HK-2016-012', 'single desk machine', 1, 8000, 'for standard service', 12, 23, 1, 0, 2),
(208, 'MP-HK-2016-013', 'Twintec Machine', 1, 35000, 'for standard service', 12, 23, 1, 0, 2),
(209, 'MP-HK-2016-014', 'Carpets For Suites', 48, 833.34, 'for extra service as guest satisfaction', 12, 23, 1, 0, 2),
(210, 'MP-HK-2016-015', 'Renew guest room curtain (voal)', 1000, 20, '<p>\n	to change the old one</p>\n', 12, 23, 1, 0, 2),
(211, 'MP-HK-2016-016', 'renew lobby furniture', 1, 80000, 'to change the old and damage one', 12, 23, 1, 0, 2),
(212, 'MP-HK-2016-017', 'Renew guest room curtain (black out)', 1000, 35, '<p>\n	to change the old and damage one</p>\n', 12, 23, 1, 0, 2),
(213, 'MP-HK-2016-018', 'trocycle', 2, 2200, 'for standard service', 12, 23, 2, 0, 2),
(215, 'MP-HK-2016-020', 'Renew Sofas for Family Rooms', 180, 1100, 'for more guest satisfaction', 12, 23, 1, 0, 2),
(218, 'GB-FB-2016-003', 'Cambro trolley', 1, 7000, 'Main restaurant', 7, 21, 1, 1, 2),
(219, 'GB-FB-2016-004', 'Juice dispenser 4 eyes', 1, 15000, 'Main restaurant', 7, 21, 1, 0, 2),
(220, 'GB-FB-2016-005', 'Bar mixer', 2, 4000, 'for beach bar - aqua park bar', 7, 21, 1, 2, 2),
(221, 'GB-FB-2016-006', 'Bar blender', 3, 5000, 'for Main resturant-Gamlia-Aqua park bar', 7, 21, 1, 3, 2),
(222, 'GB-FB-2016-007', 'banquet table', 1, 13000, 'for more guest satisfaction', 7, 21, 1, 1, 2),
(224, 'GB-FB-2016-009', 'Sound system for conference room', 1, 40000, 'for more guest satisfaction', 7, 21, 1, 0, 2),
(227, 'GB-KIT-2016-001', 'Hand Mixer', 1, 18000, 'for hot section', 6, 21, 1, 0, 2),
(228, 'GB-KIT-2016-002', 'Silce Machine(cold cuts)', 1, 15000, 'for saled (gard Mange)', 6, 21, 1, 0, 2),
(229, 'GB-KIT-2016-003', 'Deep fried 2 Eyes 12 Liters', 1, 18000, 'for hot section', 6, 21, 1, 0, 2),
(230, 'GB-KIT-2016-004', 'Soup Cattel', 2, 7000, 'for main restaurant ', 6, 21, 1, 0, 2),
(231, 'GB-KIT-2016-005', 'toaster machine', 1, 5000, 'for gamela restaurant ', 6, 21, 1, 0, 2),
(232, 'GB-KIT-2016-006', 'vegetable cutting Machine', 1, 13000, 'for salad gard mange', 6, 21, 1, 0, 2),
(233, 'GB-KIT-2016-007', 'Rahaia', 1, 29000, 'for  main kitchen', 6, 21, 1, 0, 2),
(234, 'GB-KIT-2016-008', 'frezer ice cream', 1, 12000, 'for pastery section', 6, 21, 1, 0, 2),
(235, 'GB-KIT-2016-009', 'stainless steel blender', 1, 5500, 'for itallin kitchen', 6, 21, 1, 0, 2),
(237, 'GB-IT-2016-001', 'GBIC Single mode', 2, 3500, 'To enhance the network performance', 2, 21, 1, 2, 2),
(238, 'GB-IT-2016-002', 'Catalyst CISCO 2960 24 port', 1, 12000, 'To enhance the network performance', 2, 21, 1, 1, 2),
(239, 'GB-IT-2016-003', 'Office 2013 License', 25, 2000, 'License needs', 2, 21, 2, 13, 2),
(240, 'GB-IT-2016-004', 'printer ', 1, 2000, 'for the order taker office (HK)', 2, 21, 2, 0, 2),
(241, 'GB-IT-2016-005', 'P.P', 1, 8000, 'for guest rooms lock doors   ', 2, 21, 1, 1, 2),
(242, 'MP-IT-2016-001', 'GBIC Single mode', 2, 3500, 'To enhance the network performance', 2, 23, 1, 0, 2),
(243, 'MP-IT-2016-002', 'Catalyst CISCO 2960 24 port', 1, 12000, 'To enhance the network performance', 2, 23, 1, 0, 2),
(244, 'MP-IT-2016-003', '25 Office 2013 License', 25, 2000, 'License needs', 2, 23, 2, 0, 2),
(245, 'MP-IT-2016-004', ' printer for the order taker office', 1, 2000, 'for housekeeping order taker', 2, 23, 1, 0, 2),
(246, 'MP-IT-2016-005', 'P.P', 1, 8000, 'for guest rooms lock door', 2, 23, 1, 0, 2),
(247, 'MP-SEC-2016-001', 'Stainless.st staff gate', 3, 8000, 'for parking ', 14, 23, 1, 0, 2),
(248, 'MP-SEC-2016-002', 'Explosive Detector ', 1, 30000, 'Security Reasons', 14, 23, 1, 0, 2),
(249, 'RM-FB-2016-001', 'Bar Mixer', 3, 4100, 'New Item For Bar use ( Pergola, Royal & Aqua bar )', 7, 22, 1, 0, 2),
(250, 'RM-FB-2016-002', 'Under Counter Beverages Fridge ( 2 door- 6 shelves)', 3, 31000, 'For Asian & Italian Restaurant ( Replacement Ice Boxes )', 7, 22, 1, 0, 2),
(251, 'RM-FB-2016-003', 'Cambro Clearance Trolleys', 2, 7400, 'New Item For Mexican Restaurant', 7, 22, 2, 0, 2),
(252, 'RM-FB-2016-004', 'Cambro Baby Chair', 10, 2300, 'Increasing The Number which we have for kids increase', 7, 22, 1, 0, 2),
(253, 'RM-FB-2016-005', 'Movable Service Bar', 1, 23200, 'New Item For  M.Restaurant ( Between The Section )', 7, 22, 2, 0, 2),
(254, 'RM-FB-2016-006', 'Ice Machine 90 kg', 2, 17200, 'Replacement The Old One From Opening.', 7, 22, 1, 0, 2),
(255, 'RM-FB-2016-007', 'Under Counter Glass washer machine', 2, 19200, 'New Item For A.T.W Restaurant.', 7, 22, 1, 0, 2),
(256, 'RM-FB-2016-008', 'Out Door clearance Trolleys', 2, 12300, 'New Item For Collecting Debrasage around Pools Area ', 7, 22, 2, 0, 2),
(257, 'RM-FB-2016-009', 'Toast Machine big size', 1, 17350, 'Replacement The Old One From Opening at Mexican Restaurant', 7, 22, 1, 0, 2),
(258, 'RM-FB-2016-010', 'Blender Hamilton Beach 2 liter ', 3, 4780, 'New Item For Bar use ( Pergola, Royal & Aqua )for cocktails', 7, 22, 1, 0, 2),
(259, 'RM-FB-2016-011', 'Upgrade for Aqua Bar tables & Chairs', 1, 30000, '20 Marbles Tables & 50 Iron Chairs with Couchants', 7, 22, 2, 0, 2),
(260, 'RM-FB-2016-012', 'Upgrade conference Room', 1, 85000, '1 Podium speech, 12 rectangle tables, 10 round tables, 100 banquet chairs, 1 sound system, 1 data show', 7, 22, 2, 0, 2),
(261, 'RM-FB-2016-013', 'Change some bars from wooden counter to built counter with Marble as per cristal audit ', 3, 20000, 'Asian Restaurant , Italian Restaurant & Victoria Pub Bars', 7, 22, 1, 0, 2),
(262, 'RM-IT-2016-001', 'Touch Screen', 1, 8500, 'Al Card Restaurant &amp; Guest Information', 2, 22, 2, 0, 2),
(263, 'RM-IT-2016-002', 'Computers Desk', 25, 8500, 'Replace the old pc''s', 2, 22, 1, 0, 2),
(265, 'RM-IT-2016-004', 'Monitors ', 10, 1200, 'Replace the Old screen', 2, 22, 1, 0, 2),
(266, 'RM-IT-2016-005', 'External Hard', 4, 1500, 'To Release more network space', 2, 22, 3, 0, 2),
(268, 'RM-IT-2016-007', 'Back up file server ', 1, 40000, 'For the Systems and users back up', 2, 22, 2, 0, 2),
(270, 'RM-HR-2016-002', 'Data Show', 1, 6000, 'to use it for the external training session', 15, 22, 3, 0, 2),
(271, 'RM-STA-2016-001', 'Water Cooler S- less', 2, 6000, 'For the staff Housing  7 El Forsan Cafteria', 23, 22, 2, 0, 2),
(272, 'RM-STA-2016-002', 'Fridge 2 doors', 1, 25000, 'we don''t have for salad', 23, 22, 3, 0, 2),
(273, 'RM-STA-2016-003', 'Civil Work building , store for El Forsan', 1, 44000, 'For Junior, senior and Management Cafteria', 23, 22, 3, 0, 2),
(274, 'RM-STA-2016-004', 'Oil Fryer', 1, 12000, 'we have very small old one needs to be supported  ', 23, 22, 1, 0, 2),
(275, 'RM-STA-2016-005', 'Convection oven', 1, 55000, 'we don''t have any in the staff kitchen', 23, 22, 2, 0, 2),
(276, 'RM-STA-2016-006', 'Air Condition 5 Horse pwer', 2, 11000, 'we don''t have A/C in the staff kitchen', 23, 22, 2, 0, 2),
(277, 'RM-STA-2016-007', 'meat mincing machine', 1, 10000, 'we don''t have any.', 23, 22, 1, 0, 2),
(278, 'RM-STA-2016-008', 'Water fillter plant RO', 1, 15000, 'to filltern all the kitchen use water', 23, 22, 1, 0, 2),
(279, 'RM-HO-2016-001', 'fridge 8 cm ', 5, 1850, 'To Complete the senior staff furniture', 22, 22, 1, 0, 2),
(280, 'RM-HO-2016-002', 'Fans ', 60, 440, 'To cover Junior staff housing ', 22, 22, 1, 0, 2),
(281, 'RM-HO-2016-003', 'AC 2.25 Horse power ', 6, 4000, 'for senior staff rooms', 22, 22, 1, 0, 2),
(282, 'RM-HO-2016-004', 'TV Satellite station ', 1, 10000, 'For staff housing & Staff cafteria', 22, 22, 1, 0, 2),
(283, 'RM-HO-2016-005', 'Mattress', 50, 600, 'replacement for OOO', 22, 22, 1, 0, 2),
(284, 'GB-SEC-2016-001', 'Stainless.st staff gate', 1, 8000, 'staff gate', 14, 21, 1, 0, 2),
(285, 'GB-SEC-2016-002', 'Security mirror', 2, 4000, 'Security reasons', 14, 21, 1, 0, 2),
(289, 'GB-HR-2016-004', 'deep freezer', 1, 12000, 'Need it in the kitchen cafeteria ', 15, 21, 1, 0, 2),
(290, 'GB-HR-2016-005', 'Hand Dryer', 2, 2500, 'used in staff toilet', 15, 21, 1, 0, 2),
(291, 'RM-FO-2016-001', 'One XPP', 1, 25000, 'we have no spare telephone lines', 18, 22, 1, 0, 2),
(292, 'RM-FO-2016-002', 'Suzuki Car', 1, 70000, 'for the guest luggage ', 18, 22, 1, 0, 2),
(293, 'RM-ACC-2016-001', 'new metal shelves size 60*60 for the stores ', 50, 750, 'cristal requirement', 3, 22, 1, 0, 2),
(298, 'GB-ENG-2016-002', 'A/C  control unit, wall mounted type, trane', 100, 350, 'replace the damaged one in guest room', 4, 21, 1, 100, 2),
(299, 'GB-ENG-2016-003', 'Complete Toilet Seat Covers In Public Areas ', 5, 480, 'it became in poor condition ', 4, 21, 1, 0, 2),
(300, 'GB-ENG-2016-004', 'hairr dryer ', 25, 550, '<p>\n	to replace the old damaged one</p>\n', 4, 21, 1, 25, 2),
(301, 'GB-ENG-2016-005', 'Mini Bar', 10, 1200, 'to replace the old one at guest rooms', 4, 21, 1, 0, 2),
(302, 'GB-ENG-2016-006', 'toilet cover idial standard ', 100, 480, 'to replace the old one at guest rooms', 4, 21, 1, 100, 2),
(303, 'GB-ENG-2016-007', 'Complete power saving unit with contactor', 50, 850, '<p>\n	to replace the old one at guest rooms</p>\n', 4, 21, 1, 0, 2),
(304, 'GB-ENG-2016-008', 'Shower mixer for guest room ', 50, 700, 'to replace the old one at guest rooms', 4, 21, 1, 0, 2),
(305, 'GB-ENG-2016-009', 'Sink mixer for guest room ', 50, 600, 'to replace the old one at guest rooms', 4, 21, 1, 50, 2),
(306, 'GB-ENG-2016-010', 'Safe box, laptop size', 25, 600, '<p>\n	to replace the ooo one in guests rooms</p>\n', 4, 21, 1, 0, 2),
(307, 'GB-ENG-2016-011', 'compressor MT160 for DX units 240', 2, 14000, 'to replace the old one', 4, 21, 1, 0, 2),
(308, 'GB-ENG-2016-012', 'Compressor MT100 for DX180', 1, 11000, 'to replace the old one ', 4, 21, 1, 0, 2),
(309, 'GB-ENG-2016-013', 'control card for A/c unit', 15, 800, 'to increase the efficiency of the units', 4, 21, 2, 0, 2),
(310, 'GB-ENG-2016-014', 'thermostate DX unit', 20, 2000, 'to increase the efficiency of the units', 4, 21, 1, 0, 2),
(311, 'GB-ENG-2016-015', ' Ref. compressors 1.5 hp', 4, 8000, 'to replace the old one', 4, 21, 1, 0, 2),
(312, 'GB-ENG-2016-016', ' Ref. compressors 2 HP, ph 3 ', 2, 13000, 'to replace the old one', 4, 21, 1, 0, 2),
(313, 'GB-ENG-2016-017', 'a/c complete unit for kitchen', 5, 11000, 'the existing one not enough to cover all kitchen', 4, 21, 1, 0, 2),
(314, 'GB-ENG-2016-018', ' A/C Compressor, guest room 03 HP, rotary type    ', 20, 1400, 'to replace the old one', 4, 21, 1, 0, 2),
(315, 'GB-ENG-2016-019', ' A/C Compressor, guest room 2.25 HP, rotary type    ', 40, 1000, 'to replace the old one', 4, 21, 1, 0, 2),
(316, 'GB-ENG-2016-020', ' Ref. cooling unit  danfos 3/4 hp', 10, 4000, 'to increase the efficiency of the units', 4, 21, 1, 0, 2),
(317, 'GB-ENG-2016-021', 'Motor fan for cold room', 8, 950, 'to increase the efficiency of the units', 4, 21, 2, 0, 2),
(318, 'GB-ENG-2016-022', 'Rubber Gusket for  refregerator (different sizes)', 35, 1200, 'according to Cristal instructions', 4, 21, 1, 0, 2),
(319, 'GB-ENG-2016-023', 'Complete door handles for walk -in refrigerators', 10, 1200, 'it became in poor condition', 4, 21, 2, 0, 2),
(320, 'GB-ENG-2016-024', 'Walk in refrjerator rooms doors', 1, 14300, 'it became in poor condition', 4, 21, 1, 0, 2),
(321, 'GB-ENG-2016-025', 'New complete air curtains- 120 cm width       ', 4, 3000, 'For the Main Kitchen and the Main Restaurant', 4, 21, 1, 0, 2),
(322, 'GB-ENG-2016-026', 'Sewage water plant submerged pump, for receiving ', 1, 16000, 'to replace the damaged one', 4, 21, 1, 0, 2),
(323, 'GB-ENG-2016-027', 'Sewage water handling pumps', 1, 45000, 'to replace the old damaged one as its became on bad condition', 4, 21, 1, 0, 2),
(324, 'GB-ENG-2016-028', 'Portable type submerged pumps, 220 Volt   ', 3, 3000, 'to replace the old one', 4, 21, 1, 0, 2),
(325, 'GB-ENG-2016-029', ' Pumps filters housing', 6, 4000, 'to replace the old one', 4, 21, 1, 0, 2),
(326, 'GB-ENG-2016-030', 'submersiable pump 3 HP', 3, 6500, 'to replace the old one', 4, 21, 1, 0, 2),
(327, 'GB-ENG-2016-031', 'motor blower for treatment station', 1, 85000, 'to replace the old one it became on bad conditions', 4, 21, 1, 0, 2),
(328, 'GB-ENG-2016-032', 'pump for poster room 380 voit 11 KW ', 1, 45000, 'to replace the old one it became on bad conditions', 4, 21, 1, 0, 2),
(329, 'GB-ENG-2016-033', 'Hot Water Circulating Pumps ', 1, 5000, 'to replace the old one it became on bad conditions', 4, 21, 1, 0, 2),
(330, 'GB-ENG-2016-034', 'Replacement of stairs granite cluster   ', 1, 60000, 'to fix the drop granite in the building stairs', 4, 21, 1, 0, 2),
(331, 'GB-ENG-2016-035', 'Replacing Old Doors Inside Kitchen ', 8, 3500, 'to replace the old doors inside kitchen', 4, 21, 1, 0, 2),
(335, 'GB-ENG-2016-039', 'Portable Extinguisher, powder type, 06 KG capacity', 50, 700, 'it must be changed every 5 years', 4, 21, 1, 0, 2),
(336, 'GB-ENG-2016-040', 'heated fire detector addressable', 10, 1600, 'to change all the old', 4, 21, 1, 0, 2),
(337, 'GB-ENG-2016-041', 'break glass addressable', 5, 1600, 'to change all the old - safety', 4, 21, 1, 0, 2),
(338, 'GB-ENG-2016-042', 'addressable module', 2, 1600, 'to change all the old - safety', 4, 21, 1, 0, 2),
(339, 'GB-ENG-2016-043', 'fire Fighting panel', 2, 4000, 'to change all the old - safety', 4, 21, 1, 0, 2),
(340, 'GB-ENG-2016-044', 'Portable Extinguisher,Co2, 06 KG capacity', 10, 1100, 'it must be changed every 5 years', 4, 21, 1, 0, 2),
(341, 'GB-ENG-2016-045', 'Portable Extinguisher,Matic, 06 KG capacity', 20, 1200, 'it must be changed every 5 years', 4, 21, 1, 0, 2),
(342, 'GB-ENG-2016-046', 'Exit Lighting Sign', 45, 850, 'For all buildings corridors', 4, 21, 1, 0, 2),
(343, 'GB-ENG-2016-047', 'Emergency lighting units', 50, 550, 'For all buildings corridors', 4, 21, 1, 0, 2),
(344, 'GB-ENG-2016-048', 'Fire Hose Head Multi ', 10, 1200, 'to change all the old -Safety reasons', 4, 21, 1, 0, 2),
(345, 'GB-ENG-2016-049', 'Exhaust Fans For transformers or proper ventilation', 10, 2800, 'For transformers', 4, 21, 1, 0, 2),
(346, 'GB-ENG-2016-050', 'jockey pump', 1, 8000, 'the old one became in a bad condition and it is not safety', 4, 21, 1, 0, 2),
(347, 'GB-ENG-2016-051', 'planko 3 ton', 3, 5000, 'for water treatment station', 4, 21, 1, 0, 2),
(348, 'GB-ENG-2016-052', 'S.Pool Vacum Pump 1.5 HP', 2, 6000, 'To replace the old one as it is became in a bad condition', 4, 21, 1, 0, 2),
(349, 'GB-ENG-2016-053', 'Relax Pool Filteration Pupm 1 HP ', 1, 4500, 'to replace the old one as it is became in bad condition', 4, 21, 1, 0, 2),
(350, 'GB-ENG-2016-054', 'Filteration  Pumps 3 HP for villa', 1, 9000, 'to replace the old one as it is became in bad condition', 4, 21, 1, 0, 2),
(351, 'GB-ENG-2016-055', 'Roof &amp;isolation &amp;A/C  for Angel kids club - Anex', 1, 75000, 'Anex Tour Angel kids Club', 4, 21, 1, 0, 2),
(352, 'GB-ENG-2016-056', 'Games (bicycle , Ping Pong,Wii ,Bowling….etc)', 1, 50000, 'Anex Tour Angel kids Club', 4, 21, 1, 0, 2),
(353, 'GB-GRD-2016-001', 'Manhole Cover (PVC ) Instead Of iron Covers - Different Sizes', 20, 350, 'to replace rusty iron covers', 16, 21, 1, 0, 2),
(356, 'GB-GRD-2016-004', 'Motor pesticide spraying', 1, 15000, 'to replace the old one', 16, 21, 1, 0, 2),
(361, 'MP-ENG-2016-002', 'toilet seat cover  ', 100, 480, 'for bath room in guest room', 4, 23, 1, 0, 2),
(362, 'MP-ENG-2016-003', 'Shower mixer ', 60, 700, 'for change damaged one in guest room', 4, 23, 1, 0, 2),
(363, 'MP-ENG-2016-004', 'Sink Mixer ', 30, 600, 'for bath room in guest room', 4, 23, 1, 0, 2),
(364, 'MP-ENG-2016-005', 'Mini Bar ', 20, 1200, 'for more guest satisfaction', 4, 23, 1, 0, 2),
(365, 'MP-ENG-2016-006', 'Compination Box Toilet Ideal Standard', 25, 400, 'change damaged one in guest room', 4, 23, 1, 0, 2),
(366, 'MP-ENG-2016-007', 'Electronic Door Lock', 20, 1200, 'to avoid guest  complaints ', 4, 23, 1, 0, 2),
(367, 'MP-ENG-2016-008', 'compressor MT160 for DX units 240', 5, 14000, 'to replace damaged one in main B.', 4, 23, 1, 0, 2),
(368, 'MP-ENG-2016-009', 'Compressor MT100 for DX180', 3, 10000, 'to replace damaged one in main B', 4, 23, 1, 0, 2),
(369, 'MP-ENG-2016-010', 'control card for A/c unit', 15, 4000, 'to replace damaged one', 4, 23, 1, 0, 2),
(370, 'MP-ENG-2016-011', 'DX unit thermostat', 20, 1000, 'to replace the damaged one in main B.', 4, 23, 1, 0, 2),
(371, 'MP-ENG-2016-012', 'A/C Remot control carrier for guest room', 50, 350, 'to change manual contral in Guest rooms', 4, 23, 1, 0, 2),
(372, 'MP-ENG-2016-013', ' Ref. compressors 3 HP, ph 3 ', 4, 7500, 'to change damaged in ref.', 4, 23, 1, 0, 2),
(373, 'MP-ENG-2016-014', 'Ref. compressors 1,5 HP, HP', 4, 5000, 'to change the damage in ref.', 4, 23, 1, 0, 2),
(374, 'MP-ENG-2016-015', 'Ref. compressors 2 HP, ph3', 2, 6500, 'to change the damage in ref.', 4, 23, 1, 0, 2),
(375, 'MP-ENG-2016-016', ' A/C Compressor, guest room2.25 HP, rotary type    ', 20, 1600, 'to change damaged in guest room ', 4, 23, 1, 0, 2),
(376, 'MP-ENG-2016-017', ' A/C Compressor, guest room 03 HP, rotary type    ', 40, 2000, 'ange damaged in guest room', 4, 23, 1, 0, 2),
(377, 'MP-ENG-2016-018', 'Motor fan for cold room', 10, 1500, 'to change the damage in ref.', 4, 23, 1, 0, 2),
(378, 'MP-ENG-2016-019', 'Change Door for cold room   ', 5, 5000, 'to change the damage in ref.', 4, 23, 1, 0, 2),
(379, 'MP-ENG-2016-020', 'Rubber Gusket for  refregerator (different sizes)', 1, 50000, 'to change the damage in ref.', 4, 23, 1, 0, 2),
(380, 'MP-ENG-2016-021', 'New complete air curtains- 120 cm width       ', 4, 3000, 'to change the damaged in enterance ', 4, 23, 1, 0, 2),
(385, 'MP-ENG-2016-026', 'Change inverter for station water ', 1, 25000, 'change the damaged one in water station ', 4, 23, 1, 0, 2),
(386, 'MP-ENG-2016-027', 'sprinkler water for Main dishwasher machine', 3, 4500, 'change the damaged in main dishwasher ', 4, 23, 1, 0, 2),
(387, 'MP-ENG-2016-028', 'Treatment the water leakage in the waterfall( water slide)', 1, 400000, 'to isolate the water leaking ', 4, 23, 1, 0, 2),
(388, 'MP-ENG-2016-029', 'Portable Extinguisher, powder type, 06 KG capacity', 35, 700, 'H&S reasons', 4, 23, 1, 0, 2),
(389, 'MP-ENG-2016-030', 'break glass addressable', 8, 1600, 'H&S reasons', 4, 23, 1, 0, 2),
(390, 'MP-ENG-2016-031', 'addressable module', 3, 1600, 'H&S reasons', 4, 23, 1, 0, 2),
(391, 'MP-ENG-2016-032', 'fire Fighting panel', 2, 4000, 'H&S reasons', 4, 23, 1, 0, 2),
(392, 'MP-ENG-2016-033', 'Fire blanket', 5, 1200, 'H&S reasons', 4, 23, 1, 0, 2),
(393, 'MP-ENG-2016-034', 'Aplik Maghreby (Big )', 150, 200, 'for more guest satisfaction', 4, 23, 1, 0, 2),
(394, 'MP-ENG-2016-035', 'Aplik Maghreby (small)', 200, 150, 'for more guest satisfaction', 4, 23, 1, 0, 2),
(395, 'MP-ENG-2016-036', 'Changed Header st.steel for boiler', 2, 17500, 'change the damaged in boiler ', 4, 23, 1, 0, 2),
(396, 'MP-ENG-2016-037', 'Water pump for boiler ', 4, 10000, 'change the damage in boiler ', 4, 23, 1, 0, 2),
(397, 'MP-ENG-2016-038', 'Hair dryer', 50, 500, 'to change damaged one in guest rooms', 4, 23, 1, 0, 2),
(398, 'MP-ENG-2016-039', 'Safe Box ', 50, 600, 'for more safety in guest rooms', 4, 23, 1, 0, 2),
(402, 'MP-GRD-2016-004', 'Machine cut Honda plants (HHH25)', 1, 6000, 'to cut plants', 16, 23, 1, 0, 2),
(403, 'MP-GRD-2016-005', 'Machine cut grass Honda (216)  ', 1, 11000, 'to cut grass', 16, 23, 1, 0, 2),
(406, 'MP-FB-2016-002', 'Plate dispenser', 2, 12000, 'for pergola and Mexican restaurant. Cristal order', 7, 23, 1, 0, 2),
(407, 'MP-FB-2016-003', 'Welcome Table', 1, 7000, 'for conference room ', 7, 23, 1, 0, 2),
(408, 'MP-FB-2016-004', 'Refrigerator under counter', 1, 30000, 'For Service bar and aqua bar daily distribution ', 7, 23, 1, 0, 2),
(409, 'MP-FB-2016-005', 'room Sevice trolley', 1, 6000, 'to cover all building', 7, 23, 1, 0, 2),
(410, 'MP-FB-2016-006', 'plate trolley cambro', 1, 8000, 'to main restaurant ', 7, 23, 1, 0, 2),
(411, 'MP-FB-2016-007', 'Service Trolley', 2, 5000, 'for Main restaurant to cover all restaurant - cws', 7, 23, 1, 0, 2),
(412, 'MP-FB-2016-008', 'beverage trolley cambro ', 2, 6000, 'For lobby bar', 7, 23, 1, 0, 2),
(413, 'MP-FB-2016-009', 'full Sound system(Mixer,speaker&amplphier)', 1, 70000, 'for victoria pub', 7, 23, 1, 0, 2),
(414, 'MP-FB-2016-010', 'Ice maker 75 KG', 1, 35000, 'for El paso restaurant & for Asian restaurant', 7, 23, 1, 0, 2),
(415, 'MP-FB-2016-011', 'Glass washer', 1, 29000, 'for lobby bar and pergola bar', 7, 23, 1, 0, 2),
(416, 'MP-FB-2016-012', 'fruit and vegetable squeezer', 2, 10000, 'Beach Bar , Mexicain and Main restaurant', 7, 23, 1, 0, 2),
(417, 'MP-FB-2016-013', 'juice dispenser 4 eyes', 2, 12000, 'for Main restaurant Mexican  restaurant', 7, 23, 1, 0, 2),
(418, 'MP-FB-2016-014', 'Electric screen ', 1, 15000, 'for conference room ', 7, 23, 1, 0, 2),
(419, 'MP-FB-2016-015', 'Data show', 1, 15000, 'for conference room ground floor', 7, 23, 1, 0, 2),
(421, 'MP-FB-2016-017', 'banquet Table ', 25, 800, 'For Banquet and  parties', 7, 23, 1, 0, 2),
(422, 'MP-FB-2016-018', 'Water Boiler', 2, 6000, 'For Coffee Stations', 7, 23, 1, 0, 2),
(423, 'MP-KIT-2016-001', 'Minced beef machine ', 1, 40000, 'for gard manger', 6, 23, 1, 0, 2),
(424, 'MP-KIT-2016-002', 'Tilting pan for Rice', 1, 52000, 'For Hot section', 6, 23, 1, 0, 2),
(425, 'MP-KIT-2016-003', 'Hand Mixer', 1, 8000, 'For hot section and activity', 6, 23, 1, 0, 2),
(426, 'MP-KIT-2016-004', 'Microwave', 2, 4000, 'For Grill House & Hot Kitchen', 6, 23, 1, 0, 2),
(427, 'MP-KIT-2016-005', 'Vegetable washing Machine', 1, 80000, 'For Washing Vegetable & Fruits', 6, 23, 1, 0, 2),
(428, 'MP-KIT-2016-006', 'Slice Machine(cold Cuts)', 1, 16000, 'For Kitchen', 6, 23, 1, 0, 2),
(429, 'MP-KIT-2016-007', 'Deep fried 2 Eyes 12 liter', 1, 18000, 'for pergola bar', 6, 23, 1, 0, 2),
(430, 'MP-KIT-2016-008', 'High Pressure Machine', 1, 8000, 'for Cleaning ', 6, 23, 1, 0, 2),
(431, 'MP-KIT-2016-009', 'carving unit', 1, 15000, 'for Carving ', 6, 23, 1, 0, 2),
(432, 'MP-KIT-2016-010', 'Hot Cabinet', 1, 38000, 'Fot Hot Kitchen', 6, 23, 1, 0, 2),
(433, 'MP-KIT-2016-011', 'Trolley Campro', 2, 15000, 'for Outlets', 6, 23, 1, 0, 2),
(434, 'MP-KIT-2016-012', 'St. St. Trolley from CWS', 2, 8000, 'For Cold & Hot Kitchen', 6, 23, 1, 0, 2),
(435, 'MP-KIT-2016-013', 'Toaster Cutting machine', 1, 12000, 'for the Buffet', 6, 23, 1, 0, 2),
(436, 'MP-KIT-2016-014', 'Cereal dispenser', 5, 1500, 'For Buffet Breakfast', 6, 23, 1, 0, 2),
(437, 'MP-KIT-2016-015', 'Soup Cattle', 2, 7000, 'for Elpaso restaurant', 6, 23, 1, 0, 2),
(438, 'MP-KIT-2016-016', 'toaster machine', 1, 5000, 'for Elpaso restaurant and main rest', 6, 23, 1, 0, 2),
(439, 'MP-KIT-2016-017', 'Sushi counter', 1, 12000, 'for Belguim Corner', 6, 23, 1, 0, 2),
(445, 'AB-HK-2016-001', 'welcome tray full set up', 50, 450, 'to replace the OOO', 12, 24, 1, 0, 2),
(446, 'AB-HK-2016-002', 'Rooms Upholstery Renewing ', 150, 2000, 'To renew the Rooms upholstery which became in bad condition', 12, 24, 1, 0, 2),
(447, 'AB-HK-2016-003', 'Rooms Accessories polishing', 200, 300, 'to polish the rusti accessories', 12, 24, 1, 0, 2),
(448, 'AB-HK-2016-004', 'Reading Lamp', 400, 140, 'to replace the OOO', 12, 24, 1, 0, 2),
(449, 'AB-HK-2016-005', 'Buildings signs renovation', 1, 60000, 'To renovate all buildings signs', 12, 24, 1, 0, 2),
(450, 'AB-REC-2016-001', 'Sun beds with mattress ', 300, 1400, 'we will need 1100 sunbed when we will be full occupancy and we have 850 sunbed right now ', 13, 24, 1, 0, 2),
(453, 'RM-REC-2016-002', 'Upgrade the swimming pool ', 1, 600000, 'new liner inside the pool- change the outside land around swimming pool ( marble &  drained) -Fully remove rocks-over flu - repair the vacuum machine', 13, 22, 1, 0, 2),
(454, 'RM-REC-2016-003', 'Renew the Kids Area', 1, 30000, 'all swings, floors and wals needs renovation', 13, 22, 3, 0, 2),
(455, 'RM-REC-2016-004', 'tartan multy playground', 1, 70000, 'guest satisfaction', 13, 22, 3, 0, 2),
(456, 'RM-REC-2016-005', 'renew the information boards ', 1, 115000, 'as first part of signage plan', 13, 22, 1, 0, 2),
(457, 'RM-REC-2016-006', 'renew the gym floor ', 1, 35000, 'the floor is damaged and guest fell down to the spa ceiling', 13, 22, 1, 0, 2),
(458, 'AB-REC-2016-002', 'movable umbrella for the royal swim up ', 20, 1650, 'for the main pool as we don’t have enough shade', 13, 24, 1, 0, 2),
(459, 'AB-REC-2016-003', 'kids play ground at the beach', 1, 50000, 'To realocate the kids playground at the beach with shade', 13, 24, 1, 0, 2),
(461, 'AB-REC-2016-004', 'Rules and regulations signs for the beach and pools', 1, 300000, 'Missing since opening', 13, 24, 1, 0, 2),
(462, 'AB-REC-2016-005', 'Increase cabanas at the Beach & rearrange the Beach', 10, 10000, 'to increase upselling', 13, 24, 1, 0, 2),
(463, 'AB-REC-2016-006', 'Inflated water park ', 5, 30000, 'Mohamed Badr', 13, 24, 1, 0, 2),
(464, 'AB-REC-2016-007', 'Seating arrangements for Amphitheatre', 350, 350, 'for amphitheatre and tennis courts', 13, 24, 1, 0, 2),
(465, 'SH-KIT-2016-001', 'Blinder ', 2, 3750, 'italian SS Capacity 3 Lt.', 6, 16, 1, 0, 2),
(467, 'AB-FB-2016-001', 'Blender Hamilton Beach', 1, 4200, 'For Royal Club & Italian', 7, 24, 1, 1, 2),
(468, 'AB-FB-2016-002', 'Ice crucher machine CK-108 ', 2, 5500, 'For all outlet', 7, 24, 2, 0, 2),
(469, 'AB-FB-2016-003', 'Fridge under counter', 1, 16500, 'for the service bar of the 2 main restaurants as the existing one is not enough specailly when we are 100% occupancy', 7, 24, 1, 1, 2),
(470, 'AB-FB-2016-004', 'Granita machine ', 1, 15000, 'for chilled beverages in all outlets', 7, 24, 2, 1, 2),
(471, 'AB-FB-2016-005', 'Juice dispenser ', 2, 7700, 'for the second main restaurant Sunrise International', 7, 24, 1, 2, 2),
(472, 'AB-KIT-2016-001', 'Toaster Conveyor', 1, 11500, 'We only have 2 toaster serving two buffet in the same time so there is no spare one', 6, 24, 1, 0, 2),
(473, 'AB-KIT-2016-002', 'Chafing Dishes (Rectangular GN 1/1) electric heated', 15, 6500, 'To be used for gala dinner, outdoor cooking events and to be used for  the kitchen back area of the a la carte restaurants and to save energy ', 6, 24, 1, 0, 2),
(474, 'AB-KIT-2016-003', 'Double Iron Panini Sandwich Iron ', 1, 10500, 'To be used in both Royal Club and Island Pool', 6, 24, 1, 0, 2),
(475, 'AB-KIT-2016-004', 'Induction Cookers', 4, 8800, 'Needed for the Main Restaurants as we have some induction cookers out of order must be replaced', 6, 24, 1, 0, 2),
(476, 'AB-KIT-2016-005', 'Chafing Dish (Combined with the induction cookers)', 4, 5000, 'A total of NINE Chafing dishes required for the induction cookers to replace all the depreciated ones', 6, 24, 1, 0, 2),
(477, 'AB-KIT-2016-006', 'Soup Kettle', 4, 1800, 'Needed for the daily operation at buffet and outlets area', 6, 24, 1, 0, 2),
(478, 'AB-KIT-2016-007', '        Stainless Steel Oven Trolley                                                             L 82 cm  x W 66 cm  x  H 167  cm                                             ', 2, 18500, 'Roratry Oven Trolley needed for the Bakery Section', 6, 24, 1, 0, 2),
(479, 'AB-KIT-2016-008', 'Salad Display Cooler', 2, 14000, 'For the Snacks at the Pool Bar & Mayfair', 6, 24, 1, 0, 2),
(480, 'AB-KIT-2016-009', 'S/S Double Door Hot Cabinet 16 shelves', 1, 34500, 'Needed for the daily operation at buffet and outlets area', 6, 24, 1, 0, 2),
(481, 'AB-KIT-2016-010', 'Salamander ', 3, 18500, 'To be used in the italian Restaurant and Blue Blue Restaurant and the Royal Club', 6, 24, 1, 0, 2),
(483, 'AB-ENG-2016-001', ' Rooms Grouting  ', 200, 2000, '', 4, 24, 1, 0, 2),
(484, 'AB-ENG-2016-002', ' Toilet external mini shower bidet ', 200, 130, '', 4, 24, 1, 0, 2),
(485, 'AB-ENG-2016-003', ' Copmpleting the Buildings Roof Tops Green Tertan ', 2500, 55, '', 4, 24, 1, 0, 2),
(486, 'AB-ENG-2016-004', ' Building Dry Mix Façade Painting Renewal ', 9, 20000, '', 4, 24, 1, 0, 2),
(487, 'AB-ENG-2016-005', ' Building HK stores in the Rooms Buildings&amp;boxes for dirty linen ', 14, 9000, '', 4, 24, 1, 0, 2),
(488, 'AB-ENG-2016-006', ' Revolving Door for the lobby ', 1, 300000, '', 4, 24, 1, 0, 2),
(489, 'AB-ENG-2016-007', ' Themed Family Rooms ', 14, 10000, '', 4, 24, 1, 0, 2),
(490, 'AB-ENG-2016-008', ' Main Pool Grouting &amp; adjusting the sandy beach ', 1, 500000, '', 4, 24, 1, 0, 2),
(491, 'AB-ENG-2016-009', ' pump filter 5.5 hp ', 1, 77000, '', 4, 24, 1, 0, 2),
(492, 'AB-ENG-2016-010', ' sand filter 1m3 ', 1, 28500, '', 4, 24, 1, 0, 2),
(493, 'AB-ENG-2016-011', ' Jetty Overall renovation ', 1, 50000, '', 4, 24, 1, 0, 2),
(494, 'AB-ENG-2016-012', ' Pools and Fountains LED Light Color ', 1, 148000, '', 4, 24, 2, 0, 2),
(495, 'AB-ENG-2016-013', 'Felucca Sky and Felucca Terrace Bar ', 1, 30000, '', 4, 24, 1, 0, 2),
(496, 'AB-ENG-2016-014', ' Beach Bar to serve the guest at the beach', 1, 40000, '', 4, 24, 1, 0, 2),
(497, 'AB-ENG-2016-015', 'Kids Buffet in Nora Nora', 1, 70000, '', 4, 24, 1, 0, 2),
(498, 'AB-ENG-2016-016', ' cables press (16:300)mm ', 1, 12700, '', 4, 24, 1, 0, 2),
(499, 'AB-ENG-2016-017', ' grundfos pump 5.5 hp ', 2, 9450, '', 4, 24, 1, 0, 2),
(500, 'AB-ENG-2016-018', ' grundfos pump3.5 hp ', 3, 6800, '', 4, 24, 1, 0, 2),
(501, 'AB-ENG-2016-019', ' Main Holes leakage treatment ', 105, 500, '', 4, 24, 1, 0, 2),
(502, 'AB-ENG-2016-020', ' Club Cars overall  ', 13, 8000, '', 4, 24, 1, 0, 2),
(503, 'AB-ENG-2016-021', ' Air Hand Unit touch screen ', 3, 8000, '', 4, 24, 1, 0, 2),
(504, 'AB-GRD-2016-001', 'Grass cutting machine', 1, 10350, 'as the exist one getting so much OOO', 16, 24, 1, 0, 2),
(508, 'SH-KIT-2016-005', 'Soup pool', 4, 2500, 'to keep soup hot on the buffet', 6, 16, 1, 0, 2),
(509, 'SH-KIT-2016-006', 'Deep Freezer counter', 1, 3500, '250 Lt.', 6, 16, 1, 0, 2),
(512, 'SH-KIT-2016-009', 'Toaster', 2, 4500, 'for smartline buffet ', 6, 16, 1, 0, 2),
(513, 'SH-KIT-2016-010', 'slices cutting machine', 1, 7000, 'for cheese & cold cuts in Gard Manjee department', 6, 16, 1, 0, 2),
(514, 'SH-KIT-2016-011', 'Ice Maker', 1, 120000, '250 Lt. for kitchen', 6, 16, 1, 0, 2),
(515, 'SH-KIT-2016-012', 'potatoes peeler', 1, 8000, 'for peel potatoes ', 6, 16, 1, 0, 2),
(516, 'SH-KIT-2016-013', 'Waffle machine', 2, 12000, 'for smartline Buffet', 6, 16, 1, 0, 2),
(534, 'SH-HK-2016-013', 'Twintech Machine', 1, 28500, ' for SmartLine rooms upgrade', 12, 16, 1, 0, 2),
(535, 'SH-HK-2016-014', 'Blackout Curtain', 162, 280, ' for SmartLine rooms upgrade', 12, 16, 1, 0, 2),
(536, 'SH-HK-2016-015', 'Light Curtain', 162, 132, ' for SmartLine rooms upgrade', 12, 16, 1, 0, 2),
(538, 'SH-HK-2016-017', 'Holder for Big Towels', 162, 300, ' for SmartLine rooms upgrade', 12, 16, 1, 0, 2),
(541, 'SH-ENG-2016-005', 'Electronic frequency inverter   .', 1, 30000, 'For  fresh water pumps', 4, 16, 1, 0, 2),
(542, 'SH-IT-2016-001', 'Computre Desktop +  Screen 19"  ', 4, 6000, '1- For Engineering ( they have a laptop broken )                            2- For Cost Controller ( they have a damage pc )   3- for Quality Manager ( he have a bad old pc )       4- PC For IT Server', 2, 16, 1, 0, 2),
(551, 'SH-ENG-2016-006', 'Pumps 5.5 K.W Grundfos .', 2, 20000, 'For fresh water  network', 4, 16, 1, 0, 2),
(552, 'SH-ENG-2016-007', 'Exhaust fan 4000 cfm', 2, 7500, 'For smart line and Shedwan restaurant', 4, 16, 1, 0, 2),
(553, 'SH-ENG-2016-008', 'Full automatic dousing pumps .', 3, 10000, 'Cristal protocol', 4, 16, 1, 0, 2),
(556, 'SH-ENG-2016-011', 'Up great the satellite station &amp; network', 1, 30000, 'shedwan', 4, 16, 1, 0, 2),
(557, 'SH-ENG-2016-012', 'Horse-conditioning unit 55 redundant workers Cafeteria', 1, 114000, 'New - El Forsan', 4, 16, 1, 0, 2),
(561, 'SH-HR-2016-003', 'Computer unit', 1, 5100, '', 15, 16, 1, 0, 2),
(565, 'SH-HR-2016-007', 'Mixer ', 1, 10500, 'New - El Forsan', 15, 16, 1, 0, 2),
(566, 'SH-HR-2016-008', 'Refrigerator 2 door ', 1, 25000, 'New - El Forsan', 15, 16, 1, 0, 2),
(576, 'RM-KIT-2016-001', 'cold display for guard monger', 4, 15000, 'the current one are hopless cases', 6, 22, 1, 0, 2),
(577, 'RM-KIT-2016-002', 'Stainless refrigerator 2 doors 10 shelves ', 6, 27000, 'new one for mexican buffet and two replacement of OOO and extra 3 as per cristal', 6, 22, 1, 0, 2),
(578, 'RM-KIT-2016-003', 'Croissant oven 6 G.N ', 2, 35000, 'high guest satisfaction', 6, 22, 1, 0, 2),
(579, 'RM-KIT-2016-004', 'Food blender (stainless container Hamilton beach)', 2, 4000, 'we don''t have in any A''la carte restaurant', 6, 22, 1, 0, 2),
(580, 'RM-KIT-2016-005', 'Mixer 5 kg for the pastry section ', 2, 6000, 'we have two old OOO since 6 years', 6, 22, 2, 0, 2),
(586, 'RM-KIT-2016-011', 'Deep fryer gas double sink', 2, 25000, 'we have only one and it''s OOO', 6, 22, 1, 0, 2),
(587, 'RM-KIT-2016-012', 'Gas grille 70*90', 1, 8000, 'replacement for OOO one in main kitchen', 6, 22, 1, 0, 2),
(588, 'RM-KIT-2016-013', 'Pizza spreader', 2, 26000, 'replacement for OOO one', 6, 22, 1, 0, 2),
(589, 'RM-KIT-2016-014', 'dough cutting machine', 1, 15000, 'replacement for OOO one we spent more money for useless maintenance', 6, 22, 1, 0, 2),
(590, 'RM-KIT-2016-015', 'Toast cutting machine', 1, 4000, 'we don''t have any. and we need it for the huge operation and guest satisfation.', 6, 22, 2, 0, 2),
(592, 'RM-KIT-2016-017', 'soup bowl stainless', 4, 4500, 'two for mexican buffet and two for Dalila restaurant', 6, 22, 2, 0, 2),
(594, 'RM-KIT-2016-019', 'vertical belending machine 25K', 1, 25000, 'we have small one 10 KGM not enough for more than 40% occupancy', 6, 22, 1, 0, 2),
(596, 'RM-KIT-2016-021', 'Big pasta cooker 2 eyes', 2, 20000, 'main buffet has only very small one and needs to be supported for heavy common operation', 6, 22, 2, 0, 2),
(597, 'RM-KIT-2016-022', 'Dishwasher machine single tank with pressure ', 1, 65000, 'the one in Bedwin restaurant is OOO', 6, 22, 3, 0, 2),
(598, 'RM-KIT-2016-023', 'Glass washer machine ', 2, 28000, 'we need one for the family bar and italian restaurant as per cristal', 6, 22, 3, 0, 2),
(599, 'RM-KIT-2016-024', 'salamander', 1, 10000, 'we need one for the Steak house ', 6, 22, 1, 0, 2),
(600, 'RM-KIT-2016-025', 'single disc machine', 1, 4000, 'we need one for stewarded Department as Cristal information', 6, 22, 3, 0, 2),
(603, 'RM-ENG-2016-003', 'new electric panels for equipment ( earth leakage) ', 1, 80000, 'for safety wise to switch off equipments in case of electricity leaking', 4, 22, 1, 0, 2),
(606, 'RM-ENG-2016-006', 'change rooms to be handicap', 10, 15000, 'NN instruction & sales', 4, 22, 1, 0, 2),
(608, 'RM-ENG-2016-008', 'upgrade  pool bars', 1, 25000, ' very poor conditions since the opening', 4, 22, 2, 1, 2),
(610, 'RM-ENG-2016-010', 'Pub renovation', 1, 50000, 'as per chairman', 4, 22, 2, 0, 2),
(611, 'RM-ENG-2016-011', 'Hot water circulation pumps', 1, 80000, 'to avoid guest complain. we have very old small one', 4, 22, 1, 1, 2),
(613, 'RM-ENG-2016-013', 'Changing media &amp; repair for swimming pool sand fliters', 10, 15000, 'backwash of filter consume a lot of water plus very law results', 4, 22, 1, 0, 2),
(614, 'RM-ENG-2016-014', 'submersible injectors pumps for the sewage plant ', 4, 37500, 'the old pumps from opening the repair cost is very hight', 4, 22, 1, 0, 2),
(616, 'RM-ENG-2016-016', 'submersible pumps for the rooms machine ', 8, 2000, 'in case of water leakage to save the machines and people ', 4, 22, 1, 0, 2),
(617, 'RM-ENG-2016-017', 'Filteration pump', 3, 26000, 'the oldest pumps from opening the repair cost is very hight', 4, 22, 1, 0, 2),
(618, 'RM-ENG-2016-018', 'multi media filters for the potable water', 3, 30000, 'for safety wise to provide clean potable water for cooking and beverage instead of mineral water', 4, 22, 1, 0, 2),
(623, 'RM-ENG-2016-023', 'Mega tester ', 1, 9000, 'to test the electric cable and heaters for maintenance and insurance', 4, 22, 1, 0, 2),
(626, 'RM-ENG-2016-026', 'High pressure machine', 1, 5000, 'for preventative maintenance & cleaning the filters', 4, 22, 1, 0, 2),
(628, 'RM-ENG-2016-028', 'modify new rack with two line cards', 1, 150000, 'for emergency telephone lines at guest area corridors & we have not any spare line for guest and admin ', 4, 22, 2, 0, 2),
(632, 'RM-ENG-2016-032', 'A/C compressor for cold rooms', 3, 15000, 'we wasted more money and time to repair the old unit', 4, 22, 1, 0, 2),
(633, 'RM-ENG-2016-033', 'A/C compressor for DX units', 3, 8500, 'replacement', 4, 22, 1, 0, 2),
(635, 'RM-ENG-2016-035', 'A/C compressor for guest rooms 2.25&amp;2.5 3HP', 50, 1500, 'to facilitate changing the fused one in guest rooms.', 4, 22, 1, 0, 2),
(640, 'RM-ENG-2016-040', 'change defective cables, junction boxes and conduits at landscape', 43, 1600, 'guest and staff safety', 4, 22, 1, 0, 2),
(641, 'RM-ENG-2016-041', 'new electric panels for landscape ( earth leakage)', 15, 8000, 'guest and staff saftey', 4, 22, 1, 0, 2),
(643, 'RM-ENG-2016-043', 'changing defective cables, junction boxes indoor', 1, 50000, 'guest safety  and  equipments the old is bad looking ', 4, 22, 1, 0, 2),
(645, 'RM-ENG-2016-045', 'Rotating door for lobby', 1, 80000, 'to save the aircondtion at lobby area ', 4, 22, 1, 0, 2),
(646, 'RM-ENG-2016-046', 'club car control unit', 2, 6000, 'to repair the old club car ', 4, 22, 1, 0, 2),
(647, 'RM-ENG-2016-047', 'new motor for shuttle bus', 1, 25000, 'the motor from opening and need to be changed', 4, 22, 1, 0, 2),
(652, 'CB-FO-2016-003', 'Guest Service Directory', 400, 188, 'NN request, with all information about the hotel including services &amp; Facilties to be placed in all guest rooms', 18, 25, 1, 0, 2),
(654, 'CB-FO-2016-005', 'Tablet', 2, 5500, 'For the guest use according to the Grand Select concept we offer internet café', 18, 25, 1, 0, 2),
(655, 'CB-FO-2016-006', 'Wireless', 2, 3000, 'for the buttler service and for the Guest Service Center Team', 18, 25, 1, 0, 2),
(656, 'CB-REC-2016-001', 'Vacum Set', 3, 5000, 'For the swimming pools', 13, 25, 1, 0, 2),
(657, 'CB-REC-2016-002', 'Umbrella', 10, 2000, 'For the beach area and pool area', 13, 25, 1, 0, 2),
(658, 'CB-REC-2016-003', 'Sunbeds', 100, 1200, 'For the beach area and pool area', 13, 25, 1, 0, 2),
(659, 'CB-REC-2016-004', 'Windbreak Renovation', 30, 200, '<p>\n	Windbreak maintenance for the damaged old ones</p>\n', 13, 25, 1, 0, 2),
(660, 'CB-REC-2016-005', 'Leather mattress', 100, 300, 'for the beach sunbeds', 13, 25, 1, 0, 2),
(661, 'CB-REC-2016-006', 'Windbreak', 30, 600, 'For the beach area  ', 13, 25, 1, 0, 2),
(662, 'CB-REC-2016-007', 'Tennis Chair', 2, 1000, 'to replace old damaged one', 13, 25, 1, 0, 2),
(663, 'CB-REC-2016-008', 'Tennis Net Doubl face ', 2, 6000, 'to replace damaged old one', 13, 25, 1, 0, 2),
(664, 'CB-REC-2016-009', 'Football court Net', 100, 90, 'to replace damaged old one', 13, 25, 1, 0, 2),
(665, 'CB-REC-2016-010', 'Tennis Table', 1, 7000, 'to increase one table more as one is not enough for the guests', 13, 25, 1, 0, 2),
(666, 'CB-ACC-2016-001', 'New Digtetal  Scale 500 Kg', 1, 25000, 'Replace Old Receiving Scale  (This Scale Used From Conrad)', 3, 25, 1, 0, 2),
(667, 'CB-IT-2016-001', 'GBIC Single mode', 2, 3500, 'To enhance the network performance', 2, 25, 1, 2, 2),
(668, 'CB-IT-2016-002', 'Catalyst CISCO 2960 24 port', 1, 12000, 'To enhance the network performance', 2, 25, 1, 0, 2),
(669, 'CB-IT-2016-003', 'Office 2013 License', 25, 2000, 'License needs', 2, 25, 1, 0, 2),
(670, 'CB-IT-2016-004', 'Printer 401 HP', 1, 2500, 'for GSC Departmant replace for old one ', 2, 25, 2, 0, 2),
(671, 'CB-IT-2016-005', 'LapTop HP Probook', 1, 8000, 'For Conference Room', 2, 25, 2, 0, 2),
(675, 'CB-STA-2016-001', 'Boiler 50 liters', 2, 3000, 'Boiler for tea', 23, 25, 1, 0, 2),
(676, 'CB-STA-2016-002', 'Mixer soup ST/ST ( robot coupe )', 1, 12000, 'to be used in preparing meals ', 23, 25, 1, 0, 2),
(677, 'CB-STA-2016-003', 'Freezer Head 1 door', 1, 14000, 'to keep the meat ', 23, 25, 1, 0, 2),
(679, 'CB-STA-2016-005', 'Juice Mechanic', 1, 8500, 'to be used in staff cafetria ', 23, 25, 2, 0, 2),
(680, 'CB-STA-2016-006', 'Koldair', 2, 6000, 'for the staff in the hotel ', 23, 25, 1, 0, 2),
(681, 'CB-STA-2016-007', 'Table corian', 20, 350, 'to be used in staff cafetria ', 23, 25, 1, 0, 2),
(682, 'CB-STA-2016-008', 'Service trolley ST/ST 3 Level', 2, 3000, 'Kitchen service trolly for material transfer and for transfering the received items from stores ', 23, 25, 1, 0, 2),
(683, 'CB-STA-2016-009', 'Kitchen trolley ST/ST  10 shelf', 2, 6000, 'Kitchen trolly with trays to be kept in fridge ', 23, 25, 1, 0, 2),
(688, 'CB-HO-2016-005', 'Washing machine 3 kilo', 20, 375, 'for Managers rooms in the housing ', 22, 25, 1, 0, 2),
(692, 'MO-HK-2016-003', 'HK trolley', 4, 8500, 'To complete all buildings as it is missing since opening', 12, 26, 1, 0, 2),
(701, 'RM-ENG-2016-053', 'Electronic door lock', 10, 2700, 'we have not enough for spare ', 4, 22, 1, 0, 2),
(709, 'RM-ENG-2016-060', 'A/C compressors for fridges, freezers &amp; ice makers', 18, 4500, 'to increase the effeincy of all coling units', 4, 22, 1, 0, 2),
(712, 'RM-ENG-2016-063', 'Change steam network for boiler &amp; laundry', 1, 100000, 'the network is completely at very bad condition and cost of chemical is very hight  and steam and hot water ', 4, 22, 1, 0, 2),
(714, 'CB-HK-2016-001', 'Stainless Steel Ash Urns', 80, 550, 'to upgrade the number of ash urns and to complete the missing', 12, 25, 3, 0, 2),
(720, 'CB-HK-2016-007', 'Wooden Baby Cot for Guestrooms', 30, 1200, 'to replace the out of order ones', 12, 25, 1, 0, 2),
(721, 'CB-HK-2016-008', 'Light Curtains for Guestrooms and Suites', 100, 250, 'to replace the out of order ones', 12, 25, 1, 0, 2),
(722, 'CB-HK-2016-009', 'Black Out Curtains for Guestrooms and Suites', 40, 500, 'to replace the out of order ones', 12, 25, 1, 0, 2),
(723, 'CB-HK-2016-010', 'Runner for Guestrooms', 450, 160, 'to replace the current one as it became in bad condition', 12, 25, 1, 0, 2),
(724, 'CB-HK-2016-011', 'Skirting for Guestrooms', 650, 200, 'to replace the current one as it became in bad condition', 12, 25, 1, 0, 2),
(725, 'CB-HK-2016-012', 'Stainless Steel Garbage Bin 20 Liter', 20, 500, 'to replace the out of order ones', 12, 25, 1, 0, 2),
(730, 'CB-HK-2016-017', 'Digital Safe Box for rooms', 25, 800, 'to replace the out of order ones', 12, 25, 1, 0, 2),
(736, 'CB-HK-2016-023', 'Walk off mats for hotel & Villas entrances', 40, 1500, 'to replace the out of order and complete missing ones', 12, 25, 2, 0, 2);
INSERT INTO `plan_items` (`id`, `code`, `name`, `quantity`, `value`, `remarks`, `department_id`, `plan_id`, `priority_id`, `used`, `cancelled`) VALUES
(737, 'CB-HK-2016-024', 'Anti Slippery mats for Shower in rooms', 100, 300, 'to be used in guestrooms & villas shower area', 12, 25, 1, 0, 2),
(738, 'CB-HK-2016-025', 'Room Attendant Trolley', 12, 3000, 'to replace the out of order ones', 12, 25, 1, 0, 2),
(739, 'CB-HK-2016-026', 'Room Attendant Linen Trolley', 20, 1000, 'to replace the out of order ones', 12, 25, 1, 0, 2),
(740, 'CB-HK-2016-027', 'Extra Bed Trolley', 20, 1200, 'to be used for moving extra bed in rooms', 12, 25, 1, 0, 2),
(743, 'CB-HK-2016-030', 'Ladders for cleaning high surfaces', 22, 400, 'to be used for cleaning high surfaces in rooms and public areas', 12, 25, 1, 0, 2),
(746, 'CB-HK-2016-033', 'Balcony Table Rattan', 100, 300, 'to replace the current one as it became out of order', 12, 25, 1, 0, 2),
(747, 'CB-HK-2016-034', 'Stand Lamp for old guestrooms', 50, 250, 'to replace the current one as it became out of order', 12, 25, 2, 0, 2),
(750, 'CB-HK-2016-037', 'Air conditioner for Uniform Room', 1, 5000, '<p>\n	as the room is very hot during summer time</p>\n', 12, 25, 1, 0, 2),
(752, 'CB-FB-2016-002', 'High quality juice squeezer', 1, 40000, ' To be used for making fresh orange juice in the morning for all guest in house', 7, 25, 1, 1, 2),
(753, 'CB-FB-2016-003', 'Blender', 1, 6000, ' To be used for Felucca Fish Restaurant', 7, 25, 1, 1, 2),
(754, 'CB-FB-2016-004', 'Heat Lamp', 1, 4000, ' To be used for Poseidon Beach Restaurant and Grill House to keep the food heated enough', 7, 25, 3, 1, 2),
(755, 'CB-FB-2016-005', 'Mashrom/electric heaters ', 10, 3000, ' to be used in outdoors area during winter season ', 7, 25, 1, 10, 2),
(756, 'CB-FB-2016-006', 'Room service trolley ', 2, 6000, ' To be used for room service', 7, 25, 1, 0, 2),
(757, 'CB-FB-2016-007', 'Juice dispenser ', 2, 12000, ' To be used at the beach bar and Lobby Bar', 7, 25, 1, 2, 2),
(758, 'CB-FB-2016-008', 'Wine trolley', 1, 3000, ' To be used for lobby bar for selling wine', 7, 25, 1, 1, 2),
(759, 'CB-FB-2016-009', 'Mobil bar Cambro', 2, 20000, ' To be used for Main restaurant terrace and lobby bar terrace. ', 7, 25, 2, 0, 2),
(761, 'CB-GRD-2016-002', 'New irriggation network  for the island in front of hotel & renovation the old network inside hotel		', 1, 80000, ' for planted The Midle Island  As per Owner Request& renovation the old irrigation network inside hotel because its not working well.', 16, 25, 1, 0, 2),
(764, 'CB-GRD-2016-005', 'Automatic fertilization machine with assembly', 1, 10000, ' automatic fertilizaton machine for add the fertilizer automatic while irrigate gardens with the irrigation network', 16, 25, 2, 0, 2),
(765, 'CB-GRD-2016-006', 'mower grass machine 5.5 hp (HONDA)', 2, 11000, 'replacment for o o o machines', 16, 25, 1, 0, 2),
(768, 'CB-GRD-2016-009', 'overhauling for landscape machines', 1, 25000, '<p>\n	need it for the whole year</p>\n', 16, 25, 2, 0, 2),
(771, 'MO-HK-2016-009', 'Outdoor waste bin', 50, 450, 'To complete the missing including spare', 12, 26, 2, 0, 2),
(779, 'MO-REC-2016-002', 'Round sunbeds', 20, 3000, 'To complete 10 % of the rooms capacity', 13, 26, 1, 0, 2),
(780, 'MO-REC-2016-003', 'Pool Umbrellas', 100, 1650, 'To complete the missing order from opening', 13, 26, 2, 0, 2),
(781, 'MO-FB-2016-001', 'Club car', 1, 120000, 'For room service and F&B use', 7, 26, 1, 0, 2),
(799, 'MO-STE-2016-003', 'Stewrad stand shelves units', 15, 800, 'For proper storgae of equipments in steward stores', 24, 26, 1, 0, 2),
(800, 'MO-IT-2016-001', 'HP  Ram Memory 8GB DDR3 ', 6, 2000, 'fidelio server upgrade 8960 to 8962', 2, 26, 1, 0, 2),
(801, 'MO-IT-2016-002', 'San Storage 10 TB', 1, 12000, 'for backup servers as we do not have enough space', 2, 26, 1, 0, 2),
(802, 'MO-IT-2016-003', 'HP Switch 2920-24G-PoE', 1, 16000, 'for admin network', 2, 26, 1, 0, 2),
(803, 'MO-IT-2016-004', 'HP Elitedesk 800 G1 tower pc Core i5', 2, 7000, '1 for Bellman 1 for Desk Reception - missing since opening', 2, 26, 1, 0, 2),
(805, 'MO-IT-2016-006', 'Projector ', 1, 5000, 'For conference needs', 2, 26, 1, 0, 2),
(806, 'MO-SEC-2016-001', 'Security Mirror', 2, 3000, 'For security entrance (main gate & receiving gate', 14, 26, 1, 0, 2),
(807, 'MO-SEC-2016-002', 'Luggage Xray', 1, 275000, 'Security needs by governement', 14, 26, 1, 0, 2),
(809, 'MO-ENG-2016-001', ' Sewage network, anti smell valve for guest rooms', 273, 60, 'For avoiding bad smell in guest bathroom', 4, 26, 1, 0, 2),
(810, 'MO-ENG-2016-002', ' Grouting for rooms ', 134, 1500, ' (Second Phase, To complate all the hotel as the first phase was in 2015 ', 4, 26, 1, 0, 2),
(815, 'MO-ENG-2016-007', 'Indoor service bar for main restauarant', 1, 30000, 'To facilitate the guests services - construction only without tools', 4, 26, 1, 0, 2),
(823, 'CB-KIT-2016-001', 'Trolley Cambroo for pastry ', 2, 12000, 'for food transfer and pastries from the main building to Poseidon Restaurant and Felucca Restaurant, request from Cristal due to not enough cambro for food transfer from kitchen to outlets ', 6, 25, 1, 0, 2),
(824, 'CB-KIT-2016-002', 'Hand Mixer 60sm', 1, 18000, 'To prepare food in Kitchen ', 6, 25, 1, 0, 2),
(825, 'CB-KIT-2016-003', 'Flour mixer sp 80 Letter', 1, 66000, 'Flour Mixer For Pastry center ', 6, 25, 2, 0, 2),
(826, 'CB-KIT-2016-004', 'Potato Peeler 30kg ', 1, 78600, 'To be used in the preparation area for potatoes peeling and vegetables  ', 6, 25, 2, 0, 2),
(827, 'CB-KIT-2016-005', 'vertical freezer double door for fish kitchen', 1, 20000, 'To keep the fresh fish for Felucca restaurant and to separate the items in fredges ', 6, 25, 1, 0, 2),
(828, 'CB-KIT-2016-006', 'fryer unit built in unit for main buffet ', 1, 20000, 'To be used on buffet in Main Restaurant as the exist one is not enough for the operation if occupancy more than 60%', 6, 25, 1, 0, 2),
(829, 'CB-KIT-2016-007', 'Spiral mixer dough,80 liter', 1, 91850, 'To be used in pastry center (for 3 hotels) ', 6, 25, 3, 0, 2),
(830, 'CB-KIT-2016-008', 'convection oven (20 chefing dish)', 1, 120000, 'To be used in main kitchen as the exist one is not enough for the operation if over 60% and the exist one will be transferred to Poseidon kitchen  ', 6, 25, 1, 0, 2),
(831, 'CB-KIT-2016-009', 'electric blender for kitchen (4liters)', 2, 10000, 'To be used in Indian kitchen, Italian kitchen and pastry ', 6, 25, 3, 0, 2),
(832, 'CB-KIT-2016-010', 'hot cabinet double door for holding kitchen', 1, 82000, 'To be used in main kitchen as the exist one is not enough for the operation over 60% Occ', 6, 25, 1, 0, 2),
(833, 'CB-KIT-2016-011', 'stainless shelves (140*45*180 cmand50cm between shelves )  for walk in fridge ', 4, 3000, 'To be used in yogurt and cheese fridge & bakery fridge & pastry center fridge   ', 6, 25, 3, 0, 2),
(834, 'CB-KIT-2016-012', 'electric rice cooker ', 2, 10000, 'To be used in Indian kitchen and Felucca as per Cristal request to replace the out of order one', 6, 25, 1, 0, 2),
(835, 'CB-KIT-2016-013', 'gas cooker 6 fire', 1, 24000, 'To be used in Felucca kitchen (the existing is not enough and not good quality)  ', 6, 25, 1, 0, 2),
(836, 'CB-KIT-2016-014', 'vertical fridge for fish kitchen ', 1, 25000, 'to be used in fish defrost in Felucca, requested from Cristal  ', 6, 25, 1, 0, 2),
(837, 'CB-KIT-2016-015', 'trolley box with cover  for sugar and flour ', 2, 4000, 'To keep flour, sugar in pastry center ', 6, 25, 1, 0, 2),
(838, 'CB-KIT-2016-016', 'chocolate fountain 4 leayrs  for pastry ', 1, 30000, 'To be used in parties and events  ', 6, 25, 2, 0, 2),
(839, 'CB-KIT-2016-017', 'toaster machine for buffet', 1, 25000, ' To be used in main buffet and Royal buffet ', 6, 25, 1, 0, 2),
(840, 'CB-KIT-2016-018', 'moved salamander with heaters( heated 4 kw),', 2, 7750, ' To be used in Felucca kitchen and Indian kitchen', 6, 25, 2, 0, 2),
(841, 'CB-KIT-2016-019', ' normal fridge 8ft for caviar and special items  ', 1, 2000, 'Fridge to keep special kind of food (such as Caviar) ', 6, 25, 1, 0, 2),
(842, 'CB-STE-2016-001', 'black electric kettle soup ', 4, 2000, ' To be used on Buffet of Main Restaurant & Poseidon', 24, 25, 2, 0, 2),
(843, 'CB-STE-2016-002', 'Chefing dish belt in stanless1/2 for main buffet ', 4, 6000, 'To be used on buffet in Main Restaurant ', 24, 25, 1, 0, 2),
(844, 'CB-STE-2016-003', 'chefing dish belt in stanless1/1 for kids & Poseidon buffet ', 4, 4000, 'To be used in Poseidon buffet and kids buffet ', 24, 25, 3, 0, 2),
(845, 'CB-STE-2016-004', 'stainless counter table( 200*70*85 cm) for  main kitchen', 4, 3000, 'To be used in hot kitchen / preparation / cold kitchen and pastry ', 24, 25, 3, 0, 2),
(846, 'CB-STE-2016-005', 'Service trolley  stainless with three stainless shelves 100 × 80 × 85 cm,', 5, 2500, 'To be used in kitchen to replace the old damaged one  ', 24, 25, 3, 0, 2),
(847, 'CB-STE-2016-006', 'cambroo garbage trolley for depth garbage (380 liters)', 2, 7000, 'To transfer garbage from Poseidon, Felucca kitchen and outlets  ', 24, 25, 2, 0, 2),
(848, 'CB-STE-2016-007', 'stainless tank with heater for deep in cleaning (steward) (140*100*90cm)', 1, 7000, 'To wash stales steel tools and china ', 24, 25, 3, 0, 2),
(851, 'CB-ENG-2016-003', 'Door double lock for junior suites ', 87, 200, 'all the bed room in junior suites need lockable lock', 4, 25, 1, 0, 2),
(853, 'CB-ENG-2016-005', 'Telephone sets for guestrooms ', 50, 200, 'Instead of the old one it is not working well and to avoide the guest complains', 4, 25, 1, 0, 2),
(854, 'CB-ENG-2016-006', 'parking tenda for the cars ', 20, 2000, 'for the cars as the one exist is too small for 8 cars only', 4, 25, 1, 0, 2),
(855, 'CB-ENG-2016-007', 'Linen room ', 1, 30000, 'for linen receiving and collecting from the buildings', 4, 25, 1, 0, 2),
(856, 'CB-ENG-2016-008', 'Marbiel For Showers ', 25, 1100, 'to change all the damaged and broken marble in shower floor ', 4, 25, 1, 0, 2),
(857, 'CB-ENG-2016-009', 'cover of flash box in toilet   ', 50, 350, 'to change the damaged and broken covers of flash boxes', 4, 25, 1, 0, 2),
(858, 'CB-ENG-2016-010', 'Shower Roular', 50, 375, 'to replace the OOO', 4, 25, 1, 0, 2),
(860, 'CB-ENG-2016-012', 'Water Mixer - Shower Head', 50, 850, 'to replace the OOO', 4, 25, 2, 0, 2),
(862, 'CB-ENG-2016-014', 'Exhoust Fan For Guest Rooms', 75, 150, 'to replace the OOO', 4, 25, 1, 0, 2),
(863, 'CB-ENG-2016-015', 'Hair Dryer', 25, 400, 'to replace the OOO', 4, 25, 1, 0, 2),
(866, 'CB-ENG-2016-018', 'Marble Table Top for Coffe Table', 20, 450, 'To Avoid any stain in top due to the hot drink ( Polishing finish) for all villas ', 4, 25, 2, 0, 2),
(871, 'CB-ENG-2016-023', 'Painting all Pergola at hotel', 1, 85000, 'To keeping our quality & avoide the guest complains', 4, 25, 1, 0, 2),
(872, 'CB-ENG-2016-024', 'High Pressure Pump ', 1, 18000, 'To Clean the Coiles for the A.H.U', 4, 25, 1, 0, 2),
(873, 'CB-ENG-2016-025', 'Chiller Yearly overhauling', 2, 20000, '<p>\n	Oils and filters during the year</p>\n', 4, 25, 1, 0, 2),
(874, 'CB-ENG-2016-026', 'Air handling Unit 25 ton', 2, 120000, 'will replace 3 out of service AHU ', 4, 25, 1, 0, 2),
(875, 'CB-ENG-2016-027', 'A / C Splite unit for Guest rooms 3hp', 25, 6000, 'Instead of the old one it is not working well and to avoide the guest complains', 4, 25, 1, 0, 2),
(877, 'CB-ENG-2016-029', 'Thermostate for DX at outlet', 4, 2000, 'Save for Electricity cost', 4, 25, 1, 0, 2),
(879, 'CB-ENG-2016-031', 'DX Yearly Maintenance', 4, 10000, 'kitchen &amp;Staff cafeteria to keeping for machine prenew &amp;Quality ', 4, 25, 1, 0, 2),
(880, 'CB-ENG-2016-032', 'Submersible St.Steel pump ', 1, 9000, 'For boiler Room and STP', 4, 25, 1, 0, 2),
(881, 'CB-ENG-2016-033', 'Heating pump 65/160/107(boilers)', 2, 27000, 'To Replacement old pumps for the hot water of the rooms  ', 4, 25, 1, 0, 2),
(882, 'CB-ENG-2016-034', 'Filteration pump for fish Restaurant', 1, 5000, 'To Replacement old pumps ', 4, 25, 3, 0, 2),
(883, 'CB-ENG-2016-035', 'Filteration pump for (STP)', 2, 12000, 'To Replacement old pumps ', 4, 25, 1, 0, 2),
(884, 'CB-ENG-2016-036', 'Air Blower (STP)', 2, 75000, 'To Replacement old pumps ', 4, 25, 1, 0, 2),
(885, 'CB-ENG-2016-037', 'Submersible St.Steel pump from Recevied Tank to Air Tank (STP)', 3, 19000, 'To Replacement old pumps ', 4, 25, 1, 0, 2),
(886, 'CB-ENG-2016-038', 'Sand for Filter', 2, 7500, 'To Replacement old sand where Sand Valid now', 4, 25, 1, 0, 2),
(887, 'CB-ENG-2016-039', 'Exit & Emergency Light for Heart of the House', 50, 200, 'Includin the main kitchen ( As Per Crystal ) the existing one not working', 4, 25, 2, 0, 2),
(889, 'CB-ENG-2016-041', 'Emergency Lighting', 60, 400, 'To complete all areas at hotel', 4, 25, 1, 0, 2),
(894, 'CB-ENG-2016-046', 'Filteration Pump for Cold S.Pool', 1, 19000, 'replacement for s.pool old one ', 4, 25, 1, 0, 2),
(895, 'CB-ENG-2016-047', 'Heating Pump for Children pool&Villas', 4, 5000, 'replacement for s.pool old one ', 4, 25, 1, 0, 2),
(897, 'CB-ENG-2016-049', 'Submersible St.Steel pump ', 1, 9000, 'To Replace old pump', 4, 25, 1, 0, 2),
(898, 'CB-ENG-2016-050', 'Filter Pump for Jacuzzi &Cold S.Pool Vacuum', 2, 6500, 'To Replace old pumps ', 4, 25, 1, 0, 2),
(899, 'CB-ENG-2016-051', 'St.Steel Drainage for Filtration pump at heated pool', 4, 3000, 'To Replace old where it is iron', 4, 25, 1, 0, 2),
(900, 'CB-ENG-2016-052', 'Filteration Pump for S.pool villas', 2, 7000, 'To Replace old pumps ', 4, 25, 1, 0, 2),
(901, 'CB-ENG-2016-053', 'Sand For filters', 7, 7800, 'To Replacment old sand where it is bad quality', 4, 25, 1, 0, 2),
(905, 'CB-ENG-2016-057', 'Felucca Boat Yearly Overhauling', 1, 15000, '<p>\n	Annual overhauling as per law to renew the license</p>\n', 4, 25, 1, 0, 2),
(910, 'CB-ENG-2016-062', 'Renovation all Fire system at chellers', 1, 25000, 'New Item for Safety', 4, 25, 1, 0, 2),
(911, 'CB-ENG-2016-063', 'Tools&amp; Machines', 1, 25000, 'for workshops', 4, 25, 1, 0, 2),
(912, 'CB-ENG-2016-064', 'Cars overhauling', 1, 50000, '<p>\n	yearly overhauling</p>\n', 4, 25, 1, 0, 2),
(913, 'CB-ENG-2016-065', 'Yearly overhauling for power transformers', 3, 5000, '<p>\n	yearly overhauling</p>\n', 4, 25, 1, 0, 2),
(914, 'CB-ENG-2016-066', 'Yearly overhauling for Emergency Generator', 2, 10000, '<p>\n	yearly overhauling</p>\n', 4, 25, 1, 0, 2),
(915, 'CB-ENG-2016-067', 'Yearly overhauling for Hot Water Boiler', 3, 10000, '<p>\n	yearly overhauling</p>\n', 4, 25, 1, 0, 2),
(916, 'CB-ENG-2016-068', 'Battry for Generators', 4, 1100, 'need them for generator during the year', 4, 25, 2, 0, 2),
(917, 'CB-ENG-2016-069', 'Wire Machine for Drainage', 1, 15000, 'for all pipes and plumping', 4, 25, 3, 0, 2),
(918, 'CB-ENG-2016-070', 'Heater for Exchanger', 2, 30000, 'Instead of the old one it is not working well ', 4, 25, 1, 0, 2),
(919, 'CB-ENG-2016-071', 'Confos for generator', 1, 7000, 'New Item for Generator', 4, 25, 2, 0, 2),
(920, 'CB-ENG-2016-072', 'Yearly overhauling for Irrigation Station', 1, 15000, 'Pumps and Blowers', 4, 25, 1, 0, 2),
(922, 'CB-ENG-2016-074', 'Shelves for the HK stores', 1, 20000, 'to keep stauff on shelves ', 4, 25, 2, 0, 2),
(926, 'HO-FO-2016-001', 'Renovate the FO area ', 1, 45000, 'Renovate FO reception desk floor and counter and back area offices and FO manager office and replace old operator area to be asst. GSC MGR     # F', 18, 27, 1, 0, 2),
(927, 'HO-FO-2016-002', 'A/C unite 5 HP', 1, 9500, 'Replace depreciated fan coil air condition unit   #F', 18, 27, 1, 0, 2),
(928, 'HO-HK-2016-001', 'Voil cloths for the rooms ', 400, 40, ' Replacement    # F', 12, 27, 1, 0, 2),
(929, 'HO-HK-2016-002', 'Black out cloths for the rooms ', 200, 35, ' Replacement    # F', 12, 27, 1, 0, 2),
(932, 'HO-HK-2016-005', 'Mattress 200*140 cm', 71, 850, 'MOT 50% accomplished in 2015  # F', 12, 27, 1, 0, 2),
(933, 'HO-HK-2016-006', 'Mattress 200*160 cm', 100, 950, 'MOT 50% accomplished in 2015  # F', 12, 27, 1, 0, 2),
(934, 'HO-HK-2016-007', 'Mattress 200*100cm', 112, 600, 'MOT 50% accomplished in 2015  # F', 12, 27, 1, 0, 2),
(935, 'HO-HK-2016-008', 'Stainless steel basket rubbish for the rooms ', 100, 250, ' MOT Replacement     # F ', 12, 27, 1, 0, 2),
(936, 'HO-HK-2016-009', 'Stainless steel toilet brush ', 150, 75, 'MOT  Replacement     # F ', 12, 27, 1, 0, 2),
(937, 'HO-HK-2016-010', 'House man trolley ', 5, 1500, '  Replacement   will be made in central workshop   # F', 12, 27, 1, 0, 2),
(938, 'HO-HK-2016-011', 'Safe Box', 20, 450, '  Replacement     # F ', 12, 27, 1, 0, 2),
(939, 'HO-HK-2016-012', 'Mini Bar ', 20, 1000, '  Replacement     # F ', 12, 27, 1, 0, 2),
(940, 'HO-HK-2016-013', 'Marble floor the first floor and the 2 stairs  between rooms and the restaurant stair "', 1, 60000, 'MOT Renovation   # F', 12, 27, 1, 0, 2),
(941, 'HO-HK-2016-014', 'Carpets for the lobby ', 20, 1200, 'MOT Renovation   # F', 12, 27, 1, 0, 2),
(944, 'HO-HK-2016-017', 'Coffee tray set ', 80, 300, 'To complete all rooms  # C', 12, 27, 1, 0, 2),
(945, 'HO-HK-2016-018', 'A/C 5 HP. for linen room', 1, 9500, '  Replacement     # F ', 12, 27, 2, 0, 2),
(946, 'HO-HK-2016-019', 'Gloria Spraying machine ', 1, 5000, ' Replacement     # F ', 12, 27, 1, 0, 2),
(947, 'HO-HK-2016-020', 'Spraying portable motor ', 1, 5000, 'Replacement     # F ', 12, 27, 2, 0, 2),
(948, 'HO-HK-2016-021', 'Niblon 3 nozzles ', 1, 5000, 'Replacement     # F ', 12, 27, 3, 0, 2),
(949, 'HO-REC-2016-001', 'wind break metal ', 75, 300, 'New item # C', 13, 27, 2, 0, 2),
(950, 'HO-REC-2016-002', 'Umbrella', 25, 2500, 'New item to increase beach capacity  # C', 13, 27, 1, 0, 2),
(952, 'HO-REC-2016-004', 'Vacuum machine ', 1, 4000, '  Replacement     # F ', 13, 27, 2, 0, 2),
(953, 'HO-LND-2016-001', 'Valet number machine', 1, 1000, 'New item  # C', 5, 27, 3, 1, 2),
(957, 'HO-FB-2016-001', 'S.S Shelves', 1, 5000, 'Cristal Requests  # C', 7, 27, 2, 0, 2),
(958, 'HO-FB-2016-002', 'Banquet Chairs ', 50, 300, 'Conformance room   # C', 7, 27, 1, 0, 2),
(959, 'HO-FB-2016-003', 'Glass washer', 1, 12500, 'Cristal Requests for Mediterranean rest. and grand cafe   # C', 7, 27, 1, 0, 2),
(962, 'HO-FB-2016-006', 'Fresh orange juice machine', 1, 6000, 'New item for extra sales # C', 7, 27, 1, 0, 2),
(963, 'HO-FB-2016-007', 'Trolley ', 1, 2000, 'Replacement  # F', 7, 27, 2, 0, 2),
(964, 'HO-FB-2016-008', 'Plastic tables', 20, 300, 'Plastic tables for beach and pool party''s    # C', 7, 27, 2, 0, 2),
(965, 'HO-KIT-2016-001', 'Show fridge ', 1, 20000, 'For beach bar  # C', 6, 27, 2, 0, 2),
(966, 'HO-KIT-2016-002', 'Sneeze guard', 7, 6000, 'Cristal request 2 new sneeze guard for elsol with value of 11000 LE each and renovate 5 units in elsol and elarabi with value 4000 LE  per unit  # F', 6, 27, 1, 0, 2),
(967, 'HO-KIT-2016-003', 'Salamander ', 1, 5500, 'English request for cheese sandwiches   # C', 6, 27, 1, 0, 2),
(968, 'HO-KIT-2016-004', 'Dick oven 2 cell ', 1, 18000, 'Replacement for bakrey  # F', 6, 27, 2, 0, 2),
(970, 'HO-KIT-2016-006', '2 Door vertical fridge ', 1, 15000, 'Cristal Requests for elsol rest.  # C', 6, 27, 1, 0, 2),
(971, 'HO-ACC-2016-001', 'Receiving digital scale ', 1, 9000, 'Replace depreciated scale  # F', 3, 27, 2, 0, 2),
(972, 'HO-ACC-2016-002', 'Ceramic for the floor  F&B Store First Floor', 1, 36000, 'Replacement as per cristal  # F', 3, 27, 1, 0, 2),
(973, 'HO-ACC-2016-003', 'Desk Chairs ', 4, 500, 'Replace depreciated chairs in accounting office   # F', 3, 27, 1, 0, 2),
(974, 'HO-ACC-2016-004', 'Save box', 1, 4000, 'Replace depreciated safe in FC  office   # F', 3, 27, 1, 0, 2),
(975, 'HO-IT-2016-001', 'Hp Computer Set ', 5, 6000, 'Replace the old one in (Hr office- Paymaster) & new one for( GSC Office - training Office - Stores)  # F', 2, 27, 1, 5, 2),
(977, 'HO-IT-2016-003', 'Printer HP LaserJet', 3, 1000, 'For( Kitchen & HK Department & Financial Controller office)  # F', 2, 27, 1, 3, 2),
(978, 'HO-IT-2016-004', 'H.D 1 TB', 2, 700, 'For IT Office (Backup Date )   # C', 2, 27, 1, 2, 2),
(979, 'HO-SEC-2016-001', 'Complete fire fighting suit ', 2, 6000, 'New for fire fighting  # C', 14, 27, 1, 0, 2),
(980, 'HO-SEC-2016-002', 'X-Ray Metal Detector ', 1, 190000, '<p>\n	Tourist Police request # C</p>\n', 14, 27, 1, 0, 2),
(981, 'HO-SEC-2016-003', 'Explosives detector', 1, 20000, 'Tourist Police request  # C', 14, 27, 1, 0, 2),
(982, 'HO-SEC-2016-004', 'Fire extinguisher 6 kg Bavaria', 20, 500, 'Replace old fire extinguishers   # F', 14, 27, 1, 0, 2),
(984, 'HO-HR-2016-002', 'Air Condition 1.1/2 H', 1, 3500, 'New Staff Clinic  # C', 15, 27, 2, 0, 2),
(990, 'HO-HR-2016-008', 'New training room ', 1, 30000, 'Prepare the area beside HR office to be training room the project will include floor tiles , ceiling , air condition , chairs ,data projector , sound system, electrical works and lighting and desk   # C', 15, 27, 1, 0, 2),
(993, 'HO-HR-2016-011', '"Full renovation for staff locker ( floor,  ventilation,  painting)"', 1, 20000, 'MOT Replacement # F', 15, 27, 1, 0, 2),
(994, 'HO-HR-2016-012', 'New locker', 10, 1200, 'Replacement # F', 15, 27, 1, 0, 2),
(995, 'HO-STA-2016-001', 'EL Forsan Staff  Cafeteria', 1, 20000, 'Staff Cafeteria Upgrade  # F', 23, 27, 1, 0, 2),
(996, 'HO-STA-2016-002', 'water cooler', 1, 4000, 'Replacement # F', 23, 27, 1, 0, 2),
(997, 'HO-HO-2016-001', 'Fan', 10, 200, 'Staff Housing Asst Department  # C', 22, 27, 1, 0, 2),
(998, 'HO-HO-2016-002', 'Fridge', 7, 1200, 'Staff Housing Asst Department   # C', 22, 27, 1, 0, 2),
(999, 'HO-HO-2016-003', 'water cooler', 1, 4000, 'Replace depreciated unit in staff house   # F', 22, 27, 1, 0, 2),
(1003, 'HO-ENG-2016-002', 'Replace old TV station ', 1, 280000, 'Replace depreciated analog units  to digital and increase varity of tv channels as per guest request # F', 4, 27, 1, 0, 2),
(1004, 'HO-ENG-2016-003', 'Replace compressor unit for chiller 1', 1, 50000, 'Replace depreciated units  # F', 4, 27, 1, 0, 2),
(1005, 'HO-ENG-2016-004', 'Major repair and semi overall for all chiller ', 1, 60000, 'Semi over all for 5 chiller unit   # F', 4, 27, 1, 0, 2),
(1006, 'HO-ENG-2016-005', 'Ventilation fans ', 10, 2000, 'For guest rooms bathroom ventilation  # F', 4, 27, 1, 0, 2),
(1007, 'HO-ENG-2016-006', 'Main sound system replacement & adjustment ', 2, 10000, 'Replace depreciated units # F', 4, 27, 3, 0, 2),
(1008, 'HO-ENG-2016-007', 'Submersible 2 hp zenit pumps for sewage system', 4, 5000, 'Replace depreciated units # F', 4, 27, 1, 0, 2),
(1009, 'HO-ENG-2016-008', 'Speakers 2500 W JBL', 2, 8000, 'For disco to replace old units # F', 4, 27, 1, 0, 2),
(1010, 'HO-ENG-2016-009', 'M.P.F crown (500*2) amplifier ', 2, 4000, 'For disco  # C', 4, 27, 1, 0, 2),
(1011, 'HO-ENG-2016-010', 'Double CD (Danon ) 6500', 1, 5000, 'For disco  # C', 4, 27, 1, 0, 2),
(1012, 'HO-ENG-2016-011', 'Strop light 1000 w', 1, 1000, 'For disco  # C', 4, 27, 1, 0, 2),
(1013, 'HO-ENG-2016-012', 'Smoke machine', 1, 3000, 'For disco  # C', 4, 27, 1, 0, 2),
(1017, 'HO-ENG-2016-016', 'New slider', 2, 5000, 'Replace depreciated units  # F', 4, 27, 1, 0, 2),
(1019, 'HO-ENG-2016-018', 'welding machine ', 1, 3000, 'for eng. steel works ', 4, 27, 1, 0, 2),
(1020, 'HO-ENG-2016-019', 'New sliding door for the entrance ', 1, 25000, 'To replace old depreciated unit with new model as spare parts no longer available to the model we have # F', 4, 27, 1, 0, 2),
(1021, 'HO-ENG-2016-020', 'High pressure machine ', 1, 5000, 'For air conditions and fan coils cleaning  # F', 4, 27, 1, 0, 2),
(1023, 'HO-ENG-2016-022', 'New coil for elsol air hand unit ', 1, 15000, 'Replace depreciated unit to increase restaurant air condition efficiency  # F', 4, 27, 1, 0, 2),
(1024, 'HO-ENG-2016-023', 'Change old sewage station ceiling', 1, 37000, 'environmental affair audit safety as old ceiling depreciated  # F', 4, 27, 1, 0, 2),
(1025, 'SH-FB-2016-007', 'Ice Maker Machine 150 kg.', 1, 32000, 'For Guest Needs at Cocktail and them drink at summer time smartline Pool Bar', 7, 16, 1, 0, 2),
(1029, 'SH-HR-2016-014', 'water dispenser', 2, 1300, 'New - El Forsan', 15, 16, 1, 0, 2),
(1030, 'SH-HR-2016-015', 'Juice Machian 3 Tank ', 1, 9000, 'New - El Forsan', 15, 16, 1, 0, 2),
(1031, 'SH-HR-2016-016', ' Cooking Setather Gas', 1, 12000, 'New - El Forsan', 15, 16, 1, 0, 2),
(1032, 'SH-HR-2016-017', 'Freezer', 1, 5000, 'New - El Forsan', 15, 16, 1, 0, 2),
(1033, 'CB-ENG-2016-078', 'Filtration system for the waterfalls in the main entrance', 2, 20000, 'filtration system for the waterfall ', 4, 25, 2, 0, 2),
(1034, 'RM-REC-2016-007', 'Complete the wind breaker', 373, 540, 'complete the project of the wind breaker in the swimming pools and the beach area', 13, 22, 1, 0, 2),
(1039, 'LJ-KIT-2016-001', 'Food processor', 2, 22000, 'the old one very bad condition', 6, 29, 1, 0, 2),
(1040, 'LJ-KIT-2016-002', 'Cold cabnet -2door ', 1, 66000, '<p>\n	the old one very bad condition</p>\n', 6, 29, 1, 0, 2),
(1041, 'LJ-KIT-2016-003', 'Campro trolley', 2, 6000, 'the old one very bad condition', 6, 29, 1, 0, 2),
(1042, 'LJ-KIT-2016-004', 'Hot cabnet - 2door', 2, 75000, 'the old one very bad condition', 6, 29, 1, 0, 2),
(1043, 'LJ-KIT-2016-005', 'Meat mincer', 1, 40000, 'the old one very bad condition', 6, 29, 1, 0, 2),
(1044, 'LJ-KIT-2016-006', 'Fixing marble 4cm at Lejardien ', 1, 40000, 'the old one very bad condition', 6, 29, 1, 0, 2),
(1051, 'DB-HK-2016-006', 'twintek machine', 1, 26500, 'it has been repairaed last years and spent almost the same price ', 12, 28, 1, 0, 2),
(1061, 'MP-HK-2016-023', 'themed Family Rooms', 30, 7000, 'for more guest satisfaction', 12, 23, 1, 0, 2),
(1067, 'DB-REC-2016-004', 'plastic table between sun bed', 200, 100, 'In The very bad condition', 13, 28, 1, 0, 2),
(1069, 'DB-FB-2016-001', 'Cold milker', 2, 5000, 'For italian Resturant during the brakfast as it is missing', 7, 28, 1, 2, 2),
(1072, 'DB-FB-2016-004', 'Bar Blender heavy duty', 2, 4200, '<p>	for the new bars ( Relax Pool bar - Terrace Bar ) as they are missing</p>', 7, 28, 1, 2, 2),
(1074, 'DB-FB-2016-006', 'Crushed ice machine', 2, 11000, 'for the new bars ( Relax Pool bar - Terrace Bar ) as they are missing', 7, 28, 1, 2, 2),
(1076, 'DB-IT-2016-001', 'Computer set HP pro 3500 i5', 8, 7700, 'the old computers at the server need to upgraded to be link with the main server in hurghada', 2, 28, 1, 0, 2),
(1078, 'DB-SEC-2016-001', 'electronic Gate for staff', 1, 12000, '<p>\n	As Per minstry of Tourism</p>\n', 14, 28, 1, 0, 2),
(1085, 'DB-ENG-2016-002', 'Zenit Pump Model EDG150M 70 ph', 3, 95000, 'For new main hole and old main hole', 4, 28, 1, 0, 2),
(1086, 'DB-ENG-2016-003', 'New manhole', 1, 50000, 'the exciting one is too small for the operation and caused alot of incidents and guest complains', 4, 28, 1, 0, 2),
(1087, 'DB-ENG-2016-004', 'AC compressors ', 40, 2000, 'for guest rooms', 4, 28, 1, 0, 2),
(1088, 'DB-ENG-2016-005', 'Mini Bar', 100, 1200, 'to replace the exciting one who caused alot of guest complains', 4, 28, 1, 0, 2),
(1091, 'DB-ENG-2016-008', 'Bath room grouting', 170, 200, 'to improve the outdated guest room toilets', 4, 28, 1, 0, 2),
(1092, 'DB-ENG-2016-009', 'change room accessories', 200, 300, 'complete rusted material need  to be re polished as a complete set ', 4, 28, 1, 0, 2),
(1093, 'DB-ENG-2016-010', 'changing stalite from anlug to digital', 1, 200000, 'the New LED TV''s not matching with the analouge Satelite system ', 4, 28, 1, 0, 2),
(1104, 'DB-ENG-2016-021', 'Main resturant terrace', 1, 150000, 'in very bad condition', 4, 28, 1, 0, 2),
(1105, 'DB-ENG-2016-022', 'Ac split unit 7.5HP', 4, 16500, 'For Saving Electricity since the Dico AC operated through the Main chiller ( waste of energy ) ', 4, 28, 1, 0, 2),
(1107, 'DB-ENG-2016-024', 'Pergolas (Wood - Cloth) around pools I/O Umbrellas  ( relax-family ) pool', 1, 120000, 'to replacing the umberlla', 4, 28, 1, 0, 2),
(1110, 'MO-ENG-2016-016', 'Fixing Shower Glass window in guest rooms', 210, 1500, 'To prevent the damage caused by leakage and to improve rooms standard ', 4, 26, 1, 0, 2),
(1112, 'CB-HK-2016-038', 'Extra Bed for Guestrooms', 30, 1600, 'to replace the out of order ones', 12, 25, 1, 0, 2),
(1113, 'LJ-IT-2016-001', 'Kingston 4GB Ram Memory Kit For Desktop (2X2GB )inch LED Monitor', 20, 560, 'To upgrade requirements', 2, 29, 1, 0, 2),
(1114, 'CB-ENG-2016-080', 'Electronic Door Bell', 50, 800, 'to replace the out of order ones', 4, 25, 1, 0, 2),
(1115, 'CB-ENG-2016-081', 'Lamp for Desk in Old Rooms', 226, 150, 'to replace the current one as it became out of order', 4, 25, 1, 0, 2),
(1116, 'CB-ENG-2016-082', 'Lamp for Commode in Old Rooms', 226, 200, 'to replace the current one as it became out of order', 4, 25, 2, 0, 2),
(1117, 'LJ-IT-2016-002', 'Samsung 18.5-inch LED Monitor', 10, 850, 'To replace and renew the computer screen', 2, 29, 1, 0, 2),
(1118, 'LJ-IT-2016-003', 'LINKSYS LGS318P 18-PORT BUSINESS GIGABIT SMART SWITCH POE+', 2, 3000, 'To use internet in Riviera & Le Jardin', 2, 29, 1, 0, 2),
(1119, 'LJ-IT-2016-004', 'LINKSYS LAPAC1750PRO BUSINESS ACCESS POINT WIRELESS WI-FI DUAL BAND 2.4 + 5GHZ AC1750 WITH POE (5 Pieces)', 1, 12000, 'To use internet in Riviera & Le Jardin', 2, 29, 2, 0, 2),
(1120, 'LJ-STE-2016-002', 'Tub soak. 500 liter', 1, 15000, 'The old is not enough', 24, 29, 1, 0, 2),
(1121, 'LJ-SEC-2016-001', 'Gate security metal detectors for (Lejardin &amp;Riviera)Hotels', 2, 14500, '   the old one is not working and Repair cost nearest to new gate price.', 14, 29, 1, 0, 2),
(1124, 'LJ-SEC-2016-004', 'Electronic door machine in the entrance lopy le jardin.', 1, 50000, '   the old one is not working and canot  Repair .', 14, 29, 1, 0, 2),
(1126, 'DB-KIT-2016-002', 'Dish wisher Machin Hobart 3 stage', 1, 300000, 'The old Dishwasher has been repaired for several time and last issuing maintenance cost was 70000 LE for the main dining room', 6, 28, 1, 0, 2),
(1127, 'DB-KIT-2016-003', 'Toaster - Italian made', 1, 11000, 'the avilaable one is not suitible for mass production main dining room', 6, 28, 1, 0, 2),
(1129, 'DB-KIT-2016-005', 'Fridge vertical size (140 * 81 *219) 1400 litter Italy ', 1, 25000, 'to improve the refilling process in pastry section at the italian restaurant', 6, 28, 1, 0, 2),
(1131, 'DB-KIT-2016-007', 'Shawarma Machine 1 E', 1, 9000, 'saving Energy - for the BBQ and egyptian buffet item', 6, 28, 1, 0, 2),
(1133, 'DB-KIT-2016-009', 'large dough mixer 40 Litter', 1, 45000, 'the old machine was repaired several time with high cost in addition it is not applicable for high production business', 6, 28, 1, 0, 2),
(1134, 'DB-KIT-2016-010', 'Salamander ', 1, 18000, 'for the main dining room since it is missing', 6, 28, 1, 0, 2),
(1135, 'DB-KIT-2016-011', 'Microwave Italy 100 Litter for main kitchen ', 1, 8000, 'for the main dining room since it is missing', 6, 28, 1, 0, 2),
(1136, 'DB-KIT-2016-012', 'Chafing dish 1/1 rectangle ', 20, 5200, 'for the BBQ outside buffet and Gala Dinner', 6, 28, 1, 0, 2),
(1137, 'DB-KIT-2016-013', 'Chafing dish 1/1 round 40 cm', 20, 4000, 'Replacement the old one', 6, 28, 1, 0, 2),
(1138, 'DB-KIT-2016-014', 'Chafing dish 1/1 round 20 cm', 20, 3300, 'for the BBQ outside buffet and Gala Dinner', 6, 28, 1, 0, 2),
(1140, 'LJ-STA-2016-001', 'Colder', 2, 3850, 'To coverage El Foursan Cafeteria', 23, 29, 1, 0, 2),
(1141, 'LJ-STA-2016-002', 'Filter Unit  7stages', 2, 4000, 'To coverage El Foursan Cafeteria', 23, 29, 1, 0, 2),
(1142, 'LJ-STA-2016-003', 'Hot cabinet 2 Door forced hot air 40g/N1/1', 1, 66000, 'Instead of Hot cabinet which had kitchen taken to the German Resturant', 23, 29, 1, 0, 2),
(1143, 'LJ-STA-2016-004', 'Mixer Soup -Robot -Coupe- France Mp-600 Ultra', 1, 12000, 'Instead of Mixer Soup which had kitchen taken', 23, 29, 1, 0, 2),
(1144, 'LJ-HO-2016-001', 'Colder', 3, 3850, 'To coverage Three Staff Housing Buildings', 22, 29, 1, 0, 2),
(1145, 'LJ-HO-2016-002', 'Filter Unit 7 stages', 3, 4000, 'To coverage Three Staff Housing Buildings', 22, 29, 1, 0, 2),
(1146, 'AB-FB-2016-006', 'Nespresso Machines', 42, 2000, 'to upgrade the suits', 7, 24, 1, 0, 2),
(1148, 'RM-KIT-2016-026', 'vegetables cutting machine', 1, 18000, 'we have one since the opening out of order ', 6, 22, 1, 0, 2),
(1149, 'RM-KIT-2016-027', 'potato cutting machine', 1, 18000, 'replacement for a very small OOO ', 6, 22, 1, 0, 2),
(1150, 'RM-KIT-2016-028', 'cambro trolleys large size', 4, 19000, 'as per Cristal and hygiene Stander we need to have in all era one trolleye ', 6, 22, 1, 0, 2),
(1151, 'RM-KIT-2016-029', 'Rotating Oven', 1, 450000, 'replacement for a very small OOO since the opening', 6, 22, 1, 0, 2),
(1152, 'RM-KIT-2016-030', 'show display fridge', 2, 30000, 'we have one in the Steak house not working and we need one More as Cristal Information  ', 6, 22, 1, 0, 2),
(1153, 'RM-ENG-2016-064', 'Suzuki Van', 1, 70000, 'instead of new club car ', 4, 22, 2, 0, 2),
(1154, 'RM-ENG-2016-065', 'Poly athanal Covers', 1, 75000, 'for garden zero cost after installing and safe', 4, 22, 1, 0, 2),
(1155, 'RM-ENG-2016-066', 'Repair overflow for sports pool', 1, 90000, 'to reduce wested water  ', 4, 22, 1, 0, 2),
(1156, 'RM-ENG-2016-067', 'Pool Rocks removing ', 1, 80000, 'more siting area around pools and adjust overflow od s,pools', 4, 22, 2, 0, 2),
(1159, 'RM-AG-2016-001', 'office arm chairs', 3, 1800, 'very old and broken arm chairs', 8, 22, 1, 0, 2),
(1160, 'DB-FB-2016-007', 'Granitta maker', 2, 15000, 'to minimize the high beverage consumption', 7, 28, 1, 2, 2),
(1161, 'RM-KIT-2016-031', 'Microwave', 4, 3500, 'for fast reheating the food as per cristal', 6, 22, 3, 0, 2),
(1162, 'RM-ENG-2016-068', 'Ventilation of swimming pools machine rooms', 3, 9000, 'cristal recommendation for safety', 4, 22, 3, 0, 2),
(1163, 'RM-ENG-2016-069', 'Insulation for cold &amp; hot water polypropylene pipe at the roofs', 1, 14000, 'guest complain from water temprature', 4, 22, 1, 0, 2),
(1164, 'RM-ENG-2016-070', 'new interface port', 1, 30000, 'call acount system spare', 4, 22, 3, 0, 2),
(1165, 'RM-ENG-2016-071', 'A/C split fan cool for guest rooms and some outlets', 10, 5000, 'spare for 850 units', 4, 22, 3, 0, 2),
(1168, 'RM-KIT-2016-032', 'Oven grille 6 flame ', 1, 27500, 'supporting the old one in the kitchen for high occupancy', 6, 22, 3, 0, 2),
(1169, 'RM-KIT-2016-033', 'Chiller 10G.N', 1, 86350, 'for all cold food freezing chock as per cristal', 6, 22, 1, 0, 2),
(1170, 'RM-ENG-2016-072', 'Connecting DX unites to Fire Alarm', 1, 15000, 'civil defence', 4, 22, 1, 0, 2),
(1171, 'RM-ENG-2016-073', 'New Shower at Aqua Park Area', 1, 35000, 'we have only one for all the area and not enough', 4, 22, 3, 0, 2),
(1172, 'RM-ENG-2016-074', 'Change all valve at roof of building 10 &amp; new family ', 500, 120, 'all old valves are blocked', 4, 22, 2, 0, 2),
(1173, 'RM-ENG-2016-075', 'Complete the fire fighting pipe beside Lobby Area', 1, 120000, 'civil defence', 4, 22, 3, 0, 2),
(1174, 'RM-ENG-2016-076', 'Replace 1000M Concrete board for main Entrance ', 1, 75000, 'old are completely damaged in the hotel entrance', 4, 22, 3, 0, 2),
(1176, 'RM-ENG-2016-077', 'water dosing system for portable water , kitchen f&amp;B ', 1, 30000, 'health safety to guarantee percentage of chemicals in the water', 4, 22, 2, 0, 2),
(1177, 'RM-ENG-2016-078', 'Ceiling outlets adjusting ', 1, 20000, 'old were spoiled after rain', 4, 22, 2, 0, 2),
(1178, 'RM-ENG-2016-079', 'DX units for the kitchen', 3, 150000, 'kitchen has only 3 for all sections', 4, 22, 1, 0, 2),
(1179, 'LJ-HK-2016-001', 'Black out curtains for guest rooms', 3504, 31, '<p>\n	To replace the old and damaged curtains which is in very bad condition</p>\n', 12, 29, 1, 0, 2),
(1180, 'LJ-HK-2016-002', 'Stainless Rubish bins for guest  rooms toilets ', 500, 83, 'To replace the Rusted and damaged bins', 12, 29, 1, 0, 2),
(1181, 'LJ-HK-2016-003', 'Painting for 920 rooms and all corridors for both hotels ', 920, 300, 'Rooms walls and ceilings in very bad condition and in urgent need for painting ', 12, 29, 1, 0, 2),
(1182, 'LJ-HK-2016-004', 'Bathrooms Curtains  for 920 guest rooms', 920, 45, 'To replace the old and damaged curtains which is in very bad condition', 12, 29, 1, 0, 2),
(1183, 'LJ-HK-2016-005', 'Light curtains for 500 guest rooms', 920, 13, 'To replace the old and damaged curtains which is in very bad condition', 12, 29, 2, 0, 2),
(1184, 'LJ-HK-2016-006', 'Extra Bed for Guest rooms', 100, 1000, 'To cover the shortage in case of high occupancy , as the total number of exists extra beds are not enough', 12, 29, 1, 0, 2),
(1185, 'LJ-REC-2016-001', 'Wooden Sun beds ', 400, 500, 'To replace the damaged plastic Sunbeds , also to To cover the shortage in case of high occupancy', 13, 29, 1, 0, 2),
(1187, 'LJ-ENG-2016-001', 'Repair firefighting network for (Lejardin &Riviera)Hotels', 2, 200000, 'Leaking in the firefighting network under the ground', 4, 29, 1, 0, 2),
(1188, 'LJ-ENG-2016-002', 'Expansion Joints for walls and floors (le Jardin &Riviera)Hotels (1500M)', 1500, 80, 'New Expansion Joints for walls and floors (le jardin &Riviera)Hotels(1500 M)', 4, 29, 1, 0, 2),
(1189, 'LJ-ENG-2016-003', 'Submersible pumps for Water treatment plant.7.5hp with control units.', 4, 20000, 'Old one in very bad condition.', 4, 29, 1, 0, 2),
(1190, 'LJ-ENG-2016-004', 'new two Lighters .one for steam boiler and another one for hot water boiler', 2, 26000, 'the old one in very bad condition (and to saving the  fuel consumptions).', 4, 29, 1, 0, 2),
(1191, 'LJ-ENG-2016-005', 'Firefighting system for (Generators-Transformers)rooms.', 6, 60000, 'Installation Fire Fighting system for (Generators-Transformers) . (Hotel License)', 4, 29, 1, 0, 2),
(1192, 'LJ-ENG-2016-006', 'change the internal iron pipes for hot water boilers .', 4, 30000, 'Old one in very bad condition.and not safe.', 4, 29, 1, 0, 2),
(1193, 'LJ-ENG-2016-007', 'Renewal to the elevators (inside cabin, emergence device, inverters and accessories)', 22, 8000, 'to improve the elevators conditions and safe it.', 4, 29, 1, 0, 2),
(1194, 'LJ-ENG-2016-008', 'compressors for DX units  .', 4, 11000, 'Old one in very bad condition.', 4, 29, 1, 0, 2),
(1195, 'LJ-ENG-2016-009', 'renewal the power factor units .', 3, 30000, 'the old unit is damaged (to saving the electricity consumption)', 4, 29, 1, 0, 2),
(1196, 'LJ-ENG-2016-010', 'Change key cylinder for (two hotels)', 920, 100, 'Change key cylinder from normal to computer cylinder(two hotels )', 4, 29, 1, 0, 2),
(1197, 'LJ-GRD-2016-001', 'New irrigation pumpes 7.5hp .380v', 2, 21000, 'Old one in very bad condition.', 16, 29, 1, 0, 2),
(1198, 'LJ-GRD-2016-002', 'Grass cutting machine.', 1, 10000, 'Old one in very bad condition.', 16, 29, 1, 0, 2),
(1199, 'SH-HK-2016-018', 'Rooms Furniture', 162, 350, 'bench &amp; bed back for SmartLine rooms upgrad', 12, 16, 1, 0, 2),
(1200, 'SH-HK-2016-019', 'Wall ablique ', 486, 150, '', 12, 16, 1, 0, 2),
(1202, 'HO-MAJ-2016-001', 'Island maintenance ', 1, 1200000, '<p>\n	Major repair for the island as its start to depreciate&nbsp;</p>\n', 27, 27, 1, 0, 2),
(1203, 'HO-MAJ-2016-002', 'AC control for rooms', 100, 1200, '<p>\n	MOT Reques</p>\n', 0, 27, 1, 0, 2),
(1204, 'HO-MAJ-2016-003', 'New sea stairs stainless steel ', 1, 30000, '<p>\n	Replace depreciated units&nbsp;</p>\n', 27, 27, 1, 0, 2),
(1205, 'HO-MAJ-2016-004', 'Renovate swimming pool dick  tiles and isolation ', 1, 130000, '<p>\n	MOT</p>\n', 27, 27, 1, 0, 2),
(1206, 'HO-MAJ-2016-005', 'Desco renovation ', 1, 50000, '<p>\n	MOT</p>\n', 27, 27, 1, 0, 2),
(1207, 'HO-MAJ-2016-002', 'AC control for rooms ', 100, 1200, '<p>\n	Replace depreciated units&nbsp;</p>\n', 27, 27, 1, 0, 2),
(1214, 'MO-MAJ-2016-007', 'HP Ram Memory 8GB DDR3', 6, 2000, '<p>\n	Fidelio server upgrade 8960 to 8962</p>\n', 27, 0, 1, 0, 2),
(1225, 'MO-MAJ-2016-001', 'Public toilets for Relax Pool', 1, 50000, '<p>\n	We do not have toilets for the guests in this area -missing since opening</p>\n', 27, 26, 1, 0, 2),
(1226, 'MO-MAJ-2016-002', 'Walkway alignment & stainless  handrail for Public walkway', 1, 450000, '<p>\n	For guests safety as we have many accidents and complaints</p>\n', 27, 26, 1, 0, 2),
(1227, 'MO-MAJ-2016-003', 'New Indian Restaurant (F&B)', 1, 65800, '<p>\n	To increase the variety of Restaurants and increase F&amp;B Revenue</p>\n', 27, 26, 2, 0, 2),
(1228, 'MO-MAJ-2016-004', 'New Indian Restaurant (Kit)', 1, 63000, '<p>\n	To increase the variety of Restaurants and increase F&amp;B Revenue</p>\n', 27, 26, 2, 0, 2),
(1229, 'GB-MAJ-2016=001', 'Main Restaurant  Buffet Renovation of the rooms & MR interior Renovation', 1, 1500000, NULL, 27, 21, 1, 1, 2),
(1230, 'GB-MAJ-2016-002', 'Green Restaurant', 1, 500000, NULL, 27, 21, 1, 1, 2),
(1231, 'GB-MAJ-2016-003', 'Italian Restaurant Renovation', 1, 500000, NULL, 27, 21, 1, 0, 2),
(1232, 'GB-MAJ-2016-004', 'Rooms Renovation (two buildings ) 70 Rooms swim up rooms', 70, 14286, NULL, 27, 21, 1, 0, 2),
(1233, 'GB-MAJ-2016-005', 'swim up rooms pools', 10, 150000, NULL, 27, 21, 1, 0, 2),
(1234, 'GB-MAJ-2016-006', 'bunk bed ', 60, 2300, NULL, 27, 21, 1, 0, 2),
(1235, 'GB-Maj-2016-007', 'sun bed', 200, 1300, '<p>\n	for Aqua Park</p>\n', 27, 21, 1, 0, 2),
(1236, 'GB-MAJ-2016-008', 'irregation system completion ', 1, 60000, NULL, 27, 21, 1, 0, 2),
(1237, 'GB-MAJ-2016-009', 'Marina Renovation ', 1, 3000000, NULL, 27, 21, 1, 0, 2),
(1238, 'MP-MAj-2016-001', 'Main Restaurant  Buffet Renovation of the rooms & MR interior Renovation', 1, 1000000, NULL, 27, 0, 1, 0, 2),
(1239, 'MP-MAJ-2016-002', 'Lobby Furniture', 1, 500000, NULL, 27, 23, 1, 0, 2),
(1240, 'MP-MAJ-2016-001', 'Main Restaurant  Buffet Renovation of the rooms & MR interior Renovation', 1, 1000000, NULL, 27, 23, 1, 0, 2),
(1241, 'MP-MAj-2016-003', 'Renweal for all Hotel suites Master & Junior', 1, 450000, NULL, 27, 23, 1, 0, 2),
(1242, 'MP-MAJ-2016-004', 'All walk ways between MP and CB& between GB & MP', 1, 1000000, NULL, 27, 23, 1, 0, 2),
(1243, 'MP-MAJ-2016-005', 'Swimming pool isolation & Waterfalls', 1, 3500000, NULL, 27, 23, 1, 0, 2),
(1244, 'MP-MAJ-2016-006', 'Complete Filters Uint for irregation station ', 1, 150000, NULL, 27, 23, 1, 0, 2),
(1245, 'MP-MAJ-2016-007', 'ireregation station Pump ', 2, 45000, NULL, 27, 23, 1, 0, 2),
(1246, 'MP-MAJ-2016-008', 'submersiable Tesrumi  pump 5 HP ', 5, 19000, NULL, 27, 23, 1, 0, 2),
(1247, 'MP-MAJ-2016-009', 'Repainting wooden pergola swimming pool', 1, 75000, NULL, 27, 23, 1, 0, 2),
(1248, 'DB-MAJ-2016=001', 'Club Car Over all', 4, 120000, '<div>\n	To replace the Cushman because the Cushman&nbsp;</div>\n<div>\n	spare parts is very expensive more over it&nbsp;</div>\n', 27, 28, 1, 0, 2),
(1249, 'DB-Maj-2016-002', 'Office chairs for back area', 12, 900, '<p>\n	Missing Items - Very bad condition&nbsp;</p>\n', 27, 28, 1, 0, 2),
(1250, 'DB-Maj-2016-003', 'Dressing chair ', 438, 440, '<p>\n	Very bad condition&nbsp;</p>\n', 27, 28, 1, 0, 2),
(1251, 'DB-MAJ-2016-004', 'Public trolley HK', 10, 4500, '<p>\n	Very bad condition&nbsp;</p>\n', 27, 28, 1, 0, 2),
(1252, 'DB-MAJ-2016-005', 'Iron Board ', 40, 500, '<div>\n	For guest satisfaction -&nbsp;</div>\n<div>\n	many orders at the GSC</div>\n', 27, 28, 1, 0, 2),
(1253, 'DB-Maj-2016-006', 'New Fixed Marina', 1, 350000, '<p>\n	Very bad condition&nbsp;</p>\n', 27, 28, 1, 0, 2),
(1254, 'DB-MAJ-2016-007', 'Pool Towel center ', 2, 16000, '<p>\n	Not exist - using side station counter</p>\n', 27, 28, 1, 0, 2),
(1255, 'DB-MAJ-2016-008', 'New TC kids club ', 1, 100000, '<p>\n	For Relax pool - Active pool</p>\n', 27, 28, 1, 0, 2),
(1256, 'DB-Maj-2016-009', 'Soup kettle 10 liter Italy ', 4, 2000, '<p>\n	Soup Corner in the main Restaurant</p>\n', 27, 28, 1, 0, 2),
(1257, 'DB-MAJ-2016-010', 'Potato peeler 20KG', 1, 22000, '<div>\n	the maintenance fees and spare parts&nbsp;</div>\n<div>\n	are almost the same price of the new one</div>\n', 27, 28, 1, 0, 2),
(1258, 'DB-MAJ-2016-011', 'Heater 2 eye for buffet', 2, 1500, '<p>\n	missing items</p>\n', 27, 28, 1, 0, 2),
(1259, 'DB-MAJ-2016-012', 'X-Ray ', 1, 27500, '<p>\n	As per Ministry of Tourism Requirements</p>\n', 27, 28, 1, 0, 2),
(1260, 'Db-MAJ-2016-013', 'ID Machine ', 1, 28000, '<p>\n	The old one in a very bad condition&nbsp;</p>\n', 27, 28, 1, 0, 2),
(1261, 'DB-MAJ-2016-014', 'Staff bus ', 1, 200000, '<div>\n	the current 2 bus out of orders and&nbsp;</div>\n<div>\n	the maintained expenses are high&nbsp;</div>\n', 27, 28, 1, 0, 2),
(1262, 'DB-Maj-2016-015', 'Ultra violet unit for Kitchen', 2, 35000, '<p>\n	For the main kitchen and laundry&nbsp;</p>\n', 27, 28, 1, 0, 2),
(1263, 'DB-MAJ-2016-016', 'renovation for the Guest Rooms', 250, 40000, '<p>\n	The rooms in a very bad condition&nbsp;</p>\n', 27, 28, 1, 0, 2),
(1264, 'DB-MAJ-2016-017', '4 Units ATS keys', 4, 10000, '<p>\n	For electric station&nbsp;</p>\n', 27, 28, 1, 0, 2),
(1265, 'DB-MAJ-2016-018', 'TV station from analogue to Digital', 1, 190000, '<div>\n	New Led To is not matching&nbsp;</div>\n<div>\n	with the Analogue system</div>\n', 27, 28, 1, 0, 2),
(1266, 'DB-MAJ-2016-019', 'Solar energy- Water heater', 100, 7000, '<p>\n	For saving electricity</p>\n', 27, 28, 1, 0, 2),
(1267, 'Db-MAJ-2016-020', 'Receiving area renovation  (tiles & new garbage room )', 1, 200000, '<p>\n	As per Cristal request and hygiene</p>\n', 27, 28, 1, 0, 2),
(1268, 'DB-MAJ-2016-021', 'Main kitchen renovation ', 1, 500000, '<p>\n	As per Cristal request and hygiene</p>\n', 27, 28, 1, 0, 2),
(1269, 'DB-MAJ-2016-022', 'Italian kitchen renovation ', 1, 150000, '<p>\n	As per Cristal request and hygiene</p>\n', 27, 28, 1, 0, 2),
(1270, 'DB-MAJ-2016-023', 'Italian restaurant chairs & terrace', 1, 200000, '<p>\n	Very bad condition&nbsp;</p>\n', 27, 28, 1, 0, 2),
(1271, 'DB-MAj-2016-024', 'Lobby furniture ', 1, 150000, '<p>\n	Very bad condition&nbsp;</p>\n', 27, 28, 1, 0, 2),
(1272, 'DB-MAJ-2016-025', 'Water boiler renovation ', 1, 100000, '<p>\n	For saving electricity&nbsp;</p>\n', 27, 28, 1, 0, 2),
(1273, 'DB-MAJ-2016-026', 'Suzuki Car - Luggage', 1, 60000, '<p>\n	To Replace the Cushman because the Cushman spare parts is very expensive more over it</p>\n', 27, 28, 1, 0, 2),
(1274, 'DB-MAJ-2016-027', 'Mattress 2*1.2 m', 460, 600, '<p>\n	not replaced since 5 years</p>\n', 27, 28, 1, 0, 2),
(1275, 'DB-MAJ-2016-028', 'Mattress 2*1.8 m', 209, 900, '<p>\n	not replaced since 5 years</p>\n', 27, 28, 1, 0, 2),
(1276, 'DB-MAJ-2016-029', 'Milton 2*1.2 M', 458, 84, '<p>\n	Very Bad condition&nbsp;</p>\n', 27, 28, 1, 0, 2),
(1277, 'DB-MAJ-2016-030', 'Milton 2*1.8 M', 209, 126, '<p>\n	Very Bad condition&nbsp;</p>\n', 27, 28, 1, 0, 2),
(1278, 'Db-MAJ-2016-031', 'Vacuum cleaner Machine', 5, 2000, '<p>\n	missing item</p>\n', 27, 28, 1, 0, 2),
(1279, 'DB-MAJ-2016-032', 'Baby Cot', 20, 1000, '<p>\n	family room sales increased after the opening of the aqua park</p>\n', 27, 28, 1, 0, 2),
(1280, 'DB-MAJ-2016-033', 'Sun beds', 250, 400, '<p>\n	we don&#39;t have enough amount after the opening of the Aqua Park</p>\n', 27, 28, 1, 0, 2),
(1281, 'DB-MAJ-2016-034', 'Renovation for staff cafeteria', 1, 90000, '<p>\n	to implement AlForsan system and improve the quality of the cafeteria</p>\n', 27, 28, 1, 0, 2),
(1282, 'DB-MAJ-2016-035', 'power factor for electric Panels ', 4, 130000, '<p>\n	to save Electric Consumption</p>\n', 27, 28, 1, 0, 2),
(1283, 'DB-MAJ-2016=036', 'Chillers Overall', 1, 100000, '<p>\n	Saving Energy and maintain the 3 chillers to avoid troubles</p>\n', 27, 28, 1, 0, 2),
(1284, 'DB-MAJ-2016-037', 'interlock of the public area', 1, 300000, '<p>\n	in very bad condition</p>\n', 27, 28, 1, 0, 2),
(1285, 'DB-MAJ-2016-038', 'Solar heaters for the rooms', 30, 8000, '<p>\n	to replace the damaged heaters</p>\n', 27, 28, 1, 0, 2),
(1286, 'DB-MAJ-2016-039', 'Landscape plants', 15000, 10, '<p>\n	To improve the quality of the landscape in the resort</p>\n', 27, 28, 1, 0, 2),
(1287, 'MO-IT-2016-007', 'I.T Licenses', 1, 212658, '<p>\n	Annual software license</p>\n', 2, 26, 1, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `plan_item_states`
--

CREATE TABLE IF NOT EXISTS `plan_item_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `plan_item_states`
--

INSERT INTO `plan_item_states` (`id`, `name`) VALUES
(1, 'Cancelled'),
(2, 'Approved'),
(3, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `plan_signatures`
--

CREATE TABLE IF NOT EXISTS `plan_signatures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rank` int(5) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `reject` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=136 ;

--
-- Dumping data for table `plan_signatures`
--

INSERT INTO `plan_signatures` (`id`, `user_id`, `role_id`, `timestamp`, `rank`, `plan_id`, `reject`) VALUES
(1, NULL, 4, '2015-09-28 11:25:39', 1, 2, 0),
(2, NULL, 6, '2015-09-28 11:25:39', 2, 2, 0),
(3, NULL, 3, '2015-09-28 11:25:39', 3, 2, 0),
(4, NULL, 16, '2015-09-28 11:25:39', 4, 2, 0),
(5, NULL, 5, '2015-09-28 12:59:33', 1, 3, 0),
(6, 1, 6, '2015-09-28 13:00:25', 2, 3, 0),
(7, NULL, 4, '2015-09-28 12:59:33', 3, 3, 0),
(8, NULL, 3, '2015-09-28 12:59:33', 4, 3, 0),
(9, NULL, 16, '2015-09-28 12:59:33', 5, 3, 0),
(10, NULL, 2, '2015-11-04 15:07:15', 6, 3, 0),
(11, NULL, 5, '2015-09-28 13:30:05', 1, 4, 0),
(12, NULL, 6, '2015-09-28 13:30:05', 2, 4, 0),
(13, NULL, 4, '2015-09-28 13:30:05', 3, 4, 0),
(14, NULL, 3, '2015-09-28 13:30:05', 4, 4, 0),
(15, NULL, 16, '2015-09-28 13:30:05', 5, 4, 0),
(16, NULL, 2, '2015-11-04 15:07:15', 6, 4, 0),
(17, 1, 6, '2015-09-29 12:27:34', 1, 5, 0),
(18, NULL, 4, '2015-09-29 12:26:24', 2, 5, 0),
(19, NULL, 3, '2015-09-29 12:26:24', 3, 5, 0),
(20, NULL, 16, '2015-09-29 12:26:24', 4, 5, 0),
(21, NULL, 2, '2015-11-04 15:07:15', 5, 5, 0),
(22, NULL, 4, '2015-10-04 07:47:24', 1, 8, 0),
(23, NULL, 6, '2015-10-04 07:47:24', 2, 8, 0),
(24, NULL, 3, '2015-10-04 07:47:24', 3, 8, 0),
(25, NULL, 16, '2015-10-04 07:47:24', 4, 8, 0),
(26, NULL, 4, '2015-10-04 10:03:19', 1, 9, 0),
(27, NULL, 6, '2015-10-04 10:03:19', 2, 9, 0),
(28, NULL, 3, '2015-10-04 10:03:19', 3, 9, 0),
(29, NULL, 16, '2015-10-04 10:03:19', 4, 9, 0),
(30, NULL, 6, '2015-10-04 11:21:53', 1, 10, 0),
(31, NULL, 16, '2015-10-04 11:21:53', 2, 10, 0),
(32, NULL, 4, '2015-10-04 11:21:53', 3, 10, 0),
(33, NULL, 3, '2015-10-04 11:21:53', 4, 10, 0),
(34, NULL, 2, '2015-10-04 11:21:53', 5, 10, 0),
(35, NULL, 6, '2015-10-05 07:44:49', 1, 11, 0),
(36, NULL, 17, '2015-10-05 07:44:49', 2, 11, 0),
(37, NULL, 16, '2015-10-05 07:44:49', 3, 11, 0),
(38, NULL, 4, '2015-10-05 07:44:49', 4, 11, 0),
(39, NULL, 3, '2015-10-05 07:44:49', 5, 11, 0),
(40, NULL, 2, '2015-10-05 07:44:49', 6, 11, 0),
(41, NULL, 6, '2015-10-05 11:00:17', 1, 12, 0),
(42, NULL, 16, '2015-10-05 11:00:17', 2, 12, 0),
(43, NULL, 4, '2015-10-05 11:00:17', 3, 12, 0),
(44, NULL, 3, '2015-10-05 11:00:18', 4, 12, 0),
(45, NULL, 2, '2015-10-05 11:00:18', 5, 12, 0),
(46, NULL, 6, '2015-10-05 13:44:50', 1, 13, 0),
(47, NULL, 16, '2015-10-05 13:44:50', 2, 13, 0),
(48, NULL, 4, '2015-10-05 13:44:51', 3, 13, 0),
(49, NULL, 3, '2015-10-05 13:44:51', 4, 13, 0),
(50, NULL, 2, '2015-10-05 13:44:51', 5, 13, 0),
(51, NULL, 6, '2015-10-06 09:24:30', 1, 14, 0),
(52, NULL, 17, '2015-10-06 09:24:30', 2, 14, 0),
(53, NULL, 16, '2015-10-06 09:24:30', 3, 14, 0),
(54, NULL, 4, '2015-10-06 09:24:30', 4, 14, 0),
(55, NULL, 3, '2015-10-06 09:24:30', 5, 14, 0),
(56, NULL, 2, '2015-10-06 09:24:30', 6, 14, 0),
(57, 1, 6, '2015-10-07 10:17:20', 1, 15, 0),
(58, NULL, 16, '2015-10-06 12:24:32', 2, 15, 0),
(59, NULL, 4, '2015-10-06 12:24:32', 3, 15, 0),
(60, NULL, 3, '2015-10-06 12:24:32', 4, 15, 0),
(61, NULL, 2, '2015-10-06 12:24:32', 5, 15, 0),
(62, 77, 6, '2015-11-04 10:18:16', 1, 16, 0),
(63, 55, 16, '2015-11-05 07:46:57', 2, 16, 0),
(64, NULL, 3, '2015-10-06 13:33:03', 4, 16, 0),
(65, NULL, 2, '2015-11-04 15:07:15', 5, 16, 0),
(66, 1, 6, '2015-10-07 11:03:16', 1, 17, 0),
(67, 1, 17, '2015-10-07 11:07:16', 2, 17, 0),
(68, NULL, 16, '2015-10-07 10:53:39', 3, 17, 0),
(69, NULL, 4, '2015-10-07 10:53:39', 4, 17, 0),
(70, NULL, 3, '2015-10-07 10:53:39', 5, 17, 0),
(71, NULL, 2, '2015-10-07 10:53:40', 6, 17, 0),
(72, NULL, 4, '0000-00-00 00:00:00', 3, 16, 0),
(73, NULL, 6, '2015-10-08 12:07:15', 1, 18, 0),
(74, NULL, 16, '2015-10-08 12:07:15', 2, 18, 0),
(75, NULL, 4, '2015-10-08 12:07:15', 3, 18, 0),
(76, NULL, 3, '2015-10-08 12:07:15', 4, 18, 0),
(77, NULL, 2, '2015-11-04 15:07:15', 5, 18, 0),
(78, NULL, 6, '2015-10-08 18:58:11', 1, 19, 0),
(79, NULL, 16, '2015-10-08 18:58:11', 2, 19, 0),
(80, NULL, 4, '2015-10-08 18:58:11', 3, 19, 0),
(81, NULL, 3, '2015-10-08 18:58:11', 4, 19, 0),
(82, NULL, 2, '2015-10-08 18:58:11', 5, 19, 0),
(83, NULL, 6, '2015-10-09 06:11:41', 1, 20, 0),
(84, NULL, 16, '2015-10-09 06:11:41', 2, 20, 0),
(85, NULL, 4, '2015-10-09 06:11:41', 3, 20, 0),
(86, NULL, 3, '2015-10-09 06:11:41', 4, 20, 0),
(87, NULL, 2, '2015-10-09 06:11:41', 5, 20, 0),
(88, 6, 6, '2015-10-13 11:35:33', 1, 21, 0),
(89, 55, 16, '2015-10-19 10:04:51', 2, 21, 0),
(90, 4, 4, '2015-10-31 14:19:29', 3, 21, 0),
(91, 3, 3, '2015-11-04 08:19:09', 4, 21, 0),
(92, NULL, 2, '2015-11-04 15:07:15', 5, 21, 0),
(93, 129, 6, '2015-11-02 09:31:52', 1, 22, 0),
(94, 55, 16, '2015-11-02 10:22:21', 2, 22, 0),
(95, 4, 4, '2015-11-04 08:50:21', 3, 22, 0),
(96, 3, 3, '2015-11-04 09:52:15', 4, 22, 0),
(97, NULL, 2, '2015-11-04 15:07:15', 5, 22, 0),
(98, 6, 6, '2015-10-13 11:36:19', 1, 23, 0),
(99, 4, 4, '2015-10-31 14:21:00', 3, 23, 0),
(100, 55, 16, '2015-10-19 10:04:29', 2, 23, 0),
(101, 3, 3, '2015-11-04 08:21:33', 4, 23, 0),
(102, NULL, 2, '2015-11-04 15:07:15', 5, 23, 0),
(103, 139, 6, '2015-10-20 06:32:50', 1, 24, 0),
(104, 30, 17, '2015-10-22 06:44:15', 2, 24, 0),
(105, 55, 16, '2015-10-22 15:18:16', 3, 24, 0),
(106, 59, 4, '2015-10-24 16:43:56', 4, 24, 0),
(107, 3, 3, '2015-11-04 08:22:28', 5, 24, 0),
(108, NULL, 2, '2015-11-04 15:07:15', 6, 24, 0),
(109, 25, 6, '2015-10-27 19:19:18', 1, 25, 0),
(110, 55, 16, '2015-10-28 11:24:20', 2, 25, 0),
(111, 4, 4, '2015-11-03 07:26:50', 3, 25, 0),
(112, 3, 3, '2015-11-04 08:23:20', 4, 25, 0),
(113, NULL, 2, '2015-11-04 15:07:15', 5, 25, 0),
(114, 93, 6, '2015-10-22 10:07:09', 1, 26, 0),
(115, 30, 17, '2015-10-22 11:55:36', 2, 26, 0),
(116, 55, 16, '2015-10-22 15:19:20', 3, 26, 0),
(117, 59, 4, '2015-10-24 15:48:21', 4, 26, 0),
(118, 3, 3, '2015-11-04 08:24:54', 5, 26, 0),
(119, NULL, 2, '2015-11-04 15:07:15', 6, 26, 0),
(120, 40, 6, '2015-10-29 13:54:55', 1, 27, 0),
(121, 55, 16, '2015-10-31 10:14:55', 2, 27, 0),
(122, 4, 4, '2015-10-31 14:52:27', 3, 27, 0),
(123, 3, 3, '2015-11-04 08:25:17', 4, 27, 0),
(124, NULL, 2, '2015-11-04 15:07:15', 5, 27, 0),
(125, 137, 6, '2015-10-21 20:14:18', 1, 28, 0),
(126, 30, 17, '2015-10-23 17:22:57', 2, 28, 0),
(127, 55, 16, '2015-10-24 14:32:42', 3, 28, 0),
(128, 59, 4, '2015-10-25 10:03:46', 4, 28, 0),
(129, 3, 3, '2015-11-04 08:26:22', 5, 28, 0),
(130, NULL, 2, '2015-11-04 15:07:15', 6, 28, 0),
(131, 68, 6, '2015-10-27 14:44:38', 1, 29, 0),
(132, 55, 16, '2015-10-28 11:25:13', 2, 29, 0),
(133, NULL, 4, '2015-10-11 11:24:13', 3, 29, 0),
(134, NULL, 3, '2015-10-11 11:24:13', 4, 29, 0),
(135, NULL, 2, '2015-11-04 15:07:15', 5, 29, 0);

-- --------------------------------------------------------

--
-- Table structure for table `plan_states`
--

CREATE TABLE IF NOT EXISTS `plan_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `plan_states`
--

INSERT INTO `plan_states` (`id`, `name`) VALUES
(1, 'Submitted'),
(2, 'Approved'),
(3, 'Rejected');

-- --------------------------------------------------------

--
-- Table structure for table `priorities`
--

CREATE TABLE IF NOT EXISTS `priorities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `priorities`
--

INSERT INTO `priorities` (`id`, `name`) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE IF NOT EXISTS `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hotel_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reasons` text COLLATE utf8_unicode_ci,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  `origin_id` int(11) NOT NULL,
  `scope` text COLLATE utf8_unicode_ci,
  `EUR_EX` float DEFAULT NULL,
  `USD_EX` float DEFAULT NULL,
  `budget_EGP` float DEFAULT NULL,
  `budget_USD` float DEFAULT NULL,
  `budget_EUR` float DEFAULT NULL,
  `budget` float DEFAULT NULL,
  `cost_EGP` float DEFAULT NULL,
  `cost_USD` float DEFAULT NULL,
  `cost_EUR` float DEFAULT NULL,
  `cost` float DEFAULT NULL,
  `true_EGP` float DEFAULT NULL,
  `true_USD` float DEFAULT NULL,
  `true_EUR` float DEFAULT NULL,
  `true` float DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `year` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8_unicode_ci,
  `state_id` int(11) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `progress_id` int(11) NOT NULL DEFAULT '0',
  `progress` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=32 ;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `timestamp`, `hotel_id`, `name`, `reasons`, `code`, `type_id`, `origin_id`, `scope`, `EUR_EX`, `USD_EX`, `budget_EGP`, `budget_USD`, `budget_EUR`, `budget`, `cost_EGP`, `cost_USD`, `cost_EUR`, `cost`, `true_EGP`, `true_USD`, `true_EUR`, `true`, `user_id`, `department_id`, `start`, `end`, `year`, `remarks`, `state_id`, `deleted`, `progress_id`, `progress`) VALUES
(1, '2015-12-28 10:08:41', 6, 't', 'qweq', '040DA', 2, 2, 'qw', 0, 5.8, 0, 0, 0, 30400, 0, 0, 0, 0, 543, 33, 0, 734.4, 1, 7, '2015-12-24', '2015-12-26', '2016', '', 7, 0, 3, 'uytrew'),
(2, '2015-12-28 11:46:43', 6, 'nn', 'rr', 'A2972', 2, 2, 'sss', 0, 0, 0, 0, 0, 40000, 4564, 0, 0, 4564, 1000, 0, 0, 1000, 1, 7, '2015-12-16', '2015-12-31', '2016', '9-=', 7, 0, 3, 'done'),
(3, '2015-12-28 11:56:17', 2, 'Gg', 'ggg', NULL, 2, 3, NULL, 5.6, 8.9, 456, 55, 0, 945.5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 5, NULL, NULL, NULL, '', 1, 0, 0, NULL),
(4, '2015-12-28 11:57:24', 10, 'yftyf', 'yut', NULL, 2, 3, NULL, 9.9, 8.8, 10000000, 0, 0, 10000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, NULL, NULL, NULL, '', 1, 0, 0, NULL),
(5, '2015-12-28 11:58:02', 2, 'ewrwer', 'wer', '27727', 1, 3, NULL, 0.6, 5.5, 100000000, 0, 0, 100000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 4, NULL, NULL, NULL, '', 2, 0, 0, NULL),
(6, '2015-12-28 16:50:37', 4, '23e', '23', '66BA8', 1, 2, '222', 9.8, 8.9, 0, 0, 0, 105000, 80000, 999999, 0, 80000, NULL, NULL, NULL, NULL, 1, 4, '2015-12-01', '2016-01-05', '2016', '', 12, 0, 0, NULL),
(7, '2015-12-30 07:54:27', 3, 'tre', '33', '81DDE', 2, 2, 'ww', 0, 0, 0, 0, 0, 46000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 1, 7, '2015-12-31', '2016-01-09', '2016', '', 33, 0, 0, NULL),
(8, '2015-12-30 08:03:46', 3, 'wew', 'ser', 'F7DCA', 2, 2, 'we', 0, 0, 0, 0, 0, 54000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 1, 7, '2015-12-16', '2015-12-19', '2016', '', 3, 0, 0, NULL),
(9, '2015-12-30 08:04:27', 3, 'edf', 'sdfsdf', 'B81E7', 2, 2, 'sdf', 0, 0, 0, 0, 0, 7000, 50000, 0, 0, 50000, NULL, NULL, NULL, NULL, 1, 7, '2015-12-01', '2015-12-31', '2016', '', 33, 0, 0, NULL),
(10, '2015-12-31 08:22:56', 3, 'hgfds', 'dd', NULL, 1, 3, NULL, 3.3, 8.8, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, '', 1, 0, 0, NULL),
(11, '2015-12-31 13:00:05', 3, 'hgfds', 'qewq', NULL, 2, 3, NULL, 6.6, 4.4, 1000000, 0, 0, 1000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, '', 1, 0, 0, NULL),
(12, '2015-12-31 13:00:36', 3, 'kkkuy', 'gyky', 'CDE3C', 3, 3, 'jhgfdsf', 7.7, 5.5, 0, 0, 0, 0, 10000, 1000000, 0, 5510000, NULL, NULL, NULL, NULL, 3, 7, '2015-12-16', '2016-01-07', '2016', '', 7, 0, 1, NULL),
(13, '2016-01-02 09:06:06', 14, 'test5', 'test', 'A73F3', 1, 2, 'test', 0, 0, 0, 0, 0, 91750, 10000, 0, 0, 10000, NULL, NULL, NULL, NULL, 1, 4, '2016-01-02', '2016-01-15', '2016', 'test', 7, 0, 1, NULL),
(14, '2016-01-02 09:46:48', 1, 'test6', 'test', 'CF898', 1, 3, NULL, 8.43, 8, 1000, 0, 0, 1000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 'tes', 2, 0, 0, NULL),
(15, '2016-01-06 14:58:20', 11, 'gfds', 'qdq', NULL, 2, 3, NULL, 0, 0, 1000000000000, 0, 0, 1000000000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, '', 1, 0, 0, NULL),
(16, '2016-01-06 14:58:40', 12, '5rew', '54', NULL, 2, 3, NULL, 0, 0, 30000, 0, 0, 30000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, '', 1, 0, 0, NULL),
(17, '2016-01-06 14:59:04', 19, 'er', 'er', 'E6D9E', 2, 3, NULL, 0, 0, 30001, 0, 0, 30001, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 6, NULL, NULL, NULL, '', 2, 0, 0, NULL),
(18, '2016-01-06 15:00:07', 10, 'dtgh', 'ssere', NULL, 3, 3, NULL, 0, 0, 30001, 0, 0, 30001, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, '', 1, 0, 0, NULL),
(19, '2016-01-06 15:18:03', 8, 'sss', 'www', NULL, 1, 3, NULL, 0, 0, 30001, 0, 0, 30001, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, '', 1, 0, 0, NULL),
(20, '2016-01-06 15:18:28', 9, '232', '333', NULL, 1, 3, NULL, 0, 0, 29999, 0, 0, 29999, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, '', 1, 0, 0, NULL),
(21, '2016-01-17 13:58:58', 10, 'ee', 'rr', '18310', 1, 3, '', 0, 0, 0, 0, 0, 0, 10000000, 1000000, 0, 10000000, NULL, NULL, NULL, NULL, 55, 2, '2016-01-27', '2016-02-04', '2019', '', 33, 0, 0, NULL),
(22, '2016-01-17 15:16:27', 14, 'qweqwe', 'qqqq', '0B2CC', 2, 2, 'qq', 55, 44, 0, 0, 0, 7000, 1e28, 0, 0, 1e28, NULL, NULL, NULL, NULL, 1, 2, '2016-01-19', '2016-01-23', '2016', '', 4, 0, 0, NULL),
(23, '2016-01-17 15:33:13', 14, 'sdasdds', 'asas', NULL, 1, 3, NULL, 0, 0, 1e30, 0, 0, 1e30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, '', 1, 0, 0, NULL),
(24, '2016-01-17 15:35:38', 14, 'sss', 'Sss', 'FF636', 2, 2, 'sss', 0, -3, 0, 0, 0, 12000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 1, 2, '2016-01-17', '2016-01-17', '2016', '', 33, 0, 0, NULL),
(25, '2016-01-17 15:38:54', 14, 'sss', 'Sss', 'EB277', 2, 2, 'sss', 0, -3, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 1, 2, '2016-01-17', '2016-01-17', '2016', '', 33, 0, 0, NULL),
(26, '2016-01-18 13:21:13', 14, 'fr3 d d', 'rf d d', NULL, 3, 3, NULL, 0, 6, 54321, 8000, 0, 102321, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 6, NULL, NULL, NULL, 'wwwwww', 1, 0, 0, NULL),
(27, '2016-01-18 13:58:17', 5, '34rdw', 'rfwsq', '4AE48', 2, 2, 'ww', 0, 0, 0, 0, 0, 3000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 1, 2, '2016-01-18', '2016-01-18', '2016', '', 33, 0, 0, NULL),
(28, '2016-01-18 15:52:23', 5, 'cxz', 'asddas', '35CD9', 2, 2, 'aa', 0, 0, 0, 0, 0, 1400, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 1, 2, '2016-01-18', '2016-01-18', '2016', '', 33, 0, 0, NULL),
(29, '2016-01-19 12:32:25', 5, 'fwdcsxa', 'rfwdcsaz', '77E27', 2, 2, 'fgdsa', 0, 0, 0, 0, 0, 30000, 1e19, 0, 0, 1e19, NULL, NULL, NULL, NULL, 1, 2, '2016-01-19', '2016-01-19', '2016', '', 33, 0, 0, NULL),
(30, '2016-01-19 13:46:59', 3, 'eeee', 'e3e3', '84A98', 3, 2, '3e', 0, 0, 0, 0, 0, 7000, 1.11111e26, 0, 0, 1.11111e26, NULL, NULL, NULL, NULL, 1, 2, '2016-01-19', '2016-01-19', '2016', '', 33, 0, 0, NULL),
(31, '2016-01-21 13:08:58', 5, '3w4', '33', '8E761', 2, 2, '4', 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 1, 5, '2016-01-21', '2016-01-21', '2016', '', 4, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `projects_items`
--

CREATE TABLE IF NOT EXISTS `projects_items` (
  `project_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `projects_items`
--

INSERT INTO `projects_items` (`project_id`, `item_id`, `quantity`) VALUES
(1, 1072, 2),
(1, 1074, 2),
(2, 1069, 2),
(2, 1160, 2),
(6, 608, 1),
(6, 611, 1),
(7, 752, 1),
(7, 753, 1),
(8, 755, 10),
(8, 757, 2),
(9, 754, 1),
(9, 758, 1),
(13, 300, 25),
(13, 302, 100),
(13, 305, 50),
(22, 237, 2),
(24, 238, 1),
(27, 977, 3),
(28, 978, 2),
(29, 975, 5),
(30, 667, 2),
(31, 953, 1);

-- --------------------------------------------------------

--
-- Table structure for table `projects_suppliers`
--

CREATE TABLE IF NOT EXISTS `projects_suppliers` (
  `project_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `projects_suppliers`
--

INSERT INTO `projects_suppliers` (`project_id`, `supplier_id`) VALUES
(1, 2),
(2, 2),
(7, 4),
(7, 5),
(7, 6),
(12, 5),
(12, 5),
(12, 7),
(12, 8),
(13, 5),
(0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `project_approvals`
--

CREATE TABLE IF NOT EXISTS `project_approvals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `timestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `rank` int(5) NOT NULL,
  `project_id` int(11) NOT NULL,
  `reject` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=64 ;

--
-- Dumping data for table `project_approvals`
--

INSERT INTO `project_approvals` (`id`, `user_id`, `role_id`, `timestamp`, `rank`, `project_id`, `reject`) VALUES
(1, 3, 0, '2015-12-28 11:56:17', 0, 3, 0),
(2, NULL, 6, NULL, 1, 3, 0),
(3, NULL, 3, NULL, 3, 3, 0),
(4, 3, 0, '2015-12-28 11:57:24', 0, 4, 0),
(5, NULL, 6, NULL, 1, 4, 0),
(6, NULL, 3, NULL, 3, 4, 0),
(7, NULL, 16, NULL, 4, 4, 0),
(8, NULL, 2, NULL, 5, 4, 0),
(9, 3, 0, '2015-12-28 11:58:02', 0, 5, 0),
(10, 6, 6, '2015-12-28 11:59:14', 1, 5, 0),
(11, 3, 3, '2015-12-28 11:59:33', 3, 5, 0),
(12, 55, 16, '2015-12-28 11:59:51', 4, 5, 0),
(13, 2, 2, '2015-12-28 12:01:18', 5, 5, 0),
(14, 1, 0, '2015-12-31 08:22:56', 0, 10, 0),
(15, 1, 6, '2015-12-31 12:56:35', 1, 10, 0),
(16, NULL, 3, NULL, 3, 10, 0),
(17, 1, 0, '2015-12-31 13:00:06', 0, 11, 0),
(18, NULL, 6, NULL, 1, 11, 0),
(19, NULL, 3, NULL, 3, 11, 0),
(20, NULL, 16, NULL, 4, 11, 0),
(21, NULL, 2, NULL, 5, 11, 0),
(22, 1, 0, '2015-12-31 13:00:36', 0, 12, 0),
(23, 1, 6, '2015-12-31 13:00:57', 1, 12, 0),
(24, 3, 3, '2015-12-31 13:01:27', 3, 12, 0),
(25, 1, 0, '2016-01-02 09:46:48', 0, 14, 0),
(26, 1, 6, '2016-01-02 09:48:38', 1, 14, 0),
(27, 1, 3, '2016-01-02 09:49:00', 3, 14, 0),
(28, 1, 0, '2016-01-06 14:58:20', 0, 15, 0),
(29, NULL, 6, NULL, 1, 15, 0),
(30, NULL, 3, NULL, 3, 15, 0),
(31, NULL, 16, NULL, 4, 15, 0),
(32, NULL, 2, NULL, 5, 15, 0),
(33, 1, 0, '2016-01-06 14:58:40', 0, 16, 0),
(34, NULL, 6, NULL, 1, 16, 0),
(35, NULL, 3, NULL, 3, 16, 0),
(36, 1, 0, '2016-01-06 14:59:04', 0, 17, 0),
(37, 1, 0, '2016-01-06 15:00:08', 0, 18, 0),
(38, NULL, 6, NULL, 1, 18, 0),
(39, NULL, 3, NULL, 3, 18, 0),
(40, 1, 0, '2016-01-06 15:18:05', 0, 19, 0),
(41, NULL, 6, NULL, 1, 19, 0),
(42, NULL, 17, NULL, 2, 19, 0),
(43, NULL, 3, NULL, 4, 19, 0),
(44, NULL, 16, NULL, 5, 19, 0),
(45, NULL, 2, NULL, 6, 19, 0),
(46, 1, 0, '2016-01-06 15:18:29', 0, 20, 0),
(47, NULL, 6, NULL, 1, 20, 0),
(48, NULL, 3, NULL, 3, 20, 0),
(49, NULL, 16, NULL, 4, 20, 0),
(50, 1, 0, '2016-01-17 13:58:58', 0, 21, 0),
(51, 1, 6, '2016-01-17 13:59:04', 1, 21, 0),
(52, 3, 3, '2016-01-17 13:59:47', 3, 21, 0),
(53, 55, 16, '2016-01-17 14:00:36', 4, 21, 0),
(54, 1, 0, '2016-01-17 15:33:13', 0, 23, 0),
(55, NULL, 6, NULL, 1, 23, 0),
(56, NULL, 3, NULL, 3, 23, 0),
(57, NULL, 16, NULL, 4, 23, 0),
(58, NULL, 2, NULL, 5, 23, 0),
(59, 1, 0, '2016-01-18 13:21:13', 0, 26, 0),
(60, NULL, 6, NULL, 1, 26, 0),
(61, NULL, 3, NULL, 3, 26, 0),
(62, NULL, 16, NULL, 4, 26, 0),
(63, NULL, 2, NULL, 5, 26, 0);

-- --------------------------------------------------------

--
-- Table structure for table `project_comments`
--

CREATE TABLE IF NOT EXISTS `project_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `privilege` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `project_comments`
--

INSERT INTO `project_comments` (`id`, `project_id`, `user_id`, `comment`, `created`, `privilege`) VALUES
(1, 2, 30, 'ghjk', '2015-12-28 11:53:23', 0),
(2, 13, 1, 'test', '2016-01-02 09:14:19', 0),
(3, 13, 1, 'test  test test', '2016-01-02 09:19:09', 0),
(4, 13, 1, 'test test', '2016-01-02 09:19:56', 0),
(5, 22, 83, 'acac', '2016-01-19 12:20:11', 0),
(6, 28, 1, 'tgrfedws', '2016-01-20 09:17:34', 1),
(7, 28, 1, 'wefdsax', '2016-01-20 09:23:03', 1),
(8, 26, 1, 'efws', '2016-01-20 09:23:14', 1),
(9, 26, 1, 'ddd', '2016-01-20 10:05:46', 1),
(10, 26, 1, 'ddd', '2016-01-20 10:06:17', 1),
(11, 26, 1, 'ddd', '2016-01-20 10:06:40', 1),
(12, 26, 1, 'dA', '2016-01-20 10:06:45', 1),
(13, 26, 1, 're', '2016-01-20 10:07:53', 1),
(14, 30, 1, 'dada', '2016-01-20 10:08:21', 1),
(15, 30, 1, 'adad', '2016-01-20 10:09:23', 0),
(16, 30, 1, 'xxx', '2016-01-20 10:13:05', 0),
(17, 30, 1, 'p=1', '2016-01-20 10:13:25', 1),
(18, 30, 1, 'p=0', '2016-01-20 10:13:35', 0);

-- --------------------------------------------------------

--
-- Table structure for table `project_files`
--

CREATE TABLE IF NOT EXISTS `project_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `project_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `project_files`
--

INSERT INTO `project_files` (`id`, `name`, `project_id`) VALUES
(1, 'kamal.pdf', 'B7E5E'),
(2, '3months.php', ''),
(3, '3months1.php', ''),
(4, '3months2.php', ''),
(5, '3months3.php', '23'),
(6, '3months4.php', '26');

-- --------------------------------------------------------

--
-- Table structure for table `project_origins`
--

CREATE TABLE IF NOT EXISTS `project_origins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `project_origins`
--

INSERT INTO `project_origins` (`id`, `name`) VALUES
(1, 'Budgeted'),
(2, 'Planned'),
(3, 'Unplanned');

-- --------------------------------------------------------

--
-- Table structure for table `project_owning_form`
--

CREATE TABLE IF NOT EXISTS `project_owning_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `financial_notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=30 ;

--
-- Dumping data for table `project_owning_form`
--

INSERT INTO `project_owning_form` (`id`, `project_id`, `date`, `place`, `num_of_offers`, `total_cost`, `sup_1`, `sup_2`, `sup_3`, `sup_4`, `sup_5`, `sup_6`, `consultant`, `recommendation`, `balance`, `purchasing_notes`, `financial_notes`) VALUES
(1, 13, NULL, 'ewd', '', '', '', 'rr', '', '', '', '', 'ddd', '', '', '', ''),
(2, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 22, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(17, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 30, '2016-01-21 13:04:24', '', '', '', '', '', '', '', '', '', '', '', '', '', 'sss'),
(29, 31, '2016-01-21 13:08:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project_progress`
--

CREATE TABLE IF NOT EXISTS `project_progress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `project_progress`
--

INSERT INTO `project_progress` (`id`, `name`) VALUES
(1, 'In Progress'),
(2, 'Holding'),
(3, 'Done'),
(4, 'Cancelled');

-- --------------------------------------------------------

--
-- Table structure for table `project_signatures`
--

CREATE TABLE IF NOT EXISTS `project_signatures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rank` int(5) NOT NULL,
  `project_id` int(11) NOT NULL,
  `reject` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=212 ;

--
-- Dumping data for table `project_signatures`
--

INSERT INTO `project_signatures` (`id`, `user_id`, `role_id`, `timestamp`, `rank`, `project_id`, `reject`) VALUES
(1, 1, 0, '2015-12-28 10:08:42', 0, 1, 0),
(2, 83, 19, '2015-12-28 10:12:38', 2, 1, 0),
(3, 63, 5, '2015-12-28 10:14:07', 3, 1, 0),
(4, 59, 4, '2015-12-28 10:14:34', 4, 1, 0),
(5, 139, 6, '2015-12-28 11:05:35', 5, 1, 0),
(6, 30, 17, '2015-12-28 11:06:00', 6, 1, 0),
(7, 3, 3, '2015-12-28 11:07:02', 7, 1, 0),
(8, 1, 0, '2015-12-28 11:46:44', 0, 2, 0),
(9, 83, 19, '2015-12-28 11:51:18', 2, 2, 0),
(10, 63, 5, '2015-12-28 11:52:21', 3, 2, 0),
(11, 59, 4, '2015-12-28 11:52:37', 4, 2, 0),
(12, 139, 6, '2015-12-28 11:53:00', 5, 2, 0),
(13, 30, 17, '2015-12-28 11:53:15', 6, 2, 0),
(14, 3, 3, '2015-12-28 11:53:47', 7, 2, 0),
(15, 1, 0, '2015-12-28 16:50:38', 0, 6, 0),
(16, 83, 19, '2016-01-05 12:58:54', 2, 6, 1),
(17, NULL, 5, '2015-12-28 16:50:38', 3, 6, 0),
(18, NULL, 4, '2015-12-28 16:50:38', 4, 6, 0),
(19, NULL, 6, '2015-12-28 16:50:38', 5, 6, 0),
(20, NULL, 3, '2015-12-28 16:50:38', 6, 6, 0),
(24, NULL, 16, '2015-12-29 09:40:35', 101, 6, 0),
(25, 1, 0, '2015-12-30 07:54:28', 0, 7, 0),
(26, NULL, 20, '2015-12-30 07:54:28', 2, 7, 0),
(27, NULL, 19, '2015-12-30 07:54:28', 3, 7, 0),
(28, NULL, 5, '2015-12-30 07:54:28', 4, 7, 0),
(29, NULL, 4, '2015-12-30 07:54:28', 5, 7, 0),
(30, NULL, 6, '2015-12-30 07:54:28', 6, 7, 0),
(31, NULL, 3, '2015-12-30 07:54:28', 7, 7, 0),
(32, NULL, 0, '2015-12-30 08:03:46', 0, 8, 0),
(33, NULL, 20, '2015-12-30 08:03:47', 2, 8, 0),
(34, NULL, 19, '2015-12-30 08:03:47', 3, 8, 0),
(35, NULL, 5, '2015-12-30 08:03:47', 4, 8, 0),
(36, NULL, 4, '2015-12-30 08:03:47', 5, 8, 0),
(37, NULL, 6, '2015-12-30 08:03:47', 6, 8, 0),
(38, NULL, 3, '2015-12-30 08:03:47', 7, 8, 0),
(39, 1, 0, '2015-12-30 08:04:28', 0, 9, 0),
(40, NULL, 20, '2015-12-30 08:04:28', 2, 9, 0),
(41, NULL, 19, '2015-12-30 08:04:28', 3, 9, 0),
(42, NULL, 5, '2015-12-30 08:04:28', 4, 9, 0),
(43, NULL, 4, '2015-12-30 08:04:28', 5, 9, 0),
(44, NULL, 6, '2015-12-30 08:04:28', 6, 9, 0),
(45, NULL, 3, '2015-12-30 08:04:28', 7, 9, 0),
(46, NULL, 16, '2015-12-30 08:06:45', 100, 9, 0),
(48, 3, 0, '2015-12-31 13:19:57', 0, 12, 0),
(49, 123, 20, '2016-01-02 08:36:29', 2, 12, 0),
(50, 83, 19, '2016-01-02 08:38:17', 3, 12, 0),
(62, 3, 3, '2016-01-02 08:38:25', 7, 12, 0),
(64, 2, 2, '2016-01-02 08:38:53', 100, 12, 0),
(65, 1, 0, '2016-01-02 09:06:07', 0, 13, 0),
(66, 1, 19, '2016-01-02 09:18:26', 2, 13, 0),
(67, 1, 5, '2016-01-02 09:18:55', 3, 13, 0),
(68, 1, 4, '2016-01-02 09:19:59', 4, 13, 0),
(69, 1, 6, '2016-01-02 09:21:13', 5, 13, 0),
(70, 1, 3, '2016-01-02 09:21:33', 6, 13, 0),
(71, 55, 0, '2016-01-17 14:47:14', 0, 21, 0),
(100, NULL, 6, '2016-01-17 14:10:16', 6, 21, 0),
(106, NULL, 5, '2016-01-17 14:14:48', 4, 21, 0),
(107, NULL, 4, '2016-01-17 14:14:48', 5, 21, 0),
(121, NULL, 19, '2016-01-17 14:22:09', 3, 21, 0),
(125, NULL, 3, '2016-01-17 14:22:09', 7, 21, 0),
(129, NULL, 20, '2016-01-17 14:27:08', 2, 21, 0),
(137, NULL, 18, '2016-01-17 14:47:14', 1, 21, 0),
(144, NULL, 16, '2016-01-17 14:47:14', 8, 21, 0),
(145, NULL, 2, '2016-01-17 14:48:29', 100, 21, 0),
(146, 1, 0, '2016-01-17 15:16:28', 0, 22, 0),
(147, 1, 18, '2016-01-17 15:18:17', 1, 22, 0),
(148, 1, 19, '2016-01-17 15:18:32', 2, 22, 0),
(149, 1, 5, '2016-01-17 15:19:02', 3, 22, 0),
(150, 1, 4, '2016-01-17 15:19:12', 4, 22, 0),
(151, 1, 6, '2016-01-17 15:19:22', 5, 22, 0),
(152, 1, 3, '2016-01-17 15:19:56', 6, 22, 0),
(153, 1, 16, '2016-01-17 15:26:01', 100, 22, 0),
(154, NULL, 2, '2016-01-17 15:19:44', 101, 22, 0),
(155, 1, 0, '2016-01-17 15:37:14', 0, 24, 0),
(156, NULL, 18, '2016-01-17 15:35:39', 1, 24, 0),
(157, NULL, 19, '2016-01-17 15:35:39', 2, 24, 0),
(158, NULL, 5, '2016-01-17 15:35:39', 3, 24, 0),
(159, NULL, 4, '2016-01-17 15:35:39', 4, 24, 0),
(160, NULL, 6, '2016-01-17 15:35:39', 5, 24, 0),
(161, NULL, 3, '2016-01-17 15:35:39', 6, 24, 0),
(162, 1, 0, '2016-01-18 13:46:46', 0, 25, 0),
(163, NULL, 18, '2016-01-17 15:38:54', 1, 25, 0),
(164, NULL, 19, '2016-01-17 15:38:54', 2, 25, 0),
(165, NULL, 5, '2016-01-17 15:38:54', 3, 25, 0),
(166, NULL, 4, '2016-01-17 15:38:54', 4, 25, 0),
(167, NULL, 6, '2016-01-17 15:38:54', 5, 25, 0),
(168, NULL, 3, '2016-01-17 15:38:54', 6, 25, 0),
(169, 1, 0, '2016-01-18 13:58:17', 0, 27, 0),
(170, NULL, 18, '2016-01-18 13:58:17', 1, 27, 0),
(171, NULL, 20, '2016-01-18 13:58:17', 2, 27, 0),
(172, NULL, 19, '2016-01-18 13:58:17', 3, 27, 0),
(173, NULL, 5, '2016-01-18 13:58:17', 4, 27, 0),
(174, NULL, 4, '2016-01-18 13:58:17', 5, 27, 0),
(175, NULL, 6, '2016-01-18 13:58:17', 6, 27, 0),
(176, NULL, 3, '2016-01-18 13:58:17', 7, 27, 0),
(177, 1, 0, '2016-01-18 15:52:23', 0, 28, 0),
(178, NULL, 18, '2016-01-18 15:52:23', 1, 28, 0),
(179, NULL, 20, '2016-01-18 15:52:23', 2, 28, 0),
(180, NULL, 19, '2016-01-18 15:52:23', 3, 28, 0),
(181, NULL, 5, '2016-01-18 15:52:23', 4, 28, 0),
(182, NULL, 4, '2016-01-18 15:52:23', 5, 28, 0),
(183, NULL, 6, '2016-01-18 15:52:23', 6, 28, 0),
(184, NULL, 3, '2016-01-18 15:52:23', 7, 28, 0),
(185, 1, 0, '2016-01-19 12:32:26', 0, 29, 0),
(186, NULL, 18, '2016-01-19 12:32:25', 1, 29, 0),
(187, NULL, 20, '2016-01-19 12:32:25', 2, 29, 0),
(188, NULL, 19, '2016-01-19 12:32:25', 3, 29, 0),
(189, NULL, 5, '2016-01-19 12:32:25', 4, 29, 0),
(190, NULL, 4, '2016-01-19 12:32:25', 5, 29, 0),
(191, NULL, 6, '2016-01-19 12:32:25', 6, 29, 0),
(192, NULL, 3, '2016-01-19 12:32:25', 7, 29, 0),
(193, NULL, 16, '2016-01-19 12:32:42', 100, 29, 0),
(194, NULL, 2, '2016-01-19 12:32:42', 101, 29, 0),
(195, 1, 0, '2016-01-19 13:47:00', 0, 30, 0),
(203, 1, 16, '2016-01-21 12:59:54', 100, 30, 0),
(204, NULL, 2, '2016-01-19 13:48:06', 101, 30, 0),
(205, NULL, 0, '2016-01-28 10:29:34', 0, 31, 0),
(206, NULL, 20, '2016-01-21 13:08:58', 2, 31, 0),
(207, NULL, 19, '2016-01-21 13:08:58', 3, 31, 0),
(208, NULL, 5, '2016-01-21 13:08:58', 4, 31, 0),
(209, NULL, 4, '2016-01-21 13:08:59', 5, 31, 0),
(210, NULL, 6, '2016-01-21 13:08:59', 6, 31, 0),
(211, NULL, 3, '2016-01-21 13:08:59', 7, 31, 0);

-- --------------------------------------------------------

--
-- Table structure for table `project_states`
--

CREATE TABLE IF NOT EXISTS `project_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=34 ;

--
-- Dumping data for table `project_states`
--

INSERT INTO `project_states` (`id`, `name`) VALUES
(0, 'Added'),
(1, 'Requested'),
(2, 'Approved'),
(3, 'Submitted'),
(4, 'Active'),
(5, 'Due'),
(7, 'Done'),
(11, 'Disapproved'),
(12, 'Rejected'),
(33, 'Pending Offers');

-- --------------------------------------------------------

--
-- Table structure for table `project_types`
--

CREATE TABLE IF NOT EXISTS `project_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `project_types`
--

INSERT INTO `project_types` (`id`, `name`) VALUES
(1, 'Mandatory'),
(2, 'Maintenance'),
(3, 'Enhancement');

-- --------------------------------------------------------

--
-- Table structure for table `properties_departments`
--

CREATE TABLE IF NOT EXISTS `properties_departments` (
  `property_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `properties_devisions`
--

CREATE TABLE IF NOT EXISTS `properties_devisions` (
  `property_id` int(11) NOT NULL,
  `devision_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=27 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role`) VALUES
(1, 'Chairman'),
(2, 'Chairman office Cai'),
(3, 'R.D.O.F'),
(4, 'Cluster FC'),
(5, 'Hotel FC'),
(6, 'Hotel GM'),
(7, 'Dep. Head'),
(8, 'Hotel Acc'),
(9, 'Employee'),
(10, 'رئيس قسم المشتريات '),
(11, 'رئيس قسم المكتب الفنى '),
(12, 'مدير ادارة المشتريات '),
(13, 'مدير حسابات '),
(14, 'مدير ادارة الاستثمار '),
(15, 'مدير مالى الإنشاءات'),
(16, 'Managing Director'),
(17, 'Area General Manager SH'),
(18, 'Regional IT Director'),
(19, 'Cluster Purchasing'),
(20, 'Chief Engineer'),
(21, 'hotel purchasing'),
(22, 'نظم المعلومات'),
(23, 'missing position owning company'),
(24, 'Company Financial Controller'),
(25, 'Commercial Relation Manager'),
(26, 'Owning Company MD');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE IF NOT EXISTS `suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` int(24) DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `cv` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=799 ;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `phone`, `address`, `cv`, `deleted`) VALUES
(3, 'شركة المظلوم', 26716143, NULL, NULL, 0),
(4, 'شركة الخليج الناصرى', 25903098, NULL, NULL, 0),
(5, 'مجموعة شركات المصريين', 25930168, NULL, NULL, 0),
(6, 'شركة العز للسيراميك', 33778857, NULL, NULL, 0),
(7, 'مصطفى مصطفى السلاب', 22750507, NULL, NULL, 0),
(8, 'أشرف عبد العزيز المحجوب', 35712565, NULL, NULL, 0),
(9, 'شركة النيلين ', 22580752, NULL, NULL, 0),
(10, 'شركة جروهى', 33048602, NULL, NULL, 0),
(11, 'شركة فياميد للتجارة', 25081930, NULL, NULL, 0),
(12, 'أيديال أستاندر', 24189068, NULL, NULL, 0),
(13, 'شــركـــة كليــوبـاتــرا', 37614000, NULL, NULL, 0),
(14, 'شركة الفراعنة', 22634829, NULL, NULL, 0),
(15, 'هابي تريد', 25926198, NULL, NULL, 0),
(16, 'الشرقيـة لتجـارة السيراميك', 693661119, NULL, NULL, 0),
(17, 'شركة الشوربجى للتوكيلات التجاريـة', 42139950, NULL, NULL, 0),
(18, 'صموئيل ميلاد غالي', 1223281372, NULL, NULL, 0),
(19, 'شركة الشروق للتجهيزات الفندقية', 1148022200, NULL, NULL, 0),
(20, 'شركة المصدر للتجارة والتوريدات', 1227623277, NULL, NULL, 0),
(21, 'المتحدة لتجارة الصاج - أبوشبيكة', 1001401548, NULL, NULL, 0),
(22, 'السويدى للأدوات والكابلات القاهرة', 25911340, NULL, NULL, 0),
(23, 'السويدى للأدوات والكابلات شرم الشيخ', 1002599381, NULL, NULL, 0),
(24, 'الفادي للتوريدات الكهربائية', 23900042, NULL, NULL, 0),
(25, 'شركة السويدي انرجيا', 24171395, NULL, NULL, 0),
(26, 'إبراهيم سيد أحمد إبراهيم', 1002993931, NULL, NULL, 0),
(27, 'شركة الأنوار للتوريدات', 23933416, NULL, NULL, 0),
(28, 'الشركة المصرية السودانية', 1006529574, NULL, NULL, 0),
(29, 'المصرية للتويدات الكهربائية والكابلات', 1226545421, NULL, NULL, 0),
(30, 'بيت الهندسة', 33043347, NULL, NULL, 0),
(31, 'شركة ميجا اليكتريك ميشيل احد', 35820231, NULL, NULL, 0),
(32, 'ثرى برازر', 22598925, NULL, NULL, 0),
(33, 'مصنع موبل الشرق', 24050870, NULL, NULL, 0),
(34, 'شركة الرائدان', 24050870, NULL, NULL, 0),
(35, 'شركة مافيل', 1222119138, NULL, NULL, 0),
(36, 'شركة تبارك للأثاث', 1113331837, NULL, NULL, 0),
(37, 'المجموعة للتجارة والمقاولات', 1006500905, NULL, NULL, 0),
(38, 'شركة النصر', 1225995255, NULL, NULL, 0),
(39, 'المجموعة السويدية', 1006589690, NULL, NULL, 0),
(40, 'طارق عبد المالك', 1002587177, NULL, NULL, 0),
(41, 'محارم', 1222217736, NULL, NULL, 0),
(42, 'خالد أحمد محمد برسيم', 1223976791, NULL, NULL, 0),
(43, '(ورشة المتوكل (جمال عبدالستار', 1228751447, NULL, NULL, 0),
(44, 'المختار', 1065644483, NULL, NULL, 0),
(45, '(محمد عبدالغنى هلال (أرضيات ', 1005444466, NULL, NULL, 0),
(46, 'محمد رشاد', 1005550543, NULL, NULL, 0),
(47, 'مصنع خزفيات الفسطاط', 1001581987, NULL, NULL, 0),
(48, 'شركة الزعيمه', 1222219698, NULL, NULL, 0),
(49, 'مجدي عبد الحميد', 1001581987, NULL, NULL, 0),
(50, 'شركة باسكو', 1223143688, NULL, NULL, 0),
(51, 'محمد صلاح على', 0, NULL, NULL, 0),
(52, 'أحمد حنفى عبدالعزيز', 0, NULL, NULL, 0),
(53, 'هشام مصطفى', 0, NULL, NULL, 0),
(54, '(جمال السيد محمد (الشهرة حمدى الحباك ', 0, NULL, NULL, 0),
(55, 'سعيد عبدالمنعم', 0, NULL, NULL, 0),
(56, '(تيرا ( ألواح زلط + بلاطات + تكسيات حوائط ', 0, NULL, NULL, 0),
(57, '(آل يوسف (موزيك ', 0, NULL, NULL, 0),
(58, 'السيد صادق ثابت', 0, NULL, NULL, 0),
(59, 'شركة رضوان للتجارة والصناعة', 0, NULL, NULL, 0),
(60, 'الورشة الفنية عصام حلمى', 0, NULL, NULL, 0),
(61, 'تكنوستيل', 0, NULL, NULL, 0),
(62, '( جرين لاين ( قطع إستانلس ', 0, NULL, NULL, 0),
(63, 'مصيلحى', 0, NULL, NULL, 0),
(64, 'محمود جبريل', 0, NULL, NULL, 0),
(65, 'هانى مسعود', 0, NULL, NULL, 0),
(66, 'شركة يورى إيجبت م / أحمد عبدالوهاب', 0, NULL, NULL, 0),
(67, 'جبرائيل جميل', 0, NULL, NULL, 0),
(68, 'إبراهيم الشربينى', 0, NULL, NULL, 0),
(69, '( أرك تاتش ( توريد أثاث ', 0, NULL, NULL, 0),
(70, 'شركة باسكو', 1223143688, NULL, NULL, 0),
(71, 'شركة ميتكو للهندسة والتجارة', 1223233213, NULL, NULL, 0),
(72, 'شركة أستيل كرافت', 1001402559, NULL, NULL, 0),
(73, 'EIT', 1276511113, NULL, NULL, 0),
(74, 'شركة ستار انترناشيونال', 1067770059, NULL, NULL, 0),
(75, 'شركة روتانا', 1224118191, NULL, NULL, 0),
(76, 'شركة الأمل الجديدة', 1007444473, NULL, NULL, 0),
(77, 'شركة صلاح أبوطرية', 0, NULL, NULL, 0),
(78, 'ستارز لتجهيزات المطابخ', 1222954996, NULL, NULL, 0),
(79, 'شركة الفيروز للتجارة والهندسة', 1223175876, NULL, NULL, 0),
(80, 'راتوماج', 1001402559, NULL, NULL, 0),
(81, 'نيو ستار', 1005868413, NULL, NULL, 0),
(82, 'مركز داري', 1001745266, NULL, NULL, 0),
(83, 'شركة علام', 1007432412, NULL, NULL, 0),
(84, 'المكتب العلمى', 1222187647, NULL, NULL, 0),
(85, 'المؤسسة المصرية للتوريدات العمومية', 1066673353, NULL, NULL, 0),
(86, 'المتحدة للبويات والكيماويات درايمكس', 0, NULL, NULL, 0),
(87, 'سيناء', 1000086458, NULL, NULL, 0),
(88, 'أبناء الشرقية', 0, NULL, NULL, 0),
(89, 'ســايــبــس', 0, NULL, NULL, 0),
(90, '(جمـــال (القــــدس', 0, NULL, NULL, 0),
(91, 'مجدى', 0, NULL, NULL, 0),
(92, 'أشرف صادق', 0, NULL, NULL, 0),
(93, 'حسين داوود', 0, NULL, NULL, 0),
(94, 'أمين سليمان', 0, NULL, NULL, 0),
(95, 'توب لاين', 0, NULL, NULL, 0),
(96, 'أشرف محمود', 0, NULL, NULL, 0),
(97, 'مصطفى محمد إسماعيل', 0, NULL, NULL, 0),
(98, 'أحمد أحمد محمد زيان', 0, NULL, NULL, 0),
(99, 'درويش للدهانات', 0, NULL, NULL, 0),
(100, 'بيت الخبرة للهندسة', 1223272717, NULL, NULL, 0),
(101, 'شركة الدهيبى', 1068829148, NULL, NULL, 0),
(102, 'شركة كوميت للأعمال الهندسية', 1001237172, NULL, NULL, 0),
(103, 'م/ أحمد محمد داوود', 25897767, NULL, NULL, 0),
(104, 'شركة أوراسكوم', 1288626276, NULL, NULL, 0),
(105, 'الشركة المصرية للأعمال الكهربائية', 1001691186, NULL, NULL, 0),
(106, 'شركة إيماج للتوكيلات التجارية', 1223106053, NULL, NULL, 0),
(107, 'شركة الشرق الهندسة والتوكيلات', 225914279, NULL, NULL, 0),
(108, 'شركة الوايلر فريد', 1227883964, NULL, NULL, 0),
(109, 'شركة سيباى', 1001642256, NULL, NULL, 0),
(110, 'شركة إنترناشونال', 0, NULL, NULL, 0),
(111, 'مركز التقوي', 1228080082, NULL, NULL, 0),
(112, 'شركة ايجات للتنمية الصناعية ايدكو', 233047030, NULL, NULL, 0),
(113, 'شركة الكتروم', 0, NULL, NULL, 0),
(114, 'شركة طيبة للصناعات الهندسية', 224022844, NULL, NULL, 0),
(115, 'شركة يورك شيلار', 1227483853, NULL, NULL, 0),
(116, 'شركة تران', 226241328, NULL, NULL, 0),
(117, 'كايرو كول', 0, NULL, NULL, 0),
(118, 'أبو زكرى', 0, NULL, NULL, 0),
(119, 'يونيون إير', 0, NULL, NULL, 0),
(120, 'شركة شمس', 0, NULL, NULL, 0),
(121, 'شركة كرياتيف للتوريدات', 1001744863, NULL, NULL, 0),
(122, 'رمسيس يوسف عطية', 1223156698, NULL, NULL, 0),
(123, 'رويال تريد', 0, NULL, NULL, 0),
(124, 'مستر بد', 0, NULL, NULL, 0),
(125, 'شركة كمفورت إيجيبت', 1223967526, NULL, NULL, 0),
(126, 'شركة رايتكس', 0, NULL, NULL, 0),
(127, 'شركة حداد للتوريدات', 1223912344, NULL, NULL, 0),
(128, 'بيراميدز للتنجيد والديكور', 1005108330, NULL, NULL, 0),
(129, 'ساتورى', 1229715000, NULL, NULL, 0),
(130, 'تكسمار', 1223940396, NULL, NULL, 0),
(131, 'شركة أيتوف', 0, NULL, NULL, 0),
(132, 'شركة السعد', 0, NULL, NULL, 0),
(133, 'رجب الأمير', 1000661647, NULL, NULL, 0),
(134, 'شركة أبو العطا', 237611768, NULL, NULL, 0),
(135, 'نايل تريد لصناعة المفروشات', 0, NULL, NULL, 0),
(136, 'المجد للتسويق المفروشات وتجهيزات الفنادق', 0, NULL, NULL, 0),
(137, 'تاكى', 0, NULL, NULL, 0),
(138, 'يانسن', 0, NULL, NULL, 0),
(139, 'ريتش هووم', 0, NULL, NULL, 0),
(140, 'أون لاين', 0, NULL, NULL, 0),
(141, 'الشركة الهندسية بوليجون', 1000997823, NULL, NULL, 0),
(142, 'شركة حلول للبرمجيات المتكاملة', 0, NULL, NULL, 0),
(143, 'شركة الحسابات المتقدمة أكت', 1001009086, NULL, NULL, 0),
(144, 'شركة ديجيتال بارتنرز', 1006933344, NULL, NULL, 0),
(145, 'شركة يونايتد سيستم', 1001100039, NULL, NULL, 0),
(146, 'شركة فاليوسيس لتكنولوجيا المعلومات', 0, NULL, NULL, 0),
(147, 'الشركة المصرية للحاسبات و التكنولوجيا', 1000417600, NULL, NULL, 0),
(148, 'شركة الأنظمة الإلكترونية والتكنولجية الحديثة', 1001294465, NULL, NULL, 0),
(149, 'شركة يونايتد سيستمز', 1091068640, NULL, NULL, 0),
(150, 'الشركة المصرية لتجارة البورسلين', 1227436431, NULL, NULL, 0),
(151, 'المركز المصرى التركى', 1001665308, NULL, NULL, 0),
(152, 'شركة إنفينتى', 1000005019, NULL, NULL, 0),
(153, 'شركة الجزيرى للتجارة والتوزيع', 233023352, NULL, NULL, 0),
(154, 'شركة هيلكوميتلز', 1001476696, NULL, NULL, 0),
(155, 'شركة ألفا إنترناشونال', 1001728476, NULL, NULL, 0),
(156, 'المصرية الدولية لتجارة أدوات المائدة', 1222106316, NULL, NULL, 0),
(157, 'ميتالار', 1147477797, NULL, NULL, 0),
(158, 'شركة المصرية العالمية', 0, NULL, NULL, 0),
(159, 'العالمية للبورسلين', 1006004608, NULL, NULL, 0),
(160, 'شركة كوميت جروب', 1222167794, NULL, NULL, 0),
(161, 'شركة كونتريد فوود سرفيس سنتر', 1223939965, NULL, NULL, 0),
(162, 'شركة القصواء', 1062000060, NULL, NULL, 0),
(163, 'شركة تكنولوجيا المواد العازلة', 0, NULL, NULL, 0),
(164, 'شركة بيتا للهندسة والتجارة', 1227370310, NULL, NULL, 0),
(165, 'شركة زمزم', 0, NULL, NULL, 0),
(166, 'شركة المدينة المنورة', 1282850183, NULL, NULL, 0),
(167, 'شركة قباء للتجارة والإستيراد', 222629299, NULL, NULL, 0),
(168, 'الإسلامية لتجارة العوازل', 1221153258, NULL, NULL, 0),
(169, 'مصر فوم', 0, NULL, NULL, 0),
(170, 'الواحة للتوريدات', 0, NULL, NULL, 0),
(171, 'العربية لصناعة العزل', 0, NULL, NULL, 0),
(172, 'كيما فوم', 0, NULL, NULL, 0),
(173, 'شركة كايرو فوم', 0, NULL, NULL, 0),
(174, 'شركة دلتا فوم', 0, NULL, NULL, 0),
(175, 'مؤسسة المغازية', 1003654285, NULL, NULL, 0),
(176, 'عبدالستار صالح', 0, NULL, NULL, 0),
(177, '(شعبان زكى (كمبانى ', 0, NULL, NULL, 0),
(178, 'الشركة العالمية للصوف الصخرى روكال', 0, NULL, NULL, 0),
(179, 'شركة م/ عدلى تادرس', 0, NULL, NULL, 0),
(180, 'شركة الفيروز للتجارة والهندسة', 1223175876, NULL, NULL, 0),
(181, 'شركة وورلد تكنيك', 1222176864, NULL, NULL, 0),
(182, 'الشركة الهندسية لمعدات المغاسل', 0, NULL, NULL, 0),
(183, 'واتكو', 25762898, NULL, NULL, 0),
(184, 'حمادة الدسوقى', 0, NULL, NULL, 0),
(185, 'مؤسسة الفاروق للمقاولات', 1005501053, NULL, NULL, 0),
(186, 'شركة وادي دجلة م/ خالد الشواربى', 0, NULL, NULL, 0),
(187, 'محمود السعداوى', 0, NULL, NULL, 0),
(188, 'مارين سوليوشنز', 0, NULL, NULL, 0),
(189, 'شركة خاطر إنترناشونال', 0, NULL, NULL, 0),
(190, 'تريدكو الصياد', 0, NULL, NULL, 0),
(191, 'شركة مانتراك', 0, NULL, NULL, 0),
(192, 'شركة أتوس', 0, NULL, NULL, 0),
(193, 'MCV شركة مرسيدس', 0, NULL, NULL, 0),
(194, 'الشركة العالمية للمولدات', 0, NULL, NULL, 0),
(195, 'الشركة المصرية العالمية للسيارات', 0, NULL, NULL, 0),
(196, 'شركة قونسقرة', 0, NULL, NULL, 0),
(197, 'شركة ترينجل', 0, NULL, NULL, 0),
(198, 'باور هاوس', 0, NULL, NULL, 0),
(199, 'شركة سيجما', 0, NULL, NULL, 0),
(200, 'المصرية لمهمات المصانع', 0, NULL, NULL, 0),
(201, 'جلوبال تريدارز', 1222236152, NULL, NULL, 0),
(202, 'مارموكس مصر', 1001745266, NULL, NULL, 0),
(203, 'شركة أوميجا للهندسة والتجارة', 1005006518, NULL, NULL, 0),
(204, 'شركة الفردان', 0, NULL, NULL, 0),
(205, 'سبارك كونكورد', 0, NULL, NULL, 0),
(206, 'توكل', 0, NULL, NULL, 0),
(207, 'مركز أجياد العالمي', 0, NULL, NULL, 0),
(208, 'مهني الأسيوطي', 0, NULL, NULL, 0),
(209, 'الفريد مهني الأسيوطي', 0, NULL, NULL, 0),
(210, 'lasdas2', 0, NULL, NULL, 0),
(211, '(روكسى للهندسة (محمد خلاف', 0, NULL, NULL, 0),
(212, '(ماستر للهندسة والمقاولات (م/ ناصر فرج ', 1222236152, NULL, NULL, 0),
(213, 'محمد صبرى', 1001745266, NULL, NULL, 0),
(214, '(م / محسن أنيس (أكوا مارين', 1005006518, NULL, NULL, 0),
(215, 'شركة أوجيدا', 1002776042, NULL, NULL, 0),
(216, 'شركة أوشيدا', 0, NULL, NULL, 0),
(217, 'الشركة العربية للنظم', 1222956689, NULL, NULL, 0),
(218, 'جولدن جروب', 1111130800, NULL, NULL, 0),
(219, 'شركة جراتا ماس', 0, NULL, NULL, 0),
(220, 'الإسلامية للتجارة', 0, NULL, NULL, 0),
(221, 'أنتركلين للتوكيلات العالمية', 1065015085, NULL, NULL, 0),
(222, 'شركة البسيوني وشركاه', 233476682, NULL, NULL, 0),
(223, 'شركة نيوماتك سيناء', 0, NULL, NULL, 0),
(224, 'شركة التجارية الحديثة للماكينات', 0, NULL, NULL, 0),
(225, 'شركة جى أند أتش للتجارة', 0, NULL, NULL, 0),
(226, 'مونديال ', 653460041, NULL, NULL, 0),
(227, 'أيماك بولز', 653460040, NULL, NULL, 0),
(228, 'وورلد تكنيك', 653460040, NULL, NULL, 0),
(229, 'اسبادا', 2147483647, NULL, NULL, 0),
(230, 'Ahmed Kamal', 0, NULL, NULL, 0),
(231, 'شركة طنطا موتورز', 1006625503, NULL, NULL, 0),
(232, 'شركة تام للهندسة والتجارة', 1001093986, NULL, NULL, 0),
(233, 'نوفوفينت', 0, NULL, NULL, 0),
(234, 'ايروفينتس', 1002226817, NULL, NULL, 0),
(235, 'ايروتك', 225789576, NULL, NULL, 0),
(236, 'شركة يونيون (هود) ', 0, NULL, NULL, 0),
(237, 'صناعات همام', 238331930, NULL, NULL, 0),
(238, 'الرضا لتجارة المحركات', 0, NULL, NULL, 0),
(239, 'Fine Company ', 0, NULL, NULL, 0),
(240, 'El Pharoniya Company', 124567, NULL, NULL, 0),
(241, 'شركة فاينل تاتش', 0, NULL, NULL, 0),
(242, 'شركة كوم تك', 1223913192, NULL, NULL, 0),
(243, 'الحرية الحديثة', 1004888999, NULL, NULL, 0),
(244, 'راديو شاك', 0, NULL, NULL, 0),
(245, 'العربى للتجارة والصناعة', 0, NULL, NULL, 0),
(246, 'شركة فرحة', 0, NULL, NULL, 0),
(247, 'شركة دوكيوكوم', 1000109638, NULL, NULL, 0),
(248, 'شركة زيروكس', 653441842, NULL, NULL, 0),
(249, 'شركة ال جي للإلكترونيات', 0, NULL, NULL, 0),
(250, 'شركة النيل الهندسية ( شمس)', 0, NULL, NULL, 0),
(251, 'الاسكا', 1223966506, NULL, NULL, 0),
(252, 'نور القرآن', 1144445833, NULL, NULL, 0),
(253, 'شركة هاى باور للصناعة والتجارة', 0, NULL, NULL, 0),
(254, 'شركة فريش', 0, NULL, NULL, 0),
(255, 'شركة بنها للصناعات الالكترونية', 0, NULL, NULL, 0),
(256, 'باناسونيك', 0, NULL, NULL, 0),
(257, 'فيليبس', 0, NULL, NULL, 0),
(258, 'مصر للهندسة والعدد ( ميكار)', 0, NULL, NULL, 0),
(259, 'شركة توفيق محمد', 1223735844, NULL, NULL, 0),
(260, 'شركة أوتو إيجبت للتجارة', 0, NULL, NULL, 0),
(261, 'تويوتا إيجبت', 0, NULL, NULL, 0),
(262, 'مودرن موتورز', 0, NULL, NULL, 0),
(263, 'شركة طيبة للتوريدات', 0, NULL, NULL, 0),
(264, 'باسيكو للتجارة والتوزيع', 1001472166, NULL, NULL, 0),
(265, 'شركة أوتاك', 1223103577, NULL, NULL, 0),
(266, 'شركة توب تريد', 224194548, NULL, NULL, 0),
(267, 'إكسبو إيجيبت', 1223822839, NULL, NULL, 0),
(268, 'شركة بلونايل إنتر ناشيونال', 0, NULL, NULL, 0),
(269, 'إيكو تريد', 0, NULL, NULL, 0),
(270, 'مؤسسة جراند', 0, NULL, NULL, 0),
(271, 'الشروق للتجهيزات الفندقية', 0, NULL, NULL, 0),
(272, 'شركة سيناء للتجهيزات الفندقية', 0, NULL, NULL, 0),
(273, 'ميتالنيو', 0, NULL, NULL, 0),
(274, 'شركة الفسطاط', 0, NULL, NULL, 0),
(275, 'شركة توب تريد', 224194548, NULL, NULL, 0),
(276, 'شركة AFS', 1222123489, NULL, NULL, 0),
(277, 'العالمية', 0, NULL, NULL, 0),
(278, 'شركة فرانك', 1068803323, NULL, NULL, 0),
(279, 'شركة الكرنك للإعلان', 1222110720, NULL, NULL, 0),
(280, 'عاطف صابر مالتى ميديا', 0, NULL, NULL, 0),
(281, 'ليكويد', 1000002684, NULL, NULL, 0),
(282, 'الماسة', 0, NULL, NULL, 0),
(283, 'شركة أرتستيكو', 1223378705, NULL, NULL, 0),
(284, 'شركة مدرسة النيل', 0, NULL, NULL, 0),
(285, 'شركة النساجون الشرقيون', 1111044448, NULL, NULL, 0),
(286, 'شركة ماك', 1003435914, NULL, NULL, 0),
(287, 'شركة موكيت سنتر', 1227654165, NULL, NULL, 0),
(288, 'الشركة المصرية اليونانية', 0, NULL, NULL, 0),
(289, 'سورناجا مصر', 0, NULL, NULL, 0),
(290, 'شروق للمقاولات ومواد البناء', 1001115076, NULL, NULL, 0),
(291, 'ممدوح الجمال', 1229327257, NULL, NULL, 0),
(292, 'الشركة المصرية الإيطالية', 0, NULL, NULL, 0),
(293, 'جلوبال قرميد', 0, NULL, NULL, 0),
(294, 'شركة إستاندر الصناعية نوفا', 0, NULL, NULL, 0),
(295, 'شركة طاقة مصر', 229293990, NULL, NULL, 0),
(296, 'GREEN', 0, NULL, NULL, 0),
(297, 'الطاقة الشمسية', 1002537376, NULL, NULL, 0),
(298, 'رواد مصر للتجارة والتوكيلات', 0, NULL, NULL, 0),
(299, 'شركة إيجبت سوفت', 0, NULL, NULL, 0),
(300, 'الأهرام للكوالين', 0, NULL, NULL, 0),
(301, 'المكتب العربي للإتصالات', 0, NULL, NULL, 0),
(302, 'شركة هوتيك', 0, NULL, NULL, 0),
(303, 'الشركة الهندسية ثورن', 1002864426, NULL, NULL, 0),
(304, 'شركة سيباي', 1001642256, NULL, NULL, 0),
(305, 'مؤسسة الفادي', 1223189008, NULL, NULL, 0),
(306, 'شركة بافاريا مصر', 0, NULL, NULL, 0),
(307, 'شركة سما', 0, NULL, NULL, 0),
(308, 'الدولية للتجارة', 0, NULL, NULL, 0),
(309, 'الكوثر', 1003778883, NULL, NULL, 0),
(310, 'مصانع نافع', 0, NULL, NULL, 0),
(311, 'محمد علي البهتيمي', 0, NULL, NULL, 0),
(312, 'سعيد أحمد محمد', 0, NULL, NULL, 0),
(313, 'تاكي م/ مينا رمزى', 0, NULL, NULL, 0),
(314, 'أولاد أبو إسماعيل', 0, NULL, NULL, 0),
(315, 'مؤسسة البركة', 0, NULL, NULL, 0),
(316, 'دياب لتجارة الأدوات الكهربائية', 0, NULL, NULL, 0),
(317, 'شركة ثرى برازر', 0, NULL, NULL, 0),
(318, 'شركة تيفنى', 0, NULL, NULL, 0),
(319, 'مجموعة هارمن للتجارة', 0, NULL, NULL, 0),
(320, 'المصرية للأعمال الكهربائية', 0, NULL, NULL, 0),
(321, 'شركة الترا لايت', 0, NULL, NULL, 0),
(322, 'العربية الدولية', 0, NULL, NULL, 0),
(323, 'الشركة الإيطالية', 0, NULL, NULL, 0),
(324, 'الشركة المتحدة للتسجيلات', 1222311714, NULL, NULL, 0),
(325, 'ألفا أوديو', 0, NULL, NULL, 0),
(326, 'ناندوز', 0, NULL, NULL, 0),
(327, 'جالا ستار', 1223256939, NULL, NULL, 0),
(328, 'شركة باسكو اندستريال', 0, NULL, NULL, 0),
(329, 'شركة أوشن آند ريفر', 0, NULL, NULL, 0),
(330, 'شركة باسكو', 1225519559, NULL, NULL, 0),
(331, 'شركة الصباح', 1000729489, NULL, NULL, 0),
(332, 'شركة الجارحي', 1222758109, NULL, NULL, 0),
(333, 'شركة ترسانة الجيزة', 0, NULL, NULL, 0),
(334, 'مركز الاسكندرية البحري والتجاري', 0, NULL, NULL, 0),
(335, 'المجموعة للتجارة والمقاولات', 1006500905, NULL, NULL, 0),
(336, 'المجموعة السويدية', 1006589690, NULL, NULL, 0),
(337, 'شركة النصر تريدنج', 0, NULL, NULL, 0),
(338, 'سنتر للتجارة والتوكيلات', 1223472735, NULL, NULL, 0),
(339, 'شركة هاوزن', 0, NULL, NULL, 0),
(340, 'شركة أغاخان للمصاعد', 1001406030, NULL, NULL, 0),
(341, 'شركة متسوبيشى', 0, NULL, NULL, 0),
(342, 'المصرية الألمانية', 0, NULL, NULL, 0),
(343, 'شركة شندلر', 0, NULL, NULL, 0),
(344, 'شركة أوتس', 0, NULL, NULL, 0),
(345, 'شركة المنصور التجارية', 1223489204, NULL, NULL, 0),
(346, 'مؤسسة القدس', 225916449, NULL, NULL, 0),
(347, 'المركز التجارى الفنى الدولى', 0, NULL, NULL, 0),
(348, 'مركز القاهرة للعدد والأدوات', 227872001, NULL, NULL, 0),
(349, 'شركة رشيد للأدوات الصناعية', 225913920, NULL, NULL, 0),
(350, 'شركة النجار', 0, NULL, NULL, 0),
(351, 'العربى', 0, NULL, NULL, 0),
(352, 'هنيمكس', 1003983112, NULL, NULL, 0),
(353, 'فرج سمعان', 0, NULL, NULL, 0),
(354, 'مصنع النهضة', 0, NULL, NULL, 0),
(355, 'الشروق للتجهيزات الفندقية', 0, NULL, NULL, 0),
(356, 'الأمل للمواسير البلاستيك', 0, NULL, NULL, 0),
(357, 'مصنع مصطفى محمود للبلاستيك', 0, NULL, NULL, 0),
(358, 'سبارك كونكورد', 0, NULL, NULL, 0),
(359, 'مصر الحجاز', 0, NULL, NULL, 0),
(360, 'شركة وين دورز', 1001451821, NULL, NULL, 0),
(361, 'توب ميتال ( محمـــد القبــــرصلــى )', 0, NULL, NULL, 0),
(362, 'شركة أماكو', 1004911111, NULL, NULL, 0),
(363, 'البارود جلاس ( زجاج فقط )', 0, NULL, NULL, 0),
(364, 'ألوتاك-الشركة المصرية الألمانية', 0, NULL, NULL, 0),
(365, 'دكتور جريش', 1112746888, NULL, NULL, 0),
(366, 'إبراهيم موسى', 1223438108, NULL, NULL, 0),
(367, 'طارق بكر (زجاج فقط)', 0, NULL, NULL, 0),
(368, 'لمسات فيوتك', 1001542316, NULL, NULL, 0),
(369, 'شركة ليب مصر', 0, NULL, NULL, 0),
(370, 'شركة فيوتك', 0, NULL, NULL, 0),
(371, 'مشاتل القناطر', 1003332246, NULL, NULL, 0),
(372, 'مشاتل البستان', 0, NULL, NULL, 0),
(373, 'جرين للزراعة الحديثة', 0, NULL, NULL, 0),
(374, 'مشاتل لؤلؤة النيل', 0, NULL, NULL, 0),
(375, 'شركة حمزة الزراعية', 0, NULL, NULL, 0),
(376, 'شركة الحسيني للتنمية الزراعية', 0, NULL, NULL, 0),
(377, 'شركة كنزى', 0, NULL, NULL, 0),
(378, 'مزرعة الأخوة لإنتاج المحاصيل البستانية', 0, NULL, NULL, 0),
(379, 'فوتو بلوك', 1001237700, NULL, NULL, 0),
(380, 'جاليري سيزار', 0, NULL, NULL, 0),
(381, 'ناجوري هاوس', 0, NULL, NULL, 0),
(382, 'زهور علام', 0, NULL, NULL, 0),
(383, 'شركة كلر', 0, NULL, NULL, 0),
(384, 'ارتستيكو', 1223378705, NULL, NULL, 0),
(385, 'جولدن ميرو', 0, NULL, NULL, 0),
(386, 'سام تريد', 0, NULL, NULL, 0),
(387, 'صوار', 0, NULL, NULL, 0),
(388, 'العربية', 1001440086, NULL, NULL, 0),
(389, 'الشركة المتحدة للتجارة والتوريدات', 1223100595, NULL, NULL, 0),
(390, 'محمود عبدالحميد عبدالله', 0, NULL, NULL, 0),
(391, 'دغش', 0, NULL, NULL, 0),
(392, 'أيمن شفيق', 1007231157, NULL, NULL, 0),
(393, 'شركة ماركو', 1226161316, NULL, NULL, 0),
(394, 'حمدى شحاته الزامك(شركة عبر الامارات)', 0, NULL, NULL, 0),
(395, 'NAAلأعمـــال الديكــــور', 0, NULL, NULL, 0),
(396, 'أسامة وحيـــد للديكـــــور', 0, NULL, NULL, 0),
(397, 'وائل', 0, NULL, NULL, 0),
(398, 'سامى صالح أمين', 0, NULL, NULL, 0),
(399, 'مونديال بوولز', 1004300111, NULL, NULL, 0),
(400, 'شركة منتجع الجنة', 0, NULL, NULL, 0),
(401, 'أشــرف محمــد (النورين)', 0, NULL, NULL, 0),
(402, 'شـركـة تـوب سيـرفيــس', 0, NULL, NULL, 0),
(403, 'المكتب الفني الهندسي للمقاولات ( تويك)', 0, NULL, NULL, 0),
(404, 'سعيــد السعيـــد (شــركة تــام)', 0, NULL, NULL, 0),
(405, 'الشركة المصرية', 1000997823, NULL, NULL, 0),
(406, 'الرائد جيت ماستر', 1221536776, NULL, NULL, 0),
(407, 'شركة واتكو', 0, NULL, NULL, 0),
(408, 'I .T.I', 0, NULL, NULL, 0),
(409, 'الشركة الدولية', 0, NULL, NULL, 0),
(410, 'عبدالسلام أحمد', 1223137802, NULL, NULL, 0),
(411, 'الرضوانية', 0, NULL, NULL, 0),
(412, 'شركة إيتوس', 2147483647, NULL, NULL, 0),
(413, 'شركة إيتوس', 2147483647, NULL, NULL, 0),
(414, 'فتحى إبراهيـم سيـدهــم', 0, NULL, NULL, 0),
(415, 'أحمد شوقى عبدربه', 1001114638, NULL, NULL, 0),
(416, 'فرانس ميتال ( أبواب مضادة للحريق )', 0, NULL, NULL, 0),
(417, 'الفسطاط جمال ( جمال عبدربه )', 0, NULL, NULL, 0),
(418, 'النهر ( يحيى )', 0, NULL, NULL, 0),
(419, 'شركة ماريات سكوت', 0, NULL, NULL, 0),
(420, 'شركــة القـــدس', 0, NULL, NULL, 0),
(421, 'الشركة الفنية للأعمال الهندسية', 0, NULL, NULL, 0),
(422, 'الزعبلاوي', 0, NULL, NULL, 0),
(423, 'رأفت شعبان عويس', 0, NULL, NULL, 0),
(424, 'توشكى', 1004905018, NULL, NULL, 0),
(425, 'شــركــة الأنـدلـس', 0, NULL, NULL, 0),
(426, 'شركة بلادى', 0, NULL, NULL, 0),
(427, 'أحمد عبد الصادق', 0, NULL, NULL, 0),
(428, 'وليد', 0, NULL, NULL, 0),
(429, 'محمد فؤاد حسن', 0, NULL, NULL, 0),
(430, 'حمدى بركات', 0, NULL, NULL, 0),
(431, 'شركة الشرق للهندســة والتوكيــلات', 225914279, NULL, NULL, 0),
(432, 'مام', 33368710, NULL, NULL, 0),
(433, 'سنكرو', 0, NULL, NULL, 0),
(434, 'الديب', 0, NULL, NULL, 0),
(435, 'سيجا - أم', 0, NULL, NULL, 0),
(436, 'أحمد (شركة الذهبية)', 15351705, NULL, NULL, 0),
(437, 'شركة abb', 26251365, NULL, NULL, 0),
(438, 'شركة جيلا', 0, NULL, NULL, 0),
(439, 'اليكتريك جروب', 0, NULL, NULL, 0),
(440, 'امكو', 33443245, NULL, NULL, 0),
(441, 'شركة مانتراك', 23039648, NULL, NULL, 0),
(442, 'ميج ( أحمد مجاهد )', 0, NULL, NULL, 0),
(443, 'شركة لايت تكنولوجي', 1007495115, NULL, NULL, 0),
(444, 'الحرية الحديثة', 1004888999, NULL, NULL, 0),
(445, 'شركة ترونيكس', 22670992, NULL, NULL, 0),
(446, 'شركة mcs لأنظمة الاتصالات الحديثة (سنترال نورتن)', 0, NULL, NULL, 0),
(447, 'شركة باناسونيك', 22033000, NULL, NULL, 0),
(448, 'تكنوكريت', 1119005426, NULL, NULL, 0),
(449, 'يونى كريت', 0, NULL, NULL, 0),
(450, 'الصوفى للبلاط الآلى', 1090222618, NULL, NULL, 0),
(451, 'شروق للمقاولات ومواد البناء', 26906516, NULL, NULL, 0),
(452, 'ربـيــــع أحـمـــد', 0, NULL, NULL, 0),
(453, 'ســرحـــان', 0, NULL, NULL, 0),
(454, 'عبــدالحفيــظ (البحــر الاحمــر)', 0, NULL, NULL, 0),
(455, 'إبراهيــم (الصـفـــا)', 0, NULL, NULL, 0),
(456, 'الربـــاط لمــواد البنـــاء', 0, NULL, NULL, 0),
(457, 'الزعتــرى', 0, NULL, NULL, 0),
(458, 'هسكــا للبنــاء', 0, NULL, NULL, 0),
(459, 'أحمد المليجى', 0, NULL, NULL, 0),
(460, 'شركة فاليو تريد', 1222576310, NULL, NULL, 0),
(461, 'المصرية السويدية', 38311768, NULL, NULL, 0),
(462, 'الرحاب م/ وائل البدري', 0, NULL, NULL, 0),
(463, 'شركة أورينتال', 0, NULL, NULL, 0),
(464, 'ميكولاند للمستلزمات الزراعية الحديثة', 22687836, NULL, NULL, 0),
(465, 'المظلوم', 0, NULL, NULL, 0),
(466, 'تراست', 26216282, NULL, NULL, 0),
(467, 'أيمن رشاد', 0, NULL, NULL, 0),
(468, 'شركة اسكندرية', 0, NULL, NULL, 0),
(469, 'حديد عز', 0, NULL, NULL, 0),
(470, 'حديد بشاى', 2603964, NULL, NULL, 0),
(471, 'العسكرى', 5885847, NULL, NULL, 0),
(472, 'ممدوح إستيل', 0, NULL, NULL, 0),
(473, 'الحاجة منى', 105847795, NULL, NULL, 0),
(474, 'سيد فراج', 0, NULL, NULL, 0),
(475, 'الشركة المتحدة', 0, NULL, NULL, 0),
(476, 'سيد حنفى', 0, NULL, NULL, 0),
(477, 'شركة Technogym', 0, NULL, NULL, 0),
(478, 'العريبة مصطفى عطية', 1001440086, NULL, NULL, 0),
(479, 'المتحدة  سراج', 1223100595, NULL, NULL, 0),
(480, 'شركة Space', 0, NULL, NULL, 0),
(481, 'Egyption American', 0, NULL, NULL, 0),
(482, 'weider', 33028149, NULL, NULL, 0),
(483, 'Artoc Sports', 25082226, NULL, NULL, 0),
(484, 'Fitness pro', 33054260, NULL, NULL, 0),
(485, 'أبوالمعاطى', 23914028, NULL, NULL, 0),
(486, 'شركة سبورت ماستر', 35833867, NULL, NULL, 0),
(487, 'مركز الرياضة', 23939181, NULL, NULL, 0),
(488, 'مرزوق', 23939181, NULL, NULL, 0),
(489, 'النسر الذهبى', 1004023941, NULL, NULL, 0),
(490, 'الحاج مجدى التونى', 0, NULL, NULL, 0),
(491, 'شركة العتال', 0, NULL, NULL, 0),
(492, 'شركة الغرباوي', 0, NULL, NULL, 0),
(493, 'الإسناوى - حسن العريشى', 1001246215, NULL, NULL, 0),
(494, 'المحمدية', 101479655, NULL, NULL, 0),
(495, 'الظافر', 0, NULL, NULL, 0),
(496, 'أبناء الصعيد', 0, NULL, NULL, 0),
(497, 'أبناء جاد', 0, NULL, NULL, 0),
(498, 'شركة بايونير إيجبت', 4145731, NULL, NULL, 0),
(499, 'شركة متجر', 1119066800, NULL, NULL, 0),
(500, 'مركز إى دى سى لتطوير المعدات', 26385215, NULL, NULL, 0),
(501, 'محمد فوزى بدوى', 0, NULL, NULL, 0),
(502, 'محمد عبد الباقى الطيب', 0, NULL, NULL, 0),
(503, 'السيد صالح السيد صالح', 0, NULL, NULL, 0),
(504, 'ريمون غندور', 0, NULL, NULL, 0),
(505, 'على محروس على', 0, NULL, NULL, 0),
(506, 'عبد الرازق عبد المعطى عبد الرازق', 0, NULL, NULL, 0),
(507, 'أحمد السيد عبد المطلب', 0, NULL, NULL, 0),
(508, 'شركة سبأ', 0, NULL, NULL, 0),
(509, 'قاسم أبو الوفا', 0, NULL, NULL, 0),
(510, 'محمد عبد الجواد إبراهيم', 0, NULL, NULL, 0),
(511, 'شركة أبو جميعة للمقاولات (فكرى أبو جميعة)', 0, NULL, NULL, 0),
(512, 'م / محمد عاطف', 0, NULL, NULL, 0),
(513, 'البنائون', 0, NULL, NULL, 0),
(514, 'شركة الحسن للمقاولات', 0, NULL, NULL, 0),
(515, 'محمد العزب', 0, NULL, NULL, 0),
(516, 'أمير (من الباطن جرافيا)', 0, NULL, NULL, 0),
(517, 'جرافيا', 0, NULL, NULL, 0),
(518, 'م / حسن', 0, NULL, NULL, 0),
(519, 'شركة كونتشتال', 0, NULL, NULL, 0),
(520, 'يوسف إبراهيم', 0, NULL, NULL, 0),
(521, 'جمال حسنى صديق', 0, NULL, NULL, 0),
(522, 'شعبان شحاتة طلبة', 0, NULL, NULL, 0),
(523, 'على محمد ضيف اللة', 0, NULL, NULL, 0),
(524, 'عبد الدايم أحمد', 0, NULL, NULL, 0),
(525, 'أحمد جمعة', 0, NULL, NULL, 0),
(526, 'منصور عبدة حامد (الشهرة حمدى)', 0, NULL, NULL, 0),
(527, 'حامد الوكيل', 0, NULL, NULL, 0),
(528, 'أحمد سليمان حمدان', 0, NULL, NULL, 0),
(529, 'إبراهيم سليمان حمدان', 0, NULL, NULL, 0),
(530, 'أحمد حسين سالم', 0, NULL, NULL, 0),
(531, 'هانى يحى محمد عبدة', 0, NULL, NULL, 0),
(532, 'حامد سليمان أحمد عبداللة', 0, NULL, NULL, 0),
(533, 'أبو المكارم شحاتة نخلة (الشهرة كرم)', 0, NULL, NULL, 0),
(534, 'صلاح سيد أحمد (الشهرة أبو رحاب)', 0, NULL, NULL, 0),
(535, 'أبو المكارم شحاتة نخلة (الشهرة كرم)', 0, NULL, NULL, 0),
(536, 'عزت نوفل', 0, NULL, NULL, 0),
(537, 'كيماويات البناء الحديث', 33824347, NULL, NULL, 0),
(538, 'سيكا', 37618466, NULL, NULL, 0),
(539, 'الشركة العالمية لمواد البناء', 22398554, NULL, NULL, 0),
(540, 'شركة يسمو مصر', 24535678, NULL, NULL, 0),
(541, 'دلما تريد', 37612725, NULL, NULL, 0),
(542, 'شركة جولدن جروب', 33828649, NULL, NULL, 0),
(543, 'سيراميك بورتو', 0, NULL, NULL, 0),
(544, 'سيراميك المناهري', 0, NULL, NULL, 0),
(545, 'سيراميك أبو كبشه', 0, NULL, NULL, 0),
(546, 'سيراميك كايرو', 0, NULL, NULL, 0),
(547, 'كرنفال رويال للسيراميك', 0, NULL, NULL, 0),
(548, 'شركة الشوربجي بالغردقه', 0, NULL, NULL, 0),
(549, 'شركة البركه', 0, NULL, NULL, 0),
(550, 'شركة السعد', 0, NULL, NULL, 0),
(551, 'شركة السعد', 0, NULL, NULL, 0),
(552, 'شركة دهب', 0, NULL, NULL, 0),
(553, 'شركة أيمن طه', 0, NULL, NULL, 0),
(554, 'شركة الحمد', 0, NULL, NULL, 0),
(555, 'شركة أحمد موسي', 0, NULL, NULL, 0),
(556, 'إبراهيم السعداوي', 0, NULL, NULL, 0),
(557, 'شركة الإخلاص', 0, NULL, NULL, 0),
(558, 'الشركة الدولية للأخشاب', 0, NULL, NULL, 0),
(559, 'النور', 0, NULL, NULL, 0),
(560, 'المنصورة', 0, NULL, NULL, 0),
(561, 'الرحاب', 0, NULL, NULL, 0),
(562, 'الحمد', 0, NULL, NULL, 0),
(563, 'شركة الراعي الصالح', 0, NULL, NULL, 0),
(564, 'شركة التوحيد (عواد)', 0, NULL, NULL, 0),
(565, 'الإيطالية', 0, NULL, NULL, 0),
(566, 'أشرف عطيه', 0, NULL, NULL, 0),
(567, 'السويسريه   N. A . R', 0, NULL, NULL, 0),
(568, 'المحمدي للمقاولات', 0, NULL, NULL, 0),
(569, 'السوري', 0, NULL, NULL, 0),
(570, 'الجوهرة', 0, NULL, NULL, 0),
(571, 'الحسين', 0, NULL, NULL, 0),
(572, 'العدوي', 0, NULL, NULL, 0),
(573, 'وطني إستيل', 0, NULL, NULL, 0),
(574, 'شركة العامة استانلس', 0, NULL, NULL, 0),
(575, 'ألفاتك', 0, NULL, NULL, 0),
(576, 'شركة الجابري', 0, NULL, NULL, 0),
(577, 'الشركة الفنية', 0, NULL, NULL, 0),
(578, 'أولاد محروس', 0, NULL, NULL, 0),
(579, 'المتوكل', 0, NULL, NULL, 0),
(580, 'الحمد', 0, NULL, NULL, 0),
(581, 'السبكي', 0, NULL, NULL, 0),
(582, 'قرني', 0, NULL, NULL, 0),
(583, 'مركز الينا للدهانات  وكيل يوتن', 0, NULL, NULL, 0),
(584, 'شركة التمساح', 0, NULL, NULL, 0),
(585, 'شركة التمساح', 0, NULL, NULL, 0),
(586, 'شركة سيف', 0, NULL, NULL, 0),
(587, 'شركة دار العماره', 0, NULL, NULL, 0),
(588, 'شركة الجارحي', 0, NULL, NULL, 0),
(589, 'الولاء', 0, NULL, NULL, 0),
(590, 'جنرال', 0, NULL, NULL, 0),
(591, 'المتحده', 0, NULL, NULL, 0),
(592, 'الهدي (احمد فرحات )', 0, NULL, NULL, 0),
(593, 'آل عامر', 0, NULL, NULL, 0),
(594, 'الأوروبيه', 0, NULL, NULL, 0),
(595, 'إليكترام', 0, NULL, NULL, 0),
(596, 'نيو كونكورد', 0, NULL, NULL, 0),
(597, 'العسكري', 0, NULL, NULL, 0),
(598, 'وان تاتش', 0, NULL, NULL, 0),
(599, 'كيمو 2001', 0, NULL, NULL, 0),
(600, 'الإتحاد الإستثماري', 0, NULL, NULL, 0),
(601, 'كوميت جروب', 0, NULL, NULL, 0),
(602, 'كريستال إنترناشونال', 0, NULL, NULL, 0),
(603, 'البنا جروب', 0, NULL, NULL, 0),
(604, 'الأمل الجديدة', 0, NULL, NULL, 0),
(605, 'معرض الهدي', 0, NULL, NULL, 0),
(606, 'الندي', 0, NULL, NULL, 0),
(607, 'الملكة ولامير', 0, NULL, NULL, 0),
(608, 'بيتي إليكترك', 0, NULL, NULL, 0),
(609, 'معرض عبد الرحيم مسعود', 0, NULL, NULL, 0),
(610, 'أسما جروب', 0, NULL, NULL, 0),
(611, 'أسما جروب', 0, NULL, NULL, 0),
(612, 'أغابي', 0, NULL, NULL, 0),
(613, 'المنشاوي', 0, NULL, NULL, 0),
(614, 'سنتر ماهر', 0, NULL, NULL, 0),
(615, 'كرستال', 0, NULL, NULL, 0),
(616, 'الدولية رامي غازي', 0, NULL, NULL, 0),
(617, 'الكوثر', 0, NULL, NULL, 0),
(618, 'قصر الهدايا', 0, NULL, NULL, 0),
(619, 'A 2 Z', 0, NULL, NULL, 0),
(620, 'E G S', 0, NULL, NULL, 0),
(621, 'المؤسسة المتحدة', 0, NULL, NULL, 0),
(622, 'أبلكس مصر', 0, NULL, NULL, 0),
(623, 'دهب للطلمبات', 0, NULL, NULL, 0),
(624, 'يونيمكس', 0, NULL, NULL, 0),
(625, 'مرسال', 0, NULL, NULL, 0),
(626, 'أولاد حميدكو', 0, NULL, NULL, 0),
(627, 'الشركة العالمية', 0, NULL, NULL, 0),
(628, 'فرندز', 0, NULL, NULL, 0),
(629, 'الأصدقاء', 0, NULL, NULL, 0),
(630, 'نايس برنت', 0, NULL, NULL, 0),
(631, 'روني', 0, NULL, NULL, 0),
(632, 'فورست هورس', 0, NULL, NULL, 0),
(633, 'شركة كواليتي صطاف', 0, NULL, NULL, 0),
(634, 'أبو ضيف', 0, NULL, NULL, 0),
(635, 'سعيد للمبامبو', 0, NULL, NULL, 0),
(636, 'سعيد للمبامبو', 0, NULL, NULL, 0),
(637, 'شعبان', 0, NULL, NULL, 0),
(638, 'أبو العلا', 0, NULL, NULL, 0),
(639, 'الساعاتي', 0, NULL, NULL, 0),
(640, 'JBl', 0, NULL, NULL, 0),
(641, 'شركة محمد صلاح الدين', 0, NULL, NULL, 0),
(642, 'ويفز', 0, NULL, NULL, 0),
(643, 'إيجبتك', 0, NULL, NULL, 0),
(644, 'ايموكس', 0, NULL, NULL, 0),
(645, 'العسري', 0, NULL, NULL, 0),
(646, 'إيمك', 0, NULL, NULL, 0),
(647, 'سفنتي بوينت', 0, NULL, NULL, 0),
(648, 'بان دي في', 0, NULL, NULL, 0),
(649, 'هاني تك نور', 0, NULL, NULL, 0),
(650, 'سبيد', 0, NULL, NULL, 0),
(651, 'كيان', 0, NULL, NULL, 0),
(652, 'الحجاز', 0, NULL, NULL, 0),
(653, 'النور', 0, NULL, NULL, 0),
(654, 'سيتي جرين', 0, NULL, NULL, 0),
(655, 'الأندلس', 0, NULL, NULL, 0),
(656, 'مودرن فارم', 0, NULL, NULL, 0),
(657, 'ووتر سيستم', 0, NULL, NULL, 0),
(658, 'إيماك', 0, NULL, NULL, 0),
(659, 'الجزيرة', 0, NULL, NULL, 0),
(660, 'اكوا كريستال', 0, NULL, NULL, 0),
(661, 'ريتاج', 0, NULL, NULL, 0),
(662, 'يوسف حامد', 0, NULL, NULL, 0),
(663, 'الكابتن', 0, NULL, NULL, 0),
(664, 'باسم السراج', 0, NULL, NULL, 0),
(665, 'عالم الرياضة', 0, NULL, NULL, 0),
(666, 'أشرف حلمي', 0, NULL, NULL, 0),
(667, 'قاصد كريم', 0, NULL, NULL, 0),
(668, 'الفنار', 0, NULL, NULL, 0),
(669, 'التقوي', 0, NULL, NULL, 0),
(670, 'أشرف نادي', 0, NULL, NULL, 0),
(671, 'مارديني', 0, NULL, NULL, 0),
(672, 'الصفا  (الانصاري)', 0, NULL, NULL, 0),
(673, 'السادات ( سيكا )', 0, NULL, NULL, 0),
(674, 'أحمد كمال ( دهانات )', 0, NULL, NULL, 0),
(675, 'الشماع', 0, NULL, NULL, 0),
(676, 'شركه نايل جروب', 0, NULL, NULL, 0),
(677, 'شركة وايز', 0, NULL, NULL, 0),
(678, 'هيرلي', 0, NULL, NULL, 0),
(679, 'اليكترك هوم', 0, NULL, NULL, 0),
(680, 'السويدي للكبلات الغردقه', 0, NULL, NULL, 0),
(681, 'باور سنتر', 0, NULL, NULL, 0),
(682, 'جولدن لايت', 0, NULL, NULL, 0),
(683, 'جولدن لايت', 0, NULL, NULL, 0),
(684, 'جولدن لايت', 0, NULL, NULL, 0),
(685, 'لايت بلان', 0, NULL, NULL, 0),
(686, 'باور الكترك', 0, NULL, NULL, 0),
(687, 'باور الكترك', 0, NULL, NULL, 0),
(688, 'العثمانيون', 0, NULL, NULL, 0),
(689, 'بسمه', 0, NULL, NULL, 0),
(690, 'غريب', 0, NULL, NULL, 0),
(691, 'عبد العزيز الدهشوري', 0, NULL, NULL, 0),
(692, 'أسامه لبيب', 0, NULL, NULL, 0),
(693, 'الشرق للصناعات', 0, NULL, NULL, 0),
(694, 'الدوليه للأنظمه الهندسيه', 0, NULL, NULL, 0),
(695, 'سيف النصر', 0, NULL, NULL, 0),
(696, 'دنيا الفنون والأعلام', 0, NULL, NULL, 0),
(697, 'الشناوي', 0, NULL, NULL, 0),
(698, 'كنزي', 0, NULL, NULL, 0),
(699, 'خورشيد', 0, NULL, NULL, 0),
(700, 'سمارت سيستم', 0, NULL, NULL, 0),
(701, 'كيما كونسلت', 0, NULL, NULL, 0),
(702, 'أكوا اكيار', 0, NULL, NULL, 0),
(703, 'اكوا لايف', 0, NULL, NULL, 0),
(704, 'PWT', 0, NULL, NULL, 0),
(705, 'الدوليه لتكنولوجيا المياه', 0, NULL, NULL, 0),
(706, 'العميد ممدوح', 0, NULL, NULL, 0),
(707, 'ماتوز', 0, NULL, NULL, 0),
(708, 'التمساح للديكورات', 0, NULL, NULL, 0),
(709, 'كيا', 0, NULL, NULL, 0),
(710, 'عرفه برايت', 0, NULL, NULL, 0),
(711, 'انتيكا', 0, NULL, NULL, 0),
(712, 'البحرين', 0, NULL, NULL, 0),
(713, 'اول ان ون', 0, NULL, NULL, 0),
(714, 'كليك', 0, NULL, NULL, 0),
(715, 'كليك', 0, NULL, NULL, 0),
(716, 'تك تكنولوجي', 0, NULL, NULL, 0),
(717, 'تليكوم', 0, NULL, NULL, 0),
(718, 'هاي تك', 0, NULL, NULL, 0),
(719, 'المهندس', 0, NULL, NULL, 0),
(720, 'اليكترك هاوس', 0, NULL, NULL, 0),
(721, 'باور اليكترك', 0, NULL, NULL, 0),
(722, 'المركز الهندسي', 0, NULL, NULL, 0),
(723, 'المركز الفني', 0, NULL, NULL, 0),
(724, 'محمد عزام', 0, NULL, NULL, 0),
(725, 'محمد رزق', 0, NULL, NULL, 0),
(726, 'الفا تيك', 0, NULL, NULL, 0),
(727, 'الدلتا', 0, NULL, NULL, 0),
(728, 'القاهرة', 0, NULL, NULL, 0),
(729, 'الحاج كمال', 0, NULL, NULL, 0),
(730, 'عمرو سرايا', 0, NULL, NULL, 0),
(731, 'سيناو', 0, NULL, NULL, 0),
(732, 'مركز سمير', 0, NULL, NULL, 0),
(733, 'مركز الجنايني', 0, NULL, NULL, 0),
(734, 'الأقصر', 0, NULL, NULL, 0),
(735, 'الزهراء', 0, NULL, NULL, 0),
(736, 'الكينج', 0, NULL, NULL, 0),
(737, 'الزهراء محمد غازي', 0, NULL, NULL, 0),
(738, 'المصريه العالميه للسيارات', 0, NULL, NULL, 0),
(739, 'المتحده محمود عيسي', 0, NULL, NULL, 0),
(740, 'أشرف للأعمال الإلكترونيه والفبر جلاس', 0, NULL, NULL, 0),
(741, 'مؤسسه الأمل', 0, NULL, NULL, 0),
(742, 'مختار عبد الراضي', 0, NULL, NULL, 0),
(743, 'النيل', 0, NULL, NULL, 0),
(744, 'الهندسيه', 0, NULL, NULL, 0),
(745, 'شريف شديد', 0, NULL, NULL, 0),
(746, 'مصرية لمعدات المطابخ ', 0, NULL, NULL, 0),
(747, 'ماستر نايل', 0, NULL, NULL, 0),
(748, 'الشركه الدوليه للإنظمه الهندسية', 1022277949, NULL, NULL, 0),
(749, 'مكتب العقباوى للمقاولات', 1008414940, NULL, NULL, 0),
(750, 'المتحده للمقاولات', 1011360036, NULL, NULL, 0),
(751, 'spada china co', 0, NULL, NULL, 0),
(752, 'الصياد تريدينج مصر', 1284445229, NULL, NULL, 0),
(753, 'وقود مصر', 0, NULL, NULL, 0),
(754, 'الورشة ألمركزيه - work centre ', 101, NULL, NULL, 0),
(755, 'العربية للأعمال الهندسية', 1067771976, NULL, NULL, 0),
(756, 'water dynamic ', 2147483647, NULL, NULL, 0),
(757, 'Power Technology ', 1001114807, NULL, NULL, 0),
(758, 'جولدن كيتشن ستيل', 1245678, NULL, NULL, 0),
(759, 'المرتضي لبيع وصيانه قطع غيارالمعدات البحريه', 133467889, NULL, NULL, 0),
(760, 'print shop company', 123456789, NULL, NULL, 0),
(761, 'مصر للمقاولات  والانشاءات', 1323454578, NULL, NULL, 0),
(762, 'شركة مصر للمقاولات و الإنشاءات', 124345678, NULL, NULL, 0),
(763, 'Bluebird\\''s processing and maintenance of hotels', 1288300089, NULL, NULL, 0),
(764, 'Elabied co for you', 12456789, NULL, NULL, 0),
(765, 'Minart', 0, NULL, NULL, 0),
(766, 'SABA CO', 1245678920, NULL, NULL, 0),
(767, 'IBC', 222720729, NULL, NULL, 0),
(768, 'EMK', 653440451, NULL, NULL, 0),
(769, 'Pain De Vie Company', 0, NULL, NULL, 0),
(770, 'hussien Dawod', 0, NULL, NULL, 0),
(771, 'Al Takwaha Company', 0, NULL, NULL, 0),
(772, 'Imperial Gate', 0, NULL, NULL, 0),
(773, 'Emco Technology', 0, NULL, NULL, 0),
(774, 'الهيئه العربيه للتصنيع ', 24567899, NULL, NULL, 0),
(775, ' CWS & Others', 124567, NULL, NULL, 0),
(776, ' CWS & Others', 124567, NULL, NULL, 0),
(777, ' CWS & Others', 124567, NULL, NULL, 0),
(778, 'Al Atya Office', 123456789, NULL, NULL, 0),
(779, 'أمكو تكنولوجي انترناشيونال ', 123456, NULL, NULL, 0),
(780, 'شركه البدر', 13545, NULL, NULL, 0),
(781, 'النعمان', 123456, NULL, NULL, 0),
(782, 'El Handasia For Engineering Company', 1245, NULL, NULL, 0),
(783, 'T&D Kitchen Company', 124567, NULL, NULL, 0),
(784, 'CTC Company', 124567, NULL, NULL, 0),
(785, 'El Turkiy Company', 1245, NULL, NULL, 0),
(786, 'El Turkiy Company', 1245, NULL, NULL, 0),
(787, 'Audio Technology', 124567, NULL, NULL, 0),
(788, 'Egyptian agencies company ', 1245, NULL, NULL, 0),
(789, 'Spider', 12, NULL, NULL, 0),
(790, 'Team', 12455, NULL, NULL, 0),
(791, 'المؤسسة العالمية الكهروميكانيكية ', 2147483647, NULL, NULL, 0),
(792, 'المؤسسة العالمية للتوريدات الكهروميكانيكية ', 12455, NULL, NULL, 0),
(793, 'المؤسسة العالمية الكهروميكانيكية ', 12455, NULL, NULL, 0),
(794, 'شركة طيبة فوج', 121, NULL, NULL, 0),
(795, 'Comet Company', 0, NULL, NULL, 0),
(796, 'الفرعونية  ', 1245788, NULL, NULL, 0),
(797, ' شركه الاتحاد للمقاولات. ', 123456789, NULL, NULL, 0),
(798, 'Interclean', 123456789, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `unplanned_limitations`
--

CREATE TABLE IF NOT EXISTS `unplanned_limitations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `limit` int(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `unplanned_limitations`
--

INSERT INTO `unplanned_limitations` (`id`, `role_id`, `limit`) VALUES
(1, 2, 30000);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_alias` int(11) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(50) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  `fullname` varchar(255) COLLATE utf8_bin NOT NULL,
  `signature` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT '1',
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `ban_reason` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `new_password_key` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `new_password_requested` datetime DEFAULT NULL,
  `new_email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `new_email_key` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `last_ip` varchar(40) COLLATE utf8_bin NOT NULL,
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_alias` (`id_alias`),
  UNIQUE KEY `username` (`username`),
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=144 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `id_alias`, `admin`, `username`, `password`, `email`, `fullname`, `signature`, `role_id`, `department_id`, `activated`, `banned`, `ban_reason`, `new_password_key`, `new_password_requested`, `new_email`, `new_email_key`, `last_ip`, `last_login`, `created`, `modified`, `deleted`) VALUES
(1, 1, 1, 'admin', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Admin Account test', '!', 23, 19, 1, 0, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '2016-02-01 14:14:58', '0000-00-00 00:00:00', '2016-02-01 12:14:58', 0),
(2, 2, 0, 'chairman', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Hossam ELShaer', '76478-mr.-hossam-sig.jpg', 2, 19, 1, 0, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '2016-01-02 10:38:47', '0000-00-00 00:00:00', '2016-01-02 08:38:47', 0),
(3, 3, 0, 'hazim.elshamy', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Hazim EL Shamy', '20550-mr.-hazim-signature.png', 3, 8, 1, 0, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '2016-01-17 15:59:43', '0000-00-00 00:00:00', '2016-01-17 13:59:43', 0),
(4, 4, 0, 'samy.nasser', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Samy A.Naser', '124a0-sami-abdel-nasser.png', 4, 3, 1, 0, NULL, NULL, NULL, NULL, NULL, '172.50.15.1', '2015-11-10 16:59:48', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(5, 5, 0, 'tarek.desouki', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Tarek Desouki', '62be7-tarek-desouki.png', 5, 3, 1, 0, NULL, NULL, NULL, NULL, NULL, '41.32.50.18', '2015-05-16 14:43:29', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(6, 6, 0, 'mohamed.deraz', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Mohamed Deraz', 'b9ebc-mr--deraz--signature.png', 6, 8, 1, 0, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '2015-12-28 13:59:06', '0000-00-00 00:00:00', '2015-12-28 11:59:06', 0),
(9, 9, 0, 'mohamed.fouad', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Mohamed Fouad', '9a279-mfouad.png', 7, 2, 1, 0, NULL, NULL, NULL, NULL, NULL, '41.65.207.75', '2015-08-25 09:34:13', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(22, 22, 0, 'Sameh.nagar', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Sameh.nagar', 'd85e0-sameh-el-nagar.png', 7, 18, 1, 0, NULL, NULL, NULL, NULL, NULL, '41.65.31.123', '2014-08-14 11:57:33', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(21, 21, 0, 'Ahmed.badr', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Ahmed.badr', '90abc-ahmed-badr-gsc.png', 7, 8, 1, 0, NULL, NULL, NULL, NULL, NULL, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(20, 20, 0, 'Amr.latif', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Amr.latif', '08bd0-amr-ibrahim-recreation.png', 7, 13, 1, 0, NULL, 'd802eb73cc2989892ed465be9a86d7ed', '2015-08-23 20:24:10', NULL, NULL, '105.93.149.53', '2014-11-24 12:30:14', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(19, 19, 0, 'essam.hagras', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'essam.hagras', '2db26-essam-sign.png', 7, 6, 1, 0, NULL, NULL, NULL, NULL, NULL, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(18, 18, 0, 'Nader.sheikh', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Nader El Sheikh', '44d54-nader-hk.png', 7, 12, 1, 0, NULL, NULL, NULL, NULL, NULL, '172.50.14.11', '2015-10-29 10:35:38', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(17, 17, 0, 'arahman.shahin', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Abdel Rahman Shahin', '30b7f-abdel-rahman-shahin-fb.png', 7, 7, 1, 0, NULL, NULL, NULL, NULL, NULL, '41.65.31.110', '2015-05-15 18:51:20', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(24, 24, 0, 'Mohamed.hussien', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'mohamed.hussien', 'ca7ff-mohmed-hussien.gif', 7, 4, 1, 0, NULL, NULL, NULL, NULL, NULL, '172.50.10.210', '2015-11-09 12:13:55', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(23, 23, 0, 'Mohamed.yazeed', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Mohamed.yazeed', '705af-mohamed-abo-yazied.png', 7, 15, 1, 0, NULL, NULL, NULL, NULL, NULL, '41.65.31.110', '2015-03-02 09:20:54', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(25, 25, 0, 'gouda.ramadan', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'gouda.ramadan', '5d134-gouda-ramadan-(gm).png', 6, 8, 1, 0, NULL, NULL, NULL, NULL, NULL, '172.50.11.11', '2015-11-08 17:03:02', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(26, 26, 0, 'emad.mousaad', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'emad.mousad', '7fa33-emad-mosaad.png', 0, 0, 1, 0, NULL, NULL, NULL, NULL, NULL, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(27, 27, 0, 'nassar.othman', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'nassar.othman', 'af97a-nasser-othman(hkm).png', 7, 12, 1, 0, NULL, NULL, NULL, NULL, NULL, '172.50.11.50', '2015-11-08 19:17:39', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(28, 28, 0, 'ahmed.aziz', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'ahmed.aziz', '30c42-ahmad-abdel-aziz(fom).png', 7, 18, 1, 0, NULL, NULL, NULL, NULL, NULL, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(29, 29, 0, 'Rafik.Ramadan', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Rafik Ramadan', '19cef-rafik-ramadan.jpg', 7, 7, 1, 0, NULL, NULL, NULL, NULL, NULL, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(30, 30, 0, 'said.atiek', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Saed.atek', '8efaa-said-el-atiek-(gm).png', 17, 8, 1, 0, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '2015-12-28 13:53:11', '0000-00-00 00:00:00', '2015-12-28 11:53:11', 0),
(31, 31, 0, 'AbdAziem.lbrahim', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'AbdAziem.lbrahim', '31d58-abdel-azim-el-sweedy-(hr).png', 7, 15, 1, 0, NULL, NULL, NULL, NULL, NULL, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(32, 32, 0, 'khaled.zweil', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'khaled.zweil', '13f62-khaled-zwiel-(afc).png', 5, 3, 1, 0, NULL, NULL, NULL, NULL, NULL, '172.50.10.252', '2015-10-30 18:05:56', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(33, 33, 0, 'khaled.elsagher', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'khaled.elsagher', '7e98a-khaled-el-saghier-(fbm).png', 7, 7, 1, 0, NULL, NULL, NULL, NULL, NULL, '41.65.39.45', '2015-01-13 09:37:08', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(34, 34, 0, 'ayman.salah', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'ayman.salah', '9701d-ayman-salah-(-exec-chref.png', 7, 6, 1, 0, NULL, NULL, NULL, NULL, NULL, '41.65.31.105', '2015-01-13 10:00:30', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(35, 35, 0, 'hashim.lotfy', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'hashim.lotfy-rm', '3703a-hashem-lotfy-(fo-mnager).png', 7, 18, 1, 0, NULL, NULL, NULL, NULL, NULL, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(36, 36, 0, 'ibrahim.hasan', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Ibrahim Hasan', '4581d-ibrahim-hassan-(hk).png', 7, 12, 1, 0, NULL, NULL, NULL, NULL, NULL, '172.50.10.252', '2015-10-23 12:45:17', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(37, 37, 0, 'Ibrahim.belal', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'ibrahim Belal', 'c0c25-ibrahim-belal-(recreation).png', 7, 13, 1, 0, NULL, NULL, NULL, NULL, NULL, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(82, 82, 0, 'ehab.rostom', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'ehab rostom', 'c513b-ehab-rostom-(it).png', 7, 2, 1, 0, NULL, NULL, NULL, NULL, NULL, '172.50.10.252', '2015-10-13 10:31:41', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(39, 39, 0, 'ahmed.fawzy', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Ahmed Fawzy', '46aa5-ahmed-fawzy(eng).png', 7, 4, 1, 0, NULL, NULL, NULL, NULL, NULL, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(40, 40, 0, 'mohamed.syd', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'mohamed.syd', '0d2f7-mohamed-syd.jpg', 6, 8, 1, 0, NULL, NULL, NULL, NULL, NULL, '10.20.20.4', '2015-11-11 11:28:29', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(41, 41, 0, 'ehab.radwan', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'ehab.radwan', '247ac-ehab-radwan-fb.jpg', 7, 7, 1, 0, NULL, NULL, NULL, NULL, NULL, '41.32.50.19', '2015-01-08 13:50:37', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(42, 42, 0, 'mohamed.abdelkarim', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'mohamed.abdelkarim', '75940-mohamed-abdel-karim-eng.jpg', 7, 4, 1, 0, NULL, NULL, NULL, NULL, NULL, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(43, 43, 0, 'hamza.tawfik', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'hamza.tawfik', '7dc0a-hamza-it.jpg', 7, 2, 1, 0, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '2016-01-21 10:27:44', '0000-00-00 00:00:00', '2016-01-21 08:27:44', 0),
(132, 132, 0, 'ahmed.farag', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Ahmed Farag', '75617-ex.chef.png', 7, 6, 1, 0, NULL, NULL, NULL, NULL, NULL, '192.168.237.85', '2015-10-25 12:42:25', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(49, 49, 0, 'reda.mohamed', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Reda.Mohamed', 'e9570-reda-mohamed-(accounting-manager).png', 5, 3, 1, 0, NULL, NULL, NULL, NULL, NULL, '172.50.10.252', '2015-11-10 15:10:06', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(50, 50, 0, 'hany.ahmed', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Hany Ahmed', '0ba94-hany-ahmed-(fo-).png', 7, 18, 1, 0, NULL, NULL, NULL, NULL, NULL, '192.168.237.33', '2015-11-05 11:34:03', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(131, 131, 0, 'kareem.zaher', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Kareem Zaher', '9290e-untitled-1.png', 7, 4, 1, 0, NULL, NULL, NULL, NULL, NULL, '192.168.235.70', '2015-10-21 13:34:38', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(128, 128, 0, 'samy.salah', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'samy.salah', 'c01d1-mr.-samy.jpg', 7, 13, 1, 0, NULL, NULL, NULL, NULL, NULL, '41.65.149.132', '2015-06-11 13:22:13', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(53, 53, 0, 'Mostafa.Elkheshen', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Mostafa.Elkheshen', '7e4d3-moustafa-elkheshen-(pur).png', 7, 3, 1, 0, NULL, NULL, NULL, NULL, NULL, '197.134.255.229', '2014-08-06 16:56:27', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(54, 54, 0, 'tarek.ahmed', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'tarek.ahmed', '36c2f-tarek-ahme-(resident-manager).png', 6, 8, 1, 0, NULL, NULL, NULL, NULL, NULL, '41.65.71.144', '2014-08-07 08:37:12', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(55, 55, 0, 'Philippe.devizcaya', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Philippe.deVizcaya', '27543-philippe-sign.png', 16, 8, 1, 0, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '2016-01-17 16:00:27', '0000-00-00 00:00:00', '2016-01-17 14:00:27', 0),
(56, 56, 0, '', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', '', NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, NULL, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(130, 130, 0, 'michael.adel', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Michael Adel', 'e31c2-michel.jpg', 7, 2, 1, 0, NULL, NULL, NULL, NULL, NULL, '41.178.12.82', '2015-06-29 14:02:59', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(129, 129, 0, 'Waheed.altohamy', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Waheed. Altohamy', 'aeaaa-waheed.jpg', 6, 8, 1, 0, NULL, NULL, NULL, NULL, NULL, '172.50.10.252', '2015-11-11 10:53:55', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(59, 59, 0, 'mohamed.elserwy', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'mohamed.elserwy', '7c359-mohamed-serwy.png', 4, 9, 1, 0, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '2015-12-28 13:52:32', '0000-00-00 00:00:00', '2015-12-28 11:52:32', 0),
(60, 60, 0, 'waleed.mohamed', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'waleed.mohamed', '2a4dc-waleed-mohamed-(hotel-manager).png', 6, 8, 1, 0, NULL, NULL, NULL, NULL, NULL, '41.65.207.98', '2015-08-31 10:34:55', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(61, 61, 0, 'mohamed.mekky', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'mohamed Mekky', '1b084-mohamed-meky-(-assistant-fb).png', 7, 7, 1, 0, NULL, NULL, NULL, NULL, NULL, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(62, 62, 0, 'emad.salah', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Emad Salah', 'e49ff-emad-salah-(-executive-chef).png', 7, 6, 1, 0, NULL, NULL, NULL, NULL, NULL, '41.65.207.100', '2015-01-10 09:07:47', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(63, 63, 0, 'hossam.salah', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'hossam.salah', '4eae9-hossam-salah(fc).png', 5, 3, 1, 0, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '2015-12-28 13:52:16', '0000-00-00 00:00:00', '2015-12-28 11:52:16', 0),
(64, 64, 0, 'hany.mosaad', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Hany Mosaad', '3dd02-hany-mosaad-(assistant-engineering).png', 7, 4, 1, 0, NULL, NULL, NULL, NULL, NULL, '105.47.30.235', '2015-02-12 11:25:28', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(65, 65, 0, 'Elsayed.rezk', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Elsayed.rezk', '20a84-sayed-rezk.png', 7, 18, 1, 0, NULL, NULL, NULL, NULL, NULL, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(66, 66, 0, 'waleed.moawad', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'waleed.moawad', '40293-waleed-moawad-(-hr).png', 7, 15, 1, 0, NULL, NULL, NULL, NULL, NULL, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(67, 67, 0, 'ahmed.hameed', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Ahmed Hameed', 'd8bc9-ahmed-a.hameed.png', 7, 2, 1, 0, NULL, NULL, NULL, NULL, NULL, '41.65.207.100', '2015-08-24 12:08:17', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(68, 68, 0, 'mohamed.khalifa', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'mohamed.khalifa', 'e9591-mohammed-khalifa.jpg', 6, 8, 1, 0, NULL, NULL, NULL, NULL, NULL, '172.50.10.218', '2015-11-06 10:20:23', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(69, 69, 0, 'Tarek.Fahmy', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Tarek.Fahmy', 'e2e3a-tarek-fahmy.jpg', 7, 18, 1, 0, NULL, NULL, NULL, NULL, NULL, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(70, 70, 0, 'Safwat.Saber', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Safwat.Saber', '4fbb8-safwat-saber.jpg', 7, 15, 1, 0, NULL, NULL, NULL, NULL, NULL, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(71, 71, 0, 'Aly.Nagy', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Aly.Nagy', 'a923f-aly-nagy.jpg', 7, 6, 1, 0, NULL, NULL, NULL, NULL, NULL, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(72, 72, 0, 'Haytham.Mohamed', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Haytham.Mohamed', 'c6445-haytham-mohamed.jpg', 7, 7, 1, 0, NULL, NULL, NULL, NULL, NULL, '41.65.149.132', '2015-01-30 11:29:26', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(73, 73, 0, 'Waleed.Ibrahim', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Waleed.Ibrahim', '09576-waleed-ibrahim.jpg', 7, 4, 1, 0, NULL, NULL, NULL, NULL, NULL, '41.65.149.132', '2015-01-30 11:38:15', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(74, 74, 0, 'Mohamed.Fouad-fes', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Mohamed.Fouad', 'b6a59-mohamed-fouad.jpg', 7, 2, 1, 0, NULL, NULL, NULL, NULL, NULL, '172.50.10.252', '2015-11-07 13:00:20', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(75, 75, 0, 'Mohamed.Karim', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Mohamed.Karim', '26bbc-mohamed-abd-el-karim.jpg', 5, 3, 1, 0, NULL, NULL, NULL, NULL, NULL, '41.65.149.132', '2015-08-20 15:02:50', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(76, 76, 0, 'Mohamed.Aleem', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Mohamed.Aleem', '18302-mohamed-abd-el-aleem.jpg', 7, 12, 1, 0, NULL, NULL, NULL, NULL, NULL, '41.65.149.132', '2015-09-07 08:17:36', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(77, 77, 0, 'yasser.nabil', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Yasser Nabil', '62faa-yasser-nabil.jpg', 6, 8, 1, 0, NULL, NULL, NULL, NULL, NULL, '172.50.10.252', '2015-11-11 19:34:40', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(78, 78, 0, 'mohamed.zayed', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'mohamed.zayed', '4dc3c-mohamed-zayed.jpg', 7, 8, 1, 0, NULL, NULL, NULL, NULL, NULL, '172.50.10.252', '2015-10-09 09:47:16', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(118, 118, 0, 'ahmed.elgohary', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'ahmed.elgohary', 'b6927-ahmed-el-gouhary.jpg', 6, 3, 1, 0, NULL, NULL, NULL, NULL, NULL, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(80, 80, 0, 'Mohamed.kamel', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Mohamed.kamel', '3c3e2-mohamed-kamel.jpg', 7, 7, 1, 0, NULL, NULL, NULL, NULL, NULL, '192.168.210.10', '2015-11-05 12:29:45', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(81, 81, 0, 'Hussien.embaby', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Hussien.embaby', '60809-hussein-imbaby.jpg', 7, 6, 1, 0, NULL, NULL, NULL, NULL, NULL, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(83, 83, 1, 'Marwan.gendy', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Marwan EL Gendy', '50148-marwan.elgendy-assistant_it.png', 19, 28, 1, 0, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '2016-01-19 14:00:06', '0000-00-00 00:00:00', '2016-01-19 12:00:06', 0),
(84, 84, 0, 'emad.milad', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'emad.milad', 'c8da0-emad.milad-general_manager.png', 6, 8, 1, 0, NULL, NULL, NULL, NULL, NULL, '105.36.185.186', '2014-12-29 10:32:38', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(85, 85, 0, 'ayman.selim', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'ayman.selim', '17c15-selim.png', 5, 3, 1, 0, NULL, NULL, NULL, NULL, NULL, '192.168.237.45', '2015-11-10 16:10:20', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(86, 86, 0, 'moustafa.mahmoud', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'moustafa.mahmoud', 'a15a1-moustafa-mahmoud-asst.-fc.jpg', 5, 3, 1, 0, NULL, NULL, NULL, NULL, NULL, '172.50.14.25', '2015-11-09 12:03:18', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(91, 91, 0, 'hussein.imbaby', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Hussein Imbaby', '2abc6-hussein-imbaby.jpg', 7, 6, 1, 0, NULL, NULL, NULL, NULL, NULL, '41.32.14.218', '2015-02-23 17:49:32', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(92, 92, 0, 'Ezz.sayed', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Ezz.sayed', '861f4-ezz-chief-acc.jpg', 5, 3, 1, 0, NULL, NULL, NULL, NULL, NULL, '172.50.11.20', '2015-11-07 10:57:43', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(109, 109, 0, 'Khaled.Latif', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Khaled Abdel Latif', 'e72e0-khaled.png', 7, 4, 1, 0, NULL, NULL, NULL, NULL, NULL, '41.65.31.105', '2015-02-22 10:08:13', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(93, 93, 0, 'wael.wali', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Wael Wali', '6d83f-wael.wali-general_manager.png', 6, 8, 1, 0, NULL, NULL, NULL, NULL, NULL, '192.168.237.21', '2015-11-10 13:34:18', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(94, 94, 0, 'sameh.nashaat', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'sameh.nashaat', '95aab-sameh-nashaat.jpg', 7, 12, 1, 0, NULL, NULL, NULL, NULL, NULL, '172.50.10.252', '2015-10-11 17:38:00', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(95, 95, 0, 'salem.kamal', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'salem.kamal', 'b155a-salem-kamal.jpg', 10, 19, 1, 0, NULL, NULL, NULL, NULL, NULL, '172.50.10.253', '2016-01-19 14:42:20', '0000-00-00 00:00:00', '2016-01-19 12:42:20', 0),
(96, 96, 0, 'Ismail.Ali', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Ismail.Ali', '0feb6-ismail-ali.jpg', 7, 12, 1, 0, NULL, NULL, NULL, NULL, NULL, '41.65.31.105', '2014-11-25 12:26:24', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(97, 97, 0, 'Essam.Khalil', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Essam.Khalil', 'aa7f6-essam-khalil-engineering.png', 7, 4, 1, 0, NULL, NULL, NULL, NULL, NULL, '172.50.10.210', '2015-11-09 12:14:27', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(99, 99, 0, 'mohamed.hamdy', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'mohamed.hamdy', '8c2f2-mohamed.-hamdy.jpg', 11, 19, 1, 0, NULL, NULL, NULL, NULL, NULL, '41.65.109.70', '2015-04-28 12:48:32', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(100, 100, 0, 'sameh.farouk', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'sameh.farouk', '9c8f5-sameh-farouk.jpg', 12, 19, 1, 0, NULL, NULL, NULL, NULL, NULL, '172.50.10.252', '2015-11-05 16:49:29', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(101, 101, 0, 'mohamed-attia', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'mohamed-attia', 'e25e2-mohamed-attia.jpg', 13, 19, 1, 0, NULL, NULL, NULL, NULL, NULL, '172.50.10.252', '2015-11-03 16:49:35', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(102, 102, 0, 'khaled.fahmy', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'khaled.fahmy', '4b4ef-khaled-fahmy.jpg', 14, 19, 1, 0, NULL, NULL, NULL, NULL, NULL, '172.50.10.252', '2015-11-04 16:21:39', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(103, 103, 0, 'rehab.ibrahim', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'rehab.ibrahim', 'c57c7-rehab-fc.jpg', 5, 3, 1, 0, NULL, NULL, NULL, NULL, NULL, '41.32.14.218', '2015-06-11 12:08:47', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(104, 104, 0, 'raafat.aziz', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Raafat Abd El Aziz', 'e8461-raafat.aziz-director_hk.png', 7, 12, 1, 0, NULL, NULL, NULL, NULL, NULL, '41.65.207.75', '2015-01-05 15:13:53', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(107, 107, 0, 'ahmed.elmasry', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Ahmed El Masry', '757b8-ahmed.elmasry-f&b_manager.png', 7, 7, 1, 0, NULL, NULL, NULL, NULL, NULL, '41.65.207.75', '2015-01-03 09:55:52', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(106, 106, 0, 'Waleed.ali', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Waleed.ali', '0c421-waleed.ali.jpg', 7, 7, 1, 0, NULL, NULL, NULL, NULL, NULL, '66.249.93.248', '2015-03-05 08:43:33', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(110, 110, 0, 'mohamed.wahba', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Mohamed Wahba', '715b7-mohamed.-wahba.jpg', 7, 2, 1, 0, NULL, NULL, NULL, NULL, NULL, '192.168.210.10', '2015-11-04 18:41:33', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(108, 108, 0, 'ahmed.mahmoud', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Ahmed Ebrahim', '8c779-ahmed-ibrahim.png', 7, 7, 1, 0, NULL, NULL, NULL, NULL, NULL, '41.32.14.218', '2015-06-11 12:10:00', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(111, 111, 0, 'sherif.naguib', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Sherif Naguib', '417bf-sherif.nageb.png', 6, 8, 1, 0, NULL, NULL, NULL, NULL, NULL, '41.65.71.141', '2015-02-26 11:00:45', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(127, 127, 0, 'Ashraf.Kamel', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Ashraf Kamel', '11aab-untitled.jpg', 7, 12, 1, 0, NULL, NULL, NULL, NULL, NULL, '41.131.204.44', '2015-05-12 15:18:48', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(113, 113, 0, 'mohamed.ibrahim', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Mohamed Ibrahim', 'e11db-mohamed.ibrahim_hr_director.png', 7, 15, 1, 0, NULL, NULL, NULL, NULL, NULL, '41.65.207.75', '2015-02-04 08:06:34', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(114, 114, 0, 'ashraf.nazif', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Ashraf Nazif', '40084-ashraf-nazif.png', 5, 3, 1, 0, NULL, NULL, NULL, NULL, NULL, '41.178.12.82', '2015-01-10 08:47:59', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(115, 115, 0, 'refaat.aboubakr', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Refaat Aboubakr', '601db-refaat.jpg', 6, 8, 1, 0, NULL, NULL, NULL, NULL, NULL, '41.178.12.82', '2015-01-15 11:06:39', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(116, 116, 0, 'saad.rahim ', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'saad.rahim ', '0c850-saad.jpg', 7, 15, 1, 0, NULL, NULL, NULL, NULL, NULL, '41.65.31.105', '2015-02-25 13:28:56', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(117, 117, 0, 'Ashraf.Elharizy', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Ashraf Elharizy', '48e92-111111.jpg', 7, 6, 1, 0, NULL, NULL, NULL, NULL, NULL, '172.50.10.253', '2015-09-28 20:09:41', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(119, 119, 0, 'mohamed.gaber', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Mohamed Gaber', 'eb3f7-mgaber.png', 15, 19, 1, 0, NULL, NULL, NULL, NULL, NULL, '41.65.109.70', '2015-06-24 11:05:54', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(121, 121, 0, 'mostafa.elkheshen', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Mostafa Elkheshen', NULL, 10, 8, 1, 0, NULL, NULL, NULL, NULL, NULL, '192.168.211.19', '2015-10-05 09:12:11', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(122, 122, 0, 'ahmad.fawzy', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'ahmad fawzy', '57c68-untitled.jpg', 7, 4, 1, 0, NULL, NULL, NULL, NULL, NULL, '172.50.10.252', '2015-09-30 16:47:38', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(123, 123, 0, 'usama.saleh', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'usama.saleh', '8f996-usamaa.png', 7, 4, 1, 0, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '2016-01-02 09:42:31', '0000-00-00 00:00:00', '2016-01-02 07:42:31', 0),
(125, 125, 0, 'mohamed.maghawry', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Mohamed El Maghawry', 'a2a3f-mohamed.maghawry.jpg', 7, 4, 1, 0, NULL, NULL, NULL, NULL, NULL, '41.65.207.75', '2015-04-14 14:45:18', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(124, 124, 0, 'hatem.diad', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Hatem Diad', '2cc5b-bb.jpg', 7, 13, 1, 0, NULL, NULL, NULL, NULL, NULL, '41.65.31.101', '2015-04-12 10:18:25', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(126, 126, 0, 'rimon.farid', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Rimon Farid', 'a3df4-rimon.farid-security_manager.png', 7, 14, 1, 0, NULL, NULL, NULL, NULL, NULL, '41.65.207.75', '2015-09-04 12:35:39', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(133, 133, 0, 'barsmanager.moh', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Ismail Ahmed', '7c915-fb.png', 7, 7, 1, 0, NULL, NULL, NULL, NULL, NULL, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(134, 134, 0, 'amr.beshady', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Amr Beshady', '9d859-hk.png', 7, 12, 1, 0, NULL, NULL, NULL, NULL, NULL, '192.168.235.70', '2015-11-10 18:29:53', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(135, 135, 0, 'ahmed.almasry', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Ahmed Almasry', 'dae13-doc023.jpg', 7, 7, 1, 0, NULL, NULL, NULL, NULL, NULL, '192.168.237.82', '2015-11-07 19:42:41', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(136, 136, 0, 'ahmed.shehata', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Ahmed Shehata', '79bbd-doc024.png', 7, 2, 1, 0, NULL, NULL, NULL, NULL, NULL, '192.168.235.70', '2015-11-10 17:39:39', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(137, 137, 0, 'khaled.saad', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Khaled Saad', '24291-khaled_saad-gm.png', 6, 8, 1, 0, NULL, NULL, NULL, NULL, NULL, '172.50.10.252', '2015-11-11 14:13:56', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(138, 138, 0, 'abdalla.farouk', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'abdalla.farouk', '37294-new--signature.jpg', 5, 3, 1, 0, NULL, NULL, NULL, NULL, NULL, '172.50.10.252', '2015-11-08 16:49:29', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(139, 139, 0, 'said.atiek-gm', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Said.Atiek', '9e1ed-said.png', 6, 8, 1, 0, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '2015-12-28 13:52:55', '0000-00-00 00:00:00', '2015-12-28 11:52:55', 0),
(140, 140, 0, 'assem.elsayed', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Assem Elsayed', 'b56c0-sign.png', 7, 4, 1, 0, NULL, NULL, NULL, NULL, NULL, '192.168.237.76', '2015-10-28 12:47:29', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(141, 141, 0, 'Taha.Messed', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Taha Messed', '27b94-taha.jpg', 7, 18, 1, 0, NULL, NULL, NULL, NULL, NULL, '192.168.210.10', '2015-11-04 19:14:08', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0),
(143, 143, 0, 'Hossam.Okasha', '$2a$08$YtKJI4gKs..zV0lSJ4gZwu6y3LjWDUk6mxqx9nb/TsEaYQcwW4PFu', 'marwan.gendy@sunrise-resorts.com', 'Hossam Okasha', 'abc82-hossam.jpg', 7, 13, 1, 0, NULL, NULL, NULL, NULL, NULL, '192.168.210.10', '2015-11-05 12:21:14', '0000-00-00 00:00:00', '2015-12-28 09:50:31', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE IF NOT EXISTS `users_groups` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_autologin`
--

CREATE TABLE IF NOT EXISTS `user_autologin` (
  `key_id` char(32) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_agent` varchar(150) COLLATE utf8_bin NOT NULL,
  `last_ip` varchar(40) COLLATE utf8_bin NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`key_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `user_autologin`
--

INSERT INTO `user_autologin` (`key_id`, `user_id`, `user_agent`, `last_ip`, `last_login`) VALUES
('26f7c233d275456dc94c8171622dabdf', 30, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0', '192.168.211.1', '2015-10-05 13:13:42'),
('42858e1a415afc845c13250aabe920f2', 137, 'Mozilla/5.0 (Windows NT 6.1; rv:41.0) Gecko/20100101 Firefox/41.0', '172.50.10.252', '2015-10-25 08:26:15'),
('562b0f9c0006d28c00114103adf2cf2e', 3, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0', '172.50.13.123', '2015-10-04 11:10:31'),
('71e35c64e4e9c284da5857103446076b', 77, 'Mozilla/5.0 (Windows NT 5.1; rv:41.0) Gecko/20100101 Firefox/41.0', '172.50.10.252', '2015-10-05 16:38:52'),
('761df984caa6db9f4e60cb9e2df304f4', 138, 'Mozilla/5.0 (Windows NT 6.1; rv:40.0) Gecko/20100101 Firefox/40.0', '172.50.10.252', '2015-10-01 14:09:46'),
('81eb9d401bb366315ccfc528496f28f3', 77, 'Mozilla/5.0 (Windows NT 6.1; rv:41.0) Gecko/20100101 Firefox/41.0', '172.50.10.252', '2015-11-01 07:48:01'),
('98789e84d09a79fe3fb35fa4dc6db921', 25, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0', '172.50.11.10', '2015-10-04 18:23:39'),
('9b332480a1a99789ad09449f213b64d3', 92, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', '172.50.11.20', '2015-11-07 08:57:43'),
('b3da427fac6f44b72583f5e3b2ba453a', 137, 'Mozilla/5.0 (Windows NT 6.1; rv:42.0) Gecko/20100101 Firefox/42.0', '172.50.10.252', '2015-11-11 12:13:56'),
('c4e62cbe8cbf32ad8a53f761765626f7', 82, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0', '172.50.10.252', '2015-10-13 08:31:41'),
('cd05aae43b0410a6b56879224a3884b5', 137, 'Mozilla/5.0 (Windows NT 6.1; rv:40.0) Gecko/20100101 Firefox/40.0', '172.50.10.252', '2015-09-30 18:19:15'),
('ce5c5b580c24456b1c48f55f0fdf0ba7', 4, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:40.0) Gecko/20100101 Firefox/40.0', '172.50.15.1', '2015-10-05 11:19:57'),
('fba54173bc9b98dcec4e403721953000', 129, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:40.0) Gecko/20100101 Firefox/40.0', '172.50.10.252', '2015-10-04 07:54:39');

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE IF NOT EXISTS `user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_alias` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`id`, `id_alias`, `name`) VALUES
(1, 0, 'Superuser');

-- --------------------------------------------------------

--
-- Table structure for table `user_profiles`
--

CREATE TABLE IF NOT EXISTS `user_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `country` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user_profiles`
--

INSERT INTO `user_profiles` (`id`, `user_id`, `country`, `website`) VALUES
(1, 2, NULL, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
Usage: mysqldump [OPTIONS] database [tables]
OR     mysqldump [OPTIONS] --databases [OPTIONS] DB1 [DB2 DB3...]
OR     mysqldump [OPTIONS] --all-databases [OPTIONS]
For more options, use mysqldump --help
Usage: mysqldump [OPTIONS] database [tables]
OR     mysqldump [OPTIONS] --databases [OPTIONS] DB1 [DB2 DB3...]
OR     mysqldump [OPTIONS] --all-databases [OPTIONS]
For more options, use mysqldump --help
Usage: mysqldump [OPTIONS] database [tables]
OR     mysqldump [OPTIONS] --databases [OPTIONS] DB1 [DB2 DB3...]
OR     mysqldump [OPTIONS] --all-databases [OPTIONS]
For more options, use mysqldump --help
-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: e-signature
-- ------------------------------------------------------
-- Server version	5.1.73

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `e-signature`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `e-signature` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `e-signature`;

--
-- Table structure for table `Agent_Company`
--

DROP TABLE IF EXISTS `Agent_Company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Agent_Company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Agent_Company`
--

LOCK TABLES `Agent_Company` WRITE;
/*!40000 ALTER TABLE `Agent_Company` DISABLE KEYS */;
INSERT INTO `Agent_Company` VALUES (1,'Agent_Company');
/*!40000 ALTER TABLE `Agent_Company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Competition_Survey`
--

DROP TABLE IF EXISTS `Competition_Survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Competition_Survey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `from` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `to` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `from2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price2` int(11) NOT NULL,
  `to2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `spo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Competition_Survey`
--

LOCK TABLES `Competition_Survey` WRITE;
/*!40000 ALTER TABLE `Competition_Survey` DISABLE KEYS */;
INSERT INTO `Competition_Survey` VALUES (1,'Hotel 1','2016-02-01','2017-01-01','',0,'',22,0),(2,'Hotel 2c','2016-01-02','2016-01-01','',0,'',45,0),(3,'Hotel 3','2016-01-01','2016-02-01','',0,'',333,0),(4,'Hotel 4','2017-01-01','2016-01-01','',0,'',88,0),(5,'Hotel ','2017-01-01','2016-01-01','2016-02-01',0,'2016-02-01',22,1),(6,'Hotel 2','2017-02-01','2016-01-01','2015-10-31',0,'2015-12-31',2,1),(7,'Hotel 3','2015-05-31','2012-09-30','2011-08-30',0,'2013-10-31',355,1),(8,'Hotel 4','2011-03-31','2008-11-29','2013-10-31',0,'2013-10-28',22,1),(9,'Hotel 1','2017-01-01','2016-01-01','2017-01-01',1,'2016-01-02',4,2),(10,'Hotel 2','2017-01-01','2016-01-01','2016-01-02',1,'2016-01-01',12,2),(11,'Hotel 3','2016-01-02','2016-01-02','2017-02-01',33,'2016-01-01',1,2),(12,'Hotel 4','2016-01-02','2016-02-03','2016-01-03',1,'2017-01-01',2,2),(13,'Hotel 1','2017-01-01','2016-01-01','2017-01-01',1,'2016-01-02',4,3),(14,'Hotel 2','2017-01-01','2016-01-01','2016-01-02',1,'2016-01-01',12,3),(15,'Hotel 3','2016-01-02','2016-01-02','2017-02-01',33,'2016-01-01',1,3),(16,'','2016-01-02','2016-02-03','2016-01-03',1,'2017-01-01',2,3),(17,'Hotel 1','2017-01-01','2016-01-01','2017-01-01',1,'2016-01-02',4,4),(18,'Hotel 2','2017-01-01','2016-01-01','2016-01-02',1,'2016-01-01',12,4),(19,'Hotel 3','2016-01-02','2016-01-02','2017-02-01',33,'2016-01-01',1,4),(20,'سشيشسيسش','2016-01-02','2016-02-03','2016-01-03',3333,'2017-01-01',1111,4),(21,'asdasd','2016-01-02','2016-01-01','2017-03-02',2,'2016-01-01',1,5),(22,'sads11','2017-01-01','2016-01-01','2016-01-02',1,'2016-01-01',1,5),(23,'sdadsaddcxxx','2018-03-02','2016-01-03','2016-01-01',1,'2016-01-01',2,5),(24,'assaa11','2016-03-01','2018-04-02','2017-03-02',4,'2018-03-01',2,5),(25,'asdasd','2016-01-02','2016-01-01','2017-03-02',2,'2016-01-01',1,6),(26,'sads11','2017-01-01','2016-01-01','2016-01-02',1,'2016-01-01',1,6),(27,'sdadsaddcxxx','2018-03-02','2016-01-03','2016-01-01',1,'2016-01-01',2,6),(28,'','2016-03-01','2018-04-02','2017-03-02',4,'2018-03-01',2,6),(29,'asdasd','2016-01-02','2016-01-01','2017-03-02',2,'2016-01-01',1,7),(30,'sads11','2017-01-01','2016-01-01','2016-01-02',1,'2016-01-01',1,7),(31,'sdadsaddcxxx','2018-03-02','2016-01-03','2016-01-01',1,'2016-01-01',2,7),(32,'MNBHJGHGV','2016-03-01','2018-04-02','2017-03-02',4,'2018-03-01',2,7),(33,'asdasd','2016-01-02','2016-01-01','2017-03-02',2,'2016-01-01',1,8),(34,'sads11','2017-01-01','2016-01-01','2016-01-02',1,'2016-01-01',1,8),(35,'sdadsaddcxxx','2018-03-02','2016-01-03','2016-01-01',1,'2016-01-01',2,8),(36,'','2016-03-01','2018-04-02','2017-03-02',4,'2018-03-01',2,8),(37,'asdasd','2016-01-02','2016-01-01','2017-03-02',2,'2016-01-01',1,9),(38,'sads11','2017-01-01','2016-01-01','2016-01-02',1,'2016-01-01',1,9),(39,'sdadsaddcxxx','2018-03-02','2016-01-03','2016-01-01',1,'2016-01-01',2,9),(40,'','2016-03-01','2018-04-02','2017-03-02',4,'2018-03-01',2,9);
/*!40000 ALTER TABLE `Competition_Survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board_type`
--

DROP TABLE IF EXISTS `board_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `board_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_type`
--

LOCK TABLES `board_type` WRITE;
/*!40000 ALTER TABLE `board_type` DISABLE KEYS */;
INSERT INTO `board_type` VALUES (1,'SAI'),(2,'BB'),(3,'HB'),(4,'FB'),(5,'AI');
/*!40000 ALTER TABLE `board_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `ip_address` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `user_agent` varchar(150) COLLATE utf8_bin NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ci_sessions`
--

LOCK TABLES `ci_sessions` WRITE;
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
INSERT INTO `ci_sessions` VALUES ('037486508d272a1407d46e6755e1f5ae','10.20.20.11','Mozilla/5.0 (X11; Linux x86_64; rv:10.0) Gecko/20150101 Firefox/20.0 (Chrome)',1458459995,'a:3:{s:9:\"user_data\";s:0:\"\";s:18:\"flash:old:redirect\";s:20:\"/project_progress/1/\";s:18:\"flash:new:redirect\";s:20:\"/project_progress/1/\";}'),('09c0d272c638847d51a930470466efe0','10.20.20.11','Mozilla/5.0 (X11; Linux x86_64; rv:10.0) Gecko/20150101 Firefox/20.0 (Chrome)',1458466468,'a:3:{s:9:\"user_data\";s:0:\"\";s:18:\"flash:old:redirect\";b:0;s:18:\"flash:new:redirect\";b:0;}'),('0bd2d147fdc5bf7f72409a0dc6ecb505','10.20.20.11','Mozilla/5.0 (X11; Linux x86_64; rv:10.0) Gecko/20150101 Firefox/20.0 (Chrome)',1458459979,'a:3:{s:9:\"user_data\";s:0:\"\";s:18:\"flash:old:redirect\";s:11:\"/projects//\";s:18:\"flash:new:redirect\";s:11:\"/projects//\";}'),('1c1289010dd23f3ef2e93c2a74d43765','10.20.20.11','Mozilla/5.0 (X11; Linux x86_64; rv:10.0) Gecko/20150101 Firefox/20.0 (Chrome)',1458466481,'a:3:{s:9:\"user_data\";s:0:\"\";s:18:\"flash:old:redirect\";s:8:\"/plans//\";s:18:\"flash:new:redirect\";s:8:\"/plans//\";}'),('1f1f7c84200cedc3f03b0a1722ba487c','172.50.10.76','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/534.34 (KHTML, like Gecko) wkhtmltopdf Safari/534.34',1458459426,''),('25a2f7efbc79a7887f615f67a6a99815','10.20.20.11','Mozilla/5.0 (X11; Linux x86_64; rv:10.0) Gecko/20150101 Firefox/20.0 (Chrome)',1458459317,'a:3:{s:9:\"user_data\";s:0:\"\";s:18:\"flash:old:redirect\";b:0;s:18:\"flash:new:redirect\";b:0;}'),('330b01cd9ed22ec0cd4d02040d1421ef','10.20.20.11','Mozilla/5.0 (X11; Linux x86_64; rv:10.0) Gecko/20150101 Firefox/20.0 (Chrome)',1458461857,'a:3:{s:9:\"user_data\";s:0:\"\";s:18:\"flash:old:redirect\";s:8:\"/plans//\";s:18:\"flash:new:redirect\";s:8:\"/plans//\";}'),('34eeda4863f5bb733233531b6949d433','172.50.10.252','Mozilla/5.0 (Windows NT 6.1; rv:44.0) Gecko/20100101 Firefox/44.0',1458476927,'a:7:{s:9:\"user_data\";s:0:\"\";s:7:\"user_id\";s:2:\"95\";s:8:\"username\";s:11:\"salem.kamal\";s:6:\"status\";s:1:\"1\";s:8:\"is_admin\";s:1:\"0\";s:9:\"user_type\";s:2:\"19\";s:4:\"role\";s:2:\"10\";}'),('3acdb1fc5e048daa8a50b2bbb89f32c0','10.20.20.11','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:44.0) Gecko/20100101 Firefox/44.0',1458459976,'a:7:{s:9:\"user_data\";s:0:\"\";s:7:\"user_id\";s:3:\"146\";s:8:\"username\";s:13:\"tarek.elbadry\";s:6:\"status\";s:1:\"1\";s:8:\"is_admin\";s:1:\"0\";s:9:\"user_type\";s:1:\"8\";s:4:\"role\";s:1:\"6\";}'),('3cbb5fec4d9e5387d0c4d51598d4dd2c','172.50.10.76','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/534.34 (KHTML, like Gecko) wkhtmltopdf Safari/534.34',1458459520,''),('3f3177edce3d57e948c0ae07b521c7ca','10.20.20.11','Mozilla/5.0 (X11; Linux x86_64; rv:10.0) Gecko/20150101 Firefox/20.0 (Chrome)',1458459363,'a:3:{s:9:\"user_data\";s:0:\"\";s:18:\"flash:old:redirect\";s:11:\"/projects//\";s:18:\"flash:new:redirect\";s:11:\"/projects//\";}'),('4112db4101a266fc2143d6e0611f17ec','172.50.10.252','Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.1; Trident/5.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR ',1458469360,'a:7:{s:9:\"user_data\";s:0:\"\";s:7:\"user_id\";s:3:\"115\";s:8:\"username\";s:15:\"refaat.aboubakr\";s:6:\"status\";s:1:\"1\";s:8:\"is_admin\";s:1:\"0\";s:9:\"user_type\";s:1:\"8\";s:4:\"role\";s:1:\"6\";}'),('4d0c53f7ba2bcba0297bee56a9fb83ee','10.20.20.11','Mozilla/5.0 (X11; Linux x86_64; rv:10.0) Gecko/20150101 Firefox/20.0 (Chrome)',1458466499,'a:3:{s:9:\"user_data\";s:0:\"\";s:18:\"flash:old:redirect\";s:3:\"///\";s:18:\"flash:new:redirect\";s:3:\"///\";}'),('592c78eb4b71f5eb4f67a2d64b87984a','172.50.10.76','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/534.34 (KHTML, like Gecko) wkhtmltopdf Safari/534.34',1458459520,''),('5d01a896ac28895a63910ad3390a333d','172.50.10.252','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36',1458486425,'a:7:{s:9:\"user_data\";s:0:\"\";s:7:\"user_id\";s:2:\"83\";s:8:\"username\";s:12:\"Marwan.gendy\";s:6:\"status\";s:1:\"1\";s:8:\"is_admin\";s:1:\"1\";s:9:\"user_type\";s:1:\"0\";s:4:\"role\";s:1:\"0\";}'),('5d69517d1dfef079be24d5f8001a11cb','10.20.20.11','Mozilla/5.0 (X11; Linux x86_64; rv:10.0) Gecko/20150101 Firefox/20.0 (Chrome)',1458460070,'a:3:{s:9:\"user_data\";s:0:\"\";s:18:\"flash:old:redirect\";s:8:\"/plans//\";s:18:\"flash:new:redirect\";s:8:\"/plans//\";}'),('656776d5bb957a65300aa4beea568424','172.50.10.76','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/534.34 (KHTML, like Gecko) wkhtmltopdf Safari/534.34',1458459520,''),('65a0167ef916e8d93ab7ba6fa41f9aa5','172.50.10.76','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/534.34 (KHTML, like Gecko) wkhtmltopdf Safari/534.34',1458459519,''),('6736842aafa256b01aa1baf47741f75c','172.50.10.76','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/534.34 (KHTML, like Gecko) wkhtmltopdf Safari/534.34',1458459520,''),('6b11dced16beb42c56a49cce105e0599','172.50.14.11','Mozilla/5.0 (Windows NT 6.1; rv:43.0) Gecko/20100101 Firefox/43.0',1458473540,'a:3:{s:9:\"user_data\";s:0:\"\";s:18:\"flash:old:redirect\";b:0;s:18:\"flash:new:redirect\";b:0;}'),('6d13652b04a28c05237cb7dea42481fd','10.20.20.11','Mozilla/5.0 (X11; Linux x86_64; rv:10.0) Gecko/20150101 Firefox/20.0 (Chrome)',1458459502,'a:3:{s:9:\"user_data\";s:0:\"\";s:18:\"flash:old:redirect\";s:14:\"/plans/view/27\";s:18:\"flash:new:redirect\";s:14:\"/plans/view/27\";}'),('6f3f0a97f666a649fb55d937138ac32b','172.50.10.76','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/534.34 (KHTML, like Gecko) wkhtmltopdf Safari/534.34',1458459519,''),('7423189ca232349fe5309c5e333aca74','10.20.20.11','Mozilla/5.0 (X11; Linux x86_64; rv:10.0) Gecko/20150101 Firefox/20.0 (Chrome)',1458459392,'a:3:{s:9:\"user_data\";s:0:\"\";s:18:\"flash:old:redirect\";s:8:\"/forms//\";s:18:\"flash:new:redirect\";s:8:\"/forms//\";}'),('77d25bae4085894c73b10cdd779c8b62','10.20.20.11','Mozilla/5.0 (X11; Linux x86_64; rv:10.0) Gecko/20150101 Firefox/20.0 (Chrome)',1458459330,'a:3:{s:9:\"user_data\";s:0:\"\";s:18:\"flash:old:redirect\";s:8:\"/plans//\";s:18:\"flash:new:redirect\";s:8:\"/plans//\";}'),('8293bbad9b53d5df23197c4db1ba9def','10.20.20.11','Mozilla/5.0 (X11; Linux x86_64; rv:10.0) Gecko/20150101 Firefox/20.0 (Chrome)',1458459409,'a:3:{s:9:\"user_data\";s:0:\"\";s:18:\"flash:old:redirect\";s:17:\"/plans/summary/27\";s:18:\"flash:new:redirect\";s:17:\"/plans/summary/27\";}'),('8452d5e8982a7f2db17f3439706733d3','10.20.20.11','Mozilla/5.0 (X11; Linux x86_64; rv:10.0) Gecko/20150101 Firefox/20.0 (Chrome)',1458482358,'a:3:{s:9:\"user_data\";s:0:\"\";s:18:\"flash:old:redirect\";s:8:\"/plans//\";s:18:\"flash:new:redirect\";s:8:\"/plans//\";}'),('8771377c904adb5f8fd83cacb96c1ad7','172.50.10.76','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/534.34 (KHTML, like Gecko) wkhtmltopdf Safari/534.34',1458459520,''),('96d1d7ed0549030e2ffde5d847a22b5d','172.50.10.252','Mozilla/5.0 (Windows NT 6.1; rv:44.0) Gecko/20100101 Firefox/44.0',1458477000,'a:7:{s:9:\"user_data\";s:0:\"\";s:7:\"user_id\";s:3:\"150\";s:8:\"username\";s:6:\"viewer\";s:6:\"status\";s:1:\"1\";s:8:\"is_admin\";s:1:\"0\";s:9:\"user_type\";s:2:\"19\";s:4:\"role\";s:1:\"0\";}'),('9a2560271de8f5df623defb711387365','172.50.10.76','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/534.34 (KHTML, like Gecko) wkhtmltopdf Safari/534.34',1458459427,''),('9d9de9e39f384696dfd20806b53e1b76','10.20.20.11','Mozilla/5.0 (X11; Linux x86_64; rv:10.0) Gecko/20150101 Firefox/20.0 (Chrome)',1458466473,'a:3:{s:9:\"user_data\";s:0:\"\";s:18:\"flash:old:redirect\";s:11:\"/projects//\";s:18:\"flash:new:redirect\";s:11:\"/projects//\";}'),('a1def4bb95073bd5ea4404cd91122f95','10.20.20.11','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',1458466485,'a:7:{s:9:\"user_data\";s:0:\"\";s:7:\"user_id\";s:2:\"43\";s:8:\"username\";s:12:\"hamza.tawfik\";s:6:\"status\";s:1:\"1\";s:8:\"is_admin\";s:1:\"0\";s:9:\"user_type\";s:1:\"2\";s:4:\"role\";s:1:\"7\";}'),('ab572d07b9ba0bcc1e6923656b602503','172.50.10.76','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/534.34 (KHTML, like Gecko) wkhtmltopdf Safari/534.34',1458459520,''),('abf2d3fccd187acd6f930da9471d3f50','172.50.10.76','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/534.34 (KHTML, like Gecko) wkhtmltopdf Safari/534.34',1458459427,''),('b8f25aaa1f9ffaa1e79278ae2a41b9f1','172.50.10.76','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/534.34 (KHTML, like Gecko) wkhtmltopdf Safari/534.34',1458459520,''),('bff0577b124bf6ec0750f8c3a01c0b3d','172.50.10.76','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/534.34 (KHTML, like Gecko) wkhtmltopdf Safari/534.34',1458459520,''),('cb033acd243a14782a3ac5a80bdad5ef','172.50.10.76','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/534.34 (KHTML, like Gecko) wkhtmltopdf Safari/534.34',1458459427,''),('dd52ee21fe3829f6295ee6b1110c0034','10.20.20.11','Mozilla/5.0 (X11; Linux x86_64; rv:10.0) Gecko/20150101 Firefox/20.0 (Chrome)',1458459326,'a:3:{s:9:\"user_data\";s:0:\"\";s:18:\"flash:old:redirect\";s:3:\"///\";s:18:\"flash:new:redirect\";s:3:\"///\";}'),('df4d85a7d516d4425af3dfc747f5b004','172.50.10.76','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/534.34 (KHTML, like Gecko) wkhtmltopdf Safari/534.34',1458459426,''),('e51e008a42811dd642a5a15b6d753d6f','172.50.10.252','Mozilla/5.0 (Windows NT 6.1; rv:44.0) Gecko/20100101 Firefox/44.0',1458472657,'a:2:{s:9:\"user_data\";s:0:\"\";s:18:\"flash:new:redirect\";b:0;}'),('f18434ee8000098fb8499ea0de9bc5f8','172.50.10.76','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/534.34 (KHTML, like Gecko) wkhtmltopdf Safari/534.34',1458459520,''),('f2164650a88439b5147ecfa955a81348','10.20.20.11','Mozilla/5.0 (X11; Linux x86_64; rv:10.0) Gecko/20150101 Firefox/20.0 (Chrome)',1458466512,'a:3:{s:9:\"user_data\";s:0:\"\";s:18:\"flash:old:redirect\";s:20:\"/projects/view/75E87\";s:18:\"flash:new:redirect\";s:20:\"/projects/view/75E87\";}'),('f8279e960ebea7bccafcce5c93d30f71','10.20.20.11','Mozilla/5.0 (X11; Linux x86_64; rv:10.0) Gecko/20150101 Firefox/20.0 (Chrome)',1458459991,'a:3:{s:9:\"user_data\";s:0:\"\";s:18:\"flash:old:redirect\";s:19:\"/project_progress//\";s:18:\"flash:new:redirect\";s:19:\"/project_progress//\";}'),('fb2f5fb09b7a3e4ca8ef6e3ac22480fe','172.50.15.11','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0',1458460951,'a:2:{s:9:\"user_data\";s:0:\"\";s:18:\"flash:new:redirect\";b:0;}'),('fceaddb5d9ab8ebaacc5949b80358b80','172.50.10.252','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36',1458464546,'a:7:{s:9:\"user_data\";s:0:\"\";s:7:\"user_id\";s:3:\"129\";s:8:\"username\";s:15:\"Waheed.altohamy\";s:6:\"status\";s:1:\"1\";s:8:\"is_admin\";s:1:\"0\";s:9:\"user_type\";s:1:\"8\";s:4:\"role\";s:1:\"6\";}'),('ffce7717729c2fe876eeea14e4a40c84','10.20.20.11','Mozilla/5.0 (X11; Linux x86_64; rv:10.0) Gecko/20150101 Firefox/20.0 (Chrome)',1458460049,'a:3:{s:9:\"user_data\";s:0:\"\";s:18:\"flash:old:redirect\";s:20:\"/projects/view/FD5E9\";s:18:\"flash:new:redirect\";s:20:\"/projects/view/FD5E9\";}');
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,20,95,'OK','2014-12-18 11:36:52'),(2,32,102,'ok','2014-12-28 09:16:01'),(3,58,119,'??? ?????? ??? ???? ???????  ???? ?????','2015-02-09 14:52:23'),(4,58,119,'??? ?????? ??? ???? ??????? ???? ??? ?????','2015-02-09 15:01:12'),(5,63,119,'These assets on a loan and not a transfer of ownership','2015-02-09 15:13:09'),(6,58,119,'These assets on a loan and not a transfer of ownership','2015-02-09 15:15:04'),(7,72,99,'??????? ???? ????? ???????? ? ????? ????? ?????? ?????? ?????? ????????','2015-03-16 08:44:00'),(8,79,119,'??? ?????? ??? ???? ??????? ????? ??? ?????','2015-03-16 09:47:35'),(9,79,119,'These assets on a loan and not a transfer of ownership','2015-03-16 09:50:01'),(10,79,119,'These assets on a loan and not a transfer of ownership','2015-03-16 09:50:02'),(11,79,119,'These assets on a loan and not a transfer of ownership','2015-03-16 09:50:04'),(12,82,119,'cod no :40411000014','2015-05-04 08:07:28'),(13,91,119,'These assets on a loan and not a transfer of ownership - are given in case of request','2015-06-24 11:17:35'),(14,131,119,'??? ??? ???? ??????? ????? ??? ????? ???? ??? ?????','2015-12-30 10:21:13'),(15,131,119,'this assets on a loan and not a transfer of ownership-  reten request','2015-12-30 10:47:02'),(16,149,2,'eng garawani approved it ,','2016-03-16 12:29:30');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `deleted` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'كريستال للاستثمار السياحي',0),(2,'Oasis Group',0),(4,'رويال مكادي للاستثمار',0),(5,'بلوسكاي للاستثمارلت',0),(6,'صن رايز لاداره الفنادق العائمه',0),(7,'غناظه للفنادق والقري السياحيه',0),(8,'دايموند شارم السياحيه',0),(9,'شارمينج',0),(10,'شركه الربيع للاستثمارات الفندقيه',0),(11,'SUNRISE for floating hotels management',0),(12,'Villa Mr Hossam Cairo',0),(13,'EL Forsan Housing',0),(14,'Madaar Company',0),(15,'النخيل للاستثمارات الفندقيه',0);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_signatures`
--

DROP TABLE IF EXISTS `company_signatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_signatures` (
  `company_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `rank` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_signatures`
--

LOCK TABLES `company_signatures` WRITE;
/*!40000 ALTER TABLE `company_signatures` DISABLE KEYS */;
INSERT INTO `company_signatures` VALUES (1,14,8),(1,23,7),(1,11,6),(1,13,5),(1,15,4),(1,12,3),(1,10,2),(1,22,1),(2,14,8),(2,23,7),(2,11,6),(2,13,5),(2,15,4),(2,12,3),(2,10,2),(2,22,1),(3,14,8),(3,23,7),(3,11,6),(3,13,5),(3,15,4),(3,12,3),(3,10,2),(3,22,1),(4,14,8),(4,23,7),(4,11,6),(4,13,5),(4,15,4),(4,12,3),(4,10,2),(4,22,1),(4,28,9),(3,28,9),(2,28,9),(1,28,9),(5,27,4),(5,26,3),(5,25,2),(5,24,1),(6,14,8),(6,23,7),(6,11,6),(6,13,5),(6,15,4),(6,12,3),(6,10,2),(6,22,1),(7,14,8),(7,23,7),(7,11,6),(7,13,5),(7,15,4),(7,12,3),(7,10,2),(7,22,1),(8,14,8),(8,23,7),(8,11,6),(8,13,5),(8,15,4),(8,12,3),(8,10,2),(8,22,1),(9,14,8),(9,23,7),(9,11,6),(9,13,5),(9,15,4),(9,12,3),(9,10,2),(9,22,1),(10,14,8),(10,23,7),(10,11,6),(10,13,5),(10,15,4),(10,12,3),(10,10,2),(10,22,1),(11,14,8),(11,23,7),(11,11,6),(11,13,5),(11,15,4),(11,12,3),(11,10,2),(11,22,1),(12,14,8),(12,23,7),(12,11,6),(12,13,5),(12,15,4),(12,12,3),(12,10,2),(12,22,1),(13,14,8),(13,23,7),(13,11,6),(13,13,5),(13,15,4),(13,12,3),(13,10,2),(13,22,1),(6,28,9),(7,28,9),(8,28,9),(9,28,9),(10,28,9),(11,28,9),(12,28,9),(13,28,9);
/*!40000 ALTER TABLE `company_signatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `devision_id` int(11) DEFAULT NULL,
  `code` varchar(5) NOT NULL DEFAULT 'DEP',
  `dummy` tinyint(1) NOT NULL DEFAULT '0',
  `rank` int(5) NOT NULL DEFAULT '99',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (2,'IT',4,'IT',0,3),(3,'Accounting',4,'ACC',0,2),(4,'Engineering ',5,'ENG',0,1),(5,'Laundry',1,'LND',0,99),(6,'Kitchen',2,'KIT',0,2),(7,'Food & Beverage',2,'FB',0,1),(8,'A&G',4,'AG',0,1),(9,'Cluster Account',NULL,'DEP',1,99),(10,'Reservation Centre',6,'DEP',0,3),(11,'Regional Office',NULL,'DEP',1,0),(12,'House Keeping ',1,'HK',0,2),(13,'Recreation ',1,'REC',0,3),(14,'Security',4,'SEC',0,4),(15,'Human Resource',3,'HR',0,1),(16,'Gardens',5,'GRD',0,2),(18,'Front Office',1,'FO',0,1),(19,'Owning Company',NULL,'DEP',1,99),(22,'Housing',3,'HO',0,99),(23,'Staff Cafateria',3,'STA',0,2),(24,'Steward',2,'STE',0,3),(25,'Sales ',6,'SAL',0,1),(26,'Marketing',6,'MAK',0,2),(27,'Major Projects',7,'Maj',0,0),(28,'Purchasing',NULL,'PUR',1,99);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devisions`
--

DROP TABLE IF EXISTS `devisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rank` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devisions`
--

LOCK TABLES `devisions` WRITE;
/*!40000 ALTER TABLE `devisions` DISABLE KEYS */;
INSERT INTO `devisions` VALUES (1,'Rooms',1),(2,'Food & Beverage',2),(3,'Human Resources',4),(4,'A & G ',3),(5,'Engneering',6),(6,'Sales & Marketing',5),(7,'Major Projects',7);
/*!40000 ALTER TABLE `devisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discount` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
INSERT INTO `discount` VALUES (1,'5 %'),(2,'10%'),(3,'15%'),(4,'20%'),(5,'25 %');
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_hotels`
--

DROP TABLE IF EXISTS `employees_hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees_hotels` (
  `employee_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_hotels`
--

LOCK TABLES `employees_hotels` WRITE;
/*!40000 ALTER TABLE `employees_hotels` DISABLE KEYS */;
INSERT INTO `employees_hotels` VALUES (6,1),(9,1),(9,2),(4,2),(3,13),(3,11),(3,12),(3,10),(3,2),(3,9),(3,1),(3,7),(3,3),(3,8),(3,5),(3,6),(3,4),(4,13),(4,11),(4,12),(4,10),(4,1),(4,3),(4,5),(2,13),(2,11),(2,12),(2,10),(2,2),(2,9),(2,1),(2,7),(2,3),(2,8),(2,5),(2,6),(2,4),(17,1),(18,2),(18,1),(19,1),(20,1),(21,1),(22,1),(23,2),(23,1),(23,3),(6,2),(9,3),(24,2),(26,13),(26,11),(26,12),(26,10),(26,2),(26,1),(26,3),(26,5),(27,3),(28,3),(29,3),(31,4),(32,4),(33,4),(34,4),(35,4),(36,4),(37,4),(39,4),(40,5),(41,5),(42,5),(43,5),(44,4),(45,4),(46,4),(47,4),(49,7),(53,7),(59,7),(59,8),(59,6),(53,8),(53,6),(60,6),(61,6),(63,6),(65,6),(66,6),(67,6),(68,11),(68,12),(69,11),(69,12),(70,13),(70,11),(70,12),(70,10),(71,11),(71,12),(72,11),(72,12),(73,13),(73,11),(73,12),(73,10),(74,13),(74,11),(74,12),(74,10),(75,11),(75,12),(76,11),(76,12),(77,10),(78,10),(81,10),(82,4),(85,8),(5,5),(86,2),(86,1),(90,10),(91,10),(92,3),(94,10),(95,13),(95,11),(95,12),(95,10),(95,2),(95,9),(95,16),(95,1),(95,7),(95,3),(95,8),(95,6),(95,4),(96,3),(97,1),(1,13),(1,11),(1,12),(1,10),(1,2),(1,9),(1,16),(1,1),(1,7),(1,3),(1,8),(1,5),(1,6),(1,4),(1,14),(1,15),(99,13),(99,11),(99,12),(99,10),(99,2),(99,9),(99,16),(99,1),(99,7),(99,3),(99,8),(99,6),(99,4),(100,13),(100,11),(100,12),(100,10),(100,2),(100,9),(100,16),(100,1),(100,7),(100,3),(100,8),(100,6),(100,4),(101,13),(101,11),(101,12),(101,10),(101,2),(101,9),(101,16),(101,1),(101,7),(101,3),(101,8),(101,6),(101,4),(102,13),(102,11),(102,12),(102,10),(102,2),(102,9),(102,16),(102,1),(102,7),(102,3),(102,8),(102,5),(102,6),(102,4),(103,10),(104,8),(104,16),(84,16),(49,16),(59,16),(106,6),(102,17),(108,2),(109,3),(110,7),(111,7),(113,8),(114,17),(115,17),(25,19),(86,19),(116,19),(117,7),(9,9),(118,9),(4,4),(119,13),(119,19),(119,11),(119,12),(119,10),(119,2),(119,9),(119,16),(119,17),(119,1),(119,7),(119,3),(119,8),(119,6),(119,4),(119,18),(121,7),(122,7),(30,16),(30,7),(123,3),(124,3),(126,8),(127,7),(128,11),(128,12),(129,4),(130,17),(132,8),(133,8),(134,8),(131,8),(135,8),(136,8),(50,8),(137,6),(138,10),(30,8),(30,6),(139,7),(139,8),(139,6),(139,16),(55,13),(55,19),(55,11),(55,12),(55,10),(55,2),(55,9),(55,17),(55,1),(55,7),(55,3),(55,8),(55,5),(55,6),(55,4),(55,16),(55,14),(55,15),(55,18),(83,14),(1,18),(1,19),(1,20),(1,21),(1,22),(1,17),(1,23),(1,24),(1,25),(1,26),(1,27),(140,8),(83,18),(83,13),(83,19),(83,11),(83,12),(83,10),(83,2),(83,20),(83,21),(83,22),(83,9),(83,7),(83,3),(83,6),(83,17),(83,1),(83,5),(83,8),(83,23),(83,24),(83,25),(83,26),(83,4),(83,27),(83,16),(83,15),(141,7),(143,7),(80,7),(144,8),(145,6),(145,8),(146,13),(146,10),(147,13),(148,6),(64,8),(149,4),(26,4),(121,6),(121,8),(151,7),(151,23),(151,3),(151,13),(151,6),(151,17),(151,19),(151,1),(151,5),(151,11),(151,20),(151,21),(151,8),(151,2),(151,22),(151,9),(151,4),(151,12),(151,26),(151,24),(151,25),(151,10),(151,16),(151,14),(151,15),(151,27),(151,18),(152,1),(152,2),(153,3),(154,11),(154,12),(155,5),(156,4),(157,10),(157,13),(158,7),(159,8),(160,6),(162,28),(163,28),(161,28),(150,7),(150,23),(150,3),(150,13),(150,6),(150,17),(150,19),(150,1),(150,11),(150,28),(150,20),(150,21),(150,8),(150,2),(150,22),(150,9),(150,4),(150,12),(150,26),(150,24),(150,25),(150,10),(150,16),(150,14),(150,15),(150,27),(150,18),(115,22),(115,26),(115,24),(115,25),(115,14),(115,15),(115,27),(55,23),(55,28),(55,20),(55,21),(55,30),(55,22),(55,26),(55,24),(55,25),(55,27),(59,22),(59,26),(59,24),(59,25),(59,14),(59,15),(59,27),(59,18),(3,23),(3,17),(3,19),(3,28),(3,20),(3,21),(3,30),(3,22),(3,26),(3,24),(3,25),(3,16),(3,14),(3,15),(3,27),(3,18),(2,23),(2,17),(2,19),(2,28),(2,20),(2,21),(2,30),(2,22),(2,26),(2,24),(2,25),(2,16),(2,14),(2,15),(2,27),(2,18),(1,28),(1,30),(95,23),(95,17),(95,19),(95,28),(95,20),(95,21),(95,30),(95,22),(95,26),(95,24),(95,25),(95,14),(95,15),(95,27),(95,18),(99,23),(99,17),(99,19),(99,28),(99,20),(99,21),(99,30),(99,22),(99,26),(99,24),(99,25),(99,14),(99,15),(99,27),(99,18),(100,23),(100,17),(100,19),(100,28),(100,20),(100,21),(100,30),(100,22),(100,26),(100,24),(100,25),(100,14),(100,15),(100,27),(100,18),(101,23),(101,17),(101,19),(101,28),(101,20),(101,21),(101,30),(101,22),(101,26),(101,24),(101,25),(101,14),(101,15),(101,27),(101,18),(102,23),(102,19),(102,28),(102,20),(102,21),(102,30),(102,22),(102,26),(102,24),(102,25),(102,14),(102,15),(102,27),(102,18),(119,23),(119,28),(119,20),(119,21),(119,30),(119,22),(119,26),(119,24),(119,25),(119,14),(119,15),(119,27),(150,30),(151,28),(151,30),(164,22),(164,26),(164,24),(164,25),(164,14),(164,15),(164,27),(164,18),(165,5),(166,5),(167,5),(168,5),(169,7),(169,23),(169,3),(169,13),(169,6),(169,17),(169,19),(169,1),(169,11),(169,28),(169,20),(169,21),(169,8),(169,2),(169,30),(169,22),(169,9),(169,4),(169,12),(169,26),(169,24),(169,25),(169,10),(169,16),(169,14),(169,15),(169,27),(169,18),(93,3),(25,1),(25,2),(115,23),(115,31),(115,20),(115,21),(170,3),(171,7),(171,23),(171,31),(171,3),(171,13),(171,6),(171,17),(171,19),(171,1),(171,5),(171,11),(171,28),(171,20),(171,21),(171,8),(171,2),(171,30),(171,22),(171,9),(171,4),(171,12),(171,26),(171,24),(171,25),(171,10),(171,16),(171,14),(171,15),(171,27),(171,18),(172,22),(172,26),(172,24),(172,25),(172,14),(172,15),(172,27),(172,18),(173,7),(173,23),(173,31),(173,3),(173,13),(173,6),(173,17),(173,19),(173,1),(173,11),(173,28),(173,20),(173,21),(173,8),(173,2),(173,30),(173,22),(173,9),(173,4),(173,12),(173,26),(173,24),(173,25),(173,10),(173,16),(173,14),(173,15),(173,27),(173,18),(174,7),(174,23),(174,31),(174,3),(174,13),(174,6),(174,17),(174,19),(174,1),(174,5),(174,11),(174,28),(174,20),(174,21),(174,8),(174,2),(174,30),(174,22),(174,9),(174,4),(174,12),(174,26),(174,24),(174,25),(174,10),(174,16),(174,14),(174,15),(174,27),(174,18),(146,5);
/*!40000 ALTER TABLE `employees_hotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_states`
--

DROP TABLE IF EXISTS `form_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_states`
--

LOCK TABLES `form_states` WRITE;
/*!40000 ALTER TABLE `form_states` DISABLE KEYS */;
INSERT INTO `form_states` VALUES (1,'Submitted'),(2,'Awaiting approval'),(3,'Request hotel approved'),(4,'Source hotel approved'),(5,'approved'),(6,'Recieved'),(7,'Confirmed');
/*!40000 ALTER TABLE `form_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_res`
--

DROP TABLE IF EXISTS `forma_res`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forma_res` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `recived_by` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `discount` int(11) NOT NULL,
  `rate` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `board_type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `arrival` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `departure` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `adult` int(11) NOT NULL,
  `child` int(11) NOT NULL,
  `rooms` int(11) NOT NULL,
  `room_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company` int(11) NOT NULL,
  `res_type` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `remarks` longtext COLLATE utf8_unicode_ci NOT NULL,
  `date` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_res`
--

LOCK TABLES `forma_res` WRITE;
/*!40000 ALTER TABLE `forma_res` DISABLE KEYS */;
INSERT INTO `forma_res` VALUES (18,'7','Recived By	','Name',12,'12',1,1,'2016-03-18','2016-03-26',2,12,12,'Room Type	',1,11,1,'RemarksRemarksRemarksRemarks','2016-03-01'),(14,'16','Mr. Hossam','Abbas',5,'500',2,1,'2016-02-24','2016-02-27',2,1,1,'standard room',1,2,2,'test','2016-02-24'),(15,'10','test','test',12,'23',4,1,'2016-03-04','2016-02-20',2,2,2,'Room Type	',1,14,1,'Remarks Remarks Remarks Remarks Remarks','2016-02-24'),(16,'7','Mr. Hossam','Abbas ( Test )',25,'600',1,1,'2016-02-24','2016-02-25',2,1,1,'standard room',1,15,2,'test ','2016-02-24'),(17,'1','Mr. Mouday','abbas EL Shabasy',0,'0.00',1,1,'2016-02-25','2016-02-26',2,3,1,'standard room',1,2,1,'test ','2016-02-25');
/*!40000 ALTER TABLE `forma_res` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms`
--

DROP TABLE IF EXISTS `forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `from_hotel_id` int(11) NOT NULL,
  `to_hotel_id` int(11) NOT NULL,
  `issue_date` date NOT NULL,
  `delivery_date` date DEFAULT NULL,
  `department_id` int(11) NOT NULL,
  `location` text COLLATE utf8_unicode_ci NOT NULL,
  `movement_reason` text COLLATE utf8_unicode_ci NOT NULL,
  `destination` text COLLATE utf8_unicode_ci NOT NULL,
  `rcv_user_date` datetime DEFAULT NULL,
  `rcv_user_id` int(11) DEFAULT NULL,
  `rcv_hotel_acc_id` int(11) DEFAULT NULL,
  `rcv_dpt_head_id` int(11) DEFAULT NULL,
  `rcv_chrmn_cai_id` int(11) DEFAULT NULL,
  `src_dpt_head_id` int(11) DEFAULT NULL,
  `src_hotel_gm_id` int(11) DEFAULT NULL,
  `src_hotel_fc_id` int(11) DEFAULT NULL,
  `src_hotel_ag_id` int(11) DEFAULT NULL,
  `dstn_dpt_head_id` int(11) DEFAULT NULL,
  `dstn_hotel_gm_id` int(11) DEFAULT NULL,
  `dstn_hotel_fc_id` int(11) DEFAULT NULL,
  `dstn_hotel_ag_id` int(11) DEFAULT NULL,
  `fin_cluster_fc_id` int(11) DEFAULT NULL,
  `fin_rdof_id` int(11) DEFAULT NULL,
  `fin_chrmn_cai_id` int(11) DEFAULT NULL,
  `pur_sec_mgr_id` int(11) DEFAULT NULL,
  `tech_mgr_id` int(11) DEFAULT NULL,
  `pur_dpt_mgr_id` int(11) DEFAULT NULL,
  `acc_mgr_id` int(11) DEFAULT NULL,
  `inv_dpt_mgr_id` int(11) DEFAULT NULL,
  `con_acc_mgr_id` int(11) DEFAULT NULL,
  `cpo_id` int(11) DEFAULT NULL,
  `state_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms`
--

LOCK TABLES `forms` WRITE;
/*!40000 ALTER TABLE `forms` DISABLE KEYS */;
INSERT INTO `forms` VALUES (14,9,8,3,'2014-11-11','2014-12-01',2,'IT','For Zero Client Project','Data Center Room',NULL,NULL,NULL,NULL,NULL,83,93,85,NULL,9,25,92,NULL,4,3,2,95,99,100,101,102,0,NULL,5),(20,91,3,10,'2014-11-14','2014-11-20',6,'Sunrise Grand Select Crystal BY','It is needed as in shedwan proffer cabinet is out of order and can not be repaired.','FESTIVAL SHEDWAN ( KITCHEN )',NULL,NULL,NULL,NULL,NULL,NULL,25,92,NULL,91,77,103,NULL,4,3,2,95,99,100,101,102,0,NULL,3),(22,94,3,10,'2014-11-22','2014-11-29',12,'Sunrise Grand Select Crystal Bay Resort','For Renewal','Lobby Shedwan','2014-12-30 09:31:38',94,NULL,NULL,NULL,96,25,92,NULL,94,77,103,NULL,4,3,2,95,99,100,101,102,0,NULL,7),(23,20,3,16,'2014-11-24','2014-11-24',13,'Sun Rise El Rabae','to cover the shortage in the sun Beds by Sun Rise crystal bay','Sun Rise Grand Select Crystal Bay',NULL,NULL,NULL,NULL,NULL,NULL,25,NULL,NULL,NULL,30,49,NULL,59,3,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,2),(24,6,7,1,'2014-12-06','2014-12-06',4,'<p>\n	Arabian Beach Rooms</p>\n','<p>\n	New TVs Needed</p>\n','<p>\n	Garden Beach Rooms</p>\n',NULL,NULL,NULL,NULL,NULL,NULL,30,49,NULL,97,6,86,NULL,59,3,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,3),(26,24,3,2,'2014-12-06','2014-12-10',4,'CB','TVs Needed','MP',NULL,NULL,NULL,NULL,NULL,123,25,92,NULL,24,6,86,NULL,4,3,2,95,NULL,100,101,102,0,NULL,5),(27,24,3,2,'2014-12-06','2014-12-10',4,'CB','Needed TV for rooms','MP',NULL,NULL,NULL,NULL,NULL,123,25,92,NULL,24,6,86,NULL,4,3,2,95,NULL,100,101,102,0,NULL,5),(28,24,7,2,'2014-12-06','2014-12-10',4,'Arabian Beach Rooms','TV s Needed for rooms','MP',NULL,NULL,NULL,NULL,NULL,NULL,30,49,NULL,24,6,86,NULL,59,3,NULL,95,NULL,100,NULL,102,0,NULL,3),(29,24,7,2,'2014-12-06','2014-12-10',4,'Arabian Beach Rooms','TV needed for our rooms','MP',NULL,NULL,NULL,NULL,NULL,NULL,30,49,NULL,24,6,86,NULL,59,3,NULL,95,NULL,100,NULL,102,0,NULL,3),(31,94,1,10,'2014-12-14','2014-12-21',12,'SUNRISE Select Garden Beach Resort & Spa','Transfer to Festival Shedwan','Festival Shedwan Golden Beach Resort','2014-12-30 09:30:53',94,NULL,NULL,NULL,18,6,86,NULL,94,77,103,NULL,4,3,2,95,99,100,101,102,0,NULL,7),(32,104,1,16,'2014-12-16','2014-12-25',12,'Garden Beach Hurgada','El Rabei hotel requirements','El Rabei hotel, sharm el sheikh',NULL,NULL,NULL,NULL,NULL,18,6,86,NULL,104,84,49,NULL,4,3,2,95,99,100,101,102,0,NULL,5),(35,83,9,8,'2014-12-25','2015-01-01',2,'Hurgada','No color printer in Montemare, no printer in HR department','Montemare Resort, Sharm el Sheikh',NULL,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,83,93,85,NULL,59,3,2,95,99,100,101,102,0,NULL,3),(38,91,16,10,'2014-12-26','2014-12-31',6,'SUNRISE EL RABAE ( KITCHEN )','The new equipments requested for the newly renovated kitchen of Festival Shedwan.','FESTIVAL SHEDWAN ( KITCHEN )',NULL,NULL,NULL,NULL,NULL,NULL,84,49,NULL,91,77,103,NULL,4,3,NULL,95,99,100,101,102,0,NULL,3),(39,84,3,16,'2014-12-29','2015-01-07',4,'Crystal Bay hotel','needed','Rabie Hotel, Sharm el Sheikh',NULL,NULL,NULL,NULL,NULL,109,25,92,NULL,NULL,84,49,NULL,59,3,2,95,NULL,100,101,NULL,0,NULL,2),(40,84,8,16,'2014-12-29','2015-01-07',16,'Montemare Resort','needed','Rabie Hotel, Sharm el Sheikh',NULL,NULL,NULL,NULL,NULL,NULL,93,85,NULL,NULL,84,49,NULL,59,3,2,95,99,100,101,102,0,NULL,2),(41,94,10,11,'2014-12-29','2014-12-29',12,'beach of shedwan','For Renewal','beach of le jardin',NULL,NULL,NULL,NULL,NULL,94,77,103,NULL,NULL,68,75,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1),(42,106,17,6,'2015-01-02','2015-01-17',7,'Sunrise Floating Hotel','to be install in Diamond Resort','Lobby Bar and Pool or Beach Bars',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,106,60,63,NULL,59,3,2,95,99,100,101,102,0,NULL,3),(43,107,17,8,'2015-01-02','2015-01-09',7,'floating','needed','Montwmare, Sharm el Sheikh',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,107,93,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,2),(44,94,17,10,'2015-01-03','2015-01-13',7,'Sunrise for floating hotels management','For opertion','Lobby SmartLine',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,80,77,103,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,3),(45,80,17,10,'2015-01-03','2015-01-13',7,'Sunrise for floating hotels management','For opertion','Festival Shedwan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,80,77,103,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,3),(46,17,3,1,'2015-01-04','2015-01-07',7,'Sunrise Crystal bay','To cover all F&B outlets for juice cooling','Sunrise Garden Beach',NULL,NULL,NULL,NULL,NULL,NULL,25,NULL,NULL,17,6,86,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,3),(47,17,3,2,'2015-01-04','2015-01-07',7,'Sunrise Crystal bay','To cover all F&B outlets for juice cooling','SENTIDO Mamlouk Palace Resort',NULL,NULL,NULL,NULL,NULL,NULL,25,92,NULL,108,6,86,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,3),(49,34,17,4,'2015-01-04','2015-01-08',6,'<p>\n	Sharm EL Shiekh</p>\n','<p>\n	needed for Royal Makadi as the exist 2 PCS are discard since 2 months ago</p>\n','<p>\n	Royal Makadi</p>\n',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,30,32,NULL,59,3,NULL,95,99,100,NULL,NULL,0,NULL,3),(50,93,10,8,'2015-01-05','2015-01-10',15,'<p>\n	Festival Shedwan</p>\n','<p>\n	Old guest mattresses to be used for Montemare staff housing</p>\n','<p>\n	Grand Select Montemare - Staff Housing</p>\n',NULL,NULL,NULL,NULL,NULL,94,77,103,NULL,113,93,85,NULL,59,3,2,95,99,100,101,102,0,NULL,7),(51,41,3,5,'2015-01-08','2015-01-10',7,'House Keeping CrystalBay','To use it in swimming pool & lobby bar','F&B Holidays',NULL,NULL,NULL,NULL,NULL,NULL,25,NULL,NULL,41,40,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,3),(52,41,3,5,'2015-01-08','2015-01-10',7,'House Keeping CrystalBay','To use it in swimming pool & lobby bar','F&B Holidays',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1),(54,112,3,7,'2015-01-10','2015-01-12',7,'Sunrise grand select crystal bay','Operational needs as per MR. Philippe.','Sunrise grand select Arabian beach',NULL,NULL,NULL,NULL,NULL,NULL,25,NULL,NULL,112,111,49,NULL,59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,3),(58,117,16,7,'2015-01-12','2015-01-14',6,'Sunrise Elrabea','Urgently needed for the operation in Sunrise Arabian Beach as been requested in Project Number 136','Sunrise Arabian Beach',NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,NULL,117,111,49,NULL,59,3,NULL,95,NULL,100,101,102,0,NULL,3),(60,72,3,11,'2015-01-12','2015-01-13',7,'Sunrise grand select crystal bay','to using in F&B outlets','Festival Le Jardin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,72,68,75,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,3),(61,72,3,12,'2015-01-12','2015-01-13',7,'Sunrise grand select crystal bay','to using in F&B outlets','Festival Riviera',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,72,68,75,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,3),(62,32,17,4,'2015-01-13','2015-01-17',7,'Sunrise Crystal Bay','Need to Royal Makadi','Sunrise Royal Makadi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,30,32,NULL,59,3,2,95,99,100,101,102,0,NULL,3),(63,117,16,7,'2015-01-13','2015-01-17',6,'Sunrise Elrabea','As per approved project number 136, needed at the butchery department in the Sunrise Arabia Beach','Sunrise Arabian beach',NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,NULL,117,111,49,NULL,59,3,NULL,95,NULL,100,101,102,0,NULL,3),(64,23,10,19,'2015-01-16','2015-01-16',15,'<p>\n	shedwan</p>\n','<p>\n	مراتب للاستخدام لسكن الفرسان</p>\n','<p>\n	elforsan Housing</p>\n',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1),(65,23,10,19,'2015-01-17','2015-01-17',15,'shedwan','مرتبة واحد متر للاستخدام للموظفين','Elforsan Housing.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1),(66,18,7,1,'2015-01-17','2015-01-31',12,'SUNRISE Grand Select Arabian Beach','For Cleaning','SUNRISE Garden Beach',NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,NULL,18,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,2),(67,109,7,3,'2015-01-18','2015-01-31',4,'Arabian','Not used there and we need it here','Crystal Bay',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0),(68,109,7,3,'2015-01-18','2015-01-31',4,'Arabian','Not used there and we need it here','Crystal Bay',NULL,NULL,NULL,NULL,NULL,NULL,111,49,NULL,109,25,92,NULL,59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,3),(69,18,7,1,'2015-01-24','2015-01-24',12,'Sunrise Grand Select Arabian Beach Resort','As per Charmian','Sunrise Garden Beach Resort',NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,NULL,18,6,NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,2),(70,91,4,10,'2015-01-29','2015-01-29',6,'SUNRISE Select Royal Makadi','To be used in Shedwan kitchen and the tilting pan in the staff cafeteria','Festival Shedwan Golden Beach Resort, and the staff caferteria',NULL,NULL,NULL,NULL,NULL,NULL,30,32,NULL,91,77,103,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,3),(71,73,4,11,'2015-01-30','2015-02-01',6,'فندق رويال مكادي','للاستخدام بفنادق فيستيفال الاحياء','فنادق صن ريز فيستيفال الاحياء',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,68,75,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1),(72,64,7,6,'2015-02-08','2015-02-14',4,'Sunrise Arabian Beach','For Sunconnect System','install in Sunrise Diamond Beach Rooms',NULL,NULL,NULL,NULL,NULL,122,111,49,NULL,64,60,63,NULL,59,3,NULL,95,99,100,101,102,0,NULL,3),(73,64,7,6,'2015-02-08','2015-02-14',4,'Sunrise Arabian Beach','for SUNCONNECT system','install in Sunrise Diamond Beach Rooms',NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,NULL,64,60,63,NULL,59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,3),(74,64,8,6,'2015-02-08','2015-02-14',4,'Sunrise Grand Select Montemare','to be install in rooms of sunrise Diamond Beach','Sunrise Diamond Beach',NULL,NULL,NULL,NULL,NULL,NULL,93,NULL,NULL,64,60,63,NULL,59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),(75,64,8,6,'2015-02-08','2015-02-14',4,'Sunrise Grand Select Montemare','to be install in Diamond Rooms','Sunrise Diamond Beach',NULL,NULL,NULL,NULL,NULL,131,93,85,NULL,64,60,63,NULL,59,3,NULL,95,NULL,100,NULL,102,NULL,NULL,3),(76,50,8,7,'2015-02-16','2015-02-16',18,'Arabian Beach','Operation wise','Arabian Beach',NULL,NULL,NULL,NULL,NULL,NULL,93,85,NULL,50,111,49,NULL,59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),(77,23,19,3,'2015-02-23','2015-02-23',15,'Elforsan Housing','Heater','Staff Housing Crystal Bay',NULL,NULL,NULL,NULL,NULL,116,25,86,NULL,23,25,92,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4),(78,122,4,7,'2015-03-01','2015-03-15',4,'sun rise royal makadi','to be use in Arabian hotel luandry','sun rise arabian beach',NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,NULL,122,NULL,49,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),(79,106,16,6,'2015-03-03','2015-03-10',7,'Sunrise EL Rabea','to Install in Sunrise Diamond','Sunrise Diamond',NULL,NULL,NULL,NULL,NULL,NULL,30,49,NULL,106,60,63,NULL,59,3,NULL,95,99,100,101,102,119,NULL,3),(80,93,7,8,'2015-04-06','2015-04-08',4,'Arabian Beach - Not in use','To replace the curtain motors the have been stolen from Montemare\'s Main restaurant','Montemare\'s Main Restaurant',NULL,NULL,NULL,NULL,NULL,NULL,30,49,NULL,125,93,85,NULL,59,3,NULL,95,NULL,100,101,102,NULL,NULL,3),(81,25,16,3,'2015-04-07','2015-04-07',13,'Sunrise El Rabae Sharm ElShiekh','Needed for operation','Sunrise Crystal Bay Hurghada',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,124,25,92,NULL,59,3,2,95,NULL,100,101,102,119,NULL,3),(82,60,16,6,'2015-04-20','2015-04-24',8,'Sunrise Orchid','to be install in sunrise diamond','Sunrise Diamond',NULL,NULL,NULL,NULL,NULL,NULL,30,49,NULL,NULL,60,63,NULL,59,3,2,95,99,100,101,102,119,NULL,1),(83,126,6,8,'2015-05-04','2015-05-09',14,'sunrise select diamond beach','To be on duty on the main gate','Sunrise grand select montemare',NULL,NULL,NULL,NULL,NULL,NULL,60,63,NULL,126,93,85,NULL,59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),(84,127,8,7,'2015-05-07','2015-05-07',12,'Arabian Beach Hotel','Operation','Arabian Beach Hotel',NULL,NULL,NULL,NULL,NULL,134,93,85,NULL,127,30,49,NULL,59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4),(85,27,7,3,'2015-05-11','2015-05-11',12,'Sunrise Grand Select Arabian Sharm El_Sheikh - Stores','To be used for reupholstering Crystal Bay furniture','Sunrise Grand Select Crystal Bay Hurghada',NULL,NULL,NULL,NULL,NULL,NULL,30,49,NULL,27,25,92,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),(86,9,5,3,'2015-05-11','2015-05-23',2,'Sunrise Holdays','For (Mail- MC -Sun) for Holidays Operation','Sunrise Grand Select Crystal Bay (DataCenter)',NULL,NULL,NULL,NULL,NULL,43,40,5,NULL,9,25,92,NULL,4,3,2,95,NULL,100,101,102,NULL,NULL,5),(87,128,1,11,'2015-06-03','2015-06-04',13,'sunrise Mall','to cover all our beach','Beach Le Jardin',NULL,NULL,NULL,NULL,NULL,NULL,6,86,NULL,128,68,75,NULL,4,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),(90,74,4,10,'2015-06-11','2015-06-20',2,'Sunrise Select Royal Makadi','Need For Color Beach The Main Entrance','color beach',NULL,NULL,NULL,NULL,NULL,82,129,32,NULL,74,77,103,NULL,4,3,2,95,NULL,100,101,102,NULL,NULL,5),(91,60,16,6,'2015-06-15','2015-06-20',8,'Sunrise Orchid','to be in sunrise diamond','sunrise diamond',NULL,NULL,NULL,NULL,NULL,NULL,30,NULL,NULL,NULL,60,63,NULL,59,3,2,95,NULL,100,101,NULL,119,NULL,1),(92,74,11,10,'2014-10-03','2014-10-03',2,'IT Le Jardin','to use in color beach','IT Shedwan',NULL,NULL,NULL,NULL,NULL,74,68,NULL,NULL,74,68,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),(93,74,11,10,'2014-04-27','2014-04-27',2,'IT Le Jardin','to use in color beach','IT Shedwan',NULL,NULL,NULL,NULL,NULL,74,68,NULL,NULL,74,68,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),(94,74,11,10,'2014-04-14','2014-04-14',2,'IT Le Jardin','to use in color beach','IT Shedwan',NULL,NULL,NULL,NULL,NULL,74,68,NULL,NULL,74,68,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),(95,130,3,17,'2015-06-27','2015-07-04',2,'Crystal Bay','Needed new printer','Sunrise Luxor Head Office',NULL,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,130,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),(96,131,8,6,'2015-07-01','2015-07-04',16,'Sunrise Montemare','to be install in Sunrise Diamond','Sunrise Diamond',NULL,NULL,NULL,NULL,NULL,NULL,93,85,NULL,NULL,60,63,NULL,59,3,2,95,NULL,100,101,NULL,NULL,NULL,1),(97,93,16,8,'2015-07-03','2015-07-05',12,'El Rabea','To complete the missing terrace tables in building 4 - opening','Montemare rooms - building 4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,134,93,85,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),(98,134,16,8,'2015-07-14','2015-07-18',12,'relax pool','we have short on it','Montemary hotel',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,134,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),(99,126,7,8,'2015-04-01','2015-07-14',14,'Sunrise grand select arabian beach','To be on duty on receiving gate','Sunrise grand select montemare',NULL,NULL,NULL,NULL,NULL,NULL,30,49,NULL,126,93,85,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),(100,132,7,8,'2015-03-06','2015-03-06',6,'Butcher section','heavy duty','Butcher- Montemare kitchen',NULL,NULL,NULL,NULL,NULL,NULL,30,49,NULL,132,93,85,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),(101,132,7,8,'2014-08-09','2014-08-09',6,'kitchen','for baking toast','Bakery - kitchen montemare',NULL,NULL,NULL,NULL,NULL,NULL,30,49,NULL,132,93,85,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),(102,134,7,8,'2015-07-15','2015-07-16',12,'Sun rise Arabian','For suits','Sun rise montemare',NULL,NULL,NULL,NULL,NULL,NULL,30,49,NULL,NULL,93,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(103,134,7,8,'2015-07-15','2015-07-16',12,'Sun rise Arabian','for suits','Sun rise montemare',NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,NULL,134,93,85,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),(104,49,8,7,'2015-08-10','2015-08-12',15,'Montemare','Rent new housing','Arabian Beach',NULL,NULL,NULL,NULL,NULL,NULL,93,85,NULL,NULL,30,49,NULL,59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(105,60,8,6,'2015-08-16','2015-08-20',8,'Sunrise Montemare','to to in sunrise diamond','sunrise diamond',NULL,NULL,NULL,NULL,NULL,NULL,93,85,NULL,NULL,60,63,NULL,59,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(106,74,1,11,'2015-08-17','2015-08-17',12,'Garden Beach','Operations Need','Festival Resorts',NULL,NULL,NULL,NULL,NULL,18,6,86,NULL,76,68,75,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4),(107,136,6,8,'2015-08-24','2015-08-28',2,'<p>\n	SUNRISE Diamond Beach</p>\n','<p>\n	For Central workshop</p>\n','<p>\n	SUNRISE Montemare</p>\n',NULL,NULL,NULL,NULL,NULL,67,60,63,NULL,136,93,85,NULL,59,3,2,95,NULL,100,101,102,NULL,NULL,5),(108,77,3,10,'2015-08-31','2015-08-31',12,'SUNRISE Grand Select Crystal Bay Resort','For New Rooms','Festival Shedwan Golden Beach Resort',NULL,NULL,NULL,NULL,NULL,27,25,92,NULL,94,77,138,NULL,4,3,2,95,NULL,100,101,102,NULL,NULL,5),(109,136,4,8,'2015-09-01','2015-09-08',2,'SUNRISE Royal Makadi','For used in outlets Montemare','SUNRISE Montemare',NULL,NULL,NULL,NULL,NULL,82,129,32,NULL,136,93,85,NULL,59,3,2,95,NULL,100,101,102,NULL,NULL,5),(110,122,16,6,'2015-09-01','2015-09-05',4,'Sunrise EL Rabea Rooms','to installing in Diamond staff housing','new Diamond housing staff ( ElWaha)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,137,63,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(111,30,8,16,'2015-09-03','2015-09-10',4,'montemare hotel','for el rabae hotel','el rabae hotel',NULL,NULL,NULL,NULL,NULL,NULL,93,85,NULL,NULL,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(112,134,1,8,'2015-09-08','2015-09-16',12,'Garden Beach','For house us  rooms','Montemary hotel',NULL,NULL,NULL,NULL,NULL,18,6,86,NULL,134,93,85,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4),(113,134,7,8,'2015-09-12','2015-09-13',12,'Sun rise Arabian','To fabricate the suite 10107 & 10207 curtain','Sun rise montemare',NULL,NULL,NULL,NULL,NULL,NULL,30,49,NULL,134,93,85,NULL,59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),(114,134,7,8,'2015-09-21','2015-09-30',12,'Sun rise Arabian','To keep toilet napkin on it','Sun rise montemare',NULL,NULL,NULL,NULL,NULL,NULL,30,49,NULL,134,93,85,NULL,59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),(116,117,8,7,'2015-09-25','2015-09-30',6,'Sunrise Grand Select Montemare','Some Utensils can be used in Sunrise Arabian beach.','Sunrise Arabian Beach',NULL,NULL,NULL,NULL,NULL,132,93,NULL,NULL,117,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),(117,137,8,6,'2015-09-28','2015-10-01',8,'Sunrise Montemare','to be install in Sunrise Diamond','sunrise diamond',NULL,NULL,NULL,NULL,NULL,93,93,85,NULL,137,137,63,NULL,59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(118,30,8,6,'2015-09-29','2015-10-10',20,'sunrise grand select montemare resort','for sunrise diamond beach resort','sunrise diamond beach resort',NULL,NULL,NULL,NULL,NULL,NULL,93,85,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(119,30,8,16,'2015-09-29','2015-10-10',20,'sunrise grand select montemare resort','for orchid hotel','orchid hotel',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,49,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(120,77,4,10,'2015-09-29','2015-09-29',12,'SUNRISE Select Royal Makadi','to put in  smartline','Festival Shedwan Golden Beach Resort',NULL,NULL,NULL,NULL,NULL,36,129,32,NULL,94,77,138,NULL,4,3,2,95,NULL,100,101,102,NULL,NULL,5),(121,134,7,8,'2015-09-30','2015-10-10',12,'SUNRISE Grand Select Arabian Beach','to Keep Toilet napkin on it','SUNRISE Grand Select Montemare Resorts',NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,NULL,134,93,85,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),(122,122,8,6,'2015-09-30','2015-09-30',15,'SSH Workshope','to install in Diamond Staff housing ( ElWaha new)','to be  install in Diamond Staff housing ( ElWaha new)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(123,122,8,6,'2015-09-30','2015-09-30',4,'Sunrise SSH Workshop','to install in Diamond Staff housing ( ElWaha new)','to install in Diamond Staff housing ( ElWaha new)',NULL,NULL,NULL,NULL,NULL,NULL,93,85,NULL,NULL,137,63,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(124,93,16,8,'2015-10-01','2015-10-03',4,'Sharm Orchid Stores','Tiling of the training room at MM','Training room of MM',NULL,NULL,NULL,NULL,NULL,NULL,139,49,NULL,NULL,93,85,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(125,36,7,4,'2015-10-04','2015-10-04',12,'sunrise Grand select arabian beach','To but in the rooms','sunrise select royal makadi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,129,32,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),(126,94,7,10,'2015-10-06','2015-10-21',12,'sunrise grand select arabian beach','44 T.V for Shedwan new rooms','festival shedwan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,94,77,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),(127,94,3,10,'2015-10-06','2015-10-21',12,'sunrise grand select crystal bay','for smart line rooms','festival shedwan',NULL,NULL,NULL,NULL,NULL,27,NULL,NULL,NULL,94,77,138,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),(128,49,8,7,'2015-10-07','2015-10-07',3,'Montemare','Covering Chairs minus in the amphitheater , covering sunbed minus at relax pool','Arabian Beach',NULL,NULL,NULL,NULL,NULL,NULL,93,85,NULL,NULL,139,49,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(129,134,4,8,'2015-10-21','2015-10-31',12,'SUNRISE Royal Makadi','to montemare Rooms','SUNRISE Montemare',NULL,NULL,NULL,NULL,NULL,36,129,32,NULL,134,93,85,NULL,59,3,NULL,95,NULL,100,NULL,NULL,NULL,NULL,4),(131,6,16,2,'2015-11-02','2015-11-14',6,'SUNRISE SHARM Orchid','Need It Urgently at Sentido Mamlouk Palace Kitchen - project Number was 2012.','SENTIDO Mamlouk Palace',NULL,NULL,NULL,NULL,NULL,NULL,139,49,NULL,NULL,6,86,NULL,4,3,2,95,NULL,100,101,102,119,NULL,1),(132,49,8,7,'2015-11-04','2015-11-04',18,'Montemare','high occupancy','Arabian Beach',NULL,NULL,NULL,NULL,NULL,50,93,85,NULL,141,139,49,NULL,59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4),(133,49,8,7,'2015-11-04','2015-11-04',7,'Montemare','needed for conferences','Arabian Beach',NULL,NULL,NULL,NULL,NULL,135,93,85,NULL,80,139,49,NULL,59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),(134,49,8,7,'2015-11-04','2015-11-04',2,'Montemare','Big screen for chirchil bar + myfair','Arabian Beach',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(135,49,8,7,'2015-11-04','2015-11-04',2,'Montemare','Big screen for chirchil bar + myfair','Arabian Beach',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,110,NULL,49,NULL,59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(136,49,8,7,'2015-11-04','2015-11-04',13,'Montemare','high occupancy','Arabian Beach',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,143,139,49,NULL,59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),(137,6,1,2,'2015-11-09','2015-11-14',4,'Sunrise  SELECT Garden Beach','For installation At Sentido Mamlouk Palace','SENTIDO Mamlouk Palace',NULL,NULL,NULL,NULL,NULL,97,6,86,NULL,24,6,86,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4),(138,6,1,2,'2015-11-09','2015-11-14',4,'Sunrise  SELECT Garden Beach','To install it At Sentido Mamlouk Palace','SENTIDO Mamlouk Palace',NULL,NULL,NULL,NULL,NULL,97,6,86,NULL,24,6,86,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4),(139,49,8,7,'2015-11-10','2015-11-10',13,'Montemare','High Occupancy','Arabian Beach',NULL,NULL,NULL,NULL,NULL,144,93,85,NULL,NULL,NULL,49,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(140,145,7,8,'2015-11-12','2015-11-19',15,'SUNRISE Grand Select Arabian Beach','For used in Housing','SUNRISE Grand Select Montemare Resort',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,145,93,85,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),(141,146,10,11,'2015-11-13','2015-11-20',2,'it','test','it',NULL,NULL,NULL,NULL,NULL,NULL,146,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(142,49,3,30,'2015-11-18','2015-11-18',4,'<p>\n	Crystal bay</p>\n','<p>\n	replacing in crystal bay then transfer the old to orchid hotel</p>\n','<p>\n	Orchid hotel</p>\n',NULL,NULL,NULL,NULL,NULL,123,25,92,NULL,NULL,139,49,NULL,4,3,NULL,95,NULL,100,101,102,NULL,NULL,1),(143,25,13,3,'2015-11-27','2015-11-27',13,'Color Beach Club','to replace the damaged ones','SUNRISE Grand Select Crystal Bay Resort',NULL,NULL,NULL,NULL,NULL,NULL,147,NULL,NULL,124,25,92,NULL,4,3,2,95,NULL,100,101,NULL,NULL,NULL,3),(144,64,6,8,'2015-12-08','2015-12-16',4,'diamond beach','To be use it in work shoep','SSH work shoep',NULL,NULL,NULL,NULL,NULL,64,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(145,64,6,8,'2015-12-09','2015-12-16',4,'Diamond Beach','to use in SSH Work Shop','Work Shop',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,64,NULL,85,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),(146,40,4,5,'2015-12-12','2015-12-15',4,'Royal Makadi TV and Satellite room','To upgrade the TV station as per our project and replacement , cost should be 280000 LE but for saving cost the transferred one from Makadi is used and can be added to Holidays TV station for more channel variety and high resolution.\nThis is after the specialized checked the two hotel TV room and the station and confirmed that it can be used in holidays.','Holidays TV and Satellite room',NULL,NULL,NULL,NULL,NULL,149,129,32,NULL,42,40,5,NULL,4,3,2,95,NULL,100,101,NULL,NULL,NULL,5),(148,49,7,8,'2016-01-01','2016-02-03',22,'Arabian beach','house use rooms','montemare hotel',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(149,93,8,3,'2016-02-07','2016-02-15',6,'Sunrise Montemare','Operation Needs','Sunrise Crystal Bay',NULL,NULL,NULL,NULL,NULL,132,139,85,NULL,170,93,92,NULL,59,3,2,95,NULL,100,101,102,NULL,NULL,5),(150,137,8,6,'2016-02-25','2016-02-28',6,'Sunrise Montemare','to be use in sunrise diamond','sunrise diamond',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,137,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(151,137,8,6,'2016-02-25','2016-03-01',8,'Sunrise Montemare','to be use in sunrise diamond','sunrise diamond',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,137,63,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(152,137,30,6,'2016-03-16','2016-03-23',8,'El nakhil hotel','For Cover manhole in Hotel Sun Rise  Diamond Beach  Resort','Sunrise diamound beach',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,137,63,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_approvals`
--

DROP TABLE IF EXISTS `hotel_approvals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_approvals` (
  `hotel_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `rank` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_approvals`
--

LOCK TABLES `hotel_approvals` WRITE;
/*!40000 ALTER TABLE `hotel_approvals` DISABLE KEYS */;
INSERT INTO `hotel_approvals` VALUES (16,6,1),(16,16,2),(16,4,3),(16,3,4),(16,2,5),(15,6,1),(15,17,2),(15,16,3),(15,4,4),(15,3,5),(15,2,6),(2,6,1),(2,4,2),(2,16,3),(2,3,4),(2,2,5),(3,6,1),(3,16,2),(3,4,3),(3,3,4),(3,2,5),(13,6,1),(13,16,2),(13,4,3),(13,3,4),(13,2,5),(12,6,1),(12,16,2),(12,4,3),(12,3,4),(12,2,5),(11,6,1),(11,16,2),(11,4,3),(11,3,4),(11,2,5),(10,6,1),(10,16,2),(10,4,3),(10,3,4),(10,2,5),(8,6,1),(8,17,2),(8,16,3),(8,4,4),(8,3,5),(8,2,6),(7,6,1),(7,17,2),(7,16,3),(7,4,4),(7,3,5),(7,2,6),(7,2,7),(6,6,1),(6,17,2),(6,16,3),(6,4,4),(6,3,5),(6,2,6),(5,6,1),(5,16,2),(5,4,3),(5,3,4),(5,2,5),(4,6,1),(4,16,2),(4,4,3),(4,3,4),(4,2,5),(14,6,1),(14,16,2),(14,4,3),(14,3,4),(14,2,5),(1,6,1),(1,16,2),(1,4,3),(1,3,4),(1,2,5);
/*!40000 ALTER TABLE `hotel_approvals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_planned_signatures`
--

DROP TABLE IF EXISTS `hotel_planned_signatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_planned_signatures` (
  `hotel_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `rank` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_planned_signatures`
--

LOCK TABLES `hotel_planned_signatures` WRITE;
/*!40000 ALTER TABLE `hotel_planned_signatures` DISABLE KEYS */;
INSERT INTO `hotel_planned_signatures` VALUES (3,2,10),(1,2,10),(8,2,11),(7,2,11),(6,2,11),(14,2,9),(14,16,8),(14,3,7),(14,6,6),(14,4,5),(14,5,4),(14,19,3),(14,18,2),(13,2,10),(13,16,9),(13,3,8),(13,6,7),(13,4,6),(13,5,5),(13,19,4),(13,21,3),(12,2,10),(12,16,9),(12,3,8),(12,6,7),(12,4,6),(12,5,5),(12,19,4),(12,21,3),(11,2,10),(11,16,9),(11,3,8),(11,6,7),(11,4,6),(11,5,5),(11,19,4),(11,21,3),(10,2,10),(10,16,9),(10,3,8),(10,6,7),(10,4,6),(10,5,5),(10,19,4),(10,21,3),(9,2,10),(9,16,9),(9,3,8),(9,6,7),(9,4,6),(9,5,5),(9,19,4),(9,21,3),(8,16,10),(8,3,9),(8,17,8),(8,6,7),(8,4,6),(8,5,5),(8,19,4),(8,21,3),(7,16,10),(7,3,9),(7,17,8),(7,6,7),(7,4,6),(7,5,5),(7,19,4),(7,21,3),(6,16,10),(6,3,9),(6,17,8),(6,6,7),(6,4,6),(6,5,5),(6,19,4),(6,21,3),(4,2,10),(4,16,9),(4,3,8),(4,6,7),(4,4,6),(4,5,5),(4,19,4),(4,21,3),(22,18,1),(5,16,9),(5,3,8),(5,6,7),(5,4,6),(5,5,5),(5,19,4),(5,21,3),(3,16,9),(3,3,8),(3,6,7),(3,4,6),(3,5,5),(3,19,4),(3,21,3),(3,20,2),(2,2,10),(2,16,9),(2,3,8),(2,6,7),(2,4,6),(2,5,5),(2,19,4),(2,21,3),(1,16,9),(1,3,8),(1,6,7),(1,4,6),(1,5,5),(1,19,4),(1,21,3),(1,20,2),(2,20,2),(4,20,2),(5,20,2),(6,20,2),(7,20,2),(8,20,2),(9,20,2),(10,20,2),(11,20,2),(12,20,2),(13,20,2),(1,18,1),(2,18,1),(3,18,1),(4,18,1),(5,18,1),(6,18,1),(7,18,1),(8,18,1),(9,18,1),(10,18,1),(11,18,1),(12,18,1),(13,18,1),(14,21,1),(22,21,2),(22,19,3),(22,5,4),(22,4,5),(22,6,6),(22,3,7),(22,16,8),(22,2,9),(15,5,5),(15,4,6),(15,3,8),(15,19,4),(15,21,3),(15,20,2),(15,16,9),(15,6,7),(15,18,1),(15,2,10),(16,5,5),(16,4,6),(16,3,8),(16,19,4),(16,21,3),(16,20,2),(16,16,9),(16,6,7),(16,18,1),(16,2,10),(17,5,5),(17,4,6),(17,3,8),(17,19,4),(17,21,3),(17,20,2),(17,16,9),(17,6,7),(17,18,1),(17,2,10),(18,5,5),(18,4,6),(18,3,8),(18,19,4),(18,21,3),(18,20,2),(18,16,9),(18,6,7),(18,18,1),(18,2,10),(19,5,5),(19,4,6),(19,3,8),(19,19,4),(19,21,3),(19,20,2),(19,16,9),(19,6,7),(19,18,1),(19,2,10),(20,5,5),(20,4,6),(20,3,8),(20,19,4),(20,21,3),(20,20,2),(20,16,9),(20,6,7),(20,18,1),(20,2,10),(23,5,5),(23,4,6),(23,3,8),(23,19,4),(23,21,3),(23,20,2),(23,16,9),(23,6,7),(23,18,1),(23,2,10),(24,5,5),(24,4,6),(24,3,8),(24,19,4),(24,21,3),(24,20,2),(24,16,9),(24,6,7),(24,18,1),(24,2,10),(25,5,5),(25,4,6),(25,3,8),(25,19,4),(25,21,3),(25,20,2),(25,16,9),(25,6,7),(25,18,1),(25,2,10);
/*!40000 ALTER TABLE `hotel_planned_signatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_signatures`
--

DROP TABLE IF EXISTS `hotel_signatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_signatures` (
  `hotel_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `rank` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_signatures`
--

LOCK TABLES `hotel_signatures` WRITE;
/*!40000 ALTER TABLE `hotel_signatures` DISABLE KEYS */;
INSERT INTO `hotel_signatures` VALUES (22,1,5),(13,2,4),(13,16,3),(22,16,4),(14,2,4),(14,16,3),(14,3,2),(14,4,1),(13,3,2),(13,4,1),(22,3,3),(12,2,4),(12,16,3),(12,3,2),(12,4,1),(22,4,2),(11,2,4),(11,16,3),(11,3,2),(11,4,1),(23,6,1),(10,2,4),(10,16,3),(10,3,2),(10,4,1),(23,4,2),(9,2,4),(9,16,3),(9,3,2),(9,4,1),(23,3,3),(8,2,5),(8,16,4),(8,3,3),(8,4,2),(23,16,4),(7,2,5),(7,16,4),(7,3,3),(7,4,2),(23,1,5),(6,2,5),(6,16,4),(6,3,3),(6,4,2),(20,1,5),(20,16,4),(5,16,3),(5,3,2),(5,4,1),(20,6,1),(4,2,4),(4,16,3),(4,3,2),(4,4,1),(22,6,1),(3,2,5),(3,16,4),(3,3,3),(3,4,2),(20,4,2),(2,2,4),(2,16,3),(2,3,2),(2,4,1),(20,3,3),(6,17,1),(7,17,1),(8,17,1),(24,6,1),(24,4,2),(24,3,3),(24,16,4),(24,1,5),(25,6,1),(25,4,2),(25,3,3),(25,16,4),(25,1,5),(26,6,1),(26,4,2),(26,3,3),(26,16,4),(26,1,5),(15,3,3),(15,4,2),(15,2,5),(15,16,4),(16,3,3),(16,4,2),(16,2,5),(16,16,4),(17,3,3),(17,4,2),(17,2,5),(17,16,4),(18,3,3),(18,4,2),(18,2,5),(18,16,4),(19,3,3),(19,4,2),(19,2,5),(19,16,4),(1,2,16),(1,16,12),(1,3,8),(1,4,1);
/*!40000 ALTER TABLE `hotel_signatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `company_id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL DEFAULT 'SUN',
  `logo` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `dummy` tinyint(4) DEFAULT '0',
  `dummy2` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotels`
--

LOCK TABLES `hotels` WRITE;
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
INSERT INTO `hotels` VALUES (1,'SUNRISE Garden Beach',2,'GB','448c7-sunrise-logo-small-stripped.jpg',0,0,0),(2,'SENTIDO Mamlouk Palace',2,'MP','448c7-sunrise-logo-small-stripped.jpg',0,0,0),(3,'SUNRISE Crystal Bay',1,'CB','448c7-sunrise-logo-small-stripped.jpg',0,0,0),(4,'SUNRISE Royal Makadi',4,'RM','448c7-sunrise-logo-small-stripped.jpg',0,0,0),(5,'SUNRISE Holidays',5,'HO','448c7-sunrise-logo-small-stripped.jpg',0,0,0),(6,'SUNRISE Diamond Beach',8,'DB','448c7-sunrise-logo-small-stripped.jpg',0,0,0),(7,'SUNRISE Arabian Beach',7,'AB','448c7-sunrise-logo-small-stripped.jpg',0,0,0),(8,'SUNRISE Montemare',9,'MO','448c7-sunrise-logo-small-stripped.jpg',0,0,0),(9,'SENTIDO Oriental Dream',6,'OD','448c7-sunrise-logo-small-stripped.jpg',0,0,0),(10,'Festival Shedwan',6,'SH','448c7-sunrise-logo-small-stripped.jpg',0,0,0),(11,'Festival Le Jardin',6,'LJ','448c7-sunrise-logo-small-stripped.jpg',0,0,0),(12,'Festival Riviera',6,'RV','448c7-sunrise-logo-small-stripped.jpg',0,0,0),(13,'Color Beach Club',6,'CC','448c7-sunrise-logo-small-stripped.jpg',0,0,0),(14,'test hotel 1',5,'T1','448c7-sunrise-logo-small-stripped.jpg',0,0,0),(15,'test hotel 2',8,'T2','448c7-sunrise-logo-small-stripped.jpg',0,0,0),(16,'SUNRISE Sharm Orchid Resort',10,'SO','448c7-sunrise-logo-small-stripped.jpg',0,0,0),(17,'SUNRISE for floating hotels management',11,'FL','448c7-sunrise-logo-small-stripped.jpg',0,0,0),(18,'CA',12,'VI','448c7-sunrise-logo-small-stripped.jpg',0,0,0),(19,'EL Forsan Housing',13,'FR','448c7-sunrise-logo-small-stripped.jpg',0,0,0),(20,'SENTIDO MS Mahrousa',6,'MAH',NULL,0,0,0),(21,'SENTIDO MS Mahrousa',6,'MAH',NULL,1,0,0),(22,'SENTIDO MS Nile Saray',6,'NS',NULL,0,0,0),(23,'SUNRISE MS African Dreams',6,'AFD',NULL,0,0,0),(24,'SUNRISE MS Semiramis I',6,'SEM1',NULL,0,0,0),(25,'SUNRISE MS Semiramis II',6,'SEM11',NULL,0,0,0),(26,'Sunrise MS Semiramis III',6,'SEIII',NULL,0,0,0),(27,'SUNRISE Select MS Terramar,',6,'TER',NULL,0,0,0),(28,'Madar Company',14,'MAD',NULL,0,0,0),(30,'ُEL Nakhil Hotel',15,'NAKH',NULL,0,0,0),(31,'African Dream',6,'AFD',NULL,1,0,0);
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=318 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,1,'-','first item',1,0),(2,1,'-','second item',2,0),(3,1,'-','longer description for the forth item!',13,0),(4,2,'-','test',1,0),(5,3,'-','dsfdsf',2,0),(6,4,'-','vdsvad',1,0),(7,4,'-','',0,0),(8,5,'-','test',1,0),(9,6,'-','test',2,0),(10,6,'-','',0,0),(11,7,'-','test',1,0),(12,8,'-','test',1,0),(13,9,'PC ','PC test',1,0),(14,9,'printer','test',2,0),(15,10,'Color Xerox Printer 7120','To provide Color printer at Montemare',1,0),(16,10,'firewwall Fortigate 80 C','install firewall at Montemare hotel',1,0),(17,11,'server 530','intinstall new domian',1,0),(18,11,'printer','move tp it office',2,0),(19,12,'test','test',1,0),(20,13,'test','nddfkg',1,0),(21,13,'glragl/','gmr.',2,0),(22,14,'HP Proliant Server','HP Proliant Server',1,0),(23,15,'xz','x',1,0),(24,16,'a','ds',1,0),(25,17,'x','s',1,0),(26,18,'sa','a',1,0),(27,19,'q','ws',1,0),(28,20,'Proffer cabinet','local made (height 230 cm & width 140 cm)',1,0),(29,21,'Server HP ML 370 G6','For Invoice System Migration',1,0),(30,22,'Chair One Seat','For Lobby Terrace Shedwan',33,0),(31,22,'Sofa 2 Seat','For Lobby Terrace Shedwan',13,0),(32,22,'Large Table','For Lobby Terrace Shedwan',17,0),(33,23,'sun beds ','sun beds ',40,0),(34,23,'table ','tables ',40,0),(35,24,'TV','LG 32&quot;',44,0),(36,25,'TV','LG 32\"',96,0),(37,26,'Tv','<p>\n	LG 32&quot;</p>\n',224,0),(38,27,'TV','Hisense',8,0),(39,28,'Tv','LG 32\"',256,0),(40,29,'TV','<p>\n	Hisense</p>\n',132,0),(41,30,'TV','LG 32\"',4,0),(42,31,'Mattress','<p>\n	Matress 110 cm * 200 cm</p>\n',111,0),(43,31,'Mattress','<p>\n	Matress 120 cm * 200 cm</p>\n',36,0),(44,32,'Mattress','<p>\n	180cm x 200cm</p>\n',85,0),(45,32,'Mattress','<p>\n	110cm x 200cm</p>\n',250,0),(46,33,'-','Color laser printer',1,0),(47,33,'-','Laser printer',1,0),(48,34,'-','',1,0),(49,35,'Xerox 7120','<p>\n	color laser printer</p>\n',1,0),(50,35,'Xerox 5330','<p>\n	heavy-duty printer</p>\n',1,0),(51,36,'-','for kitchen',3,0),(52,36,'-','for kitchen ',1,0),(53,36,'-','For Kitchen ',1,0),(54,36,'-','for kitchen',1,0),(55,36,'-','for kitchen ',1,0),(56,36,'-','for kitchen',1,0),(57,36,'-','for kitchen ',1,0),(58,36,'-','for kitchen',1,0),(59,36,'-','for kitchen ',1,0),(60,36,'-','for kitcken ',1,0),(61,37,'-','for kitchen',3,0),(62,37,'-','for kitchen ',1,0),(63,37,'-','For Kitchen ',1,0),(64,37,'-','for kitchen',1,0),(65,37,'-','for kitchen ',1,0),(66,37,'-','for kitchen',1,0),(67,37,'-','for kitchen ',1,0),(68,37,'-','for kitchen',1,0),(69,37,'-','for kitchen ',1,0),(70,37,'-','for kitcken ',1,0),(71,37,'-','FOR KITCHEN ',1,0),(72,38,'-Knee type star basin 304# 1.2mm','<p>\n	for shedwan new kitchen</p>\n',3,0),(73,38,'-The wall mounted faucet','<p>\n	for shedwan new kitchen</p>\n',1,0),(74,38,'-3Gl Microwave oven','<p>\n	for shedwan new kitchen</p>\n',1,0),(75,38,'-mfc32 275*280*120KG/0.25KW','<p>\n	for shedwan new kitchen</p>\n',1,0),(76,38,'-Slicer Meat','<p>\n	for shedwan new kitchen</p>\n',1,0),(77,38,'-GAS TILTING BRASING PAN 800*900*60','<p>\n	for shedwan new kitchen</p>\n',1,0),(78,38,'-XW)-2A DISH WASHER 705*830*1500/0735KW WASHING CAPACITY 900PLATES','<p>\n	for shedwan new kitchen</p>\n',1,0),(79,38,'-ZH-TC ELECTIC1-TANK FRYER WITH capinet 800*900*850+60','<p>\n	for shedwan new kitchen</p>\n',1,0),(80,38,'-WR-10-11 steaming and baking oven 867*930*930','<p>\n	for shedwan new kitchen</p>\n',1,0),(81,38,'-food crushor 370*445*615/220v 109kw','<p>\n	for shedwan new kitchen</p>\n',1,0),(82,38,'-ZH-RO100 GASSOUP KETTLE 800*900*850+60','<p>\n	for shedwan new kitchen</p>\n',1,0),(83,39,'Boiler','',2,0),(84,40,'-','',4,0),(85,41,'-Sheslong Blastic','<p>\n	sheslong beach le jardin</p>\n',106,0),(86,41,'-Sheslong Wood','<p>\n	sheslong beach le jardin</p>\n',94,0),(87,42,'-juice dispensers','<p>\n	juice dispensers</p>\n',4,0),(88,43,'juice dispensers ','<p>\n	juice dispensers</p>\n',3,0),(89,44,'-Juice Dispensers','<p>\n	For Lobby SmartLine</p>\n',1,0),(90,44,'-Juice Dispensers','<p>\n	For Pool SmartLine</p>\n',1,0),(91,45,'-Juice Dispensers','<p>\n	Festival Shedwan</p>\n',3,0),(92,46,'juice dispensers ','<p>\n	juice dispensers</p>\n',3,0),(93,47,'juice dispensers ','<p>\n	juice dispensers</p>\n',3,0),(94,48,'-','2 slice machines',2,0),(95,49,'-slice machines','<p>\n	2 slice machines</p>\n',2,0),(96,50,'mattresses','<p>\n	100 cm width</p>\n',64,0),(97,50,'mattresses','<p>\n	120 cm Width</p>\n',33,0),(98,50,'mattresses','<p>\n	110 cm Width</p>\n',44,0),(99,51,'-juice dispenser','<p>\n	juice dispenser</p>\n',2,0),(100,52,'-juice dispenser','<p>\n	juice dispenser</p>\n',2,0),(101,53,'-','To Diamond Kitchen ',2,0),(102,53,'-','To Diamond Kitchen ',3,0),(103,53,'-','To Diamond Kitchen ',4,0),(104,53,'-','To Diamond Kitchen',4,0),(105,53,'-','To Diamond Kitchen',2,0),(106,53,'-','To Diamond Kitchen',1,0),(107,53,'-','To Diamond Kitchen',2,0),(108,53,'-','To Diamond Kitchen',1,0),(109,53,'-','To Diamond Kitchen',2,0),(110,53,'-','To Diamond Kitchen',1,0),(111,53,'-','To Diamond Kitchen',2,0),(112,53,'-','To Diamond Kitchen',1,0),(113,53,'-','To Diamond Kitchen',2,0),(114,53,'-','To Diamond Kitchen',1,0),(115,53,'-','To Diamond Kitchen',1,0),(116,53,'-','To Diamond Kitchen',1,0),(117,53,'-','To Diamond Kitchen',1,0),(118,54,'Juice Dispenser','<p>\n	<u>Juice Dispenser</u></p>\n',4,0),(119,55,'-','',4,0),(120,56,'-','',4,0),(121,57,'-','',4,0),(122,58,'Commercial Microwaves','<p>\n	Heavey Duty Commercial Microwave</p>\n',2,0),(123,59,'-','Heavey Duty Commercial Microwave',2,0),(124,60,'-Juice Dispensers','',3,0),(125,61,'-Juice Dispensers','',3,0),(126,62,'-Juice Dispensers From Chine','<p>\n	Juice Dispensers From Chine</p>\n',4,0),(127,63,'Meat Mincer','<p>\n	Heavy Duty Meay Mincer</p>\n',1,0),(128,64,'مرتبه','<p>\n	لسكن الفرسان</p>\n',64,0),(129,65,'مرتبة','مرتبة واحد متر للاستخدام للموظفين',64,0),(130,66,'Cleaning Machine ','',1,0),(131,67,'Electric Leader','Electric Leader',1,0),(132,68,'Electric Leader','Electric Leader',1,0),(133,69,'Big white chair ','big white chair ',8,0),(134,69,'Big blue cochin','big blue cochin',8,0),(135,69,'Small  withe chair ','small withe chair ',4,0),(136,69,'Small blue cochin ','small blue cochin ',4,0),(137,69,'Small Round table ','small round table ',1,0),(138,69,'Big Round Table ','Big Round Table ',1,0),(139,69,'Big Mattress','Big Mattress',1,0),(140,69,'Small Cochin ','Small Cochin ',7,0),(141,69,'Big Swimming Pool Sunbed ','Big Swimming Pool Sunbed ',2,0),(142,69,'Sunbed Big Blue cochin','Sunbed Big Blue cochin',2,0),(143,70,'Gas Grill','Used',1,0),(144,70,'Gas Tilting Pan ','Used',1,0),(145,70,'Gas Deep Fryer','used',1,0),(146,70,'Toaster Machine','Used',2,0),(147,71,'ماكينة توست ','مستعمله ',2,0),(148,71,'مكبس جزار ','مستعمل',1,0),(149,71,'جريله كهربا دائريه 40سم','مستعمله',1,0),(150,72,'LCD Hisense 32\"','to diamond Rooms',100,0),(151,73,'LCD 32\"','to diamond Rooms',135,0),(152,74,'LCD 32\"','to diamond Rooms',135,0),(153,75,'LCD 32\" LG','to diamond Rooms',100,0),(154,75,'LCD 32\'\' SAMSUNG','<p>\n	to diamond Rooms</p>\n',40,0),(155,76,'Club Car','Club Car',1,0),(156,77,'Heater','heater',10,0),(157,78,'Chicago Flat iron','flat iron for luandry',1,0),(158,79,'Galss washer ','',2,0),(159,79,'Iceamaker','For a new aqua parck',2,0),(160,80,'Curtain motors','Smofi Roll up motors - for main restaurant',12,0),(161,80,'Curtain Motors','Gladyie motors - for main restaurant',5,0),(162,81,'Sunbed ','',63,0),(163,82,'Convection Model Angelopo','1',1,0),(164,83,'sniffer','جهاز كشف المفرقعات',1,0),(165,84,'Suzuki Car','',1,0),(166,85,'Upholstery Fabics (1)','Shanilia Green in Beige color',51,0),(167,85,'Upholstery Fabics (2)','Plush Fabrics Brown in Light Blue',21,0),(168,85,'Upholstery Fabics (3)','Shanilia Fabrics Dark Beige Stripped',19,0),(169,85,'Upholstery Fabics (4)','Plush Fabrics Beige Bright',42,0),(170,85,'Upholstery Fabics (5)','Shanilia Orange in Beige color',25,0),(171,86,'Sever ML370 G5','Sever ML370 G5',1,0),(172,87,'Sun Bed','we need to send sun bed to center workshop for maintenance',82,0),(173,87,'Matres with cover','',100,0),(174,88,'micros with printer ','micros for color beach ',1,0),(175,89,'micros + printer ckeck ','micros for color beach',1,0),(176,90,'Micros + Printer ','micros for color beach',1,0),(177,91,'Small icemaker','To install in diamond beach',1,0),(178,91,'small glasswasher','To install in diamond beach',1,0),(179,92,'Switch Cisco','',1,0),(180,93,'Micros Kitchen Printer','',1,0),(181,94,'Micros workstation','1- SN 8101021722    2- SN 8081021185    3- SN 8081021157    4- SN 8081021190',4,0),(182,94,'Micros Kitchen Printer','1- SN GM3G003890 2- SN GM3G003214 3- SN GM3G003222 4- SN GM3G003063',4,0),(183,95,'xerox workcentre 5020','Printer',1,0),(184,96,'Plant pot big','',8,0),(185,96,'Plant pot small','',5,0),(186,97,'Rattan Tables','Rattan tables for rooms terraces - Building 4',34,0),(187,98,'Pools ratan tabels ','Small tablewith brown color ',35,0),(188,99,'sneffer','جهاز الكشف عن المفرقعات',1,0),(189,100,'Meat Cutter ','Italian meat mincer(40 kg.)',1,0),(190,101,'Toast Forms','For bakery- black steel',5,0),(191,102,'Dark brown fabric ','',30,0),(192,102,'Brown * Bege striped fabric','',36,0),(193,102,'Brown wool with dotted fabric','',15,0),(194,102,'Beige fabric','',35,0),(195,102,'Beige velour fabric','',28,0),(196,102,'Red * Black fabric','',5,0),(197,103,'Dark brown fabric','',25,0),(198,103,'Brown * Bege striped fabric','',35,0),(199,103,'brown wool with dotted fabric','',25,0),(200,103,'beige fabric','',35,0),(201,103,'beige velour fabric ','',28,0),(202,103,'Red* black fabric ','',5,0),(203,103,'Brown Mzarkh fabric ','',25,0),(204,103,'Dark brown Fabric sick ','',35,0),(205,103,'Coppery strip fabric ','',7,0),(206,104,'Bed','Staff housing bed',55,0),(207,104,'cupboard','staff housing cupboard',100,0),(208,105,'Wear Dropp','',50,0),(209,106,'TV','',30,0),(210,107,'Computer Desktop','<p>\n	For Central workshop</p>\n',1,0),(211,108,'TV LCD plus holder and remote',' LG  (26\") ',168,0),(212,109,'Device MICROS','',8,0),(213,109,'Printer MICROS','',8,0),(214,110,'TV','to be in new Diamond housing staff',25,0),(215,110,'Minibar','to be in new Diamond housing staff',25,0),(216,109,'Drawer MICROS','',8,0),(217,111,'pump grundfos ','',3,0),(218,111,'pump controller panel','',3,0),(219,112,'T V  20 L  C H ','',30,0),(220,113,'Beige  FabricNO 4','Velvet  beige fabric',31,0),(221,113,'Beige fabric NO 17','Normal beige Fabric',25,0),(222,114,'Tissues box ','Brass tisses box ',249,0),(223,114,'Tissues Box ','Estanles tisses Box ',51,0),(224,115,'ترولي أطباق كامبرو','',2,0),(225,115,'حوض (02) عين','',5,0),(226,115,'حوض عين واحدة','',2,0),(227,115,'كونتر بباب جرار','',1,0),(228,115,'إسطوانة غاز25','',12,0),(229,115,'ظهر كونتر','',1,0),(230,115,'قاعدة ستانليس ستيل لفرن','',2,0),(231,115,'ترولي مطبخ','',3,0),(232,115,'حوض 3 عين','',3,0),(233,115,'ثلاجة اندر كونتر','',1,0),(234,115,'ثلاجة بإدراج  أندر كونتر','',1,0),(235,115,'ترولي نقع مياه','',2,0),(236,115,'دولاب حائط معلق','',2,0),(237,115,'كونتر مثل الروشو','',1,0),(238,115,'ترولي 02 رف','',4,0),(239,115,'قاعدة إستانليس ستيل','',8,0),(240,116,'S/S Three Compartments Sink','Stainless Steel Triple Sink',1,0),(241,116,'S/S Kitchen Trolley','Stainless Steel Kitchen Trolley ',3,0),(242,116,'S/S Oven Table','Stainless Steel Double Dooer table to be used for counter top oven',2,0),(243,116,'Large Gas Cylinder','Large Size Gas Cylinder ',12,0),(244,116,'S/S Counter with sliding door','Sliding Double Door Counter',1,0),(245,116,'S/S Dipping Trolley','Stainless Steel Dipping Trolley',2,0),(246,116,'Double Door Under Counter Fridge','Double Door Under Counter Fridge',1,0),(247,117,'تروللي نقع مياه','',2,0),(248,117,'كونتر مثل الروشو','',1,0),(249,117,'تروللي 2 رف','',4,0),(250,117,'تروللي اطباق كمبرو','',2,0),(251,117,'ظهر كونتر','',1,0),(252,117,'قاعدة ستانلس لفرن','',2,0),(253,117,'كونتر باب جرار','',1,0),(254,118,'ترولي أطباق كامبرو','',2,0),(255,118,'كونتر بباب جرار','',1,0),(256,118,'ظهر كونتر','',1,0),(257,118,'قاعدة ستانليس ستيل لفرن','',2,0),(258,118,'ترولي نقع مياه','',2,0),(259,118,'كونتر مثل الروشو','',1,0),(260,118,'ترولي 02 رف','',4,0),(261,119,'حوض (02) عين','',5,0),(262,119,'حوض عين واحدة','',2,0),(263,119,'إسطوانة غاز25','',12,0),(264,119,'ترولي مطبخ','',3,0),(265,119,'حوض 3 عين','',3,0),(266,119,'ثلاجة اندر كونتر','',1,0),(267,119,'ثلاجة بإدراج  أندر كونتر','',1,0),(268,119,'دولاب حائط معلق','',2,0),(269,119,'قاعدة إستانليس ستيل','',8,0),(270,120,'TV LCD plus holder and remote','26 inch',64,0),(271,121,'Tissues box	','Brass tisses box',15,0),(272,122,'Wooden Cupboard','',50,0),(273,123,'Wooden Cupboard','',50,0),(274,124,'Ceramic tiles','60 SQM of ceramic tiles',60,0),(275,125,'TV L C D Plus holder and remot','32 inch',26,0),(276,126,'T.V','44TVfor shedwan new rooms',44,0),(277,127,'T.V','168 T.V from sunrise select crystal bay for smart line rooms',168,0),(278,128,'Chairs ','Ratan Chairs',130,0),(279,128,'Sunbed','Sunbed',30,0),(280,129,'LCD 32&#39;&#39; SAMSUNG','to montemare Rooms',40,0),(281,130,'test','test',1,0),(282,131,'Food Processor (Rahaya رحايه)','15 L - Made in China',1,0),(283,132,'Suzuki Car ','bellman',1,0),(284,133,'table','table',1,0),(285,133,'stand','stand',1,0),(286,133,'table ','180 *180',10,0),(287,134,'TV LG 55 inch','tv',1,0),(288,135,'TV LG 55 inch','tv',2,0),(289,136,'umbrella ','umprela',25,0),(290,136,'skuna','skuna',15,0),(291,136,'bed matress','bed matress',100,0),(292,136,'bed mattress white','bed mattress white',50,0),(293,137,'Central Unit','',1,0),(294,138,'Satellite Unit','',1,0),(295,139,'Sunbed','Metal white',100,0),(296,139,'sunbed','Metall white',50,0),(297,140,'Bed Double ','Bed Double ',2,0),(299,141,'test','test',1,0),(300,142,'Bathroom Glass Doors','Bathroom glass doors',130,0),(301,143,'Sunbeds + sofas ','Chaises longues for beach and S. pool area',70,0),(302,144,'Welding machine','1',1,0),(303,145,'Welding Machine','1',1,0),(304,146,'Breten TV station with all related accessoriesFor HO TV station (Receivers group ,  the receivers faces  and related DNS cables ','For HO TV station instead of buying a new one ',1,0),(305,147,'test','test',1,0),(306,148,'Iron double bed','housing staff iron bed',2,0),(307,149,'Stainless Wall Cabinet','For the Swim up  bar',2,0),(308,149,'Stainless Rack Trolley','For the main Kitchen',3,0),(309,149,'Stainless 2 Shelves Movable trolley ','For the Main Kitchen',3,0),(310,149,'Stainless 3 Holes Sink','One for Felucca and the another for Mediterranean as per Cristal comments',2,0),(311,149,'Rattan Baskets \"Without Covers\"','For guest public areas',28,0),(312,150,'تروللي ','ستاايس تيل ',2,0),(314,151,'حوض ','استالس تيل 3 عين',2,0),(315,152,'caver manhole 60x60 ','with Chassis Color Brown',49,0),(316,152,'caver manhole 60x60 ','with Chassis green color',35,0),(317,152,'caver manhole 60x60 ','Chassis Cast iron',5,0);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `target_id` int(11) NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=554 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,129,'Request','projects',1,'{\"user_id\":\"129\",\"department_id\":\"4\",\"hotel_id\":\"4\",\"type_id\":\"3\",\"origin_id\":3,\"name\":\"main swimming pool renovation\",\"reasons\":\"water leakage at the main swimming pool\",\"EUR_EX\":\"\",\"USD_EX\":\"\",\"budget_EGP\":\"2092000\",\"budget_USD\":\"\",\"budget_EUR\":\"\",\"budget\":\"2092000\",\"remarks\":\"\",\"state_id\":0}','user created project approval request','2016-01-13 08:41:00'),(2,129,'Approve','projects',1,NULL,'user self approved','2016-01-13 08:41:00'),(3,129,'Stage','projects',1,'{\"state\":1}','project state updated','2016-01-13 08:41:00'),(4,129,'Notify','projects',1,'{\"to\":\"samy.nasser@sunrise-resorts.com\"}','user requested approval','2016-01-13 08:41:00'),(5,4,'Approve','projects',1,'{\"approval_id\":\"2\"}','user signed approval','2016-01-16 10:50:47'),(6,4,'Notify','projects',1,'{\"to\":\"hazim.elshamy@sunrise-resorts.com\"}','user requested approval','2016-01-16 10:50:47'),(7,3,'Approve','projects',1,'{\"approval_id\":\"3\"}','user signed approval','2016-01-17 10:57:10'),(8,3,'Notify','projects',1,'{\"to\":\"Philippe.deVizcaya@sunrise-resorts.com\"}','user requested approval','2016-01-17 10:57:11'),(9,146,'Request','projects',2,'{\"user_id\":\"146\",\"department_id\":\"4\",\"hotel_id\":\"10\",\"type_id\":\"1\",\"origin_id\":3,\"name\":\"Hot water pumps\",\"reasons\":\"To replace the old pumps for the hot water .The Old pumps not working in proper way   . We face lots of problem from the guests about the hot water. We try to fix many times in the work shop.\",\"EUR_EX\":\"\",\"USD_EX\":\"\",\"budget_EGP\":\"25.000\",\"budget_USD\":\"\",\"budget_EUR\":\"\",\"budget\":\"25\",\"remarks\":\"\",\"state_id\":0}','user created project approval request','2016-01-17 13:54:42'),(10,146,'Approve','projects',2,NULL,'user self approved','2016-01-17 13:54:42'),(11,146,'Stage','projects',2,'{\"state\":1}','project state updated','2016-01-17 13:54:42'),(12,146,'Notify','projects',2,'{\"to\":\"samy.nasser@sunrise-resorts.com\"}','user requested approval','2016-01-17 13:54:42'),(13,146,'Request','projects',3,'{\"user_id\":\"146\",\"department_id\":\"4\",\"hotel_id\":\"10\",\"type_id\":\"1\",\"origin_id\":3,\"name\":\"Hot water pumps\",\"reasons\":\"To replace the old pumps for the hot water .The Old pumps not working in proper way   . We face lots of problem from the guests about the hot water. We try to fix many times in the work shop.\",\"EUR_EX\":\"\",\"USD_EX\":\"\",\"budget_EGP\":\"25000\",\"budget_USD\":\"\",\"budget_EUR\":\"\",\"budget\":\"25000\",\"remarks\":\"\",\"state_id\":0}','user created project approval request','2016-01-17 13:56:15'),(14,146,'Approve','projects',3,NULL,'user self approved','2016-01-17 13:56:15'),(15,146,'Stage','projects',3,'{\"state\":1}','project state updated','2016-01-17 13:56:15'),(16,146,'Notify','projects',3,'{\"to\":\"samy.nasser@sunrise-resorts.com\"}','user requested approval','2016-01-17 13:56:15'),(17,146,'Request','projects',4,'{\"user_id\":\"146\",\"department_id\":\"4\",\"hotel_id\":\"10\",\"type_id\":\"1\",\"origin_id\":3,\"name\":\"2 Hot water pumps\",\"reasons\":\"To replace the 2 old pumps for the hot water .The Old pumps not working in proper way   . We face lots of problem from the guests about the hot water. We try to fix many times in the work shop.\",\"EUR_EX\":\"\",\"USD_EX\":\"\",\"budget_EGP\":\"25000\",\"budget_USD\":\"\",\"budget_EUR\":\"\",\"budget\":\"25000\",\"remarks\":\"\",\"state_id\":0}','user created project approval request','2016-01-17 13:58:35'),(18,146,'Approve','projects',4,NULL,'user self approved','2016-01-17 13:58:35'),(19,146,'Stage','projects',4,'{\"state\":1}','project state updated','2016-01-17 13:58:35'),(20,146,'Notify','projects',4,'{\"to\":\"samy.nasser@sunrise-resorts.com\"}','user requested approval','2016-01-17 13:58:35'),(21,115,'Request','projects',5,'{\"user_id\":\"115\",\"department_id\":\"4\",\"hotel_id\":\"22\",\"type_id\":\"1\",\"origin_id\":3,\"name\":\"\\u062a\\u063a\\u064a\\u064a\\u0631 \\u062a\\u0631\\u062a\\u0627\\u0646 \\u0627\\u0644\\u0635\\u0646 \\u062f\\u064a\\u0643\",\"reasons\":\"\\u0628\\u0627\\u0644\\u0635\\u0646 \\u062f\\u064a\\u0643\",\"EUR_EX\":\"\",\"USD_EX\":\"\",\"budget_EGP\":\"20401\",\"budget_USD\":\"\",\"budget_EUR\":\"\",\"budget\":\"20401\",\"remarks\":\"For Nile Saray\",\"state_id\":0}','user created project approval request','2016-01-18 11:02:39'),(22,115,'Approve','projects',5,NULL,'user self approved','2016-01-18 11:02:39'),(23,115,'Stage','projects',5,'{\"state\":1}','project state updated','2016-01-18 11:02:39'),(24,115,'Notify','projects',5,'{\"to\":\"refaat.aboubakr@sunrise-resorts.com\",\"code\":\"8EDFD\"}','code exists => approved. else disapproved','2016-01-18 11:02:39'),(25,115,'Stage','projects',5,'{\"state\":2}','project state updated','2016-01-18 11:02:39'),(26,55,'Approve','projects',1,'{\"approval_id\":\"4\"}','user signed approval','2016-01-18 12:06:27'),(27,55,'Notify','projects',1,'{\"to\":\"chairman@sunrise-resorts.com\"}','user requested approval','2016-01-18 12:06:27'),(28,55,'Approve','projects',5,'{\"approval_id\":\"21\"}','user signed approval','2016-01-18 13:09:35'),(29,55,'Notify','projects',5,'{\"to\":\"mohamed.elserwy@sunrise-resorts.com\"}','user requested approval','2016-01-18 13:09:36'),(30,83,'Notify','projects',5,'{\"to\":\"marwan.gendy@gmail.com\"}','user requested approval','2016-01-18 13:58:36'),(31,83,'Notify','projects',5,'{\"to\":\"mohamed.elserwy@sunrise-resorts.com\"}','user requested approval','2016-01-18 13:58:36'),(32,83,'Request','projects',6,'{\"user_id\":\"83\",\"department_id\":\"2\",\"hotel_id\":\"1\",\"type_id\":\"1\",\"origin_id\":3,\"name\":\"test\",\"reasons\":\"test\",\"EUR_EX\":\"\",\"USD_EX\":\"\",\"budget_EGP\":\"10\",\"budget_USD\":\"\",\"budget_EUR\":\"\",\"budget\":\"10\",\"remarks\":\"\",\"state_id\":0}','user created project approval request','2016-01-18 14:07:15'),(33,83,'Approve','projects',6,NULL,'user self approved','2016-01-18 14:07:15'),(34,83,'Stage','projects',6,'{\"state\":1}','project state updated','2016-01-18 14:07:15'),(35,83,'Notify','projects',6,'{\"to\":\"samy.nasser@sunrise-resorts.com\"}','user requested approval','2016-01-18 14:07:16'),(36,83,'Notify','projects',6,'{\"to\":\"abbas.elshabasy@sunrise-resorts.com\"}','user requested approval','2016-01-18 14:11:09'),(37,83,'Notify','projects',6,'{\"to\":\"Marwan.gendy@sunrise-resorts.com\"}','user requested approval','2016-01-18 14:18:24'),(38,83,'Notify','projects',6,'{\"to\":\"abbas.elshabasy@sunrise-resorts.com\"}','user requested approval','2016-01-18 14:18:25'),(39,83,'Notify','projects',6,'{\"to\":\"Marwan.gendy@sunrise-resorts.com\"}','user requested approval','2016-01-18 14:23:10'),(40,83,'Notify','projects',6,'{\"to\":\"abbas.elshabasy@sunrise-resorts.com\"}','user requested approval','2016-01-18 14:23:10'),(41,83,'Notify','projects',6,'{\"to\":\"Marwan.gendy@sunrise-resorts.com\"}','user requested approval','2016-01-18 14:30:03'),(42,83,'Notify','projects',6,'{\"to\":\"abbas.elshabasy@sunrise-resorts.com\"}','user requested approval','2016-01-18 14:30:03'),(43,83,'Notify','projects',6,'{\"to\":\"Marwan.gendy@sunrise-resorts.com\"}','user requested approval','2016-01-18 14:32:46'),(44,83,'Notify','projects',6,'{\"to\":\"abbas.elshabasy@sunrise-resorts.com\"}','user requested approval','2016-01-18 14:32:46'),(45,83,'Notify','projects',6,'{\"to\":\"Marwan.gendy@sunrise-resorts.com\"}','user requested approval','2016-01-18 14:34:32'),(46,83,'Notify','projects',6,'{\"to\":\"abbas.elshabasy@sunrise-resorts.com\"}','user requested approval','2016-01-18 14:34:33'),(47,83,'Notify','projects',5,'{\"to\":\"mohamed.elserwy@sunrise-resorts.com\"}','user requested approval','2016-01-18 14:39:45'),(48,83,'Notify','projects',4,'{\"to\":\"samy.nasser@sunrise-resorts.com\"}','user requested approval','2016-01-18 14:40:03'),(49,83,'Notify','projects',1,'{\"to\":\"chairman@sunrise-resorts.com\"}','user requested approval','2016-01-18 14:40:21'),(50,4,'Disapprove','projects',4,'{\"approval_id\":\"15\"}','user rejected approval','2016-01-19 08:12:16'),(51,4,'Stage','projects',4,'{\"state\":11}','project state updated','2016-01-19 08:12:16'),(52,4,'Notify','projects',4,'{\"to\":\"tarek.elbadry@festival-resorts.com\",\"code\":null}','code exists => approved. else disapproved','2016-01-19 08:12:17'),(53,4,'Approve','projects',4,'{\"approval_id\":\"15\"}','user signed approval','2016-01-19 08:21:20'),(54,4,'Notify','projects',4,'{\"to\":\"hazim.elshamy@sunrise-resorts.com\"}','user requested approval','2016-01-19 08:21:20'),(55,4,'Approve','projects',4,'{\"approval_id\":\"15\"}','user signed approval','2016-01-20 07:28:43'),(56,4,'Notify','projects',4,'{\"to\":\"hazim.elshamy@sunrise-resorts.com\"}','user requested approval','2016-01-20 07:28:44'),(57,4,'Approve','projects',4,'{\"approval_id\":\"15\"}','user signed approval','2016-01-20 07:30:24'),(58,4,'Notify','projects',4,'{\"to\":\"hazim.elshamy@sunrise-resorts.com\"}','user requested approval','2016-01-20 07:30:25'),(59,3,'Approve','projects',4,'{\"approval_id\":\"16\"}','user signed approval','2016-01-20 10:33:43'),(60,3,'Notify','projects',4,'{\"to\":\"Philippe.deVizcaya@sunrise-resorts.com\"}','user requested approval','2016-01-20 10:33:44'),(61,55,'Approve','projects',4,'{\"approval_id\":\"17\"}','user signed approval','2016-01-20 10:46:24'),(62,55,'Notify','projects',4,'{\"to\":\"tarek.elbadry@festival-resorts.com\",\"code\":\"876DF\"}','code exists => approved. else disapproved','2016-01-20 10:46:25'),(63,55,'Stage','projects',4,'{\"state\":2}','project state updated','2016-01-20 10:46:25'),(64,2,'Approve','projects',1,'{\"approval_id\":\"5\"}','user signed approval','2016-01-20 14:56:18'),(65,2,'Notify','projects',1,'{\"to\":\"Waheed.altohamy@sunrise-resorts.com\",\"code\":\"1EB32\"}','code exists => approved. else disapproved','2016-01-20 14:56:20'),(66,2,'Stage','projects',1,'{\"state\":2}','project state updated','2016-01-20 14:56:20'),(67,129,'Offer','projects',1,'{\"offer_name\":\"\\u0627\\u0639\\u0645\\u0627\\u0644_\\u0627\\u0644\\u0643\\u062a\\u0631\\u0648_\\u0645\\u064a\\u0643\\u0627\\u0646\\u064a\\u0643_\\u0627\\u0644\\u0645\\u0637\\u0644\\u0648\\u0628_\\u0639\\u0645\\u0644\\u0647\\u0627_\\u0641\\u0649_\\u062d\\u0645\\u0627\\u0645_\\u0627\\u0644\\u0633\\u0628\\u0627\\u062d\\u0629_\\u0627\\u0644\\u0631\\u0626\\u064a\\u0633\\u06491.docx\"}','user uploaded an offer','2016-01-21 09:04:10'),(68,129,'Offer','projects',1,'{\"offer_name\":\"\\u0627\\u0644\\u0645\\u062a\\u062d\\u062f\\u06291.docx\"}','user uploaded an offer','2016-01-21 09:04:12'),(69,129,'Offer','projects',1,'{\"offer_name\":\"\\u0643\\u0648\\u0646\\u0633\\u062a\\u064a\\u06441.docx\"}','user uploaded an offer','2016-01-21 09:04:13'),(70,73,'Offer','projects',4,'{\"offer_name\":\"Pump_5.5hp.PDF\"}','user uploaded an offer','2016-01-21 09:04:46'),(71,73,'Offer','projects',4,'{\"offer_name\":\"\\u0637\\u0644\\u0645\\u0628\\u0647.pdf\"}','user uploaded an offer','2016-01-21 09:05:03'),(72,129,'Offer','projects',1,'{\"offer_name\":\"CUserspcDesktop\\u0645\\u0643\\u0627\\u062f\\u06491.docx\"}','user uploaded an offer','2016-01-21 09:05:31'),(73,149,'Submit','projects',1,'{\"user_id\":\"149\",\"scope\":\"main swimming pool renovation\",\"cost\":\"2467000\",\"cost_EGP\":\"2467000\",\"cost_USD\":\"\",\"cost_EUR\":\"\",\"start\":\"2016-01-25\",\"end\":\"2016-03-12\",\"year\":\"2016\",\"remarks\":\"\",\"state_id\":3,\"suppliers\":[\"15\",\"475\"]}','user created project (unplanned)','2016-01-21 10:13:02'),(74,129,'Request','projects',7,'{\"user_id\":\"129\",\"department_id\":\"4\",\"hotel_id\":\"4\",\"type_id\":\"3\",\"origin_id\":3,\"name\":\"main swimming pool renovation\",\"reasons\":\"water leakage at the main swimming pool\",\"EUR_EX\":\"\",\"USD_EX\":\"\",\"budget_EGP\":\"2467000\",\"budget_USD\":\"\",\"budget_EUR\":\"\",\"budget\":\"2467000\",\"remarks\":\"\",\"state_id\":0}','user created project approval request','2016-01-21 11:26:37'),(75,129,'Approve','projects',7,NULL,'user self approved','2016-01-21 11:26:38'),(76,129,'Stage','projects',7,'{\"state\":1}','project state updated','2016-01-21 11:26:38'),(77,129,'Request','projects',8,'{\"user_id\":\"129\",\"department_id\":\"4\",\"hotel_id\":\"4\",\"type_id\":\"3\",\"origin_id\":3,\"name\":\"main swimming pool renovation\",\"reasons\":\"water leakage at the main swimming pool\",\"EUR_EX\":\"\",\"USD_EX\":\"\",\"budget_EGP\":\"2467000\",\"budget_USD\":\"\",\"budget_EUR\":\"\",\"budget\":\"2467000\",\"remarks\":\"\",\"state_id\":0}','user created project approval request','2016-01-21 11:26:51'),(78,129,'Approve','projects',8,NULL,'user self approved','2016-01-21 11:26:51'),(79,129,'Stage','projects',8,'{\"state\":1}','project state updated','2016-01-21 11:26:51'),(80,129,'Notify','projects',8,'{\"to\":\"samy.nasser@sunrise-resorts.com\"}','user requested approval','2016-01-21 11:26:52'),(81,129,'Notify','projects',7,'{\"to\":\"samy.nasser@sunrise-resorts.com\"}','user requested approval','2016-01-21 11:26:56'),(82,83,'Submit','projects',1,'{\"user_id\":\"83\",\"scope\":\"main swimming pool renovation\",\"cost\":\"2467000\",\"cost_EGP\":\"2467000.00\",\"cost_USD\":\"\",\"cost_EUR\":\"\",\"start\":\"2016-01-25\",\"end\":\"2016-03-12\",\"year\":\"2016\",\"remarks\":\"\",\"state_id\":3,\"suppliers\":[\"15\",\"475\"]}','user created project (unplanned)','2016-01-21 12:13:02'),(83,83,'Create','owning_project',27,'{\"project_id\":\"1\"}','owning form created','2016-01-21 12:13:02'),(84,83,'Sign','projects',1,NULL,'user self signed','2016-01-21 12:13:02'),(85,83,'Stage','projects',1,'{\"state\":\"Purchasing\"}','project state updated, purchasing should be notified','2016-01-21 12:13:02'),(86,149,'Edit','projects',1,'{\"scope\":\"main swimming pool renovation\",\"name\":\"main swimming pool renovation\",\"type_id\":\"3\",\"reasons\":\"\\u003Cp\\u003E\\n\\twater leakage at the main swimming pool\\u003C\\/p\\u003E\",\"cost_EGP\":\"2467000\",\"cost_USD\":\"0\",\"cost_EUR\":\"0\",\"cost\":\"2467000\",\"start\":\"2016-01-25\",\"end\":\"2016-03-12\",\"remarks\":\"\",\"suppliers\":[\"15\",\"475\"]}','user edited project, signature modified','2016-01-21 12:19:31'),(87,149,'Notify','projects',1,'{\"to\":null}','Project signature notification sent','2016-01-21 12:19:32'),(88,149,'Sign','projects',1,'{\"signature_id\":\"2\"}','user signed project','2016-01-21 12:19:56'),(89,149,'Edit','projects',1,'{\"scope\":\"\\u003Cp\\u003E\\tmain swimming pool renovation\\u003C\\/p\\u003E\",\"name\":\"main swimming pool renovation\",\"type_id\":\"3\",\"reasons\":\"\\u003Cp\\u003E\\n\\twater leakage at the main swimming pool\\u003C\\/p\\u003E\",\"cost_EGP\":\"2467000\",\"cost_USD\":\"0\",\"cost_EUR\":\"0\",\"cost\":\"2467000\",\"start\":\"2016-01-25\",\"end\":\"2016-03-12\",\"remarks\":\"\",\"suppliers\":[\"15\",\"475\"]}','user edited project, signature modified','2016-01-21 12:54:36'),(90,149,'Notify','projects',1,'{\"to\":null}','Project signature notification sent','2016-01-21 12:54:48'),(91,73,'Submit','projects',4,'{\"user_id\":\"73\",\"scope\":\"New (2)hot water pumps\",\"cost\":\"25000\",\"cost_EGP\":\"25000\",\"cost_USD\":\"\",\"cost_EUR\":\"\",\"start\":\"2016-01-21\",\"end\":\"2016-02-07\",\"year\":\"2016\",\"remarks\":\"\",\"state_id\":3,\"suppliers\":false}','user created project (unplanned)','2016-01-21 13:29:01'),(92,73,'Create','owning_project',28,'{\"project_id\":\"4\"}','owning form created','2016-01-21 13:29:01'),(93,73,'Sign','projects',4,NULL,'user self signed','2016-01-21 13:29:01'),(94,73,'Stage','projects',4,'{\"state\":\"Purchasing\"}','project state updated, purchasing should be notified','2016-01-21 13:29:01'),(95,73,'Sign','projects',4,'{\"signature_id\":\"22\"}','user signed project','2016-01-21 13:29:27'),(96,59,'Approve','projects',5,'{\"approval_id\":\"19\"}','user signed approval','2016-01-23 09:57:20'),(97,59,'Notify','projects',5,'{\"to\":\"hazim.elshamy@sunrise-resorts.com\"}','user requested approval','2016-01-23 09:58:19'),(98,3,'Approve','projects',5,'{\"approval_id\":\"20\"}','user signed approval','2016-01-23 11:22:11'),(99,3,'Notify','projects',5,'{\"to\":\"Philippe.deVizcaya@sunrise-resorts.com\"}','user requested approval','2016-01-23 11:22:18'),(100,55,'Approve','projects',5,'{\"approval_id\":\"21\"}','user signed approval','2016-01-23 11:26:26'),(101,115,'Request','projects',9,'{\"user_id\":\"115\",\"department_id\":\"12\",\"hotel_id\":\"22\",\"type_id\":\"1\",\"origin_id\":3,\"name\":\"Sundeck tanda\",\"reasons\":\"Sundeck tanda is very old and exhausted since many years and to avoide the guests complains\",\"EUR_EX\":\"\",\"USD_EX\":\"\",\"budget_EGP\":\"8932.5\",\"budget_USD\":\"\",\"budget_EUR\":\"\",\"budget\":\"8932.5\",\"remarks\":\"We needed this tande urgently due to the boat will be in operation this week and befor mid year vacation\",\"state_id\":0}','user created project approval request','2016-01-23 12:43:38'),(102,115,'Approve','projects',9,NULL,'user self approved','2016-01-23 12:43:38'),(103,115,'Stage','projects',9,'{\"state\":1}','project state updated','2016-01-23 12:43:38'),(104,115,'Notify','projects',9,'{\"to\":\"refaat.aboubakr@sunrise-resorts.com\"}','user requested approval','2016-01-23 12:43:40'),(105,115,'Approve','projects',9,'{\"approval_id\":\"39\"}','user signed approval','2016-01-24 13:22:06'),(106,115,'Notify','projects',9,'{\"to\":\"mohamed.elserwy@sunrise-resorts.com\"}','user requested approval','2016-01-24 13:22:13'),(107,157,'Offer','projects',4,'{\"offer_name\":\"DOC033.PDF\"}','user uploaded an offer','2016-01-26 08:12:16'),(108,157,'Purchasing_Edit','projects',4,'{\"cost\":\"25000\",\"cost_EGP\":\"25000\",\"cost_USD\":\"0\",\"cost_EUR\":\"0\",\"state_id\":4,\"suppliers\":[\"475\"]}','Purchasing employee visited this project, State updated to 4, signature updated accordingly','2016-01-26 08:12:20'),(109,157,'Notify','projects',4,'{\"to\":null}','Project signature notification sent','2016-01-26 08:12:21'),(110,157,'Sign','projects',4,'{\"signature_id\":\"23\"}','user signed project','2016-01-26 08:12:56'),(111,157,'Notify','projects',4,'{\"to\":null}','Project signature notification sent','2016-01-26 08:12:57'),(112,59,'Approve','projects',9,'{\"approval_id\":\"40\"}','user signed approval','2016-01-26 10:15:55'),(113,59,'Notify','projects',9,'{\"to\":\"hazim.elshamy@sunrise-resorts.com\"}','user requested approval','2016-01-26 10:15:56'),(114,1,'Request','projects',10,'{\"user_id\":\"1\",\"department_id\":\"4\",\"hotel_id\":\"5\",\"type_id\":\"1\",\"origin_id\":3,\"name\":\"tyst\",\"reasons\":\"test\",\"EUR_EX\":\"\",\"USD_EX\":\"\",\"budget_EGP\":\"100\",\"budget_USD\":\"\",\"budget_EUR\":\"\",\"budget\":\"100\",\"remarks\":\"test\",\"state_id\":0}','user created project approval request','2016-01-26 12:42:31'),(115,1,'Approve','projects',10,NULL,'user self approved','2016-01-26 12:42:31'),(116,1,'Stage','projects',10,'{\"state\":1}','project state updated','2016-01-26 12:42:32'),(117,1,'Notify','projects',10,'{\"to\":\"samy.nasser@sunrise-resorts.com\"}','user requested approval','2016-01-26 12:42:33'),(118,1,'Approve','projects',10,'{\"approval_id\":\"45\"}','user signed approval','2016-01-26 12:42:51'),(119,1,'Notify','projects',10,'{\"to\":\"hazim.elshamy@sunrise-resorts.com\"}','user requested approval','2016-01-26 12:42:52'),(120,1,'Approve','projects',10,'{\"approval_id\":\"46\"}','user signed approval','2016-01-26 12:43:15'),(121,1,'Notify','projects',10,'{\"to\":\"Philippe.deVizcaya@sunrise-resorts.com\"}','user requested approval','2016-01-26 12:43:16'),(122,1,'Approve','projects',10,'{\"approval_id\":\"47\"}','user signed approval','2016-01-26 12:43:43'),(123,1,'Notify','projects',10,'{\"to\":\"marwan.gendy@gmail.com\",\"code\":\"75E87\"}','code exists => approved. else disapproved','2016-01-26 12:43:44'),(124,1,'Stage','projects',10,'{\"state\":2}','project state updated','2016-01-26 12:43:44'),(125,1,'Submit','projects',10,'{\"user_id\":\"1\",\"scope\":\"test\",\"cost\":\"100\",\"cost_EGP\":\"100\",\"cost_USD\":\"\",\"cost_EUR\":\"\",\"start\":\"2016-01-26\",\"end\":\"2016-01-29\",\"year\":\"2016\",\"remarks\":\"test\",\"state_id\":3,\"suppliers\":[\"3\"]}','user created project (unplanned)','2016-01-26 12:44:28'),(126,1,'Create','owning_project',29,'{\"project_id\":\"10\"}','owning form created','2016-01-26 12:44:29'),(127,1,'Notify','owning_project',10,'{\"to\":null}','Project owning signature notification sent','2016-01-26 12:44:33'),(128,1,'Notify','owning_project',10,'{\"to\":null}','Project owning signature notification sent','2016-01-26 12:44:34'),(129,1,'Notify','owning_project',10,'{\"to\":null}','Project owning signature notification sent','2016-01-26 12:44:34'),(130,1,'Notify','owning_project',10,'{\"to\":null}','Project owning signature notification sent','2016-01-26 12:44:35'),(131,1,'Sign','projects',10,NULL,'user self signed','2016-01-26 12:44:36'),(132,1,'Stage','projects',10,'{\"state\":\"Purchasing\"}','project state updated, purchasing should be notified','2016-01-26 12:44:36'),(133,1,'Sign','projects',10,'{\"signature_id\":\"31\"}','user signed project','2016-01-26 12:47:59'),(134,3,'Approve','projects',9,'{\"approval_id\":\"41\"}','user signed approval','2016-01-26 13:01:03'),(135,3,'Notify','projects',9,'{\"to\":\"Philippe.deVizcaya@sunrise-resorts.com\"}','user requested approval','2016-01-26 13:01:22'),(136,55,'Approve','projects',9,'{\"approval_id\":\"42\"}','user signed approval','2016-01-26 13:32:38'),(137,167,'Reject','owning_project',10,'{\"signature_id\":\"24\"}','user rejected project','2016-01-26 14:01:53'),(138,167,'Undo','owning_project',10,'{\"signature_id\":\"24\"}','user unsigned project','2016-01-26 14:01:54'),(139,167,'Sign','owning_project',10,'{\"signature_id\":\"24\"}','user signed project','2016-01-26 14:01:55'),(140,167,'Undo','owning_project',10,'{\"signature_id\":\"24\"}','user unsigned project','2016-01-26 14:01:56'),(141,146,'Request','projects',11,'{\"user_id\":\"146\",\"department_id\":\"4\",\"hotel_id\":\"10\",\"type_id\":\"1\",\"origin_id\":3,\"name\":\"Transformer 1.5 Mega -ABB\",\"reasons\":\"As the recommendation of the Eng. consulting. to buy new transformer instead of the old one . the recommendation attached\",\"EUR_EX\":\"\",\"USD_EX\":\"\",\"budget_EGP\":\"185.000.00\",\"budget_USD\":\"\",\"budget_EUR\":\"\",\"budget\":\"NaN\",\"remarks\":\"\",\"state_id\":0}','user created project approval request','2016-01-27 10:28:39'),(142,146,'Approve','projects',11,NULL,'user self approved','2016-01-27 10:28:40'),(143,146,'Stage','projects',11,'{\"state\":1}','project state updated','2016-01-27 10:28:40'),(144,146,'Notify','projects',11,'{\"to\":\"samy.nasser@sunrise-resorts.com\"}','user requested approval','2016-01-27 10:28:41'),(145,25,'Request','projects',12,'{\"user_id\":\"25\",\"department_id\":\"4\",\"hotel_id\":\"1\",\"type_id\":\"1\",\"origin_id\":3,\"name\":\"Concrete of walkways replacement\",\"reasons\":\"to replace the concrete of walkways and increase the green area as per Chairman\'s request.\",\"EUR_EX\":\"\",\"USD_EX\":\"\",\"budget_EGP\":\"194289\",\"budget_USD\":\"\",\"budget_EUR\":\"\",\"budget\":\"194289\",\"remarks\":\"\",\"state_id\":0}','user created project approval request','2016-01-28 09:45:34'),(146,25,'Approve','projects',12,NULL,'user self approved','2016-01-28 09:45:35'),(147,25,'Stage','projects',12,'{\"state\":1}','project state updated','2016-01-28 09:45:35'),(148,25,'Notify','projects',12,'{\"to\":\"samy.nasser@sunrise-resorts.com\"}','user requested approval','2016-01-28 09:45:36'),(149,146,'Request','projects',13,'{\"user_id\":\"146\",\"department_id\":\"6\",\"hotel_id\":\"10\",\"type_id\":\"1\",\"origin_id\":3,\"name\":\"Main Restaurant Kitchen tools\",\"reasons\":\"Main Restaurant need new Kitchen tools\",\"EUR_EX\":\"\",\"USD_EX\":\"\",\"budget_EGP\":\"58517.005\",\"budget_USD\":\"\",\"budget_EUR\":\"\",\"budget\":\"58517.005\",\"remarks\":\"\",\"state_id\":0}','user created project approval request','2016-01-28 11:57:42'),(150,146,'Approve','projects',13,NULL,'user self approved','2016-01-28 11:57:42'),(151,146,'Stage','projects',13,'{\"state\":1}','project state updated','2016-01-28 11:57:42'),(152,146,'Notify','projects',13,'{\"to\":\"samy.nasser@sunrise-resorts.com\"}','user requested approval','2016-01-28 11:57:43'),(153,167,'Reject','owning_project',10,'{\"signature_id\":\"24\"}','user rejected project','2016-01-28 13:46:39'),(154,167,'Undo','owning_project',10,'{\"signature_id\":\"24\"}','user unsigned project','2016-01-28 13:47:02'),(155,167,'Reject','owning_project',10,'{\"signature_id\":\"24\"}','user rejected project','2016-01-28 13:49:07'),(156,165,'Reject','owning_project',10,'{\"signature_id\":\"26\"}','user rejected project','2016-01-28 13:51:26'),(157,165,'Undo','owning_project',10,'{\"signature_id\":\"26\"}','user unsigned project','2016-01-28 13:57:07'),(158,167,'Undo','owning_project',10,'{\"signature_id\":\"24\"}','user unsigned project','2016-01-28 17:40:41'),(159,167,'Sign','owning_project',10,'{\"signature_id\":\"24\"}','user signed project','2016-01-28 17:40:42'),(160,167,'Undo','owning_project',10,'{\"signature_id\":\"24\"}','user unsigned project','2016-01-28 17:40:44'),(161,115,'Request','projects',14,'{\"user_id\":\"115\",\"department_id\":\"4\",\"hotel_id\":\"24\",\"type_id\":\"1\",\"origin_id\":3,\"name\":\"\\u0634\\u0631\\u0627\\u0621 \\u0628\\u0637\\u0627\\u0631\\u064a\\u0627\\u062a\",\"reasons\":\"\\u0644\\u0632\\u0648\\u0645 \\u062a\\u0634\\u063a\\u064a\\u0644 \\u0627\\u0644\\u0645\\u062d\\u0631\\u0643\\u0627\\u062a \\u062d\\u064a\\u062b \\u0627\\u0644\\u0628\\u0637\\u0627\\u0631\\u064a\\u0627\\u062a \\u0627\\u0644\\u0642\\u062f\\u064a\\u0645\\u0629 \\u063a\\u064a\\u0631 \\u0642\\u0627\\u062f\\u0631\\u0629 \\u0639\\u0644\\u0649 \\u062a\\u0634\\u063a\\u064a\\u0644 \\u0627\\u0644\\u0645\\u062d\\u0631\\u0643\\u0627\\u062a \\u0648\\u062a\\u0639\\u062f\\u0649 \\u0639\\u0645\\u0631\\u0647\\u0627 \\u0627\\u0644\\u0627\\u0641\\u062a\\u0631\\u0627\\u0636\\u0649\",\"EUR_EX\":\"\",\"USD_EX\":\"\",\"budget_EGP\":\"3200\",\"budget_USD\":\"\",\"budget_EUR\":\"\",\"budget\":\"3200\",\"remarks\":\"\\u064a\\u062c\\u0628 \\u062a\\u063a\\u064a\\u0631 \\u0627\\u0644\\u0628\\u0637\\u0627\\u0631\\u064a\\u0627\\u062a \\u0648\\u0630\\u0644\\u0643 \\u0644\\u0639\\u062f\\u0645 \\u0642\\u062f\\u0631\\u062a\\u0647\\u0627 \\u0639\\u0644\\u0649 \\u062a\\u0634\\u063a\\u064a\\u0644 \\u0627\\u0644\\u0645\\u062d\\u0631\\u0643\\u0627\\u062a \\u0648\\u0627\\u0646\\u062a\\u0647\\u0627\\u0621 \\u0639\\u0645\\u0631\\u0647\\u0627 \\u0627\\u0644\\u0627\\u0641\\u062a\\u0631\\u0627\\u0636\\u0649 \\u0648\\u0630\\u0644\\u0643 \\u0644\\u0645\\u062d\\u0627\\u0641\\u0638\\u0647 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u062a\\u0627\\u0643\\u064a\\u062f \\u0645\\u0646 \\u0639\\u0645\\u0644 \\u062f\\u0648\\u0627\\u0626\\u0631 \\u0627\\u0644\\u062d\\u0645\\u0627\\u064a\\u0647 \\u0644\\u0644\\u0645\\u062d\\u0631\\u0643\\u0627\\u062a \\u0648\\u0633\\u0644\\u0627\\u0645\\u0647 \\u0627\\u0644\\u0628\\u0627\\u062e\\u0631\\u0629\",\"state_id\":0}','user created project approval request','2016-01-29 14:52:55'),(162,115,'Approve','projects',14,NULL,'user self approved','2016-01-29 14:52:56'),(163,115,'Stage','projects',14,'{\"state\":1}','project state updated','2016-01-29 14:52:56'),(164,115,'Notify','projects',14,'{\"to\":\"refaat.aboubakr@sunrise-resorts.com\",\"code\":\"E757E\"}','code exists => approved. else disapproved','2016-01-29 14:52:57'),(165,115,'Stage','projects',14,'{\"state\":2}','project state updated','2016-01-29 14:52:57'),(166,115,'Submit','projects',14,'{\"user_id\":\"115\",\"scope\":\"\\u0644\\u0632\\u0648\\u0645 \\u062a\\u0634\\u063a\\u064a\\u0644 \\u0627\\u0644\\u0645\\u062d\\u0631\\u0643\\u0627\\u062a\",\"cost\":\"\",\"cost_EGP\":\"\",\"cost_USD\":\"\",\"cost_EUR\":\"\",\"start\":\"1\\/1\\/2016\",\"end\":\"20\\/1\\/2016\",\"year\":\"2016\",\"remarks\":\"\\u064a\\u062c\\u0628 \\u062a\\u063a\\u064a\\u0631 \\u0627\\u0644\\u0628\\u0637\\u0627\\u0631\\u064a\\u0627\\u062a \\u0648\\u0630\\u0644\\u0643 \\u0644\\u0639\\u062f\\u0645 \\u0642\\u062f\\u0631\\u062a\\u0647\\u0627 \\u0639\\u0644\\u0649 \\u062a\\u0634\\u063a\\u064a\\u0644 \\u0627\\u0644\\u0645\\u062d\\u0631\\u0643\\u0627\\u062a \\u0648\\u0627\\u0646\\u062a\\u0647\\u0627\\u0621 \\u0639\\u0645\\u0631\\u0647\\u0627 \\u0627\\u0644\\u0627\\u0641\\u062a\\u0631\\u0627\\u0636\\u0649 \\u0648\\u0630\\u0644\\u0643 \\u0644\\u0645\\u062d\\u0627\\u0641\\u0638\\u0647 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u062a\\u0627\\u0643\\u064a\\u062f \\u0645\\u0646 \\u0639\\u0645\\u0644 \\u062f\\u0648\\u0627\\u0626\\u0631 \\u0627\\u0644\\u062d\\u0645\\u0627\\u064a\\u0647 \\u0644\\u0644\\u0645\\u062d\\u0631\\u0643\\u0627\\u062a \\u0648\\u0633\\u0644\\u0627\\u0645\\u0647 \\u0627\\u0644\\u0628\\u0627\\u062e\\u0631\\u0629\",\"state_id\":3,\"suppliers\":false}','user created project (unplanned)','2016-01-29 14:58:13'),(167,115,'Create','owning_project',30,'{\"project_id\":\"14\"}','owning form created','2016-01-29 14:58:14'),(168,115,'Sign','projects',14,NULL,'user self signed','2016-01-29 14:58:14'),(169,115,'Stage','projects',14,'{\"state\":\"Purchasing\"}','project state updated, purchasing should be notified','2016-01-29 14:58:14'),(170,115,'Edit','projects',14,'{\"scope\":\"\\u0644\\u0632\\u0648\\u0645 \\u062a\\u0634\\u063a\\u064a\\u0644 \\u0627\\u0644\\u0645\\u062d\\u0631\\u0643\\u0627\\u062a\",\"name\":\"\\u0634\\u0631\\u0627\\u0621 \\u0628\\u0637\\u0627\\u0631\\u064a\\u0627\\u062a\",\"type_id\":\"1\",\"reasons\":\"\\u0644\\u0632\\u0648\\u0645 \\u062a\\u0634\\u063a\\u064a\\u0644 \\u0627\\u0644\\u0645\\u062d\\u0631\\u0643\\u0627\\u062a \\u062d\\u064a\\u062b \\u0627\\u0644\\u0628\\u0637\\u0627\\u0631\\u064a\\u0627\\u062a \\u0627\\u0644\\u0642\\u062f\\u064a\\u0645\\u0629 \\u063a\\u064a\\u0631 \\u0642\\u0627\\u062f\\u0631\\u0629 \\u0639\\u0644\\u0649 \\u062a\\u0634\\u063a\\u064a\\u0644 \\u0627\\u0644\\u0645\\u062d\\u0631\\u0643\\u0627\\u062a \\u0648\\u062a\\u0639\\u062f\\u0649 \\u0639\\u0645\\u0631\\u0647\\u0627 \\u0627\\u0644\\u0627\\u0641\\u062a\\u0631\\u0627\\u0636\\u0649\",\"cost_EGP\":\"0\",\"cost_USD\":\"0\",\"cost_EUR\":\"0\",\"cost\":\"0\",\"start\":\"17\\/1\\/2016\",\"end\":\"28\\/1\\/2016\",\"remarks\":\"\\u064a\\u062c\\u0628 \\u062a\\u063a\\u064a\\u0631 \\u0627\\u0644\\u0628\\u0637\\u0627\\u0631\\u064a\\u0627\\u062a \\u0648\\u0630\\u0644\\u0643 \\u0644\\u0639\\u062f\\u0645 \\u0642\\u062f\\u0631\\u062a\\u0647\\u0627 \\u0639\\u0644\\u0649 \\u062a\\u0634\\u063a\\u064a\\u0644 \\u0627\\u0644\\u0645\\u062d\\u0631\\u0643\\u0627\\u062a \\u0648\\u0627\\u0646\\u062a\\u0647\\u0627\\u0621 \\u0639\\u0645\\u0631\\u0647\\u0627 \\u0627\\u0644\\u0627\\u0641\\u062a\\u0631\\u0627\\u0636\\u0649 \\u0648\\u0630\\u0644\\u0643 \\u0644\\u0645\\u062d\\u0627\\u0641\\u0638\\u0647 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u062a\\u0627\\u0643\\u064a\\u062f \\u0645\\u0646 \\u0639\\u0645\\u0644 \\u062f\\u0648\\u0627\\u0626\\u0631 \\u0627\\u0644\\u062d\\u0645\\u0627\\u064a\\u0647 \\u0644\\u0644\\u0645\\u062d\\u0631\\u0643\\u0627\\u062a \\u0648\\u0633\\u0644\\u0627\\u0645\\u0647 \\u0627\\u0644\\u0628\\u0627\\u062e\\u0631\\u0629\",\"suppliers\":false}','user edited project, signature modified','2016-01-29 15:03:18'),(171,115,'Notify','projects',14,'{\"to\":null}','Project signature notification sent','2016-01-29 15:03:19'),(172,115,'Request','projects',15,'{\"user_id\":\"115\",\"department_id\":\"4\",\"hotel_id\":\"20\",\"type_id\":\"1\",\"origin_id\":3,\"name\":\"\\u0634\\u0631\\u0627\\u0621 \\u064a\\u0637\\u0627\\u0631\\u064a\\u0627\\u062a\",\"reasons\":\"\\u0644\\u0632\\u0648\\u0645 \\u062a\\u0634\\u063a\\u064a\\u0644 \\u0627\\u0644\\u0645\\u062d\\u0631\\u0643\\u0627\\u062a \\u0648\\u0639\\u062f\\u0645 \\u0642\\u062f\\u0631\\u0629 \\u0627\\u0644\\u0628\\u0637\\u0627\\u0631\\u064a\\u0627\\u062a \\u0627\\u0644\\u0642\\u062f\\u064a\\u0645\\u0647 \\u0639\\u0644\\u0649 \\u062a\\u0634\\u063a\\u064a\\u0644 \\u0627\\u0644\\u0645\\u062d\\u0631\\u0643\\u0627\\u062a \\u0648\\u0627\\u0646\\u062a\\u0647\\u0627\\u0621 \\u0639\\u0645\\u0631\\u0647\\u0627 \\u0627\\u0644\\u0627\\u0641\\u062a\\u0631\\u0627\\u0636\\u0649\",\"EUR_EX\":\"\",\"USD_EX\":\"\",\"budget_EGP\":\"6400\",\"budget_USD\":\"\",\"budget_EUR\":\"\",\"budget\":\"6400\",\"remarks\":\"\",\"state_id\":0}','user created project approval request','2016-01-29 15:25:42'),(173,115,'Approve','projects',15,NULL,'user self approved','2016-01-29 15:25:43'),(174,115,'Stage','projects',15,'{\"state\":1}','project state updated','2016-01-29 15:25:43'),(175,115,'Notify','projects',15,'{\"to\":\"refaat.aboubakr@sunrise-resorts.com\"}','user requested approval','2016-01-29 15:25:55'),(176,115,'Approve','projects',15,'{\"approval_id\":\"69\"}','user signed approval','2016-01-29 15:26:23'),(177,115,'Approve','projects',14,'{\"approval_id\":\"62\"}','user signed approval','2016-01-29 15:27:14'),(178,115,'Notify','projects',14,'{\"to\":\"mohamed.elserwy@sunrise-resorts.com\"}','user requested approval','2016-01-29 15:27:16'),(179,25,'Request','projects',16,'{\"user_id\":\"25\",\"department_id\":\"4\",\"hotel_id\":\"2\",\"type_id\":\"1\",\"origin_id\":3,\"name\":\"Guest rooms renovation (annex)\",\"reasons\":\"To renew guestrooms\",\"EUR_EX\":\"\",\"USD_EX\":\"\",\"budget_EGP\":\"394122\",\"budget_USD\":\"\",\"budget_EUR\":\"\",\"budget\":\"394122\",\"remarks\":\"\",\"state_id\":0}','user created project approval request','2016-01-30 16:25:44'),(180,25,'Approve','projects',16,NULL,'user self approved','2016-01-30 16:25:44'),(181,25,'Stage','projects',16,'{\"state\":1}','project state updated','2016-01-30 16:25:44'),(182,25,'Notify','projects',16,'{\"to\":\"samy.nasser@sunrise-resorts.com\"}','user requested approval','2016-01-30 16:25:45'),(183,129,'Request','projects',17,'{\"user_id\":\"129\",\"department_id\":\"13\",\"hotel_id\":\"4\",\"type_id\":\"1\",\"origin_id\":3,\"name\":\"Maintain the Wind breaker\",\"reasons\":\"Maintain the wind breaker\",\"EUR_EX\":\"\",\"USD_EX\":\"\",\"budget_EGP\":\"101000\",\"budget_USD\":\"\",\"budget_EUR\":\"\",\"budget\":\"101000\",\"remarks\":\"\",\"state_id\":0}','user created project approval request','2016-01-31 10:12:43'),(184,129,'Approve','projects',17,NULL,'user self approved','2016-01-31 10:12:43'),(185,129,'Stage','projects',17,'{\"state\":1}','project state updated','2016-01-31 10:12:43'),(186,129,'Notify','projects',17,'{\"to\":\"samy.nasser@sunrise-resorts.com\"}','user requested approval','2016-01-31 10:12:44'),(187,129,'Request','projects',18,'{\"user_id\":\"129\",\"department_id\":\"4\",\"hotel_id\":\"4\",\"type_id\":\"1\",\"origin_id\":3,\"name\":\"New water pump for the central laundry\",\"reasons\":\"Stainless steel water pump 315 - horizontal centrifugal\",\"EUR_EX\":\"\",\"USD_EX\":\"\",\"budget_EGP\":\"17000\",\"budget_USD\":\"\",\"budget_EUR\":\"\",\"budget\":\"17000\",\"remarks\":\"\",\"state_id\":0}','user created project approval request','2016-01-31 10:21:14'),(188,129,'Approve','projects',18,NULL,'user self approved','2016-01-31 10:21:14'),(189,129,'Stage','projects',18,'{\"state\":1}','project state updated','2016-01-31 10:21:14'),(190,129,'Notify','projects',18,'{\"to\":\"samy.nasser@sunrise-resorts.com\"}','user requested approval','2016-01-31 10:21:15'),(191,59,'Approve','projects',14,'{\"approval_id\":\"65\"}','user signed approval','2016-01-31 11:55:55'),(192,59,'Notify','projects',14,'{\"to\":\"hazim.elshamy@sunrise-resorts.com\"}','user requested approval','2016-01-31 11:56:14'),(193,26,'Sign','projects',4,'{\"signature_id\":\"24\"}','user signed project','2016-01-31 11:56:37'),(194,26,'Notify','projects',4,'{\"to\":null}','Project signature notification sent','2016-01-31 11:56:38'),(195,26,'Notify','projects',4,'{\"to\":null}','Project signature notification sent','2016-01-31 11:56:39'),(196,3,'Approve','projects',14,'{\"approval_id\":\"66\"}','user signed approval','2016-01-31 13:19:43'),(197,3,'Notify','projects',14,'{\"to\":\"Philippe.deVizcaya@sunrise-resorts.com\"}','user requested approval','2016-01-31 13:20:02'),(198,55,'Approve','projects',14,'{\"approval_id\":\"67\"}','user signed approval','2016-01-31 13:27:21'),(199,115,'Request','projects',19,'{\"user_id\":\"115\",\"department_id\":\"4\",\"hotel_id\":\"22\",\"type_id\":\"1\",\"origin_id\":3,\"name\":\"\\u0634\\u0631\\u0627\\u0621 \\u064a\\u0637\\u0627\\u0631\\u064a\\u0627\\u062a\",\"reasons\":\"\\u0644\\u0632\\u0648\\u0645 \\u062a\\u0634\\u063a\\u064a\\u0644 \\u0627\\u0644\\u0645\\u062d\\u0631\\u0643\\u0627\\u062a \\u0648\\u0627\\u0644\\u0645\\u0648\\u0644\\u062f\\u0627\\u062a \\u062d\\u064a\\u062b \\u0627\\u0646 \\u0627\\u0644\\u0628\\u0637\\u0627\\u0631\\u064a\\u0627\\u062a \\u0627\\u0644\\u0642\\u062f\\u064a\\u0645\\u0647 \\u063a\\u064a\\u0631 \\u0642\\u0627\\u062f\\u0631\\u0629 \\u0639\\u0644\\u0649 \\u062a\\u0634\\u063a\\u064a\\u0644 \\u0627\\u0644\\u0645\\u062d\\u0631\\u0643\\u0627\\u062a  \\u0648\\u0627\\u0646\\u062a\\u0647\\u0627\\u0621 \\u0639\\u0645\\u0631\\u0647\\u0627 \\u0627\\u0644\\u0627\\u0641\\u062a\\u0631\\u0627\\u0636\\u0649\",\"EUR_EX\":\"\",\"USD_EX\":\"\",\"budget_EGP\":\"7240\",\"budget_USD\":\"\",\"budget_EUR\":\"\",\"budget\":\"7240\",\"remarks\":\"\\u0648\\u062c\\u0648\\u062f \\u0627\\u0644\\u0628\\u0637\\u0627\\u0631\\u064a\\u0627\\u062a \\u0627\\u0644\\u062c\\u064a\\u062f\\u0629 \\u0641\\u0649 \\u063a\\u0627\\u064a\\u0629 \\u0627\\u0644\\u0627\\u0647\\u0645\\u064a\\u0647 \\u062d\\u064a\\u062b \\u062a\\u0642\\u0648\\u0645 \\u0628\\u062a\\u0634\\u063a\\u064a\\u0644 \\u062f\\u0648\\u0627\\u0626\\u0631 \\u0627\\u0644\\u062d\\u0645\\u0627\\u064a\\u0647 \\u0627\\u0644\\u0645\\u062d\\u0631\\u0643\\u0627\\u062a\",\"state_id\":0}','user created project approval request','2016-01-31 13:56:25'),(200,115,'Approve','projects',19,NULL,'user self approved','2016-01-31 13:56:25'),(201,115,'Stage','projects',19,'{\"state\":1}','project state updated','2016-01-31 13:56:25'),(202,115,'Notify','projects',19,'{\"to\":\"refaat.aboubakr@sunrise-resorts.com\"}','user requested approval','2016-01-31 13:56:33'),(203,115,'Approve','projects',19,'{\"approval_id\":\"89\"}','user signed approval','2016-01-31 13:56:40'),(204,115,'Notify','projects',19,'{\"to\":\"mohamed.elserwy@sunrise-resorts.com\"}','user requested approval','2016-01-31 13:56:41'),(205,115,'Request','projects',20,'{\"user_id\":\"115\",\"department_id\":\"4\",\"hotel_id\":\"24\",\"type_id\":\"1\",\"origin_id\":3,\"name\":\"\\u0645\\u062a\\u0637\\u0644\\u0628\\u0627\\u062a \\u0627\\u0644\\u062f\\u0641\\u0627\\u0639 \\u0627\\u0644\\u062f\\u0641\\u0627\\u0639 \\u0627\\u0644\\u0645\\u062f\\u0646\\u0649\",\"reasons\":\"\\u0628\\u0646\\u0627\\u0621 \\u0639\\u0644\\u0649 \\u0645\\u0639\\u0627\\u064a\\u0646\\u0647 \\u0627\\u0644\\u062f\\u0641\\u0627\\u0639 \\u0627\\u0644\\u0645\\u062f\\u0646\\u0649 \\u064a\\u062c\\u0628 \\u0627\\u0644\\u0627\\u0646\\u062a\\u0647\\u0627\\u0621 \\u0645\\u0646 \\u0637\\u0644\\u0628\\u0627\\u062a \\u0627\\u0644\\u062f\\u0641\\u0627\\u0639 \\u0627\\u0644\\u062f\\u0641\\u0627\\u0639 \\u0644\\u0644\\u062d\\u0635\\u0648\\u0644 \\u0639\\u0644\\u0649 \\u0645\\u0647\\u0644\\u0647 \\u0633\\u0646\\u0647\",\"EUR_EX\":\"\",\"USD_EX\":\"\",\"budget_EGP\":\"9000\",\"budget_USD\":\"\",\"budget_EUR\":\"\",\"budget\":\"9000\",\"remarks\":\"\\u064a\\u062c\\u0628 \\u062a\\u0646\\u0641\\u064a\\u0630 \\u062a\\u0639\\u0644\\u064a\\u0645\\u0627\\u062a \\u0627\\u0644\\u062f\\u0641\\u0627\\u0639 \\u0627\\u0644\\u0645\\u062f\\u0646\\u0649 \\u0644\\u0644\\u0645\\u062d\\u0627\\u0641\\u0638\\u0647 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0628\\u0627\\u062e\\u0631\\u0629 \\u0648\\u062d\\u0635\\u0648\\u0644 \\u0639\\u0644\\u0649 \\u0645\\u0647\\u0644\\u0647 \\u0644\\u0645\\u062f\\u0629 \\u0639\\u0627\\u0645\",\"state_id\":0}','user created project approval request','2016-02-01 12:00:51'),(206,115,'Approve','projects',20,NULL,'user self approved','2016-02-01 12:00:51'),(207,115,'Stage','projects',20,'{\"state\":1}','project state updated','2016-02-01 12:00:51'),(208,115,'Notify','projects',20,'{\"to\":\"refaat.aboubakr@sunrise-resorts.com\"}','user requested approval','2016-02-01 12:00:52'),(209,115,'Approve','projects',20,'{\"approval_id\":\"95\"}','user signed approval','2016-02-01 12:01:11'),(210,115,'Notify','projects',20,'{\"to\":\"mohamed.elserwy@sunrise-resorts.com\"}','user requested approval','2016-02-01 12:01:12'),(211,115,'Request_Edit','projects',20,'{\"type_id\":\"1\",\"name\":\"\\u0645\\u062a\\u0637\\u0644\\u0628\\u0627\\u062a \\u0627\\u0644\\u062f\\u0641\\u0627\\u0639 \\u0627\\u0644\\u062f\\u0641\\u0627\\u0639 \\u0627\\u0644\\u0645\\u062f\\u0646\\u0649\",\"reasons\":\"\\u0628\\u0646\\u0627\\u0621 \\u0639\\u0644\\u0649 \\u0645\\u0639\\u0627\\u064a\\u0646\\u0647 \\u0627\\u0644\\u062f\\u0641\\u0627\\u0639 \\u0627\\u0644\\u0645\\u062f\\u0646\\u0649 \\u064a\\u062c\\u0628 \\u0627\\u0644\\u0627\\u0646\\u062a\\u0647\\u0627\\u0621 \\u0645\\u0646 \\u0637\\u0644\\u0628\\u0627\\u062a \\u0627\\u0644\\u062f\\u0641\\u0627\\u0639 \\u0627\\u0644\\u062f\\u0641\\u0627\\u0639 \\u0644\\u0644\\u062d\\u0635\\u0648\\u0644 \\u0639\\u0644\\u0649 \\u0645\\u0647\\u0644\\u0647 \\u0633\\u0646\\u0647\",\"EUR_EX\":\"0\",\"USD_EX\":\"0\",\"budget_EGP\":\"9000\",\"budget_USD\":\"0\",\"budget_EUR\":\"0\",\"budget\":\"9000\",\"remarks\":\"\\u064a\\u062c\\u0628 \\u062a\\u0646\\u0641\\u064a\\u0630 \\u062a\\u0639\\u0644\\u064a\\u0645\\u0627\\u062a \\u0627\\u0644\\u062f\\u0641\\u0627\\u0639 \\u0627\\u0644\\u0645\\u062f\\u0646\\u0649 \\u0644\\u0644\\u0645\\u062d\\u0627\\u0641\\u0638\\u0647 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0628\\u0627\\u062e\\u0631\\u0629 \\u0648\\u062d\\u0635\\u0648\\u0644 \\u0639\\u0644\\u0649 \\u0645\\u0647\\u0644\\u0647 \\u0644\\u0645\\u062f\\u0629 \\u0639\\u0627\\u0645\"}','user edited project approval request','2016-02-01 12:02:05'),(212,115,'Request_Edit','projects',20,'{\"type_id\":\"1\",\"name\":\"\\u0645\\u062a\\u0637\\u0644\\u0628\\u0627\\u062a \\u0627\\u0644\\u062f\\u0641\\u0627\\u0639 \\u0627\\u0644\\u062f\\u0641\\u0627\\u0639 \\u0627\\u0644\\u0645\\u062f\\u0646\\u0649\",\"reasons\":\"\\u0628\\u0646\\u0627\\u0621 \\u0639\\u0644\\u0649 \\u0645\\u0639\\u0627\\u064a\\u0646\\u0647 \\u0627\\u0644\\u062f\\u0641\\u0627\\u0639 \\u0627\\u0644\\u0645\\u062f\\u0646\\u0649 \\u064a\\u062c\\u0628 \\u0627\\u0644\\u0627\\u0646\\u062a\\u0647\\u0627\\u0621 \\u0645\\u0646 \\u0637\\u0644\\u0628\\u0627\\u062a \\u0627\\u0644\\u062f\\u0641\\u0627\\u0639 \\u0627\\u0644\\u062f\\u0641\\u0627\\u0639 \\u0644\\u0644\\u062d\\u0635\\u0648\\u0644 \\u0639\\u0644\\u0649 \\u0645\\u0647\\u0644\\u0647 \\u0633\\u0646\\u0647\",\"EUR_EX\":\"0\",\"USD_EX\":\"0\",\"budget_EGP\":\"9000\",\"budget_USD\":\"0\",\"budget_EUR\":\"0\",\"budget\":\"9000\",\"remarks\":\"\\u064a\\u062c\\u0628 \\u062a\\u0646\\u0641\\u064a\\u0630 \\u062a\\u0639\\u0644\\u064a\\u0645\\u0627\\u062a \\u0627\\u0644\\u062f\\u0641\\u0627\\u0639 \\u0627\\u0644\\u0645\\u062f\\u0646\\u0649 \\u0644\\u0644\\u0645\\u062d\\u0627\\u0641\\u0638\\u0647 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0628\\u0627\\u062e\\u0631\\u0629 \\u0648\\u062d\\u0635\\u0648\\u0644 \\u0639\\u0644\\u0649 \\u0645\\u0647\\u0644\\u0647 \\u0644\\u0645\\u062f\\u0629 \\u0639\\u0627\\u0645\"}','user edited project approval request','2016-02-01 12:03:22'),(213,115,'Request_Edit','projects',20,'{\"type_id\":\"1\",\"name\":\"\\u0645\\u062a\\u0637\\u0644\\u0628\\u0627\\u062a \\u0627\\u0644\\u062f\\u0641\\u0627\\u0639 \\u0627\\u0644\\u062f\\u0641\\u0627\\u0639 \\u0627\\u0644\\u0645\\u062f\\u0646\\u0649\",\"reasons\":\"\\u0628\\u0646\\u0627\\u0621 \\u0639\\u0644\\u0649 \\u0645\\u0639\\u0627\\u064a\\u0646\\u0647 \\u0627\\u0644\\u062f\\u0641\\u0627\\u0639 \\u0627\\u0644\\u0645\\u062f\\u0646\\u0649 \\u064a\\u062c\\u0628 \\u0627\\u0644\\u0627\\u0646\\u062a\\u0647\\u0627\\u0621 \\u0645\\u0646 \\u0637\\u0644\\u0628\\u0627\\u062a \\u0627\\u0644\\u062f\\u0641\\u0627\\u0639 \\u0627\\u0644\\u062f\\u0641\\u0627\\u0639 \\u0644\\u0644\\u062d\\u0635\\u0648\\u0644 \\u0639\\u0644\\u0649 \\u0645\\u0647\\u0644\\u0647 \\u0633\\u0646\\u0647\",\"EUR_EX\":\"0\",\"USD_EX\":\"0\",\"budget_EGP\":\"9000\",\"budget_USD\":\"0\",\"budget_EUR\":\"0\",\"budget\":\"9000\",\"remarks\":\"\\u064a\\u062c\\u0628 \\u062a\\u0646\\u0641\\u064a\\u0630 \\u062a\\u0639\\u0644\\u064a\\u0645\\u0627\\u062a \\u0627\\u0644\\u062f\\u0641\\u0627\\u0639 \\u0627\\u0644\\u0645\\u062f\\u0646\\u0649 \\u0644\\u0644\\u0645\\u062d\\u0627\\u0641\\u0638\\u0647 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0628\\u0627\\u062e\\u0631\\u0629 \\u0648\\u062d\\u0635\\u0648\\u0644 \\u0639\\u0644\\u0649 \\u0645\\u0647\\u0644\\u0647 \\u0644\\u0645\\u062f\\u0629 \\u0639\\u0627\\u0645\"}','user edited project approval request','2016-02-01 12:05:58'),(214,115,'Request','projects',21,'{\"user_id\":\"115\",\"department_id\":\"4\",\"hotel_id\":\"25\",\"type_id\":\"1\",\"origin_id\":3,\"name\":\"\\u0645\\u062a\\u0637\\u0644\\u0644\\u0628\\u0627\\u062a \\u0627\\u0644\\u062f\\u0641\\u0627\\u0639 \\u0627\\u0644\\u0645\\u062f\\u0646\\u0649\",\"reasons\":\"\\u0628\\u0646\\u0627\\u0621 \\u0639\\u0644\\u0649 \\u0645\\u0639\\u0627\\u064a\\u0646\\u0647 \\u0627\\u0644\\u062f\\u0641\\u0627\\u0639 \\u0627\\u0644\\u0645\\u062f\\u0646\\u0649 \\u064a\\u062c\\u0628 \\u0627\\u0644\\u0627\\u0646\\u062a\\u0647\\u0627\\u0621 \\u0645\\u0646 \\u0645\\u062a\\u0637\\u0644\\u0628\\u0627\\u062a \\u0648\\u0644\\u062d\\u0635\\u0648\\u0644 \\u0639\\u0644\\u0649 \\u0645\\u0647\\u0644\\u0647 \\u0633\\u0646\\u0647\",\"EUR_EX\":\"\",\"USD_EX\":\"\",\"budget_EGP\":\"8700\",\"budget_USD\":\"\",\"budget_EUR\":\"\",\"budget\":\"8700\",\"remarks\":\"\\u064a\\u062c\\u0628 \\u062a\\u0646\\u0641\\u064a\\u0630 \\u062a\\u0639\\u0644\\u064a\\u0645\\u0627\\u062a \\u0627\\u0644\\u062f\\u0641\\u0627\\u0639 \\u0627\\u0644\\u0645\\u062f\\u0646\\u0649 \\u0644\\u0644\\u0645\\u062d\\u0627\\u0641\\u0638\\u0647 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0628\\u0627\\u062e\\u0631\\u0629 \\u0648\\u0644\\u062d\\u0635\\u0648\\u0644\\u0647 \\u0639\\u0644\\u0649 \\u0645\\u0647\\u0644\\u0647 \\u0633\\u0646\\u0647\",\"state_id\":0}','user created project approval request','2016-02-01 12:25:15'),(215,115,'Approve','projects',21,NULL,'user self approved','2016-02-01 12:25:16'),(216,115,'Stage','projects',21,'{\"state\":1}','project state updated','2016-02-01 12:25:16'),(217,115,'Notify','projects',21,'{\"to\":\"refaat.aboubakr@sunrise-resorts.com\"}','user requested approval','2016-02-01 12:25:16'),(218,115,'Approve','projects',21,'{\"approval_id\":\"101\"}','user signed approval','2016-02-01 12:25:22'),(219,115,'Notify','projects',21,'{\"to\":\"mohamed.elserwy@sunrise-resorts.com\"}','user requested approval','2016-02-01 12:25:23'),(220,115,'Request_Edit','projects',21,'{\"type_id\":\"1\",\"name\":\"\\u0645\\u062a\\u0637\\u0644\\u0644\\u0628\\u0627\\u062a \\u0627\\u0644\\u062f\\u0641\\u0627\\u0639 \\u0627\\u0644\\u0645\\u062f\\u0646\\u0649\",\"reasons\":\"\\u0628\\u0646\\u0627\\u0621 \\u0639\\u0644\\u0649 \\u0645\\u0639\\u0627\\u064a\\u0646\\u0647 \\u0627\\u0644\\u062f\\u0641\\u0627\\u0639 \\u0627\\u0644\\u0645\\u062f\\u0646\\u0649 \\u064a\\u062c\\u0628 \\u0627\\u0644\\u0627\\u0646\\u062a\\u0647\\u0627\\u0621 \\u0645\\u0646 \\u0645\\u062a\\u0637\\u0644\\u0628\\u0627\\u062a \\u0648\\u0644\\u062d\\u0635\\u0648\\u0644 \\u0639\\u0644\\u0649 \\u0645\\u0647\\u0644\\u0647 \\u0633\\u0646\\u0647\",\"EUR_EX\":\"0\",\"USD_EX\":\"0\",\"budget_EGP\":\"8700\",\"budget_USD\":\"0\",\"budget_EUR\":\"0\",\"budget\":\"8700\",\"remarks\":\"\\u064a\\u062c\\u0628 \\u062a\\u0646\\u0641\\u064a\\u0630 \\u062a\\u0639\\u0644\\u064a\\u0645\\u0627\\u062a \\u0627\\u0644\\u062f\\u0641\\u0627\\u0639 \\u0627\\u0644\\u0645\\u062f\\u0646\\u0649 \\u0644\\u0644\\u0645\\u062d\\u0627\\u0641\\u0638\\u0647 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0628\\u0627\\u062e\\u0631\\u0629 \\u0648\\u0644\\u062d\\u0635\\u0648\\u0644\\u0647 \\u0639\\u0644\\u0649 \\u0645\\u0647\\u0644\\u0647 \\u0633\\u0646\\u0647\"}','user edited project approval request','2016-02-01 12:56:51'),(221,4,'Approve','projects',12,'{\"approval_id\":\"53\"}','user signed approval','2016-02-01 14:18:35'),(222,4,'Notify','projects',12,'{\"to\":\"hazim.elshamy@sunrise-resorts.com\"}','user requested approval','2016-02-01 14:18:36'),(223,4,'Request_Edit','projects',12,'{\"type_id\":\"1\",\"name\":\"Concrete of walkways replacement\",\"reasons\":\"to replace the concrete of walkways and increase the green area as per Chairman\'s request.\",\"EUR_EX\":\"0\",\"USD_EX\":\"0\",\"budget_EGP\":\"194289\",\"budget_USD\":\"0\",\"budget_EUR\":\"0\",\"budget\":\"194289\",\"remarks\":\"\"}','user edited project approval request','2016-02-01 14:19:16'),(224,3,'Approve','projects',12,'{\"approval_id\":\"54\"}','user signed approval','2016-02-01 15:28:59'),(225,3,'Notify','projects',12,'{\"to\":\"Philippe.deVizcaya@sunrise-resorts.com\"}','user requested approval','2016-02-01 15:29:00'),(226,55,'Approve','projects',12,'{\"approval_id\":\"55\"}','user signed approval','2016-02-01 15:47:00'),(227,55,'Notify','projects',12,'{\"to\":\"chairman@sunrise-resorts.com\"}','user requested approval','2016-02-01 15:47:03'),(228,2,'Approve','projects',12,'{\"approval_id\":\"56\"}','user signed approval','2016-02-03 10:13:58'),(229,2,'Notify','projects',12,'{\"to\":\"gouda.ramadan@sunrise-resorts.com\",\"code\":\"5D1C2\"}','code exists => approved. else disapproved','2016-02-03 10:13:59'),(230,2,'Stage','projects',12,'{\"state\":2}','project state updated','2016-02-03 10:13:59'),(231,97,'Submit','projects',12,'{\"user_id\":\"97\",\"scope\":\"Two weeks\",\"cost\":\"\",\"cost_EGP\":\"\",\"cost_USD\":\"\",\"cost_EUR\":\"\",\"start\":\"2016-02-10\",\"end\":\"2016-02-25\",\"year\":\"2016\",\"remarks\":\"\",\"state_id\":3,\"suppliers\":false}','user created project (unplanned)','2016-02-03 11:09:27'),(232,97,'Create','owning_project',31,'{\"project_id\":\"12\"}','owning form created','2016-02-03 11:09:28'),(233,97,'Sign','projects',12,NULL,'user self signed','2016-02-03 11:09:28'),(234,97,'Stage','projects',12,'{\"state\":\"Purchasing\"}','project state updated, purchasing should be notified','2016-02-03 11:09:28'),(235,97,'Sign','projects',12,'{\"signature_id\":\"41\"}','user signed project','2016-02-03 11:09:38'),(236,1,'Edit','projects',12,'{\"scope\":\"Two weeks\",\"name\":\"Concrete of walkways replacement\",\"type_id\":\"1\",\"reasons\":\"to replace the concrete of walkways and increase the green area as per Chairman\'s request.\",\"cost_EGP\":\"0\",\"cost_USD\":\"0\",\"cost_EUR\":\"0\",\"cost\":\"0\",\"start\":\"2016-02-10\",\"end\":\"2016-02-25\",\"remarks\":\"\",\"suppliers\":[\"799\"]}','user edited project, signature modified','2016-02-03 11:40:40'),(237,1,'Notify','projects',12,'{\"to\":null}','Project signature notification sent','2016-02-03 11:40:41'),(238,152,'Purchasing_Edit','projects',12,'{\"cost\":\"0\",\"cost_EGP\":\"0\",\"cost_USD\":\"0\",\"cost_EUR\":\"0\",\"state_id\":4,\"suppliers\":[\"799\"]}','Purchasing employee visited this project, State updated to 4, signature updated accordingly','2016-02-03 14:45:19'),(239,152,'Notify','projects',12,'{\"to\":null}','Project signature notification sent','2016-02-03 14:45:21'),(240,152,'Sign','projects',12,'{\"signature_id\":\"42\"}','user signed project','2016-02-03 14:45:38'),(241,152,'Notify','projects',12,'{\"to\":null}','Project signature notification sent','2016-02-03 14:45:39'),(242,152,'Undo','projects',12,'{\"signature_id\":\"42\"}','user unsigned project','2016-02-04 08:30:14'),(243,152,'Stage','projects',12,'{\"state_id\":4}','project state forced','2016-02-04 08:30:14'),(244,152,'Purchasing_Edit','projects',12,'{\"cost\":\"193892\",\"cost_EGP\":\"193892\",\"cost_USD\":\"0\",\"cost_EUR\":\"0\",\"state_id\":4,\"suppliers\":[\"799\"]}','Purchasing employee visited this project, State updated to 4, signature updated accordingly','2016-02-04 08:32:53'),(245,152,'Notify','projects',12,'{\"to\":null}','Project signature notification sent','2016-02-04 08:32:57'),(246,152,'Purchasing_Edit','projects',12,'{\"cost\":\"193892\",\"cost_EGP\":\"193892\",\"cost_USD\":\"0\",\"cost_EUR\":\"0\",\"state_id\":4,\"suppliers\":[\"309\",\"548\",\"799\"]}','Purchasing employee visited this project, State updated to 4, signature updated accordingly','2016-02-04 08:34:35'),(247,152,'Notify','projects',12,'{\"to\":null}','Project signature notification sent','2016-02-04 08:34:36'),(248,152,'Sign','projects',12,'{\"signature_id\":\"42\"}','user signed project','2016-02-04 08:34:47'),(249,152,'Notify','projects',12,'{\"to\":null}','Project signature notification sent','2016-02-04 08:34:48'),(250,152,'Purchasing_Edit','projects',12,'{\"cost\":\"193892\",\"cost_EGP\":\"193892\",\"cost_USD\":\"0\",\"cost_EUR\":\"0\",\"state_id\":4,\"suppliers\":[\"309\",\"548\",\"799\"]}','Purchasing employee visited this project, State updated to 4, signature updated accordingly','2016-02-04 08:36:35'),(251,152,'Notify','projects',12,'{\"to\":null}','Project signature notification sent','2016-02-04 08:36:36'),(252,152,'Offer','projects',12,'{\"offer_name\":\"\\u0627\\u062c\\u0645\\u0627\\u0644\\u0649_\\u0627\\u0644\\u0645\\u0634\\u0631\\u0648\\u0639.PDF\"}','user uploaded an offer','2016-02-04 08:37:57'),(253,152,'Offer','projects',12,'{\"offer_name\":\"\\u0627\\u0639\\u0645\\u0627\\u0644_\\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0627\\u0621.PDF\"}','user uploaded an offer','2016-02-04 08:38:14'),(254,152,'Offer','projects',12,'{\"offer_name\":\"\\u0632\\u0631\\u0627\\u0639\\u06291.PDF\"}','user uploaded an offer','2016-02-04 08:38:26'),(255,152,'Offer','projects',12,'{\"offer_name\":\"\\u0634\\u0628\\u0643\\u0629_\\u0627\\u0644\\u0631\\u06491.PDF\"}','user uploaded an offer','2016-02-04 08:38:40'),(256,152,'Offer','projects',12,'{\"offer_name\":\"\\u0645\\u0642\\u0627\\u0631\\u0646\\u0629_\\u0646\\u0647\\u0627\\u0626\\u064a\\u0629_\\u0644\\u0644\\u0645\\u0634\\u0631\\u0648\\u0639_\\u0627\\u0644\\u062a\\u0643\\u0633\\u064a\\u0631.pdf\"}','user uploaded an offer','2016-02-04 08:38:51'),(257,152,'Purchasing_Edit','projects',12,'{\"cost\":\"193892\",\"cost_EGP\":\"193892\",\"cost_USD\":\"0\",\"cost_EUR\":\"0\",\"state_id\":4,\"suppliers\":[\"309\",\"548\",\"799\"]}','Purchasing employee visited this project, State updated to 4, signature updated accordingly','2016-02-04 08:39:00'),(258,152,'Notify','projects',12,'{\"to\":null}','Project signature notification sent','2016-02-04 08:39:02'),(259,26,'Sign','projects',12,'{\"signature_id\":\"43\"}','user signed project','2016-02-04 09:10:49'),(260,26,'Notify','projects',12,'{\"to\":null}','Project signature notification sent','2016-02-04 09:10:50'),(261,86,'Sign','projects',12,'{\"signature_id\":\"44\"}','user signed project','2016-02-04 09:56:36'),(262,86,'Notify','projects',12,'{\"to\":null}','Project signature notification sent','2016-02-04 09:56:37'),(263,4,'Sign','projects',12,'{\"signature_id\":\"45\"}','user signed project','2016-02-04 10:03:38'),(264,4,'Notify','projects',12,'{\"to\":null}','Project signature notification sent','2016-02-04 10:03:39'),(265,4,'Notify','projects',12,'{\"to\":null}','Project signature notification sent','2016-02-04 10:03:40'),(266,25,'Sign','projects',12,'{\"signature_id\":\"46\"}','user signed project','2016-02-04 10:29:14'),(267,25,'Notify','projects',12,'{\"to\":null}','Project signature notification sent','2016-02-04 10:29:15'),(268,3,'Sign','projects',12,'{\"signature_id\":\"47\"}','user signed project','2016-02-04 10:41:03'),(269,3,'Notify','projects',12,'{\"to\":null}','Project signature notification sent','2016-02-04 10:41:04'),(270,55,'Sign','projects',12,'{\"signature_id\":\"48\"}','user signed project','2016-02-04 15:23:54'),(271,55,'Notify','owning_project',12,'{\"to\":null}','Project owning signature notification sent','2016-02-04 15:23:56'),(272,55,'Notify','owning_project',12,'{\"to\":null}','Project owning signature notification sent','2016-02-04 15:23:57'),(273,55,'Notify','owning_project',12,'{\"to\":null}','Project owning signature notification sent','2016-02-04 15:23:58'),(274,55,'Notify','owning_project',12,'{\"to\":null}','Project owning signature notification sent','2016-02-04 15:24:00'),(275,55,'Notify','owning_project',12,'{\"to\":null}','Project owning signature notification sent','2016-02-04 15:24:02'),(276,55,'Notify','owning_project',12,'{\"to\":null}','Project owning signature notification sent','2016-02-04 15:24:03'),(277,55,'Notify','owning_project',12,'{\"to\":null}','Project owning signature notification sent','2016-02-04 15:24:04'),(278,68,'Request','projects',22,'{\"user_id\":\"68\",\"department_id\":\"4\",\"hotel_id\":\"11\",\"type_id\":\"2\",\"origin_id\":3,\"name\":\"Repair Acrylic dome Reception\",\"reasons\":\"\\u0625\\u0635\\u0644\\u0627\\u062d \\u0642\\u0628\\u0629 \\u0627\\u0644\\u0623\\u0633\\u062a\\u0642\\u0628\\u0627\\u0644 \\u0628\\u0641\\u0646\\u062f\\u0642 \\u0644\\u0648\\u062c\\u0627\\u0631\\u062f\\u0627\\u0646\",\"EUR_EX\":\"\",\"USD_EX\":\"\",\"budget_EGP\":\"36000\",\"budget_USD\":\"\",\"budget_EUR\":\"\",\"budget\":\"36000\",\"remarks\":\"\",\"state_id\":0}','user created project approval request','2016-02-06 09:32:59'),(279,68,'Approve','projects',22,NULL,'user self approved','2016-02-06 09:32:59'),(280,68,'Stage','projects',22,'{\"state\":1}','project state updated','2016-02-06 09:32:59'),(281,68,'Notify','projects',22,'{\"to\":\"samy.nasser@sunrise-resorts.com\"}','user requested approval','2016-02-06 09:33:00'),(282,59,'Approve','projects',20,'{\"approval_id\":\"96\"}','user signed approval','2016-02-06 10:10:26'),(283,59,'Notify','projects',20,'{\"to\":\"hazim.elshamy@sunrise-resorts.com\"}','user requested approval','2016-02-06 10:10:27'),(284,59,'Approve','projects',21,'{\"approval_id\":\"102\"}','user signed approval','2016-02-06 10:10:49'),(285,59,'Notify','projects',21,'{\"to\":\"hazim.elshamy@sunrise-resorts.com\"}','user requested approval','2016-02-06 10:10:50'),(286,59,'Approve','projects',19,'{\"approval_id\":\"90\"}','user signed approval','2016-02-06 10:11:06'),(287,59,'Notify','projects',19,'{\"to\":\"hazim.elshamy@sunrise-resorts.com\"}','user requested approval','2016-02-06 10:11:07'),(288,4,'Approve','projects',22,'{\"approval_id\":\"107\"}','user signed approval','2016-02-07 10:58:59'),(289,4,'Notify','projects',22,'{\"to\":\"hazim.elshamy@sunrise-resorts.com\"}','user requested approval','2016-02-07 10:59:00'),(290,83,'Edit','projects',12,'{\"scope\":\"Two weeks\",\"name\":\"Concrete of walkways replacement\",\"type_id\":\"1\",\"reasons\":\"to replace the concrete of walkways and increase the green area as per Chairman\'s request.\",\"cost_EGP\":\"193892\",\"cost_USD\":\"0\",\"cost_EUR\":\"0\",\"cost\":\"193892\",\"start\":\"2016-02-10\",\"end\":\"2016-02-25\",\"remarks\":\"\",\"suppliers\":[\"309\",\"548\",\"799\"]}','user edited project, signature modified','2016-02-08 10:10:39'),(291,83,'Notify','projects',12,'{\"to\":null}','Project signature notification sent','2016-02-08 10:10:41'),(292,83,'Notify','projects',12,'{\"to\":null}','Project signature notification sent','2016-02-08 10:10:43'),(293,146,'Request','projects',23,'{\"user_id\":\"146\",\"department_id\":\"4\",\"hotel_id\":\"10\",\"type_id\":\"1\",\"origin_id\":3,\"name\":\"shedwan lobby\",\"reasons\":\"Shedwan lobby columns\",\"EUR_EX\":\"\",\"USD_EX\":\"\",\"budget_EGP\":\"469.500.00\",\"budget_USD\":\"\",\"budget_EUR\":\"\",\"budget\":\"NaN\",\"remarks\":\"\",\"state_id\":0}','user created project approval request','2016-02-08 15:17:11'),(294,146,'Approve','projects',23,NULL,'user self approved','2016-02-08 15:17:11'),(295,146,'Stage','projects',23,'{\"state\":1}','project state updated','2016-02-08 15:17:12'),(296,146,'Notify','projects',23,'{\"to\":\"samy.nasser@sunrise-resorts.com\"}','user requested approval','2016-02-08 15:17:12'),(297,146,'Request_Edit','projects',23,'{\"type_id\":\"1\",\"name\":\"shedwan lobby\",\"reasons\":\"Shedwan lobby columns\",\"EUR_EX\":\"0\",\"USD_EX\":\"0\",\"budget_EGP\":\"469500\",\"budget_USD\":\"0\",\"budget_EUR\":\"0\",\"budget\":\"469500\",\"remarks\":\"\"}','user edited project approval request','2016-02-08 15:18:32'),(298,146,'Request_Edit','projects',23,'{\"type_id\":\"1\",\"name\":\"shedwan lobby\",\"reasons\":\"Shedwan lobby columns\",\"EUR_EX\":\"0\",\"USD_EX\":\"0\",\"budget_EGP\":\"469500\",\"budget_USD\":\"0\",\"budget_EUR\":\"0\",\"budget\":\"469500\",\"remarks\":\"\"}','user edited project approval request','2016-02-08 15:19:57'),(299,146,'Request_Edit','projects',23,'{\"type_id\":\"1\",\"name\":\"shedwan lobby\",\"reasons\":\"Shedwan lobby columns\",\"EUR_EX\":\"0\",\"USD_EX\":\"0\",\"budget_EGP\":\"469500\",\"budget_USD\":\"0\",\"budget_EUR\":\"0\",\"budget\":\"469500\",\"remarks\":\"\"}','user edited project approval request','2016-02-08 15:22:35'),(300,146,'Request_Edit','projects',23,'{\"type_id\":\"1\",\"name\":\"shedwan lobby\",\"reasons\":\"Shedwan lobby columns\",\"EUR_EX\":\"0\",\"USD_EX\":\"0\",\"budget_EGP\":\"469500\",\"budget_USD\":\"0\",\"budget_EUR\":\"0\",\"budget\":\"469500\",\"remarks\":\"\"}','user edited project approval request','2016-02-08 15:27:10'),(301,146,'Request_Edit','projects',23,'{\"type_id\":\"1\",\"name\":\"shedwan lobby\",\"reasons\":\"Shedwan lobby columns\",\"EUR_EX\":\"0\",\"USD_EX\":\"0\",\"budget_EGP\":\"469500\",\"budget_USD\":\"0\",\"budget_EUR\":\"0\",\"budget\":\"469500\",\"remarks\":\"\"}','user edited project approval request','2016-02-08 15:32:15'),(302,4,'Approve','projects',23,'{\"approval_id\":\"112\"}','user signed approval','2016-02-09 08:08:08'),(303,4,'Notify','projects',23,'{\"to\":\"hazim.elshamy@sunrise-resorts.com\"}','user requested approval','2016-02-09 08:08:08'),(304,4,'Approve','projects',13,'{\"approval_id\":\"58\"}','user signed approval','2016-02-09 08:09:59'),(305,4,'Notify','projects',13,'{\"to\":\"hazim.elshamy@sunrise-resorts.com\"}','user requested approval','2016-02-09 08:09:59'),(306,146,'Request_Edit','projects',11,'{\"type_id\":\"1\",\"name\":\"Transformer 1.5 Mega -ABB\",\"reasons\":\"As the recommendation of the Eng. consulting. to buy new transformer instead of the old one . the recommendation attached\",\"EUR_EX\":\"0\",\"USD_EX\":\"0\",\"budget_EGP\":\"185000\",\"budget_USD\":\"0\",\"budget_EUR\":\"0\",\"budget\":\"185000\",\"remarks\":\"\"}','user edited project approval request','2016-02-09 08:11:50'),(307,4,'Approve','projects',11,'{\"approval_id\":\"49\"}','user signed approval','2016-02-09 08:18:18'),(308,4,'Notify','projects',11,'{\"to\":\"hazim.elshamy@sunrise-resorts.com\"}','user requested approval','2016-02-09 08:18:18'),(309,3,'Approve','projects',19,'{\"approval_id\":\"91\"}','user signed approval','2016-02-09 10:53:04'),(310,3,'Notify','projects',19,'{\"to\":\"Philippe.deVizcaya@sunrise-resorts.com\"}','user requested approval','2016-02-09 10:53:04'),(311,3,'Approve','projects',21,'{\"approval_id\":\"103\"}','user signed approval','2016-02-09 10:53:24'),(312,3,'Notify','projects',21,'{\"to\":\"Philippe.deVizcaya@sunrise-resorts.com\"}','user requested approval','2016-02-09 10:53:24'),(313,3,'Approve','projects',20,'{\"approval_id\":\"97\"}','user signed approval','2016-02-09 10:53:40'),(314,3,'Notify','projects',20,'{\"to\":\"Philippe.deVizcaya@sunrise-resorts.com\"}','user requested approval','2016-02-09 10:53:40'),(315,3,'Approve','projects',11,'{\"approval_id\":\"50\"}','user signed approval','2016-02-10 09:14:44'),(316,3,'Notify','projects',11,'{\"to\":\"Philippe.deVizcaya@sunrise-resorts.com\"}','user requested approval','2016-02-10 09:14:44'),(317,3,'Undo','projects',11,'{\"approval_id\":\"50\"}','user unsigned project','2016-02-10 09:29:04'),(318,3,'Stage','projects',11,'{\"state_id\":1}','project state forced','2016-02-10 09:29:04'),(319,3,'Approve','projects',23,'{\"approval_id\":\"113\"}','user signed approval','2016-02-10 09:30:32'),(320,3,'Notify','projects',23,'{\"to\":\"Philippe.deVizcaya@sunrise-resorts.com\"}','user requested approval','2016-02-10 09:30:50'),(321,55,'Approve','projects',23,'{\"approval_id\":\"114\"}','user signed approval','2016-02-10 16:50:15'),(322,55,'Notify','projects',23,'{\"to\":\"chairman@sunrise-resorts.com\"}','user requested approval','2016-02-10 16:50:16'),(323,2,'Approve','projects',23,'{\"approval_id\":\"115\"}','user signed approval','2016-02-11 08:08:03'),(324,2,'Notify','projects',23,'{\"to\":\"tarek.elbadry@festival-resorts.com\",\"code\":\"FD5E9\"}','code exists => approved. else disapproved','2016-02-11 08:08:04'),(325,2,'Stage','projects',23,'{\"state\":2}','project state updated','2016-02-11 08:08:04'),(326,73,'Offer','projects',23,'{\"offer_name\":\"\\u0645\\u0634\\u0631\\u0648\\u0639_\\u062a\\u0631\\u0645\\u064a\\u0645_\\u0627\\u0644\\u0644\\u0648\\u0628\\u064a.PDF\"}','user uploaded an offer','2016-02-11 13:46:08'),(327,73,'Submit','projects',23,'{\"user_id\":\"73\",\"scope\":\"shedwan lobby repair\",\"cost\":\"469500\",\"cost_EGP\":\"469500\",\"cost_USD\":\"\",\"cost_EUR\":\"\",\"start\":\"2016-03-01\",\"end\":\"2016-03-31\",\"year\":\"2016\",\"remarks\":\"\",\"state_id\":3,\"suppliers\":false}','user created project (unplanned)','2016-02-11 13:50:42'),(328,73,'Create','owning_project',32,'{\"project_id\":\"23\"}','owning form created','2016-02-11 13:50:43'),(329,73,'Sign','projects',23,NULL,'user self signed','2016-02-11 13:50:43'),(330,73,'Stage','projects',23,'{\"state\":\"Purchasing\"}','project state updated, purchasing should be notified','2016-02-11 13:50:43'),(331,73,'Sign','projects',23,'{\"signature_id\":\"51\"}','user signed project','2016-02-11 13:51:18'),(332,157,'Offer','projects',23,'{\"offer_name\":\"\\u0644\\u0648\\u0628\\u064a_\\u0634\\u062f\\u0648\\u0627\\u0646.PDF\"}','user uploaded an offer','2016-02-11 14:32:09'),(333,157,'Edit','projects',23,'{\"scope\":\"shedwan lobby repair\",\"name\":\"shedwan lobby\",\"type_id\":\"1\",\"reasons\":\"Shedwan lobby columns\",\"cost_EGP\":\"455000\",\"cost_USD\":\"0\",\"cost_EUR\":\"0\",\"cost\":\"455000\",\"start\":\"2016-03-01\",\"end\":\"2016-03-31\",\"remarks\":\"\",\"suppliers\":false}','user edited project, signature modified','2016-02-11 14:32:31'),(334,157,'Notify','projects',23,'{\"to\":null}','Project signature notification sent','2016-02-11 14:32:31'),(335,157,'Edit','projects',23,'{\"scope\":\"shedwan lobby repair\",\"name\":\"shedwan lobby\",\"type_id\":\"1\",\"reasons\":\"Shedwan lobby columns\",\"cost_EGP\":\"455000\",\"cost_USD\":\"0\",\"cost_EUR\":\"0\",\"cost\":\"455000\",\"start\":\"2016-03-01\",\"end\":\"2016-03-31\",\"remarks\":\"\",\"suppliers\":false}','user edited project, signature modified','2016-02-11 14:33:51'),(336,157,'Notify','projects',23,'{\"to\":null}','Project signature notification sent','2016-02-11 14:33:52'),(337,157,'Sign','projects',23,'{\"signature_id\":\"52\"}','user signed project','2016-02-11 14:34:06'),(338,157,'Offer','projects',23,'{\"offer_name\":\"\\u0645\\u0634\\u0631\\u0648\\u0639_\\u0644\\u0648\\u0628\\u064a_\\u0634\\u062f\\u0648\\u0627\\u0646.pdf\"}','user uploaded an offer','2016-02-14 06:56:39'),(339,157,'Edit','projects',23,'{\"scope\":\"shedwan lobby repair\",\"name\":\"shedwan lobby\",\"type_id\":\"1\",\"reasons\":\"Shedwan lobby columns\",\"cost_EGP\":\"455000\",\"cost_USD\":\"0\",\"cost_EUR\":\"0\",\"cost\":\"455000\",\"start\":\"2016-03-01\",\"end\":\"2016-03-31\",\"remarks\":\"\",\"suppliers\":false}','user edited project, signature modified','2016-02-14 06:56:51'),(340,157,'Notify','projects',23,'{\"to\":null}','Project signature notification sent','2016-02-14 06:56:52'),(341,3,'Approve','projects',11,'{\"approval_id\":\"50\"}','user signed approval','2016-02-14 11:42:28'),(342,3,'Notify','projects',11,'{\"to\":\"Philippe.deVizcaya@sunrise-resorts.com\"}','user requested approval','2016-02-14 11:42:28'),(343,55,'Approve','projects',11,'{\"approval_id\":\"51\"}','user signed approval','2016-02-14 12:05:16'),(344,55,'Notify','projects',11,'{\"to\":\"tarek.elbadry@festival-resorts.com\",\"code\":\"FDA08\"}','code exists => approved. else disapproved','2016-02-14 12:05:17'),(345,55,'Stage','projects',11,'{\"state\":2}','project state updated','2016-02-14 12:05:17'),(346,146,'Request','projects',24,'{\"user_id\":\"146\",\"department_id\":\"4\",\"hotel_id\":\"10\",\"type_id\":\"1\",\"origin_id\":3,\"name\":\"shedwan sewege plant\",\"reasons\":\"new project\",\"EUR_EX\":\"\",\"USD_EX\":\"151425\",\"budget_EGP\":\"2325180\",\"budget_USD\":\"\",\"budget_EUR\":\"\",\"budget\":\"2325180\",\"remarks\":\"\",\"state_id\":0}','user created project approval request','2016-02-15 13:28:58'),(347,146,'Approve','projects',24,NULL,'user self approved','2016-02-15 13:28:58'),(348,146,'Stage','projects',24,'{\"state\":1}','project state updated','2016-02-15 13:28:58'),(349,146,'Notify','projects',24,'{\"to\":\"samy.nasser@sunrise-resorts.com\"}','user requested approval','2016-02-15 13:28:59'),(350,146,'Notify','projects',24,'{\"to\":\"Marwan.gendy@sunrise-resorts.com\"}','user requested approval','2016-02-15 13:29:00'),(351,157,'Offer','projects',23,'{\"offer_name\":\"DOC114.PDF\"}','user uploaded an offer','2016-02-16 09:56:38'),(352,157,'Offer','projects',23,'{\"offer_name\":\"DOC1141.PDF\"}','user uploaded an offer','2016-02-16 09:58:11'),(353,157,'Edit','projects',23,'{\"scope\":\"shedwan lobby repair\",\"name\":\"shedwan lobby\",\"type_id\":\"1\",\"reasons\":\"Shedwan lobby columns\",\"cost_EGP\":\"455000\",\"cost_USD\":\"0\",\"cost_EUR\":\"0\",\"cost\":\"455000\",\"start\":\"2016-03-01\",\"end\":\"2016-03-31\",\"remarks\":\"\",\"suppliers\":false}','user edited project, signature modified','2016-02-16 09:58:15'),(354,157,'Notify','projects',23,'{\"to\":null}','Project signature notification sent','2016-02-16 09:58:16'),(355,157,'Undo','projects',23,'{\"signature_id\":\"52\"}','user unsigned project','2016-02-16 10:00:24'),(356,157,'Stage','projects',23,'{\"state_id\":4}','project state forced','2016-02-16 10:00:24'),(357,157,'Sign','projects',23,'{\"signature_id\":\"52\"}','user signed project','2016-02-16 10:01:00'),(358,157,'Notify','projects',23,'{\"to\":null}','Project signature notification sent','2016-02-16 10:01:00'),(359,157,'Offer','projects',23,'{\"offer_name\":\"\\u0645\\u0646\\u0634\\u0627\\u0628.doc\"}','user uploaded an offer','2016-02-16 10:03:05'),(360,157,'Edit','projects',23,'{\"scope\":\"shedwan lobby repair\",\"name\":\"shedwan lobby\",\"type_id\":\"1\",\"reasons\":\"Shedwan lobby columns\",\"cost_EGP\":\"455000\",\"cost_USD\":\"0\",\"cost_EUR\":\"0\",\"cost\":\"455000\",\"start\":\"2016-03-01\",\"end\":\"2016-03-31\",\"remarks\":\"\",\"suppliers\":false}','user edited project, signature modified','2016-02-16 10:03:06'),(361,157,'Notify','projects',23,'{\"to\":null}','Project signature notification sent','2016-02-16 10:03:06'),(362,157,'Notify','projects',23,'{\"to\":null}','Project signature notification sent','2016-02-16 10:03:07'),(363,157,'Undo','projects',23,'{\"signature_id\":\"52\"}','user unsigned project','2016-02-16 10:07:16'),(364,157,'Stage','projects',23,'{\"state_id\":4}','project state forced','2016-02-16 10:07:16'),(365,157,'Sign','projects',23,'{\"signature_id\":\"52\"}','user signed project','2016-02-16 10:11:35'),(366,157,'Notify','projects',23,'{\"to\":null}','Project signature notification sent','2016-02-16 10:11:36'),(367,1,'Edit','projects',23,'{\"scope\":\"shedwan lobby repair\",\"name\":\"shedwan lobby\",\"type_id\":\"1\",\"reasons\":\"Shedwan lobby columns\",\"cost_EGP\":\"455000\",\"cost_USD\":\"0\",\"cost_EUR\":\"0\",\"cost\":\"455000\",\"start\":\"2016-03-01\",\"end\":\"2016-03-31\",\"remarks\":\"\",\"suppliers\":false}','user edited project, signature modified','2016-02-16 10:11:39'),(368,1,'Notify','projects',23,'{\"to\":null}','Project signature notification sent','2016-02-16 10:11:41'),(369,1,'Notify','projects',23,'{\"to\":null}','Project signature notification sent','2016-02-16 10:11:43'),(370,26,'Sign','projects',23,'{\"signature_id\":\"53\"}','user signed project','2016-02-16 10:39:00'),(371,26,'Notify','projects',23,'{\"to\":null}','Project signature notification sent','2016-02-16 10:39:01'),(372,26,'Notify','projects',23,'{\"to\":null}','Project signature notification sent','2016-02-16 10:39:01'),(373,26,'Undo','projects',23,'{\"signature_id\":\"53\"}','user unsigned project','2016-02-16 10:44:29'),(374,26,'Stage','projects',23,'{\"state_id\":4}','project state forced','2016-02-16 10:44:29'),(375,26,'Offer','projects',23,'{\"offer_name\":\"DOC1142.PDF\"}','user uploaded an offer','2016-02-16 10:45:11'),(376,26,'Offer','projects',23,'{\"offer_name\":\"\\u0645\\u0646\\u0634\\u0627\\u06281.doc\"}','user uploaded an offer','2016-02-16 10:45:51'),(377,26,'Sign','projects',23,'{\"signature_id\":\"53\"}','user signed project','2016-02-16 10:48:12'),(378,26,'Notify','projects',23,'{\"to\":null}','Project signature notification sent','2016-02-16 10:48:13'),(379,26,'Notify','projects',23,'{\"to\":null}','Project signature notification sent','2016-02-16 10:48:13'),(380,138,'Sign','projects',23,'{\"signature_id\":\"54\"}','user signed project','2016-02-16 10:50:11'),(381,138,'Notify','projects',23,'{\"to\":null}','Project signature notification sent','2016-02-16 10:50:12'),(382,138,'Notify','projects',23,'{\"to\":null}','Project signature notification sent','2016-02-16 10:50:13'),(383,25,'Request','projects',25,'{\"user_id\":\"25\",\"department_id\":\"16\",\"hotel_id\":\"1\",\"type_id\":\"1\",\"origin_id\":3,\"name\":\"Wooden Boxes for plants in GB & MP\",\"reasons\":\"wooden boxes for plants in the lobby of GB & MP to improve the image of the lobby\",\"EUR_EX\":\"\",\"USD_EX\":\"\",\"budget_EGP\":\"36975\",\"budget_USD\":\"\",\"budget_EUR\":\"\",\"budget\":\"36975\",\"remarks\":\"\",\"state_id\":0}','user created project approval request','2016-02-16 11:35:11'),(384,25,'Approve','projects',25,NULL,'user self approved','2016-02-16 11:35:11'),(385,25,'Stage','projects',25,'{\"state\":1}','project state updated','2016-02-16 11:35:11'),(386,25,'Notify','projects',25,'{\"to\":\"samy.nasser@sunrise-resorts.com\"}','user requested approval','2016-02-16 11:35:12'),(387,25,'Notify','projects',25,'{\"to\":\"Marwan.gendy@sunrise-resorts.com\"}','user requested approval','2016-02-16 11:35:13'),(388,4,'Sign','projects',23,'{\"signature_id\":\"55\"}','user signed project','2016-02-16 11:47:03'),(389,4,'Notify','projects',23,'{\"to\":null}','Project signature notification sent','2016-02-16 11:47:03'),(390,4,'Notify','projects',23,'{\"to\":null}','Project signature notification sent','2016-02-16 11:47:04'),(391,146,'Sign','projects',23,'{\"signature_id\":\"56\"}','user signed project','2016-02-16 12:38:10'),(392,146,'Notify','projects',23,'{\"to\":null}','Project signature notification sent','2016-02-16 12:38:11'),(393,3,'Sign','projects',23,'{\"signature_id\":\"57\"}','user signed project','2016-02-16 14:07:09'),(394,3,'Notify','projects',23,'{\"to\":null}','Project signature notification sent','2016-02-16 14:07:10'),(395,83,'Offer','projects',10,'{\"offer_name\":\"Api_web.java\"}','user uploaded an offer','2016-02-16 14:50:19'),(396,83,'Offer-Remove','projects',10,'{\"offer_id\":\"21\",\"file_name\":\"Api_web.java\"}','user removed an offer','2016-02-16 14:50:22'),(397,55,'Sign','projects',23,'{\"signature_id\":\"58\"}','user signed project','2016-02-17 09:30:09'),(398,55,'Notify','owning_project',23,'{\"to\":null}','Project owning signature notification sent','2016-02-17 09:30:10'),(399,55,'Notify','owning_project',23,'{\"to\":null}','Project owning signature notification sent','2016-02-17 09:30:11'),(400,55,'Notify','owning_project',23,'{\"to\":null}','Project owning signature notification sent','2016-02-17 09:30:12'),(401,55,'Notify','owning_project',23,'{\"to\":null}','Project owning signature notification sent','2016-02-17 09:30:13'),(402,55,'Notify','owning_project',23,'{\"to\":null}','Project owning signature notification sent','2016-02-17 09:30:13'),(403,55,'Notify','owning_project',23,'{\"to\":null}','Project owning signature notification sent','2016-02-17 09:30:14'),(404,55,'Notify','owning_project',23,'{\"to\":null}','Project owning signature notification sent','2016-02-17 09:30:15'),(405,55,'Notify','projects',23,'{\"to\":null}','Project signature notification sent','2016-02-17 09:30:16'),(406,55,'Approve','projects',21,'{\"approval_id\":\"104\"}','user signed approval','2016-02-17 09:31:07'),(407,55,'Approve','projects',20,'{\"approval_id\":\"98\"}','user signed approval','2016-02-17 09:31:41'),(408,55,'Approve','projects',19,'{\"approval_id\":\"92\"}','user signed approval','2016-02-17 09:31:58'),(409,4,'Approve','projects',24,'{\"approval_id\":\"117\"}','user signed approval','2016-02-18 10:35:48'),(410,4,'Notify','projects',24,'{\"to\":\"hazim.elshamy@sunrise-resorts.com\"}','user requested approval','2016-02-18 10:35:49'),(411,129,'Request','projects',26,'{\"user_id\":\"129\",\"department_id\":\"12\",\"hotel_id\":\"4\",\"type_id\":\"1\",\"origin_id\":3,\"name\":\"themed kids rooms\",\"reasons\":\"tour operator contract\",\"EUR_EX\":\"1\",\"USD_EX\":\"1\",\"budget_EGP\":\"28000.00\",\"budget_USD\":\"\",\"budget_EUR\":\"\",\"budget\":\"28000\",\"remarks\":\"urgent to be done and ready before March.\\n6 rooms had been done already and we need to make other 20 rooms\",\"state_id\":0}','user created project approval request','2016-02-18 10:52:36'),(412,129,'Approve','projects',26,NULL,'user self approved','2016-02-18 10:52:36'),(413,129,'Stage','projects',26,'{\"state\":1}','project state updated','2016-02-18 10:52:36'),(414,129,'Notify','projects',26,'{\"to\":\"samy.nasser@sunrise-resorts.com\"}','user requested approval','2016-02-18 10:52:37'),(415,129,'Notify','projects',26,'{\"to\":\"Marwan.gendy@sunrise-resorts.com\"}','user requested approval','2016-02-18 10:52:37'),(416,4,'Approve','projects',26,'{\"approval_id\":\"139\"}','user signed approval','2016-02-18 11:09:41'),(417,4,'Notify','projects',26,'{\"to\":\"hazim.elshamy@sunrise-resorts.com\"}','user requested approval','2016-02-18 11:09:42'),(418,3,'Approve','projects',24,'{\"approval_id\":\"118\"}','user signed approval','2016-02-18 11:21:03'),(419,3,'Notify','projects',24,'{\"to\":\"Philippe.deVizcaya@sunrise-resorts.com\"}','user requested approval','2016-02-18 11:21:03'),(420,55,'Approve','projects',24,'{\"approval_id\":\"119\"}','user signed approval','2016-02-18 11:49:34'),(421,55,'Notify','projects',24,'{\"to\":\"chairman@sunrise-resorts.com\"}','user requested approval','2016-02-18 11:49:35'),(422,1,'Request_Edit','projects',24,'{\"type_id\":\"1\",\"name\":\"shedwan sewege plant\",\"reasons\":\"new project\",\"EUR_EX\":\"0\",\"USD_EX\":\"7.80\",\"budget_EGP\":\"2325180\",\"budget_USD\":\"151425\",\"budget_EUR\":\"0\",\"budget\":\"3506295\",\"remarks\":\"\"}','user edited project approval request','2016-02-18 13:13:20'),(423,169,'Sign','owning_project',23,'{\"signature_id\":\"46\"}','user signed project','2016-02-18 14:13:13'),(424,169,'Sign','owning_project',12,'{\"signature_id\":\"39\"}','user signed project','2016-02-18 14:15:24'),(425,169,'Review','owning_project',12,'{\"place\":\"\",\"num_of_offers\":\"\",\"total_cost\":\"\",\"sup_1\":\"\",\"sup_2\":\"\",\"sup_3\":\"\",\"sup_4\":\"\",\"sup_5\":\"\",\"sup_6\":\"\",\"consultant\":\"\",\"recommendation\":\"\",\"balance\":\"\",\"purchasing_notes\":\"\",\"financial_notes\":\"\",\"suppliers\":[\"309\",\"548\",\"799\"]}','Owning company form updated','2016-02-18 14:15:43'),(426,101,'Sign','owning_project',23,'{\"signature_id\":\"44\"}','user signed project','2016-02-18 16:14:26'),(427,3,'Approve','projects',26,'{\"approval_id\":\"140\"}','user signed approval','2016-02-20 09:46:37'),(428,3,'Notify','projects',26,'{\"to\":\"Philippe.deVizcaya@sunrise-resorts.com\"}','user requested approval','2016-02-20 09:46:38'),(429,55,'Approve','projects',26,'{\"approval_id\":\"141\"}','user signed approval','2016-02-20 09:53:33'),(430,55,'Notify','projects',26,'{\"to\":\"Waheed.altohamy@sunrise-resorts.com\",\"code\":\"01F09\"}','code exists => approved. else disapproved','2016-02-20 09:53:34'),(431,55,'Stage','projects',26,'{\"state\":2}','project state updated','2016-02-20 09:53:34'),(432,73,'Submit','projects',11,'{\"user_id\":\"73\",\"scope\":\"New Transformer 1.5 Mega-ABB\",\"cost\":\"\",\"cost_EGP\":\"\",\"cost_USD\":\"\",\"cost_EUR\":\"\",\"start\":\"2016-02-21\",\"end\":\"2016-04-21\",\"year\":\"2016\",\"remarks\":\"\",\"state_id\":3,\"suppliers\":false}','user created project (unplanned)','2016-02-21 08:16:10'),(433,73,'Create','owning_project',33,'{\"project_id\":\"11\"}','owning form created','2016-02-21 08:16:11'),(434,73,'Sign','projects',11,NULL,'user self signed','2016-02-21 08:16:11'),(435,73,'Stage','projects',11,'{\"state\":\"Purchasing\"}','project state updated, purchasing should be notified','2016-02-21 08:16:11'),(436,73,'Sign','projects',11,'{\"signature_id\":\"61\"}','user signed project','2016-02-21 08:16:20'),(437,157,'Offer','projects',11,'{\"offer_name\":\"DOC122.PDF\"}','user uploaded an offer','2016-02-21 10:27:30'),(438,157,'Edit','projects',11,'{\"scope\":\"New Transformer 1.5 Mega-ABB\",\"name\":\"Transformer 1.5 Mega -ABB\",\"type_id\":\"1\",\"reasons\":\"As the recommendation of the Eng. consulting. to buy new transformer instead of the old one . the recommendation attached\",\"cost_EGP\":\"180800\",\"cost_USD\":\"0\",\"cost_EUR\":\"0\",\"cost\":\"180800\",\"start\":\"2016-02-21\",\"end\":\"2016-04-21\",\"remarks\":\"\",\"suppliers\":[\"22\",\"679\"]}','user edited project, signature modified','2016-02-21 10:29:25'),(439,157,'Notify','projects',11,'{\"to\":null}','Project signature notification sent','2016-02-21 10:29:26'),(440,157,'Sign','projects',11,'{\"signature_id\":\"62\"}','user signed project','2016-02-21 10:29:49'),(441,129,'Request','projects',27,'{\"user_id\":\"129\",\"department_id\":\"12\",\"hotel_id\":\"4\",\"type_id\":\"1\",\"origin_id\":3,\"name\":\"the rest of Kids rooms project\",\"reasons\":\"Contract with Tour Operator\",\"EUR_EX\":\"\",\"USD_EX\":\"\",\"budget_EGP\":\"23000\",\"budget_USD\":\"\",\"budget_EUR\":\"\",\"budget\":\"23000\",\"remarks\":\"Complete the kids rooms ( linen- kids chairs -Maintenance work)\",\"state_id\":0}','user created project approval request','2016-02-22 08:47:37'),(442,129,'Approve','projects',27,NULL,'user self approved','2016-02-22 08:47:37'),(443,129,'Stage','projects',27,'{\"state\":1}','project state updated','2016-02-22 08:47:37'),(444,129,'Notify','projects',27,'{\"to\":\"samy.nasser@sunrise-resorts.com\"}','user requested approval','2016-02-22 08:47:38'),(445,129,'Notify','projects',27,'{\"to\":\"Marwan.gendy@sunrise-resorts.com\"}','user requested approval','2016-02-22 08:47:39'),(446,149,'Submit','projects',26,'{\"user_id\":\"149\",\"scope\":\"\",\"cost\":\"\",\"cost_EGP\":\"\",\"cost_USD\":\"\",\"cost_EUR\":\"\",\"start\":\"2016-03-01\",\"end\":\"2016-03-10\",\"year\":\"2016\",\"remarks\":\"urgent to be done and ready before March.\\n6 rooms had been done already and we need to make other 20 rooms\",\"state_id\":3,\"suppliers\":false}','user created project (unplanned)','2016-02-22 08:47:58'),(447,149,'Create','owning_project',34,'{\"project_id\":\"26\"}','owning form created','2016-02-22 08:47:59'),(448,149,'Sign','projects',26,NULL,'user self signed','2016-02-22 08:47:59'),(449,149,'Stage','projects',26,'{\"state\":\"Purchasing\"}','project state updated, purchasing should be notified','2016-02-22 08:47:59'),(450,149,'Sign','projects',26,'{\"signature_id\":\"71\"}','user signed project','2016-02-22 08:48:20'),(451,95,'Sign','owning_project',23,'{\"signature_id\":\"41\"}','user signed project','2016-02-22 12:58:15'),(452,100,'Sign','owning_project',23,'{\"signature_id\":\"42\"}','user signed project','2016-02-22 13:00:51'),(453,138,'Sign','projects',4,'{\"signature_id\":\"25\"}','user signed project','2016-02-24 08:04:12'),(454,138,'Notify','projects',4,'{\"to\":null}','Project signature notification sent','2016-02-24 08:04:14'),(455,138,'Notify','projects',4,'{\"to\":null}','Project signature notification sent','2016-02-24 08:04:15'),(456,146,'Request','projects',28,'{\"user_id\":\"146\",\"department_id\":\"4\",\"hotel_id\":\"10\",\"type_id\":\"3\",\"origin_id\":3,\"name\":\"New shops\",\"reasons\":\"New shops\",\"EUR_EX\":\"\",\"USD_EX\":\"\",\"budget_EGP\":\"145850\",\"budget_USD\":\"\",\"budget_EUR\":\"\",\"budget\":\"145850\",\"remarks\":\"All data with Eng. Soliman\",\"state_id\":0}','user created project approval request','2016-02-24 09:22:31'),(457,146,'Approve','projects',28,NULL,'user self approved','2016-02-24 09:22:33'),(458,146,'Stage','projects',28,'{\"state\":1}','project state updated','2016-02-24 09:22:33'),(459,146,'Notify','projects',28,'{\"to\":\"samy.nasser@sunrise-resorts.com\"}','user requested approval','2016-02-24 09:22:46'),(460,146,'Notify','projects',28,'{\"to\":\"Marwan.gendy@sunrise-resorts.com\"}','user requested approval','2016-02-24 09:22:47'),(461,146,'Request','projects',29,'{\"user_id\":\"146\",\"department_id\":\"4\",\"hotel_id\":\"10\",\"type_id\":\"3\",\"origin_id\":3,\"name\":\"irrigation system\",\"reasons\":\"New irrigation system for shedwan\",\"EUR_EX\":\"\",\"USD_EX\":\"\",\"budget_EGP\":\"195280\",\"budget_USD\":\"\",\"budget_EUR\":\"\",\"budget\":\"195280\",\"remarks\":\"New irrigation system for shedwan as per Dr. Ahmed\",\"state_id\":0}','user created project approval request','2016-02-24 09:28:11'),(462,146,'Approve','projects',29,NULL,'user self approved','2016-02-24 09:28:11'),(463,146,'Stage','projects',29,'{\"state\":1}','project state updated','2016-02-24 09:28:11'),(464,146,'Notify','projects',29,'{\"to\":\"samy.nasser@sunrise-resorts.com\"}','user requested approval','2016-02-24 09:28:13'),(465,146,'Notify','projects',29,'{\"to\":\"Marwan.gendy@sunrise-resorts.com\"}','user requested approval','2016-02-24 09:28:13'),(466,146,'Request','projects',30,'{\"user_id\":\"146\",\"department_id\":\"4\",\"hotel_id\":\"10\",\"type_id\":\"3\",\"origin_id\":3,\"name\":\"Walk ways phase 2\",\"reasons\":\"To continues the wake ways project\",\"EUR_EX\":\"\",\"USD_EX\":\"\",\"budget_EGP\":\"155340\",\"budget_USD\":\"\",\"budget_EUR\":\"\",\"budget\":\"155340\",\"remarks\":\"\",\"state_id\":0}','user created project approval request','2016-02-24 09:37:31'),(467,146,'Approve','projects',30,NULL,'user self approved','2016-02-24 09:37:32'),(468,146,'Stage','projects',30,'{\"state\":1}','project state updated','2016-02-24 09:37:32'),(469,146,'Notify','projects',30,'{\"to\":\"samy.nasser@sunrise-resorts.com\"}','user requested approval','2016-02-24 09:37:33'),(470,146,'Notify','projects',30,'{\"to\":\"Marwan.gendy@sunrise-resorts.com\"}','user requested approval','2016-02-24 09:37:34'),(471,146,'Request','projects',31,'{\"user_id\":\"146\",\"department_id\":\"4\",\"hotel_id\":\"10\",\"type_id\":\"3\",\"origin_id\":3,\"name\":\"Main restaurant\",\"reasons\":\"To continues the Main restaurant project\",\"EUR_EX\":\"\",\"USD_EX\":\"\",\"budget_EGP\":\"210000\",\"budget_USD\":\"\",\"budget_EUR\":\"\",\"budget\":\"210000\",\"remarks\":\"To continues the Maine restaurant project\",\"state_id\":0}','user created project approval request','2016-02-24 09:41:13'),(472,146,'Approve','projects',31,NULL,'user self approved','2016-02-24 09:41:13'),(473,146,'Stage','projects',31,'{\"state\":1}','project state updated','2016-02-24 09:41:13'),(474,146,'Notify','projects',31,'{\"to\":\"samy.nasser@sunrise-resorts.com\"}','user requested approval','2016-02-24 09:41:14'),(475,146,'Notify','projects',31,'{\"to\":\"Marwan.gendy@sunrise-resorts.com\"}','user requested approval','2016-02-24 09:41:15'),(476,146,'Request_Edit','projects',31,'{\"type_id\":\"3\",\"name\":\"Main restaurant\",\"reasons\":\"To continues the Main Restaurant project\",\"EUR_EX\":\"0\",\"USD_EX\":\"0\",\"budget_EGP\":\"210000\",\"budget_USD\":\"0\",\"budget_EUR\":\"0\",\"budget\":\"210000\",\"remarks\":\"To continues the Maine Restaurant project\"}','user edited project approval request','2016-02-24 09:43:44'),(477,4,'Approve','projects',29,'{\"approval_id\":\"152\"}','user signed approval','2016-02-24 09:45:10'),(478,4,'Notify','projects',29,'{\"to\":\"hazim.elshamy@sunrise-resorts.com\"}','user requested approval','2016-02-24 09:45:12'),(479,4,'Approve','projects',30,'{\"approval_id\":\"157\"}','user signed approval','2016-02-24 09:45:59'),(480,4,'Notify','projects',30,'{\"to\":\"hazim.elshamy@sunrise-resorts.com\"}','user requested approval','2016-02-24 09:46:00'),(481,146,'Request_Edit','projects',31,'{\"type_id\":\"3\",\"name\":\"Main Restaurant\",\"reasons\":\"To continues the Main Restaurant project\",\"EUR_EX\":\"0\",\"USD_EX\":\"0\",\"budget_EGP\":\"210000\",\"budget_USD\":\"0\",\"budget_EUR\":\"0\",\"budget\":\"210000\",\"remarks\":\"To continues the Maine Restaurant project\"}','user edited project approval request','2016-02-24 09:46:43'),(482,4,'Approve','projects',31,'{\"approval_id\":\"162\"}','user signed approval','2016-02-24 09:46:51'),(483,4,'Notify','projects',31,'{\"to\":\"hazim.elshamy@sunrise-resorts.com\"}','user requested approval','2016-02-24 09:47:10'),(484,3,'Approve','projects',29,'{\"approval_id\":\"153\"}','user signed approval','2016-02-24 09:51:36'),(485,3,'Notify','projects',29,'{\"to\":\"Philippe.deVizcaya@sunrise-resorts.com\"}','user requested approval','2016-02-24 09:51:41'),(486,3,'Approve','projects',30,'{\"approval_id\":\"158\"}','user signed approval','2016-02-24 09:52:01'),(487,3,'Notify','projects',30,'{\"to\":\"Philippe.deVizcaya@sunrise-resorts.com\"}','user requested approval','2016-02-24 09:52:06'),(488,3,'Approve','projects',31,'{\"approval_id\":\"163\"}','user signed approval','2016-02-24 09:52:54'),(489,3,'Notify','projects',31,'{\"to\":\"Philippe.deVizcaya@sunrise-resorts.com\"}','user requested approval','2016-02-24 09:53:01'),(490,55,'Approve','projects',29,'{\"approval_id\":\"154\"}','user signed approval','2016-02-24 15:18:52'),(491,55,'Notify','projects',29,'{\"to\":\"chairman@sunrise-resorts.com\"}','user requested approval','2016-02-24 15:18:53'),(492,55,'Approve','projects',30,'{\"approval_id\":\"159\"}','user signed approval','2016-02-24 15:19:17'),(493,55,'Notify','projects',30,'{\"to\":\"chairman@sunrise-resorts.com\"}','user requested approval','2016-02-24 15:19:18'),(494,55,'Approve','projects',31,'{\"approval_id\":\"164\"}','user signed approval','2016-02-24 15:20:14'),(495,55,'Notify','projects',31,'{\"to\":\"chairman@sunrise-resorts.com\"}','user requested approval','2016-02-24 15:20:15'),(496,146,'Request_Edit','projects',28,'{\"type_id\":\"3\",\"name\":\"New shops\",\"reasons\":\"New shops\",\"EUR_EX\":\"0\",\"USD_EX\":\"0\",\"budget_EGP\":\"145850\",\"budget_USD\":\"0\",\"budget_EUR\":\"0\",\"budget\":\"145850\",\"remarks\":\"All data with Eng. Soliman\"}','user edited project approval request','2016-02-25 08:31:49'),(497,2,'Approve','projects',24,'{\"approval_id\":\"120\"}','user signed approval','2016-02-25 09:53:59'),(498,2,'Notify','projects',24,'{\"to\":\"tarek.elbadry@festival-resorts.com\",\"code\":\"0391F\"}','code exists => approved. else disapproved','2016-02-25 09:54:00'),(499,2,'Stage','projects',24,'{\"state\":2}','project state updated','2016-02-25 09:54:00'),(500,102,'Sign','owning_project',23,'{\"signature_id\":\"47\"}','user signed project','2016-02-25 11:22:17'),(501,4,'Approve','projects',28,'{\"approval_id\":\"147\"}','user signed approval','2016-02-25 11:37:11'),(502,4,'Notify','projects',28,'{\"to\":\"hazim.elshamy@sunrise-resorts.com\"}','user requested approval','2016-02-25 11:37:12'),(503,3,'Approve','projects',28,'{\"approval_id\":\"148\"}','user signed approval','2016-02-25 11:46:24'),(504,3,'Notify','projects',28,'{\"to\":\"Philippe.deVizcaya@sunrise-resorts.com\"}','user requested approval','2016-02-25 11:46:25'),(505,2,'Sign','projects',23,'{\"signature_id\":\"59\"}','user signed project','2016-02-25 14:24:45'),(506,2,'Stage','projects',23,'{\"state\":\"Approved\"}','project state updated, owner notified','2016-02-25 14:24:48'),(507,129,'Request','projects',32,'{\"user_id\":\"129\",\"department_id\":\"4\",\"hotel_id\":\"4\",\"type_id\":\"1\",\"origin_id\":3,\"name\":\"Emergency stairs for Building 10\",\"reasons\":\"Must to finalize for the Civil Defense license urgent\",\"EUR_EX\":\"\",\"USD_EX\":\"\",\"budget_EGP\":\"46370\",\"budget_USD\":\"\",\"budget_EUR\":\"\",\"budget\":\"46370\",\"remarks\":\"\",\"state_id\":0}','user created project approval request','2016-02-27 09:45:01'),(508,129,'Approve','projects',32,NULL,'user self approved','2016-02-27 09:45:02'),(509,129,'Stage','projects',32,'{\"state\":1}','project state updated','2016-02-27 09:45:02'),(510,129,'Notify','projects',32,'{\"to\":\"samy.nasser@sunrise-resorts.com\"}','user requested approval','2016-02-27 09:45:03'),(511,129,'Notify','projects',32,'{\"to\":\"Marwan.gendy@sunrise-resorts.com\"}','user requested approval','2016-02-27 09:45:03'),(512,4,'Approve','projects',32,'{\"approval_id\":\"167\"}','user signed approval','2016-02-27 11:44:06'),(513,4,'Notify','projects',32,'{\"to\":\"hazim.elshamy@sunrise-resorts.com\"}','user requested approval','2016-02-27 11:44:06'),(514,3,'Approve','projects',32,'{\"approval_id\":\"168\"}','user signed approval','2016-03-01 07:50:03'),(515,3,'Notify','projects',32,'{\"to\":\"Philippe.deVizcaya@sunrise-resorts.com\"}','user requested approval','2016-03-01 07:50:04'),(516,55,'Approve','projects',32,'{\"approval_id\":\"169\"}','user signed approval','2016-03-01 08:50:11'),(517,55,'Notify','projects',32,'{\"to\":\"chairman@sunrise-resorts.com\"}','user requested approval','2016-03-01 08:50:12'),(518,174,'Request','projects',33,'{\"user_id\":\"174\",\"department_id\":\"4\",\"hotel_id\":\"5\",\"type_id\":\"1\",\"origin_id\":3,\"name\":\"test\",\"reasons\":\".kjsalkjfcklsdjcfsdlfjdslj\",\"EUR_EX\":\"\",\"USD_EX\":\"\",\"budget_EGP\":\"100\",\"budget_USD\":\"\",\"budget_EUR\":\"\",\"budget\":\"100\",\"remarks\":\"\",\"state_id\":0}','user created project approval request','2016-03-02 07:46:51'),(519,174,'Approve','projects',33,NULL,'user self approved','2016-03-02 07:46:51'),(520,174,'Stage','projects',33,'{\"state\":1}','project state updated','2016-03-02 07:46:51'),(521,174,'Notify','projects',33,'{\"to\":\"samy.nasser@sunrise-resorts.com\"}','user requested approval','2016-03-02 07:46:52'),(522,174,'Notify','projects',33,'{\"to\":\"Marwan.gendy@sunrise-resorts.com\"}','user requested approval','2016-03-02 07:46:53'),(523,146,'Request','projects',34,'{\"user_id\":\"146\",\"department_id\":\"4\",\"hotel_id\":\"10\",\"type_id\":\"1\",\"origin_id\":3,\"name\":\"New Furniture for 108 Renovated Rooms\",\"reasons\":\"The new furniture manufactured for the new 108 renovated rooms.\",\"EUR_EX\":\"\",\"USD_EX\":\"\",\"budget_EGP\":\"1528388\",\"budget_USD\":\"\",\"budget_EUR\":\"\",\"budget\":\"1528388\",\"remarks\":\"Furniture will be manufactured by the central workshop\",\"state_id\":0}','user created project approval request','2016-03-02 08:53:59'),(524,146,'Approve','projects',34,NULL,'user self approved','2016-03-02 08:53:59'),(525,146,'Stage','projects',34,'{\"state\":1}','project state updated','2016-03-02 08:53:59'),(526,146,'Notify','projects',34,'{\"to\":\"samy.nasser@sunrise-resorts.com\"}','user requested approval','2016-03-02 08:54:01'),(527,146,'Notify','projects',34,'{\"to\":\"Marwan.gendy@sunrise-resorts.com\"}','user requested approval','2016-03-02 08:54:02'),(528,1,'Request_Edit','projects',28,'{\"type_id\":\"3\",\"name\":\"New shops\",\"reasons\":\"New shops\",\"EUR_EX\":\"0\",\"USD_EX\":\"0\",\"budget_EGP\":\"210165\",\"budget_USD\":\"0\",\"budget_EUR\":\"0\",\"budget\":\"210165\",\"remarks\":\"All data with Eng. Soliman\"}','user edited project approval request','2016-03-02 09:05:15'),(529,4,'Approve','projects',34,'{\"approval_id\":\"176\"}','user signed approval','2016-03-02 09:31:25'),(530,4,'Notify','projects',34,'{\"to\":\"hazim.elshamy@sunrise-resorts.com\"}','user requested approval','2016-03-02 09:31:26'),(531,3,'Approve','projects',34,'{\"approval_id\":\"177\"}','user signed approval','2016-03-02 09:32:24'),(532,3,'Notify','projects',34,'{\"to\":\"Philippe.deVizcaya@sunrise-resorts.com\"}','user requested approval','2016-03-02 09:32:27'),(533,55,'Approve','projects',34,'{\"approval_id\":\"178\"}','user signed approval','2016-03-02 11:58:54'),(534,55,'Notify','projects',34,'{\"to\":\"chairman@sunrise-resorts.com\"}','user requested approval','2016-03-02 11:59:01'),(535,95,'Sign','owning_project',12,'{\"signature_id\":\"34\"}','user signed project','2016-03-03 12:25:31'),(536,100,'Sign','owning_project',12,'{\"signature_id\":\"35\"}','user signed project','2016-03-03 12:52:59'),(537,102,'Sign','owning_project',12,'{\"signature_id\":\"40\"}','user signed project','2016-03-03 14:05:21'),(538,101,'Sign','owning_project',12,'{\"signature_id\":\"37\"}','user signed project','2016-03-06 06:53:32'),(539,129,'Request','projects',35,'{\"user_id\":\"129\",\"department_id\":\"4\",\"hotel_id\":\"4\",\"type_id\":\"1\",\"origin_id\":3,\"name\":\"Rooms Renovation Project\",\"reasons\":\"Rooms need renovation\",\"EUR_EX\":\"\",\"USD_EX\":\"\",\"budget_EGP\":\"32000\",\"budget_USD\":\"\",\"budget_EUR\":\"\",\"budget\":\"32000\",\"remarks\":\"\",\"state_id\":0}','user created project approval request','2016-03-13 11:16:35'),(540,129,'Approve','projects',35,NULL,'user self approved','2016-03-13 11:16:35'),(541,129,'Stage','projects',35,'{\"state\":1}','project state updated','2016-03-13 11:16:35'),(542,129,'Notify','projects',35,'{\"to\":\"samy.nasser@sunrise-resorts.com\"}','user requested approval','2016-03-13 11:16:36'),(543,129,'Request','projects',36,'{\"user_id\":\"129\",\"department_id\":\"4\",\"hotel_id\":\"4\",\"type_id\":\"1\",\"origin_id\":3,\"name\":\"Room Renovation project\",\"reasons\":\"Room Renovation Sample\",\"EUR_EX\":\"\",\"USD_EX\":\"\",\"budget_EGP\":\"30000\",\"budget_USD\":\"\",\"budget_EUR\":\"\",\"budget\":\"30000\",\"remarks\":\"\",\"state_id\":0}','user created project approval request','2016-03-13 12:45:05'),(544,129,'Approve','projects',36,NULL,'user self approved','2016-03-13 12:45:06'),(545,129,'Stage','projects',36,'{\"state\":1}','project state updated','2016-03-13 12:45:06'),(546,129,'Notify','projects',36,'{\"to\":\"samy.nasser@sunrise-resorts.com\"}','user requested approval','2016-03-13 12:45:06'),(547,4,'Approve','projects',36,'{\"approval_id\":\"186\"}','user signed approval','2016-03-15 14:43:22'),(548,4,'Notify','projects',36,'{\"to\":\"hazim.elshamy@sunrise-resorts.com\"}','user requested approval','2016-03-15 14:43:23'),(549,3,'Approve','projects',36,'{\"approval_id\":\"187\"}','user signed approval','2016-03-16 10:03:19'),(550,3,'Notify','projects',36,'{\"to\":\"Philippe.deVizcaya@sunrise-resorts.com\"}','user requested approval','2016-03-16 10:03:20'),(551,55,'Approve','projects',36,'{\"approval_id\":\"188\"}','user signed approval','2016-03-16 10:20:12'),(552,55,'Notify','projects',36,'{\"to\":\"Waheed.altohamy@sunrise-resorts.com\",\"code\":\"F6F30\"}','code exists => approved. else disapproved','2016-03-16 10:20:12'),(553,55,'Stage','projects',36,'{\"state\":2}','project state updated','2016-03-16 10:20:12');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_attempts`
--

DROP TABLE IF EXISTS `login_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_attempts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(40) COLLATE utf8_bin NOT NULL,
  `login` varchar(50) COLLATE utf8_bin NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_attempts`
--

LOCK TABLES `login_attempts` WRITE;
/*!40000 ALTER TABLE `login_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `project_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
INSERT INTO `offers` VALUES (1,'اعمال_الكترو_ميكانيك_المطلوب_عملها_فى_حمام_السباحة_الرئيسى1.docx','1'),(2,'المتحدة1.docx','1'),(3,'كونستيل1.docx','1'),(4,'Pump_5.5hp.PDF','4'),(5,'طلمبه.pdf','4'),(6,'CUserspcDesktopمكادى1.docx','1'),(7,'DOC033.PDF','4'),(8,'اجمالى_المشروع.PDF','12'),(9,'اعمال_الكهرباء.PDF','12'),(10,'زراعة1.PDF','12'),(11,'شبكة_الرى1.PDF','12'),(12,'مقارنة_نهائية_للمشروع_التكسير.pdf','12'),(19,'DOC1142.PDF','23'),(20,'منشاب1.doc','23'),(22,'DOC122.PDF','11');
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owning_signatures`
--

DROP TABLE IF EXISTS `owning_signatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `owning_signatures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rank` int(5) NOT NULL,
  `project_id` int(11) NOT NULL,
  `reject` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owning_signatures`
--

LOCK TABLES `owning_signatures` WRITE;
/*!40000 ALTER TABLE `owning_signatures` DISABLE KEYS */;
INSERT INTO `owning_signatures` VALUES (10,NULL,10,'2016-01-21 12:13:02',2,1,0),(11,NULL,12,'2016-01-21 12:13:02',3,1,0),(12,NULL,15,'2016-01-21 12:13:02',4,1,0),(13,NULL,13,'2016-01-21 12:13:02',5,1,0),(14,NULL,11,'2016-01-21 12:13:02',6,1,0),(15,NULL,23,'2016-01-21 12:13:02',7,1,0),(16,NULL,14,'2016-01-21 12:13:02',8,1,0),(17,NULL,10,'2016-01-21 13:29:01',2,4,0),(18,NULL,12,'2016-01-21 13:29:01',3,4,0),(19,NULL,15,'2016-01-21 13:29:01',4,4,0),(20,NULL,13,'2016-01-21 13:29:01',5,4,0),(21,NULL,11,'2016-01-21 13:29:01',6,4,0),(22,NULL,23,'2016-01-21 13:29:01',7,4,0),(23,NULL,14,'2016-01-21 13:29:01',8,4,0),(24,NULL,24,'2016-01-28 17:40:44',1,10,0),(25,NULL,25,'2016-01-26 12:44:29',2,10,0),(26,NULL,26,'2016-01-28 13:57:06',3,10,0),(27,NULL,10,'2016-01-29 14:58:14',2,14,0),(28,NULL,12,'2016-01-29 14:58:14',3,14,0),(29,NULL,15,'2016-01-29 14:58:14',4,14,0),(30,NULL,13,'2016-01-29 14:58:14',5,14,0),(31,NULL,11,'2016-01-29 14:58:14',6,14,0),(32,NULL,23,'2016-01-29 14:58:14',7,14,0),(33,NULL,14,'2016-01-29 14:58:14',8,14,0),(34,95,10,'2016-03-03 12:25:31',2,12,0),(35,100,12,'2016-03-03 12:52:59',3,12,0),(36,NULL,15,'2016-02-03 11:09:27',4,12,0),(37,101,13,'2016-03-06 06:53:32',5,12,0),(38,NULL,11,'2016-02-03 11:09:27',6,12,0),(39,169,23,'2016-02-18 14:15:24',7,12,0),(40,102,14,'2016-03-03 14:05:21',8,12,0),(41,95,10,'2016-02-22 12:58:15',2,23,0),(42,100,12,'2016-02-22 13:00:50',3,23,0),(43,NULL,15,'2016-02-11 13:50:43',4,23,0),(44,101,13,'2016-02-18 16:14:26',5,23,0),(45,NULL,11,'2016-02-11 13:50:43',6,23,0),(46,169,23,'2016-02-18 14:13:13',7,23,0),(47,102,14,'2016-02-25 11:22:17',8,23,0),(48,NULL,10,'2016-02-21 08:16:10',2,11,0),(49,NULL,12,'2016-02-21 08:16:10',3,11,0),(50,NULL,15,'2016-02-21 08:16:10',4,11,0),(51,NULL,13,'2016-02-21 08:16:10',5,11,0),(52,NULL,11,'2016-02-21 08:16:10',6,11,0),(53,NULL,23,'2016-02-21 08:16:10',7,11,0),(54,NULL,14,'2016-02-21 08:16:11',8,11,0),(55,NULL,10,'2016-02-22 08:47:59',2,26,0),(56,NULL,12,'2016-02-22 08:47:59',3,26,0),(57,NULL,15,'2016-02-22 08:47:59',4,26,0),(58,NULL,13,'2016-02-22 08:47:59',5,26,0),(59,NULL,11,'2016-02-22 08:47:59',6,26,0),(60,NULL,23,'2016-02-22 08:47:59',7,26,0),(61,NULL,14,'2016-02-22 08:47:59',8,26,0),(62,NULL,28,'2016-02-29 14:45:25',99,23,0),(63,NULL,28,'2016-02-29 14:45:25',99,12,0);
/*!40000 ALTER TABLE `owning_signatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_item_states`
--

DROP TABLE IF EXISTS `plan_item_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_item_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_item_states`
--

LOCK TABLES `plan_item_states` WRITE;
/*!40000 ALTER TABLE `plan_item_states` DISABLE KEYS */;
INSERT INTO `plan_item_states` VALUES (1,'Cancelled'),(2,'Approved'),(3,'Pending');
/*!40000 ALTER TABLE `plan_item_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_items`
--

DROP TABLE IF EXISTS `plan_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `value` double NOT NULL,
  `remarks` text COLLATE utf8_unicode_ci,
  `department_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `priority_id` int(11) NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT '0',
  `cancelled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1348 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_items`
--

LOCK TABLES `plan_items` WRITE;
/*!40000 ALTER TABLE `plan_items` DISABLE KEYS */;
INSERT INTO `plan_items` VALUES (63,'SH-FB-2016-001','Plate Warmer 2 eyes',2,17500,'To heat the plates in smartline Restaurant',7,16,1,0,2),(70,'SH-REC-2016-001','sun bed',100,450,'for lagoon beach , Smartline pool',13,16,1,13,2),(71,'SH-REC-2016-002','sun bed Mattresses',100,225,'lagoon beach , Smartline pool',13,16,1,0,2),(72,'SH-REC-2016-003','Moveble Umbrella',25,850,'lagoon beach , Smartline pool',13,16,1,0,2),(76,'SH-FB-2016-003','New Table with marble ',25,500,'for Italian Restaurant upgrad',7,16,1,0,2),(77,'SH-FB-2016-004','New chair',100,300,'New chair can use it in Italian Restaurant upgrad',7,16,1,0,2),(78,'SH-FB-2016-005','Wooden Pergola For Bar',1,30000,'For Guest shadow in Italian Restaurant',7,16,1,0,2),(79,'SH-FB-2016-006','Glass Washing Machine ',2,15000,'in Italian Restaurant pool bar ',7,16,1,0,2),(83,'T1-FO-2016-001','testtete',1,1,'',18,19,1,0,0),(84,'T1-FO-2016-002','test',10,100,'mdlvmldmvl',18,19,1,0,0),(85,'T1-FB-2016-001','tets',1,1,'',7,19,1,0,0),(86,'T1-FO-2016-001','test',1,1,'jbhkjkjb',18,20,1,0,0),(87,'T1-FO-2016-002','test',1,1,'jbkjbkjbkjb',18,20,1,0,0),(88,'T1-FO-2016-003','tyfdfy',1,1,'nknknlk',18,20,1,0,0),(89,'T1-HK-2016-001','nknlkn',1,1,'1',12,20,1,0,0),(90,'T1-HK-2016-002','test',1,1,'n,nlknlk',12,20,1,0,0),(91,'T1-HK-2016-003','test',1,1,'jbkjbkjnb',12,20,1,0,0),(92,'T1-HK-2016-004','hgjhgb',1,1,'knlklkn',12,20,1,0,0),(93,'T1-ENG-2016-001','trdeytftf',1,1,'bkjbkjbkjbkjb',4,20,1,0,0),(94,'T1-ENG-2016-002','khklnlknhl',1,1,'b,jbmbkjn',4,20,1,0,0),(95,'T1-ENG-2016-003','knklnlknlk',1,1,'bnkjnkjnbkjb',4,20,1,0,0),(96,'T1-ENG-2016-004','mlm;lm',1,1,'knlknln',4,20,1,0,0),(99,'GB-FO-2016-003','Club Car Full Renovation',1,20000,'Renew Club Car Tires, Body and Electric Kit.',18,21,1,0,2),(101,'GB-REC-2016-001','Vacuum Set',3,5000,'for daily cleaning swimming Pool (cleaner& Hose & brush & Net & Telescope )',13,21,1,0,2),(102,'GB-REC-2016-002','Umbrellas Head',140,250,'to replace the old damaged one',13,21,1,0,2),(104,'GB-REC-2016-004','Chess game Maintenance',1,15000,'to replace the old damaged one',13,21,1,0,2),(106,'GB-REC-2016-006','wooden Bench',3,5000,'for Football court and archery',13,21,1,0,2),(108,'GB-REC-2016-008','Wind breaker',100,250,'to protect guests from wind on the beach',13,21,1,0,2),(109,'SH-FO-2016-001','Hotel cash deposit Box',1,5000,'for cash delivering to hotel',18,16,1,0,2),(111,'GB-HK-2016-002','Garbage basket stainless 05 liter',100,300,'to replace the old one at all public area ',12,21,1,0,2),(112,'GB-HK-2016-003','Garbage basket stainless 03 liter',100,250,'to replace the old one at guest room',12,21,1,0,2),(113,'GB-HK-2016-004','Garbage basket Blue leather (with logo)',100,250,'to replace the old one at guest room',12,21,1,0,2),(115,'GB-HK-2016-006','Houseman trolley',10,4500,'<p>\n	To replace the O.O.O</p>\n',12,21,1,0,2),(116,'GB-HK-2016-007','Public area cleaning  trolley',5,3500,'for standard service',12,21,2,0,2),(117,'GB-HK-2016-008','Stainless Toilet Brush',100,350,'<p>\n	to change the old one at guest room</p>\n',12,21,1,0,2),(118,'GB-HK-2016-009','Telephone Set- Panasonic',40,400,'<p>\n	to change the old one at guest rooms</p>\n',12,21,2,0,2),(119,'GB-HK-2016-010','Renew lobby curtain',1,50000,'to change the old one ',12,21,2,0,2),(120,'GB-HK-2016-011','Renew lobby furniture',1,100000,'to change the old and damage one',12,21,2,0,2),(121,'GB-HK-2016-012','high pressure machine',1,18000,'for standard service',12,21,1,0,2),(123,'GB-HK-2016-014','Renew guest room blackout',1000,35,'<p>\n	to change the old and damaged one</p>\n',12,21,1,0,2),(132,'SH-FO-2016-002','A5 Acrylic board',500,38,'in all rooms on the back of room door',18,16,1,0,2),(134,'SH-FO-2016-004','Wheel Chair',2,2000,'for handicapped guest ',18,16,2,0,2),(135,'SH-FO-2016-005','Computer Desktop +  Screen 19\"  +  Keyboard + Mouse',1,7500,'for shedwan desk + smartline back area.',18,16,1,0,2),(139,'SH-HK-2016-001','Queen Mattress',162,1050,'140*2m  for SmartLine rooms upgrade',12,16,1,0,2),(140,'SH-HK-2016-002','Twin Mattress',162,720,'1*2m for smartline ',12,16,1,0,2),(141,'SH-HK-2016-003','Shower Curtain',162,500,' for SmartLine rooms upgrade',12,16,1,0,2),(144,'SH-HK-2016-006','Rubbish Basket Leather',162,250,' for SmartLine rooms upgrade',12,16,1,0,2),(146,'SH-HK-2016-007','Balcony Table (forforget)',162,100,' for SmartLine rooms upgrade',12,16,1,0,2),(175,'SH-ENG-2016-003','Heat exchanger 10 ton vertical(to connect all the rooms as well as any future expansions)',2,75000,'For main hot water',4,16,1,0,2),(176,'SH-ENG-2016-004','Pump 5.5 K.W Grundfos according characterization',2,20000,'For main hot water',4,16,1,0,2),(181,'MP-REC-2016-001','Vacuum Set ',3,5000,'',13,23,1,0,2),(182,'MP-REC-2016-002','Umbrellas Head',40,250,'to replace the old damaged one',13,23,1,0,2),(183,'MP-REC-2016-003','Anti slippery Mats',50,600,'to be around the Pool',13,23,1,0,2),(184,'MP-REC-2016-004','table Tennis',1,7000,'to replace the old damaged one',13,23,1,0,2),(185,'MP-REC-2016-005','Wind breaker',100,250,'to protect guests from wind on the beach',13,23,1,0,2),(186,'RM-HK-2016-001','Twintc Machine 120 Liter ',1,29000,'for washing restaurants and corridors',12,22,1,0,2),(187,'RM-HK-2016-002','Vacumm Machine',5,3000,'for rooms\' cleaning',12,22,2,0,2),(188,'RM-HK-2016-003','Water Vacuum',1,5000,'for washing all areas that has no drain',12,22,2,0,2),(189,'RM-HK-2016-004','Baby cot ',20,950,'to replace the very old wooden beds',12,22,1,0,2),(190,'RM-HK-2016-005','Mini Bar',200,800,'we have 400 minibars are not working',12,22,1,0,2),(193,'RM-HK-2016-008','Rubbish Basket 60 Liter for PA toilet',20,1150,'old baskets are broken and very small',12,22,1,0,2),(195,'RM-HK-2016-010','Housekeeping Trolleys',10,6600,'replacement for the very old trolleys had been fixed many many times',12,22,1,0,2),(196,'MP-HK-2016-001','Ironer & Board',10,800,'<p>\n	for extra service as guest satisfaction</p>\n',12,23,2,0,2),(197,'MP-HK-2016-002','Garbage basket stainless 05 liter',100,300,'to replace the old one at all public area ',12,23,1,0,2),(198,'MP-HK-2016-003','Garbage basket stainless 03 liter',100,250,'<p>\n	to replace the old one at guest room</p>\n',12,23,1,0,2),(199,'MP-HK-2016-004','Garbage basket Blue leather (with logo)',100,250,'<p>\n	to replace the old one at guest room</p>\n',12,23,1,0,2),(200,'MP-HK-2016-005','Extra bed standard',30,1200,'<p>\n	for extra service as guest satisfaction</p>\n',12,23,1,0,2),(201,'MP-HK-2016-006','Baby Cot',5,800,'<p>\n	for guest room</p>\n',12,23,1,0,2),(203,'MP-HK-2016-008','Houseman Trolley ',10,4500,'<p>\n	to replace the o.o.o and for standard service</p>\n',12,23,1,0,2),(204,'MP-HK-2016-009','Coffee Tray For Guests\' Rooms ',50,300,'<p>\n	for more guest satisfaction</p>\n',12,23,1,0,2),(205,'MP-HK-2016-010','Stainless Toilet Brush',100,350,'<p>\n	to change the old one at guest room</p>\n',12,23,1,0,2),(206,'MP-HK-2016-011','Telephone Set',50,400,'<p>\n	to change the old one at guest room</p>\n',12,23,2,0,2),(207,'MP-HK-2016-012','single desk machine',1,8000,'for standard service',12,23,1,0,2),(208,'MP-HK-2016-013','Twintec Machine',1,35000,'for standard service',12,23,1,0,2),(209,'MP-HK-2016-014','Carpets For Suites',48,833.34,'for extra service as guest satisfaction',12,23,1,0,2),(210,'MP-HK-2016-015','Renew guest room curtain (voal)',1000,20,'<p>\n	to change the old one</p>\n',12,23,1,0,2),(211,'MP-HK-2016-016','renew lobby furniture',1,80000,'to change the old and damage one',12,23,1,0,2),(212,'MP-HK-2016-017','Renew guest room curtain (black out)',1000,35,'<p>\n	to change the old and damage one</p>\n',12,23,1,0,2),(213,'MP-HK-2016-018','trocycle',2,2200,'for standard service',12,23,2,0,2),(215,'MP-HK-2016-020','Renew Sofas for Family Rooms',180,1100,'for more guest satisfaction',12,23,1,0,2),(218,'GB-FB-2016-003','Cambro trolley',1,7000,'Main restaurant',7,21,1,0,2),(219,'GB-FB-2016-004','Juice dispenser 4 eyes',1,15000,'Main restaurant',7,21,1,0,2),(220,'GB-FB-2016-005','Bar mixer',2,4000,'for beach bar - aqua park bar',7,21,1,0,2),(221,'GB-FB-2016-006','Bar blender',3,5000,'for Main resturant-Gamlia-Aqua park bar',7,21,1,0,2),(222,'GB-FB-2016-007','banquet table',1,13000,'for more guest satisfaction',7,21,1,0,2),(224,'GB-FB-2016-009','Sound system for conference room',1,40000,'for more guest satisfaction',7,21,1,0,2),(227,'GB-KIT-2016-001','Hand Mixer',1,18000,'for hot section',6,21,1,0,2),(228,'GB-KIT-2016-002','Silce Machine(cold cuts)',1,15000,'for saled (gard Mange)',6,21,1,0,2),(229,'GB-KIT-2016-003','Deep fried 2 Eyes 12 Liters',1,18000,'for hot section',6,21,1,0,2),(230,'GB-KIT-2016-004','Soup Cattel',2,7000,'for main restaurant ',6,21,1,0,2),(231,'GB-KIT-2016-005','toaster machine',1,5000,'for gamela restaurant ',6,21,1,0,2),(232,'GB-KIT-2016-006','vegetable cutting Machine',1,13000,'for salad gard mange',6,21,1,0,2),(233,'GB-KIT-2016-007','Rahaia',1,29000,'for  main kitchen',6,21,1,0,2),(234,'GB-KIT-2016-008','frezer ice cream',1,12000,'for pastery section',6,21,1,0,2),(235,'GB-KIT-2016-009','stainless steel blender',1,5500,'for itallin kitchen',6,21,1,0,2),(237,'GB-IT-2016-001','GBIC Single mode',2,3500,'To enhance the network performance',2,21,1,0,2),(238,'GB-IT-2016-002','Catalyst CISCO 2960 24 port',1,12000,'To enhance the network performance',2,21,1,0,2),(239,'GB-IT-2016-003','Office 2013 License',25,2000,'License needs',2,21,2,0,2),(241,'GB-IT-2016-005','P.P',1,8000,'for guest rooms lock doors   ',2,21,1,0,2),(242,'MP-IT-2016-001','GBIC Single mode',2,3500,'To enhance the network performance',2,23,1,0,2),(243,'MP-IT-2016-002','Catalyst CISCO 2960 24 port',1,12000,'To enhance the network performance',2,23,1,0,2),(244,'MP-IT-2016-003','25 Office 2013 License',25,2000,'License needs',2,23,2,0,2),(245,'MP-IT-2016-004',' printer for the order taker office',1,2000,'for housekeeping order taker',2,23,1,0,2),(246,'MP-IT-2016-005','P.P',1,8000,'for guest rooms lock door',2,23,1,0,2),(247,'MP-SEC-2016-001','Stainless.st staff gate',3,8000,'for parking ',14,23,1,0,2),(248,'MP-SEC-2016-002','Explosive Detector ',1,30000,'Security Reasons',14,23,1,0,2),(249,'RM-FB-2016-001','Bar Mixer',3,4100,'New Item For Bar use ( Pergola, Royal & Aqua bar )',7,22,1,0,2),(250,'RM-FB-2016-002','Under Counter Beverages Fridge ( 2 door- 6 shelves)',3,31000,'For Asian & Italian Restaurant ( Replacement Ice Boxes )',7,22,1,0,2),(251,'RM-FB-2016-003','Cambro Clearance Trolleys',2,7400,'New Item For Mexican Restaurant',7,22,2,0,2),(252,'RM-FB-2016-004','Cambro Baby Chair',10,2300,'Increasing The Number which we have for kids increase',7,22,1,0,2),(254,'RM-FB-2016-006','Ice Machine 90 kg',2,17200,'Replacement The Old One From Opening.',7,22,1,0,2),(255,'RM-FB-2016-007','Under Counter Glass washer machine',2,19200,'New Item For A.T.W Restaurant.',7,22,1,0,2),(256,'RM-FB-2016-008','Out Door clearance Trolleys',2,12300,'New Item For Collecting Debrasage around Pools Area ',7,22,2,0,2),(257,'RM-FB-2016-009','Toast Machine big size',1,17350,'Replacement The Old One From Opening at Mexican Restaurant',7,22,1,0,2),(258,'RM-FB-2016-010','Blender Hamilton Beach 2 liter ',3,4780,'New Item For Bar use ( Pergola, Royal & Aqua )for cocktails',7,22,1,0,2),(259,'RM-MAJ-2016-004','Upgrade for Aqua Bar tables & Chairs',1,30000,'<p>\n	20 Marbles Tables &amp; 50 Iron Chairs with Couchants</p>\n',27,22,2,0,2),(260,'RM-MAJ-2016-005','Upgrade conference Room',1,85000,'<p>\n	1 Podium speech, 12 rectangle tables, 10 round tables, 100 banquet chairs, 1 sound system, 1 data show</p>\n',27,22,2,0,2),(261,'RM-MAJ-2016-006','Change some bars from wooden counter to built counter with Marble as per cristal audit ',3,20000,'<p>\n	Asian Restaurant , Italian Restaurant &amp; Victoria Pub Bars</p>\n',27,22,1,0,2),(262,'RM-IT-2016-001','Touch Screen',1,8500,'Al Card Restaurant &amp; Guest Information',2,22,2,0,2),(263,'RM-MAJ-2016-007','Computers Desk',25,8500,'<p>\n	Replace the old pc&#39;s</p>\n',27,22,1,0,2),(265,'RM-IT-2016-004','Monitors ',10,1200,'Replace the Old screen',2,22,1,0,2),(266,'RM-IT-2016-005','External Hard',4,1500,'To Release more network space',2,22,3,0,2),(268,'RM-IT-2016-007','Back up file server ',1,40000,'For the Systems and users back up',2,22,2,0,2),(271,'RM-STA-2016-001','Water Cooler S- less',2,6000,'For the staff Housing  7 El Forsan Cafteria',23,22,2,0,2),(272,'RM-STA-2016-002','Fridge 2 doors',1,25000,'we don\'t have for salad',23,22,3,0,2),(273,'RM-MAJ-2016-008','Civil Work building , store for El Forsan',1,44000,'<p>\n	For Junior, senior and Management Cafteria</p>\n',27,22,3,0,2),(274,'RM-STA-2016-004','Oil Fryer',1,12000,'we have very small old one needs to be supported  ',23,22,1,0,2),(275,'RM-STA-2016-005','Convection oven',1,55000,'we don\'t have any in the staff kitchen',23,22,2,0,2),(276,'RM-STA-2016-006','Air Condition 5 Horse pwer',2,11000,'we don\'t have A/C in the staff kitchen',23,22,2,0,2),(277,'RM-STA-2016-007','meat mincing machine',1,10000,'we don\'t have any.',23,22,1,0,2),(278,'RM-STA-2016-008','Water fillter plant RO',1,15000,'to filltern all the kitchen use water',23,22,1,0,2),(279,'RM-HO-2016-001','fridge 8 cm ',5,1850,'To Complete the senior staff furniture',22,22,1,0,2),(280,'RM-HO-2016-002','Fans ',60,440,'To cover Junior staff housing ',22,22,1,0,2),(281,'RM-HO-2016-003','AC 2.25 Horse power ',6,4000,'for senior staff rooms',22,22,1,0,2),(282,'RM-HO-2016-004','TV Satellite station ',1,10000,'For staff housing & Staff cafteria',22,22,1,0,2),(283,'RM-HO-2016-005','Mattress',50,600,'replacement for OOO',22,22,1,0,2),(284,'GB-SEC-2016-001','Stainless.st staff gate',1,8000,'staff gate',14,21,1,0,2),(285,'GB-SEC-2016-002','Security mirror',2,4000,'Security reasons',14,21,1,0,2),(289,'GB-HR-2016-004','deep freezer',1,12000,'Need it in the kitchen cafeteria ',15,21,1,0,2),(290,'GB-HR-2016-005','Hand Dryer',2,2500,'used in staff toilet',15,21,1,0,2),(291,'RM-FO-2016-001','One XPP',1,25000,'we have no spare telephone lines',18,22,1,0,2),(292,'RM-FO-2016-002','Suzuki Car',1,70000,'for the guest luggage ',18,22,1,0,2),(293,'RM-ACC-2016-001','new metal shelves size 60*60 for the stores ',50,750,'cristal requirement',3,22,1,0,2),(298,'GB-ENG-2016-002','A/C  control unit, wall mounted type, trane',100,350,'replace the damaged one in guest room',4,21,1,0,2),(299,'GB-ENG-2016-003','Complete Toilet Seat Covers In Public Areas ',5,480,'it became in poor condition ',4,21,1,0,2),(300,'GB-ENG-2016-004','hairr dryer ',25,550,'<p>\n	to replace the old damaged one</p>\n',4,21,1,0,2),(301,'GB-ENG-2016-005','Mini Bar',10,1200,'to replace the old one at guest rooms',4,21,1,0,2),(302,'GB-ENG-2016-006','toilet cover idial standard ',100,480,'to replace the old one at guest rooms',4,21,1,0,2),(303,'GB-ENG-2016-007','Complete power saving unit with contactor',50,850,'<p>\n	to replace the old one at guest rooms</p>\n',4,21,1,0,2),(304,'GB-ENG-2016-008','Shower mixer for guest room ',50,700,'to replace the old one at guest rooms',4,21,1,0,2),(305,'GB-ENG-2016-009','Sink mixer for guest room ',50,600,'to replace the old one at guest rooms',4,21,1,0,2),(307,'GB-ENG-2016-011','compressor MT160 for DX units 240',2,14000,'to replace the old one',4,21,1,0,2),(308,'GB-ENG-2016-012','Compressor MT100 for DX180',1,11000,'to replace the old one ',4,21,1,0,2),(309,'GB-ENG-2016-013','control card for A/c unit',15,800,'to increase the efficiency of the units',4,21,2,0,2),(310,'GB-ENG-2016-014','thermostate DX unit',20,2000,'to increase the efficiency of the units',4,21,1,0,2),(311,'GB-ENG-2016-015',' Ref. compressors 1.5 hp',4,8000,'to replace the old one',4,21,1,0,2),(312,'GB-ENG-2016-016',' Ref. compressors 2 HP, ph 3 ',2,13000,'to replace the old one',4,21,1,0,2),(313,'GB-ENG-2016-017','a/c complete unit for kitchen',5,11000,'the existing one not enough to cover all kitchen',4,21,1,0,2),(314,'GB-ENG-2016-018',' A/C Compressor, guest room 03 HP, rotary type    ',20,1400,'to replace the old one',4,21,1,0,2),(315,'GB-ENG-2016-019',' A/C Compressor, guest room 2.25 HP, rotary type    ',40,1000,'to replace the old one',4,21,1,0,2),(316,'GB-ENG-2016-020',' Ref. cooling unit  danfos 3/4 hp',10,4000,'to increase the efficiency of the units',4,21,1,0,2),(317,'GB-ENG-2016-021','Motor fan for cold room',8,950,'to increase the efficiency of the units',4,21,2,0,2),(318,'GB-ENG-2016-022','Rubber Gusket for  refregerator (different sizes)',35,1200,'according to Cristal instructions',4,21,1,0,2),(319,'GB-ENG-2016-023','Complete door handles for walk -in refrigerators',10,1200,'it became in poor condition',4,21,2,0,2),(320,'GB-ENG-2016-024','Walk in refrjerator rooms doors',1,14300,'it became in poor condition',4,21,1,0,2),(321,'GB-ENG-2016-025','New complete air curtains- 120 cm width       ',4,3000,'For the Main Kitchen and the Main Restaurant',4,21,1,0,2),(322,'GB-ENG-2016-026','Sewage water plant submerged pump, for receiving ',1,16000,'to replace the damaged one',4,21,1,0,2),(323,'GB-ENG-2016-027','Sewage water handling pumps',1,45000,'to replace the old damaged one as its became on bad condition',4,21,1,0,2),(324,'GB-ENG-2016-028','Portable type submerged pumps, 220 Volt   ',3,3000,'to replace the old one',4,21,1,0,2),(325,'GB-ENG-2016-029',' Pumps filters housing',6,4000,'to replace the old one',4,21,1,0,2),(326,'GB-ENG-2016-030','submersiable pump 3 HP',3,6500,'to replace the old one',4,21,1,0,2),(327,'GB-ENG-2016-031','motor blower for treatment station',1,85000,'to replace the old one it became on bad conditions',4,21,1,0,2),(328,'GB-ENG-2016-032','pump for poster room 380 voit 11 KW ',1,45000,'to replace the old one it became on bad conditions',4,21,1,0,2),(329,'GB-ENG-2016-033','Hot Water Circulating Pumps ',1,5000,'to replace the old one it became on bad conditions',4,21,1,0,2),(330,'GB-ENG-2016-034','Replacement of stairs granite cluster   ',1,60000,'to fix the drop granite in the building stairs',4,21,1,0,2),(331,'GB-ENG-2016-035','Replacing Old Doors Inside Kitchen ',8,3500,'to replace the old doors inside kitchen',4,21,1,0,2),(335,'GB-ENG-2016-039','Portable Extinguisher, powder type, 06 KG capacity',50,700,'it must be changed every 5 years',4,21,1,0,2),(336,'GB-ENG-2016-040','heated fire detector addressable',10,1600,'to change all the old',4,21,1,0,2),(337,'GB-ENG-2016-041','break glass addressable',5,1600,'to change all the old - safety',4,21,1,0,2),(338,'GB-ENG-2016-042','addressable module',2,1600,'to change all the old - safety',4,21,1,0,2),(339,'GB-ENG-2016-043','fire Fighting panel',2,4000,'to change all the old - safety',4,21,1,0,2),(340,'GB-ENG-2016-044','Portable Extinguisher,Co2, 06 KG capacity',10,1100,'it must be changed every 5 years',4,21,1,0,2),(341,'GB-ENG-2016-045','Portable Extinguisher,Matic, 06 KG capacity',20,1200,'it must be changed every 5 years',4,21,1,0,2),(342,'GB-ENG-2016-046','Exit Lighting Sign',45,850,'For all buildings corridors',4,21,1,0,2),(343,'GB-ENG-2016-047','Emergency lighting units',50,550,'For all buildings corridors',4,21,1,0,2),(344,'GB-ENG-2016-048','Fire Hose Head Multi ',10,1200,'to change all the old -Safety reasons',4,21,1,0,2),(345,'GB-ENG-2016-049','Exhaust Fans For transformers or proper ventilation',10,2800,'For transformers',4,21,1,0,2),(346,'GB-ENG-2016-050','jockey pump',1,8000,'the old one became in a bad condition and it is not safety',4,21,1,0,2),(347,'GB-ENG-2016-051','planko 3 ton',3,5000,'for water treatment station',4,21,1,0,2),(348,'GB-ENG-2016-052','S.Pool Vacum Pump 1.5 HP',2,6000,'To replace the old one as it is became in a bad condition',4,21,1,0,2),(349,'GB-ENG-2016-053','Relax Pool Filteration Pupm 1 HP ',1,4500,'to replace the old one as it is became in bad condition',4,21,1,0,2),(350,'GB-ENG-2016-054','Filteration  Pumps 3 HP for villa',1,9000,'to replace the old one as it is became in bad condition',4,21,1,0,2),(351,'GB-ENG-2016-055','Roof &amp;isolation &amp;A/C  for Angel kids club - Anex',1,75000,'Anex Tour Angel kids Club',4,21,1,0,2),(352,'GB-ENG-2016-056','Games (bicycle , Ping Pong,Wii ,Bowling….etc)',1,50000,'Anex Tour Angel kids Club',4,21,1,0,2),(353,'GB-GRD-2016-001','Manhole Cover (PVC ) Instead Of iron Covers - Different Sizes',20,350,'to replace rusty iron covers',16,21,1,0,2),(356,'GB-GRD-2016-004','Motor pesticide spraying',1,15000,'to replace the old one',16,21,1,0,2),(363,'MP-ENG-2016-004','Sink Mixer ',30,600,'for bath room in guest room',4,23,1,0,2),(364,'MP-ENG-2016-005','Mini Bar ',20,1200,'for more guest satisfaction',4,23,1,0,2),(366,'MP-ENG-2016-007','Electronic Door Lock',20,1200,'to avoid guest  complaints ',4,23,1,0,2),(367,'MP-ENG-2016-008','compressor MT160 for DX units 240',5,14000,'to replace damaged one in main B.',4,23,1,0,2),(368,'MP-ENG-2016-009','Compressor MT100 for DX180',3,10000,'to replace damaged one in main B',4,23,1,0,2),(369,'MP-ENG-2016-010','control card for A/c unit',15,4000,'to replace damaged one',4,23,1,0,2),(370,'MP-ENG-2016-011','DX unit thermostat',20,1000,'to replace the damaged one in main B.',4,23,1,0,2),(371,'MP-ENG-2016-012','A/C Remot control carrier for guest room',50,350,'to change manual contral in Guest rooms',4,23,1,0,2),(372,'MP-ENG-2016-013',' Ref. compressors 3 HP, ph 3 ',4,7500,'to change damaged in ref.',4,23,1,0,2),(373,'MP-ENG-2016-014','Ref. compressors 1,5 HP, HP',4,5000,'to change the damage in ref.',4,23,1,0,2),(374,'MP-ENG-2016-015','Ref. compressors 2 HP, ph3',2,6500,'to change the damage in ref.',4,23,1,0,2),(375,'MP-ENG-2016-016',' A/C Compressor, guest room2.25 HP, rotary type    ',20,1600,'to change damaged in guest room ',4,23,1,0,2),(376,'MP-ENG-2016-017',' A/C Compressor, guest room 03 HP, rotary type    ',40,2000,'ange damaged in guest room',4,23,1,0,2),(377,'MP-ENG-2016-018','Motor fan for cold room',10,1500,'to change the damage in ref.',4,23,1,0,2),(378,'MP-ENG-2016-019','Change Door for cold room   ',5,5000,'to change the damage in ref.',4,23,1,0,2),(379,'MP-ENG-2016-020','Rubber Gusket for  refregerator (different sizes)',1,50000,'to change the damage in ref.',4,23,1,0,2),(380,'MP-ENG-2016-021','New complete air curtains- 120 cm width       ',4,3000,'to change the damaged in enterance ',4,23,1,0,2),(385,'MP-ENG-2016-026','Change inverter for station water ',1,25000,'change the damaged one in water station ',4,23,1,0,2),(386,'MP-ENG-2016-027','sprinkler water for Main dishwasher machine',3,4500,'change the damaged in main dishwasher ',4,23,1,0,2),(387,'MP-ENG-2016-028','Treatment the water leakage in the waterfall( water slide)',1,400000,'to isolate the water leaking ',4,23,1,0,2),(388,'MP-ENG-2016-029','Portable Extinguisher, powder type, 06 KG capacity',35,700,'H&S reasons',4,23,1,0,2),(389,'MP-ENG-2016-030','break glass addressable',8,1600,'H&S reasons',4,23,1,0,2),(390,'MP-ENG-2016-031','addressable module',3,1600,'H&S reasons',4,23,1,0,2),(391,'MP-ENG-2016-032','fire Fighting panel',2,4000,'H&S reasons',4,23,1,0,2),(392,'MP-ENG-2016-033','Fire blanket',5,1200,'H&S reasons',4,23,1,0,2),(393,'MP-ENG-2016-034','Aplik Maghreby (Big )',150,200,'for more guest satisfaction',4,23,1,0,2),(394,'MP-ENG-2016-035','Aplik Maghreby (small)',200,150,'for more guest satisfaction',4,23,1,0,2),(395,'MP-ENG-2016-036','Changed Header st.steel for boiler',2,17500,'change the damaged in boiler ',4,23,1,0,2),(396,'MP-ENG-2016-037','Water pump for boiler ',4,10000,'change the damage in boiler ',4,23,1,0,2),(397,'MP-ENG-2016-038','Hair dryer',50,500,'to change damaged one in guest rooms',4,23,1,0,2),(398,'MP-ENG-2016-039','Safe Box ',50,600,'for more safety in guest rooms',4,23,1,0,2),(402,'MP-GRD-2016-004','Machine cut Honda plants (HHH25)',1,6000,'to cut plants',16,23,1,0,2),(403,'MP-GRD-2016-005','Machine cut grass Honda (216)  ',1,11000,'to cut grass',16,23,1,0,2),(406,'MP-FB-2016-002','Plate dispenser',2,12000,'for pergola and Mexican restaurant. Cristal order',7,23,1,0,2),(407,'MP-FB-2016-003','Welcome Table',1,7000,'for conference room ',7,23,1,0,2),(408,'MP-FB-2016-004','Refrigerator under counter',1,30000,'For Service bar and aqua bar daily distribution ',7,23,1,0,2),(409,'MP-FB-2016-005','room Sevice trolley',1,6000,'to cover all building',7,23,1,0,2),(410,'MP-FB-2016-006','plate trolley cambro',1,8000,'to main restaurant ',7,23,1,0,2),(411,'MP-FB-2016-007','Service Trolley',2,5000,'for Main restaurant to cover all restaurant - cws',7,23,1,0,2),(412,'MP-FB-2016-008','beverage trolley cambro ',2,6000,'For lobby bar',7,23,1,0,2),(413,'MP-FB-2016-009','full Sound system(Mixer,speaker&amplphier)',1,70000,'for victoria pub',7,23,1,0,2),(414,'MP-FB-2016-010','Ice maker 75 KG',1,35000,'for El paso restaurant & for Asian restaurant',7,23,1,0,2),(415,'MP-FB-2016-011','Glass washer',1,29000,'for lobby bar and pergola bar',7,23,1,0,2),(416,'MP-FB-2016-012','fruit and vegetable squeezer',2,10000,'Beach Bar , Mexicain and Main restaurant',7,23,1,0,2),(417,'MP-FB-2016-013','juice dispenser 4 eyes',2,12000,'for Main restaurant Mexican  restaurant',7,23,1,0,2),(418,'MP-FB-2016-014','Electric screen ',1,15000,'for conference room ',7,23,1,0,2),(419,'MP-FB-2016-015','Data show',1,15000,'for conference room ground floor',7,23,1,0,2),(421,'MP-FB-2016-017','banquet Table ',25,800,'For Banquet and  parties',7,23,1,0,2),(422,'MP-FB-2016-018','Water Boiler',2,6000,'For Coffee Stations',7,23,1,0,2),(423,'MP-KIT-2016-001','Minced beef machine ',1,40000,'for gard manger',6,23,1,0,2),(424,'MP-KIT-2016-002','Tilting pan for Rice',1,52000,'For Hot section',6,23,1,0,2),(425,'MP-KIT-2016-003','Hand Mixer',1,8000,'For hot section and activity',6,23,1,0,2),(426,'MP-KIT-2016-004','Microwave',2,4000,'For Grill House & Hot Kitchen',6,23,1,0,2),(427,'MP-KIT-2016-005','Vegetable washing Machine',1,80000,'For Washing Vegetable & Fruits',6,23,1,0,2),(428,'MP-KIT-2016-006','Slice Machine(cold Cuts)',1,16000,'For Kitchen',6,23,1,0,2),(429,'MP-KIT-2016-007','Deep fried 2 Eyes 12 liter',1,18000,'for pergola bar',6,23,1,0,2),(430,'MP-KIT-2016-008','High Pressure Machine',1,8000,'for Cleaning ',6,23,1,0,2),(431,'MP-KIT-2016-009','carving unit',1,15000,'for Carving ',6,23,1,0,2),(432,'MP-KIT-2016-010','Hot Cabinet',1,38000,'Fot Hot Kitchen',6,23,1,0,2),(433,'MP-KIT-2016-011','Trolley Campro',2,15000,'for Outlets',6,23,1,0,2),(434,'MP-KIT-2016-012','St. St. Trolley from CWS',2,8000,'For Cold & Hot Kitchen',6,23,1,0,2),(435,'MP-KIT-2016-013','Toaster Cutting machine',1,12000,'for the Buffet',6,23,1,0,2),(436,'MP-KIT-2016-014','Cereal dispenser',5,1500,'For Buffet Breakfast',6,23,1,0,2),(437,'MP-KIT-2016-015','Soup Cattle',2,7000,'for Elpaso restaurant',6,23,1,0,2),(438,'MP-KIT-2016-016','toaster machine',1,5000,'for Elpaso restaurant and main rest',6,23,1,0,2),(439,'MP-KIT-2016-017','Sushi counter',1,12000,'for Belguim Corner',6,23,1,0,2),(445,'AB-HK-2016-001','welcome tray full set up',50,450,'to replace the OOO',12,24,1,0,2),(446,'AB-HK-2016-002','Rooms Upholstery Renewing ',150,2000,'To renew the Rooms upholstery which became in bad condition',12,24,1,0,2),(447,'AB-HK-2016-003','Rooms Accessories polishing',200,300,'to polish the rusti accessories',12,24,1,0,2),(448,'AB-HK-2016-004','Reading Lamp',400,140,'to replace the OOO',12,24,1,0,2),(449,'AB-HK-2016-005','Buildings signs renovation',1,60000,'To renovate all buildings signs',12,24,1,0,2),(450,'AB-REC-2016-001','Sun beds with mattress ',300,1400,'we will need 1100 sunbed when we will be full occupancy and we have 850 sunbed right now ',13,24,1,0,2),(453,'RM-Maj-2016-001','Upgrade the swimming pool ',1,600000,'<p>\n	new liner inside the pool- change the outside land around swimming pool ( marble &amp; drained) -Fully remove rocks-over flu - repair the vacuum machine</p>\n',27,22,1,0,2),(454,'RM-Maj-2016-002','Renew the Kids Area',1,30000,'<p>\n	all swings, floors and wals needs renovation</p>\n',27,22,3,0,2),(456,'RM-REC-2016-005','renew the information boards ',1,115000,'as first part of signage plan',13,22,1,0,2),(457,'RM-REC-2016-006','renew the gym floor ',1,35000,'the floor is damaged and guest fell down to the spa ceiling',13,22,1,0,2),(458,'AB-REC-2016-002','movable umbrella for the royal swim up ',20,1650,'for the main pool as we don’t have enough shade',13,24,1,0,2),(459,'AB-REC-2016-003','kids play ground at the beach',1,50000,'To realocate the kids playground at the beach with shade',13,24,1,0,2),(461,'AB-REC-2016-004','Rules and regulations signs for the beach and pools',1,150000,'<p>\n	Missing since opening</p>\n',13,24,1,0,2),(462,'AB-REC-2016-005','Increase cabanas at the Beach & rearrange the Beach',10,10000,'to increase upselling',13,24,1,0,2),(463,'AB-REC-2016-006','Inflated water park ',5,30000,'Mohamed Badr',13,24,1,0,2),(465,'SH-KIT-2016-001','Blinder ',2,3750,'italian SS Capacity 3 Lt.',6,16,1,0,2),(467,'AB-FB-2016-001','Blender Hamilton Beach',1,4200,'For Royal Club & Italian',7,24,1,0,2),(468,'AB-FB-2016-002','Ice crucher machine CK-108 ',2,5500,'For all outlet',7,24,2,0,2),(469,'AB-FB-2016-003','Fridge under counter',1,16500,'for the service bar of the 2 main restaurants as the existing one is not enough specailly when we are 100% occupancy',7,24,1,0,2),(470,'AB-FB-2016-004','Granita machine ',1,15000,'for chilled beverages in all outlets',7,24,2,0,2),(471,'AB-FB-2016-005','Juice dispenser ',2,7700,'for the second main restaurant Sunrise International',7,24,1,0,2),(472,'AB-KIT-2016-001','Toaster Conveyor',1,11500,'We only have 2 toaster serving two buffet in the same time so there is no spare one',6,24,1,0,2),(473,'AB-KIT-2016-002','Chafing Dishes (Rectangular GN 1/1) electric heated',15,6500,'To be used for gala dinner, outdoor cooking events and to be used for  the kitchen back area of the a la carte restaurants and to save energy ',6,24,1,0,2),(474,'AB-KIT-2016-003','Double Iron Panini Sandwich Iron ',1,10500,'To be used in both Royal Club and Island Pool',6,24,1,0,2),(475,'AB-KIT-2016-004','Induction Cookers',4,8800,'Needed for the Main Restaurants as we have some induction cookers out of order must be replaced',6,24,1,0,2),(476,'AB-KIT-2016-005','Chafing Dish (Combined with the induction cookers)',4,5000,'A total of NINE Chafing dishes required for the induction cookers to replace all the depreciated ones',6,24,1,0,2),(477,'AB-KIT-2016-006','Soup Kettle',4,1800,'Needed for the daily operation at buffet and outlets area',6,24,1,0,2),(478,'AB-KIT-2016-007','        Stainless Steel Oven Trolley                                                             L 82 cm  x W 66 cm  x  H 167  cm                                             ',2,18500,'Roratry Oven Trolley needed for the Bakery Section',6,24,1,0,2),(480,'AB-KIT-2016-009','S/S Double Door Hot Cabinet 16 shelves',1,34500,'Needed for the daily operation at buffet and outlets area',6,24,1,0,2),(481,'AB-KIT-2016-010','Salamander ',3,18500,'To be used in the italian Restaurant and Blue Blue Restaurant and the Royal Club',6,24,1,0,2),(483,'AB-ENG-2016-001',' Rooms Grouting  ',200,2000,'',4,24,1,0,2),(486,'AB-ENG-2016-004',' Building Dry Mix Façade Painting Renewal ',9,20000,'',4,24,1,0,2),(487,'AB-ENG-2016-005',' Building HK stores in the Rooms Buildings&boxes for dirty linen ',14,5000,NULL,4,24,1,0,2),(488,'AB-ENG-2016-006',' Revolving Door for the lobby ',1,300000,'',4,24,1,0,2),(490,'AB-Maj-2016-001',' Main Pool Grouting & adjusting the sandy beach ',1,500000,NULL,27,24,1,0,2),(491,'AB-ENG-2016-009',' pump filter 5.5 hp ',1,77000,'',4,24,1,0,2),(492,'AB-ENG-2016-010',' sand filter 1m3 ',1,28500,'',4,24,1,0,2),(493,'AB-ENG-2016-011',' Jetty Overall renovation ',1,50000,'',4,24,1,0,2),(494,'AB-ENG-2016-012',' Pools and Fountains LED Light Color ',1,148000,'',4,24,2,0,2),(495,'AB-ENG-2016-013','Felucca Sky and Felucca Terrace Bar ',1,30000,'',4,24,1,0,2),(496,'AB-ENG-2016-014',' Beach Bar to serve the guest at the beach',1,40000,'',4,24,1,0,2),(497,'AB-ENG-2016-015','Kids Buffet in Nora Nora',1,70000,'',4,24,1,0,2),(498,'AB-ENG-2016-016',' cables press (16:300)mm ',1,12700,'',4,24,1,0,2),(499,'AB-ENG-2016-017',' grundfos pump 5.5 hp ',2,9450,'',4,24,1,0,2),(500,'AB-ENG-2016-018',' grundfos pump3.5 hp ',3,6800,'',4,24,1,0,2),(501,'AB-ENG-2016-019',' Main Holes leakage treatment ',105,500,'',4,24,1,0,2),(502,'AB-ENG-2016-020',' Club Cars overall  ',13,8000,'',4,24,1,0,2),(503,'AB-ENG-2016-021',' Air Hand Unit touch screen ',3,8000,'',4,24,1,0,2),(504,'AB-GRD-2016-001','Grass cutting machine',1,10350,'as the exist one getting so much OOO',16,24,1,0,2),(508,'SH-KIT-2016-005','Soup pool',4,2500,'to keep soup hot on the buffet',6,16,1,0,2),(509,'SH-KIT-2016-006','Deep Freezer counter',1,3500,'250 Lt.',6,16,1,0,2),(512,'SH-KIT-2016-009','Toaster',2,4500,'for smartline buffet ',6,16,1,0,2),(513,'SH-KIT-2016-010','slices cutting machine',1,7000,'for cheese & cold cuts in Gard Manjee department',6,16,1,0,2),(514,'SH-KIT-2016-011','Ice Maker',1,120000,'250 Lt. for kitchen',6,16,1,0,2),(515,'SH-KIT-2016-012','potatoes peeler',1,8000,'for peel potatoes ',6,16,1,0,2),(516,'SH-KIT-2016-013','Waffle machine',2,12000,'for smartline Buffet',6,16,1,0,2),(534,'SH-HK-2016-013','Twintech Machine',1,28500,' for SmartLine rooms upgrade',12,16,1,0,2),(535,'SH-HK-2016-014','Blackout Curtain',162,280,' for SmartLine rooms upgrade',12,16,1,0,2),(536,'SH-HK-2016-015','Light Curtain',162,132,' for SmartLine rooms upgrade',12,16,1,0,2),(538,'SH-HK-2016-017','Holder for Big Towels',162,300,' for SmartLine rooms upgrade',12,16,1,0,2),(541,'SH-ENG-2016-005','Electronic frequency inverter   .',1,30000,'For  fresh water pumps',4,16,1,0,2),(542,'SH-IT-2016-001','Computre Desktop +  Screen 19\"  ',4,6000,'1- For Engineering ( they have a laptop broken )                            2- For Cost Controller ( they have a damage pc )   3- for Quality Manager ( he have a bad old pc )       4- PC For IT Server',2,16,1,0,2),(551,'SH-ENG-2016-006','Pumps 5.5 K.W Grundfos .',2,20000,'For fresh water  network',4,16,1,0,2),(552,'SH-ENG-2016-007','Exhaust fan 4000 cfm',2,7500,'For smart line and Shedwan restaurant',4,16,1,0,2),(553,'SH-ENG-2016-008','Full automatic dousing pumps .',3,10000,'Cristal protocol',4,16,1,0,2),(556,'SH-ENG-2016-011','Up great the satellite station &amp; network',1,30000,'shedwan',4,16,1,0,2),(557,'SH-ENG-2016-012','Horse-conditioning unit 55 redundant workers Cafeteria',1,114000,'New - El Forsan',4,16,1,0,2),(561,'SH-HR-2016-003','Computer unit',1,5100,'',15,16,1,0,2),(565,'SH-HR-2016-007','Mixer ',1,10500,'New - El Forsan',15,16,1,0,2),(566,'SH-HR-2016-008','Refrigerator 2 door ',1,25000,'New - El Forsan',15,16,1,0,2),(576,'RM-KIT-2016-001','cold display for guard monger',4,15000,'the current one are hopless cases',6,22,1,0,2),(577,'RM-KIT-2016-002','Stainless refrigerator 2 doors 10 shelves ',6,27000,'new one for mexican buffet and two replacement of OOO and extra 3 as per cristal',6,22,1,0,2),(578,'RM-KIT-2016-003','Croissant oven 6 G.N ',2,35000,'high guest satisfaction',6,22,1,0,2),(579,'RM-KIT-2016-004','Food blender (stainless container Hamilton beach)',2,4000,'we don\'t have in any A\'la carte restaurant',6,22,1,0,2),(580,'RM-KIT-2016-005','Mixer 5 kg for the pastry section ',2,6000,'we have two old OOO since 6 years',6,22,2,0,2),(586,'RM-KIT-2016-011','Deep fryer gas double sink',2,25000,'we have only one and it\'s OOO',6,22,1,0,2),(587,'RM-KIT-2016-012','Gas grille 70*90',1,8000,'replacement for OOO one in main kitchen',6,22,1,0,2),(588,'RM-KIT-2016-013','Pizza spreader',2,26000,'replacement for OOO one',6,22,1,0,2),(589,'RM-KIT-2016-014','dough cutting machine',1,15000,'replacement for OOO one we spent more money for useless maintenance',6,22,1,0,2),(590,'RM-KIT-2016-015','Toast cutting machine',1,4000,'we don\'t have any. and we need it for the huge operation and guest satisfation.',6,22,2,0,2),(592,'RM-KIT-2016-017','soup bowl stainless',4,4500,'two for mexican buffet and two for Dalila restaurant',6,22,2,0,2),(594,'RM-KIT-2016-019','vertical belending machine 25K',1,25000,'we have small one 10 KGM not enough for more than 40% occupancy',6,22,1,0,2),(596,'RM-KIT-2016-021','Big pasta cooker 2 eyes',2,20000,'main buffet has only very small one and needs to be supported for heavy common operation',6,22,2,0,2),(597,'RM-KIT-2016-022','Dishwasher machine single tank with pressure ',1,65000,'the one in Bedwin restaurant is OOO',6,22,3,0,2),(598,'RM-KIT-2016-023','Glass washer machine ',2,28000,'we need one for the family bar and italian restaurant as per cristal',6,22,3,0,2),(599,'RM-KIT-2016-024','salamander',1,10000,'we need one for the Steak house ',6,22,1,0,2),(603,'RM-ENG-2016-003','new electric panels for equipment ( earth leakage) ',1,80000,'for safety wise to switch off equipments in case of electricity leaking',4,22,1,0,2),(606,'RM-MAJ-2016-009','change rooms to be handicap',10,15000,'<p>\n	NN instruction &amp; sales</p>\n',27,22,1,0,2),(608,'RM-MAJ-2016-010','upgrade  pool bars',1,25000,'<p>\n	very poor conditions since the opening</p>\n',27,22,2,0,2),(610,'RM-MAJ-2016-011','Pub renovation',1,50000,'<p>\n	as per chairman</p>\n',27,22,2,0,2),(611,'RM-ENG-2016-011','Hot water circulation pumps',1,80000,'to avoid guest complain. we have very old small one',4,22,1,0,2),(613,'RM-ENG-2016-013','Changing media &amp; repair for swimming pool sand fliters',10,15000,'backwash of filter consume a lot of water plus very law results',4,22,1,0,2),(614,'RM-MAJ-2016-012','submersible injectors pumps for the sewage plant ',4,37500,'<p>\n	the old pumps from opening the repair cost is very hight</p>\n',27,22,1,0,2),(616,'RM-ENG-2016-016','submersible pumps for the rooms machine ',8,2000,'in case of water leakage to save the machines and people ',4,22,1,0,2),(617,'RM-ENG-2016-017','Filteration pump',3,26000,'the oldest pumps from opening the repair cost is very hight',4,22,1,0,2),(618,'RM-ENG-2016-018','multi media filters for the potable water',3,30000,'for safety wise to provide clean potable water for cooking and beverage instead of mineral water',4,22,1,0,2),(623,'RM-ENG-2016-023','Mega tester ',1,9000,'to test the electric cable and heaters for maintenance and insurance',4,22,1,0,2),(626,'RM-ENG-2016-026','High pressure machine',1,5000,'for preventative maintenance & cleaning the filters',4,22,1,0,2),(628,'RM-MAJ-2016-013','modify new rack with two line cards',1,150000,'<p>\n	for emergency telephone lines at guest area corridors &amp; we have not any spare line for guest and admin</p>\n',27,22,2,0,2),(632,'RM-ENG-2016-032','A/C compressor for cold rooms',3,15000,'we wasted more money and time to repair the old unit',4,22,1,0,2),(633,'RM-ENG-2016-033','A/C compressor for DX units',3,8500,'replacement',4,22,1,0,2),(635,'RM-ENG-2016-035','A/C compressor for guest rooms 2.25&amp;2.5 3HP',50,1500,'to facilitate changing the fused one in guest rooms.',4,22,1,0,2),(640,'RM-ENG-2016-040','change defective cables, junction boxes and conduits at landscape',43,1600,'guest and staff safety',4,22,1,0,2),(641,'RM-ENG-2016-041','new electric panels for landscape ( earth leakage)',15,8000,'guest and staff saftey',4,22,1,0,2),(643,'RM-ENG-2016-043','changing defective cables, junction boxes indoor',1,50000,'guest safety  and  equipments the old is bad looking ',4,22,1,0,2),(645,'RM-MAJ-2016-014','Rotating door for lobby',1,80000,'<p>\n	to save the aircondtion at lobby area</p>\n',27,22,1,0,2),(646,'RM-ENG-2016-046','club car control unit',2,6000,'to repair the old club car ',4,22,1,0,2),(647,'RM-ENG-2016-047','new motor for shuttle bus',1,25000,'the motor from opening and need to be changed',4,22,1,0,2),(654,'CB-FO-2016-005','Tablet',2,5500,'For the guest use according to the Grand Select concept we offer internet café',18,25,1,0,2),(655,'CB-MAJ-2016-054','Wireless',2,3000,'<p>\n	for the buttler service and for the Guest Service Center Team</p>\n',27,25,1,0,2),(656,'CB-REC-2016-001','Vacum Set',3,5000,'For the swimming pools',13,25,1,0,2),(657,'CB-REC-2016-002','Umbrella',10,2000,'For the beach area and pool area',13,25,1,0,2),(658,'CB-MAJ-2016-003','Sunbeds',100,1200,'<p>\n	For the beach area and pool area</p>\n',27,25,1,0,2),(659,'CB-REC-2016-004','Windbreak Renovation',30,200,'<p>\n	Windbreak maintenance for the damaged old ones</p>\n',13,25,1,0,2),(660,'CB-REC-2016-005','Leather mattress',100,300,'for the beach sunbeds',13,25,1,0,2),(661,'CB-REC-2016-006','Windbreak',30,600,'For the beach area  ',13,25,1,0,2),(662,'CB-MAJ-2016-055','Tennis Chair',2,1000,'<p>\n	to replace old damaged one</p>\n',27,25,1,0,2),(663,'CB-REC-2016-008','Tennis Net Doubl face ',2,6000,'to replace damaged old one',13,25,1,0,2),(664,'CB-REC-2016-009','Football court Net',100,90,'to replace damaged old one',13,25,1,0,2),(665,'CB-REC-2016-010','Tennis Table',1,7000,'to increase one table more as one is not enough for the guests',13,25,1,0,2),(666,'CB-ACC-2016-001','New Digtetal  Scale 500 Kg',1,25000,'Replace Old Receiving Scale  (This Scale Used From Conrad)',3,25,1,0,2),(667,'CB-IT-2016-001','GBIC Single mode',2,3500,'To enhance the network performance',2,25,1,0,2),(668,'CB-IT-2016-002','Catalyst CISCO 2960 24 port',1,12000,'To enhance the network performance',2,25,1,0,2),(669,'CB-IT-2016-003','Office 2013 License',25,2000,'License needs',2,25,1,0,2),(670,'CB-MAJ-2016-057m','Printer 401 HP',1,2500,'<p>\n	for GSC Departmant replace for old one</p>\n',27,25,2,0,2),(671,'CB-IT-2016-005','LapTop HP Probook',1,8000,'For Conference Room',2,25,2,0,2),(675,'CB-STA-2016-001','Boiler 50 liters',2,3000,'Boiler for tea',23,25,1,0,2),(676,'CB-STA-2016-002','Mixer soup ST/ST ( robot coupe )',1,12000,'to be used in preparing meals ',23,25,1,0,2),(677,'CB-STA-2016-003','Freezer Head 1 door',1,14000,'to keep the meat ',23,25,1,0,2),(679,'CB-STA-2016-005','Juice Mechanic',1,8500,'to be used in staff cafetria ',23,25,2,0,2),(680,'CB-STA-2016-006','Koldair',2,6000,'for the staff in the hotel ',23,25,1,0,2),(681,'CB-STA-2016-007','Table corian',20,350,'to be used in staff cafetria ',23,25,1,0,2),(682,'CB-STA-2016-008','Service trolley ST/ST 3 Level',2,3000,'Kitchen service trolly for material transfer and for transfering the received items from stores ',23,25,1,0,2),(683,'CB-STA-2016-009','Kitchen trolley ST/ST  10 shelf',2,6000,'Kitchen trolly with trays to be kept in fridge ',23,25,1,0,2),(688,'CB-MAJ-2016-058','Washing machine 3 kilo',20,375,'<p>\n	for Managers rooms in the housing</p>\n',27,25,1,0,2),(692,'MO-HK-2016-003','HK trolley',4,8500,'To complete all buildings as it is missing since opening',12,26,1,0,2),(701,'RM-ENG-2016-053','Electronic door lock',10,2700,'we have not enough for spare ',4,22,1,0,2),(709,'RM-ENG-2016-060','A/C compressors for fridges, freezers &amp; ice makers',18,4500,'to increase the effeincy of all coling units',4,22,1,0,2),(712,'RM-MAJ-2016-015','Change steam network for boiler & laundry',1,100000,'<p>\n	the network is completely at very bad condition and cost of chemical is very hight and steam and hot water</p>\n',27,22,1,0,2),(714,'CB-HK-2016-001','Stainless Steel Ash Urns',80,550,'to upgrade the number of ash urns and to complete the missing',12,25,3,0,2),(720,'CB-HK-2016-007','Wooden Baby Cot for Guestrooms',30,1200,'to replace the out of order ones',12,25,1,0,2),(721,'CB-HK-2016-008','Light Curtains for Guestrooms and Suites',100,250,'to replace the out of order ones',12,25,1,0,2),(722,'CB-HK-2016-009','Black Out Curtains for Guestrooms and Suites',40,500,'to replace the out of order ones',12,25,1,0,2),(723,'CB-MAJ-2016-001','Runner for Guestrooms',450,160,'<p>\n	to replace the current one as it became in bad condition</p>\n',27,25,1,0,2),(724,'CB-MAJ-2016-002','Skirting for Guestrooms',650,200,'<p>\n	to replace the current one as it became in bad condition</p>\n',27,25,1,0,2),(725,'CB-HK-2016-012','Stainless Steel Garbage Bin 20 Liter',20,500,'to replace the out of order ones',12,25,1,0,2),(730,'CB-HK-2016-017','Digital Safe Box for rooms',25,800,'to replace the out of order ones',12,25,1,0,2),(736,'CB-HK-2016-023','Walk off mats for hotel & Villas entrances',40,1500,'to replace the out of order and complete missing ones',12,25,2,0,2),(737,'CB-HK-2016-024','Anti Slippery mats for Shower in rooms',100,300,'to be used in guestrooms & villas shower area',12,25,1,0,2),(738,'CB-HK-2016-025','Room Attendant Trolley',12,3000,'to replace the out of order ones',12,25,1,0,2),(739,'CB-HK-2016-026','Room Attendant Linen Trolley',20,1000,'to replace the out of order ones',12,25,1,0,2),(740,'CB-HK-2016-027','Extra Bed Trolley',20,1200,'to be used for moving extra bed in rooms',12,25,1,0,2),(743,'CB-HK-2016-030','Ladders for cleaning high surfaces',22,400,'to be used for cleaning high surfaces in rooms and public areas',12,25,1,0,2),(746,'CB-HK-2016-033','Balcony Table Rattan',100,300,'to replace the current one as it became out of order',12,25,1,0,2),(747,'CB-HK-2016-034','Stand Lamp for old guestrooms',50,250,'to replace the current one as it became out of order',12,25,2,0,2),(750,'CB-HK-2016-037','Air conditioner for Uniform Room',1,5000,'<p>\n	as the room is very hot during summer time</p>\n',12,25,1,0,2),(752,'CB-FB-2016-002','High quality juice squeezer',1,40000,' To be used for making fresh orange juice in the morning for all guest in house',7,25,1,0,2),(753,'CB-FB-2016-003','Blender',1,6000,' To be used for Felucca Fish Restaurant',7,25,1,0,2),(754,'CB-FB-2016-004','Heat Lamp',1,4000,' To be used for Poseidon Beach Restaurant and Grill House to keep the food heated enough',7,25,3,0,2),(755,'CB-FB-2016-005','Mashrom/electric heaters ',10,3000,' to be used in outdoors area during winter season ',7,25,1,0,2),(756,'CB-FB-2016-006','Room service trolley ',2,6000,' To be used for room service',7,25,1,0,2),(757,'CB-FB-2016-007','Juice dispenser ',2,12000,' To be used at the beach bar and Lobby Bar',7,25,1,0,2),(758,'CB-MAJ-2016-056','Wine trolley',1,3000,'<p>\n	To be used for lobby bar for selling wine</p>\n',27,25,1,0,2),(759,'CB-FB-2016-009','Mobil bar Cambro',2,20000,' To be used for Main restaurant terrace and lobby bar terrace. ',7,25,2,0,2),(761,'CB-MAJ-2016-013','New irriggation network  for the island in front of hotel & renovation the old network inside hotel		',1,80000,'<p>\n	for planted The Midle Island As per Owner Request&amp; renovation the old irrigation network inside hotel because its not working well.</p>\n',27,25,1,0,2),(764,'CB-GRD-2016-005','Automatic fertilization machine with assembly',1,10000,' automatic fertilizaton machine for add the fertilizer automatic while irrigate gardens with the irrigation network',16,25,2,0,2),(765,'CB-GRD-2016-006','mower grass machine 5.5 hp (HONDA)',2,11000,'replacment for o o o machines',16,25,1,0,2),(768,'CB-GRD-2016-009','overhauling for landscape machines',1,25000,'<p>\n	need it for the whole year</p>\n',16,25,2,0,2),(771,'MO-HK-2016-009','Outdoor waste bin',50,450,'To complete the missing including spare',12,26,2,0,2),(779,'MO-REC-2016-002','Round sunbeds',20,3000,'To complete 10 % of the rooms capacity',13,26,1,0,2),(780,'MO-REC-2016-003','Pool Umbrellas',100,1650,'To complete the missing order from opening',13,26,2,0,2),(781,'MO-FB-2016-001','Club car',1,120000,'For room service and F&B use',7,26,1,0,2),(799,'MO-STE-2016-003','Stewrad stand shelves units',15,800,'For proper storgae of equipments in steward stores',24,26,1,0,2),(800,'MO-IT-2016-001','HP  Ram Memory 8GB DDR3 ',6,2000,'fidelio server upgrade 8960 to 8962',2,26,1,0,2),(801,'MO-IT-2016-002','San Storage 10 TB',1,12000,'for backup servers as we do not have enough space',2,26,1,0,2),(802,'MO-IT-2016-003','HP Switch 2920-24G-PoE',1,16000,'for admin network',2,26,1,0,2),(803,'MO-IT-2016-004','HP Elitedesk 800 G1 tower pc Core i5',2,7000,'1 for Bellman 1 for Desk Reception - missing since opening',2,26,1,0,2),(805,'MO-IT-2016-006','Projector ',1,5000,'For conference needs',2,26,1,0,2),(806,'MO-SEC-2016-001','Security Mirror',2,3000,'For security entrance (main gate & receiving gate',14,26,1,0,2),(807,'MO-SEC-2016-002','Luggage Xray',1,275000,'Security needs by governement',14,26,1,0,2),(809,'MO-ENG-2016-001',' Sewage network, anti smell valve for guest rooms',273,60,'For avoiding bad smell in guest bathroom',4,26,1,0,2),(810,'MO-ENG-2016-002',' Grouting for rooms ',134,1500,' (Second Phase, To complate all the hotel as the first phase was in 2015 ',4,26,1,0,2),(815,'MO-ENG-2016-007','Indoor service bar for main restauarant',1,30000,'To facilitate the guests services - construction only without tools',4,26,1,0,2),(823,'CB-KIT-2016-001','Trolley Cambroo for pastry ',2,12000,'for food transfer and pastries from the main building to Poseidon Restaurant and Felucca Restaurant, request from Cristal due to not enough cambro for food transfer from kitchen to outlets ',6,25,1,0,2),(824,'CB-KIT-2016-002','Hand Mixer 60sm',1,18000,'To prepare food in Kitchen ',6,25,1,0,2),(825,'CB-KIT-2016-003','Flour mixer sp 80 Letter',1,66000,'Flour Mixer For Pastry center ',6,25,2,0,2),(826,'CB-MAJ-2016-004','Potato Peeler 30kg ',1,78600,'<p>\n	To be used in the preparation area for potatoes peeling and vegetables</p>\n',27,25,2,0,2),(827,'CB-KIT-2016-005','vertical freezer double door for fish kitchen',1,20000,'To keep the fresh fish for Felucca restaurant and to separate the items in fredges ',6,25,1,0,2),(828,'CB-KIT-2016-006','fryer unit built in unit for main buffet ',1,20000,'To be used on buffet in Main Restaurant as the exist one is not enough for the operation if occupancy more than 60%',6,25,1,0,2),(829,'CB-MAJ-2016-005','Spiral mixer dough,80 liter',1,91850,'<p>\n	To be used in pastry center (for 3 hotels)</p>\n',27,25,3,0,2),(830,'CB-MAJ-2016-006','convection oven (20 chefing dish)',1,120000,'<p>\n	To be used in main kitchen as the exist one is not enough for the operation if over 60% and the exist one will be transferred to Poseidon kitchen</p>\n',27,25,1,0,2),(831,'CB-KIT-2016-009','electric blender for kitchen (4liters)',2,10000,'To be used in Indian kitchen, Italian kitchen and pastry ',6,25,3,0,2),(832,'CB-MAJ-2016-007','hot cabinet double door for holding kitchen',1,82000,'<p>\n	To be used in main kitchen as the exist one is not enough for the operation over 60% Occ</p>\n',27,25,1,0,2),(833,'CB-KIT-2016-011','stainless shelves (140*45*180 cmand50cm between shelves )  for walk in fridge ',4,3000,'To be used in yogurt and cheese fridge & bakery fridge & pastry center fridge   ',6,25,3,0,2),(834,'CB-KIT-2016-012','electric rice cooker ',2,10000,'To be used in Indian kitchen and Felucca as per Cristal request to replace the out of order one',6,25,1,0,2),(835,'CB-KIT-2016-013','gas cooker 6 fire',1,24000,'To be used in Felucca kitchen (the existing is not enough and not good quality)  ',6,25,1,0,2),(836,'CB-KIT-2016-014','vertical fridge for fish kitchen ',1,25000,'to be used in fish defrost in Felucca, requested from Cristal  ',6,25,1,0,2),(837,'CB-KIT-2016-015','trolley box with cover  for sugar and flour ',2,4000,'To keep flour, sugar in pastry center ',6,25,1,0,2),(838,'CB-KIT-2016-016','chocolate fountain 4 leayrs  for pastry ',1,30000,'To be used in parties and events  ',6,25,2,0,2),(839,'CB-KIT-2016-017','toaster machine for buffet',1,25000,' To be used in main buffet and Royal buffet ',6,25,1,0,2),(840,'CB-KIT-2016-018','moved salamander with heaters( heated 4 kw),',2,7750,' To be used in Felucca kitchen and Indian kitchen',6,25,2,0,2),(841,'CB-KIT-2016-019',' normal fridge 8ft for caviar and special items  ',1,2000,'Fridge to keep special kind of food (such as Caviar) ',6,25,1,0,2),(842,'CB-STE-2016-001','black electric kettle soup ',4,2000,' To be used on Buffet of Main Restaurant & Poseidon',24,25,2,0,2),(843,'CB-STE-2016-002','Chefing dish belt in stanless1/2 for main buffet ',4,6000,'To be used on buffet in Main Restaurant ',24,25,1,0,2),(844,'CB-STE-2016-003','chefing dish belt in stanless1/1 for kids & Poseidon buffet ',4,4000,'To be used in Poseidon buffet and kids buffet ',24,25,3,0,2),(845,'CB-STE-2016-004','stainless counter table( 200*70*85 cm) for  main kitchen',4,3000,'To be used in hot kitchen / preparation / cold kitchen and pastry ',24,25,3,0,2),(846,'CB-STE-2016-005','Service trolley  stainless with three stainless shelves 100 × 80 × 85 cm,',5,2500,'To be used in kitchen to replace the old damaged one  ',24,25,3,0,2),(847,'CB-STE-2016-006','cambroo garbage trolley for depth garbage (380 liters)',2,7000,'To transfer garbage from Poseidon, Felucca kitchen and outlets  ',24,25,2,0,2),(848,'CB-STE-2016-007','stainless tank with heater for deep in cleaning (steward) (140*100*90cm)',1,7000,'To wash stales steel tools and china ',24,25,3,0,2),(851,'CB-ENG-2016-003','Door double lock for junior suites ',87,200,'all the bed room in junior suites need lockable lock',4,25,1,0,2),(853,'CB-ENG-2016-005','Telephone sets for guestrooms ',50,200,'Instead of the old one it is not working well and to avoide the guest complains',4,25,1,0,2),(854,'CB-ENG-2016-006','parking tenda for the cars ',20,2000,'for the cars as the one exist is too small for 8 cars only',4,25,1,0,2),(855,'CB-ENG-2016-007','Linen room ',1,30000,'for linen receiving and collecting from the buildings',4,25,1,0,2),(856,'CB-ENG-2016-008','Marbiel For Showers ',25,1100,'to change all the damaged and broken marble in shower floor ',4,25,1,0,2),(857,'CB-ENG-2016-009','cover of flash box in toilet   ',50,350,'to change the damaged and broken covers of flash boxes',4,25,1,0,2),(858,'CB-ENG-2016-010','Shower Roular',50,375,'to replace the OOO',4,25,1,0,2),(860,'CB-ENG-2016-012','Water Mixer - Shower Head',50,850,'to replace the OOO',4,25,2,0,2),(862,'CB-ENG-2016-014','Exhoust Fan For Guest Rooms',75,150,'to replace the OOO',4,25,1,0,2),(863,'CB-ENG-2016-015','Hair Dryer',25,400,'to replace the OOO',4,25,1,0,2),(866,'CB-ENG-2016-018','Marble Table Top for Coffe Table',20,450,'To Avoid any stain in top due to the hot drink ( Polishing finish) for all villas ',4,25,2,0,2),(871,'CB-ENG-2016-023','Painting all Pergola at hotel',1,85000,'To keeping our quality & avoide the guest complains',4,25,1,0,2),(872,'CB-ENG-2016-024','High Pressure Pump ',1,18000,'To Clean the Coiles for the A.H.U',4,25,1,0,2),(873,'CB-ENG-2016-025','Chiller Yearly overhauling',2,20000,'<p>\n	Oils and filters during the year</p>\n',4,25,1,0,2),(874,'CB-MAJ-2016-008','Air handling Unit 25 ton',2,120000,'<p>\n	will replace 3 out of service AHU</p>\n',27,25,1,0,2),(875,'CB-MAJ-2016-009','A / C Splite unit for Guest rooms 3hp',25,6000,'<p>\n	Instead of the old one it is not working well and to avoide the guest complains</p>\n',27,25,1,0,2),(877,'CB-ENG-2016-029','Thermostate for DX at outlet',4,2000,'Save for Electricity cost',4,25,1,0,2),(879,'CB-ENG-2016-031','DX Yearly Maintenance',4,10000,'kitchen &amp;Staff cafeteria to keeping for machine prenew &amp;Quality ',4,25,1,0,2),(880,'CB-ENG-2016-032','Submersible St.Steel pump ',1,9000,'For boiler Room and STP',4,25,1,0,2),(881,'CB-ENG-2016-033','Heating pump 65/160/107(boilers)',2,27000,'To Replacement old pumps for the hot water of the rooms  ',4,25,1,0,2),(882,'CB-ENG-2016-034','Filteration pump for fish Restaurant',1,5000,'To Replacement old pumps ',4,25,3,0,2),(883,'CB-ENG-2016-035','Filteration pump for (STP)',2,12000,'To Replacement old pumps ',4,25,1,0,2),(884,'CB-MAJ-2016-010','Air Blower (STP)',2,75000,'<p>\n	To Replacement old pumps</p>\n',27,25,1,0,2),(885,'CB-ENG-2016-037','Submersible St.Steel pump from Recevied Tank to Air Tank (STP)',3,19000,'To Replacement old pumps ',4,25,1,0,2),(886,'CB-ENG-2016-038','Sand for Filter',2,7500,'To Replacement old sand where Sand Valid now',4,25,1,0,2),(887,'CB-ENG-2016-039','Exit & Emergency Light for Heart of the House',50,200,'Includin the main kitchen ( As Per Crystal ) the existing one not working',4,25,2,0,2),(889,'CB-ENG-2016-041','Emergency Lighting',60,400,'To complete all areas at hotel',4,25,1,0,2),(894,'CB-ENG-2016-046','Filteration Pump for Cold S.Pool',1,19000,'replacement for s.pool old one ',4,25,1,0,2),(895,'CB-ENG-2016-047','Heating Pump for Children pool&Villas',4,5000,'replacement for s.pool old one ',4,25,1,0,2),(897,'CB-ENG-2016-049','Submersible St.Steel pump ',1,9000,'To Replace old pump',4,25,1,0,2),(898,'CB-ENG-2016-050','Filter Pump for Jacuzzi &Cold S.Pool Vacuum',2,6500,'To Replace old pumps ',4,25,1,0,2),(899,'CB-ENG-2016-051','St.Steel Drainage for Filtration pump at heated pool',4,3000,'To Replace old where it is iron',4,25,1,0,2),(900,'CB-ENG-2016-052','Filteration Pump for S.pool villas',2,7000,'To Replace old pumps ',4,25,1,0,2),(901,'CB-MAJ-2016-011','Sand For filters',7,7800,'<p>\n	To Replacment old sand where it is bad quality</p>\n',27,25,1,0,2),(905,'CB-ENG-2016-057','Felucca Boat Yearly Overhauling',1,15000,'<p>\n	Annual overhauling as per law to renew the license</p>\n',4,25,1,0,2),(910,'CB-ENG-2016-062','Renovation all Fire system at chellers',1,25000,'New Item for Safety',4,25,1,0,2),(911,'CB-ENG-2016-063','Tools&amp; Machines',1,25000,'for workshops',4,25,1,0,2),(912,'CB-ENG-2016-064','Cars overhauling',1,50000,'<p>\n	yearly overhauling</p>\n',4,25,1,0,2),(913,'CB-ENG-2016-065','Yearly overhauling for power transformers',3,5000,'<p>\n	yearly overhauling</p>\n',4,25,1,0,2),(914,'CB-ENG-2016-066','Yearly overhauling for Emergency Generator',2,10000,'<p>\n	yearly overhauling</p>\n',4,25,1,0,2),(915,'CB-ENG-2016-067','Yearly overhauling for Hot Water Boiler',3,10000,'<p>\n	yearly overhauling</p>\n',4,25,1,0,2),(916,'CB-ENG-2016-068','Battry for Generators',4,1100,'need them for generator during the year',4,25,2,0,2),(917,'CB-ENG-2016-069','Wire Machine for Drainage',1,15000,'for all pipes and plumping',4,25,3,0,2),(918,'CB-MAJ-2016-012','Heater for Exchanger',2,30000,'<p>\n	Instead of the old one it is not working well</p>\n',27,25,1,0,2),(919,'CB-ENG-2016-071','Confos for generator',1,7000,'New Item for Generator',4,25,2,0,2),(920,'CB-ENG-2016-072','Yearly overhauling for Irrigation Station',1,15000,'Pumps and Blowers',4,25,1,0,2),(922,'CB-ENG-2016-074','Shelves for the HK stores',1,20000,'to keep stauff on shelves ',4,25,2,0,2),(926,'HO-FO-2016-001','Renovate the FO area ',1,45000,'Renovate FO reception desk floor and counter and back area offices and FO manager office and replace old operator area to be asst. GSC MGR     # F',18,27,1,0,2),(927,'HO-FO-2016-002','A/C unite 5 HP',1,9500,'Replace depreciated fan coil air condition unit   #F',18,27,1,0,2),(928,'HO-HK-2016-001','Voil cloths for the rooms ',400,40,' Replacement    # F',12,27,1,0,2),(929,'HO-HK-2016-002','Black out cloths for the rooms ',200,35,' Replacement    # F',12,27,1,0,2),(932,'HO-HK-2016-005','Mattress 200*140 cm',71,850,'MOT 50% accomplished in 2015  # F',12,27,1,0,2),(933,'HO-HK-2016-006','Mattress 200*160 cm',100,950,'MOT 50% accomplished in 2015  # F',12,27,1,0,2),(934,'HO-HK-2016-007','Mattress 200*100cm',112,600,'MOT 50% accomplished in 2015  # F',12,27,1,0,2),(935,'HO-HK-2016-008','Stainless steel basket rubbish for the rooms ',100,250,' MOT Replacement     # F ',12,27,1,0,2),(936,'HO-HK-2016-009','Stainless steel toilet brush ',150,75,'MOT  Replacement     # F ',12,27,1,0,2),(937,'HO-HK-2016-010','House man trolley ',5,1500,'  Replacement   will be made in central workshop   # F',12,27,1,0,2),(938,'HO-HK-2016-011','Safe Box',20,450,'  Replacement     # F ',12,27,1,0,2),(939,'HO-HK-2016-012','Mini Bar ',20,1000,'  Replacement     # F ',12,27,1,0,2),(940,'HO-HK-2016-013','Marble floor the first floor and the 2 stairs  between rooms and the restaurant stair \"',1,60000,'MOT Renovation   # F',12,27,1,0,2),(941,'HO-HK-2016-014','Carpets for the lobby ',20,1200,'MOT Renovation   # F',12,27,1,0,2),(944,'HO-HK-2016-017','Coffee tray set ',80,300,'To complete all rooms  # C',12,27,1,0,2),(945,'HO-HK-2016-018','A/C 5 HP. for linen room',1,9500,'  Replacement     # F ',12,27,2,0,2),(946,'HO-HK-2016-019','Gloria Spraying machine ',1,5000,' Replacement     # F ',12,27,1,0,2),(947,'HO-HK-2016-020','Spraying portable motor ',1,5000,'Replacement     # F ',12,27,2,0,2),(948,'HO-HK-2016-021','Niblon 3 nozzles ',1,5000,'Replacement     # F ',12,27,3,0,2),(949,'HO-REC-2016-001','wind break metal ',75,300,'New item # C',13,27,2,0,2),(950,'HO-REC-2016-002','Umbrella',25,2500,'New item to increase beach capacity  # C',13,27,1,0,2),(952,'HO-REC-2016-004','Vacuum machine ',1,4000,'  Replacement     # F ',13,27,2,0,2),(953,'HO-LND-2016-001','Valet number machine',1,1000,'New item  # C',5,27,3,0,2),(957,'HO-FB-2016-001','S.S Shelves',1,5000,'Cristal Requests  # C',7,27,2,0,2),(958,'HO-FB-2016-002','Banquet Chairs ',50,300,'Conformance room   # C',7,27,1,0,2),(959,'HO-FB-2016-003','Glass washer',1,12500,'Cristal Requests for Mediterranean rest. and grand cafe   # C',7,27,1,0,2),(962,'HO-FB-2016-006','Fresh orange juice machine',1,6000,'New item for extra sales # C',7,27,1,0,2),(963,'HO-FB-2016-007','Trolley ',1,2000,'Replacement  # F',7,27,2,0,2),(964,'HO-FB-2016-008','Plastic tables',20,300,'Plastic tables for beach and pool party\'s    # C',7,27,2,0,2),(965,'HO-KIT-2016-001','Show fridge ',1,20000,'For beach bar  # C',6,27,2,0,2),(966,'HO-KIT-2016-002','Sneeze guard',7,6000,'Cristal request 2 new sneeze guard for elsol with value of 11000 LE each and renovate 5 units in elsol and elarabi with value 4000 LE  per unit  # F',6,27,1,0,2),(967,'HO-KIT-2016-003','Salamander ',1,5500,'English request for cheese sandwiches   # C',6,27,1,0,2),(968,'HO-KIT-2016-004','Dick oven 2 cell ',1,18000,'Replacement for bakrey  # F',6,27,2,0,2),(970,'HO-KIT-2016-006','2 Door vertical fridge ',1,15000,'Cristal Requests for elsol rest.  # C',6,27,1,0,2),(971,'HO-ACC-2016-001','Receiving digital scale ',1,9000,'Replace depreciated scale  # F',3,27,2,0,2),(972,'HO-ACC-2016-002','Ceramic for the floor  F&B Store First Floor',1,36000,'Replacement as per cristal  # F',3,27,1,0,2),(973,'HO-ACC-2016-003','Desk Chairs ',4,500,'Replace depreciated chairs in accounting office   # F',3,27,1,0,2),(974,'HO-ACC-2016-004','Save box',1,4000,'Replace depreciated safe in FC  office   # F',3,27,1,0,2),(975,'HO-IT-2016-001','Hp Computer Set ',5,6000,'Replace the old one in (Hr office- Paymaster) & new one for( GSC Office - training Office - Stores)  # F',2,27,1,0,2),(977,'HO-IT-2016-003','Printer HP LaserJet',3,1000,'For( Kitchen & HK Department & Financial Controller office)  # F',2,27,1,0,2),(978,'HO-IT-2016-004','H.D 1 TB',2,700,'For IT Office (Backup Date )   # C',2,27,1,0,2),(979,'HO-SEC-2016-001','Complete fire fighting suit ',2,6000,'New for fire fighting  # C',14,27,1,0,2),(980,'HO-SEC-2016-002','X-Ray Metal Detector ',1,190000,'<p>\n	Tourist Police request # C</p>\n',14,27,1,0,2),(981,'HO-SEC-2016-003','Explosives detector',1,20000,'Tourist Police request  # C',14,27,1,0,2),(982,'HO-SEC-2016-004','Fire extinguisher 6 kg Bavaria',20,500,'Replace old fire extinguishers   # F',14,27,1,0,2),(984,'HO-HR-2016-002','Air Condition 1.1/2 H',1,3500,'New Staff Clinic  # C',15,27,2,0,2),(990,'HO-HR-2016-008','New training room ',1,30000,'Prepare the area beside HR office to be training room the project will include floor tiles , ceiling , air condition , chairs ,data projector , sound system, electrical works and lighting and desk   # C',15,27,1,0,2),(993,'HO-HR-2016-011','\"Full renovation for staff locker ( floor,  ventilation,  painting)\"',1,20000,'MOT Replacement # F',15,27,1,0,2),(994,'HO-HR-2016-012','New locker',10,1200,'Replacement # F',15,27,1,0,2),(995,'HO-STA-2016-001','EL Forsan Staff  Cafeteria',1,20000,'Staff Cafeteria Upgrade  # F',23,27,1,0,2),(996,'HO-STA-2016-002','water cooler',1,4000,'Replacement # F',23,27,1,0,2),(997,'HO-HO-2016-001','Fan',10,200,'Staff Housing Asst Department  # C',22,27,1,0,2),(998,'HO-HO-2016-002','Fridge',7,1200,'Staff Housing Asst Department   # C',22,27,1,0,2),(999,'HO-HO-2016-003','water cooler',1,4000,'Replace depreciated unit in staff house   # F',22,27,1,0,2),(1003,'HO-ENG-2016-002','Replace old TV station ',1,50000,'<p>\n	Replace depreciated analog units to digital and increase varity of tv channels as per guest request # F</p>\n',4,27,1,0,2),(1004,'HO-ENG-2016-003','Replace compressor unit for chiller 1',1,50000,'Replace depreciated units  # F',4,27,1,0,2),(1005,'HO-ENG-2016-004','Major repair and semi overall for all chiller ',1,60000,'Semi over all for 5 chiller unit   # F',4,27,1,0,2),(1006,'HO-ENG-2016-005','Ventilation fans ',10,2000,'For guest rooms bathroom ventilation  # F',4,27,1,0,2),(1007,'HO-ENG-2016-006','Main sound system replacement & adjustment ',2,10000,'Replace depreciated units # F',4,27,3,0,2),(1008,'HO-ENG-2016-007','Submersible 2 hp zenit pumps for sewage system',4,5000,'Replace depreciated units # F',4,27,1,0,2),(1009,'HO-ENG-2016-008','Speakers 2500 W JBL',2,8000,'For disco to replace old units # F',4,27,1,0,2),(1010,'HO-ENG-2016-009','M.P.F crown (500*2) amplifier ',2,4000,'For disco  # C',4,27,1,0,2),(1011,'HO-ENG-2016-010','Double CD (Danon ) 6500',1,5000,'For disco  # C',4,27,1,0,2),(1012,'HO-ENG-2016-011','Strop light 1000 w',1,1000,'For disco  # C',4,27,1,0,2),(1013,'HO-ENG-2016-012','Smoke machine',1,3000,'For disco  # C',4,27,1,0,2),(1017,'HO-ENG-2016-016','New slider',2,5000,'Replace depreciated units  # F',4,27,1,0,2),(1019,'HO-ENG-2016-018','welding machine ',1,3000,'for eng. steel works ',4,27,1,0,2),(1020,'HO-ENG-2016-019','New sliding door for the entrance ',1,25000,'To replace old depreciated unit with new model as spare parts no longer available to the model we have # F',4,27,1,0,2),(1021,'HO-ENG-2016-020','High pressure machine ',1,5000,'For air conditions and fan coils cleaning  # F',4,27,1,0,2),(1023,'HO-ENG-2016-022','New coil for elsol air hand unit ',1,15000,'Replace depreciated unit to increase restaurant air condition efficiency  # F',4,27,1,0,2),(1024,'HO-ENG-2016-023','Change old sewage station ceiling',1,37000,'environmental affair audit safety as old ceiling depreciated  # F',4,27,1,0,2),(1025,'SH-FB-2016-007','Ice Maker Machine 150 kg.',1,32000,'For Guest Needs at Cocktail and them drink at summer time smartline Pool Bar',7,16,1,0,2),(1029,'SH-HR-2016-014','water dispenser',2,1300,'New - El Forsan',15,16,1,0,2),(1030,'SH-HR-2016-015','Juice Machian 3 Tank ',1,9000,'New - El Forsan',15,16,1,0,2),(1031,'SH-HR-2016-016',' Cooking Setather Gas',1,12000,'New - El Forsan',15,16,1,0,2),(1032,'SH-HR-2016-017','Freezer',1,5000,'New - El Forsan',15,16,1,0,2),(1033,'CB-ENG-2016-078','Filtration system for the waterfalls in the main entrance',2,20000,'filtration system for the waterfall ',4,25,2,0,2),(1034,'RM-Maj-2016-003','Complete the wind breaker',373,540,'<p>\n	complete the project of the wind breaker in the swimming pools and the beach area</p>\n',27,22,1,0,2),(1039,'LJ-KIT-2016-001','Food processor',2,22000,'the old one very bad condition',6,29,1,0,2),(1040,'LJ-KIT-2016-002','Cold cabnet -2door ',1,66000,'<p>\n	the old one very bad condition</p>\n',6,29,1,0,2),(1041,'LJ-KIT-2016-003','Campro trolley',2,6000,'the old one very bad condition',6,29,1,0,2),(1042,'LJ-KIT-2016-004','Hot cabnet - 2door',2,75000,'the old one very bad condition',6,29,1,0,2),(1043,'LJ-KIT-2016-005','Meat mincer',1,40000,'the old one very bad condition',6,29,1,0,2),(1044,'LJ-KIT-2016-006','Fixing marble 4cm at Lejardien ',1,40000,'the old one very bad condition',6,29,1,0,2),(1051,'DB-HK-2016-006','twintek machine',1,26500,'it has been repairaed last years and spent almost the same price ',12,28,1,0,2),(1061,'MP-HK-2016-023','themed Family Rooms',30,7000,'for more guest satisfaction',12,23,1,0,2),(1067,'DB-REC-2016-004','plastic table between sun bed',200,100,'In The very bad condition',13,28,1,0,2),(1069,'DB-FB-2016-001','Cold milker',2,5000,'For italian Resturant during the brakfast as it is missing',7,28,1,0,2),(1072,'DB-FB-2016-004','Bar Blender heavy duty',2,4200,'<p>	for the new bars ( Relax Pool bar - Terrace Bar ) as they are missing</p>',7,28,1,0,2),(1074,'DB-FB-2016-006','Crushed ice machine',2,11000,'for the new bars ( Relax Pool bar - Terrace Bar ) as they are missing',7,28,1,0,2),(1076,'DB-IT-2016-001','Computer set HP pro 3500 i5',8,7700,'the old computers at the server need to upgraded to be link with the main server in hurghada',2,28,1,0,2),(1078,'DB-SEC-2016-001','electronic Gate for staff',1,12000,'<p>\n	As Per minstry of Tourism</p>\n',14,28,1,0,2),(1085,'DB-ENG-2016-002','Zenit Pump Model EDG150M 70 ph',3,95000,'For new main hole and old main hole',4,28,1,0,2),(1086,'DB-ENG-2016-003','New manhole',1,50000,'the exciting one is too small for the operation and caused alot of incidents and guest complains',4,28,1,0,2),(1087,'DB-ENG-2016-004','AC compressors ',40,2000,'for guest rooms',4,28,1,0,2),(1088,'DB-ENG-2016-005','Mini Bar',100,1200,'to replace the exciting one who caused alot of guest complains',4,28,1,0,2),(1091,'DB-ENG-2016-008','Bath room grouting',170,200,'to improve the outdated guest room toilets',4,28,1,0,2),(1092,'DB-ENG-2016-009','change room accessories',200,300,'complete rusted material need  to be re polished as a complete set ',4,28,1,0,2),(1093,'DB-ENG-2016-010','changing stalite from anlug to digital',1,200000,'the New LED TV\'s not matching with the analouge Satelite system ',4,28,1,0,2),(1104,'DB-ENG-2016-021','Main resturant terrace',1,150000,'in very bad condition',4,28,1,0,2),(1105,'DB-ENG-2016-022','Ac split unit 7.5HP',4,16500,'For Saving Electricity since the Dico AC operated through the Main chiller ( waste of energy ) ',4,28,1,0,2),(1107,'DB-ENG-2016-024','Pergolas around pools I/O Umbrellas  ( relax-family ) pool',1,120000,'<p>\n	to replacing the umberlla</p>\n',4,28,1,0,2),(1110,'MO-ENG-2016-016','Fixing Shower Glass window in guest rooms',210,1500,'To prevent the damage caused by leakage and to improve rooms standard ',4,26,1,0,2),(1112,'CB-HK-2016-038','Extra Bed for Guestrooms',30,1600,'to replace the out of order ones',12,25,1,0,2),(1113,'LJ-IT-2016-001','Kingston 4GB Ram Memory Kit For Desktop (2X2GB )inch LED Monitor',20,560,'To upgrade requirements',2,29,1,0,2),(1114,'CB-ENG-2016-080','Electronic Door Bell',50,800,'to replace the out of order ones',4,25,1,0,2),(1115,'CB-ENG-2016-081','Lamp for Desk in Old Rooms',226,150,'to replace the current one as it became out of order',4,25,1,0,2),(1116,'CB-ENG-2016-082','Lamp for Commode in Old Rooms',226,200,'to replace the current one as it became out of order',4,25,2,0,2),(1117,'LJ-IT-2016-002','Samsung 18.5-inch LED Monitor',10,850,'To replace and renew the computer screen',2,29,1,0,2),(1118,'LJ-IT-2016-003','LINKSYS LGS318P 18-PORT BUSINESS GIGABIT SMART SWITCH POE+',2,3000,'To use internet in Riviera & Le Jardin',2,29,1,0,2),(1119,'LJ-IT-2016-004','LINKSYS LAPAC1750PRO BUSINESS ACCESS POINT WIRELESS WI-FI DUAL BAND 2.4 + 5GHZ AC1750 WITH POE (5 Pieces)',1,12000,'To use internet in Riviera & Le Jardin',2,29,2,0,2),(1120,'LJ-STE-2016-002','Tub soak. 500 liter',1,15000,'The old is not enough',24,29,1,0,2),(1121,'LJ-SEC-2016-001','Gate security metal detectors for (Lejardin &amp;Riviera)Hotels',2,14500,'   the old one is not working and Repair cost nearest to new gate price.',14,29,1,0,2),(1124,'LJ-SEC-2016-004','Electronic door machine in the entrance lopy le jardin.',1,50000,'   the old one is not working and canot  Repair .',14,29,1,0,2),(1126,'DB-KIT-2016-002','Dish wisher Machin Hobart 3 stage',1,300000,'The old Dishwasher has been repaired for several time and last issuing maintenance cost was 70000 LE for the main dining room',6,28,1,0,2),(1127,'DB-KIT-2016-003','Toaster - Italian made',1,11000,'the avilaable one is not suitible for mass production main dining room',6,28,1,0,2),(1129,'DB-KIT-2016-005','Fridge vertical size (140 * 81 *219) 1400 litter Italy ',1,25000,'to improve the refilling process in pastry section at the italian restaurant',6,28,1,0,2),(1131,'DB-KIT-2016-007','Shawarma Machine 1 E',1,9000,'saving Energy - for the BBQ and egyptian buffet item',6,28,1,0,2),(1133,'DB-KIT-2016-009','large dough mixer 40 Litter',1,45000,'the old machine was repaired several time with high cost in addition it is not applicable for high production business',6,28,1,0,2),(1134,'DB-KIT-2016-010','Salamander ',1,18000,'for the main dining room since it is missing',6,28,1,0,2),(1135,'DB-KIT-2016-011','Microwave Italy 100 Litter for main kitchen ',1,8000,'for the main dining room since it is missing',6,28,1,0,2),(1136,'DB-KIT-2016-012','Chafing dish 1/1 rectangle ',20,5200,'for the BBQ outside buffet and Gala Dinner',6,28,1,0,2),(1137,'DB-KIT-2016-013','Chafing dish 1/1 round 40 cm',20,4000,'Replacement the old one',6,28,1,0,2),(1138,'DB-KIT-2016-014','Chafing dish 1/1 round 20 cm',20,3300,'for the BBQ outside buffet and Gala Dinner',6,28,1,0,2),(1140,'LJ-STA-2016-001','Colder',2,3850,'To coverage El Foursan Cafeteria',23,29,1,0,2),(1141,'LJ-STA-2016-002','Filter Unit  7stages',2,4000,'To coverage El Foursan Cafeteria',23,29,1,0,2),(1142,'LJ-STA-2016-003','Hot cabinet 2 Door forced hot air 40g/N1/1',1,66000,'Instead of Hot cabinet which had kitchen taken to the German Resturant',23,29,1,0,2),(1143,'LJ-STA-2016-004','Mixer Soup -Robot -Coupe- France Mp-600 Ultra',1,12000,'Instead of Mixer Soup which had kitchen taken',23,29,1,0,2),(1144,'LJ-HO-2016-001','Colder',3,3850,'To coverage Three Staff Housing Buildings',22,29,1,0,2),(1145,'LJ-HO-2016-002','Filter Unit 7 stages',3,4000,'To coverage Three Staff Housing Buildings',22,29,1,0,2),(1146,'AB-FB-2016-006','Nespresso Machines',42,2000,'to upgrade the suits',7,24,1,0,2),(1148,'RM-KIT-2016-026','vegetables cutting machine',1,18000,'we have one since the opening out of order ',6,22,1,0,2),(1149,'RM-KIT-2016-027','potato cutting machine',1,18000,'replacement for a very small OOO ',6,22,1,0,2),(1150,'RM-KIT-2016-028','cambro trolleys large size',4,19000,'as per Cristal and hygiene Stander we need to have in all era one trolleye ',6,22,1,0,2),(1151,'RM-KIT-2016-029','Rotating Oven',1,450000,'replacement for a very small OOO since the opening',6,22,1,0,2),(1152,'RM-KIT-2016-030','show display fridge',2,30000,'we have one in the Steak house not working and we need one More as Cristal Information  ',6,22,1,0,2),(1153,'RM-MAJ-2016-016','Suzuki Van',1,70000,'<p>\n	instead of new club car</p>\n',27,22,2,0,2),(1154,'RM-MAJ-2016-017','Poly athanal Covers',1,75000,'<p>\n	for garden zero cost after installing and safe</p>\n',27,22,1,0,2),(1155,'RM-MAJ-2016-018','Repair overflow for sports pool',1,90000,'<p>\n	to reduce wested water</p>\n',27,22,1,0,2),(1156,'RM-MAJ-2016-019','Pool Rocks removing ',1,80000,'<p>\n	more siting area around pools and adjust overflow od s,pools</p>\n',27,22,2,0,2),(1159,'RM-AG-2016-001','office arm chairs',3,1800,'very old and broken arm chairs',8,22,1,0,2),(1160,'DB-FB-2016-007','Granitta maker',2,15000,'to minimize the high beverage consumption',7,28,1,0,2),(1161,'RM-KIT-2016-031','Microwave',4,3500,'for fast reheating the food as per cristal',6,22,3,0,2),(1163,'RM-ENG-2016-069','Insulation for cold &amp; hot water polypropylene pipe at the roofs',1,14000,'guest complain from water temprature',4,22,1,0,2),(1165,'RM-ENG-2016-071','A/C split fan cool for guest rooms and some outlets',10,5000,'spare for 850 units',4,22,3,0,2),(1168,'RM-KIT-2016-032','Oven grille 6 flame ',1,27500,'supporting the old one in the kitchen for high occupancy',6,22,3,0,2),(1169,'RM-KIT-2016-033','Chiller 10G.N',1,86350,'for all cold food freezing chock as per cristal',6,22,1,0,2),(1170,'RM-ENG-2016-072','Connecting DX unites to Fire Alarm',1,15000,'civil defence',4,22,1,0,2),(1172,'RM-ENG-2016-074','Change all valve at roof of building 10 &amp; new family ',500,120,'all old valves are blocked',4,22,2,0,2),(1173,'RM-MAJ-2016-020','Complete the fire fighting pipe beside Lobby Area',1,120000,'<p>\n	civil defence</p>\n',27,22,3,0,2),(1174,'RM-MAJ-2016-021','Replace 1000M Concrete board for main Entrance ',1,75000,'<p>\n	old are completely damaged in the hotel entrance</p>\n',27,22,3,0,2),(1176,'RM-ENG-2016-077','water dosing system for portable water , kitchen f&amp;B ',1,30000,'health safety to guarantee percentage of chemicals in the water',4,22,2,0,2),(1177,'RM-ENG-2016-078','Ceiling outlets adjusting ',1,20000,'old were spoiled after rain',4,22,2,0,2),(1178,'RM-ENG-2016-079','DX units for the kitchen',3,150000,'kitchen has only 3 for all sections',4,22,1,0,2),(1179,'LJ-HK-2016-001','Black out curtains for guest rooms',3504,31,'<p>\n	To replace the old and damaged curtains which is in very bad condition</p>\n',12,29,1,0,2),(1180,'LJ-HK-2016-002','Stainless Rubish bins for guest  rooms toilets ',500,83,'To replace the Rusted and damaged bins',12,29,1,0,2),(1181,'LJ-HK-2016-003','Painting for 920 rooms and all corridors for both hotels ',920,300,'Rooms walls and ceilings in very bad condition and in urgent need for painting ',12,29,1,0,2),(1182,'LJ-HK-2016-004','Bathrooms Curtains  for 920 guest rooms',920,45,'To replace the old and damaged curtains which is in very bad condition',12,29,1,0,2),(1183,'LJ-HK-2016-005','Light curtains for 500 guest rooms',920,13,'To replace the old and damaged curtains which is in very bad condition',12,29,2,0,2),(1184,'LJ-HK-2016-006','Extra Bed for Guest rooms',100,1000,'To cover the shortage in case of high occupancy , as the total number of exists extra beds are not enough',12,29,1,0,2),(1185,'LJ-REC-2016-001','Wooden Sun beds ',400,500,'To replace the damaged plastic Sunbeds , also to To cover the shortage in case of high occupancy',13,29,1,0,2),(1187,'LJ-ENG-2016-001','Repair firefighting network for (Lejardin &Riviera)Hotels',2,200000,'Leaking in the firefighting network under the ground',4,29,1,0,2),(1188,'LJ-ENG-2016-002','Expansion Joints for walls and floors (le Jardin &Riviera)Hotels (1500M)',1500,80,'New Expansion Joints for walls and floors (le jardin &Riviera)Hotels(1500 M)',4,29,1,0,2),(1189,'LJ-ENG-2016-003','Submersible pumps for Water treatment plant.7.5hp with control units.',4,20000,'Old one in very bad condition.',4,29,1,0,2),(1190,'LJ-ENG-2016-004','new two Lighters .one for steam boiler and another one for hot water boiler',2,26000,'the old one in very bad condition (and to saving the  fuel consumptions).',4,29,1,0,2),(1191,'LJ-ENG-2016-005','Firefighting system for (Generators-Transformers)rooms.',6,60000,'Installation Fire Fighting system for (Generators-Transformers) . (Hotel License)',4,29,1,0,2),(1192,'LJ-ENG-2016-006','change the internal iron pipes for hot water boilers .',4,30000,'Old one in very bad condition.and not safe.',4,29,1,0,2),(1193,'LJ-ENG-2016-007','Renewal to the elevators (inside cabin, emergence device, inverters and accessories)',22,8000,'to improve the elevators conditions and safe it.',4,29,1,0,2),(1194,'LJ-ENG-2016-008','compressors for DX units  .',4,11000,'Old one in very bad condition.',4,29,1,0,2),(1195,'LJ-ENG-2016-009','renewal the power factor units .',3,30000,'the old unit is damaged (to saving the electricity consumption)',4,29,1,0,2),(1196,'LJ-ENG-2016-010','Change key cylinder for (two hotels)',920,100,'Change key cylinder from normal to computer cylinder(two hotels )',4,29,1,0,2),(1197,'LJ-GRD-2016-001','New irrigation pumpes 7.5hp .380v',2,21000,'Old one in very bad condition.',16,29,1,0,2),(1198,'LJ-GRD-2016-002','Grass cutting machine.',1,10000,'Old one in very bad condition.',16,29,1,0,2),(1199,'SH-HK-2016-018','Rooms Furniture',162,350,'bench &amp; bed back for SmartLine rooms upgrad',12,16,1,0,2),(1200,'SH-HK-2016-019','Wall ablique ',486,150,'',12,16,1,0,2),(1202,'HO-MAJ-2016-001','Island maintenance ',1,1200000,'<p>\n	Major repair for the island as its start to depreciate&nbsp;</p>\n',27,27,1,0,2),(1203,'HO-MAJ-2016-002','AC control for rooms',100,1200,'<p>\n	MOT Reques</p>\n',0,27,1,0,2),(1204,'HO-MAJ-2016-003','New sea stairs stainless steel ',1,30000,'<p>\n	Replace depreciated units&nbsp;</p>\n',27,27,1,0,2),(1205,'HO-MAJ-2016-004','Renovate swimming pool dick  tiles and isolation ',1,130000,'<p>\n	MOT</p>\n',27,27,1,0,2),(1206,'HO-MAJ-2016-005','Desco renovation ',1,50000,'<p>\n	MOT</p>\n',27,27,1,0,2),(1207,'HO-MAJ-2016-002','AC control for rooms ',100,1200,'<p>\n	Replace depreciated units&nbsp;</p>\n',27,27,1,0,2),(1214,'MO-MAJ-2016-007','HP Ram Memory 8GB DDR3',6,2000,'<p>\n	Fidelio server upgrade 8960 to 8962</p>\n',27,0,1,0,2),(1225,'MO-MAJ-2016-001','Public toilets for Relax Pool',1,50000,'<p>\n	We do not have toilets for the guests in this area -missing since opening</p>\n',27,26,1,0,2),(1226,'MO-MAJ-2016-002','Walkway alignment & stainless  handrail for Public walkway',1,450000,'<p>\n	For guests safety as we have many accidents and complaints</p>\n',27,26,1,0,2),(1227,'MO-MAJ-2016-003','New Indian Restaurant (F&B)',1,65800,'<p>\n	To increase the variety of Restaurants and increase F&amp;B Revenue</p>\n',27,26,2,0,2),(1228,'MO-MAJ-2016-004','New Indian Restaurant (Kit)',1,63000,'<p>\n	To increase the variety of Restaurants and increase F&amp;B Revenue</p>\n',27,26,2,0,2),(1229,'GB-MAJ-2016=001','Main Restaurant  Buffet Renovation of the rooms & MR interior Renovation',1,1500000,NULL,27,21,1,0,2),(1230,'GB-MAJ-2016-002','Green Restaurant',1,500000,NULL,27,21,1,0,2),(1231,'GB-MAJ-2016-003','Italian Restaurant Renovation',1,200000,NULL,27,21,1,0,2),(1232,'GB-MAJ-2016-004','Rooms Renovation (two buildings ) 70 Rooms swim up rooms',70,14286,NULL,27,21,1,0,2),(1233,'GB-MAJ-2016-005','swim up rooms pools',10,150000,NULL,27,21,1,0,2),(1234,'GB-MAJ-2016-006','bunk bed ',60,2300,NULL,27,21,1,0,2),(1235,'GB-Maj-2016-007','sun bed',200,400,'<p>\n	for Aqua Park</p>\n',27,21,1,0,2),(1236,'GB-ENG-2016-001','irregation system completion ',1,60000,NULL,4,21,1,0,2),(1237,'GB-MAJ-2016-009','Marina Renovation ',1,3000000,NULL,27,21,1,0,2),(1238,'MP-MAj-2016-001','Main Restaurant  Buffet Renovation of the rooms & MR interior Renovation',1,1000000,NULL,27,0,1,0,2),(1239,'MP-MAJ-2016-002','Lobby Furniture',1,100000,NULL,27,23,1,0,2),(1240,'MP-MAJ-2016-001','Main Restaurant  Buffet Renovation of the rooms & MR interior Renovation',1,1000000,NULL,27,23,1,0,2),(1241,'MP-MAj-2016-003','Renweal for all Hotel suites Master & Junior',1,200000,NULL,27,23,1,0,2),(1242,'MP-MAJ-2016-004','All walk ways between MP and CB& between GB & MP',1,500000,NULL,27,23,1,0,2),(1243,'MP-MAJ-2016-005','Swimming pool isolation & Waterfalls',1,1500000,NULL,27,23,1,0,2),(1244,'MP-MAJ-2016-006','Complete Filters Uint for irregation station ',1,150000,NULL,27,23,1,0,2),(1245,'MP-MAJ-2016-007','ireregation station Pump ',2,45000,NULL,27,23,1,0,2),(1246,'MP-MAJ-2016-008','submersiable Tesrumi  pump 5 HP ',5,19000,NULL,27,23,1,0,2),(1247,'MP-MAJ-2016-009','Repainting wooden pergola swimming pool',1,75000,NULL,27,23,1,0,2),(1248,'DB-MAJ-2016=001','Club Car Over all',2,120000,'<div>\n	To replace the Cushman because the Cushman&nbsp;</div>\n<div>\n	spare parts is very expensive more over it&nbsp;</div>\n',27,28,1,0,2),(1255,'DB-MAJ-2016-008','New TC kids club ',2,300000,'<p>\n	For Relax pool - Active pool</p>\n',27,28,1,0,2),(1257,'DB-KIT-2016-001','Potato peeler 20KG',1,22000,'<div>\n	the maintenance fees and spare parts&nbsp;</div>\n<div>\n	are almost the same price of the new one</div>\n',6,28,1,0,2),(1258,'DB-KIT-2016-004','Heater 2 eye for buffet',2,1500,'<p>\n	missing items</p>\n',6,28,1,0,2),(1262,'DB-ENG-2016-006','Ultra violet unit for Kitchen',2,35000,'<p>\n	For the main kitchen and laundry&nbsp;</p>\n',4,28,1,0,2),(1263,'DB-MAJ-2016-016','renovation for the Guest Rooms',200,50000,'<p>\n	The rooms in a very bad condition&nbsp;</p>\n',27,28,1,0,2),(1266,'DB-MAJ-2016-019','Solar energy- Water heater',100,8000,'<p>\n	For saving electricity</p>\n',27,28,1,0,2),(1282,'DB-MAJ-2016-035','power factor for electric Panels ',4,130000,'<p>\n	to save Electric Consumption</p>\n',27,28,1,0,2),(1283,'DB-ENG-2016=001','Chillers Overall',1,100000,'<p>\n	Saving Energy and maintain the 3 chillers to avoid troubles</p>\n',4,28,1,0,2),(1284,'DB-MAJ-2016-037','interlock of the public area',1,300000,'<p>\n	in very bad condition</p>\n',27,28,1,0,2),(1287,'MO-IT-2016-007','I.T Licenses',1,212658,'<p>\n	Annual software license</p>\n',2,26,1,0,2),(1288,'HO-MAJ-2016-006','Island penalty ',1,2000000,'<p>\n	Penalty to the environmental authority to have license for the island</p>\n',27,27,1,0,2),(1289,'CB-MAJ-2016-015','Replacement Shuttle Bus ',1,315000,'<p>\n	Only for our hotel.To replace the shulttle bus due to the high cost for the Maintenance&nbsp; and many guests compalined because of the poor condition and no A/C and not enough to serve the 3 hotels as we have 2 times for free downtown and also free transportaion for Royal Club guests.</p>\n',27,25,2,0,2),(1291,'CB-MAJ-2016-017','Carpet for Rooms',500,400,'<p>\n	to be used as per ministry of tourism conditions of NN for 5* hotels</p>\n',27,25,3,0,2),(1292,'CB-MAJ-2016-019','Mattresses for Guestrooms',310,500,'<p>\n	to replace the out of order ones</p>\n',27,25,1,0,2),(1293,'CB-MAJ-2016-018','Marble for tables in old rooms',100,350,'<p>\n	to replace the out of order and complete missing ones</p>\n',27,25,1,0,2),(1294,'CB-MAJ-2016-020','Marble for tables in new rooms',100,600,'<p>\n	to complete the missing ones from opening</p>\n',27,25,1,0,2),(1295,'CB-MAJ-2016-021','Linen Car Shevrolet Pickup',1,150000,'<p>\n	to replace the current one as it became out of order</p>\n',27,25,1,0,2),(1296,'CB-MAJ-2016-022','Upholstering Lobby Furniture',1,75000,'<p>\n	to replace the current one as it became in bad condition</p>\n',27,25,1,0,2),(1298,'CB-MAJ-2016-024','Balcony Chair Rattan',200,500,'<p>\n	to replace the current one as it became out of order</p>\n',27,25,1,0,2),(1299,'CB-MAJ-2016-025','Upgrade Linen for Villas, Suites and Kids Rooms',1,100000,'<p>\n	to be used for upgrdaing hotel product and service in these areas</p>\n',27,25,3,0,2),(1300,'CB-MAJ-2016-026','Pastery Fridge',1,60000,'<p>\n	&nbsp;To be used for luch at the Posedon Beach Restaurant and late breakfast at the poseidon Beach Restaurant</p>\n<p>\n	&nbsp;</p>\n',27,25,2,0,2),(1301,'CB-MAJ-2016-027','Dishwasher ',1,275000,'<p>\n	to be used in staff cafetria</p>\n',27,25,2,0,2),(1302,'CB-MAJ-2016-028','Pergola around Jacuzi Pool ',1,40000,'<p>\n	Jacuzze poolhas no shade and need pergola</p>\n',27,25,3,0,2),(1303,'CB-MAJ-2016-029','Mini bars for guest rooms',100,1100,'<p>\n	Instead of the old one it is not working well and to avoide the guest complains</p>\n',27,25,1,0,2),(1304,'CB-MAJ-2016-030','Pergola for kids activities beside S. Pool',1,30000,'<p>\n	for kids activities on the swimming pool</p>\n',27,25,2,0,2),(1305,'CB-MAJ-2016-031','St.Steel Shower Handle',200,300,'<p>\n	to change the rusty handles in the bathrooms</p>\n',27,25,1,0,2),(1306,'CB-MAJ-2016-032','Insulation for all rooms roof',2000,107,'<p>\n	To close all the holes and insulate the roof to protect the rooms from any water leakage</p>\n',27,25,3,0,2),(1307,'CB-MAJ-2016-033','UK Electrical Sockets for all guest rooms',732,40,'<p>\n	As per Ministry of Tourism Instruction</p>\n',27,25,3,0,2),(1308,'CB-MAJ-2016-034','Rooms Partial renovation ( paintining , polishing , finishing )',175,3800,'<p>\n	rooms renovation ( painting &amp; polishing)as the rooms in very bad condition</p>\n',27,25,1,0,2),(1309,'CB-MAJ-2016-035','Façade Painting Renovation',30000,35,'<p>\n	A Lot of the walls have cracks and the walls not leveled need to be removed and adjusted</p>\n',27,25,1,0,2),(1310,'CB-MAJ-2016-036','Jacuzzi for two Crystal suites ',2,60000,'<p>\n	For Suites 353 &amp; 262</p>\n',27,25,3,0,2),(1311,'CB-MAJ-2016-037','Control for A/C centegrate (24Centgrate) Rooms',380,150,'<p>\n	Save for Electricity cost</p>\n',27,25,3,0,2),(1312,'CB-MAJ-2016-038','Changing all lamps to LED',1,650000,'<p>\n	Save for electricty cost &amp;Cables</p>\n',27,25,3,0,2),(1313,'CB-MAJ-2016-039','LED Lamps for Swimming Pools',75,800,'<p>\n	to lighting the two swimming pools</p>\n',27,25,1,0,2),(1314,'CB-MAJ-2016-040','New play ground for kids on beach area ',1,75000,'<p>\n	will create new kids play ground on beach area</p>\n',27,25,2,0,2),(1315,'CB-MAJ-2016-041','Insulation for S.Pool over flow',2,30000,'<p>\n	for both over follow in s.pools bz of leaking</p>\n',27,25,1,0,2),(1316,'CB-MAJ-2016-042','Automatic Dosing Pump',2,35000,'<p>\n	As per Cristal Instruction to keep the Clorine and PH in the pool at range at any time</p>\n',27,25,1,0,2),(1317,'CB-MAJ-2016-043','Marbel for swimming pool dick',750,150,'<p>\n	instead of Ceramic</p>\n',27,25,2,0,2),(1318,'CB-MAJ-2016-044','Service lift for F&B ',1,75000,'<p>\n	To Load all the F&amp;B Beverage from Receiving area to the lobby bar</p>\n',27,25,1,0,2),(1319,'CB-MAJ-2016-045','Drainage Covers(difference measurments)',70,700,'<p>\n	for all the drainage covers in hotel walkways and landscape</p>\n',27,25,3,0,2),(1320,'CB-MAJ-2016-046','Concrete for Receiving area ',500,150,'<p>\n	Maintenace for receiving area floor as per cristal</p>\n',27,25,1,0,2),(1321,'CB-MAJ-2016-047','Enterance ramp',550,120,'<p>\n	Renovation for two enterance ramp</p>\n',27,25,1,0,2),(1322,'CB-MAJ-2016-048','New restaurant ',1,100000,'<p>\n	to create new al a cart restaurant to increase food variety</p>\n',27,25,1,0,2),(1323,'CB-MAJ-2016-049','Toilet for beach',2,20000,'<p>\n	New toilets for guest at quite beach area</p>\n',27,25,2,0,2),(1324,'CB-MAJ-2016-050','New bottom layer of asphalt',500,150,'<p>\n	to change all the damaged asphalt in the parking and roads</p>\n',27,25,2,0,2),(1325,'CB‐ENG‐ 2016‐102','Renovation of walk ways',1200,102000,'<p>\n	will renew all the walk ways</p>\n',4,0,1,0,2),(1326,'CB-MAJ-2016-051','Renovation of Irrigation Station',1,150000,'<p>\n	Its not Working Well , because of old filter not enough&nbsp; we will add big&nbsp; filters and&nbsp; outmatic backwash and add Automatic fertilization machine</p>\n',27,25,2,0,2),(1327,'CB-MAJ-2016-052','Rooms Renovation ',226,12150,'<p>\n	need to renovate all the old room furniture (226 rooms)</p>\n',27,25,3,0,2),(1328,'CB-MAJ-2016-053','Planting 3500 m2 in front of hotel and connect it with irrigation network',1,50000,'<p>\n	as per chairman instrucation</p>\n',27,25,3,0,2),(1329,'CB-MAJ-2016-054','Renovation of walk ways',1200,85,'<p>\n	will renew all the walk ways</p>\n',27,25,1,0,2),(1330,'RM-MAJ-2016-0022','Renovation of the swimming pool ',1,4000000,'<p>\n	Renovation of the swimming pool&nbsp;</p>\n',27,22,1,0,2),(1331,'RM-MAJ-2016-023','New Main restaurant replace the exits workshop',1,6000000,NULL,27,0,1,0,2),(1332,'RM-MAJ-2016-024','The new irrigation system',1,700000,NULL,27,22,1,0,0),(1333,'RM-MAJ-2016-023','New Main restaurant replace the exits workshop',1,6000000,NULL,27,22,1,1,2),(1334,'RM-MAJ-2016-025','2 new building for staff housing',1,1000000,NULL,27,22,1,0,2),(1335,'RM-MAJ-2016-026','New cooling and freezing stores',1,1600000,NULL,27,22,1,0,2),(1336,'RM-MAJ-2016-027','Power Transformer ',1,500000,NULL,27,22,1,0,2),(1337,'RM-MAJ-2016-028','Electricity Generator',1,3000000,NULL,27,22,1,0,2),(1338,'RM-MAJ-2016-029','Rooms Renovation',1,9000000,NULL,27,22,1,0,2),(1339,'RM-MAJ-2016-030','Renovation of Dalila Restaurant  ',1,2000000,NULL,27,22,1,0,2),(1340,'RM-MAJ-2016-031','New Beach Bar & Snack Bar',1,1000000,NULL,27,22,1,0,2),(1341,'RM-MAJ-2016-032','Expansion of the beach',1,554200,NULL,27,22,1,0,2),(1342,'DB-IT-2016-002','IT License',1,180000,NULL,2,28,1,0,2),(1343,'AB-IT-2016-001','IT License',1,220000,NULL,2,24,1,0,2),(1344,'MP-MAJ-2016-010','Change Hotel Lamps To Led Lights   ',1,693553,NULL,27,23,1,0,2),(1345,'AB-Maj-2016-002','Led Light',1,871943,NULL,27,24,1,0,2),(1346,'RM-MAJ-2016-022','LED Lamp for Swimming Pool',60,850,NULL,27,22,1,0,2),(1347,'HO-Maj-2016-007','Led Lamps for all hotel ',1,230000,NULL,27,27,1,0,2);
/*!40000 ALTER TABLE `plan_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_signatures`
--

DROP TABLE IF EXISTS `plan_signatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_signatures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rank` int(5) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `reject` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_signatures`
--

LOCK TABLES `plan_signatures` WRITE;
/*!40000 ALTER TABLE `plan_signatures` DISABLE KEYS */;
INSERT INTO `plan_signatures` VALUES (1,NULL,4,'2015-09-28 11:25:39',1,2,0),(2,NULL,6,'2015-09-28 11:25:39',2,2,0),(3,NULL,3,'2015-09-28 11:25:39',3,2,0),(4,NULL,16,'2015-09-28 11:25:39',4,2,0),(5,NULL,5,'2015-09-28 12:59:33',1,3,0),(6,1,6,'2015-09-28 13:00:25',2,3,0),(7,NULL,4,'2015-09-28 12:59:33',3,3,0),(8,NULL,3,'2015-09-28 12:59:33',4,3,0),(9,NULL,16,'2015-09-28 12:59:33',5,3,0),(10,NULL,2,'2015-11-04 15:07:15',6,3,0),(11,NULL,5,'2015-09-28 13:30:05',1,4,0),(12,NULL,6,'2015-09-28 13:30:05',2,4,0),(13,NULL,4,'2015-09-28 13:30:05',3,4,0),(14,NULL,3,'2015-09-28 13:30:05',4,4,0),(15,NULL,16,'2015-09-28 13:30:05',5,4,0),(16,NULL,2,'2015-11-04 15:07:15',6,4,0),(17,1,6,'2015-09-29 12:27:34',1,5,0),(18,NULL,4,'2015-09-29 12:26:24',2,5,0),(19,NULL,3,'2015-09-29 12:26:24',3,5,0),(20,NULL,16,'2015-09-29 12:26:24',4,5,0),(21,NULL,2,'2015-11-04 15:07:15',5,5,0),(22,NULL,4,'2015-10-04 07:47:24',1,8,0),(23,NULL,6,'2015-10-04 07:47:24',2,8,0),(24,NULL,3,'2015-10-04 07:47:24',3,8,0),(25,NULL,16,'2015-10-04 07:47:24',4,8,0),(26,NULL,4,'2015-10-04 10:03:19',1,9,0),(27,NULL,6,'2015-10-04 10:03:19',2,9,0),(28,NULL,3,'2015-10-04 10:03:19',3,9,0),(29,NULL,16,'2015-10-04 10:03:19',4,9,0),(30,NULL,6,'2015-10-04 11:21:53',1,10,0),(31,NULL,16,'2015-10-04 11:21:53',2,10,0),(32,NULL,4,'2015-10-04 11:21:53',3,10,0),(33,NULL,3,'2015-10-04 11:21:53',4,10,0),(34,NULL,2,'2015-10-04 11:21:53',5,10,0),(35,NULL,6,'2015-10-05 07:44:49',1,11,0),(36,NULL,17,'2015-10-05 07:44:49',2,11,0),(37,NULL,16,'2015-10-05 07:44:49',3,11,0),(38,NULL,4,'2015-10-05 07:44:49',4,11,0),(39,NULL,3,'2015-10-05 07:44:49',5,11,0),(40,NULL,2,'2015-10-05 07:44:49',6,11,0),(41,NULL,6,'2015-10-05 11:00:17',1,12,0),(42,NULL,16,'2015-10-05 11:00:17',2,12,0),(43,NULL,4,'2015-10-05 11:00:17',3,12,0),(44,NULL,3,'2015-10-05 11:00:18',4,12,0),(45,NULL,2,'2015-10-05 11:00:18',5,12,0),(46,NULL,6,'2015-10-05 13:44:50',1,13,0),(47,NULL,16,'2015-10-05 13:44:50',2,13,0),(48,NULL,4,'2015-10-05 13:44:51',3,13,0),(49,NULL,3,'2015-10-05 13:44:51',4,13,0),(50,NULL,2,'2015-10-05 13:44:51',5,13,0),(51,NULL,6,'2015-10-06 09:24:30',1,14,0),(52,NULL,17,'2015-10-06 09:24:30',2,14,0),(53,NULL,16,'2015-10-06 09:24:30',3,14,0),(54,NULL,4,'2015-10-06 09:24:30',4,14,0),(55,NULL,3,'2015-10-06 09:24:30',5,14,0),(56,NULL,2,'2015-10-06 09:24:30',6,14,0),(57,1,6,'2015-10-07 10:17:20',1,15,0),(58,NULL,16,'2015-10-06 12:24:32',2,15,0),(59,NULL,4,'2015-10-06 12:24:32',3,15,0),(60,NULL,3,'2015-10-06 12:24:32',4,15,0),(61,NULL,2,'2015-10-06 12:24:32',5,15,0),(62,77,6,'2015-11-04 10:18:16',1,16,0),(63,55,16,'2015-11-05 07:46:57',2,16,0),(64,3,3,'2015-11-24 13:23:01',4,16,0),(65,NULL,2,'2015-11-04 15:07:15',5,16,0),(66,1,6,'2015-10-07 11:03:16',1,17,0),(67,1,17,'2015-10-07 11:07:16',2,17,0),(68,NULL,16,'2015-10-07 10:53:39',3,17,0),(69,NULL,4,'2015-10-07 10:53:39',4,17,0),(70,NULL,3,'2015-10-07 10:53:39',5,17,0),(71,NULL,2,'2015-10-07 10:53:40',6,17,0),(72,4,4,'2015-11-24 13:00:24',3,16,0),(73,NULL,6,'2015-10-08 12:07:15',1,18,0),(74,NULL,16,'2015-10-08 12:07:15',2,18,0),(75,NULL,4,'2015-10-08 12:07:15',3,18,0),(76,NULL,3,'2015-10-08 12:07:15',4,18,0),(77,NULL,2,'2015-11-04 15:07:15',5,18,0),(78,NULL,6,'2015-10-08 18:58:11',1,19,0),(79,NULL,16,'2015-10-08 18:58:11',2,19,0),(80,NULL,4,'2015-10-08 18:58:11',3,19,0),(81,NULL,3,'2015-10-08 18:58:11',4,19,0),(82,NULL,2,'2015-10-08 18:58:11',5,19,0),(83,NULL,6,'2015-10-09 06:11:41',1,20,0),(84,NULL,16,'2015-10-09 06:11:41',2,20,0),(85,NULL,4,'2015-10-09 06:11:41',3,20,0),(86,NULL,3,'2015-10-09 06:11:41',4,20,0),(87,NULL,2,'2015-10-09 06:11:41',5,20,0),(88,6,6,'2015-10-13 11:35:33',1,21,0),(89,55,16,'2015-10-19 10:04:51',2,21,0),(90,4,4,'2015-10-31 14:19:29',3,21,0),(91,3,3,'2015-11-04 08:19:09',4,21,0),(92,NULL,2,'2015-11-04 15:07:15',5,21,0),(93,129,6,'2015-11-02 09:31:52',1,22,0),(94,55,16,'2015-11-02 10:22:21',2,22,0),(95,4,4,'2015-11-04 08:50:21',3,22,0),(96,3,3,'2015-11-04 09:52:15',4,22,0),(97,NULL,2,'2015-11-04 15:07:15',5,22,0),(98,6,6,'2015-10-13 11:36:19',1,23,0),(99,4,4,'2015-10-31 14:21:00',3,23,0),(100,55,16,'2015-10-19 10:04:29',2,23,0),(101,3,3,'2015-11-04 08:21:33',4,23,0),(102,NULL,2,'2015-11-04 15:07:15',5,23,0),(103,139,6,'2015-10-20 06:32:50',1,24,0),(104,30,17,'2015-10-22 06:44:15',2,24,0),(105,55,16,'2015-10-22 15:18:16',3,24,0),(106,59,4,'2015-10-24 16:43:56',4,24,0),(107,3,3,'2015-11-04 08:22:28',5,24,0),(108,NULL,2,'2015-11-04 15:07:15',6,24,0),(109,25,6,'2015-10-27 19:19:18',1,25,0),(110,55,16,'2015-10-28 11:24:20',2,25,0),(111,4,4,'2015-11-03 07:26:50',3,25,0),(112,3,3,'2015-11-04 08:23:20',4,25,0),(113,NULL,2,'2015-11-04 15:07:15',5,25,0),(114,93,6,'2015-10-22 10:07:09',1,26,0),(115,30,17,'2015-10-22 11:55:36',2,26,0),(116,55,16,'2015-10-22 15:19:20',3,26,0),(117,59,4,'2015-10-24 15:48:21',4,26,0),(118,3,3,'2015-11-04 08:24:54',5,26,0),(119,NULL,2,'2015-11-04 15:07:15',6,26,0),(120,40,6,'2015-10-29 13:54:55',1,27,0),(121,55,16,'2015-10-31 10:14:55',2,27,0),(122,4,4,'2015-10-31 14:52:27',3,27,0),(123,3,3,'2015-11-04 08:25:17',4,27,0),(124,NULL,2,'2015-11-04 15:07:15',5,27,0),(125,137,6,'2015-10-21 20:14:18',1,28,0),(126,30,17,'2015-10-23 17:22:57',2,28,0),(127,55,16,'2015-10-24 14:32:42',3,28,0),(128,59,4,'2015-10-25 10:03:46',4,28,0),(129,3,3,'2015-11-04 08:26:22',5,28,0),(130,NULL,2,'2015-11-04 15:07:15',6,28,0),(131,68,6,'2015-10-27 14:44:38',1,29,0),(132,55,16,'2015-10-28 11:25:13',2,29,0),(133,4,4,'2015-11-24 13:00:40',3,29,0),(134,3,3,'2015-11-24 13:33:24',4,29,0),(135,NULL,2,'2015-11-04 15:07:15',5,29,0);
/*!40000 ALTER TABLE `plan_signatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_states`
--

DROP TABLE IF EXISTS `plan_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_states`
--

LOCK TABLES `plan_states` WRITE;
/*!40000 ALTER TABLE `plan_states` DISABLE KEYS */;
INSERT INTO `plan_states` VALUES (1,'Submitted'),(2,'Approved'),(3,'Rejected');
/*!40000 ALTER TABLE `plan_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planned_limitations`
--

DROP TABLE IF EXISTS `planned_limitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planned_limitations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `limit` int(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planned_limitations`
--

LOCK TABLES `planned_limitations` WRITE;
/*!40000 ALTER TABLE `planned_limitations` DISABLE KEYS */;
INSERT INTO `planned_limitations` VALUES (1,16,40000),(2,2,85000);
/*!40000 ALTER TABLE `planned_limitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plans`
--

DROP TABLE IF EXISTS `plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `total` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `year_pos` int(11) DEFAULT NULL,
  `cf_pos` int(11) DEFAULT NULL,
  `hotel_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans`
--

LOCK TABLES `plans` WRITE;
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
INSERT INTO `plans` VALUES (16,'2016',0,77,'2015-10-06 13:33:03',2,1,10,1,0),(21,'2016',0,6,'2015-10-09 08:12:14',NULL,NULL,1,1,0),(22,'2016',0,129,'2015-10-09 09:42:10',NULL,NULL,4,1,0),(23,'2016',0,6,'2015-10-09 10:07:51',NULL,NULL,2,1,0),(24,'2016',0,139,'2015-10-09 13:09:29',4094336,3132211,7,1,0),(25,'2016',0,25,'2015-10-10 11:59:42',NULL,NULL,3,1,0),(26,'2016',0,93,'2015-10-10 13:50:47',2604846,1353978,8,1,0),(27,'2016',0,40,'2015-10-10 21:43:09',63173076,2907229,5,1,0),(28,'2016',0,137,'2015-10-11 10:22:06',3434939,1883660,6,1,0),(29,'2016',0,68,'2015-10-11 11:24:13',NULL,NULL,11,1,0);
/*!40000 ALTER TABLE `plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priorities`
--

DROP TABLE IF EXISTS `priorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priorities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priorities`
--

LOCK TABLES `priorities` WRITE;
/*!40000 ALTER TABLE `priorities` DISABLE KEYS */;
INSERT INTO `priorities` VALUES (1,'A'),(2,'B'),(3,'C');
/*!40000 ALTER TABLE `priorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_approvals`
--

DROP TABLE IF EXISTS `project_approvals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_approvals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `timestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `rank` int(5) NOT NULL,
  `project_id` int(11) NOT NULL,
  `reject` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_approvals`
--

LOCK TABLES `project_approvals` WRITE;
/*!40000 ALTER TABLE `project_approvals` DISABLE KEYS */;
INSERT INTO `project_approvals` VALUES (1,129,0,'2016-01-13 08:41:00',0,1,0),(2,4,4,'2016-01-16 10:50:47',1,1,0),(3,3,3,'2016-01-17 10:57:10',2,1,0),(4,55,16,'2016-01-18 12:06:27',3,1,0),(5,2,2,'2016-01-20 14:56:18',4,1,0),(6,146,0,'2016-01-17 13:54:42',0,2,0),(7,NULL,4,NULL,1,2,0),(8,NULL,3,NULL,2,2,0),(9,NULL,16,NULL,3,2,0),(10,146,0,'2016-01-17 13:56:15',0,3,0),(11,NULL,4,NULL,1,3,0),(12,NULL,3,NULL,2,3,0),(13,NULL,16,NULL,3,3,0),(14,146,0,'2016-01-17 13:58:35',0,4,0),(15,4,4,'2016-01-20 07:30:24',1,4,0),(16,3,3,'2016-01-20 10:33:43',2,4,0),(17,55,16,'2016-01-20 10:46:24',3,4,0),(18,115,0,'2016-01-18 11:02:39',0,5,0),(19,59,4,'2016-01-23 09:57:20',2,5,0),(20,3,3,'2016-01-23 11:22:11',3,5,0),(21,55,16,'2016-01-23 11:26:26',4,5,0),(22,83,0,'2016-01-18 14:07:15',0,6,0),(23,NULL,4,NULL,2,6,0),(24,NULL,3,NULL,3,6,0),(25,NULL,16,NULL,4,6,0),(26,NULL,18,NULL,1,6,0),(28,129,0,'2016-01-21 11:26:38',0,7,0),(29,NULL,4,NULL,1,7,0),(30,NULL,3,NULL,2,7,0),(31,NULL,16,NULL,3,7,0),(32,NULL,2,NULL,4,7,0),(33,129,0,'2016-01-21 11:26:51',0,8,0),(34,NULL,4,NULL,1,8,0),(35,NULL,3,NULL,2,8,0),(36,NULL,16,NULL,3,8,0),(37,NULL,2,NULL,4,8,0),(38,115,0,'2016-01-23 12:43:38',0,9,0),(39,115,6,'2016-01-24 13:22:06',1,9,0),(40,59,4,'2016-01-26 10:15:55',2,9,0),(41,3,3,'2016-01-26 13:01:03',3,9,0),(42,55,16,'2016-01-26 13:32:38',4,9,0),(43,NULL,1,NULL,5,9,0),(44,1,0,'2016-01-26 12:42:31',0,10,0),(45,1,4,'2016-01-26 12:42:51',1,10,0),(46,1,3,'2016-01-26 12:43:15',2,10,0),(47,1,16,'2016-01-26 12:43:43',3,10,0),(48,146,0,'2016-01-27 10:28:40',0,11,0),(49,4,4,'2016-02-09 08:18:18',1,11,0),(50,3,3,'2016-02-14 11:42:27',2,11,0),(51,55,16,'2016-02-14 12:05:16',3,11,0),(52,25,0,'2016-01-28 09:45:34',0,12,0),(53,4,4,'2016-02-01 14:18:35',2,12,0),(54,3,3,'2016-02-01 15:28:59',3,12,0),(55,55,16,'2016-02-01 15:47:00',4,12,0),(56,2,2,'2016-02-03 10:13:58',5,12,0),(57,146,0,'2016-01-28 11:57:42',0,13,0),(58,4,4,'2016-02-09 08:09:59',1,13,0),(59,NULL,3,NULL,2,13,0),(60,NULL,16,NULL,3,13,0),(61,NULL,2,NULL,4,13,0),(62,115,6,'2016-01-29 15:27:14',0,14,0),(65,59,4,'2016-01-31 11:55:55',1,14,0),(66,3,3,'2016-01-31 13:19:43',2,14,0),(67,55,16,'2016-01-31 13:27:21',3,14,0),(68,115,0,'2016-01-29 15:25:43',0,15,0),(69,115,6,'2016-01-29 15:26:23',1,15,0),(70,NULL,4,NULL,2,15,0),(71,NULL,3,NULL,3,15,0),(72,NULL,16,NULL,4,15,0),(74,25,0,'2016-01-30 16:25:44',0,16,0),(75,NULL,4,NULL,1,16,0),(76,NULL,3,NULL,2,16,0),(77,NULL,16,NULL,3,16,0),(78,NULL,2,NULL,4,16,0),(79,129,0,'2016-01-31 10:12:43',0,17,0),(80,NULL,4,NULL,1,17,0),(81,NULL,3,NULL,2,17,0),(82,NULL,16,NULL,3,17,0),(83,NULL,2,NULL,4,17,0),(84,129,0,'2016-01-31 10:21:14',0,18,0),(85,NULL,4,NULL,1,18,0),(86,NULL,3,NULL,2,18,0),(87,NULL,16,NULL,3,18,0),(88,115,0,'2016-01-31 13:56:25',0,19,0),(89,115,6,'2016-01-31 13:56:40',1,19,0),(90,59,4,'2016-02-06 10:11:06',2,19,0),(91,3,3,'2016-02-09 10:53:04',3,19,0),(92,55,16,'2016-02-17 09:31:58',4,19,0),(93,NULL,1,NULL,5,19,0),(94,115,0,'2016-02-01 12:00:51',0,20,0),(95,115,6,'2016-02-01 12:01:11',1,20,0),(96,59,4,'2016-02-06 10:10:26',2,20,0),(97,3,3,'2016-02-09 10:53:40',3,20,0),(98,55,16,'2016-02-17 09:31:41',4,20,0),(99,NULL,1,NULL,5,20,0),(100,115,0,'2016-02-01 12:25:16',0,21,0),(101,115,6,'2016-02-01 12:25:22',1,21,0),(102,59,4,'2016-02-06 10:10:49',2,21,0),(103,3,3,'2016-02-09 10:53:24',3,21,0),(104,55,16,'2016-02-17 09:31:07',4,21,0),(105,NULL,1,NULL,5,21,0),(106,68,0,'2016-02-06 09:32:59',0,22,0),(107,4,4,'2016-02-07 10:58:59',1,22,0),(108,NULL,3,NULL,2,22,0),(109,NULL,16,NULL,3,22,0),(110,NULL,2,NULL,4,22,0),(111,146,0,'2016-02-08 15:17:11',0,23,0),(112,4,4,'2016-02-09 08:08:08',1,23,0),(113,3,3,'2016-02-10 09:30:32',2,23,0),(114,55,16,'2016-02-10 16:50:15',3,23,0),(115,2,2,'2016-02-11 08:08:03',4,23,0),(116,146,0,'2016-02-15 13:28:58',0,24,0),(117,4,4,'2016-02-18 10:35:48',1,24,0),(118,3,3,'2016-02-18 11:21:03',2,24,0),(119,55,16,'2016-02-18 11:49:34',3,24,0),(120,2,2,'2016-02-25 09:53:58',4,24,0),(121,25,0,'2016-02-16 11:35:11',0,25,0),(125,NULL,4,NULL,2,25,0),(128,NULL,3,NULL,3,25,0),(131,NULL,16,NULL,4,25,0),(135,NULL,2,NULL,5,25,0),(138,129,0,'2016-02-18 10:52:36',0,26,0),(139,4,4,'2016-02-18 11:09:41',1,26,0),(140,3,3,'2016-02-20 09:46:37',2,26,0),(141,55,16,'2016-02-20 09:53:33',3,26,0),(142,129,0,'2016-02-22 08:47:37',0,27,0),(143,NULL,4,NULL,1,27,0),(144,NULL,3,NULL,2,27,0),(145,NULL,16,NULL,3,27,0),(146,146,0,'2016-02-24 09:22:33',0,28,0),(147,4,4,'2016-02-25 11:37:11',1,28,0),(148,3,3,'2016-02-25 11:46:24',2,28,0),(149,NULL,16,NULL,3,28,0),(150,NULL,2,NULL,4,28,0),(151,146,0,'2016-02-24 09:28:11',0,29,0),(152,4,4,'2016-02-24 09:45:10',1,29,0),(153,3,3,'2016-02-24 09:51:36',2,29,0),(154,55,16,'2016-02-24 15:18:52',3,29,0),(155,NULL,2,NULL,4,29,0),(156,146,0,'2016-02-24 09:37:32',0,30,0),(157,4,4,'2016-02-24 09:45:59',1,30,0),(158,3,3,'2016-02-24 09:52:01',2,30,0),(159,55,16,'2016-02-24 15:19:17',3,30,0),(160,NULL,2,NULL,4,30,0),(161,146,0,'2016-02-24 09:41:13',0,31,0),(162,4,4,'2016-02-24 09:46:51',1,31,0),(163,3,3,'2016-02-24 09:52:54',2,31,0),(164,55,16,'2016-02-24 15:20:14',3,31,0),(165,NULL,2,NULL,4,31,0),(166,129,0,'2016-02-27 09:45:02',0,32,0),(167,4,4,'2016-02-27 11:44:06',1,32,0),(168,3,3,'2016-03-01 07:50:03',2,32,0),(169,55,16,'2016-03-01 08:50:11',3,32,0),(170,NULL,2,NULL,4,32,0),(171,174,0,'2016-03-02 07:46:51',0,33,0),(172,NULL,4,NULL,1,33,0),(173,NULL,3,NULL,2,33,0),(174,NULL,16,NULL,3,33,0),(175,146,0,'2016-03-02 08:53:59',0,34,0),(176,4,4,'2016-03-02 09:31:25',1,34,0),(177,3,3,'2016-03-02 09:32:24',2,34,0),(178,55,16,'2016-03-02 11:58:54',3,34,0),(179,NULL,2,NULL,4,34,0),(180,129,0,'2016-03-13 11:16:35',0,35,0),(181,NULL,4,NULL,1,35,0),(182,NULL,3,NULL,2,35,0),(183,NULL,16,NULL,3,35,0),(184,NULL,2,NULL,4,35,0),(185,129,0,'2016-03-13 12:45:05',0,36,0),(186,4,4,'2016-03-15 14:43:22',1,36,0),(187,3,3,'2016-03-16 10:03:19',2,36,0),(188,55,16,'2016-03-16 10:20:12',3,36,0);
/*!40000 ALTER TABLE `project_approvals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_comments`
--

DROP TABLE IF EXISTS `project_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `privilege` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_comments`
--

LOCK TABLES `project_comments` WRITE;
/*!40000 ALTER TABLE `project_comments` DISABLE KEYS */;
INSERT INTO `project_comments` VALUES (1,1,149,'OK','2016-01-21 10:35:59',0),(2,10,167,'jhdrkgdfgkjdfkgjd','2016-01-28 13:49:21',1),(3,10,165,'ishdiunhsvdusbfhubsud9bas8(D','2016-01-28 13:50:00',1),(4,14,115,'ok','2016-01-29 14:53:43',0),(5,14,115,'ok','2016-01-29 14:53:54',0),(6,14,115,'ok','2016-01-29 15:04:45',0),(7,15,115,'ok','2016-01-29 15:26:54',0),(8,15,115,'ok','2016-01-29 15:26:58',0),(9,19,59,'we have to mention how many we need & how much each one?','2016-01-31 14:23:47',0),(10,10,168,'[poi-k\';l\'','2016-02-02 11:34:46',1),(11,23,169,'ok','2016-02-18 14:12:24',0),(12,12,169,'ok','2016-02-18 14:15:32',1),(13,12,169,'ok','2016-02-18 14:16:09',0),(14,23,101,'?????? ??? ???? ???? ????????ال','2016-02-18 16:21:10',1),(15,11,73,'Very important project .','2016-02-21 08:17:24',0),(16,24,2,'we are still checking the best location , location will be advise soon , tks','2016-02-25 09:54:28',0),(17,23,102,'ok','2016-02-25 11:22:56',1),(18,23,2,'pls do application to approve the contractor and to add him to the approved contractors list , tks','2016-02-25 14:25:30',0),(19,12,95,'OK - Regarding The Irrigation System & Plants Approved From Eng.Ahmed Ismail','2016-03-03 12:25:08',1),(20,12,100,'OK','2016-03-03 12:52:55',1),(21,12,102,'ok','2016-03-03 14:05:49',1);
/*!40000 ALTER TABLE `project_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_files`
--

DROP TABLE IF EXISTS `project_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `project_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_files`
--

LOCK TABLES `project_files` WRITE;
/*!40000 ALTER TABLE `project_files` DISABLE KEYS */;
INSERT INTO `project_files` VALUES (1,'CUserspcDesktopمكادى.docx','0'),(2,'CUserspcDesktopNew_folder_(2)Sikagrout-214.pdf','0'),(3,'CUserspcDesktopNew_folder_(2)_07__Sika_Top_Seal_107.pdf','0'),(4,'اعمال_الكترو_ميكانيك_المطلوب_عملها_فى_حمام_السباحة_الرئيسى.docx','0'),(5,'المتحدة.docx','0'),(6,'كونستيل.docx','0'),(7,'تقرير_فنى_عن_الطلمبات.docx','4'),(8,'World_Cup_Schedule.pptx','26332'),(9,'اعما_كهرباء.PDF','12'),(10,'اعمال_مدينة.PDF','12'),(11,'زراعة.PDF','12'),(12,'شبكة_الرى.PDF','12'),(13,'Mamlouk_rooms_renovation_annex.pdf','16'),(14,'عرض_سعر.pdf','23'),(15,'CWS_Offer_Wooden_boxes_for_Landscape.pdf','25');
/*!40000 ALTER TABLE `project_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_origins`
--

DROP TABLE IF EXISTS `project_origins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_origins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_origins`
--

LOCK TABLES `project_origins` WRITE;
/*!40000 ALTER TABLE `project_origins` DISABLE KEYS */;
INSERT INTO `project_origins` VALUES (1,'Budgeted'),(2,'Planned'),(3,'Unplanned');
/*!40000 ALTER TABLE `project_origins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_owning_form`
--

DROP TABLE IF EXISTS `project_owning_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_owning_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `financial_notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_owning_form`
--

LOCK TABLES `project_owning_form` WRITE;
/*!40000 ALTER TABLE `project_owning_form` DISABLE KEYS */;
INSERT INTO `project_owning_form` VALUES (27,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,10,'2016-01-26 12:44:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,12,'2016-02-04 15:23:54','','','','','','','','','','','','','',''),(32,23,'2016-02-17 09:30:09',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,26,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `project_owning_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_progress`
--

DROP TABLE IF EXISTS `project_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_progress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_progress`
--

LOCK TABLES `project_progress` WRITE;
/*!40000 ALTER TABLE `project_progress` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_signatures`
--

DROP TABLE IF EXISTS `project_signatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_signatures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rank` int(5) NOT NULL,
  `project_id` int(11) NOT NULL,
  `reject` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_signatures`
--

LOCK TABLES `project_signatures` WRITE;
/*!40000 ALTER TABLE `project_signatures` DISABLE KEYS */;
INSERT INTO `project_signatures` VALUES (1,146,0,'2016-01-21 12:13:02',0,1,0),(2,149,20,'2016-01-21 12:19:56',2,1,0),(3,NULL,21,'2016-01-21 10:13:02',3,1,0),(4,NULL,19,'2016-01-21 10:13:02',4,1,0),(7,NULL,6,'2016-01-21 10:13:02',7,1,0),(9,NULL,16,'2016-01-21 10:13:02',9,1,0),(15,NULL,5,'2016-01-21 12:13:02',5,1,0),(16,NULL,4,'2016-01-21 12:13:02',6,1,0),(18,NULL,3,'2016-01-21 12:13:02',8,1,0),(20,NULL,2,'2016-01-21 12:13:02',10,1,0),(21,73,0,'2016-01-21 13:29:01',0,4,0),(22,73,20,'2016-01-21 13:29:27',2,4,0),(23,157,21,'2016-01-26 08:12:56',3,4,0),(24,26,19,'2016-01-31 11:56:37',4,4,0),(25,138,5,'2016-02-24 08:04:12',5,4,0),(26,NULL,4,'2016-01-21 13:29:01',6,4,0),(27,NULL,6,'2016-01-21 13:29:01',7,4,0),(28,NULL,3,'2016-01-21 13:29:01',8,4,0),(29,NULL,16,'2016-01-21 13:29:01',9,4,0),(30,1,0,'2016-01-26 12:44:36',0,10,0),(31,1,20,'2016-01-26 12:47:59',2,10,0),(32,NULL,21,'2016-01-26 12:44:28',3,10,0),(33,NULL,19,'2016-01-26 12:44:28',4,10,0),(34,NULL,5,'2016-01-26 12:44:28',5,10,0),(35,NULL,4,'2016-01-26 12:44:28',6,10,0),(36,NULL,6,'2016-01-26 12:44:28',7,10,0),(37,NULL,3,'2016-01-26 12:44:28',8,10,0),(38,NULL,16,'2016-01-26 12:44:28',9,10,0),(39,115,0,'0000-00-00 00:00:00',0,14,0),(40,97,0,'2016-02-03 11:09:28',0,12,0),(41,97,20,'2016-02-03 11:09:38',2,12,0),(42,152,21,'2016-02-04 08:34:47',3,12,0),(43,26,19,'2016-02-04 09:10:49',4,12,0),(44,86,5,'2016-02-04 09:56:36',5,12,0),(45,4,4,'2016-02-04 10:03:38',6,12,0),(46,25,6,'2016-02-04 10:29:14',7,12,0),(47,3,3,'2016-02-04 10:41:03',8,12,0),(48,55,16,'2016-02-04 15:23:54',9,12,0),(49,NULL,2,'2016-02-04 08:32:53',100,12,0),(50,73,0,'2016-02-11 13:50:43',0,23,0),(51,73,20,'2016-02-11 13:51:18',2,23,0),(52,157,21,'2016-02-16 10:11:35',3,23,0),(53,26,19,'2016-02-16 10:48:12',4,23,0),(54,138,5,'2016-02-16 10:50:11',5,23,0),(55,4,4,'2016-02-16 11:47:03',6,23,0),(56,146,6,'2016-02-16 12:38:10',7,23,0),(57,3,3,'2016-02-16 14:07:09',8,23,0),(58,55,16,'2016-02-17 09:30:09',9,23,0),(59,2,2,'2016-02-25 14:24:45',10,23,0),(60,73,0,'2016-02-21 08:16:11',0,11,0),(61,73,20,'2016-02-21 08:16:20',2,11,0),(62,157,21,'2016-02-21 10:29:49',3,11,0),(63,NULL,19,'2016-02-21 08:16:10',4,11,0),(64,NULL,5,'2016-02-21 08:16:10',5,11,0),(65,NULL,4,'2016-02-21 08:16:10',6,11,0),(66,NULL,6,'2016-02-21 08:16:10',7,11,0),(67,NULL,3,'2016-02-21 08:16:10',8,11,0),(68,NULL,16,'2016-02-21 08:16:10',9,11,0),(69,NULL,2,'2016-02-21 10:29:25',100,11,0),(70,149,0,'2016-02-22 08:47:59',0,26,0),(71,149,20,'2016-02-22 08:48:20',2,26,0),(72,NULL,21,'2016-02-22 08:47:58',3,26,0),(73,NULL,19,'2016-02-22 08:47:58',4,26,0),(74,NULL,5,'2016-02-22 08:47:58',5,26,0),(75,NULL,4,'2016-02-22 08:47:58',6,26,0),(76,NULL,6,'2016-02-22 08:47:58',7,26,0),(77,NULL,3,'2016-02-22 08:47:58',8,26,0),(78,NULL,16,'2016-02-22 08:47:58',9,26,0);
/*!40000 ALTER TABLE `project_signatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_states`
--

DROP TABLE IF EXISTS `project_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_states`
--

LOCK TABLES `project_states` WRITE;
/*!40000 ALTER TABLE `project_states` DISABLE KEYS */;
INSERT INTO `project_states` VALUES (0,'Added'),(1,'Requested'),(2,'Approved'),(3,'Submitted'),(4,'Active'),(5,'Due'),(7,'Done'),(11,'Disapproved'),(12,'Rejected'),(33,'Pending Offers');
/*!40000 ALTER TABLE `project_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_types`
--

DROP TABLE IF EXISTS `project_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_types`
--

LOCK TABLES `project_types` WRITE;
/*!40000 ALTER TABLE `project_types` DISABLE KEYS */;
INSERT INTO `project_types` VALUES (1,'Mandatory'),(2,'Maintenance'),(3,'Enhancement');
/*!40000 ALTER TABLE `project_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hotel_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reasons` text COLLATE utf8_unicode_ci,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_id` int(11) NOT NULL,
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
  `progress` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'2016-01-13 08:41:00',4,'main swimming pool renovation','<p>\n	water leakage at the main swimming pool</p>','1EB32',3,3,'<p>	main swimming pool renovation</p>',0,0,2092000,0,0,2092000,2467000,0,0,2467000,NULL,NULL,NULL,NULL,146,4,'2016-01-25','2016-03-12','2016','',33,0,0,NULL),(9,'2016-01-23 12:43:38',22,'Sundeck tanda','Sundeck tanda is very old and exhausted since many years and to avoide the guests complains',NULL,1,3,NULL,0,0,8932.5,0,0,8932.5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,115,12,NULL,NULL,NULL,'We needed this tande urgently due to the boat will be in operation this week and befor mid year vacation',1,0,0,NULL),(5,'2016-01-18 11:02:39',22,'تغيير ترتان الصن ديك','بالصن ديك','8EDFD',1,3,NULL,0,0,20401,0,0,20401,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,115,4,NULL,NULL,NULL,'For Nile Saray',1,0,0,NULL),(4,'2016-01-17 13:58:35',10,'2 Hot water pumps','To replace the 2 old pumps for the hot water .The Old pumps not working in proper way . We face lots of problem from the guests about the hot water. We try to fix many times in the work shop.\n','876DF',1,3,'New (2)hot water pumps',0,0,25000,0,0,25000,25000,0,0,25000,NULL,NULL,NULL,NULL,73,4,'2016-01-21','2016-02-07','2016','',4,0,0,NULL),(10,'2016-01-26 12:42:31',5,'tyst','test','75E87',1,3,'test',0,0,100,0,0,100,100,0,0,100,NULL,NULL,NULL,NULL,1,4,'2016-01-26','2016-01-29','2016','test',33,0,0,NULL),(11,'2016-01-27 10:28:39',10,'Transformer 1.5 Mega -ABB','As the recommendation of the Eng. consulting. to buy new transformer instead of the old one . the recommendation attached','FDA08',1,3,'New Transformer 1.5 Mega-ABB',0,0,185000,0,0,185000,180800,0,0,180800,NULL,NULL,NULL,NULL,73,4,'2016-02-21','2016-04-21','2016','',33,0,0,NULL),(12,'2016-01-28 09:45:34',1,'Concrete of walkways replacement','to replace the concrete of walkways and increase the green area as per Chairman\'s request.','5D1C2',1,3,'Two weeks',0,0,194289,0,0,194289,193892,0,0,193892,NULL,NULL,NULL,NULL,97,4,'2016-02-10','2016-02-25','2016','',4,0,0,NULL),(13,'2016-01-28 11:57:41',10,'Main Restaurant Kitchen tools','Main Restaurant need new Kitchen tools',NULL,1,3,NULL,0,0,58517.005,0,0,58517.005,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,146,6,NULL,NULL,NULL,'',1,0,0,NULL),(14,'2016-01-29 14:52:55',24,'شراء بطاريات','<p>\n	لزوم تشغيل المحركات حيث البطاريات القديمة غير قادرة على تشغيل المحركات وتعدى عمرها الافتراضى</p>\n','E757E',1,3,'<p>\n	لزوم تشغيل المحركات</p>\n',0,0,3200,0,0,3200,0,0,0,0,NULL,NULL,NULL,NULL,115,4,NULL,NULL,'2016','يجب تغير البطاريات وذلك لعدم قدرتها على تشغيل المحركات وانتهاء عمرها الافتراضى وذلك لمحافظه على التاكيد من عمل دوائر الحمايه للمحركات وسلامه الباخرة',1,0,0,NULL),(15,'2016-01-29 15:25:42',20,'شراء يطاريات','لزوم تشغيل المحركات وعدم قدرة البطاريات القديمه على تشغيل المحركات وانتهاء عمرها الافتراضى',NULL,1,3,NULL,0,0,6400,0,0,6400,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,115,4,NULL,NULL,NULL,'',1,0,0,NULL),(16,'2016-01-30 16:25:43',2,'Guest rooms renovation (annex)','To renew guestrooms',NULL,1,3,NULL,0,0,394122,0,0,394122,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,4,NULL,NULL,NULL,'',1,0,0,NULL),(17,'2016-01-31 10:12:43',4,'Maintain the Wind breaker','Maintain the wind breaker',NULL,1,3,NULL,0,0,101000,0,0,101000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,129,13,NULL,NULL,NULL,'',1,0,0,NULL),(18,'2016-01-31 10:21:14',4,'New water pump for the central laundry','Stainless steel water pump 315 - horizontal centrifugal',NULL,1,3,NULL,0,0,17000,0,0,17000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,129,4,NULL,NULL,NULL,'',1,0,0,NULL),(19,'2016-01-31 13:56:25',22,'شراء يطاريات','لزوم تشغيل المحركات والمولدات حيث ان البطاريات القديمه غير قادرة على تشغيل المحركات  وانتهاء عمرها الافتراضى',NULL,1,3,NULL,0,0,7240,0,0,7240,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,115,4,NULL,NULL,NULL,'وجود البطاريات الجيدة فى غاية الاهميه حيث تقوم بتشغيل دوائر الحمايه المحركات',1,0,0,NULL),(20,'2016-02-01 12:00:50',24,'متطلبات الدفاع الدفاع المدنى','بناء على معاينه الدفاع المدنى يجب الانتهاء من طلبات الدفاع الدفاع للحصول على مهله سنه',NULL,1,3,NULL,0,0,9000,0,0,9000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,115,4,NULL,NULL,NULL,'يجب تنفيذ تعليمات الدفاع المدنى للمحافظه على الباخرة وحصول على مهله لمدة عام',1,0,0,NULL),(21,'2016-02-01 12:25:15',25,'متطللبات الدفاع المدنى','بناء على معاينه الدفاع المدنى يجب الانتهاء من متطلبات ولحصول على مهله سنه',NULL,1,3,NULL,0,0,8700,0,0,8700,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,115,4,NULL,NULL,NULL,'يجب تنفيذ تعليمات الدفاع المدنى للمحافظه على الباخرة ولحصوله على مهله سنه',1,0,0,NULL),(22,'2016-02-06 09:32:59',11,'Repair Acrylic dome Reception','إصلاح قبة الأستقبال بفندق لوجاردان',NULL,2,3,NULL,0,0,36000,0,0,36000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,68,4,NULL,NULL,NULL,'',1,0,0,NULL),(23,'2016-02-08 15:17:11',10,'shedwan lobby','Shedwan lobby columns','FD5E9',1,3,'shedwan lobby repair',0,0,469500,0,0,469500,455000,0,0,455000,NULL,NULL,NULL,NULL,73,4,'2016-03-01','2016-03-31','2016','',7,0,1,NULL),(24,'2016-02-15 13:28:58',10,'shedwan sewege plant','new project','0391F',1,3,NULL,0,7.8,2325180,151425,0,3506295,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,146,4,NULL,NULL,NULL,'',2,0,0,NULL),(25,'2016-02-16 11:35:11',1,'Wooden Boxes for plants in GB & MP','wooden boxes for plants in the lobby of GB & MP to improve the image of the lobby',NULL,1,3,NULL,0,0,36975,0,0,36975,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,16,NULL,NULL,NULL,'',1,0,0,NULL),(26,'2016-02-18 10:52:36',4,'themed kids rooms','tour operator contract','01F09',1,3,'',1,1,28000,0,0,28000,0,0,0,0,NULL,NULL,NULL,NULL,149,12,'2016-03-01','2016-03-10','2016','urgent to be done and ready before March.\n6 rooms had been done already and we need to make other 20 rooms',33,0,0,NULL),(27,'2016-02-22 08:47:37',4,'the rest of Kids rooms project','Contract with Tour Operator',NULL,1,3,NULL,0,0,23000,0,0,23000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,129,12,NULL,NULL,NULL,'Complete the kids rooms ( linen- kids chairs -Maintenance work)',1,0,0,NULL),(28,'2016-02-24 09:22:31',10,'New shops','New shops',NULL,3,3,NULL,0,0,210165,0,0,210165,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,146,4,NULL,NULL,NULL,'All data with Eng. Soliman',1,0,0,NULL),(29,'2016-02-24 09:28:11',10,'irrigation system','New irrigation system for shedwan',NULL,3,3,NULL,0,0,195280,0,0,195280,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,146,4,NULL,NULL,NULL,'New irrigation system for shedwan as per Dr. Ahmed',1,0,0,NULL),(30,'2016-02-24 09:37:31',10,'Walk ways phase 2','To continues the wake ways project',NULL,3,3,NULL,0,0,155340,0,0,155340,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,146,4,NULL,NULL,NULL,'',1,0,0,NULL),(31,'2016-02-24 09:41:13',10,'Main Restaurant','To continues the Main Restaurant project',NULL,3,3,NULL,0,0,210000,0,0,210000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,146,4,NULL,NULL,NULL,'To continues the Maine Restaurant project',1,0,0,NULL),(32,'2016-02-27 09:45:01',4,'Emergency stairs for Building 10','Must to finalize for the Civil Defense license urgent',NULL,1,3,NULL,0,0,46370,0,0,46370,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,129,4,NULL,NULL,NULL,'',1,0,0,NULL),(33,'2016-03-02 07:46:51',5,'test','.kjsalkjfcklsdjcfsdlfjdslj',NULL,1,3,NULL,0,0,100,0,0,100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,174,4,NULL,NULL,NULL,'',1,0,0,NULL),(34,'2016-03-02 08:53:59',10,'New Furniture for 108 Renovated Rooms','The new furniture manufactured for the new 108 renovated rooms.',NULL,1,3,NULL,0,0,1528388,0,0,1528388,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,146,4,NULL,NULL,NULL,'Furniture will be manufactured by the central workshop',1,0,0,NULL),(36,'2016-03-13 12:45:05',4,'Room Renovation project','Room Renovation Sample','F6F30',1,3,NULL,0,0,30000,0,0,30000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,129,4,NULL,NULL,NULL,'',2,0,0,NULL);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_items`
--

DROP TABLE IF EXISTS `projects_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_items` (
  `project_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_items`
--

LOCK TABLES `projects_items` WRITE;
/*!40000 ALTER TABLE `projects_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_suppliers`
--

DROP TABLE IF EXISTS `projects_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_suppliers` (
  `project_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_suppliers`
--

LOCK TABLES `projects_suppliers` WRITE;
/*!40000 ALTER TABLE `projects_suppliers` DISABLE KEYS */;
INSERT INTO `projects_suppliers` VALUES (1,15),(1,475),(4,475),(10,3),(12,309),(12,548),(12,799),(0,309),(0,548),(0,799),(11,22),(11,679);
/*!40000 ALTER TABLE `projects_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties_departments`
--

DROP TABLE IF EXISTS `properties_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `properties_departments` (
  `property_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties_departments`
--

LOCK TABLES `properties_departments` WRITE;
/*!40000 ALTER TABLE `properties_departments` DISABLE KEYS */;
/*!40000 ALTER TABLE `properties_departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties_devisions`
--

DROP TABLE IF EXISTS `properties_devisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `properties_devisions` (
  `property_id` int(11) NOT NULL,
  `devision_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties_devisions`
--

LOCK TABLES `properties_devisions` WRITE;
/*!40000 ALTER TABLE `properties_devisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `properties_devisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `res_to_sign`
--

DROP TABLE IF EXISTS `res_to_sign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_to_sign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gid` int(11) NOT NULL,
  `forma_id` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `res_to_sign`
--

LOCK TABLES `res_to_sign` WRITE;
/*!40000 ALTER TABLE `res_to_sign` DISABLE KEYS */;
/*!40000 ALTER TABLE `res_to_sign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `res_type`
--

DROP TABLE IF EXISTS `res_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dummy` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id_2` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `res_type`
--

LOCK TABLES `res_type` WRITE;
/*!40000 ALTER TABLE `res_type` DISABLE KEYS */;
INSERT INTO `res_type` VALUES (1,'Comp. Tourism',0),(2,'Comp.Government ',0),(3,'Comp.Owner ',0),(4,'Comp.Internal auditor / Business Trip',0),(5,'Comp Room External Contract ',0),(6,'Comp. Suites-all ',0),(7,'Government rate ',0),(8,'Staff Rate ',0),(9,'Partener Rate Dsicount',0),(10,'0‐15 % Expect AB & MM ',0),(11,'15‐30% Expect AB & MM ',0),(12,'up 31% Expect AB & MM ',0),(13,'AB‐MM Discount 0‐15% ',0),(14,'AB‐MM Discount 16‐40 % ',0),(15,'AB‐MM Discount up 41 % ',0);
/*!40000 ALTER TABLE `res_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_comments`
--

DROP TABLE IF EXISTS `reservation_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forma_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `privilege` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_comments`
--

LOCK TABLES `reservation_comments` WRITE;
/*!40000 ALTER TABLE `reservation_comments` DISABLE KEYS */;
INSERT INTO `reservation_comments` VALUES (10,3,1,'BLa bla bla bla bla bla bla bla lba lbBLa bla bla bla bla bla bla bla lba lbBLa bla bla bla bla bla bla bla lba lbBLa bla bla bla bla bla bla bla lba lb','2016-02-23 16:28:45',0),(11,6,1,'Remarks Remarks Remarks Remarks Remarks Remarks Remarks','2016-02-23 16:30:00',0),(12,7,1,'Remarks Remarks Remarks Remarks Remarks Remarks Remarks Remarks Remarks Remarks Remarks Remarks Remarks','2016-02-23 16:37:12',0),(14,17,1,'comp. for IT ','2016-02-25 12:14:04',0),(15,17,145,'approved test ','2016-02-25 12:15:10',0);
/*!40000 ALTER TABLE `reservation_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_reservation`
--

DROP TABLE IF EXISTS `role_reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  `res_type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=151 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_reservation`
--

LOCK TABLES `role_reservation` WRITE;
/*!40000 ALTER TABLE `role_reservation` DISABLE KEYS */;
INSERT INTO `role_reservation` VALUES (93,30,3,11),(64,16,4,1),(63,6,3,1),(62,30,2,1),(150,2,4,2),(149,16,3,2),(148,6,2,2),(147,27,1,2),(113,2,3,3),(112,16,2,3),(111,6,1,3),(74,16,3,4),(73,6,2,4),(72,5,1,4),(77,16,3,5),(76,6,2,5),(75,5,1,5),(116,2,3,6),(115,16,2,6),(114,6,1,6),(120,2,4,7),(119,16,3,7),(118,6,2,7),(117,27,1,7),(84,16,3,8),(83,27,2,8),(82,6,1,8),(124,2,4,9),(123,6,3,9),(122,16,2,9),(121,30,1,9),(90,27,2,10),(89,28,1,10),(92,27,2,11),(91,28,1,11),(61,27,1,1),(129,2,5,12),(128,16,4,12),(127,3,3,12),(126,30,2,12),(125,27,1,12),(130,27,1,13),(132,30,2,14),(131,27,1,14),(142,2,5,15),(141,16,4,15),(140,3,3,15),(139,30,2,15),(138,27,1,15);
/*!40000 ALTER TABLE `role_reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_spo`
--

DROP TABLE IF EXISTS `role_spo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_spo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  `spo_type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_spo`
--

LOCK TABLES `role_spo` WRITE;
/*!40000 ALTER TABLE `role_spo` DISABLE KEYS */;
INSERT INTO `role_spo` VALUES (1,30,1,1),(2,16,2,1),(3,3,3,1),(4,1,4,1);
/*!40000 ALTER TABLE `role_spo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Chairman'),(2,'Chairman office Cai'),(3,'R.D.O.F'),(4,'Cluster FC'),(5,'Hotel FC'),(6,'Hotel GM'),(7,'Dep. Head'),(8,'Hotel Acc'),(9,'Employee'),(10,'رئيس قسم المشتريات '),(11,'رئيس قسم المكتب الفنى '),(12,'مدير ادارة المشتريات '),(13,'مدير حسابات '),(14,'مدير ادارة الاستثمار '),(15,'مدير مالى الإنشاءات'),(16,'Managing Director'),(17,'Area General Manager SH'),(18,'Regional IT Director'),(19,'Cluster Purchasing'),(20,'Chief Engineer'),(21,'Hotel Purchasing'),(22,'نظم المعلومات'),(23,'CPO'),(24,'Company Financial Controller'),(25,'Commercial Relation Manager'),(26,'Owning Company MD'),(27,'Mr. Hesham ElShaer'),(28,'CFO');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_type`
--

DROP TABLE IF EXISTS `room_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_type`
--

LOCK TABLES `room_type` WRITE;
/*!40000 ALTER TABLE `room_type` DISABLE KEYS */;
INSERT INTO `room_type` VALUES (1,'Test'),(2,'Test2 '),(3,'Test3'),(4,'Test4'),(5,'Test5'),(6,'Test6'),(7,'Test7'),(8,'Test8');
/*!40000 ALTER TABLE `room_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signature_res`
--

DROP TABLE IF EXISTS `signature_res`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signature_res` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  `forma_res_id` int(11) NOT NULL,
  `reject` int(11) NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signature_res`
--

LOCK TABLES `signature_res` WRITE;
/*!40000 ALTER TABLE `signature_res` DISABLE KEYS */;
INSERT INTO `signature_res` VALUES (28,0,1,4,7,0,'2016-02-23 16:36:58'),(27,0,16,3,7,0,'2016-02-23 16:36:58'),(26,0,6,2,7,0,'2016-02-23 16:36:58'),(25,0,27,1,7,0,'2016-02-23 16:36:58'),(36,0,16,4,9,0,'2016-02-24 07:43:57'),(35,0,6,3,9,0,'2016-02-24 07:43:57'),(34,0,30,2,9,0,'2016-02-24 07:43:57'),(33,0,27,1,9,0,'2016-02-24 07:43:57'),(37,0,27,1,10,0,'2016-02-24 08:27:41'),(38,0,30,2,10,0,'2016-02-24 08:27:41'),(39,0,6,3,10,0,'2016-02-24 08:27:41'),(40,0,16,4,10,0,'2016-02-24 08:27:41'),(41,145,27,1,11,1,'2016-02-24 10:34:51'),(42,0,6,2,11,0,'2016-02-24 10:34:51'),(43,0,16,3,11,0,'2016-02-24 10:34:51'),(44,2,1,4,11,0,'2016-02-24 10:34:51'),(45,0,27,1,12,0,'2016-02-24 11:48:54'),(46,0,30,2,12,0,'2016-02-24 11:48:54'),(47,0,6,3,12,0,'2016-02-24 11:48:54'),(48,0,16,4,12,0,'2016-02-24 11:48:54'),(49,0,16,4,13,0,'2016-02-24 13:47:02'),(50,0,6,3,13,0,'2016-02-24 13:47:02'),(51,0,30,2,13,0,'2016-02-24 13:47:02'),(52,0,27,1,13,0,'2016-02-24 13:47:02'),(53,0,11,5,13,0,'2016-02-24 13:47:02'),(54,145,27,1,14,0,'2016-02-24 13:51:02'),(55,0,6,2,14,0,'2016-02-24 13:51:02'),(56,0,16,3,14,0,'2016-02-24 13:51:02'),(57,0,1,4,14,0,'2016-02-24 13:51:02'),(58,0,27,1,15,0,'2016-02-24 14:05:10'),(59,0,30,2,15,0,'2016-02-24 14:05:10'),(60,0,2,5,16,0,'2016-02-24 14:09:43'),(61,0,16,4,16,0,'2016-02-24 14:09:43'),(62,0,3,3,16,0,'2016-02-24 14:09:43'),(63,0,30,2,16,0,'2016-02-24 14:09:43'),(64,0,27,1,16,0,'2016-02-24 14:09:43'),(65,0,1,4,17,0,'2016-02-25 12:13:08'),(66,0,16,3,17,0,'2016-02-25 12:13:08'),(67,25,6,2,17,0,'2016-02-25 12:13:08'),(68,145,27,1,17,0,'2016-02-25 12:13:08'),(69,144,30,3,18,0,'2016-03-01 14:11:10'),(70,145,27,2,18,0,'2016-03-01 14:11:10'),(71,146,28,1,18,0,'2016-03-01 14:11:10');
/*!40000 ALTER TABLE `signature_res` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signature_spo`
--

DROP TABLE IF EXISTS `signature_spo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signature_spo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  `forma_spo_id` int(11) NOT NULL,
  `reject` int(11) NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signature_spo`
--

LOCK TABLES `signature_spo` WRITE;
/*!40000 ALTER TABLE `signature_spo` DISABLE KEYS */;
INSERT INTO `signature_spo` VALUES (1,0,30,1,1,0,'2016-03-20 10:53:35'),(2,0,16,2,1,0,'2016-03-20 10:53:35'),(3,0,3,3,1,0,'2016-03-20 10:53:35'),(4,0,1,4,1,0,'2016-03-20 10:53:35'),(5,0,30,1,2,0,'2016-03-20 12:45:36'),(6,0,16,2,2,0,'2016-03-20 12:45:36'),(7,0,3,3,2,0,'2016-03-20 12:45:36'),(8,0,1,4,2,0,'2016-03-20 12:45:36'),(9,0,30,1,3,0,'2016-03-20 12:51:46'),(10,0,16,2,3,0,'2016-03-20 12:51:46'),(11,0,3,3,3,0,'2016-03-20 12:51:46'),(12,0,1,4,3,0,'2016-03-20 12:51:46'),(13,0,30,1,4,0,'2016-03-20 12:59:19'),(14,0,16,2,4,0,'2016-03-20 12:59:19'),(15,0,3,3,4,0,'2016-03-20 12:59:19'),(16,0,1,4,4,0,'2016-03-20 12:59:19'),(17,0,30,1,5,0,'2016-03-20 13:01:26'),(18,0,16,2,5,0,'2016-03-20 13:01:26'),(19,0,3,3,5,0,'2016-03-20 13:01:26'),(20,0,1,4,5,0,'2016-03-20 13:01:26'),(21,0,30,1,6,0,'2016-03-20 13:16:31'),(22,0,16,2,6,0,'2016-03-20 13:16:31'),(23,0,3,3,6,0,'2016-03-20 13:16:31'),(24,0,1,4,6,0,'2016-03-20 13:16:31'),(25,0,30,1,7,0,'2016-03-20 13:18:36'),(26,0,16,2,7,0,'2016-03-20 13:18:36'),(27,0,3,3,7,0,'2016-03-20 13:18:36'),(28,0,1,4,7,0,'2016-03-20 13:18:36'),(29,0,30,1,8,0,'2016-03-20 13:25:14'),(30,0,16,2,8,0,'2016-03-20 13:25:14'),(31,0,3,3,8,0,'2016-03-20 13:25:14'),(32,0,1,4,8,0,'2016-03-20 13:25:14'),(33,0,30,1,9,0,'2016-03-20 13:27:17'),(34,0,16,2,9,0,'2016-03-20 13:27:17'),(35,0,3,3,9,0,'2016-03-20 13:27:17'),(36,0,1,4,9,0,'2016-03-20 13:27:17');
/*!40000 ALTER TABLE `signature_spo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spo`
--

DROP TABLE IF EXISTS `spo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `season` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Travel_Date` longtext COLLATE utf8_unicode_ci NOT NULL,
  `arrival_date` longtext COLLATE utf8_unicode_ci NOT NULL,
  `Booking_Window` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `to` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spo`
--

LOCK TABLES `spo` WRITE;
/*!40000 ALTER TABLE `spo` DISABLE KEYS */;
INSERT INTO `spo` VALUES (1,'0000-00-00 00:00:00','Season','2016-02-01 2016-01-02','2016-01-01 - 2016-01-022016-01-01 - 2017-01-01','2016-01-01 -  2017-01-01','To',16,1),(2,'0000-00-00 00:00:00','Season','2017-01-01 2016-01-01','2016-02-01 - 2016-01-012017-01-01 - 2016-01-01','2016-01-01 -  2016-01-01','to',7,1),(3,'0000-00-00 00:00:00','Season','2017-01-01 2016-01-01','2016-02-01 - 2016-01-012017-01-01 - 2016-01-01','2016-01-01 -  2016-01-01','to',7,1),(4,'0000-00-00 00:00:00','Season','2017-01-01 2016-01-01','2016-02-01 - 2016-01-012017-01-01 - 2016-01-01 - ','2016-01-01 -  2016-01-01','to',7,1),(5,'0000-00-00 00:00:00','Season','2016-01-02 2016-01-01','2016-01-01 - 2017-01-012017-03-02 - 2016-01-01 - ','2017-01-01 -  2016-01-01','233',1,1),(6,'0000-00-00 00:00:00','Season','2016-01-02 2016-01-01','2016-01-01 - 2017-01-012017-03-02 - 2016-01-01 - 2016-01-01','2017-01-01 -  2016-01-01','233',1,1),(7,'0000-00-00 00:00:00','Season','2016-01-02 2016-01-01','2016-01-01 - 2017-01-012017-03-02 - 2016-01-01 - 2016-01-01','2017-01-01 -  2016-01-01','233',1,1),(8,'0000-00-00 00:00:00','Season','2016-01-02 | 2016-01-01','2016-01-01 | 2017-01-012017-03-02 | 2016-01-01 | 2016-01-01','2017-01-01 |  2016-01-01','233',1,1),(9,'0000-00-00 00:00:00','Season','2016-01-02 | 2016-01-01','2016-01-01 | 2017-01-012017-03-02 | 2016-01-01 | 2016-01-01','2017-01-01 |  2016-01-01','233',1,1);
/*!40000 ALTER TABLE `spo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spo_comments`
--

DROP TABLE IF EXISTS `spo_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spo_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spo_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `privilege` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spo_comments`
--

LOCK TABLES `spo_comments` WRITE;
/*!40000 ALTER TABLE `spo_comments` DISABLE KEYS */;
INSERT INTO `spo_comments` VALUES (1,1,1,'Notes ','2016-03-20 10:53:35',0),(2,2,1,'notes','2016-03-20 12:45:36',0),(3,3,1,'notes','2016-03-20 12:51:46',0),(4,4,1,'notes','2016-03-20 12:59:19',0),(5,5,1,'','2016-03-20 13:01:26',0),(6,6,1,'','2016-03-20 13:16:31',0),(7,7,1,'','2016-03-20 13:18:36',0),(8,8,1,'','2016-03-20 13:25:14',0),(9,9,1,'','2016-03-20 13:27:16',0);
/*!40000 ALTER TABLE `spo_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spo_items`
--

DROP TABLE IF EXISTS `spo_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spo_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spo_id` int(11) NOT NULL,
  `peroid_from` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `peroid_to` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MTD_OCC` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MTD_month` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Contracted_prices` int(11) NOT NULL,
  `spo` int(11) NOT NULL,
  `Discount_percentage` int(11) NOT NULL,
  `room_nights` int(11) NOT NULL,
  `Materialization_occ` int(11) NOT NULL,
  `Materialization_month` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Empty_seats` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Expected_occupancy` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `currency` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spo_items`
--

LOCK TABLES `spo_items` WRITE;
/*!40000 ALTER TABLE `spo_items` DISABLE KEYS */;
INSERT INTO `spo_items` VALUES (1,1,'2017-01-01','2016-01-01','2','2016-02',11,34,1,66,2,'2016-02','22','77','$'),(2,2,'2016-01-02','2016-01-01','12','2017-02',3,2,2,33,22,'2017-01','3','99','$'),(3,3,'2016-01-02','2016-01-01','12','2017-02',3,2,2,33,22,'2017-01','3','99','$'),(4,4,'2016-01-02','2016-01-01','12','2017-02',3,2,2,33,22,'2017-01','3','99','$'),(5,5,'2017-01-01','2016-01-01','2','2016-02',11,22,22,11,22,'2016-01','223','221','$'),(6,6,'2017-01-01','2016-01-01','2','2016-02',11,22,22,11,22,'2016-01','223','221','$'),(7,7,'2017-01-01','2016-01-01','2','2016-02',11,22,22,11,22,'2016-01','223','221','$'),(8,8,'2017-01-01','2016-01-01','2','2016-02',11,22,22,11,22,'2016-01','223','221','$'),(9,9,'2017-01-01','2016-01-01','2','2016-02',11,22,22,11,22,'2016-01','223','221','$');
/*!40000 ALTER TABLE `spo_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` int(24) DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `cv` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=800 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (3,'شركة المظلوم',26716143,NULL,NULL,0),(4,'شركة الخليج الناصرى',25903098,NULL,NULL,0),(5,'مجموعة شركات المصريين',25930168,NULL,NULL,0),(6,'شركة العز للسيراميك',33778857,NULL,NULL,0),(7,'مصطفى مصطفى السلاب',22750507,NULL,NULL,0),(8,'أشرف عبد العزيز المحجوب',35712565,NULL,NULL,0),(9,'شركة النيلين ',22580752,NULL,NULL,0),(10,'شركة جروهى',33048602,NULL,NULL,0),(11,'شركة فياميد للتجارة',25081930,NULL,NULL,0),(12,'أيديال أستاندر',24189068,NULL,NULL,0),(13,'شــركـــة كليــوبـاتــرا',37614000,NULL,NULL,0),(14,'شركة الفراعنة',22634829,NULL,NULL,0),(15,'هابي تريد',25926198,NULL,NULL,0),(16,'الشرقيـة لتجـارة السيراميك',693661119,NULL,NULL,0),(17,'شركة الشوربجى للتوكيلات التجاريـة',42139950,NULL,NULL,0),(18,'صموئيل ميلاد غالي',1223281372,NULL,NULL,0),(19,'شركة الشروق للتجهيزات الفندقية',1148022200,NULL,NULL,0),(20,'شركة المصدر للتجارة والتوريدات',1227623277,NULL,NULL,0),(21,'المتحدة لتجارة الصاج - أبوشبيكة',1001401548,NULL,NULL,0),(22,'السويدى للأدوات والكابلات القاهرة',25911340,NULL,NULL,0),(23,'السويدى للأدوات والكابلات شرم الشيخ',1002599381,NULL,NULL,0),(24,'الفادي للتوريدات الكهربائية',23900042,NULL,NULL,0),(25,'شركة السويدي انرجيا',24171395,NULL,NULL,0),(26,'إبراهيم سيد أحمد إبراهيم',1002993931,NULL,NULL,0),(27,'شركة الأنوار للتوريدات',23933416,NULL,NULL,0),(28,'الشركة المصرية السودانية',1006529574,NULL,NULL,0),(29,'المصرية للتويدات الكهربائية والكابلات',1226545421,NULL,NULL,0),(30,'بيت الهندسة',33043347,NULL,NULL,0),(31,'شركة ميجا اليكتريك ميشيل احد',35820231,NULL,NULL,0),(32,'ثرى برازر',22598925,NULL,NULL,0),(33,'مصنع موبل الشرق',24050870,NULL,NULL,0),(34,'شركة الرائدان',24050870,NULL,NULL,0),(35,'شركة مافيل',1222119138,NULL,NULL,0),(36,'شركة تبارك للأثاث',1113331837,NULL,NULL,0),(37,'المجموعة للتجارة والمقاولات',1006500905,NULL,NULL,0),(38,'شركة النصر',1225995255,NULL,NULL,0),(39,'المجموعة السويدية',1006589690,NULL,NULL,0),(40,'طارق عبد المالك',1002587177,NULL,NULL,0),(41,'محارم',1222217736,NULL,NULL,0),(42,'خالد أحمد محمد برسيم',1223976791,NULL,NULL,0),(43,'(ورشة المتوكل (جمال عبدالستار',1228751447,NULL,NULL,0),(44,'المختار',1065644483,NULL,NULL,0),(45,'(محمد عبدالغنى هلال (أرضيات ',1005444466,NULL,NULL,0),(46,'محمد رشاد',1005550543,NULL,NULL,0),(47,'مصنع خزفيات الفسطاط',1001581987,NULL,NULL,0),(48,'شركة الزعيمه',1222219698,NULL,NULL,0),(49,'مجدي عبد الحميد',1001581987,NULL,NULL,0),(50,'شركة باسكو',1223143688,NULL,NULL,0),(51,'محمد صلاح على',0,NULL,NULL,0),(52,'أحمد حنفى عبدالعزيز',0,NULL,NULL,0),(53,'هشام مصطفى',0,NULL,NULL,0),(54,'(جمال السيد محمد (الشهرة حمدى الحباك ',0,NULL,NULL,0),(55,'سعيد عبدالمنعم',0,NULL,NULL,0),(56,'(تيرا ( ألواح زلط + بلاطات + تكسيات حوائط ',0,NULL,NULL,0),(57,'(آل يوسف (موزيك ',0,NULL,NULL,0),(58,'السيد صادق ثابت',0,NULL,NULL,0),(59,'شركة رضوان للتجارة والصناعة',0,NULL,NULL,0),(60,'الورشة الفنية عصام حلمى',0,NULL,NULL,0),(61,'تكنوستيل',0,NULL,NULL,0),(62,'( جرين لاين ( قطع إستانلس ',0,NULL,NULL,0),(63,'مصيلحى',0,NULL,NULL,0),(64,'محمود جبريل',0,NULL,NULL,0),(65,'هانى مسعود',0,NULL,NULL,0),(66,'شركة يورى إيجبت م / أحمد عبدالوهاب',0,NULL,NULL,0),(67,'جبرائيل جميل',0,NULL,NULL,0),(68,'إبراهيم الشربينى',0,NULL,NULL,0),(69,'( أرك تاتش ( توريد أثاث ',0,NULL,NULL,0),(70,'شركة باسكو',1223143688,NULL,NULL,0),(71,'شركة ميتكو للهندسة والتجارة',1223233213,NULL,NULL,0),(72,'شركة أستيل كرافت',1001402559,NULL,NULL,0),(73,'EIT',1276511113,NULL,NULL,0),(74,'شركة ستار انترناشيونال',1067770059,NULL,NULL,0),(75,'شركة روتانا',1224118191,NULL,NULL,0),(76,'شركة الأمل الجديدة',1007444473,NULL,NULL,0),(77,'شركة صلاح أبوطرية',0,NULL,NULL,0),(78,'ستارز لتجهيزات المطابخ',1222954996,NULL,NULL,0),(79,'شركة الفيروز للتجارة والهندسة',1223175876,NULL,NULL,0),(80,'راتوماج',1001402559,NULL,NULL,0),(81,'نيو ستار',1005868413,NULL,NULL,0),(82,'مركز داري',1001745266,NULL,NULL,0),(83,'شركة علام',1007432412,NULL,NULL,0),(84,'المكتب العلمى',1222187647,NULL,NULL,0),(85,'المؤسسة المصرية للتوريدات العمومية',1066673353,NULL,NULL,0),(86,'المتحدة للبويات والكيماويات درايمكس',0,NULL,NULL,0),(87,'سيناء',1000086458,NULL,NULL,0),(88,'أبناء الشرقية',0,NULL,NULL,0),(89,'ســايــبــس',0,NULL,NULL,0),(90,'(جمـــال (القــــدس',0,NULL,NULL,0),(91,'مجدى',0,NULL,NULL,0),(92,'أشرف صادق',0,NULL,NULL,0),(93,'حسين داوود',0,NULL,NULL,0),(94,'أمين سليمان',0,NULL,NULL,0),(95,'توب لاين',0,NULL,NULL,0),(96,'أشرف محمود',0,NULL,NULL,0),(97,'مصطفى محمد إسماعيل',0,NULL,NULL,0),(98,'أحمد أحمد محمد زيان',0,NULL,NULL,0),(99,'درويش للدهانات',0,NULL,NULL,0),(100,'بيت الخبرة للهندسة',1223272717,NULL,NULL,0),(101,'شركة الدهيبى',1068829148,NULL,NULL,0),(102,'شركة كوميت للأعمال الهندسية',1001237172,NULL,NULL,0),(103,'م/ أحمد محمد داوود',25897767,NULL,NULL,0),(104,'شركة أوراسكوم',1288626276,NULL,NULL,0),(105,'الشركة المصرية للأعمال الكهربائية',1001691186,NULL,NULL,0),(106,'شركة إيماج للتوكيلات التجارية',1223106053,NULL,NULL,0),(107,'شركة الشرق الهندسة والتوكيلات',225914279,NULL,NULL,0),(108,'شركة الوايلر فريد',1227883964,NULL,NULL,0),(109,'شركة سيباى',1001642256,NULL,NULL,0),(110,'شركة إنترناشونال',0,NULL,NULL,0),(111,'مركز التقوي',1228080082,NULL,NULL,0),(112,'شركة ايجات للتنمية الصناعية ايدكو',233047030,NULL,NULL,0),(113,'شركة الكتروم',0,NULL,NULL,0),(114,'شركة طيبة للصناعات الهندسية',224022844,NULL,NULL,0),(115,'شركة يورك شيلار',1227483853,NULL,NULL,0),(116,'شركة تران',226241328,NULL,NULL,0),(117,'كايرو كول',0,NULL,NULL,0),(118,'أبو زكرى',0,NULL,NULL,0),(119,'يونيون إير',0,NULL,NULL,0),(120,'شركة شمس',0,NULL,NULL,0),(121,'شركة كرياتيف للتوريدات',1001744863,NULL,NULL,0),(122,'رمسيس يوسف عطية',1223156698,NULL,NULL,0),(123,'رويال تريد',0,NULL,NULL,0),(124,'مستر بد',0,NULL,NULL,0),(125,'شركة كمفورت إيجيبت',1223967526,NULL,NULL,0),(126,'شركة رايتكس',0,NULL,NULL,0),(127,'شركة حداد للتوريدات',1223912344,NULL,NULL,0),(128,'بيراميدز للتنجيد والديكور',1005108330,NULL,NULL,0),(129,'ساتورى',1229715000,NULL,NULL,0),(130,'تكسمار',1223940396,NULL,NULL,0),(131,'شركة أيتوف',0,NULL,NULL,0),(132,'شركة السعد',0,NULL,NULL,0),(133,'رجب الأمير',1000661647,NULL,NULL,0),(134,'شركة أبو العطا',237611768,NULL,NULL,0),(135,'نايل تريد لصناعة المفروشات',0,NULL,NULL,0),(136,'المجد للتسويق المفروشات وتجهيزات الفنادق',0,NULL,NULL,0),(137,'تاكى',0,NULL,NULL,0),(138,'يانسن',0,NULL,NULL,0),(139,'ريتش هووم',0,NULL,NULL,0),(140,'أون لاين',0,NULL,NULL,0),(141,'الشركة الهندسية بوليجون',1000997823,NULL,NULL,0),(142,'شركة حلول للبرمجيات المتكاملة',0,NULL,NULL,0),(143,'شركة الحسابات المتقدمة أكت',1001009086,NULL,NULL,0),(144,'شركة ديجيتال بارتنرز',1006933344,NULL,NULL,0),(145,'شركة يونايتد سيستم',1001100039,NULL,NULL,0),(146,'شركة فاليوسيس لتكنولوجيا المعلومات',0,NULL,NULL,0),(147,'الشركة المصرية للحاسبات و التكنولوجيا',1000417600,NULL,NULL,0),(148,'شركة الأنظمة الإلكترونية والتكنولجية الحديثة',1001294465,NULL,NULL,0),(149,'شركة يونايتد سيستمز',1091068640,NULL,NULL,0),(150,'الشركة المصرية لتجارة البورسلين',1227436431,NULL,NULL,0),(151,'المركز المصرى التركى',1001665308,NULL,NULL,0),(152,'شركة إنفينتى',1000005019,NULL,NULL,0),(153,'شركة الجزيرى للتجارة والتوزيع',233023352,NULL,NULL,0),(154,'شركة هيلكوميتلز',1001476696,NULL,NULL,0),(155,'شركة ألفا إنترناشونال',1001728476,NULL,NULL,0),(156,'المصرية الدولية لتجارة أدوات المائدة',1222106316,NULL,NULL,0),(157,'ميتالار',1147477797,NULL,NULL,0),(158,'شركة المصرية العالمية',0,NULL,NULL,0),(159,'العالمية للبورسلين',1006004608,NULL,NULL,0),(160,'شركة كوميت جروب',1222167794,NULL,NULL,0),(161,'شركة كونتريد فوود سرفيس سنتر',1223939965,NULL,NULL,0),(162,'شركة القصواء',1062000060,NULL,NULL,0),(163,'شركة تكنولوجيا المواد العازلة',0,NULL,NULL,0),(164,'شركة بيتا للهندسة والتجارة',1227370310,NULL,NULL,0),(165,'شركة زمزم',0,NULL,NULL,0),(166,'شركة المدينة المنورة',1282850183,NULL,NULL,0),(167,'شركة قباء للتجارة والإستيراد',222629299,NULL,NULL,0),(168,'الإسلامية لتجارة العوازل',1221153258,NULL,NULL,0),(169,'مصر فوم',0,NULL,NULL,0),(170,'الواحة للتوريدات',0,NULL,NULL,0),(171,'العربية لصناعة العزل',0,NULL,NULL,0),(172,'كيما فوم',0,NULL,NULL,0),(173,'شركة كايرو فوم',0,NULL,NULL,0),(174,'شركة دلتا فوم',0,NULL,NULL,0),(175,'مؤسسة المغازية',1003654285,NULL,NULL,0),(176,'عبدالستار صالح',0,NULL,NULL,0),(177,'(شعبان زكى (كمبانى ',0,NULL,NULL,0),(178,'الشركة العالمية للصوف الصخرى روكال',0,NULL,NULL,0),(179,'شركة م/ عدلى تادرس',0,NULL,NULL,0),(180,'شركة الفيروز للتجارة والهندسة',1223175876,NULL,NULL,0),(181,'شركة وورلد تكنيك',1222176864,NULL,NULL,0),(182,'الشركة الهندسية لمعدات المغاسل',0,NULL,NULL,0),(183,'واتكو',25762898,NULL,NULL,0),(184,'حمادة الدسوقى',0,NULL,NULL,0),(185,'مؤسسة الفاروق للمقاولات',1005501053,NULL,NULL,0),(186,'شركة وادي دجلة م/ خالد الشواربى',0,NULL,NULL,0),(187,'محمود السعداوى',0,NULL,NULL,0),(188,'مارين سوليوشنز',0,NULL,NULL,0),(189,'شركة خاطر إنترناشونال',0,NULL,NULL,0),(190,'تريدكو الصياد',0,NULL,NULL,0),(191,'شركة مانتراك',0,NULL,NULL,0),(192,'شركة أتوس',0,NULL,NULL,0),(193,'MCV شركة مرسيدس',0,NULL,NULL,0),(194,'الشركة العالمية للمولدات',0,NULL,NULL,0),(195,'الشركة المصرية العالمية للسيارات',0,NULL,NULL,0),(196,'شركة قونسقرة',0,NULL,NULL,0),(197,'شركة ترينجل',0,NULL,NULL,0),(198,'باور هاوس',0,NULL,NULL,0),(199,'شركة سيجما',0,NULL,NULL,0),(200,'المصرية لمهمات المصانع',0,NULL,NULL,0),(201,'جلوبال تريدارز',1222236152,NULL,NULL,0),(202,'مارموكس مصر',1001745266,NULL,NULL,0),(203,'شركة أوميجا للهندسة والتجارة',1005006518,NULL,NULL,0),(204,'شركة الفردان',0,NULL,NULL,0),(205,'سبارك كونكورد',0,NULL,NULL,0),(206,'توكل',0,NULL,NULL,0),(207,'مركز أجياد العالمي',0,NULL,NULL,0),(208,'مهني الأسيوطي',0,NULL,NULL,0),(209,'الفريد مهني الأسيوطي',0,NULL,NULL,0),(210,'lasdas2',0,NULL,NULL,0),(211,'(روكسى للهندسة (محمد خلاف',0,NULL,NULL,0),(212,'(ماستر للهندسة والمقاولات (م/ ناصر فرج ',1222236152,NULL,NULL,0),(213,'محمد صبرى',1001745266,NULL,NULL,0),(214,'(م / محسن أنيس (أكوا مارين',1005006518,NULL,NULL,0),(215,'شركة أوجيدا',1002776042,NULL,NULL,0),(216,'شركة أوشيدا',0,NULL,NULL,0),(217,'الشركة العربية للنظم',1222956689,NULL,NULL,0),(218,'جولدن جروب',1111130800,NULL,NULL,0),(219,'شركة جراتا ماس',0,NULL,NULL,0),(220,'الإسلامية للتجارة',0,NULL,NULL,0),(221,'أنتركلين للتوكيلات العالمية',1065015085,NULL,NULL,0),(222,'شركة البسيوني وشركاه',233476682,NULL,NULL,0),(223,'شركة نيوماتك سيناء',0,NULL,NULL,0),(224,'شركة التجارية الحديثة للماكينات',0,NULL,NULL,0),(225,'شركة جى أند أتش للتجارة',0,NULL,NULL,0),(226,'مونديال ',653460041,NULL,NULL,0),(227,'أيماك بولز',653460040,NULL,NULL,0),(228,'وورلد تكنيك',653460040,NULL,NULL,0),(229,'اسبادا',2147483647,NULL,NULL,0),(230,'Ahmed Kamal',0,NULL,NULL,0),(231,'شركة طنطا موتورز',1006625503,NULL,NULL,0),(232,'شركة تام للهندسة والتجارة',1001093986,NULL,NULL,0),(233,'نوفوفينت',0,NULL,NULL,0),(234,'ايروفينتس',1002226817,NULL,NULL,0),(235,'ايروتك',225789576,NULL,NULL,0),(236,'شركة يونيون (هود) ',0,NULL,NULL,0),(237,'صناعات همام',238331930,NULL,NULL,0),(238,'الرضا لتجارة المحركات',0,NULL,NULL,0),(239,'Fine Company ',0,NULL,NULL,0),(240,'El Pharoniya Company',124567,NULL,NULL,0),(241,'شركة فاينل تاتش',0,NULL,NULL,0),(242,'شركة كوم تك',1223913192,NULL,NULL,0),(243,'الحرية الحديثة',1004888999,NULL,NULL,0),(244,'راديو شاك',0,NULL,NULL,0),(245,'العربى للتجارة والصناعة',0,NULL,NULL,0),(246,'شركة فرحة',0,NULL,NULL,0),(247,'شركة دوكيوكوم',1000109638,NULL,NULL,0),(248,'شركة زيروكس',653441842,NULL,NULL,0),(249,'شركة ال جي للإلكترونيات',0,NULL,NULL,0),(250,'شركة النيل الهندسية ( شمس)',0,NULL,NULL,0),(251,'الاسكا',1223966506,NULL,NULL,0),(252,'نور القرآن',1144445833,NULL,NULL,0),(253,'شركة هاى باور للصناعة والتجارة',0,NULL,NULL,0),(254,'شركة فريش',0,NULL,NULL,0),(255,'شركة بنها للصناعات الالكترونية',0,NULL,NULL,0),(256,'باناسونيك',0,NULL,NULL,0),(257,'فيليبس',0,NULL,NULL,0),(258,'مصر للهندسة والعدد ( ميكار)',0,NULL,NULL,0),(259,'شركة توفيق محمد',1223735844,NULL,NULL,0),(260,'شركة أوتو إيجبت للتجارة',0,NULL,NULL,0),(261,'تويوتا إيجبت',0,NULL,NULL,0),(262,'مودرن موتورز',0,NULL,NULL,0),(263,'شركة طيبة للتوريدات',0,NULL,NULL,0),(264,'باسيكو للتجارة والتوزيع',1001472166,NULL,NULL,0),(265,'شركة أوتاك',1223103577,NULL,NULL,0),(266,'شركة توب تريد',224194548,NULL,NULL,0),(267,'إكسبو إيجيبت',1223822839,NULL,NULL,0),(268,'شركة بلونايل إنتر ناشيونال',0,NULL,NULL,0),(269,'إيكو تريد',0,NULL,NULL,0),(270,'مؤسسة جراند',0,NULL,NULL,0),(271,'الشروق للتجهيزات الفندقية',0,NULL,NULL,0),(272,'شركة سيناء للتجهيزات الفندقية',0,NULL,NULL,0),(273,'ميتالنيو',0,NULL,NULL,0),(274,'شركة الفسطاط',0,NULL,NULL,0),(275,'شركة توب تريد',224194548,NULL,NULL,0),(276,'شركة AFS',1222123489,NULL,NULL,0),(277,'العالمية',0,NULL,NULL,0),(278,'شركة فرانك',1068803323,NULL,NULL,0),(279,'شركة الكرنك للإعلان',1222110720,NULL,NULL,0),(280,'عاطف صابر مالتى ميديا',0,NULL,NULL,0),(281,'ليكويد',1000002684,NULL,NULL,0),(282,'الماسة',0,NULL,NULL,0),(283,'شركة أرتستيكو',1223378705,NULL,NULL,0),(284,'شركة مدرسة النيل',0,NULL,NULL,0),(285,'شركة النساجون الشرقيون',1111044448,NULL,NULL,0),(286,'شركة ماك',1003435914,NULL,NULL,0),(287,'شركة موكيت سنتر',1227654165,NULL,NULL,0),(288,'الشركة المصرية اليونانية',0,NULL,NULL,0),(289,'سورناجا مصر',0,NULL,NULL,0),(290,'شروق للمقاولات ومواد البناء',1001115076,NULL,NULL,0),(291,'ممدوح الجمال',1229327257,NULL,NULL,0),(292,'الشركة المصرية الإيطالية',0,NULL,NULL,0),(293,'جلوبال قرميد',0,NULL,NULL,0),(294,'شركة إستاندر الصناعية نوفا',0,NULL,NULL,0),(295,'شركة طاقة مصر',229293990,NULL,NULL,0),(296,'GREEN',0,NULL,NULL,0),(297,'الطاقة الشمسية',1002537376,NULL,NULL,0),(298,'رواد مصر للتجارة والتوكيلات',0,NULL,NULL,0),(299,'شركة إيجبت سوفت',0,NULL,NULL,0),(300,'الأهرام للكوالين',0,NULL,NULL,0),(301,'المكتب العربي للإتصالات',0,NULL,NULL,0),(302,'شركة هوتيك',0,NULL,NULL,0),(303,'الشركة الهندسية ثورن',1002864426,NULL,NULL,0),(304,'شركة سيباي',1001642256,NULL,NULL,0),(305,'مؤسسة الفادي',1223189008,NULL,NULL,0),(306,'شركة بافاريا مصر',0,NULL,NULL,0),(307,'شركة سما',0,NULL,NULL,0),(308,'الدولية للتجارة',0,NULL,NULL,0),(309,'الكوثر',1003778883,NULL,NULL,0),(310,'مصانع نافع',0,NULL,NULL,0),(311,'محمد علي البهتيمي',0,NULL,NULL,0),(312,'سعيد أحمد محمد',0,NULL,NULL,0),(313,'تاكي م/ مينا رمزى',0,NULL,NULL,0),(314,'أولاد أبو إسماعيل',0,NULL,NULL,0),(315,'مؤسسة البركة',0,NULL,NULL,0),(316,'دياب لتجارة الأدوات الكهربائية',0,NULL,NULL,0),(317,'شركة ثرى برازر',0,NULL,NULL,0),(318,'شركة تيفنى',0,NULL,NULL,0),(319,'مجموعة هارمن للتجارة',0,NULL,NULL,0),(320,'المصرية للأعمال الكهربائية',0,NULL,NULL,0),(321,'شركة الترا لايت',0,NULL,NULL,0),(322,'العربية الدولية',0,NULL,NULL,0),(323,'الشركة الإيطالية',0,NULL,NULL,0),(324,'الشركة المتحدة للتسجيلات',1222311714,NULL,NULL,0),(325,'ألفا أوديو',0,NULL,NULL,0),(326,'ناندوز',0,NULL,NULL,0),(327,'جالا ستار',1223256939,NULL,NULL,0),(328,'شركة باسكو اندستريال',0,NULL,NULL,0),(329,'شركة أوشن آند ريفر',0,NULL,NULL,0),(330,'شركة باسكو',1225519559,NULL,NULL,0),(331,'شركة الصباح',1000729489,NULL,NULL,0),(332,'شركة الجارحي',1222758109,NULL,NULL,0),(333,'شركة ترسانة الجيزة',0,NULL,NULL,0),(334,'مركز الاسكندرية البحري والتجاري',0,NULL,NULL,0),(335,'المجموعة للتجارة والمقاولات',1006500905,NULL,NULL,0),(336,'المجموعة السويدية',1006589690,NULL,NULL,0),(337,'شركة النصر تريدنج',0,NULL,NULL,0),(338,'سنتر للتجارة والتوكيلات',1223472735,NULL,NULL,0),(339,'شركة هاوزن',0,NULL,NULL,0),(340,'شركة أغاخان للمصاعد',1001406030,NULL,NULL,0),(341,'شركة متسوبيشى',0,NULL,NULL,0),(342,'المصرية الألمانية',0,NULL,NULL,0),(343,'شركة شندلر',0,NULL,NULL,0),(344,'شركة أوتس',0,NULL,NULL,0),(345,'شركة المنصور التجارية',1223489204,NULL,NULL,0),(346,'مؤسسة القدس',225916449,NULL,NULL,0),(347,'المركز التجارى الفنى الدولى',0,NULL,NULL,0),(348,'مركز القاهرة للعدد والأدوات',227872001,NULL,NULL,0),(349,'شركة رشيد للأدوات الصناعية',225913920,NULL,NULL,0),(350,'شركة النجار',0,NULL,NULL,0),(351,'العربى',0,NULL,NULL,0),(352,'هنيمكس',1003983112,NULL,NULL,0),(353,'فرج سمعان',0,NULL,NULL,0),(354,'مصنع النهضة',0,NULL,NULL,0),(355,'الشروق للتجهيزات الفندقية',0,NULL,NULL,0),(356,'الأمل للمواسير البلاستيك',0,NULL,NULL,0),(357,'مصنع مصطفى محمود للبلاستيك',0,NULL,NULL,0),(358,'سبارك كونكورد',0,NULL,NULL,0),(359,'مصر الحجاز',0,NULL,NULL,0),(360,'شركة وين دورز',1001451821,NULL,NULL,0),(361,'توب ميتال ( محمـــد القبــــرصلــى )',0,NULL,NULL,0),(362,'شركة أماكو',1004911111,NULL,NULL,0),(363,'البارود جلاس ( زجاج فقط )',0,NULL,NULL,0),(364,'ألوتاك-الشركة المصرية الألمانية',0,NULL,NULL,0),(365,'دكتور جريش',1112746888,NULL,NULL,0),(366,'إبراهيم موسى',1223438108,NULL,NULL,0),(367,'طارق بكر (زجاج فقط)',0,NULL,NULL,0),(368,'لمسات فيوتك',1001542316,NULL,NULL,0),(369,'شركة ليب مصر',0,NULL,NULL,0),(370,'شركة فيوتك',0,NULL,NULL,0),(371,'مشاتل القناطر',1003332246,NULL,NULL,0),(372,'مشاتل البستان',0,NULL,NULL,0),(373,'جرين للزراعة الحديثة',0,NULL,NULL,0),(374,'مشاتل لؤلؤة النيل',0,NULL,NULL,0),(375,'شركة حمزة الزراعية',0,NULL,NULL,0),(376,'شركة الحسيني للتنمية الزراعية',0,NULL,NULL,0),(377,'شركة كنزى',0,NULL,NULL,0),(378,'مزرعة الأخوة لإنتاج المحاصيل البستانية',0,NULL,NULL,0),(379,'فوتو بلوك',1001237700,NULL,NULL,0),(380,'جاليري سيزار',0,NULL,NULL,0),(381,'ناجوري هاوس',0,NULL,NULL,0),(382,'زهور علام',0,NULL,NULL,0),(383,'شركة كلر',0,NULL,NULL,0),(384,'ارتستيكو',1223378705,NULL,NULL,0),(385,'جولدن ميرو',0,NULL,NULL,0),(386,'سام تريد',0,NULL,NULL,0),(387,'صوار',0,NULL,NULL,0),(388,'العربية',1001440086,NULL,NULL,0),(389,'الشركة المتحدة للتجارة والتوريدات',1223100595,NULL,NULL,0),(390,'محمود عبدالحميد عبدالله',0,NULL,NULL,0),(391,'دغش',0,NULL,NULL,0),(392,'أيمن شفيق',1007231157,NULL,NULL,0),(393,'شركة ماركو',1226161316,NULL,NULL,0),(394,'حمدى شحاته الزامك(شركة عبر الامارات)',0,NULL,NULL,0),(395,'NAAلأعمـــال الديكــــور',0,NULL,NULL,0),(396,'أسامة وحيـــد للديكـــــور',0,NULL,NULL,0),(397,'وائل',0,NULL,NULL,0),(398,'سامى صالح أمين',0,NULL,NULL,0),(399,'مونديال بوولز',1004300111,NULL,NULL,0),(400,'شركة منتجع الجنة',0,NULL,NULL,0),(401,'أشــرف محمــد (النورين)',0,NULL,NULL,0),(402,'شـركـة تـوب سيـرفيــس',0,NULL,NULL,0),(403,'المكتب الفني الهندسي للمقاولات ( تويك)',0,NULL,NULL,0),(404,'سعيــد السعيـــد (شــركة تــام)',0,NULL,NULL,0),(405,'الشركة المصرية',1000997823,NULL,NULL,0),(406,'الرائد جيت ماستر',1221536776,NULL,NULL,0),(407,'شركة واتكو',0,NULL,NULL,0),(408,'I .T.I',0,NULL,NULL,0),(409,'الشركة الدولية',0,NULL,NULL,0),(410,'عبدالسلام أحمد',1223137802,NULL,NULL,0),(411,'الرضوانية',0,NULL,NULL,0),(412,'شركة إيتوس',2147483647,NULL,NULL,0),(413,'شركة إيتوس',2147483647,NULL,NULL,0),(414,'فتحى إبراهيـم سيـدهــم',0,NULL,NULL,0),(415,'أحمد شوقى عبدربه',1001114638,NULL,NULL,0),(416,'فرانس ميتال ( أبواب مضادة للحريق )',0,NULL,NULL,0),(417,'الفسطاط جمال ( جمال عبدربه )',0,NULL,NULL,0),(418,'النهر ( يحيى )',0,NULL,NULL,0),(419,'شركة ماريات سكوت',0,NULL,NULL,0),(420,'شركــة القـــدس',0,NULL,NULL,0),(421,'الشركة الفنية للأعمال الهندسية',0,NULL,NULL,0),(422,'الزعبلاوي',0,NULL,NULL,0),(423,'رأفت شعبان عويس',0,NULL,NULL,0),(424,'توشكى',1004905018,NULL,NULL,0),(425,'شــركــة الأنـدلـس',0,NULL,NULL,0),(426,'شركة بلادى',0,NULL,NULL,0),(427,'أحمد عبد الصادق',0,NULL,NULL,0),(428,'وليد',0,NULL,NULL,0),(429,'محمد فؤاد حسن',0,NULL,NULL,0),(430,'حمدى بركات',0,NULL,NULL,0),(431,'شركة الشرق للهندســة والتوكيــلات',225914279,NULL,NULL,0),(432,'مام',33368710,NULL,NULL,0),(433,'سنكرو',0,NULL,NULL,0),(434,'الديب',0,NULL,NULL,0),(435,'سيجا - أم',0,NULL,NULL,0),(436,'أحمد (شركة الذهبية)',15351705,NULL,NULL,0),(437,'شركة abb',26251365,NULL,NULL,0),(438,'شركة جيلا',0,NULL,NULL,0),(439,'اليكتريك جروب',0,NULL,NULL,0),(440,'امكو',33443245,NULL,NULL,0),(441,'شركة مانتراك',23039648,NULL,NULL,0),(442,'ميج ( أحمد مجاهد )',0,NULL,NULL,0),(443,'شركة لايت تكنولوجي',1007495115,NULL,NULL,0),(444,'الحرية الحديثة',1004888999,NULL,NULL,0),(445,'شركة ترونيكس',22670992,NULL,NULL,0),(446,'شركة mcs لأنظمة الاتصالات الحديثة (سنترال نورتن)',0,NULL,NULL,0),(447,'شركة باناسونيك',22033000,NULL,NULL,0),(448,'تكنوكريت',1119005426,NULL,NULL,0),(449,'يونى كريت',0,NULL,NULL,0),(450,'الصوفى للبلاط الآلى',1090222618,NULL,NULL,0),(451,'شروق للمقاولات ومواد البناء',26906516,NULL,NULL,0),(452,'ربـيــــع أحـمـــد',0,NULL,NULL,0),(453,'ســرحـــان',0,NULL,NULL,0),(454,'عبــدالحفيــظ (البحــر الاحمــر)',0,NULL,NULL,0),(455,'إبراهيــم (الصـفـــا)',0,NULL,NULL,0),(456,'الربـــاط لمــواد البنـــاء',0,NULL,NULL,0),(457,'الزعتــرى',0,NULL,NULL,0),(458,'هسكــا للبنــاء',0,NULL,NULL,0),(459,'أحمد المليجى',0,NULL,NULL,0),(460,'شركة فاليو تريد',1222576310,NULL,NULL,0),(461,'المصرية السويدية',38311768,NULL,NULL,0),(462,'الرحاب م/ وائل البدري',0,NULL,NULL,0),(463,'شركة أورينتال',0,NULL,NULL,0),(464,'ميكولاند للمستلزمات الزراعية الحديثة',22687836,NULL,NULL,0),(465,'المظلوم',0,NULL,NULL,0),(466,'تراست',26216282,NULL,NULL,0),(467,'أيمن رشاد',0,NULL,NULL,0),(468,'شركة اسكندرية',0,NULL,NULL,0),(469,'حديد عز',0,NULL,NULL,0),(470,'حديد بشاى',2603964,NULL,NULL,0),(471,'العسكرى',5885847,NULL,NULL,0),(472,'ممدوح إستيل',0,NULL,NULL,0),(473,'الحاجة منى',105847795,NULL,NULL,0),(474,'سيد فراج',0,NULL,NULL,0),(475,'الشركة المتحدة',0,NULL,NULL,0),(476,'سيد حنفى',0,NULL,NULL,0),(477,'شركة Technogym',0,NULL,NULL,0),(478,'العريبة مصطفى عطية',1001440086,NULL,NULL,0),(479,'المتحدة  سراج',1223100595,NULL,NULL,0),(480,'شركة Space',0,NULL,NULL,0),(481,'Egyption American',0,NULL,NULL,0),(482,'weider',33028149,NULL,NULL,0),(483,'Artoc Sports',25082226,NULL,NULL,0),(484,'Fitness pro',33054260,NULL,NULL,0),(485,'أبوالمعاطى',23914028,NULL,NULL,0),(486,'شركة سبورت ماستر',35833867,NULL,NULL,0),(487,'مركز الرياضة',23939181,NULL,NULL,0),(488,'مرزوق',23939181,NULL,NULL,0),(489,'النسر الذهبى',1004023941,NULL,NULL,0),(490,'الحاج مجدى التونى',0,NULL,NULL,0),(491,'شركة العتال',0,NULL,NULL,0),(492,'شركة الغرباوي',0,NULL,NULL,0),(493,'الإسناوى - حسن العريشى',1001246215,NULL,NULL,0),(494,'المحمدية',101479655,NULL,NULL,0),(495,'الظافر',0,NULL,NULL,0),(496,'أبناء الصعيد',0,NULL,NULL,0),(497,'أبناء جاد',0,NULL,NULL,0),(498,'شركة بايونير إيجبت',4145731,NULL,NULL,0),(499,'شركة متجر',1119066800,NULL,NULL,0),(500,'مركز إى دى سى لتطوير المعدات',26385215,NULL,NULL,0),(501,'محمد فوزى بدوى',0,NULL,NULL,0),(502,'محمد عبد الباقى الطيب',0,NULL,NULL,0),(503,'السيد صالح السيد صالح',0,NULL,NULL,0),(504,'ريمون غندور',0,NULL,NULL,0),(505,'على محروس على',0,NULL,NULL,0),(506,'عبد الرازق عبد المعطى عبد الرازق',0,NULL,NULL,0),(507,'أحمد السيد عبد المطلب',0,NULL,NULL,0),(508,'شركة سبأ',0,NULL,NULL,0),(509,'قاسم أبو الوفا',0,NULL,NULL,0),(510,'محمد عبد الجواد إبراهيم',0,NULL,NULL,0),(511,'شركة أبو جميعة للمقاولات (فكرى أبو جميعة)',0,NULL,NULL,0),(512,'م / محمد عاطف',0,NULL,NULL,0),(513,'البنائون',0,NULL,NULL,0),(514,'شركة الحسن للمقاولات',0,NULL,NULL,0),(515,'محمد العزب',0,NULL,NULL,0),(516,'أمير (من الباطن جرافيا)',0,NULL,NULL,0),(517,'جرافيا',0,NULL,NULL,0),(518,'م / حسن',0,NULL,NULL,0),(519,'شركة كونتشتال',0,NULL,NULL,0),(520,'يوسف إبراهيم',0,NULL,NULL,0),(521,'جمال حسنى صديق',0,NULL,NULL,0),(522,'شعبان شحاتة طلبة',0,NULL,NULL,0),(523,'على محمد ضيف اللة',0,NULL,NULL,0),(524,'عبد الدايم أحمد',0,NULL,NULL,0),(525,'أحمد جمعة',0,NULL,NULL,0),(526,'منصور عبدة حامد (الشهرة حمدى)',0,NULL,NULL,0),(527,'حامد الوكيل',0,NULL,NULL,0),(528,'أحمد سليمان حمدان',0,NULL,NULL,0),(529,'إبراهيم سليمان حمدان',0,NULL,NULL,0),(530,'أحمد حسين سالم',0,NULL,NULL,0),(531,'هانى يحى محمد عبدة',0,NULL,NULL,0),(532,'حامد سليمان أحمد عبداللة',0,NULL,NULL,0),(533,'أبو المكارم شحاتة نخلة (الشهرة كرم)',0,NULL,NULL,0),(534,'صلاح سيد أحمد (الشهرة أبو رحاب)',0,NULL,NULL,0),(535,'أبو المكارم شحاتة نخلة (الشهرة كرم)',0,NULL,NULL,0),(536,'عزت نوفل',0,NULL,NULL,0),(537,'كيماويات البناء الحديث',33824347,NULL,NULL,0),(538,'سيكا',37618466,NULL,NULL,0),(539,'الشركة العالمية لمواد البناء',22398554,NULL,NULL,0),(540,'شركة يسمو مصر',24535678,NULL,NULL,0),(541,'دلما تريد',37612725,NULL,NULL,0),(542,'شركة جولدن جروب',33828649,NULL,NULL,0),(543,'سيراميك بورتو',0,NULL,NULL,0),(544,'سيراميك المناهري',0,NULL,NULL,0),(545,'سيراميك أبو كبشه',0,NULL,NULL,0),(546,'سيراميك كايرو',0,NULL,NULL,0),(547,'كرنفال رويال للسيراميك',0,NULL,NULL,0),(548,'شركة الشوربجي بالغردقه',0,NULL,NULL,0),(549,'شركة البركه',0,NULL,NULL,0),(550,'شركة السعد',0,NULL,NULL,0),(551,'شركة السعد',0,NULL,NULL,0),(552,'شركة دهب',0,NULL,NULL,0),(553,'شركة أيمن طه',0,NULL,NULL,0),(554,'شركة الحمد',0,NULL,NULL,0),(555,'شركة أحمد موسي',0,NULL,NULL,0),(556,'إبراهيم السعداوي',0,NULL,NULL,0),(557,'شركة الإخلاص',0,NULL,NULL,0),(558,'الشركة الدولية للأخشاب',0,NULL,NULL,0),(559,'النور',0,NULL,NULL,0),(560,'المنصورة',0,NULL,NULL,0),(561,'الرحاب',0,NULL,NULL,0),(562,'الحمد',0,NULL,NULL,0),(563,'شركة الراعي الصالح',0,NULL,NULL,0),(564,'شركة التوحيد (عواد)',0,NULL,NULL,0),(565,'الإيطالية',0,NULL,NULL,0),(566,'أشرف عطيه',0,NULL,NULL,0),(567,'السويسريه   N. A . R',0,NULL,NULL,0),(568,'المحمدي للمقاولات',0,NULL,NULL,0),(569,'السوري',0,NULL,NULL,0),(570,'الجوهرة',0,NULL,NULL,0),(571,'الحسين',0,NULL,NULL,0),(572,'العدوي',0,NULL,NULL,0),(573,'وطني إستيل',0,NULL,NULL,0),(574,'شركة العامة استانلس',0,NULL,NULL,0),(575,'ألفاتك',0,NULL,NULL,0),(576,'شركة الجابري',0,NULL,NULL,0),(577,'الشركة الفنية',0,NULL,NULL,0),(578,'أولاد محروس',0,NULL,NULL,0),(579,'المتوكل',0,NULL,NULL,0),(580,'الحمد',0,NULL,NULL,0),(581,'السبكي',0,NULL,NULL,0),(582,'قرني',0,NULL,NULL,0),(583,'مركز الينا للدهانات  وكيل يوتن',0,NULL,NULL,0),(584,'شركة التمساح',0,NULL,NULL,0),(585,'شركة التمساح',0,NULL,NULL,0),(586,'شركة سيف',0,NULL,NULL,0),(587,'شركة دار العماره',0,NULL,NULL,0),(588,'شركة الجارحي',0,NULL,NULL,0),(589,'الولاء',0,NULL,NULL,0),(590,'جنرال',0,NULL,NULL,0),(591,'المتحده',0,NULL,NULL,0),(592,'الهدي (احمد فرحات )',0,NULL,NULL,0),(593,'آل عامر',0,NULL,NULL,0),(594,'الأوروبيه',0,NULL,NULL,0),(595,'إليكترام',0,NULL,NULL,0),(596,'نيو كونكورد',0,NULL,NULL,0),(597,'العسكري',0,NULL,NULL,0),(598,'وان تاتش',0,NULL,NULL,0),(599,'كيمو 2001',0,NULL,NULL,0),(600,'الإتحاد الإستثماري',0,NULL,NULL,0),(601,'كوميت جروب',0,NULL,NULL,0),(602,'كريستال إنترناشونال',0,NULL,NULL,0),(603,'البنا جروب',0,NULL,NULL,0),(604,'الأمل الجديدة',0,NULL,NULL,0),(605,'معرض الهدي',0,NULL,NULL,0),(606,'الندي',0,NULL,NULL,0),(607,'الملكة ولامير',0,NULL,NULL,0),(608,'بيتي إليكترك',0,NULL,NULL,0),(609,'معرض عبد الرحيم مسعود',0,NULL,NULL,0),(610,'أسما جروب',0,NULL,NULL,0),(611,'أسما جروب',0,NULL,NULL,0),(612,'أغابي',0,NULL,NULL,0),(613,'المنشاوي',0,NULL,NULL,0),(614,'سنتر ماهر',0,NULL,NULL,0),(615,'كرستال',0,NULL,NULL,0),(616,'الدولية رامي غازي',0,NULL,NULL,0),(617,'الكوثر',0,NULL,NULL,0),(618,'قصر الهدايا',0,NULL,NULL,0),(619,'A 2 Z',0,NULL,NULL,0),(620,'E G S',0,NULL,NULL,0),(621,'المؤسسة المتحدة',0,NULL,NULL,0),(622,'أبلكس مصر',0,NULL,NULL,0),(623,'دهب للطلمبات',0,NULL,NULL,0),(624,'يونيمكس',0,NULL,NULL,0),(625,'مرسال',0,NULL,NULL,0),(626,'أولاد حميدكو',0,NULL,NULL,0),(627,'الشركة العالمية',0,NULL,NULL,0),(628,'فرندز',0,NULL,NULL,0),(629,'الأصدقاء',0,NULL,NULL,0),(630,'نايس برنت',0,NULL,NULL,0),(631,'روني',0,NULL,NULL,0),(632,'فورست هورس',0,NULL,NULL,0),(633,'شركة كواليتي صطاف',0,NULL,NULL,0),(634,'أبو ضيف',0,NULL,NULL,0),(635,'سعيد للمبامبو',0,NULL,NULL,0),(636,'سعيد للمبامبو',0,NULL,NULL,0),(637,'شعبان',0,NULL,NULL,0),(638,'أبو العلا',0,NULL,NULL,0),(639,'الساعاتي',0,NULL,NULL,0),(640,'JBl',0,NULL,NULL,0),(641,'شركة محمد صلاح الدين',0,NULL,NULL,0),(642,'ويفز',0,NULL,NULL,0),(643,'إيجبتك',0,NULL,NULL,0),(644,'ايموكس',0,NULL,NULL,0),(645,'العسري',0,NULL,NULL,0),(646,'إيمك',0,NULL,NULL,0),(647,'سفنتي بوينت',0,NULL,NULL,0),(648,'بان دي في',0,NULL,NULL,0),(649,'هاني تك نور',0,NULL,NULL,0),(650,'سبيد',0,NULL,NULL,0),(651,'كيان',0,NULL,NULL,0),(652,'الحجاز',0,NULL,NULL,0),(653,'النور',0,NULL,NULL,0),(654,'سيتي جرين',0,NULL,NULL,0),(655,'الأندلس',0,NULL,NULL,0),(656,'مودرن فارم',0,NULL,NULL,0),(657,'ووتر سيستم',0,NULL,NULL,0),(658,'إيماك',0,NULL,NULL,0),(659,'الجزيرة',0,NULL,NULL,0),(660,'اكوا كريستال',0,NULL,NULL,0),(661,'ريتاج',0,NULL,NULL,0),(662,'يوسف حامد',0,NULL,NULL,0),(663,'الكابتن',0,NULL,NULL,0),(664,'باسم السراج',0,NULL,NULL,0),(665,'عالم الرياضة',0,NULL,NULL,0),(666,'أشرف حلمي',0,NULL,NULL,0),(667,'قاصد كريم',0,NULL,NULL,0),(668,'الفنار',0,NULL,NULL,0),(669,'التقوي',0,NULL,NULL,0),(670,'أشرف نادي',0,NULL,NULL,0),(671,'مارديني',0,NULL,NULL,0),(672,'الصفا  (الانصاري)',0,NULL,NULL,0),(673,'السادات ( سيكا )',0,NULL,NULL,0),(674,'أحمد كمال ( دهانات )',0,NULL,NULL,0),(675,'الشماع',0,NULL,NULL,0),(676,'شركه نايل جروب',0,NULL,NULL,0),(677,'شركة وايز',0,NULL,NULL,0),(678,'هيرلي',0,NULL,NULL,0),(679,'اليكترك هوم',0,NULL,NULL,0),(680,'السويدي للكبلات الغردقه',0,NULL,NULL,0),(681,'باور سنتر',0,NULL,NULL,0),(682,'جولدن لايت',0,NULL,NULL,0),(683,'جولدن لايت',0,NULL,NULL,0),(684,'جولدن لايت',0,NULL,NULL,0),(685,'لايت بلان',0,NULL,NULL,0),(686,'باور الكترك',0,NULL,NULL,0),(687,'باور الكترك',0,NULL,NULL,0),(688,'العثمانيون',0,NULL,NULL,0),(689,'بسمه',0,NULL,NULL,0),(690,'غريب',0,NULL,NULL,0),(691,'عبد العزيز الدهشوري',0,NULL,NULL,0),(692,'أسامه لبيب',0,NULL,NULL,0),(693,'الشرق للصناعات',0,NULL,NULL,0),(694,'الدوليه للأنظمه الهندسيه',0,NULL,NULL,0),(695,'سيف النصر',0,NULL,NULL,0),(696,'دنيا الفنون والأعلام',0,NULL,NULL,0),(697,'الشناوي',0,NULL,NULL,0),(698,'كنزي',0,NULL,NULL,0),(699,'خورشيد',0,NULL,NULL,0),(700,'سمارت سيستم',0,NULL,NULL,0),(701,'كيما كونسلت',0,NULL,NULL,0),(702,'أكوا اكيار',0,NULL,NULL,0),(703,'اكوا لايف',0,NULL,NULL,0),(704,'PWT',0,NULL,NULL,0),(705,'الدوليه لتكنولوجيا المياه',0,NULL,NULL,0),(706,'العميد ممدوح',0,NULL,NULL,0),(707,'ماتوز',0,NULL,NULL,0),(708,'التمساح للديكورات',0,NULL,NULL,0),(709,'كيا',0,NULL,NULL,0),(710,'عرفه برايت',0,NULL,NULL,0),(711,'انتيكا',0,NULL,NULL,0),(712,'البحرين',0,NULL,NULL,0),(713,'اول ان ون',0,NULL,NULL,0),(714,'كليك',0,NULL,NULL,0),(715,'كليك',0,NULL,NULL,0),(716,'تك تكنولوجي',0,NULL,NULL,0),(717,'تليكوم',0,NULL,NULL,0),(718,'هاي تك',0,NULL,NULL,0),(719,'المهندس',0,NULL,NULL,0),(720,'اليكترك هاوس',0,NULL,NULL,0),(721,'باور اليكترك',0,NULL,NULL,0),(722,'المركز الهندسي',0,NULL,NULL,0),(723,'المركز الفني',0,NULL,NULL,0),(724,'محمد عزام',0,NULL,NULL,0),(725,'محمد رزق',0,NULL,NULL,0),(726,'الفا تيك',0,NULL,NULL,0),(727,'الدلتا',0,NULL,NULL,0),(728,'القاهرة',0,NULL,NULL,0),(729,'الحاج كمال',0,NULL,NULL,0),(730,'عمرو سرايا',0,NULL,NULL,0),(731,'سيناو',0,NULL,NULL,0),(732,'مركز سمير',0,NULL,NULL,0),(733,'مركز الجنايني',0,NULL,NULL,0),(734,'الأقصر',0,NULL,NULL,0),(735,'الزهراء',0,NULL,NULL,0),(736,'الكينج',0,NULL,NULL,0),(737,'الزهراء محمد غازي',0,NULL,NULL,0),(738,'المصريه العالميه للسيارات',0,NULL,NULL,0),(739,'المتحده محمود عيسي',0,NULL,NULL,0),(740,'أشرف للأعمال الإلكترونيه والفبر جلاس',0,NULL,NULL,0),(741,'مؤسسه الأمل',0,NULL,NULL,0),(742,'مختار عبد الراضي',0,NULL,NULL,0),(743,'النيل',0,NULL,NULL,0),(744,'الهندسيه',0,NULL,NULL,0),(745,'شريف شديد',0,NULL,NULL,0),(746,'مصرية لمعدات المطابخ ',0,NULL,NULL,0),(747,'ماستر نايل',0,NULL,NULL,0),(748,'الشركه الدوليه للإنظمه الهندسية',1022277949,NULL,NULL,0),(749,'مكتب العقباوى للمقاولات',1008414940,NULL,NULL,0),(750,'المتحده للمقاولات',1011360036,NULL,NULL,0),(751,'spada china co',0,NULL,NULL,0),(752,'الصياد تريدينج مصر',1284445229,NULL,NULL,0),(753,'وقود مصر',0,NULL,NULL,0),(754,'الورشة ألمركزيه - work centre ',101,NULL,NULL,0),(755,'العربية للأعمال الهندسية',1067771976,NULL,NULL,0),(756,'water dynamic ',2147483647,NULL,NULL,0),(757,'Power Technology ',1001114807,NULL,NULL,0),(758,'جولدن كيتشن ستيل',1245678,NULL,NULL,0),(759,'المرتضي لبيع وصيانه قطع غيارالمعدات البحريه',133467889,NULL,NULL,0),(760,'print shop company',123456789,NULL,NULL,0),(761,'مصر للمقاولات  والانشاءات',1323454578,NULL,NULL,0),(762,'شركة مصر للمقاولات و الإنشاءات',124345678,NULL,NULL,0),(763,'Bluebird\\\'s processing and maintenance of hotels',1288300089,NULL,NULL,0),(764,'Elabied co for you',12456789,NULL,NULL,0),(765,'Minart',0,NULL,NULL,0),(766,'SABA CO',1245678920,NULL,NULL,0),(767,'IBC',222720729,NULL,NULL,0),(768,'EMK',653440451,NULL,NULL,0),(769,'Pain De Vie Company',0,NULL,NULL,0),(770,'hussien Dawod',0,NULL,NULL,0),(771,'Al Takwaha Company',0,NULL,NULL,0),(772,'Imperial Gate',0,NULL,NULL,0),(773,'Emco Technology',0,NULL,NULL,0),(774,'الهيئه العربيه للتصنيع ',24567899,NULL,NULL,0),(775,' CWS & Others',124567,NULL,NULL,0),(776,' CWS & Others',124567,NULL,NULL,0),(777,' CWS & Others',124567,NULL,NULL,0),(778,'Al Atya Office',123456789,NULL,NULL,0),(779,'أمكو تكنولوجي انترناشيونال ',123456,NULL,NULL,0),(780,'شركه البدر',13545,NULL,NULL,0),(781,'النعمان',123456,NULL,NULL,0),(782,'El Handasia For Engineering Company',1245,NULL,NULL,0),(783,'T&D Kitchen Company',124567,NULL,NULL,0),(784,'CTC Company',124567,NULL,NULL,0),(785,'El Turkiy Company',1245,NULL,NULL,0),(786,'El Turkiy Company',1245,NULL,NULL,0),(787,'Audio Technology',124567,NULL,NULL,0),(788,'Egyptian agencies company ',1245,NULL,NULL,0),(789,'Spider',12,NULL,NULL,0),(790,'Team',12455,NULL,NULL,0),(791,'المؤسسة العالمية الكهروميكانيكية ',2147483647,NULL,NULL,0),(792,'المؤسسة العالمية للتوريدات الكهروميكانيكية ',12455,NULL,NULL,0),(793,'المؤسسة العالمية الكهروميكانيكية ',12455,NULL,NULL,0),(794,'شركة طيبة فوج',121,NULL,NULL,0),(795,'Comet Company',0,NULL,NULL,0),(796,'الفرعونية  ',1245788,NULL,NULL,0),(797,' شركه الاتحاد للمقاولات. ',123456789,NULL,NULL,0),(798,'Interclean',123456789,NULL,NULL,0),(799,'Elrefeay',1245788,NULL,NULL,0);
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'Comp'),(2,'Discount');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unplanned_limitations`
--

DROP TABLE IF EXISTS `unplanned_limitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unplanned_limitations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `limit` int(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unplanned_limitations`
--

LOCK TABLES `unplanned_limitations` WRITE;
/*!40000 ALTER TABLE `unplanned_limitations` DISABLE KEYS */;
INSERT INTO `unplanned_limitations` VALUES (1,2,30000);
/*!40000 ALTER TABLE `unplanned_limitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_autologin`
--

DROP TABLE IF EXISTS `user_autologin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_autologin` (
  `key_id` char(32) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_agent` varchar(150) COLLATE utf8_bin NOT NULL,
  `last_ip` varchar(40) COLLATE utf8_bin NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`key_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_autologin`
--

LOCK TABLES `user_autologin` WRITE;
/*!40000 ALTER TABLE `user_autologin` DISABLE KEYS */;
INSERT INTO `user_autologin` VALUES ('1b648e1fe1bb578159f4dc4411bb3468',63,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:44.0) Gecko/20100101 Firefox/44.0','172.50.10.251','2016-03-01 08:42:19'),('1eb3b62c39a029cf5f8bd5cb3fa533e1',146,'Mozilla/5.0 (Windows NT 6.1; rv:42.0) Gecko/20100101 Firefox/42.0','172.50.10.252','2015-11-15 08:18:36'),('21288a06ef9788244a5cbfc6705abb55',171,'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36','172.50.10.251','2016-02-24 14:31:51'),('26f7c233d275456dc94c8171622dabdf',30,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0','192.168.211.1','2015-10-05 13:13:42'),('3e9e172463647dd4d0d23902c9d657a0',152,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0','172.50.14.38','2016-02-04 08:43:08'),('42858e1a415afc845c13250aabe920f2',137,'Mozilla/5.0 (Windows NT 6.1; rv:41.0) Gecko/20100101 Firefox/41.0','172.50.10.252','2015-10-25 08:26:15'),('5481550ebda2427464f4ebc71c2ee3b3',147,'Mozilla/5.0 (Linux; Android 5.0; SAMSUNG SM-G900F Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/2.1 Chrome/34.0.1847.76 Mobile ','172.50.10.251','2015-12-06 14:29:32'),('562b0f9c0006d28c00114103adf2cf2e',3,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0','172.50.13.123','2015-10-04 11:10:31'),('70f2644a3f0749a825b647b637c66c5d',39,'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0','172.50.11.85','2016-02-08 09:10:10'),('71e35c64e4e9c284da5857103446076b',77,'Mozilla/5.0 (Windows NT 5.1; rv:41.0) Gecko/20100101 Firefox/41.0','172.50.10.252','2015-10-05 16:38:52'),('81eb9d401bb366315ccfc528496f28f3',77,'Mozilla/5.0 (Windows NT 6.1; rv:41.0) Gecko/20100101 Firefox/41.0','172.50.10.252','2015-11-01 07:48:01'),('87c2f4732c7612376ddd9e5c26b77ed6',146,'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.','172.50.10.251','2016-01-27 10:08:14'),('93613006ac276c4c2694c09007f9b921',101,'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)','172.50.10.251','2015-12-30 08:19:09'),('96725bac27a9a844be96a4b818ce561e',32,'Mozilla/5.0 (Linux; Android 5.0; SAMSUNG SM-G900H Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/2.1 Chrome/34.0.1847.76 Mobile ','172.50.10.251','2016-01-23 07:52:04'),('98789e84d09a79fe3fb35fa4dc6db921',25,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0','172.50.11.10','2015-10-04 18:23:39'),('b39603562f4b2782c0bef87010f0a098',92,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0','172.50.11.20','2015-11-29 09:11:43'),('b3da427fac6f44b72583f5e3b2ba453a',137,'Mozilla/5.0 (Windows NT 6.1; rv:42.0) Gecko/20100101 Firefox/42.0','172.50.10.252','2015-11-11 12:13:56'),('c4dacab210a217ce3a67f338a5ca168e',115,'Mozilla/5.0 (Windows NT 6.1; rv:44.0) Gecko/20100101 Firefox/44.0','172.50.10.251','2016-01-18 12:49:58'),('c4e62cbe8cbf32ad8a53f761765626f7',82,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0','172.50.10.252','2015-10-13 08:31:41'),('cd05aae43b0410a6b56879224a3884b5',137,'Mozilla/5.0 (Windows NT 6.1; rv:40.0) Gecko/20100101 Firefox/40.0','172.50.10.252','2015-09-30 18:19:15'),('ce5c5b580c24456b1c48f55f0fdf0ba7',4,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:40.0) Gecko/20100101 Firefox/40.0','172.50.15.1','2015-10-05 11:19:57'),('de6826e2e2cba88e9ab9d0c369adc947',149,'Mozilla/5.0 (Windows NT 6.1; rv:43.0) Gecko/20100101 Firefox/43.0','172.50.10.251','2016-01-21 13:06:43'),('e5ab8d783562d08b015a6efadac6b9ca',97,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0','172.50.14.65','2016-02-03 10:59:19'),('ea575126da01e3250945b4e3d1b3e7ad',157,'Mozilla/5.0 (Windows NT 6.1; rv:44.0) Gecko/20100101 Firefox/44.0','172.50.10.251','2016-02-16 10:48:58'),('f109040c44228a6f2b57d7c568f59f96',169,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:44.0) Gecko/20100101 Firefox/44.0','172.50.10.251','2016-02-25 12:56:10'),('fba54173bc9b98dcec4e403721953000',129,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:40.0) Gecko/20100101 Firefox/40.0','172.50.10.252','2015-10-04 07:54:39');
/*!40000 ALTER TABLE `user_autologin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_alias` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES (1,0,'Superuser');
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profiles`
--

DROP TABLE IF EXISTS `user_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `country` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profiles`
--

LOCK TABLES `user_profiles` WRITE;
/*!40000 ALTER TABLE `user_profiles` DISABLE KEYS */;
INSERT INTO `user_profiles` VALUES (1,2,NULL,NULL);
/*!40000 ALTER TABLE `user_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_alias` int(11) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(50) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  `fullname` varchar(255) COLLATE utf8_bin NOT NULL,
  `signature` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT '1',
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `ban_reason` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `new_password_key` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `new_password_requested` datetime DEFAULT NULL,
  `new_email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `new_email_key` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `last_ip` varchar(40) COLLATE utf8_bin NOT NULL,
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_alias` (`id_alias`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=175 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,1,'admin','$2a$08$Izj0hmrEuFrXzPAbbQbkYOKiYzdozfoJ9f2Qcc0ydXHls.bV2ICGW','marwan.gendy@gmail.com','Admin Account','!',23,19,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.13.1','2016-03-19 13:29:21','0000-00-00 00:00:00','2016-03-19 11:29:21',0),(2,2,0,'chairman','$2a$08$W.i6G3lh/HuZ5RhWfTgxpejs.KkCCknvdStqMzBJpdnGcg/vYMkW6','chairman@sunrise-resorts.com','Hossam ELShaer','76478-mr.-hossam-sig.jpg',2,19,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.252','2016-03-16 14:27:56','0000-00-00 00:00:00','2016-03-16 12:27:56',0),(3,3,0,'hazim.elshamy','$2a$08$/0kisML1GidSmnLnzHfDgevSAzvkbWdOSdqzMgAVxMPnh7qpgyh9y','hazim.elshamy@sunrise-resorts.com','Hazim EL Shamy','20550-mr.-hazim-signature.png',3,8,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.13.123','2016-03-16 12:03:12','0000-00-00 00:00:00','2016-03-16 10:03:12',0),(4,4,0,'samy.nasser','$2a$08$oxak.ciF9WPx4dYu5bt5NuU9OXeIxNyxePdkOPHHr0uyHSQJ6E65a','samy.nasser@sunrise-resorts.com','Samy A.Naser','124a0-sami-abdel-nasser.png',4,3,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.15.1','2016-03-15 16:42:49','0000-00-00 00:00:00','2016-03-15 14:42:49',0),(5,5,0,'tarek.desouki','$2a$08$.2ym5sMYxikbJDT1cTxbV.9BhPDB8z6k6J0n7jwEbxuXGGWG/fIMG','tarek.desouki@sunrise-resorts.com','Tarek Desouki','62be7-tarek-desouki.png',5,3,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.251','2015-12-14 14:19:38','0000-00-00 00:00:00','2015-12-14 12:19:38',0),(6,6,0,'mohamed.deraz','$2a$08$4xMOC.5qcU1kyksYScKm4OdgkmFXirLHbky3hLQxya30JFrS7qUuG','mohamed.deraz@sunrise-resorts.com','Mohamed Deraz','b9ebc-mr--deraz--signature.png',6,8,1,1,NULL,NULL,NULL,NULL,NULL,'172.50.14.11','2016-01-10 13:08:40','0000-00-00 00:00:00','2016-01-18 11:10:53',0),(9,9,0,'mohamed.fouad','$2a$08$0ZhH4jCuV9OYEtDQCes2xeRPr/3TUhdTZSPJq0ogPdwgTsx063DO2','mohamed.fouad@sunrise-resorts.com','Mohamed Fouad','9a279-mfouad.png',7,2,1,0,NULL,'b437e320a9bc85c7fba067a63276b682','2016-03-16 15:15:22',NULL,NULL,'172.50.10.251','2016-02-21 15:46:36','0000-00-00 00:00:00','2016-03-16 13:15:22',0),(22,22,0,'Sameh.nagar','$2a$08$X0RHb1.cGle6jKP1emXRsOQx4YQHHboNDArhEboprhcs0yz6an1Be','Sameh.nagar@sunrise-resorts.com','Sameh.nagar','d85e0-sameh-el-nagar.png',7,18,1,0,NULL,NULL,NULL,NULL,NULL,'41.65.31.123','2014-08-14 11:57:33','0000-00-00 00:00:00','2015-02-19 15:11:47',0),(21,21,0,'Ahmed.badr','$2a$08$/rW9iCLQiTLwhJrExiFoK.McLbS6WnamWanGpvpZqFlhB3kDshAY6','Ahmed.badr@sunrise-resorts.com','Ahmed.badr','90abc-ahmed-badr-gsc.png',7,8,1,0,NULL,NULL,NULL,NULL,NULL,'','0000-00-00 00:00:00','0000-00-00 00:00:00','2015-02-19 15:11:47',0),(20,20,0,'Amr.latif','$2a$08$1RjBF7UWTCtEeP45wveeCu61oKjWXv0gRF3ishCnU.sDtglgwK9uO','Amr.latif@sunrise-resorts.com','Amr.latif','08bd0-amr-ibrahim-recreation.png',7,13,1,0,NULL,'d802eb73cc2989892ed465be9a86d7ed','2015-08-23 20:24:10',NULL,NULL,'105.93.149.53','2014-11-24 12:30:14','0000-00-00 00:00:00','2015-08-23 20:24:10',0),(19,19,0,'essam.hagras','$2a$08$RQYrGUZxlmRd76fJ4Cdi4u9yZ9EJ7X/b0dHku8jNSbUcEDiFMP91W','Essam.hagras@sunrise-resorts.com','essam.hagras','2db26-essam-sign.png',7,6,1,0,NULL,NULL,NULL,NULL,NULL,'','0000-00-00 00:00:00','0000-00-00 00:00:00','2015-02-19 15:11:47',0),(18,18,0,'Nader.sheikh','$2a$08$41fcTIFTXbRrNvnqFlpnvOb13M9D.PwTQp/dspdqDSdJPqgTrb5Nq','Nader.sheikh@sunrise-resorts.com','Nader El Sheikh','44d54-nader-hk.png',7,12,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.14.60','2016-03-04 11:23:37','0000-00-00 00:00:00','2016-03-04 09:23:37',0),(17,17,0,'arahman.shahin','$2a$08$EneRUGtxwlh4zQkWXuXB7ukndTMizo9vPf5JuUVTo8s3M8C4RBUbS','arahman.shahin@sunrise-resorts.com','Abdel Rahman Shahin','30b7f-abdel-rahman-shahin-fb.png',7,7,1,0,NULL,NULL,NULL,NULL,NULL,'41.65.31.110','2015-05-15 18:51:20','0000-00-00 00:00:00','2015-05-15 18:51:20',0),(24,24,0,'Mohamed.hussien','$2a$08$FoBj9Ha9o.hm66NVj/nh.OhL2pyHaD.WowXlUzJ80ek3BsmcqoO2K','mohamed.hussien@sunrise-resorts.com','mohamed.hussien','ca7ff-mohmed-hussien.gif',7,4,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.12.95','2016-03-18 13:33:39','0000-00-00 00:00:00','2016-03-18 11:33:39',0),(23,23,0,'Mohamed.yazeed','$2a$08$H2G7reFmFm/8c2i1iilyMeV7YxBO2Fl8nXLvz1ZtZuAPQ1mlwh5mu','Mohamed.yazeed@sunrise-resorts.com','Mohamed.yazeed','705af-mohamed-abo-yazied.png',7,15,1,0,NULL,NULL,NULL,NULL,NULL,'41.65.31.110','2015-03-02 09:20:54','0000-00-00 00:00:00','2015-03-02 09:20:54',0),(25,25,0,'gouda.ramadan','$2a$08$Y6ZShxMfIoWqlMp1a8GnuuKXdAnkekrID9dgrMzh9ZcJZ./bArGpu','gouda.ramadan@sunrise-resorts.com','gouda.ramadan','5d134-gouda-ramadan-(gm).png',6,8,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.14.11','2016-03-08 12:48:12','0000-00-00 00:00:00','2016-03-08 10:48:12',0),(26,26,0,'emad.mousad','$2a$08$.N/Memyam8oqO5svUMUiGeAH9e75nAVI33GTwkgw8lII.Im0qkGuW','emad.mousad@sunrise-resorts.com','emad.mousad','7fa33-emad-mosaad.png',19,28,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.15.7','2016-03-02 11:24:41','0000-00-00 00:00:00','2016-03-02 09:24:41',0),(27,27,0,'nassar.othman','$2a$08$iAC4j2HXg/9n0iL1cvPmG.AjB6oQbGVIrL63Yaph220/3wuPy2Zj2','nassar.othman@sunrise-resorts.com','nassar.othman','af97a-nasser-othman(hkm).png',7,12,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.11.50','2016-02-12 22:32:39','0000-00-00 00:00:00','2016-02-12 20:32:39',0),(28,28,0,'ahmed.aziz','$2a$08$X97YWGE/AY8evFBdYlHj/.aclPPgb1mATw7/EePPrUx9Nygo67X2C','ahmed.aziz@sunrise-resorts.com','ahmed.aziz','30c42-ahmad-abdel-aziz(fom).png',7,18,1,0,NULL,NULL,NULL,NULL,NULL,'','0000-00-00 00:00:00','0000-00-00 00:00:00','2015-02-19 15:11:47',0),(29,29,0,'Rafik.Ramadan','$2a$08$NQ0dDcGU4XnqZzguHmDaFeobQ3EI7f7UMWj3nWC1WvsJ81ppkqgfK','fb.mgr.cb@sunrisehotels-egypt.com','Rafik Ramadan','19cef-rafik-ramadan.jpg',7,7,1,0,NULL,NULL,NULL,NULL,NULL,'','0000-00-00 00:00:00','0000-00-00 00:00:00','2015-02-19 15:11:47',0),(30,30,0,'said.atiek','$2a$08$bkiKTokw9G.bqZyjb.xOV.4b./k8ve9Cie5y7G5pTVg09JpFBPQLy','said.atiek@sunrise-resorts.com','Saed.atek','8efaa-said-el-atiek-(gm).png',17,8,1,0,NULL,NULL,NULL,NULL,NULL,'192.168.211.19','2016-01-30 08:38:39','0000-00-00 00:00:00','2016-01-30 06:38:39',0),(31,31,0,'AbdAziem.lbrahim','$2a$08$6ONcRL9a/oI8FYz0VvWWi.09TX68ldQRK2lKJ9gKkyBuj9bPS4dbu','AbdAziem.lbrahim@sunrisehotelsegypt.com','AbdAziem.lbrahim','31d58-abdel-azim-el-sweedy-(hr).png',7,15,1,0,NULL,NULL,NULL,NULL,NULL,'','0000-00-00 00:00:00','0000-00-00 00:00:00','2015-02-19 15:11:47',0),(32,32,0,'khaled.zweil','$2a$08$FzECuHfPRtES8SsrfpRXbeztSXgH5S..o06BzkR9ptHNxxyyial1C','khaled.zweil@sunrise-resorts.com','khaled.zweil','13f62-khaled-zwiel-(afc).png',5,3,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.251','2016-03-15 11:18:44','0000-00-00 00:00:00','2016-03-15 09:18:44',0),(33,33,0,'khaled.elsagher','$2a$08$dpmKsOCze/Fixh7FnMCH0eCAkYMCrjbFeD9qAo2.C/rym4nnJ0mai','khaled.elsagher@sunrise-resorts.com','khaled.elsagher','7e98a-khaled-el-saghier-(fbm).png',7,7,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.251','2016-01-23 15:14:41','0000-00-00 00:00:00','2016-01-23 13:14:41',0),(34,34,0,'ayman.salah','$2a$08$6xtIHxfQ3oc9MLvHMp/v4eXi8kTN4h2THPTzVZB/Mhn3L4YJLHlOe','ayman.salah@sunrise-resorts.com','ayman.salah','9701d-ayman-salah-(-exec-chref.png',7,6,1,0,NULL,NULL,NULL,NULL,NULL,'41.65.31.105','2015-01-13 10:00:30','0000-00-00 00:00:00','2015-02-19 15:11:47',0),(35,35,0,'hashim.lotfy','$2a$08$c3KqqxPDqTqxhiKwlwO9Pes86b1W2lGr7Gn7OGnaJvTAAaipQbChu','hashim.lotfy-rm@sunrisehotelsegypt.com','hashim.lotfy-rm','3703a-hashem-lotfy-(fo-mnager).png',7,18,1,0,NULL,NULL,NULL,NULL,NULL,'','0000-00-00 00:00:00','0000-00-00 00:00:00','2015-02-19 15:11:47',0),(36,36,0,'ibrahim.hasan','$2a$08$1W5YKILkPkicEH5yFYrgSeXu8XfuFJnnhR9vkkjgWs1bm7Li1cHN.','ibrahim.hasan@sunrisehotelsegypt.com','Ibrahim Hasan','4581d-ibrahim-hassan-(hk).png',7,12,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.251','2016-03-05 09:20:22','0000-00-00 00:00:00','2016-03-05 07:20:22',0),(37,37,0,'Ibrahim.belal','$2a$08$KAfJX/FwUl2axSA9n69h.Owd3rX29jzb1yCjQdpTYWhOBpmPuN8pK','recreation.managerrm@sunrisehotels-egypt.com','ibrahim Belal','c0c25-ibrahim-belal-(recreation).png',7,13,1,0,NULL,NULL,NULL,NULL,NULL,'','0000-00-00 00:00:00','0000-00-00 00:00:00','2015-02-19 15:11:47',0),(82,82,0,'ehab.rostom','$2a$08$Ea5Z7f5fLQmhv.gwt7p0Jeq0aum3twSzDRHqK8aR8QaRsAHiNgAAG','ehab.rostom@sunrise-resortys.com','ehab rostom','c513b-ehab-rostom-(it).png',7,2,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.252','2016-03-17 10:23:24','0000-00-00 00:00:00','2016-03-17 08:23:24',0),(39,39,0,'ahmed.fawzy','$2a$08$FKz4rR2e8uwRuH/9CWWuzudN.0lzqKiI7s8y/dewExBomHOTXYcQu','ahmed.fawzy@sunrisehotels-egypt.com','Ahmed Fawzy','46aa5-ahmed-fawzy(eng).png',7,4,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.11.85','2016-02-08 11:10:10','0000-00-00 00:00:00','2016-02-08 09:10:10',0),(40,40,0,'mohamed.syd','$2a$08$ktcvg51zDNTMiDP4OkHO5e/rtCpzvruCk1n3pbi7OFK5yuNWPyPz.','mohamed.syd@sunrisehotels-egypt.com','mohamed.syd','0d2f7-mohamed-syd.jpg',6,8,1,0,NULL,NULL,NULL,NULL,NULL,'10.20.20.4','2016-03-17 19:35:06','0000-00-00 00:00:00','2016-03-17 17:35:06',0),(41,41,0,'ehab.radwan','$2a$08$0cECuwrK59I32T39LwecyeYx4IOQPHYxK49W9338Iwydg5xxa5lO2','ehab.radwan@sunrise-resorts.com','ehab.radwan','247ac-ehab-radwan-fb.jpg',7,7,1,0,NULL,NULL,NULL,NULL,NULL,'41.32.50.19','2015-01-08 13:50:37','0000-00-00 00:00:00','2015-02-19 15:11:47',0),(42,42,0,'mohamed.abdelkarim','$2a$08$TZxfjnD/tSuu2HfwC0hq1uDhnnvc31Jv172DukvukEnsr76l1Sib6','ENG.Holidays@sunrisehotels-egypt.com','mohamed.abdelkarim','75940-mohamed-abdel-karim-eng.jpg',7,4,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.252','2016-03-18 12:24:17','0000-00-00 00:00:00','2016-03-18 10:24:17',0),(43,43,0,'hamza.tawfik','$2a$08$Rn3FL.WCymwrYz1voK.SJezhgR/O2eDiMf6qZOl6qZpEne7SU5Re.','hamza.tawfik@sunrise-resorts.com','hamza.tawfik','7dc0a-hamza-it.jpg',7,2,1,0,NULL,NULL,NULL,NULL,NULL,'10.20.20.11','2016-03-20 11:34:58','0000-00-00 00:00:00','2016-03-20 09:34:58',0),(132,132,0,'ahmed.farag','$2a$08$bjqSKtr264fH8owcSGQlhO0WBg26WHUFi/.Nu.eziat.i5fDz.lMG','ahmed.farag@sunrise-resorts.com','Ahmed Farag','75617-ex.chef.png',7,6,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.13.1','2016-02-15 14:39:18','0000-00-00 00:00:00','2016-02-15 12:39:18',0),(49,49,0,'reda.mohamed','$2a$08$wZFPPrV0vDbcq/KIwaqkxexMMr99Tfe6.Q./OS7lxVkoCHczMJfMa','Reda.Mohamed@sunrise-resorts.com','Reda.Mohamed','e9570-reda-mohamed-(accounting-manager).png',5,3,1,0,NULL,NULL,NULL,NULL,NULL,'192.168.211.10','2016-03-18 15:17:08','0000-00-00 00:00:00','2016-03-18 13:17:08',0),(50,50,0,'hany.ahmed','$2a$08$aK.hM2mLUiUlL2Xptimb.uvF2tdiU53F0WqqOWl6c4vG/MoyRGGzS','hany.ahmed@sunrise-resorts.com','Hany Ahmed','0ba94-hany-ahmed-(fo-).png',7,18,1,0,NULL,NULL,NULL,NULL,NULL,'192.168.237.33','2015-11-05 11:34:03','0000-00-00 00:00:00','2015-11-05 09:37:36',0),(131,131,0,'kareem.zaher','$2a$08$CfFh3KYORjrV52xs.KOh2OKezStUbgvzGzKohT7eMERvCXhuHijRy','Kareem.Zaher@sunrise-resorts.com​​​','Kareem Zaher','9290e-untitled-1.png',7,4,1,0,NULL,NULL,NULL,NULL,NULL,'192.168.235.70','2015-10-21 13:34:38','0000-00-00 00:00:00','2015-10-21 11:34:38',0),(128,128,0,'samy.salah','$2a$08$Ro0XEa8rf8hAbgDh3nyyR.JzH33HhHIlU0s9hHe/4wWkGo4mkl5F2','samy.salah@festival-resorts.com','samy.salah','c01d1-mr.-samy.jpg',7,13,1,0,NULL,NULL,NULL,NULL,NULL,'41.65.149.132','2015-06-11 13:22:13','0000-00-00 00:00:00','2015-06-11 13:22:13',0),(53,53,0,'Mostafa.Elkheshen','$2a$08$0cnprRU4dul8YcmZisVFaO2fSJl2F0lVtBhhuj/z3uhGKH2gJ6ib.','Mostafa.Elkheshen@Sunrisehotels-Egypt.com','Mostafa.Elkheshen','7e4d3-moustafa-elkheshen-(pur).png',7,3,1,0,NULL,NULL,NULL,NULL,NULL,'197.134.255.229','2014-08-06 16:56:27','0000-00-00 00:00:00','2015-02-19 15:11:47',0),(54,54,0,'tarek.ahmed','$2a$08$hJ6lbQeZHhABfPF2Yapr7uqiFbe1dkV1ut/eOjVBUHgmbZTyXQjdi','tarek.ahmed@sunrise-resorts.com','tarek.ahmed','36c2f-tarek-ahme-(resident-manager).png',6,8,1,0,NULL,NULL,NULL,NULL,NULL,'41.65.71.144','2014-08-07 08:37:12','0000-00-00 00:00:00','2015-02-19 15:11:47',0),(55,55,0,'Philippe.devizcaya','$2a$08$V6huwdwaAHpW8TxtMOaLzeZQvqgfQxrL2O6GKoaVq0gzzeHMfiJsS','Philippe.deVizcaya@sunrise-resorts.com','Philippe deVizcaya','27543-philippe-sign.png',16,8,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.13.12','2016-03-16 12:19:57','0000-00-00 00:00:00','2016-03-16 10:19:57',0),(56,56,0,'','','','',NULL,0,0,1,0,NULL,NULL,NULL,NULL,NULL,'','0000-00-00 00:00:00','0000-00-00 00:00:00','2015-02-19 15:11:47',0),(130,130,0,'michael.adel','$2a$08$IkQrPsBT4Py8JwTJ/FyLgenTZq/1tvMJvz.VpEya6OOK3Yd1p4PLy','michael.adel@sunrise-resorts.com','Michael Adel','e31c2-michel.jpg',7,2,1,0,NULL,NULL,NULL,NULL,NULL,'41.178.12.82','2015-06-29 14:02:59','0000-00-00 00:00:00','2015-06-29 14:02:59',0),(129,129,0,'Waheed.altohamy','$2a$08$q9xiEVRrqLFsgE5Rxra8cOHxFUwrmNm0Y2OQmfIPkcBRl9VVdMHCu','Waheed.altohamy@sunrise-resorts.com','Waheed. Altohamy','aeaaa-waheed.jpg',6,8,1,0,NULL,NULL,NULL,NULL,NULL,'10.20.20.11','2016-03-20 11:34:31','0000-00-00 00:00:00','2016-03-20 09:34:31',0),(59,59,0,'mohamed.elserwy','$2a$08$vNxk1Oqw86mNzZ7spWwJBentGmR/vpa9EDmbXt3bHWQoYrNjybeYu','mohamed.elserwy@sunrise-resorts.com','mohamed.elserwy','7c359-mohamed-serwy.png',4,9,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.15.4','2016-02-16 18:13:29','0000-00-00 00:00:00','2016-02-16 16:13:29',0),(60,60,0,'waleed.mohamed','$2a$08$VlKC7lylnjkn.tV8pZmOtuBVjOdfIqwREmp/KhBWkcR99td7TZ7Gq','waleed.mohamed@sunrise-resorts.com','waleed.mohamed','2a4dc-waleed-mohamed-(hotel-manager).png',6,8,1,1,NULL,NULL,NULL,NULL,NULL,'41.65.207.98','2015-08-31 10:34:55','0000-00-00 00:00:00','2016-01-18 11:12:30',0),(61,61,0,'mohamed.mekky','$2a$08$w2LbzLL/LtfnxeLs9bh9a.YeTPw9s1xrwm3KFJAkl1QFdAajYVKXm','fb.manager@sunrisehotels-egypt.com','mohamed Mekky','1b084-mohamed-meky-(-assistant-fb).png',7,7,1,0,NULL,NULL,NULL,NULL,NULL,'','0000-00-00 00:00:00','0000-00-00 00:00:00','2015-02-19 15:11:47',0),(62,62,0,'emad.salah','$2a$08$UU36z3gP2OYV27qhyeln7.Afhb78t24VgV5cqF9gld2b7a56oyrsG','xec.chef@sunrisehotels-egypt.com','Emad Salah','e49ff-emad-salah-(-executive-chef).png',7,6,1,1,NULL,NULL,NULL,NULL,NULL,'41.65.207.100','2015-01-10 09:07:47','0000-00-00 00:00:00','2016-01-18 11:12:47',0),(63,63,0,'hossam.salah','$2a$08$NWpLFTaqKHkuJPHsUoBZ9uEgRKljyShqoai08ow1uZG6jY8tn185O','hossam.salah@sunrise-resorts.com','hossam.salah','4eae9-hossam-salah(fc).png',5,3,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.252','2016-03-17 08:29:49','0000-00-00 00:00:00','2016-03-17 06:29:49',0),(64,64,0,'hany.mosaad','$2a$08$DMgK8PcLY15bataRiv014.eSqAQRDXutQUlyyDERu8Ir/q9flFc6K','hany.mosaad@sunrise-resorts.com','Hany Mosaad','3dd02-hany-mosaad-(assistant-engineering).png',7,4,1,1,NULL,NULL,NULL,NULL,NULL,'172.50.10.251','2015-12-09 11:33:09','0000-00-00 00:00:00','2016-01-18 11:12:59',0),(65,65,0,'Elsayed.rezk','$2a$08$LFb21Tl2kLVVIo0waMPm2.FRk8vkg.9kiSAg7ZZOvrMV12PT0zZbK','Elsayed.rezk@sunrisehotels-egypt.com','Elsayed.rezk','20a84-sayed-rezk.png',7,18,1,0,NULL,NULL,NULL,NULL,NULL,'','0000-00-00 00:00:00','0000-00-00 00:00:00','2015-02-19 15:11:47',0),(66,66,0,'waleed.moawad','$2a$08$L4LlpDjKXs/7Z8NYLAUbUODRDz2cTopginke8xFW8brXPxZScOv4C','waleed.moawad@sunrisehotels-egypt.com','waleed.moawad','40293-waleed-moawad-(-hr).png',7,15,1,1,NULL,NULL,NULL,NULL,NULL,'','0000-00-00 00:00:00','0000-00-00 00:00:00','2016-01-18 11:13:12',0),(67,67,0,'ahmed.hameed','$2a$08$5peUqTg/9hXU7mlIJcZNPuThanYMsKbEHJOSCy5OCDT40HUSVQXaW','it.db@sunrisehotels-egypt.com','Ahmed Hameed','d8bc9-ahmed-a.hameed.png',7,2,1,0,NULL,NULL,NULL,NULL,NULL,'41.65.207.100','2015-08-24 12:08:17','0000-00-00 00:00:00','2015-08-24 12:08:17',0),(68,68,0,'mohamed.khalifa','$2a$08$nvdrhyWsff2.d8wjm1zT6O.8a1R6Qr4n8aW4tlTXiJMTKG9wFVXNS','mohamed.khalifa@festivalhotels-egypt.com','mohamed.khalifa','e9591-mohammed-khalifa.jpg',6,8,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.252','2016-03-16 16:30:35','0000-00-00 00:00:00','2016-03-16 14:30:35',0),(69,69,0,'Tarek.Fahmy','$2a$08$OXBkPkfarfa2C9JpWiNtyehDxvokHXAkvhCLWnqBGkYPHbBqquE4.','Tarek.Fahmy@Festival-Resorts.com','Tarek.Fahmy','e2e3a-tarek-fahmy.jpg',7,18,1,0,NULL,NULL,NULL,NULL,NULL,'','0000-00-00 00:00:00','0000-00-00 00:00:00','2015-02-19 15:11:47',0),(70,70,0,'Safwat.Saber','$2a$08$sqfzHdAPyFq40UD/UhYkO.No5JvdnhSz.p2KbqXhp/I7duTJlb6dK','Safwat.Saber@Festival-Resorts.com','Safwat.Saber','4fbb8-safwat-saber.jpg',7,15,1,0,NULL,NULL,NULL,NULL,NULL,'','0000-00-00 00:00:00','0000-00-00 00:00:00','2015-02-19 15:11:47',0),(71,71,0,'Aly.Nagy','$2a$08$KO1XClC7fBc4ImIOefzVa.iF9OGE/3LEDfC6Rpj1cN7yXxa/6/Y1e','Aly.Nagy@Festival-Resorts.com','Aly.Nagy','a923f-aly-nagy.jpg',7,6,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.251','2016-01-27 13:26:24','0000-00-00 00:00:00','2016-01-27 11:26:24',0),(72,72,0,'Haytham.Mohamed','$2a$08$/C8ny4RpJylZ67KMRDrFC.cXbds4jNCqwEpzVHrscPRhUSBZJ.rSy','Haytham.Mohamed@Festival-Resorts.com','Haytham.Mohamed','c6445-haytham-mohamed.jpg',7,7,1,0,NULL,NULL,NULL,NULL,NULL,'41.65.149.132','2015-01-30 11:29:26','0000-00-00 00:00:00','2015-02-19 15:11:47',0),(73,73,0,'Waleed.Ibrahim','$2a$08$xGJeB7qmxgRV2zmtuzi/vOor8HvUXF2X0xZNSBCMDES6pRsJsw6NS','Waleed.Ibrahim@Festival-Resorts.com','Waleed.Ibrahim','09576-waleed-ibrahim.jpg',7,4,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.251','2016-03-14 11:51:11','0000-00-00 00:00:00','2016-03-14 09:51:11',0),(74,74,0,'Mohamed.Fouad-fes','$2a$08$j3VWAQ2R6GwsxrsOq5xfget.l.HpTRXd84Cr.fHXmI4biTN1PfzjW','Mohamed.Fouad@Festival-Resorts.com','Mohamed.Fouad','b6a59-mohamed-fouad.jpg',7,2,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.252','2016-03-16 16:49:19','0000-00-00 00:00:00','2016-03-16 14:49:19',0),(75,75,0,'Mohamed.Karim','$2a$08$5a9y3Lkc25UwOSMOQhiEkuXS1b/YXNT5NpHBbDZakQrnmH30GMUCK','Mohamed.Karim@Festival-Resorts.com','Mohamed.Karim','26bbc-mohamed-abd-el-karim.jpg',5,3,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.251','2015-12-12 16:40:41','0000-00-00 00:00:00','2015-12-12 14:40:41',0),(76,76,0,'Mohamed.Aleem','$2a$08$nrRNBsgd3hiCBzALloS8iuMrGOrTjUlkDsizl487gWJvOBKqmWksu','Mohamed.Aleem@Festival-Resorts.com','Mohamed.Aleem','18302-mohamed-abd-el-aleem.jpg',7,12,1,0,NULL,NULL,NULL,NULL,NULL,'41.65.149.132','2015-09-07 08:17:36','0000-00-00 00:00:00','2015-09-07 08:17:36',0),(77,77,0,'yasser.nabil','$2a$08$kIQ9SvLxSlwp1doi77z7geapTblylbo5ax2BiEy1ymDlyjNOZBzga','yasser.nabil@festival-resorts.com','Yasser Nabil','62faa-yasser-nabil.jpg',6,8,1,1,NULL,NULL,NULL,NULL,NULL,'172.50.10.252','2015-11-13 18:08:41','0000-00-00 00:00:00','2016-01-18 11:13:35',0),(78,78,0,'mohamed.zayed','$2a$08$282AdZzr7uK4QiV1ehGO/.JEEGUUDOIhkxkaOlGfgmqZuty6BKcJO','mohamed.zayed@festivalhotels-egypt.com','mohamed.zayed','4dc3c-mohamed-zayed.jpg',7,8,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.252','2015-10-09 09:47:16','0000-00-00 00:00:00','2015-10-09 07:47:16',0),(118,118,0,'ahmed.elgohary','$2a$08$1NVXCGrbBQCnCspqADL8h.OHKt0xyHsWgqFDCSVDGCa7jlq0ARLOm','ahmed.elgohary@sunrise-resorts.com','ahmed.elgohary','b6927-ahmed-el-gouhary.jpg',6,3,1,0,NULL,NULL,NULL,NULL,NULL,'','0000-00-00 00:00:00','0000-00-00 00:00:00','2015-02-19 15:11:47',0),(80,80,0,'Mohamed.kamel','$2a$08$By5ozdWfaoGJafIUuTa6wuq8nzRbeH/qe9Yhw8BSPz9LD3F/uhw6C','Mohamed.kamel@sunrise-resorts.com','Mohamed.kamel','3c3e2-mohamed-kamel.jpg',7,7,1,0,NULL,NULL,NULL,NULL,NULL,'192.168.210.10','2015-11-05 12:29:45','0000-00-00 00:00:00','2015-11-05 10:29:45',0),(81,81,0,'Hussien.embaby','$2a$08$suPRYJKsQBOfHJSHjFGraOuBCIJDV8ibNvxqaTMYEdOk.hF2pNvoi','exchef.shedwan@festivalhotels-egypt.com','Hussien.embaby','60809-hussein-imbaby.jpg',7,6,1,0,NULL,NULL,NULL,NULL,NULL,'','0000-00-00 00:00:00','0000-00-00 00:00:00','2015-02-19 15:11:47',0),(83,83,1,'Marwan.gendy','$2a$08$aT3Sy5sTX12H6kRTXnDOn.wNaXDPw.vfpow2OmX1QqR54H4XmqXA.','Marwan.gendy@sunrise-resorts.com','Marwan EL Gendy',NULL,0,0,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.252','2016-03-20 09:10:38','0000-00-00 00:00:00','2016-03-20 07:10:38',0),(84,84,0,'emad.milad','$2a$08$cXbaUkz/fK1SE.6F/W8fJeKg2ZperLn2yjEfJC7fZAeOkpt0NFdnO','emad.milad@sunrise-resorts.com','emad.milad','c8da0-emad.milad-general_manager.png',6,8,1,1,NULL,NULL,NULL,NULL,NULL,'105.36.185.186','2014-12-29 10:32:38','0000-00-00 00:00:00','2016-01-18 11:13:52',0),(85,85,0,'ayman.selim','$2a$08$cmXaH2p2FbBg.dS.k1UOmeXZTeaUyUPsHbuAAtvVCDnxU7bwxDAue','ayman.selim@sunrise-resorts.com','ayman.selim','17c15-selim.png',5,3,1,0,NULL,NULL,NULL,NULL,NULL,'192.168.237.44','2016-02-15 15:08:27','0000-00-00 00:00:00','2016-02-15 13:08:27',0),(86,86,0,'moustafa.mahmoud','$2a$08$LLSdEtpPYtLnFgVFqXO2oe2O9.pjtU5zQA0YeeIa2jhhESobco3Le','Moustafa.Mahmoud@sunrise-resorts.com','moustafa.mahmoud','a15a1-moustafa-mahmoud-asst.-fc.jpg',5,3,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.14.30','2016-02-04 11:53:00','0000-00-00 00:00:00','2016-02-04 09:53:00',0),(91,91,0,'hussein.imbaby','$2a$08$gdXhkmVRyABzrgMwIt8aRe51xs3bZ9XTTFvbsg086j/8xb0p5eNsq','Hussein.Imbaby@festival-resorts.com','Hussein Imbaby','2abc6-hussein-imbaby.jpg',7,6,1,0,NULL,NULL,NULL,NULL,NULL,'41.32.14.218','2015-02-23 17:49:32','0000-00-00 00:00:00','2015-02-23 17:49:32',0),(92,92,0,'Ezz.sayed','$2a$08$DMp7daz3HhTIsCPRmMpo9OcwhNLZBUn78qoVvPMbxVJ.LpZO/lxR2','Ezz.sayed@sunrise-resorts.com','Ezz.sayed','861f4-ezz-chief-acc.jpg',5,3,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.11.20','2016-03-18 15:31:30','0000-00-00 00:00:00','2016-03-18 13:31:30',0),(109,109,0,'Khaled.Latif','$2a$08$aTTF9citm4FeJAlOsLSxdec0kVNgVoVtn0uq4zsVwLlOYMVQ30lei','Khaled.Latif@sunrise-resorts.com','Khaled Abdel Latif','e72e0-khaled.png',7,4,1,0,NULL,NULL,NULL,NULL,NULL,'41.65.31.105','2015-02-22 10:08:13','0000-00-00 00:00:00','2015-02-22 10:08:13',0),(93,93,0,'wael.wali','$2a$08$0hExdNzDj8ZamcuPXqKxb.b26iEJa29Webw0COuA5MfybwzX4IU2C','wael.wali@sunrise-resorts.com','Wael Wali','6d83f-wael.wali-general_manager.png',6,8,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.11.11','2016-03-16 17:19:27','0000-00-00 00:00:00','2016-03-16 15:19:27',0),(94,94,0,'sameh.nashaat','$2a$08$/sIb30Wu/HzcIBcyqaUS9eJlt12zQSIhdpUjn8YBXHXI3ePVJZpn6','sameh.nashaat@festival-resorts.om','sameh.nashaat','95aab-sameh-nashaat.jpg',7,12,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.251','2016-01-27 13:07:17','0000-00-00 00:00:00','2016-01-27 11:07:17',0),(95,95,0,'salem.kamal','$2a$08$N3bNkqDxtftaYwO.tqlryuZl6124rtsy7ta3WQ5.iyLQBFTPH0CCe','salem.kamal@sunrisegroup-eg.com','salem.kamal','b155a-salem-kamal.jpg',10,19,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.252','2016-03-20 14:28:59','0000-00-00 00:00:00','2016-03-20 12:28:59',0),(96,96,0,'Ismail.Ali','$2a$08$s6Fz4lnBdu1X1yN5h741kewU0Cxqv0x6hA6mL.9uzo8p0B/nM74ye','Ismail.Ali@sunrise-resorts.com','Ismail.Ali','0feb6-ismail-ali.jpg',7,12,1,0,NULL,NULL,NULL,NULL,NULL,'41.65.31.105','2014-11-25 12:26:24','0000-00-00 00:00:00','2015-02-19 15:11:47',0),(97,97,0,'Essam.Khalil','$2a$08$ibayxLVf2a0th3mFPVlvBeHcW88ehNzlKQ7t9DMIgWF4arj2D/pnO','Essam.Khalil@sunrise-resorts.com','Essam.Khalil','aa7f6-essam-khalil-engineering.png',7,4,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.14.65','2016-03-17 16:59:36','0000-00-00 00:00:00','2016-03-17 14:59:36',0),(99,99,0,'mohamed.hamdy','$2a$08$QvNDMs4wZe6iAkMnfjZkQ.GCMgBZkGdbTM1A5eWIXyMeDcjljb5oi','mohamed.hamdy@sunrisegroup-eg.com','mohamed.hamdy','8c2f2-mohamed.-hamdy.jpg',11,19,1,0,NULL,NULL,NULL,NULL,NULL,'41.65.109.70','2015-04-28 12:48:32','0000-00-00 00:00:00','2015-04-28 12:48:32',0),(100,100,0,'sameh.farouk','$2a$08$QyP9q0hHau3fnxPa9wHYy.Yvc.3Oq5w/bt99.JfHvkYWJKZq.LJSS','sameh.farouk@sunrisegroup-eg.com','sameh.farouk','9c8f5-sameh-farouk.jpg',12,19,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.251','2016-03-03 14:52:07','0000-00-00 00:00:00','2016-03-03 12:52:07',0),(101,101,0,'mohamed-attia','$2a$08$ftuA/QJt.cMQT3jSwbcmzO6LeGGRh6ght4b8/iuIOveuCMcpEZMFK','mohamed-attia@sunrisegroup-eg.com','mohamed-attia','e25e2-mohamed-attia.jpg',13,19,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.251','2016-03-10 10:02:51','0000-00-00 00:00:00','2016-03-10 08:02:51',0),(102,102,0,'khaled.fahmy','$2a$08$oRPlVJS01dq3.avulA04huk6OAx3XXo5IItIE44p/zey1T4G0p7bi','khaled.fahmy@sunrisegroup-eg.com','khaled.fahmy','4b4ef-khaled-fahmy.jpg',14,19,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.251','2016-03-08 09:56:36','0000-00-00 00:00:00','2016-03-08 07:56:36',0),(103,103,0,'rehab.ibrahim','$2a$08$s1dv/uTxkhd6iiOpUvqA/OKPpGr2uk5WahPNxtg4rPMnVRXlU1lR6','rehab.ibrahim@festival-resorts.com','rehab.ibrahim','c57c7-rehab-fc.jpg',5,3,1,1,NULL,NULL,NULL,NULL,NULL,'41.32.14.218','2015-06-11 12:08:47','0000-00-00 00:00:00','2016-01-18 11:17:10',0),(104,104,0,'raafat.aziz','$2a$08$47JNq2Sq.uTMteLc7T8MV.ZmuZyLmt7ZbDODmrBGgZyLLONpAHXQu','raafat.aziz@sunrise-resorts.com','Raafat Abd El Aziz','e8461-raafat.aziz-director_hk.png',7,12,1,1,NULL,NULL,NULL,NULL,NULL,'41.65.207.75','2015-01-05 15:13:53','0000-00-00 00:00:00','2016-01-18 11:17:21',0),(107,107,0,'ahmed.elmasry','$2a$08$MGC06na.VXSQOFdtkVoUu.NLZDKsCLMaa2ZTECcsZLgukWOEhBSZW','ahmed.elmasry@sunrise-resorts.com','Ahmed El Masry','757b8-ahmed.elmasry-f&b_manager.png',7,7,1,0,NULL,NULL,NULL,NULL,NULL,'41.65.207.75','2015-01-03 09:55:52','0000-00-00 00:00:00','2015-02-19 15:11:47',0),(106,106,0,'Waleed.ali','$2a$08$FnzvvVWI5INhcBr1rs1ym.FXZsfpeSyeVZRjweJeoTWcPNh7GcKyy','Waleed.ali@sunrise-resorts.com','Waleed.ali','0c421-waleed.ali.jpg',7,7,1,0,NULL,NULL,NULL,NULL,NULL,'66.249.93.248','2015-03-05 08:43:33','0000-00-00 00:00:00','2015-03-05 08:43:33',0),(110,110,0,'mohamed.wahba','$2a$08$ozztx3i7mfP5SF2al33K7evp3bP94NBr4R0UJf00H/IhScFQnwlIu','mohamed.wahba@sunrise-resorts.com','Mohamed Wahba','715b7-mohamed.-wahba.jpg',7,2,1,0,NULL,NULL,NULL,NULL,NULL,'192.168.210.10','2015-11-04 18:41:33','0000-00-00 00:00:00','2015-11-04 16:41:33',0),(108,108,0,'ahmed.mahmoud','$2a$08$tq..xlR4LnOyK6NXEUzvOuxEmiy2.7Rc/VDkF6NPcyHOSvHYYaVrq','ahmed.mahmoud@sunrise-resorts.com','Ahmed Ebrahim','8c779-ahmed-ibrahim.png',7,7,1,0,NULL,NULL,NULL,NULL,NULL,'41.32.14.218','2015-06-11 12:10:00','0000-00-00 00:00:00','2015-06-11 12:10:00',0),(111,111,0,'sherif.naguib','$2a$08$PFSlEMTQlTaR4btBIQUSU.JIT16RcUAWFztE/a6AromRFUoAqtT1K','sherif.naguib@sunrise-resorts.com','Sherif Naguib','417bf-sherif.nageb.png',6,8,1,0,NULL,NULL,NULL,NULL,NULL,'41.65.71.141','2015-02-26 11:00:45','0000-00-00 00:00:00','2015-02-26 11:00:45',0),(127,127,0,'Ashraf.Kamel','$2a$08$Xk3N7Wls4JKJx9I0qQaKzOBTIx9kMzAYE.icBgDw5JukS5AXJnD.i','ahkm.abh@sunrise-resorts.com','Ashraf Kamel','11aab-untitled.jpg',7,12,1,0,NULL,NULL,NULL,NULL,NULL,'41.131.204.44','2015-05-12 15:18:48','0000-00-00 00:00:00','2015-05-12 15:18:48',0),(113,113,0,'mohamed.ibrahim','$2a$08$94nxhHsMZlL7UDNTqZAUNujIBPVzvpPaNkZtxS1igTHhGreEti0mS','mohamed.ibrahim@sunrise-resorts.com','Mohamed Ibrahim','e11db-mohamed.ibrahim_hr_director.png',7,15,1,0,NULL,NULL,NULL,NULL,NULL,'41.65.207.75','2015-02-04 08:06:34','0000-00-00 00:00:00','2015-02-19 15:11:47',0),(114,114,0,'ashraf.nazif','$2a$08$Ld27uC0oBodzxFidmQu9a.06BWsjVDGScaWZDna2OSqkJyc1WH.Wy','ashraf.nazif@sunrise-resorts.com','Ashraf Nazif','40084-ashraf-nazif.png',5,3,1,0,NULL,NULL,NULL,NULL,NULL,'41.178.12.82','2015-01-10 08:47:59','0000-00-00 00:00:00','2015-02-19 15:11:47',0),(115,115,0,'refaat.aboubakr','$2a$08$XBHDqCKpFz8CCAc8E0g3B.9tA.2y/Y1nJh22MKxkWJz3X2wAhHUqK','refaat.aboubakr@sunrise-resorts.com','Refaat Aboubakr','601db-refaat.jpg',6,8,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.252','2016-03-20 12:23:16','0000-00-00 00:00:00','2016-03-20 10:23:16',0),(116,116,0,'saad.rahim ','$2a$08$IVMs29J.QIt847.hA9UW2.2IDjRBLdepe2BQXEM8YOLi/8DQ2JvLm','saad.rahim@sunrise-resorts.com','saad.rahim ','0c850-saad.jpg',7,15,1,0,NULL,NULL,NULL,NULL,NULL,'41.65.31.105','2015-02-25 13:28:56','0000-00-00 00:00:00','2015-02-25 13:30:43',0),(117,117,0,'Ashraf.Elharizy','$2a$08$hqtKnTdqzlVINSdGV9D6x.GsG68ccBh4iWohxtNOXsITAX1ocWvKu','Ashraf.Elharizy@sunrise-resorts.com','Ashraf Elharizy','48e92-111111.jpg',7,6,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.253','2015-09-28 20:09:41','0000-00-00 00:00:00','2015-09-28 18:09:41',0),(119,119,0,'mohamed.gaber','$2a$08$uMTKess1y5.yOGh1/Sl0iu1lspntOfIWtlDN/DJhNhbq96wMzJdsO','mohamed.gaber@sunrisegroup-eg.com','Mohamed Gaber','eb3f7-mgaber.png',15,19,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.251','2016-01-03 16:22:27','0000-00-00 00:00:00','2016-01-03 14:22:27',0),(121,121,0,'mostafa.elkheshen','$2a$08$uGNNEPw4X2TBZ7SFw1XuMu9sbjk1S93pCbZmeSpP6l14SjI4QoNpC','mostafa.elkheshen@sunrise-resorts.com','Mostafa Elkheshen',NULL,19,28,1,0,NULL,NULL,NULL,NULL,NULL,'192.168.211.19','2015-10-05 09:12:11','0000-00-00 00:00:00','2016-01-02 14:34:08',0),(122,122,0,'khaled.elsayed','$2a$08$I7ZErx9nER.STCFfLop54.mL5Z2xJvrwhtU5pkAPIL2GsZvqUei1G','ahmad.fawzy@sunrise-resorts.com','ahmad fawzy','57c68-untitled.jpg',7,4,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.251','2015-12-11 14:29:06','0000-00-00 00:00:00','2015-12-11 12:29:06',0),(123,123,0,'usama.saleh','$2a$08$l5Ir2jkJ5QwvHB3H4jpykON33YxYVycjBID9d2aC3YxzXIW54JaC.','usama.saleh!@sunrise-resorts.com','usama.saleh','8f996-usamaa.png',7,4,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.11.55','2016-02-08 13:28:45','0000-00-00 00:00:00','2016-02-08 11:28:45',0),(125,125,0,'mohamed.maghawry','$2a$08$MjEznRnzsTmSvwkMoRmCf.6Zt/gRBDXwCNauTU3Cj9rs2cYbhe..m','mohamed.maghawry@sunrise-resorts.com','Mohamed El Maghawry','a2a3f-mohamed.maghawry.jpg',7,4,1,0,NULL,NULL,NULL,NULL,NULL,'41.65.207.75','2015-04-14 14:45:18','0000-00-00 00:00:00','2015-04-14 14:45:18',0),(124,124,0,'hatem.diad','$2a$08$jEHYvnXq05/Wu6yGrfwDiu1/8U9i3l7yJzlPQ9eT6Sa7cSX8kwQlS','hatem.Diab@sunrise-resorts.com','Hatem Diad','2cc5b-bb.jpg',7,13,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.205','2015-11-29 11:27:28','0000-00-00 00:00:00','2015-11-29 09:27:28',0),(126,126,0,'rimon.farid','$2a$08$YCv3auHlwQ2fquhsv8DqK.5eqkrG430oCMVRnJ7mRs4HHuoMumfWu','rimon.farid@sunrise-resorts.com','Rimon Farid','a3df4-rimon.farid-security_manager.png',7,14,1,0,NULL,NULL,NULL,NULL,NULL,'41.65.207.75','2015-09-04 12:35:39','0000-00-00 00:00:00','2015-09-04 12:35:39',0),(133,133,0,'barsmanager.moh','$2a$08$mFvL/A9tWxOCd.HGqbdvs.f.IyQ78sN7t1iXH8cCxC4vYVBLp08CW','barsmanager.moh@sunrise-resorts.com','Ismail Ahmed','7c915-fb.png',7,7,1,0,NULL,NULL,NULL,NULL,NULL,'','0000-00-00 00:00:00','0000-00-00 00:00:00','2015-07-14 12:53:06',0),(134,134,0,'amr.beshady','$2a$08$PI.wMitLTBn/nOUm/Nmlsup2/m1WiX2zYkQcAM0pzs9wTeIfSHxWq','amr.beshady@sunrise-resorts.com','Amr Beshady','9d859-hk.png',7,12,1,0,NULL,NULL,NULL,NULL,NULL,'192.168.235.70','2015-11-10 18:29:53','0000-00-00 00:00:00','2015-11-10 16:29:53',0),(135,135,0,'ahmed.almasry','$2a$08$7JPKX6AGTElgCeGq11nELOpWu9okLCuGYC/gatFQ7qnj2k1b9XsP6','ahmed.almasry@sunrise-resorts.com','Ahmed Almasry','dae13-doc023.jpg',7,7,1,0,NULL,NULL,NULL,NULL,NULL,'192.168.237.82','2015-11-07 19:42:41','0000-00-00 00:00:00','2015-11-07 17:42:41',0),(136,136,0,'ahmed.shehata','$2a$08$Px/hEUhySSTNq6JRR55auOqduBn77UGxlwXBjKdurYHBJHrleWIp2','ahmed.shehata@sunrise-resorts.com ','Ahmed Shehata','79bbd-doc024.png',7,2,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.111','2016-02-18 10:05:42','0000-00-00 00:00:00','2016-02-18 08:05:42',0),(137,137,0,'khaled.saad','$2a$08$18.U5jSBPh9OAZaRx6zE.OdqxxnEM4LNagIfdosrypDvAzCANa2rO','khaled.saad@sunrise-resorts.com','Khaled Saad','24291-khaled_saad-gm.png',6,8,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.252','2016-03-17 08:30:28','0000-00-00 00:00:00','2016-03-17 06:30:28',0),(138,138,0,'abdalla.farouk','$2a$08$wMOFo73zcOuguixainQo1euHoglEmoEGGzWAu9tVeBNeR1O.y1zW2','abdalla.farouk@festival-resorts.com','abdalla.farouk','37294-new--signature.jpg',5,3,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.251','2016-03-01 16:40:11','0000-00-00 00:00:00','2016-03-01 14:40:11',0),(171,171,0,'m.shawky','$2a$08$/1/xXrhrBShCFOUQmpYgvehZ8.omGsuUqPhzEUmrVj1xg5yk7X.V6','mshawky@sunrisegroup-eg.com','Mohamed Shawky',NULL,9,3,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.251','2016-02-24 18:13:51','0000-00-00 00:00:00','2016-02-24 16:13:51',0),(139,139,0,'said.atiek-gm','$2a$08$usrRFiGJ7O5TllHXBObcCOUKULMKAifMFDysrECNopOBvltXnGAXm','Said.Atiek@sunrise-resorts.com','Said.Atiek','9e1ed-said.png',6,8,1,0,NULL,NULL,NULL,NULL,NULL,'192.168.210.10','2016-02-10 19:37:31','0000-00-00 00:00:00','2016-02-10 17:37:31',0),(140,140,0,'assem.elsayed','$2a$08$IySJxHf10ZQSzgvwIQlc3u1bWZRabW7aiyjYhodaDlnNnbw5qsa3W','assem.elsayed@sunrise-resorts.com','Assem Elsayed','b56c0-sign.png',7,4,1,0,NULL,NULL,NULL,NULL,NULL,'192.168.237.76','2016-03-06 12:14:42','0000-00-00 00:00:00','2016-03-06 10:14:42',0),(141,141,0,'Taha.Messed','$2a$08$k00y01wEtswdrhOa/D9.L.n3mb.cbD/EUzhYQjlEyYp96F8ZRWge6','Taha.Messed@sunrise-resorts.com','Taha Messed','27b94-taha.jpg',7,18,1,0,NULL,NULL,NULL,NULL,NULL,'192.168.210.10','2015-11-04 19:14:08','0000-00-00 00:00:00','2015-11-04 17:14:08',0),(144,144,0,'arecm.moh','$2a$08$7z1hYqaMmr.1k/IppjaP3OCCz9YYOCLP6smYjZWPUiqsYGL8LO6wi','arecm.moh@sunrise-resorts.com','Hassan Nour','d4add-hassan.jpg',7,13,1,0,NULL,NULL,NULL,NULL,NULL,'192.168.237.75','2015-11-24 08:09:44','0000-00-00 00:00:00','2015-11-24 06:09:44',0),(143,143,0,'Hossam.Okasha','$2a$08$iNQrmXBie8AQBm0T1Eewcu7d0Dt2nmMU9kkVWmKwUM6iWsr0pSHgO','Hossam.Okasha@sunrise-resorts.com','Hossam Okasha','abc82-hossam.jpg',7,13,1,0,NULL,NULL,NULL,NULL,NULL,'192.168.210.10','2015-11-05 12:21:14','0000-00-00 00:00:00','2015-11-05 10:21:14',0),(145,145,0,'ashraf.lotfy','$2a$08$Wkp7vKduA0noqpW5XBUaY.xwfLJDYYdtbxuUtS7I8I28jhSmSPGzK','Ashraf.Lotfy@sunrise-resorts.com','Ashraf Lotfy','bb545-ashraf-lotfy.jpg',7,15,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.252','2015-11-12 18:50:49','0000-00-00 00:00:00','2015-11-12 16:51:32',0),(146,146,0,'tarek.elbadry','$2a$08$o93GV3YHquqJ4URQaTlj4uxfxlDoQoDw.MzkN1FnQiSU0BGBTQ.Ja','tarek.elbadry@sunrise-resorts.com','Tarek EL Badry','d0634-tarek.jpg',6,8,1,0,NULL,NULL,NULL,NULL,NULL,'10.20.20.11','2016-03-20 09:35:23','0000-00-00 00:00:00','2016-03-20 07:35:23',0),(147,147,0,'ahmed.lela','$2a$08$za5mVkyERyjhtAlWULl25usTADI2iZeJpWLpcmCVCYcVVwZOZvFH2','events.manager@sunrise-resorts.com','ahmed.laila','7d715-ahmed1.jpg',6,8,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.251','2015-12-06 16:29:32','0000-00-00 00:00:00','2015-12-06 14:29:32',0),(148,148,0,'haytham.farag','$2a$08$YXLV7WyOY31e88GKwmgkse6XhNWHA0csrJxkrnw0p/v46HdfAGQUa','haytham.farag@sunrise-resorts.com','Haytham Farag','2b7a0-img-y07122505-0001.jpg',7,4,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.251','2015-12-09 11:40:07','0000-00-00 00:00:00','2015-12-28 08:33:44',0),(149,149,0,'saad.hamed','$2a$08$hrRvOiyDjGaPb3hZZ0g7YeL26kfLY5AbSphV.UK3hHQb8Jg1b5nSm','saad.hamed@sunrise-resorts.com','Saad Hamed',NULL,7,4,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.251','2016-02-22 10:43:44','0000-00-00 00:00:00','2016-02-22 08:43:44',0),(150,150,0,'viewer','$2a$08$N0aXJ.jRK58P5CF/OIOyquh.ZnmChdFYI93Kpt/SlD9xu30dNdUZ.','mzohairy@sunrisegroup-eg.com','Cairo Office',NULL,0,19,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.252','2016-03-20 14:30:13','0000-00-00 00:00:00','2016-03-20 12:30:13',0),(151,151,1,'abbas.elshabasy','$2a$08$E9Q9XhcIa7mS7fHzgx4MU.3Twqc4Nop5bYiVoVUNRNTcGXnrJfRty','abbas.elshabasy@sunrise-resorts.com','Abbas El Shabasy',NULL,18,2,1,0,NULL,NULL,NULL,NULL,NULL,'','0000-00-00 00:00:00','0000-00-00 00:00:00','2016-01-18 11:20:29',0),(152,152,0,'Purchasing.gb-mp','$2a$08$pKYSwyjAefkDs7Dve594y.HVfjFNiS1BYDp4pg0Li7lBDTnU2iQ1G','Purchasing.gb-mp@sunrise-resorts.com','Purchasing GB & MP',NULL,21,28,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.14.38','2016-03-05 12:55:47','0000-00-00 00:00:00','2016-03-05 10:55:47',0),(153,153,0,'Pur-cbh','$2a$08$QwrEPlutRHljQ6jGOTgc2.WG43W0KCDhvM0ayDXMLHZvbCpKccGNu','Pur-cbh@sunrise-resorts.com','Purchasing CB',NULL,21,28,1,0,NULL,NULL,NULL,NULL,NULL,'','0000-00-00 00:00:00','0000-00-00 00:00:00','2016-01-05 12:55:33',0),(154,154,0,'purchasing.fes','$2a$08$u17NqoJ4dksCgEML/oAitewqbk.lzMv1D2eX1rupKwcwy9f/O7BpG','purchasing@festival-resorts.com','Purchasing LJ & RV',NULL,21,28,1,0,NULL,NULL,NULL,NULL,NULL,'','0000-00-00 00:00:00','0000-00-00 00:00:00','2016-01-05 12:55:22',0),(155,155,0,'Purchasing.hoh','$2a$08$EnMjn/fGOXVNO.C2M2XT5uAJ9uQO4Qy6HQ3zH2hqoR8eClThYw74G','Purchasing.hoh@sunrise-resorts.com','Purchasing HO',NULL,21,28,1,0,NULL,NULL,NULL,NULL,NULL,'','0000-00-00 00:00:00','0000-00-00 00:00:00','2016-01-05 12:55:08',0),(156,156,0,'Purchasing.rmh','$2a$08$xuIc2T3IwCIhCRuI9MxJvuPs0nSOtYM8EJx9DW.EEE5NSQWSoXOna','Purchasing.rmh@sunrise-resorts.com','Purchasing RM',NULL,21,28,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.251','2016-03-09 12:12:16','0000-00-00 00:00:00','2016-03-09 10:12:16',0),(157,157,0,'Purchasing.shh','$2a$08$nfTlL2eBTmiJcLLW7iBM8ebbbLsvuSaFkO2/NWVX6gY.mh9TWwovS','Purchasing.shh@festival-resorts.com','Purchasing SH',NULL,21,28,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.251','2016-03-14 13:41:04','0000-00-00 00:00:00','2016-03-14 11:41:04',0),(158,158,0,'​Zakaria.rabea','$2a$08$eRkkaxPiyZYMbpZ7NJkBt.Xa56JGHLjK7mbx1eSbJcR9ydilXf/6G','Zakaria.rabea@sunrise-resorts.com','Zakaria Rabea',NULL,21,28,1,0,NULL,NULL,NULL,NULL,NULL,'','0000-00-00 00:00:00','0000-00-00 00:00:00','2016-01-05 12:54:25',0),(159,159,0,'Tarek.khaled','$2a$08$/1g0/winKVWWTyeaxE3f/uy.YS7s7O90wza89g/.kUwG5iMcxYBkm','Tarek.khaled@sunrise-resorts.com','Tarek Khaled',NULL,21,28,1,0,NULL,NULL,NULL,NULL,NULL,'','0000-00-00 00:00:00','0000-00-00 00:00:00','2016-01-05 12:54:04',0),(160,160,0,'Yasser.shaker','$2a$08$1c0To4g6Ff7tMvHc8W18Eetw2a9g6HcDc0UNDY9q8W0wIE6xuvDF.','Yasser.shaker@sunrise-resorts.com','Yasser Shaker',NULL,21,28,1,0,NULL,NULL,NULL,NULL,NULL,'','0000-00-00 00:00:00','0000-00-00 00:00:00','2016-01-05 12:53:46',0),(161,161,0,'nahla.elebiary','$2a$08$DtEJWI/r4Zt/aypiyC1e3eB41Jo0h3obWy3.lzcI/FyRXIT74rxKK','nelebiary@madaar.com','Nahla.EL Ebiary',NULL,7,4,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.251','2016-02-25 14:54:54','0000-00-00 00:00:00','2016-03-14 11:14:51',0),(162,162,0,'gaser.bahgat','$2a$08$1mXXhXbVlb4I8KzFWFZHbeiPxyBAMtAgM.LIE6JGtGb11WJOWcu0S','gbahgat@madaar.com','Gaser.Bahgat',NULL,6,8,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.13.1','2016-01-03 16:05:49','0000-00-00 00:00:00','2016-01-03 14:05:49',0),(163,163,0,'haytham.zahran','$2a$08$CRLy1rD3EYntwu4RBxmnueO0IgEhwn0969dunsK3Pn0MDcaW.pACu','hzahran@madaar.com','Haytham Zahran',NULL,5,3,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.13.1','2016-01-03 16:06:19','0000-00-00 00:00:00','2016-01-03 14:06:19',0),(164,164,0,'hamada.salem','$2a$08$tnXmOjN59pBW4PRVHaPu1OFwEGwKVphQmhjQSHKcDs8KvsWtQjMwS','hamada.salem@sunrise-resorts.com','Hamada Salem',NULL,5,3,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.251','2016-02-25 14:10:31','0000-00-00 00:00:00','2016-02-25 12:10:31',0),(165,165,0,'nadine','$2a$08$PRrJtRxZC2QCEC71r.8USO5hSV.j42SomLmsJr/KzPrpEhGXAxu/W','nadine@blueskyinvestment.net','Eng Nadine',NULL,26,19,1,0,NULL,'0d02c5ef51f873412b5a8d9dfa5d3022','2016-03-17 15:23:30',NULL,NULL,'172.50.10.251','2016-02-02 11:09:54','0000-00-00 00:00:00','2016-03-17 13:23:30',0),(166,166,0,'hesham.elshaer','$2a$08$/fgGrGP72OYrpQEMmaUoYOHRRTgSxoyzl.MypQZRJe6USRm2iEWFS','hesham@blueskyinvestment.net','Hesham El shaer',NULL,27,19,1,0,NULL,NULL,NULL,NULL,NULL,'10.20.20.11','2016-03-17 12:36:10','0000-00-00 00:00:00','2016-03-17 10:36:10',0),(167,167,0,'atef.halawa','$2a$08$Bhk48/kYVI7Tocl52C0ka.CrGi3dmWui5cq.7JrshqmSXEQpW5XAy','atef@blueskyinvestment.net','Atef Halawa',NULL,24,19,1,0,NULL,NULL,NULL,NULL,NULL,'10.20.20.11','2016-03-18 11:00:05','0000-00-00 00:00:00','2016-03-18 09:00:05',0),(168,168,0,'sayed.maksoud','$2a$08$uUKN5.xGLAWgInDH82vmq.2HtMfymIHOsosx9VNczkS6xBpcpImgS','sayed@blueskyinvestment.net','Sayed A. Maksoud',NULL,25,19,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.252','2016-03-17 14:58:05','0000-00-00 00:00:00','2016-03-17 12:58:05',0),(169,169,0,'nahla.ebiary','$2a$08$Jolu.SIkmp5EAck33LG8bORzTni/c2ZqCtoEht/ESw.Qwzjb6ROqy','nelebiary@madaar.comm','Nahla El Ebiary',NULL,23,19,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.251','2016-02-28 11:01:03','0000-00-00 00:00:00','2016-03-14 09:37:30',0),(170,170,0,'ahmed.fawzy.cb','$2a$08$iXW1WfTgvBxKDdEKu4ozRu3FVnjNtj2C/evytPYWB4P7U.vmIsZf.','ahmed.fawzy@sunrise-resorts.com','',NULL,7,6,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.205','2016-02-08 14:52:59','0000-00-00 00:00:00','2016-02-08 12:52:59',0),(172,172,0,'waleed.farouk','$2a$08$dT1zjPP61Hf0T12gwHNZzuzFH26jWW1OYg9CmYXBMYkEPJmjiUVs6','waleed.farouk@sunrise-resorts.com','Waleed Farouk',NULL,8,3,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.10.251','2016-02-27 10:09:57','0000-00-00 00:00:00','2016-02-27 08:09:57',0),(173,173,0,'hany.arafat','$2a$08$F2gsKD55wZFsudgMy6XbHOIi6Y7bYY7j6BCkWrDfNSECF76.BAij.','harafat@madaar.com','Hany Arafat',NULL,28,19,1,0,NULL,NULL,NULL,NULL,NULL,'','0000-00-00 00:00:00','0000-00-00 00:00:00','2016-02-29 14:49:27',0),(174,174,0,'soliman.ashour','$2a$08$tJNNHCgW.LLI2RzGpGCXruvKY1CizOByeAzRFuYC7Eizd4msd892K','soliman.ashour@sunrise-resorts.com','Soliman Ashour',NULL,6,4,1,0,NULL,NULL,NULL,NULL,NULL,'172.50.13.1','2016-03-02 09:44:30','0000-00-00 00:00:00','2016-03-02 07:44:30',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_groups` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-20 17:11:10
