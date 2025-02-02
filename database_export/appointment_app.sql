-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 16, 2023 at 03:16 AM
-- Server version: 8.0.31
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `appointment_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointment_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `service_id` int DEFAULT NULL,
  `appointment_time` datetime NOT NULL,
  `status` enum('scheduled','completed','cancelled') COLLATE utf8mb4_general_ci NOT NULL,
  `notes` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `user_id`, `service_id`, `appointment_time`, `status`, `notes`, `created_at`) VALUES
(1, 1, 1, '2023-11-15 09:00:00', 'scheduled', 'First-time consultation', '2023-11-09 04:19:21'),
(2, 1, 2, '2023-11-20 10:00:00', 'scheduled', 'Routine dental checkup', '2023-11-09 04:19:21'),
(3, 2, 3, '2023-11-16 14:00:00', 'scheduled', 'Annual eye examination', '2023-11-09 04:19:21'),
(4, 2, 1, '2023-11-22 13:00:00', 'cancelled', 'Reschedule next available slot', '2023-11-09 04:19:21'),
(5, 3, 1, '2023-11-18 11:00:00', 'completed', 'General checkup completed', '2023-11-09 04:19:21'),
(6, 1, 2, '2023-11-08 12:02:00', 'scheduled', 'test', '2023-11-13 01:44:05'),
(10, NULL, NULL, '2023-11-08 02:01:00', 'scheduled', 'test', '2023-11-15 22:08:48');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int NOT NULL,
  `service_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `duration` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`service_id`, `service_name`, `description`, `duration`, `created_at`) VALUES
(1, 'General Consultation', 'A general consultation with our staff.', 30, '2023-11-09 04:19:21'),
(2, 'Dental Checkup', 'Comprehensive dental examination and cleaning.', 60, '2023-11-09 04:19:21'),
(3, 'Eye Exam', 'Standard eye examination and vision test.', 45, '2023-11-09 04:19:21'),
(4, 'Orthodontics Consultation', 'Orthodontic treatment planning and consultation.', 45, '2023-11-09 04:19:42'),
(5, 'Root Canal Treatment', 'Root canal therapy for infected pulp.', 90, '2023-11-09 04:19:42'),
(6, 'Teeth Whitening', 'Cosmetic dental treatment to whiten teeth.', 30, '2023-11-09 04:19:42'),
(7, 'Braces Adjustment', 'Regular braces adjustment and checkup.', 30, '2023-11-09 04:19:42'),
(8, 'Crown Fitting', 'Placement of a dental crown on a tooth.', 60, '2023-11-09 04:19:42'),
(9, 'Wisdom Tooth Extraction', 'Surgical removal of an impacted wisdom tooth.', 60, '2023-11-09 04:19:42'),
(10, 'Dental Implant', 'Surgical procedure to replace missing teeth.', 120, '2023-11-09 04:19:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_type` enum('admin','staff','client') COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `email`, `user_type`, `created_at`) VALUES
(1, 'john_doe', 'hashed_password', 'john@example.com', 'client', '2023-11-09 04:19:20'),
(2, 'jane_smith', 'hashed_password', 'jane@example.com', 'client', '2023-11-09 04:19:20'),
(3, 'admin_user', 'hashed_password', 'admin@example.com', 'admin', '2023-11-09 04:19:20'),
(4, 'alice_wonder', 'hashed_password', 'alice@example.com', 'client', '2023-11-09 04:19:42'),
(5, 'bob_builder', 'hashed_password', 'bob@example.com', 'staff', '2023-11-09 04:19:42'),
(6, 'charlie_brown', 'hashed_password', 'charlie@example.com', 'client', '2023-11-09 04:19:42'),
(7, 'diana_prince', 'hashed_password', 'diana@example.com', 'staff', '2023-11-09 04:19:42'),
(8, 'edward_scissor', 'hashed_password', 'edward@example.com', 'client', '2023-11-09 04:19:42'),
(9, 'fiona_fantasy', 'hashed_password', 'fiona@example.com', 'client', '2023-11-09 04:19:42'),
(10, 'george_giant', 'hashed_password', 'george@example.com', 'admin', '2023-11-09 04:19:42'),
(11, 'ryan', '$2y$10$nllJ8LGHS14kgjwZuV5Xw.XlNaF1i9v7hgSbo9qZNVIYjOGw7yczq', NULL, 'admin', '2023-11-15 22:13:00'),
(13, 'asdasdasd', '$2y$10$yTlrx60CGkPLoX4i4nMll.4ViA1qzl4FDU1V1GT0eu.BxUNbvILzK', NULL, 'admin', '2023-11-15 22:43:21'),
(14, 'testuser', '$2y$10$.yAwVTShHsETmDPjDjdDBOOlLAeglOWe574wNTJG3nyRq7X4sxEeO', NULL, 'admin', '2023-11-15 22:52:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointment_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
