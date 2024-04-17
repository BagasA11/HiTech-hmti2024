-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2024 at 04:27 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `golang-gsc2024`
--

-- --------------------------------------------------------

--
-- Table structure for table `blacklist_tokens`
--

CREATE TABLE `blacklist_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `token` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blacklist_tokens`
--

INSERT INTO `blacklist_tokens` (`id`, `created_at`, `updated_at`, `deleted_at`, `token`) VALUES
(1, '2024-02-15 22:00:52.359', '2024-02-15 22:00:52.359', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJ1c2VyRmlrdGlmMSIsInRva2VuVHlwZSI6InVzZXIiLCJleHAiOjE3MDgwMTEwMTd9.iZPS7jYglG8T9MW02B723Ps8Kr7PcgBvH2_B6F6U1B0');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `alphabet` varchar(1) NOT NULL,
  `text` varchar(200) NOT NULL,
  `color` varchar(30) NOT NULL DEFAULT 'white',
  `question_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `created_at`, `updated_at`, `deleted_at`, `alphabet`, `text`, `color`, `question_id`) VALUES
(1, '2024-02-19 16:33:23.808', '2024-02-19 16:33:23.808', NULL, 'A', 'Daging Unggas', 'white', 1),
(2, '2024-02-19 16:33:45.467', '2024-02-19 16:33:45.467', NULL, 'B', 'Bayam', 'Red', 1),
(3, '2024-02-19 16:34:03.679', '2024-02-19 16:34:03.679', NULL, 'C', 'Telur', 'yellow', 1),
(4, '2024-02-19 16:34:28.101', '2024-02-19 16:34:28.101', NULL, 'D', 'Tempe', 'green', 1),
(5, '2024-02-19 16:36:10.330', '2024-02-19 16:36:10.330', NULL, 'A', 'Tempe', 'green', 2),
(6, '2024-02-19 16:36:26.032', '2024-02-19 16:36:26.032', NULL, 'A', 'Ayam', 'red', 2),
(7, '2024-02-19 16:36:56.875', '2024-02-19 16:36:56.875', NULL, 'B', 'Sapi', 'red', 2),
(8, '2024-02-19 16:37:10.099', '2024-02-19 16:37:10.099', NULL, 'C', 'Sapi', 'purple', 2),
(9, '2024-02-19 16:40:01.928', '2024-02-19 16:40:01.928', NULL, 'A', 'wortel', 'orange', 3);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `question` longtext NOT NULL,
  `img` longtext DEFAULT NULL,
  `answer` varchar(1) NOT NULL,
  `quiz_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `created_at`, `updated_at`, `deleted_at`, `question`, `img`, `answer`, `quiz_id`) VALUES
