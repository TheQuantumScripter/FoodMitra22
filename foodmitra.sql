-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2026 at 07:15 AM
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
-- Database: `foodmitra`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `offer_price` decimal(10,2) NOT NULL,
  `address` text NOT NULL,
  `status` enum('pending','accepted','rejected','cancelled') DEFAULT 'pending',
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `delivery_time` varchar(50) DEFAULT NULL,
  `delivery_partner_phone` varchar(20) DEFAULT NULL,
  `delivery_partner_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `product_id`, `vendor_id`, `supplier_id`, `quantity`, `offer_price`, `address`, `status`, `order_date`, `delivery_time`, `delivery_partner_phone`, `delivery_partner_name`) VALUES
(5, 5, 8, 7, 8, 70.00, 'Khau Galli, Nivara', 'pending', '2026-01-29 18:16:22', NULL, NULL, NULL),
(6, 4, 8, 7, 8, 120.00, 'Khau Galli, Nivara', 'pending', '2026-01-29 18:16:55', NULL, NULL, NULL),
(7, 3, 8, 7, 4, 140.00, 'Khau Galli, Nivara', 'pending', '2026-01-29 18:17:21', NULL, NULL, NULL),
(9, 6, 8, 7, 3, 180.00, 'Khaugalli', 'accepted', '2026-02-19 19:36:21', '1 Hr', '9090909090', NULL),
(12, 8, 8, 7, 5, 200.00, 'Khau Galli', 'accepted', '2026-04-06 08:40:09', '40 min', '4050607080', 'Ajinkya'),
(13, 6, 8, 7, 3, 200.00, 'Khau Galli, Kopargaon.', 'pending', '2026-04-07 04:36:01', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `category` varchar(50) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `category`, `supplier_id`, `created_at`) VALUES
(3, 'Mung Daal', 160.00, 'Grains', 7, '2026-01-29 17:55:37'),
(4, 'Thick Rava', 140.00, 'Spices', 7, '2026-01-29 17:56:54'),
(5, 'Thin Rava', 80.00, 'Spices', 7, '2026-01-29 17:57:20'),
(6, 'Thecha', 200.00, 'Spices', 7, '2026-02-19 19:34:56'),
(7, 'Mirchi', 50.00, 'Vegetables', 7, '2026-02-23 18:24:48'),
(8, 'Khada Masala', 250.00, 'Spices', 7, '2026-04-06 08:38:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `business_name` varchar(150) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('vendor','supplier','admin') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `profile_pic` varchar(255) DEFAULT 'default.png',
  `phone` varchar(20) DEFAULT '',
  `address` text DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `business_name`, `email`, `password`, `role`, `created_at`, `profile_pic`, `phone`, `address`) VALUES
(2, 'Super Admin', 'FoodMitra HQ', 'admin@foodmitra.in', '$2y$10$lCyQ9QAGuGI2RGKUawAWZui.IqZxhZnOm/ayV3cXr5qL0joJAuKfi', 'admin', '2026-01-25 13:08:36', 'default.jpg', '', ''),
(7, 'Saish Kulkarni', 'Sai Snacks', 'saishkulkarni143@gmail.com', '$2y$10$3K.tcr2W7DDV47W5DQNrnOrRacI9uIzix6SYtUkbTg3pz6CSNgyri', 'supplier', '2026-01-29 17:53:29', '697b9e998092f.jpg', '9579361262', ''),
(8, 'Alpesh Savle', 'Khau Galli', 'alpesh22@gmail.com', '$2y$10$HM3BMQIhWrfZalIeGiD0ZejpB2yBHzoCPaIKKU33OKbf.95QhEsM2', 'vendor', '2026-01-29 18:01:59', '697ba097d1d74.jpeg', '9880706045', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `vendor_id` (`vendor_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`vendor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
