-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 31, 2021 at 01:31 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `invoice_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_date` date NOT NULL,
  `due_date` date NOT NULL,
  `section_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `amount_collect` decimal(8,2) NOT NULL,
  `commission` decimal(8,2) NOT NULL,
  `discount` decimal(8,2) NOT NULL,
  `rate_vat` decimal(8,2) NOT NULL,
  `value_vat` decimal(8,2) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value_status` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_number`, `invoice_date`, `due_date`, `section_id`, `product_id`, `amount_collect`, `commission`, `discount`, `rate_vat`, `value_vat`, `total`, `status`, `value_status`, `note`, `deleted_at`, `created_at`, `updated_at`) VALUES
(15, 'NB-10-150', '2021-10-29', '2021-11-25', 2, 8, '250000.00', '30000.00', '5000.00', '0.10', '2500.00', '27500.00', 'غير مدفوعه', 1, 'لم تسدد', NULL, '2021-10-29 10:52:16', '2021-10-29 10:52:16'),
(16, 'FS-10-011', '2021-10-14', '2021-12-01', 3, 10, '250000.00', '35000.00', '4565.00', '0.05', '1521.75', '31956.75', 'غير مدفوعه', 1, 'not paid', NULL, '2021-10-29 13:50:55', '2021-10-29 13:50:55'),
(17, 'NB-10-13', '2021-10-28', '2021-11-06', 2, 9, '500000.00', '45000.00', '7900.00', '0.14', '5194.00', '42294.00', 'غير مدفوعه', 1, 'not paid', NULL, '2021-10-29 17:16:33', '2021-10-29 17:16:33'),
(24, 'FS-10-111', '2021-10-29', '2022-01-05', 3, 11, '50000.00', '6840.00', '1500.00', '0.10', '534.00', '5874.00', 'غير مدفوعه', 1, 'not paid', NULL, '2021-10-29 17:33:05', '2021-10-29 17:33:05'),
(25, 'FS-10-31', '2021-10-29', '2022-01-05', 3, 10, '500000.00', '50000.00', '15000.00', '0.05', '1750.00', '36750.00', 'غير مدفوعه', 1, 'not paid', NULL, '2021-10-29 17:37:37', '2021-10-29 17:37:37'),
(27, 'NB-10-153', '2021-10-31', '2021-11-06', 2, 7, '80000.00', '7800.00', '0.00', '0.10', '780.00', '8580.00', 'غير مدفوعه', 1, 'لم تسدد', NULL, '2021-10-31 07:23:26', '2021-10-31 07:23:26');

-- --------------------------------------------------------

--
-- Table structure for table `invoices_attachments`
--

CREATE TABLE `invoices_attachments` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices_attachments`
--

INSERT INTO `invoices_attachments` (`id`, `invoice_id`, `file_name`, `invoice_number`, `user`, `deleted_at`, `created_at`, `updated_at`) VALUES
(21, 15, 'aH1vGy9mL4MxkDB7bZOt1wramYo5bl2pdywWkspq.jpeg', 'NB-10-150', 'mohamed Ibrahiem', NULL, '2021-10-29 10:52:16', '2021-10-29 10:52:16'),
(22, 16, 'MYnI4EGsizPQjKbHZHCp4qfw0fHxBRfuxCQtBQ8J.jpeg', 'FS-10-011', 'mohamed Ibrahiem', NULL, '2021-10-29 13:50:55', '2021-10-29 13:50:55'),
(23, 17, 'MYnI4EGsizPQjKbHZHCp4qfw0fHxBRfuxCQtBQ8J.jpeg', 'NB-10-13', 'test user', NULL, '2021-10-29 17:16:33', '2021-10-29 17:16:33'),
(30, 24, 'FRqzlTXozBrX4MYAUTuw5AKWgQboRAPUmTrrKafz.jpeg', 'FS-10-111', 'test user', NULL, '2021-10-29 17:33:05', '2021-10-29 17:33:05'),
(31, 25, 'FRqzlTXozBrX4MYAUTuw5AKWgQboRAPUmTrrKafz.jpeg', 'FS-10-31', 'test user', NULL, '2021-10-29 17:37:37', '2021-10-29 17:37:37'),
(33, 27, 'MYnI4EGsizPQjKbHZHCp4qfw0fHxBRfuxCQtBQ8J.jpeg', 'NB-10-153', 'test user', NULL, '2021-10-31 07:23:26', '2021-10-31 07:23:26');