(1, '2024-02-19 16:31:37.346', '2024-02-19 16:31:37.346', NULL, 'Yang merupakan sumber protein kecuali', NULL, 'B', 1),
(2, '2024-02-19 16:34:55.344', '2024-02-19 16:34:55.344', NULL, 'Yang merupakan sumber protein hewani, kecuali...', NULL, 'A', 1),
(3, '2024-02-19 16:39:09.285', '2024-02-19 16:39:09.285', NULL, 'Yang merupakan sumber vitamin A', NULL, 'A', 1);

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `topic` varchar(50) NOT NULL,
  `img` longtext DEFAULT NULL,
  `desc` longtext NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `free` tinyint(1) NOT NULL DEFAULT 1,
  `price` bigint(20) UNSIGNED DEFAULT NULL,
  `disc` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quizzes`
--

INSERT INTO `quizzes` (`id`, `created_at`, `updated_at`, `deleted_at`, `title`, `topic`, `img`, `desc`, `verified`, `free`, `price`, `disc`) VALUES
(1, '2024-02-19 16:29:51.564', '2024-02-19 16:43:18.002', NULL, 'Makanan Sehat Lezat dan Bergizi', 'pangan', NULL, 'desc', 1, 1, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `scores`
--

CREATE TABLE `scores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `point` float NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `quiz_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `scores`
--

INSERT INTO `scores` (`id`, `created_at`, `updated_at`, `deleted_at`, `point`, `user_id`, `quiz_id`) VALUES
(14, '2024-02-21 15:06:55.102', '2024-02-21 15:08:43.156', NULL, 166.667, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `top_ups`
--

CREATE TABLE `top_ups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `quiz_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `price` bigint(20) UNSIGNED NOT NULL,
  `pay` tinyint(1) NOT NULL DEFAULT 0,
  `cancel` tinyint(1) NOT NULL DEFAULT 0,
  `pay_at` datetime(3) DEFAULT NULL,
  `cancel_at` datetime(3) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `block` tinyint(1) NOT NULL DEFAULT 0,
  `wallet` int(11) NOT NULL DEFAULT 0,
  `password` longtext NOT NULL,
  `bio` varchar(300) DEFAULT NULL,
  `avatar` varchar(110) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `created_at`, `updated_at`, `deleted_at`, `username`, `email`, `block`, `wallet`, `password`, `bio`, `avatar`, `admin`) VALUES
(1, '2024-02-15 21:57:17.010', '2024-02-15 21:57:17.010', NULL, 'userFiktif1', 'fictiveuse01r@gmail.com', 0, 0, '$2a$10$0om.q4jzkNC1QSPssEGXy.uhCmvFdQDgwMWmA5ABQvbBkpFWvgtuu', NULL, NULL, 0),
(2, '2024-02-19 16:12:51.000', '2024-02-19 16:12:51.000', NULL, 'adminKe1_001', 'admin01@gmail.com', 0, 0, '$2y$10$1MAJCFIyHElvlKeBWgLFc.7NcFreLV7WyMJ1Mm4F3qk.a518y8/4O', NULL, NULL, 1),
(3, '2024-02-21 15:04:56.169', '2024-02-21 15:04:56.169', NULL, 'userFiktif2', 'fictiveuse02r@gmail.com', 0, 0, '$2a$10$KGMAQGYWYuKiP8UGCyDSP.Sp9yKRCJyoUzGQLZubazdyAvEPjtjMi', NULL, NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blacklist_tokens`
--
ALTER TABLE `blacklist_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `idx_blacklist_tokens_deleted_at` (`deleted_at`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_options_deleted_at` (`deleted_at`),
  ADD KEY `fk_questions_option` (`question_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_questions_deleted_at` (`deleted_at`),
  ADD KEY `fk_quizzes_question` (`quiz_id`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD KEY `idx_quizzes_deleted_at` (`deleted_at`);

--
-- Indexes for table `scores`
--
ALTER TABLE `scores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_scores_deleted_at` (`deleted_at`),
  ADD KEY `fk_quizzes_score` (`quiz_id`),
  ADD KEY `fk_users_score` (`user_id`);

--
-- Indexes for table `top_ups`
--
ALTER TABLE `top_ups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_top_ups_deleted_at` (`deleted_at`),
  ADD KEY `fk_quizzes_top_up` (`quiz_id`),
  ADD KEY `fk_users_top_up` (`user_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_transactions_deleted_at` (`deleted_at`),
  ADD KEY `fk_users_transaction` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_users_deleted_at` (`deleted_at`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blacklist_tokens`
--
ALTER TABLE `blacklist_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `scores`
--
ALTER TABLE `scores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `top_ups`
--
ALTER TABLE `top_ups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `fk_questions_option` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `fk_quizzes_question` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`);

--
-- Constraints for table `scores`
--
ALTER TABLE `scores`
  ADD CONSTRAINT `fk_quizzes_score` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `fk_users_score` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `top_ups`
--
ALTER TABLE `top_ups`
  ADD CONSTRAINT `fk_quizzes_top_up` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `fk_users_top_up` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `fk_users_transaction` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
