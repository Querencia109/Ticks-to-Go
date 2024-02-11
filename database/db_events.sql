-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2023 at 06:42 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_events`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bookings`
--

CREATE TABLE `tbl_bookings` (
  `book_id` varchar(20) NOT NULL,
  `ticket_id` varchar(30) NOT NULL,
  `stage_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `s_id` int(11) NOT NULL,
  `screen_id` int(11) NOT NULL,
  `no_seats` int(3) NOT NULL COMMENT 'number of seats',
  `amount` int(5) NOT NULL,
  `ticket_date` date NOT NULL,
  `date` date NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_bookings`
--

INSERT INTO `tbl_bookings` (`book_id`, `ticket_id`, `stage_id`, `user_id`, `s_id`, `screen_id`, `no_seats`, `amount`, `ticket_date`, `date`, `status`) VALUES
('BKID3444322', 'TICKID5433864', 16, 2, 13, 12, 1, 350, '2025-08-25', '2023-06-27', 1),
('BKID5696723', 'TICKID4021396', 16, 2, 13, 12, 1, 350, '2025-08-25', '2023-06-26', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_events`
--

CREATE TABLE `tbl_events` (
  `event_id` int(11) NOT NULL,
  `stage_id` int(11) NOT NULL,
  `event_name` varchar(100) NOT NULL,
  `headline` varchar(200) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `event_date` date NOT NULL,
  `image` varchar(200) NOT NULL,
  `status` int(1) NOT NULL COMMENT '0 means active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_events`
--

INSERT INTO `tbl_events` (`event_id`, `stage_id`, `event_name`, `headline`, `description`, `event_date`, `image`, `status`) VALUES
(1, 3, 'Testing', 'OPM TESTING KIT', 'Test description muna dito', '2023-08-10', 'images/testimage.jpg', 0),
(2, 15, 'Twice 5th World Tour', 'Twice 5th World Tour: Ready To Be', 'Twice coming to the Philippine Arena', '2023-10-01', 'images\\twicertb.jpg', 0),
(3, 16, 'Red Velvet: 3rd Concert', 'Red Velvet: La Rouge', 'Red Velvet\'s 3rd concert here in Seoul, South Korea', '2025-08-25', 'images\\redvelvetlr.jpg\r\n', 0),
(4, 14, 'Blackpink World Tour', 'Blackpink Post-it-Girl', 'Random description', '2023-05-15', 'images\\blackpinkpg.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_news`
--

CREATE TABLE `tbl_news` (
  `news_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `news_date` date NOT NULL,
  `description` varchar(200) NOT NULL,
  `attachment` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_news`
--

INSERT INTO `tbl_news` (`news_id`, `name`, `news_date`, `description`, `attachment`) VALUES
(1, 'Twice member Tzuyu Getting Married!!', '2024-06-20', 'Tzuyu has been sighted with a suspicious ring with an ornate gem on top.', 'images\\tzuyumarried.jpg'),
(2, 'Black Pink Member Lisa Gives Support to Trans Activist', '2024-08-08', 'Lisa has been giving her voice for the past few months to the support of trans rights.', 'images\\lisatransactivist.jpg'),
(3, 'Red Velvet Bae Irene Get Internet Criticism with Relationship Age Gap', '2024-09-24', 'Bae Irene a 32-year-old has been reported to be with Carl Stephen a 25-year Filipino.', 'images\\baeagegap.jpg'),
(4, 'Black Pink Roseanne Park wow Red Carpet with New Dress', '2024-10-15', 'Black Pink’s Roseanne Park wears a new dress she has seen from a fashion show in Seoul.', 'images\\roseannenewdress.jpg'),
(5, 'Red Velvet Yeri potted to Participating in A Nature Preserve', '2024-10-26', 'Red Velvet Yeri seen feeding some protected animals and helping with the preservation of the facilities.', 'images\\yerinature.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_registration`
--

CREATE TABLE `tbl_registration` (
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `age` int(2) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `totalAmount` decimal(8,2) NOT NULL,
  `lastUpdate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_registration`
--

INSERT INTO `tbl_registration` (`user_id`, `name`, `email`, `phone`, `age`, `gender`, `totalAmount`, `lastUpdate`) VALUES
(1, 'EJ', 'ejexample@gmail.com', '+639666804411', 21, 'Male', 1110.00, '2023-06-26 14:44:14'),
(2, 'Darren Matthew Flores', 'floresd@gmail.com', '+639515060711', 25, 'Others', 400.00, '2023-06-26 16:35:30');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_screens`
--

CREATE TABLE `tbl_screens` (
  `screen_id` int(11) NOT NULL,
  `stage_id` int(11) NOT NULL,
  `screen_name` varchar(110) NOT NULL,
  `seats` int(11) NOT NULL COMMENT 'number of seats',
  `charge` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_screens`
--

INSERT INTO `tbl_screens` (`screen_id`, `stage_id`, `screen_name`, `seats`, `charge`) VALUES
(5, 3, ' 1', 50, 70),
(6, 3, '2', 15, 60),
(7, 4, '3', 20, 75),
(8, 14, '4', 34, 120),
(9, 3, '5', 30, 70),
(11, 15, '6', 50, 350),
(12, 16, '1', 100, 350),
(13, 14, '7', 200, 500);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shows`
--

CREATE TABLE `tbl_shows` (
  `s_id` int(11) NOT NULL,
  `st_id` int(11) NOT NULL COMMENT 'show time id',
  `stage_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `status` int(11) NOT NULL COMMENT '1 means show available',
  `r_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_shows`
--

INSERT INTO `tbl_shows` (`s_id`, `st_id`, `stage_id`, `event_id`, `start_date`, `status`, `r_status`) VALUES
(10, 1, 3, 1, '2018-05-01', 1, 1),
(12, 6, 15, 2, '2023-10-01', 1, 1),
(13, 7, 16, 3, '2025-08-25', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_show_time`
--

CREATE TABLE `tbl_show_time` (
  `st_id` int(11) NOT NULL,
  `screen_id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL COMMENT 'rock band etc',
  `start_time` time NOT NULL,
  `date_show` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_show_time`
--

INSERT INTO `tbl_show_time` (`st_id`, `screen_id`, `name`, `start_time`, `date_show`) VALUES
(1, 5, 'Sport', '12:00:00', '2018-07-01'),
(6, 11, 'Kpop Band', '19:20:00', '2023-10-01'),
(7, 12, 'Kpop Band', '20:00:00', '2025-08-25'),
(8, 13, 'Kpop Band', '19:00:00', '2023-05-15');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stage`
--

CREATE TABLE `tbl_stage` (
  `stage_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL,
  `country` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_stage`
--

INSERT INTO `tbl_stage` (`stage_id`, `name`, `city`, `province`, `country`) VALUES
(3, 'SM Mall of Asia', 'Pasay', 'Metro Manila', 'Philippines'),
(4, 'Filoil Flying V Centre', 'San Juan', 'Metro Manila', 'Philippines'),
(14, 'Araneta Coliseum', 'Quezon', 'Metro Manila', 'Philippines'),
(15, 'Philippine Arena', 'Bocaue', 'Bulacan', 'Philippines'),
(16, 'Korea University Hwajeong Gymnasium', 'Seongbuk-gu', 'Seoul', 'South Korea');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL COMMENT 'email',
  `password` varchar(50) NOT NULL,
  `user_type` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `username`, `password`, `user_type`) VALUES
(1, 'ejexample@gmail.com', 'example123', 0),
(2, 'floresd@gmail.com', 'examplelang123', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_bookings`
--
ALTER TABLE `tbl_bookings`
  ADD PRIMARY KEY (`book_id`),
  ADD UNIQUE KEY `ticket_id` (`ticket_id`),
  ADD KEY `stage_id` (`stage_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `s_id` (`s_id`),
  ADD KEY `screen_id` (`screen_id`);

--
-- Indexes for table `tbl_events`
--
ALTER TABLE `tbl_events`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `stage_id` (`stage_id`);

--
-- Indexes for table `tbl_news`
--
ALTER TABLE `tbl_news`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `tbl_registration`
--
ALTER TABLE `tbl_registration`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tbl_screens`
--
ALTER TABLE `tbl_screens`
  ADD PRIMARY KEY (`screen_id`),
  ADD KEY `stage_id` (`stage_id`);

--
-- Indexes for table `tbl_shows`
--
ALTER TABLE `tbl_shows`
  ADD PRIMARY KEY (`s_id`),
  ADD KEY `st_id` (`st_id`),
  ADD KEY `stage_id` (`stage_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `tbl_show_time`
--
ALTER TABLE `tbl_show_time`
  ADD PRIMARY KEY (`st_id`),
  ADD KEY `screen_id` (`screen_id`);

--
-- Indexes for table `tbl_stage`
--
ALTER TABLE `tbl_stage`
  ADD PRIMARY KEY (`stage_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_events`
--
ALTER TABLE `tbl_events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_news`
--
ALTER TABLE `tbl_news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_registration`
--
ALTER TABLE `tbl_registration`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_screens`
--
ALTER TABLE `tbl_screens`
  MODIFY `screen_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_shows`
--
ALTER TABLE `tbl_shows`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_show_time`
--
ALTER TABLE `tbl_show_time`
  MODIFY `st_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_stage`
--
ALTER TABLE `tbl_stage`
  MODIFY `stage_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_bookings`
--
ALTER TABLE `tbl_bookings`
  ADD CONSTRAINT `tbl_bookings_ibfk_1` FOREIGN KEY (`stage_id`) REFERENCES `tbl_stage` (`stage_id`),
  ADD CONSTRAINT `tbl_bookings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`user_id`),
  ADD CONSTRAINT `tbl_bookings_ibfk_3` FOREIGN KEY (`s_id`) REFERENCES `tbl_shows` (`s_id`),
  ADD CONSTRAINT `tbl_bookings_ibfk_4` FOREIGN KEY (`screen_id`) REFERENCES `tbl_screens` (`screen_id`);

--
-- Constraints for table `tbl_events`
--
ALTER TABLE `tbl_events`
  ADD CONSTRAINT `tbl_events_ibfk_1` FOREIGN KEY (`stage_id`) REFERENCES `tbl_stage` (`stage_id`);

--
-- Constraints for table `tbl_screens`
--
ALTER TABLE `tbl_screens`
  ADD CONSTRAINT `tbl_screens_ibfk_1` FOREIGN KEY (`stage_id`) REFERENCES `tbl_stage` (`stage_id`);

--
-- Constraints for table `tbl_shows`
--
ALTER TABLE `tbl_shows`
  ADD CONSTRAINT `tbl_shows_ibfk_1` FOREIGN KEY (`st_id`) REFERENCES `tbl_show_time` (`st_id`),
  ADD CONSTRAINT `tbl_shows_ibfk_2` FOREIGN KEY (`stage_id`) REFERENCES `tbl_stage` (`stage_id`),
  ADD CONSTRAINT `tbl_shows_ibfk_3` FOREIGN KEY (`event_id`) REFERENCES `tbl_events` (`event_id`);

--
-- Constraints for table `tbl_show_time`
--
ALTER TABLE `tbl_show_time`
  ADD CONSTRAINT `tbl_show_time_ibfk_1` FOREIGN KEY (`screen_id`) REFERENCES `tbl_screens` (`screen_id`);

--
-- Constraints for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD CONSTRAINT `tbl_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_registration` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
