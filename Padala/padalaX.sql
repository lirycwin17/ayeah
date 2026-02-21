-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 24, 2025 at 06:01 PM
-- Server version: 11.4.3-MariaDB-1
-- PHP Version: 8.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `padalaX`
--

-- --------------------------------------------------------

--
-- Table structure for table `job_details`
--

CREATE TABLE `job_details` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `full_address` varchar(255) NOT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `delivery_notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `job_details`
--

INSERT INTO `job_details` (`id`, `job_id`, `full_address`, `contact_number`, `delivery_notes`) VALUES
(171, 1, '123 Ayala Ave, Makati City, Metro Manila', '09123456789', 'Deliver before 5 PM'),
(172, 2, '456 Market Ave, Taguig City, Metro Manila', '09234567890', 'Handle with care'),
(173, 3, '789 5th Ave, Caloocan City, Metro Manila', '09345678901', 'Leave at front desk'),
(174, 4, '12 España Blvd, Manila City, Metro Manila', '09456789012', 'Ring the bell'),
(175, 5, '34 Roxas Blvd, Pasay City, Metro Manila', '09567890123', 'Fragile items inside'),
(176, 6, '67 JP Rizal St, Marikina City, Metro Manila', '09678901234', 'Call before arrival'),
(177, 7, '89 Gen T. de Leon, Valenzuela City, Metro Manila', '09789012345', 'Payment on delivery'),
(178, 8, '101 Greenbelt St, Makati City, Metro Manila', '09890123456', 'Urgent delivery'),
(179, 9, '222 Ortigas Ave, Pasig City, Metro Manila', '09901234567', 'Knock 3 times'),
(180, 10, '333 Coastal Road, Parañaque City, Metro Manila', '09111234567', 'Recipient will sign'),
(181, 11, '125 Katipunan Ave, Quezon City, Metro Manila', '09222334455', 'Deliver after 2 PM'),
(182, 12, '567 Sumulong Hwy, Antipolo City, Rizal', '09333445566', 'Heavy package, needs help unloading'),
(183, 13, '678 Rizal Ave, Mandaluyong City, Metro Manila', '09444556677', 'Gate code: 1234'),
(184, 14, '789 Shaw Blvd, San Juan City, Metro Manila', '09555667788', 'Leave at reception'),
(185, 15, '910 Gen Luna St, Malabon City, Metro Manila', '09666778899', 'Recipient will be waiting outside'),
(186, 16, '222 C3 Road, Navotas City, Metro Manila', '09777889900', 'Late-night delivery allowed'),
(187, 17, '334 Quirino Hwy, Meycauayan, Bulacan', '09888990011', 'Knock twice and wait'),
(188, 18, '445 MacArthur Hwy, San Jose del Monte, Bulacan', '09999001122', 'Security will assist with delivery'),
(189, 19, '556 Governor’s Drive, Malolos, Bulacan', '09100112233', 'Deliver before noon'),
(190, 20, '667 Camella Homes, Santa Maria, Bulacan', '09211223344', 'Recipient has paid in advance'),
(191, 21, 'ssssssssssssssss', '09456899958989', 'deliver agad'),
(192, 22, 'xxxxxxxxxxxxxxxx', '09595xxxx', 'NO double Booking'),
(193, 23, 'Sampaloc', '099x9x9x9x', 'GAGO'),
(194, 24, 'xxxxxxxxxxxxxxxxxxxxxxxx', 'xxxxxxxxxxxxxxxx', 'GOGOG'),
(195, 25, 'xxxxxxxxxxxx', 'xxxxxxxxxx', 'lolo'),
(196, 26, 'Xxxx', '0992857', 'Fuck you'),
(197, 27, 'Xxxxxx', '094647474727', ''),
(198, 28, 'xxxxxxxxxxxxxxxxxxxxx', '09595xxxx', 'Putang ina mo romuadl');

-- --------------------------------------------------------

--
-- Table structure for table `job_postings`
--

CREATE TABLE `job_postings` (
  `id` int(11) NOT NULL,
  `client_name` varchar(100) NOT NULL,
  `origin` varchar(100) NOT NULL,
  `destination` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `job_postings`
--

INSERT INTO `job_postings` (`id`, `client_name`, `origin`, `destination`, `price`) VALUES
(1, 'Juan Dela Cruz', 'Makati City, Metro Manila', 'Quezon City, Metro Manila', 500.00),
(2, 'Maria Santos', 'Taguig City, Metro Manila', 'Pasig City, Metro Manila', 450.00),
(3, 'Jose Rizal', 'Caloocan City, Metro Manila', 'Mandaluyong City, Metro Manila', 600.00),
(4, 'Ana Dela Vega', 'Manila City, Metro Manila', 'San Juan City, Metro Manila', 350.00),
(5, 'Pedro Gonzales', 'Pasay City, Metro Manila', 'Parañaque City, Metro Manila', 400.00),
(6, 'Luisa Ramos', 'Marikina City, Metro Manila', 'Las Piñas City, Metro Manila', 550.00),
(7, 'Carlos Mendez', 'Valenzuela City, Metro Manila', 'Taguig City, Metro Manila', 700.00),
(8, 'Elena Cruz', 'Makati City, Metro Manila', 'Cavite City, Cavite', 800.00),
(9, 'Miguel Fernandez', 'Pasig City, Metro Manila', 'Imus, Cavite', 900.00),
(10, 'Rosa Mendoza', 'Parañaque City, Metro Manila', 'Bacoor, Cavite', 650.00),
(11, 'Andres Bonifacio', 'Quezon City, Metro Manila', 'San Mateo, Rizal', 750.00),
(12, 'Gregorio Del Pilar', 'Caloocan City, Metro Manila', 'Antipolo City, Rizal', 850.00),
(13, 'Emilio Aguinaldo', 'Mandaluyong City, Metro Manila', 'Angono, Rizal', 400.00),
(14, 'Melchora Aquino', 'San Juan City, Metro Manila', 'Taytay, Rizal', 500.00),
(15, 'Isabela Ortega', 'Malabon City, Metro Manila', 'Rodriguez, Rizal', 550.00),
(16, 'Ramon Revilla', 'Navotas City, Metro Manila', 'Marilao, Bulacan', 450.00),
(17, 'Delfin Castro', 'Pasay City, Metro Manila', 'Meycauayan, Bulacan', 600.00),
(18, 'Josefa Llanes', 'Valenzuela City, Metro Manila', 'San Jose del Monte, Bulacan', 700.00),
(19, 'Francisco Balagtas', 'Manila City, Metro Manila', 'Malolos, Bulacan', 800.00),
(20, 'Leonor Rivera', 'Taguig City, Metro Manila', 'Santa Maria, Bulacan', 850.00),
(21, 'Cyrus Jake', 'Pasig City', 'Quezon City', 150.00),
(22, 'Russelly', 'Manila', 'Pasay', 500.00),
(23, 'Joseph B Raot', 'Manila', 'Manila', 800.00),
(24, 'Maria Ozawa', 'Pasay', 'Mandaluyong', 1500.00),
(25, 'Chris Tiu', 'San Juan', 'Paranaque', 200.00),
(26, 'Marvin', 'Antipolo', 'Navotas', 300.00),
(27, 'Sarah', 'Davao', 'Davao', 500.00),
(28, 'Rodrigo', 'Matalom', 'Mahaplag', 500.00);


-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password_hash`, `created_at`) VALUES
(1, 'admin', '$2y$12$4ZKiRWTCgD09Pwm4ZWUf.uQMEZ/tzFo9tGI45XbLQ1OmddHELm4.2', '2025-02-24 18:01:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `job_details`
--
ALTER TABLE `job_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_id` (`job_id`);

--
-- Indexes for table `job_postings`
--
ALTER TABLE `job_postings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `job_details`
--
ALTER TABLE `job_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT for table `job_postings`
--
ALTER TABLE `job_postings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `job_details`
--
ALTER TABLE `job_details`
  ADD CONSTRAINT `job_details_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `job_postings` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
