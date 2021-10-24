-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2021 at 10:53 PM
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
  `product` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount_collect` decimal(8,2) NOT NULL,
  `commission` decimal(8,2) NOT NULL,
  `discount` decimal(8,2) NOT NULL,
  `rate_vat` decimal(8,2) NOT NULL,
  `value_vat` decimal(8,2) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value_status` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `payment_date` date DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices_details`
--

CREATE TABLE `invoices_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `section` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value_status` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `user` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_10_20_100349_create_sections_table', 1),
(5, '2021_10_21_164631_create_invoices_table', 1),
(6, '2021_10_22_105138_create_products_table', 1),
(7, '2021_10_23_180539_create_invoices_details_table', 1),
(8, '2021_10_23_192345_create_invoices_attachments_table', 1);

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
(1, 'قروض سيارات', 'قرض سياره ميسر', 1, '2021-10-23 13:59:09', '2021-10-23 13:59:09'),
(2, 'قرض شباب', 'قرض للشباب', 1, '2021-10-23 13:59:31', '2021-10-23 13:59:31'),
(3, 'قرض الميسر', 'قرض ميسر', 1, '2021-10-23 13:59:45', '2021-10-23 13:59:45'),
(4, 'قرض اسكان', 'قرض للاسكان', 1, '2021-10-23 13:59:58', '2021-10-23 13:59:58'),
(5, 'قروض متعثره', 'متعثره', 1, '2021-10-23 14:00:11', '2021-10-23 14:00:11'),
(6, 'قروض مشتروات', 'مشتروات', 2, '2021-10-23 14:00:27', '2021-10-23 14:00:27'),
(7, 'قرض للشباب', 'قرض شباب مخفض', 2, '2021-10-23 14:00:42', '2021-10-23 14:00:42'),
(8, 'قرض سياره', 'قرض سياره جديده', 2, '2021-10-23 14:00:56', '2021-10-23 14:00:56'),
(9, 'تمويل عقاري', 'عقار', 2, '2021-10-23 14:01:07', '2021-10-23 14:01:07'),
(10, 'تمويل اسكان اجتماعي', 'اسكان', 3, '2021-10-23 14:01:23', '2021-10-23 14:01:23'),
(11, 'قروض ميسره', 'ميسره فيصل', 3, '2021-10-23 14:01:36', '2021-10-23 14:01:36'),
(12, 'قروض صغيره', 'قروض صغيره', 4, '2021-10-23 14:01:52', '2021-10-23 14:01:52'),
(13, 'قروض مشتريات', 'مشتريات', 5, '2021-10-23 14:02:20', '2021-10-23 14:02:20'),
(14, 'قروض عقاريه', 'عقارات', 6, '2021-10-23 14:02:33', '2021-10-23 14:02:33');

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
(1, 'بنك مصر', 'البنك المصري', 'mohamed Ibrahiem', '2021-10-23 13:57:19', '2021-10-23 13:57:19'),
(2, 'البنك الاهلي', 'البنك الاهلي المصري', 'mohamed Ibrahiem', '2021-10-23 13:57:32', '2021-10-23 13:57:32'),
(3, 'بنك فيصل', 'بنك فيصل الاسلامي', 'mohamed Ibrahiem', '2021-10-23 13:57:48', '2021-10-23 13:57:48'),
(4, 'البنك العربي الافريقي', 'البنك الافريقي', 'mohamed Ibrahiem', '2021-10-23 13:58:08', '2021-10-23 13:58:08'),
(5, 'بنك CIB', 'CIB Bank', 'mohamed Ibrahiem', '2021-10-23 13:58:27', '2021-10-23 13:58:27'),
(6, 'بنك ابوظبي', 'بنك ابوظبي الاسلامي', 'mohamed Ibrahiem', '2021-10-23 13:58:44', '2021-10-23 13:58:44');

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
(1, 'mohamed Ibrahiem', 'mohamed@yahoo.com', NULL, '$2y$10$V87Qp1Eyv84ozTPFQ20ZIOnGaP56GNTDBbH/uo1It2VMuRHGkOIj2', 'UEGgA1dqrVAkNxEhqlKfS4UTpNP2svfiNNa2OlEsXGSwQfQh3JYqCe7wdsGQ', '2021-10-23 13:56:33', '2021-10-23 13:56:33');

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
  ADD KEY `invoices_section_id_foreign` (`section_id`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices_attachments`
--
ALTER TABLE `invoices_attachments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices_details`
--
ALTER TABLE `invoices_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
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