-- --------------------------------------------------------

--
-- Table structure for table `invoices_details`
--

CREATE TABLE `invoices_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value_status` int(11) NOT NULL,
  `payment_date` date DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `user` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices_details`
--

INSERT INTO `invoices_details` (`id`, `invoice_id`, `invoice_number`, `product_id`, `section_id`, `status`, `value_status`, `payment_date`, `note`, `user`, `deleted_at`, `created_at`, `updated_at`) VALUES
(29, 15, 'NB-10-150', '8', '2', 'غير مدفوعه', 1, '2021-10-29', 'لم تسدد', 'mohamed Ibrahiem', NULL, '2021-10-29 10:52:16', '2021-10-29 10:52:16'),
(30, 16, 'FS-10-011', '10', '3', 'غير مدفوعه', 1, '2021-10-29', 'not paid', 'mohamed Ibrahiem', NULL, '2021-10-29 13:50:55', '2021-10-29 13:50:55'),
(31, 17, 'NB-10-13', '9', '2', 'غير مدفوعه', 1, '2021-10-29', 'not paid', 'test user', NULL, '2021-10-29 17:16:33', '2021-10-29 17:16:33'),
(38, 24, 'FS-10-111', '11', '3', 'غير مدفوعه', 1, '2021-10-29', 'not paid', 'test user', NULL, '2021-10-29 17:33:05', '2021-10-29 17:33:05'),
(39, 25, 'FS-10-31', '10', '3', 'غير مدفوعه', 1, '2021-10-29', 'not paid', 'test user', NULL, '2021-10-29 17:37:37', '2021-10-29 17:37:37'),
(42, 27, 'NB-10-153', '7', '2', 'غير مدفوعه', 1, '2021-10-31', 'لم تسدد', 'test user', NULL, '2021-10-31 07:23:26', '2021-10-31 07:23:26');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(9, '2014_10_12_000000_create_users_table', 1),
(10, '2014_10_12_100000_create_password_resets_table', 1),
(11, '2019_08_19_000000_create_failed_jobs_table', 1),
(12, '2021_10_20_100349_create_sections_table', 1),
(13, '2021_10_22_105138_create_products_table', 1),
(14, '2021_10_23_164631_create_invoices_table', 1),
(15, '2021_10_23_180539_create_invoices_details_table', 1),
(16, '2021_10_23_192345_create_invoices_attachments_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `description`, `section_id`, `created_at`, `updated_at`) VALUES
(1, 'قروض سيارات', 'قرض سياره ميسر', 1, '2021-10-23 11:59:09', '2021-10-23 11:59:09'),
(2, 'قرض شباب', 'قرض للشباب', 1, '2021-10-23 11:59:31', '2021-10-23 11:59:31'),
(3, 'قرض الميسر', 'قرض ميسر', 1, '2021-10-23 11:59:45', '2021-10-23 11:59:45'),
(4, 'قرض اسكان', 'قرض للاسكان', 1, '2021-10-23 11:59:58', '2021-10-23 11:59:58'),
(5, 'قروض متعثره', 'متعثره', 1, '2021-10-23 12:00:11', '2021-10-23 12:00:11'),
(6, 'قروض مشتروات', 'مشتروات', 2, '2021-10-23 12:00:27', '2021-10-23 12:00:27'),
(7, 'قرض للشباب', 'قرض شباب مخفض', 2, '2021-10-23 12:00:42', '2021-10-23 12:00:42'),
(8, 'قرض سياره', 'قرض سياره جديده', 2, '2021-10-23 12:00:56', '2021-10-23 12:00:56'),
(9, 'تمويل عقاري', 'عقار', 2, '2021-10-23 12:01:07', '2021-10-23 12:01:07'),
(10, 'تمويل اسكان اجتماعي', 'اسكان', 3, '2021-10-23 12:01:23', '2021-10-23 12:01:23'),
(11, 'قروض ميسره', 'ميسره فيصل', 3, '2021-10-23 12:01:36', '2021-10-23 12:01:36'),
(12, 'قروض صغيره', 'قروض صغيره', 4, '2021-10-23 12:01:52', '2021-10-23 12:01:52'),
(13, 'قروض مشتريات', 'مشتريات', 5, '2021-10-23 12:02:20', '2021-10-23 12:02:20'),
(14, 'قروض عقاريه', 'عقارات', 6, '2021-10-23 12:02:33', '2021-10-23 12:02:33');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(10) UNSIGNED NOT NULL,
  `section_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `section_name`, `description`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'بنك مصر', 'البنك المصري', 'mohamed Ibrahiem', '2021-10-23 11:57:19', '2021-10-23 11:57:19'),
