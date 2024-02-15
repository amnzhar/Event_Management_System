-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2024 at 06:00 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `event_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `audience`
--

CREATE TABLE `audience` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `contact` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `event_id` int(30) NOT NULL,
  `payment_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0= pending, 1 =Paid',
  `attendance_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1= present',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = for verification,  1 = confirmed,2= declined',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audience`
--

INSERT INTO `audience` (`id`, `name`, `contact`, `email`, `address`, `event_id`, `payment_status`, `attendance_status`, `status`, `date_created`) VALUES
(2, 'George Wilson', '+18456-5455-55', 'gwilson@sample.com', 'Sample', 1, 1, 0, 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(30) NOT NULL,
  `venue_id` int(30) NOT NULL,
  `event` text NOT NULL,
  `description` text NOT NULL,
  `schedule` datetime NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Public, 2-Private',
  `audience_capacity` int(30) NOT NULL,
  `payment_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Free,payable',
  `amount` double NOT NULL DEFAULT 0,
  `banner` text NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `venue_id`, `event`, `description`, `schedule`, `type`, `audience_capacity`, `payment_type`, `amount`, `banner`, `date_created`) VALUES
(4, 14, 'To All The March Boys: P.S I Still Love You', '&lt;p&gt;To All The March Boys: P.S I Still Love You&lt;/p&gt;&lt;p&gt;&mdash; RIIZE Eunseok Wonbin Anton Birthday Cupsleeve Event 𐙚&lt;/p&gt;&lt;p&gt;❝ It&rsquo;s either the swimmer guy, the guitarist or that basketball dude ❞&lt;/p&gt;', '2024-03-03 11:00:00', 1, 0, 2, 0, '1707957060_photo_2024-02-13_16-09-34.jpg', '0000-00-00 00:00:00'),
(5, 14, 'TWS DEBUT DAY', '&lt;p&gt;In celebration of @TWS_PLEDIS debut, we are organizing a week-long of cupsleeve event in KL!&lt;/p&gt;&lt;p&gt;Join us for the fun and stand a chance to win SPARKLING BLUE sealed album!&lt;/p&gt;', '2024-02-24 10:00:00', 1, 0, 2, 0, '1707957840_photo_2024-02-13_16-10-20.jpg', '0000-00-00 00:00:00'),
(6, 14, 'Love Again With Jisung', '&lt;p&gt;𝟤𝟢𝟤𝟦 𝖩𝖨𝖲𝖴𝖭𝖦 𝖡𝖨𝖱𝖳𝖧𝖣𝖠𝖸 𝖢𝖠𝖥𝖤 𝖤𝖵𝖤𝖭𝖳 𝖨𝖭 𝖬𝖠𝖫𝖠𝖸𝖲𝖨𝖠&lt;/p&gt;&lt;p&gt;&rsquo; 𝖫𝗈𝗏𝖾 𝖠𝗀𝖺𝗂𝗇 𝗐𝗂𝗍𝗁 𝐈𝐋𝐉𝐒-𝐏♡&rsquo;&lt;/p&gt;&lt;p&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 🐹🐥🛸🎧✋🏻&lt;/p&gt;', '2023-02-04 11:00:00', 1, 0, 2, 0, '1707958020_photo_2024-02-13_16-11-15.jpg', '0000-00-00 00:00:00'),
(7, 14, 'SOPA Star JUNGHWANDROUS Day', '&lt;p&gt;✮⋆˙SOPA Star JUNGHWANDROUS Day˙⋆✮&lt;/p&gt;&lt;p&gt;You&rsquo;re warmly invited to TREASURE So Junghwan&amp;#x2019;s Birthday &amp;amp; Graduation Cafe Event in Kuala Lumpur&lt;/p&gt;&lt;p&gt;📍DOUTOR COFFEE, Lalaport&lt;/p&gt;', '2024-02-18 12:00:00', 1, 0, 2, 0, '1707960360_photo_2024-02-13_16-12-52.jpg', '0000-00-00 00:00:00'),
(8, 14, 'StarBoy Wonbin Day', '&lt;p&gt;&mdash; 𝚂𝚝𝚊𝚛𝙱𝚘𝚢 𝚆𝚘𝚗𝚋𝚒𝚗 𝙳𝚊𝚢&amp;nbsp;&lt;/p&gt;&lt;p&gt;presenting Wonbin of RIIZE cupsleeve event in KL;&lt;/p&gt;&lt;p&gt;✩ 𝓣𝓱𝓮 𝓡𝓲𝓼𝓲𝓷𝓰 𝓢𝓽𝓪𝓻 𝓟𝓪𝓻𝓴 𝓦𝓸𝓷𝓫𝓲𝓷 ~&lt;/p&gt;&lt;p&gt;𝓦𝓱𝓮𝓷 𝓣𝓱𝓮 𝓢𝓽𝓪𝓻 𝔀𝓪𝓼 𝓑𝓸𝓻𝓷 ✩&lt;/p&gt;&lt;p&gt;📍 The Bao Guys @ BookXcess, Lalaport KL&lt;/p&gt;', '2024-03-02 12:00:00', 1, 0, 2, 0, '1707969360_photo_2024-02-15_06-26-20.jpg', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'CupSleeve Event Management Online Portal', 'info@sample.comm', '+6948 8542 623', '1602641160_JSAV-multiscreen_3ddbdd40-38d9-4b64-9cf2-5d0ef356f29c.jpg', '&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-weight: 400; text-align: justify;&quot;&gt;&amp;nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&rsquo;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=Admin,2=Staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1, 'Wonder Glacé', 'wonderglace', '0192023a7bbd73250516f069df18b500', 1);

-- --------------------------------------------------------

--
-- Table structure for table `venue`
--

CREATE TABLE `venue` (
  `id` int(30) NOT NULL,
  `venue` text NOT NULL,
  `address` text NOT NULL,
  `description` text NOT NULL,
  `rate` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `venue`
--

INSERT INTO `venue` (`id`, `venue`, `address`, `description`, `rate`) VALUES
(1, 'Johor', 'Sample Address', 'Location', 0),
(2, 'Kedah', 'Sample', 'Location', 0),
(3, 'Kelantan', 'Sample Address', 'Location', 0),
(4, 'Melaka', 'Sample only', 'Location', 0),
(5, 'Negeri Sembilan', 'Sample Address', 'Location', 0),
(6, 'Pahang', 'Sample', 'Location', 0),
(7, 'Perak', 'Sample Address', 'Location', 0),
(8, 'Perlis', 'Sample only', 'Location', 0),
(9, 'Pulau Pinang', 'Sample Address', 'Location', 0),
(10, 'Sabah', 'Sample only', 'Location', 0),
(11, 'Sarawak', 'Sample Address', 'Location', 0),
(12, 'Selangor', 'Sample', 'Location', 0),
(13, 'Terengganu', 'Sample Address', 'Location', 0),
(14, 'Kuala Lumpur', 'Sample only', 'Location', 0);

-- --------------------------------------------------------

--
-- Table structure for table `venue_booking`
--

CREATE TABLE `venue_booking` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `venue_id` int(30) NOT NULL,
  `duration` varchar(100) NOT NULL,
  `datetime` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0-for verification,1=confirmed,2=canceled'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `venue_booking`
--

INSERT INTO `venue_booking` (`id`, `name`, `address`, `email`, `contact`, `venue_id`, `duration`, `datetime`, `status`) VALUES
(1, 'John Smith', 'Sample', 'asdasd@gmail.com', '+18456-5455-55', 2, '1 night', '2020-10-14 17:00:00', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audience`
--
ALTER TABLE `audience`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `venue`
--
ALTER TABLE `venue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `venue_booking`
--
ALTER TABLE `venue_booking`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audience`
--
ALTER TABLE `audience`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `venue`
--
ALTER TABLE `venue`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `venue_booking`
--
ALTER TABLE `venue_booking`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