(2, 'البنك الاهلي', 'البنك الاهلي المصري', 'mohamed Ibrahiem', '2021-10-23 11:57:32', '2021-10-23 11:57:32'),
(3, 'بنك فيصل', 'بنك فيصل الاسلامي', 'mohamed Ibrahiem', '2021-10-23 11:57:48', '2021-10-23 11:57:48'),
(4, 'البنك العربي الافريقي', 'البنك الافريقي', 'mohamed Ibrahiem', '2021-10-23 11:58:08', '2021-10-23 11:58:08'),
(5, 'بنك CIB', 'CIB Bank', 'mohamed Ibrahiem', '2021-10-23 11:58:27', '2021-10-23 11:58:27'),
(6, 'بنك ابوظبي', 'بنك ابوظبي الاسلامي', 'mohamed Ibrahiem', '2021-10-23 11:58:44', '2021-10-23 11:58:44');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'mohamed Ibrahiem', 'mohamed@yahoo.com', NULL, '$2y$10$at8ynCFTqctVdyqjbZoDfOwKH7fgvD6aek/65UHOO4BTMCN6UYCoe', 'R3sDS9P5UthSHifFuVN6FWp9rB8ODFtY3gS9qXTLspXDjbkEFmg30SktHmwQ', '2021-10-27 12:46:46', '2021-10-27 12:46:46'),
(2, 'ahmed elsyed', 'ahmed2020@yahoo.com', NULL, '$2y$10$X.4GWZXBnQoucIBsYHe9nui5WPfwSZZzgmynkOxGy76gT3oLF4/Re', 'LFTswfbvzjm1j9BFl61AGbs5WHBsu9UYjFEJmIgX6I3I9eKy8tuus4GB9BhQ', '2021-10-27 22:33:05', '2021-10-27 22:33:05'),
(3, 'test user', 'junkdog08@gmail.com', NULL, '$2y$10$mtZtu7R9Hysbh2wL46I8fubo50XOpYaTHaDRUV3iQ9ohQZIgrl5zq', 'aEyc3ll4iD97vMih6d65vfrF9T7LOdhsXs78TZGO8P0qlb8Rm7LEDc2GS8Z4', '2021-10-29 17:15:44', '2021-10-29 17:15:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoices_invoice_number_unique` (`invoice_number`),
  ADD KEY `invoices_section_id_foreign` (`section_id`),
  ADD KEY `invoices_product_id_foreign` (`product_id`);

--
-- Indexes for table `invoices_attachments`
--
ALTER TABLE `invoices_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_attachments_invoice_id_foreign` (`invoice_id`);

--
-- Indexes for table `invoices_details`
--
ALTER TABLE `invoices_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_details_invoice_id_foreign` (`invoice_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_section_id_foreign` (`section_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `invoices_attachments`
--
ALTER TABLE `invoices_attachments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `invoices_details`
--
ALTER TABLE `invoices_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoices_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoices_attachments`
--
ALTER TABLE `invoices_attachments`
  ADD CONSTRAINT `invoices_attachments_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoices_details`
--
ALTER TABLE `invoices_details`
  ADD CONSTRAINT `invoices_details_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
