-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2021 at 05:25 PM
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
(1, 'NB-10-1', '2021-10-08', '2021-12-01', 2, 8, '250000.00', '35000.00', '5890.00', '0.05', '1455.50', '30565.50', 'مدفوعه', 2, 'تم الدفع', NULL, '2021-10-31 17:06:24', '2021-11-06 16:03:39'),
(2, '456321', '2021-10-13', '2021-11-05', 3, 11, '50000.00', '5200.00', '2600.00', '0.13', '338.00', '2938.00', 'مدفوعه', 2, 'تم الدفع', NULL, '2021-10-31 17:09:42', '2021-11-01 14:01:05'),
(3, '456328', '2021-11-01', '2021-11-24', 4, 12, '200000.00', '35000.00', '0.00', '0.13', '4550.00', '39550.00', 'مدفوعه', 2, 'تم الدفع', NULL, '2021-11-01 15:08:17', '2021-11-08 08:19:04'),
(4, 'FS-10-021', '2021-11-04', '2021-12-11', 3, 11, '80000.00', '20000.00', '3485.00', '0.05', '825.75', '17340.75', 'مؤجله', 4, 'الفاتوره مؤجله', NULL, '2021-11-06 16:15:51', '2021-11-06 16:15:51'),
(5, 'NB-10-159', '2021-11-06', '2021-12-10', 2, 7, '250000.00', '25000.00', '5620.00', '0.13', '2519.40', '21899.40', 'مؤجله', 4, 'مؤجله', NULL, '2021-11-06 19:49:51', '2021-11-07 16:53:40'),
(6, '4563282', '2021-11-06', '2021-12-11', 4, 12, '80000.00', '5000.00', '2530.00', '0.10', '247.00', '2717.00', 'غير مدفوعه', 1, 'not paid', NULL, '2021-11-06 19:52:21', '2021-11-06 19:52:21'),
(7, '1646312', '2021-11-06', '2021-11-30', 5, 13, '50000.00', '3670.00', '1500.00', '0.14', '303.80', '2473.80', 'غير مدفوعه', 1, 'not paid', NULL, '2021-11-06 19:53:13', '2021-11-06 19:53:13'),
(8, '235631', '2021-11-06', '2021-12-22', 1, 5, '80000.00', '5000.00', '2680.00', '0.05', '116.00', '2436.00', 'مدفوعه جزئيا', 3, 'مدفوع جزئ', NULL, '2021-11-06 19:54:21', '2021-11-06 19:54:21'),
(9, '5645659', '2021-11-07', '2021-12-10', 3, 10, '500000.00', '40000.00', '5980.00', '0.13', '4422.60', '38442.60', 'مؤجله', 4, 'مؤجله', NULL, '2021-11-07 17:19:42', '2021-11-08 08:18:09'),
(10, 'NB-11-132', '2021-11-08', '2021-12-09', 2, 9, '500000.00', '35000.00', '6980.00', '0.14', '3922.80', '31942.80', 'مدفوعه', 2, 'تم التسديد', NULL, '2021-11-08 08:17:06', '2021-11-08 08:17:06'),
(11, '2355c5', '2021-11-08', '2021-12-11', 3, 11, '50000.00', '5000.00', '0.00', '0.10', '500.00', '5500.00', 'غير مدفوعه', 1, 'not paid', NULL, '2021-11-08 10:21:26', '2021-11-08 10:21:26'),
(12, '312786b', '2021-11-08', '2021-12-04', 4, 12, '80000.00', '10000.00', '2530.00', '0.10', '747.00', '8217.00', 'غير مدفوعه', 1, 'not paid', NULL, '2021-11-08 10:23:41', '2021-11-08 10:23:41'),
(13, '312586b', '2021-11-08', '2022-01-13', 5, 13, '88000.00', '10000.00', '2450.00', '0.05', '377.50', '7927.50', 'غير مدفوعه', 1, 'not paid', NULL, '2021-11-08 10:25:16', '2021-11-08 10:25:16'),
(14, '12fdsv2', '2021-11-08', '2021-12-29', 6, 14, '500000.00', '45000.00', '5640.00', '0.05', '1968.00', '41328.00', 'غير مدفوعه', 1, 'not paid', NULL, '2021-11-08 10:27:55', '2021-11-08 10:27:55'),
(15, 'ds5642', '2021-11-08', '2021-11-25', 5, 13, '50000.00', '5600.00', '2400.00', '0.05', '160.00', '3360.00', 'غير مدفوعه', 1, 'not paid', NULL, '2021-11-08 10:38:51', '2021-11-08 10:38:51'),
(16, '183312', '2021-11-07', '2021-12-02', 1, 3, '200000.00', '7800.00', '0.00', '0.05', '390.00', '8190.00', 'غير مدفوعه', 1, 'not paid', NULL, '2021-11-08 10:44:30', '2021-11-08 10:44:30'),
(17, 'NB-11-102', '2021-11-08', '2021-12-02', 2, 7, '200000.00', '35000.00', '11000.00', '0.13', '3120.00', '27120.00', 'غير مدفوعه', 1, 'not paid', NULL, '2021-11-08 10:48:04', '2021-11-08 10:48:04'),
(18, 'NB-11-100', '2021-11-08', '2021-11-23', 2, 9, '500000.00', '45200.00', '15300.00', '0.14', '4186.00', '34086.00', 'غير مدفوعه', 1, 'not paid', NULL, '2021-11-08 10:50:47', '2021-11-08 10:50:47'),
(19, 'dsfg21', '2021-11-01', '2021-11-25', 4, 12, '200000.00', '35000.00', '0.00', '0.05', '1750.00', '36750.00', 'غير مدفوعه', 1, 'not paid', NULL, '2021-11-08 10:55:54', '2021-11-08 10:55:54'),
(20, '542145', '2021-11-09', '2021-12-02', 6, 14, '500000.00', '5000.00', '0.00', '0.05', '250.00', '5250.00', 'مؤجله', 4, 'مؤجله', NULL, '2021-11-08 10:58:50', '2021-11-08 10:58:50'),
(21, '5421454', '2021-11-09', '2021-12-02', 1, 1, '500000.00', '5000.00', '0.00', '0.13', '650.00', '5650.00', 'مؤجله', 4, 'مؤجله', NULL, '2021-11-08 10:59:48', '2021-11-08 10:59:48'),
(22, '235fjjj', '2021-11-17', '2021-12-01', 4, 12, '50000.00', '5000.00', '2000.00', '0.05', '150.00', '3150.00', 'غير مدفوعه', 1, 'not paid', NULL, '2021-11-08 11:01:03', '2021-11-08 11:01:03'),
(23, '454478', '2021-11-08', '2021-12-02', 6, 14, '500000.00', '40000.00', '5000.00', '0.10', '3500.00', '38500.00', 'مدفوعه جزئيا', 3, 'مدفوع جزئ', NULL, '2021-11-08 11:15:01', '2021-11-08 11:15:01'),
(24, 'gf45133', '2021-11-09', '2021-11-25', 1, 1, '250000.00', '5000.00', '0.00', '0.05', '250.00', '5250.00', 'غير مدفوعه', 1, 'not paid', NULL, '2021-11-08 11:43:52', '2021-11-08 11:43:52'),
(25, 'vsdffdf', '2021-11-10', '2021-12-02', 3, 11, '500000.00', '4000.00', '2000.00', '0.05', '100.00', '2100.00', 'مؤجله', 4, 'مؤجله', NULL, '2021-11-08 11:49:01', '2021-11-08 11:49:01'),
(26, 'vxc1323', '2021-11-08', '2021-11-26', 4, 12, '50000.00', '3000.00', '0.00', '0.10', '300.00', '3300.00', 'غير مدفوعه', 1, 'not paid', NULL, '2021-11-08 14:09:38', '2021-11-08 14:09:38'),
(27, '123789', '2021-11-10', '2021-11-29', 1, 3, '50000.00', '3000.00', '0.00', '0.05', '150.00', '3150.00', 'غير مدفوعه', 1, 'not paid', NULL, '2021-11-08 14:11:32', '2021-11-08 14:11:32'),
(28, 'NB-11-149', '2021-11-17', '2021-12-02', 2, 9, '500000.00', '40000.00', '1000.00', '0.10', '3900.00', '42900.00', 'غير مدفوعه', 1, 'not paid', NULL, '2021-11-08 14:13:31', '2021-11-08 14:13:31');

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
(1, 1, 'aH1vGy9mL4MxkDB7bZOt1wramYo5bl2pdywWkspq.jpeg', 'NB-10-1', 'Mohamed Ibrahiem', NULL, '2021-10-31 17:06:24', '2021-10-31 17:06:24'),
(2, 2, 'FRqzlTXozBrX4MYAUTuw5AKWgQboRAPUmTrrKafz.jpeg', '456321', 'Mohamed Ibrahiem', NULL, '2021-10-31 17:09:42', '2021-10-31 17:09:42'),
(3, 3, 'MYnI4EGsizPQjKbHZHCp4qfw0fHxBRfuxCQtBQ8J.jpeg', '456328', 'Mohamed Ibrahiem', NULL, '2021-11-01 15:08:17', '2021-11-01 15:08:17'),
(4, 4, 'FRqzlTXozBrX4MYAUTuw5AKWgQboRAPUmTrrKafz.jpeg', 'FS-10-021', 'Admin', NULL, '2021-11-06 16:15:51', '2021-11-06 16:15:51'),
(5, 5, 'FRqzlTXozBrX4MYAUTuw5AKWgQboRAPUmTrrKafz.jpeg', 'NB-10-159', 'Admin', NULL, '2021-11-06 19:49:51', '2021-11-06 19:49:51'),
(6, 6, 'FRqzlTXozBrX4MYAUTuw5AKWgQboRAPUmTrrKafz.jpeg', '4563282', 'Admin', NULL, '2021-11-06 19:52:21', '2021-11-06 19:52:21'),
(7, 7, 'FRqzlTXozBrX4MYAUTuw5AKWgQboRAPUmTrrKafz.jpeg', '1646312', 'Admin', NULL, '2021-11-06 19:53:13', '2021-11-06 19:53:13'),
(8, 8, 'FRqzlTXozBrX4MYAUTuw5AKWgQboRAPUmTrrKafz.jpeg', '235631', 'Admin', NULL, '2021-11-06 19:54:21', '2021-11-06 19:54:21'),
(9, 9, 'FRqzlTXozBrX4MYAUTuw5AKWgQboRAPUmTrrKafz.jpeg', '5645659', 'Mohamed Ibrahiem', NULL, '2021-11-07 17:19:42', '2021-11-07 17:19:42'),
(10, 10, 'FRqzlTXozBrX4MYAUTuw5AKWgQboRAPUmTrrKafz.jpeg', 'NB-11-132', 'Admin', NULL, '2021-11-08 08:17:06', '2021-11-08 08:17:06'),
(11, 11, 'FRqzlTXozBrX4MYAUTuw5AKWgQboRAPUmTrrKafz.jpeg', '2355c5', 'Admin', NULL, '2021-11-08 10:21:26', '2021-11-08 10:21:26'),
(12, 12, 'FRqzlTXozBrX4MYAUTuw5AKWgQboRAPUmTrrKafz.jpeg', '312786b', 'Admin', NULL, '2021-11-08 10:23:41', '2021-11-08 10:23:41'),
(13, 13, 'FRqzlTXozBrX4MYAUTuw5AKWgQboRAPUmTrrKafz.jpeg', '312586b', 'Admin', NULL, '2021-11-08 10:25:16', '2021-11-08 10:25:16'),
(14, 14, 'FRqzlTXozBrX4MYAUTuw5AKWgQboRAPUmTrrKafz.jpeg', '12fdsv2', 'Admin', NULL, '2021-11-08 10:27:55', '2021-11-08 10:27:55'),
(15, 15, 'FRqzlTXozBrX4MYAUTuw5AKWgQboRAPUmTrrKafz.jpeg', 'ds5642', 'Admin', NULL, '2021-11-08 10:38:51', '2021-11-08 10:38:51'),
(16, 16, 'FRqzlTXozBrX4MYAUTuw5AKWgQboRAPUmTrrKafz.jpeg', '183312', 'Admin', NULL, '2021-11-08 10:44:30', '2021-11-08 10:44:30'),
(17, 17, 'FRqzlTXozBrX4MYAUTuw5AKWgQboRAPUmTrrKafz.jpeg', 'NB-11-102', 'Admin', NULL, '2021-11-08 10:48:04', '2021-11-08 10:48:04'),
(18, 18, 'FRqzlTXozBrX4MYAUTuw5AKWgQboRAPUmTrrKafz.jpeg', 'NB-11-100', 'Admin', NULL, '2021-11-08 10:50:47', '2021-11-08 10:50:47'),
(19, 19, 'FRqzlTXozBrX4MYAUTuw5AKWgQboRAPUmTrrKafz.jpeg', 'dsfg21', 'Admin', NULL, '2021-11-08 10:55:54', '2021-11-08 10:55:54'),
(20, 20, 'FRqzlTXozBrX4MYAUTuw5AKWgQboRAPUmTrrKafz.jpeg', '542145', 'Admin', NULL, '2021-11-08 10:58:50', '2021-11-08 10:58:50'),
(21, 21, 'FRqzlTXozBrX4MYAUTuw5AKWgQboRAPUmTrrKafz.jpeg', '5421454', 'Admin', NULL, '2021-11-08 10:59:48', '2021-11-08 10:59:48'),
(22, 22, 'FRqzlTXozBrX4MYAUTuw5AKWgQboRAPUmTrrKafz.jpeg', '235fjjj', 'Admin', NULL, '2021-11-08 11:01:03', '2021-11-08 11:01:03'),
(23, 23, 'FRqzlTXozBrX4MYAUTuw5AKWgQboRAPUmTrrKafz.jpeg', '454478', 'Ahmed Samy Emad', NULL, '2021-11-08 11:15:01', '2021-11-08 11:15:01'),
(24, 24, 'FRqzlTXozBrX4MYAUTuw5AKWgQboRAPUmTrrKafz.jpeg', 'gf45133', 'Admin', NULL, '2021-11-08 11:43:52', '2021-11-08 11:43:52'),
(25, 25, 'FRqzlTXozBrX4MYAUTuw5AKWgQboRAPUmTrrKafz.jpeg', 'vsdffdf', 'Ahmed Samy Emad', NULL, '2021-11-08 11:49:01', '2021-11-08 11:49:01'),
(26, 26, 'FRqzlTXozBrX4MYAUTuw5AKWgQboRAPUmTrrKafz.jpeg', 'vxc1323', 'ياسر السيد محمد', NULL, '2021-11-08 14:09:38', '2021-11-08 14:09:38'),
(27, 27, 'FRqzlTXozBrX4MYAUTuw5AKWgQboRAPUmTrrKafz.jpeg', '123789', 'ياسر السيد محمد', NULL, '2021-11-08 14:11:32', '2021-11-08 14:11:32'),
(28, 28, 'FRqzlTXozBrX4MYAUTuw5AKWgQboRAPUmTrrKafz.jpeg', 'NB-11-149', 'ياسر السيد محمد', NULL, '2021-11-08 14:13:31', '2021-11-08 14:13:31');

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
(1, 1, 'NB-10-1', '8', '2', 'مدفوعه', 2, '2021-10-31', 'تم الدفع', 'Admin', NULL, '2021-10-31 17:06:24', '2021-11-06 16:03:39'),
(2, 1, 'NB-10-1', '8', '2', 'مدفوعه جزئيا', 3, '2021-10-31', 'تم دفع جزء من المبلغ', 'Mohamed Ibrahiem', NULL, '2021-10-31 17:07:45', '2021-10-31 17:07:45'),
(3, 2, '456321', '11', '3', 'غير مدفوعه', 1, '2021-10-31', 'لم تسدد', 'Mohamed Ibrahiem', NULL, '2021-10-31 17:09:42', '2021-10-31 17:09:42'),
(4, 2, '456321', '11', '3', 'مدفوعه', 2, '2021-11-01', 'تم الدفع', 'ياسر السيد محمد', NULL, '2021-11-01 14:01:05', '2021-11-01 14:01:05'),
(5, 3, '456328', '12', '4', 'غير مدفوعه', 1, '2021-11-01', 'not paid', 'Mohamed Ibrahiem', NULL, '2021-11-01 15:08:17', '2021-11-01 15:08:17'),
(6, 1, 'NB-10-1', '8', '2', 'مدفوعه', 2, '2021-10-31', 'تم الدفع', 'Admin', NULL, '2021-11-06 15:38:15', '2021-11-06 15:38:15'),
(7, 3, '456328', '12', '4', 'مدفوعه جزئيا', 3, '2021-11-06', 'تم دفع جزئ', 'Admin', NULL, '2021-11-06 15:51:20', '2021-11-06 15:51:20'),
(8, 4, 'FS-10-021', '11', '3', 'مؤجله', 4, '2021-11-06', 'الفاتوره مؤجله', 'Admin', NULL, '2021-11-06 16:15:51', '2021-11-06 16:15:51'),
(9, 5, 'NB-10-159', '7', '2', 'غير مدفوعه', 1, '2021-11-06', 'غير مدفوعه', 'Admin', NULL, '2021-11-06 19:49:51', '2021-11-06 19:49:51'),
(10, 6, '4563282', '12', '4', 'غير مدفوعه', 1, '2021-11-06', 'not paid', 'Admin', NULL, '2021-11-06 19:52:21', '2021-11-06 19:52:21'),
(11, 7, '1646312', '13', '5', 'غير مدفوعه', 1, '2021-11-06', 'not paid', 'Admin', NULL, '2021-11-06 19:53:13', '2021-11-06 19:53:13'),
(12, 8, '235631', '5', '1', 'مدفوعه جزئيا', 3, '2021-11-06', 'مدفوع جزئ', 'Admin', NULL, '2021-11-06 19:54:21', '2021-11-06 19:54:21'),
(13, 5, 'NB-10-159', '7', '2', 'مؤجله', 4, '2021-11-07', 'مؤجله', 'Ahmed Samy Emad', NULL, '2021-11-07 16:53:40', '2021-11-07 16:53:40'),
(14, 9, '5645659', '10', '3', 'غير مدفوعه', 1, '2021-11-07', 'غير مدفوعه', 'Mohamed Ibrahiem', NULL, '2021-11-07 17:19:42', '2021-11-07 17:19:42'),
(15, 10, 'NB-11-132', '9', '2', 'مدفوعه', 2, '2021-11-08', 'تم التسديد', 'Admin', NULL, '2021-11-08 08:17:06', '2021-11-08 08:17:06'),
(16, 9, '5645659', '10', '3', 'مؤجله', 4, '2021-11-08', 'مؤجله', 'Admin', NULL, '2021-11-08 08:18:09', '2021-11-08 08:18:09'),
(17, 3, '456328', '12', '4', 'مدفوعه', 2, '2021-11-08', 'تم الدفع', 'Admin', NULL, '2021-11-08 08:19:04', '2021-11-08 08:19:04'),
(18, 11, '2355c5', '11', '3', 'غير مدفوعه', 1, '2021-11-08', 'not paid', 'Admin', NULL, '2021-11-08 10:21:26', '2021-11-08 10:21:26'),
(19, 12, '312786b', '12', '4', 'غير مدفوعه', 1, '2021-11-08', 'not paid', 'Admin', NULL, '2021-11-08 10:23:41', '2021-11-08 10:23:41'),
(20, 13, '312586b', '13', '5', 'غير مدفوعه', 1, '2021-11-08', 'not paid', 'Admin', NULL, '2021-11-08 10:25:16', '2021-11-08 10:25:16'),
(21, 14, '12fdsv2', '14', '6', 'غير مدفوعه', 1, '2021-11-08', 'not paid', 'Admin', NULL, '2021-11-08 10:27:55', '2021-11-08 10:27:55'),
(22, 15, 'ds5642', '13', '5', 'غير مدفوعه', 1, '2021-11-08', 'not paid', 'Admin', NULL, '2021-11-08 10:38:51', '2021-11-08 10:38:51'),
(23, 16, '183312', '3', '1', 'غير مدفوعه', 1, '2021-11-08', 'not paid', 'Admin', NULL, '2021-11-08 10:44:30', '2021-11-08 10:44:30'),
(24, 17, 'NB-11-102', '7', '2', 'غير مدفوعه', 1, '2021-11-08', 'not paid', 'Admin', NULL, '2021-11-08 10:48:04', '2021-11-08 10:48:04'),
(25, 18, 'NB-11-100', '9', '2', 'غير مدفوعه', 1, '2021-11-08', 'not paid', 'Admin', NULL, '2021-11-08 10:50:47', '2021-11-08 10:50:47'),
(26, 19, 'dsfg21', '12', '4', 'غير مدفوعه', 1, '2021-11-08', 'not paid', 'Admin', NULL, '2021-11-08 10:55:54', '2021-11-08 10:55:54'),
(27, 20, '542145', '14', '6', 'مؤجله', 4, '2021-11-08', 'مؤجله', 'Admin', NULL, '2021-11-08 10:58:50', '2021-11-08 10:58:50'),
(28, 21, '5421454', '1', '1', 'مؤجله', 4, '2021-11-08', 'مؤجله', 'Admin', NULL, '2021-11-08 10:59:48', '2021-11-08 10:59:48'),
(29, 22, '235fjjj', '12', '4', 'غير مدفوعه', 1, '2021-11-08', 'not paid', 'Admin', NULL, '2021-11-08 11:01:03', '2021-11-08 11:01:03'),
(30, 23, '454478', '14', '6', 'مدفوعه جزئيا', 3, '2021-11-08', 'مدفوع جزئ', 'Ahmed Samy Emad', NULL, '2021-11-08 11:15:01', '2021-11-08 11:15:01'),
(31, 24, 'gf45133', '1', '1', 'غير مدفوعه', 1, '2021-11-08', 'not paid', 'Admin', NULL, '2021-11-08 11:43:52', '2021-11-08 11:43:52'),
(32, 25, 'vsdffdf', '11', '3', 'مؤجله', 4, '2021-11-08', 'مؤجله', 'Ahmed Samy Emad', NULL, '2021-11-08 11:49:01', '2021-11-08 11:49:01'),
(33, 26, 'vxc1323', '12', '4', 'غير مدفوعه', 1, '2021-11-08', 'not paid', 'ياسر السيد محمد', NULL, '2021-11-08 14:09:38', '2021-11-08 14:09:38'),
(34, 27, '123789', '3', '1', 'غير مدفوعه', 1, '2021-11-08', 'not paid', 'ياسر السيد محمد', NULL, '2021-11-08 14:11:32', '2021-11-08 14:11:32'),
(35, 28, 'NB-11-149', '9', '2', 'غير مدفوعه', 1, '2021-11-08', 'not paid', 'ياسر السيد محمد', NULL, '2021-11-08 14:13:31', '2021-11-08 14:13:31');

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
(5, '2021_10_22_105138_create_products_table', 1),
(6, '2021_10_23_164631_create_invoices_table', 1),
(7, '2021_10_23_180539_create_invoices_details_table', 1),
(8, '2021_10_23_192345_create_invoices_attachments_table', 1),
(9, '2021_10_31_123346_create_permission_tables', 1),
(10, '2021_11_08_120220_create_notifications_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(1, 'App\\User', 5),
(2, 'App\\User', 2),
(3, 'App\\User', 3),
(3, 'App\\User', 4);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('1390b791-e47f-403c-99d7-4db3af4be95e', 'App\\Notifications\\AddNewInvoice', 'App\\User', 3, '{\"id\":28,\"user\":\"\\u064a\\u0627\\u0633\\u0631 \\u0627\\u0644\\u0633\\u064a\\u062f \\u0645\\u062d\\u0645\\u062f\",\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0647 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0647 \\u062c\\u062f\\u064a\\u062f\\u0647 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0647 : \"}', NULL, '2021-11-08 14:13:37', '2021-11-08 14:13:37'),
('4bfd1757-57e0-41c4-95a1-a59858a08eca', 'App\\Notifications\\AddNewInvoice', 'App\\User', 5, '{\"id\":28,\"user\":\"\\u064a\\u0627\\u0633\\u0631 \\u0627\\u0644\\u0633\\u064a\\u062f \\u0645\\u062d\\u0645\\u062f\",\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0647 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0647 \\u062c\\u062f\\u064a\\u062f\\u0647 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0647 : \"}', '2021-11-08 14:14:16', '2021-11-08 14:13:41', '2021-11-08 14:14:16'),
('56b29c21-aac4-42c1-8510-410781bf1926', 'App\\Notifications\\AddNewInvoice', 'App\\User', 1, '{\"id\":24,\"user\":\"Admin\",\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0647 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0647 \\u062c\\u062f\\u064a\\u062f\\u0647 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0647 : \"}', NULL, '2021-11-08 11:43:54', '2021-11-08 11:43:54'),
('5feb7c6c-c624-41b1-9c82-ea984397a42e', 'App\\Notifications\\AddNewInvoice', 'App\\User', 1, '{\"id\":27,\"user\":\"\\u064a\\u0627\\u0633\\u0631 \\u0627\\u0644\\u0633\\u064a\\u062f \\u0645\\u062d\\u0645\\u062f\",\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0647 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0647 \\u062c\\u062f\\u064a\\u062f\\u0647 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0647 : \"}', NULL, '2021-11-08 14:11:35', '2021-11-08 14:11:35'),
('65f80335-982d-4c62-bd8e-e2be17f0ae62', 'App\\Notifications\\AddNewInvoice', 'App\\User', 3, '{\"id\":24,\"user\":\"Admin\",\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0647 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0647 \\u062c\\u062f\\u064a\\u062f\\u0647 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0647 : \"}', NULL, '2021-11-08 11:43:58', '2021-11-08 11:43:58'),
('678cb249-8755-4115-b997-96117100d196', 'App\\Notifications\\AddNewInvoice', 'App\\User', 3, '{\"id\":26,\"user\":\"\\u064a\\u0627\\u0633\\u0631 \\u0627\\u0644\\u0633\\u064a\\u062f \\u0645\\u062d\\u0645\\u062f\",\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0647 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0647 \\u062c\\u062f\\u064a\\u062f\\u0647 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0647 : \"}', NULL, '2021-11-08 14:09:44', '2021-11-08 14:09:44'),
('8f59cb12-1196-4e2c-8b7b-e49070647a05', 'App\\Notifications\\AddNewInvoice', 'App\\User', 2, '{\"id\":26,\"user\":\"\\u064a\\u0627\\u0633\\u0631 \\u0627\\u0644\\u0633\\u064a\\u062f \\u0645\\u062d\\u0645\\u062f\",\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0647 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0647 \\u062c\\u062f\\u064a\\u062f\\u0647 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0647 : \"}', NULL, '2021-11-08 14:09:42', '2021-11-08 14:09:42'),
('8fd9a737-8f05-4f03-b960-933cf793d5d3', 'App\\Notifications\\AddNewInvoice', 'App\\User', 1, '{\"id\":28,\"user\":\"\\u064a\\u0627\\u0633\\u0631 \\u0627\\u0644\\u0633\\u064a\\u062f \\u0645\\u062d\\u0645\\u062f\",\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0647 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0647 \\u062c\\u062f\\u064a\\u062f\\u0647 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0647 : \"}', NULL, '2021-11-08 14:13:34', '2021-11-08 14:13:34'),
('90bb9910-7d2f-40c5-a0f1-3883bc8326fa', 'App\\Notifications\\AddNewInvoice', 'App\\User', 2, '{\"id\":27,\"user\":\"\\u064a\\u0627\\u0633\\u0631 \\u0627\\u0644\\u0633\\u064a\\u062f \\u0645\\u062d\\u0645\\u062f\",\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0647 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0647 \\u062c\\u062f\\u064a\\u062f\\u0647 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0647 : \"}', NULL, '2021-11-08 14:11:37', '2021-11-08 14:11:37'),
('97436e49-358b-4ee2-8971-9222b5169458', 'App\\Notifications\\AddNewInvoice', 'App\\User', 4, '{\"id\":25,\"user\":\"Ahmed Samy Emad\",\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0647 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0647 \\u062c\\u062f\\u064a\\u062f\\u0647 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0647 : \"}', NULL, '2021-11-08 11:49:09', '2021-11-08 11:49:09'),
('99ec0c81-fca0-421a-873f-c7e6afd2c269', 'App\\Notifications\\AddNewInvoice', 'App\\User', 2, '{\"id\":25,\"user\":\"Ahmed Samy Emad\",\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0647 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0647 \\u062c\\u062f\\u064a\\u062f\\u0647 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0647 : \"}', NULL, '2021-11-08 11:49:05', '2021-11-08 11:49:05'),
('9ecdb9eb-b716-49b7-a94e-be76e277b49d', 'App\\Notifications\\AddNewInvoice', 'App\\User', 5, '{\"id\":24,\"user\":\"Admin\",\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0647 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0647 \\u062c\\u062f\\u064a\\u062f\\u0647 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0647 : \"}', '2021-11-08 13:22:04', '2021-11-08 11:44:02', '2021-11-08 13:22:04'),
('a015dc47-e64e-4418-98fd-84abdaf80c1e', 'App\\Notifications\\AddNewInvoice', 'App\\User', 2, '{\"id\":28,\"user\":\"\\u064a\\u0627\\u0633\\u0631 \\u0627\\u0644\\u0633\\u064a\\u062f \\u0645\\u062d\\u0645\\u062f\",\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0647 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0647 \\u062c\\u062f\\u064a\\u062f\\u0647 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0647 : \"}', NULL, '2021-11-08 14:13:35', '2021-11-08 14:13:35'),
('a1545ca8-a388-4db4-9335-5e1ac59d8650', 'App\\Notifications\\AddNewInvoice', 'App\\User', 2, '{\"id\":24,\"user\":\"Admin\",\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0647 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0647 \\u062c\\u062f\\u064a\\u062f\\u0647 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0647 : \"}', NULL, '2021-11-08 11:43:56', '2021-11-08 11:43:56'),
('a290ae1e-0116-40e2-b5f8-1649c648e3fd', 'App\\Notifications\\AddNewInvoice', 'App\\User', 1, '{\"id\":26,\"user\":\"\\u064a\\u0627\\u0633\\u0631 \\u0627\\u0644\\u0633\\u064a\\u062f \\u0645\\u062d\\u0645\\u062f\",\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0647 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0647 \\u062c\\u062f\\u064a\\u062f\\u0647 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0647 : \"}', NULL, '2021-11-08 14:09:40', '2021-11-08 14:09:40'),
('b01d583d-2eea-486d-bafb-70532af93611', 'App\\Notifications\\AddNewInvoice', 'App\\User', 1, '{\"id\":25,\"user\":\"Ahmed Samy Emad\",\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0647 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0647 \\u062c\\u062f\\u064a\\u062f\\u0647 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0647 : \"}', NULL, '2021-11-08 11:49:04', '2021-11-08 11:49:04'),
('b1b7ccc0-8d14-4d2b-8feb-755c111c8ce6', 'App\\Notifications\\AddNewInvoice', 'App\\User', 4, '{\"id\":24,\"user\":\"Admin\",\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0647 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0647 \\u062c\\u062f\\u064a\\u062f\\u0647 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0647 : \"}', NULL, '2021-11-08 11:44:00', '2021-11-08 11:44:00'),
('b7b2a37e-a93e-4a6c-82be-22472c6dd83a', 'App\\Notifications\\AddNewInvoice', 'App\\User', 3, '{\"id\":25,\"user\":\"Ahmed Samy Emad\",\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0647 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0647 \\u062c\\u062f\\u064a\\u062f\\u0647 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0647 : \"}', NULL, '2021-11-08 11:49:07', '2021-11-08 11:49:07'),
('c2e50509-1d05-4d9d-95cc-87df1e79770d', 'App\\Notifications\\AddNewInvoice', 'App\\User', 4, '{\"id\":27,\"user\":\"\\u064a\\u0627\\u0633\\u0631 \\u0627\\u0644\\u0633\\u064a\\u062f \\u0645\\u062d\\u0645\\u062f\",\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0647 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0647 \\u062c\\u062f\\u064a\\u062f\\u0647 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0647 : \"}', NULL, '2021-11-08 14:11:40', '2021-11-08 14:11:40'),
('ca5044a2-b2b7-4980-902f-0fe243137b52', 'App\\Notifications\\AddNewInvoice', 'App\\User', 5, '{\"id\":25,\"user\":\"Ahmed Samy Emad\",\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0647 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0647 \\u062c\\u062f\\u064a\\u062f\\u0647 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0647 : \"}', '2021-11-08 13:25:12', '2021-11-08 11:49:11', '2021-11-08 13:25:12'),
('d8e051cf-516e-4e7e-a391-887c2c46103b', 'App\\Notifications\\AddNewInvoice', 'App\\User', 5, '{\"id\":27,\"user\":\"\\u064a\\u0627\\u0633\\u0631 \\u0627\\u0644\\u0633\\u064a\\u062f \\u0645\\u062d\\u0645\\u062f\",\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0647 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0647 \\u062c\\u062f\\u064a\\u062f\\u0647 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0647 : \"}', '2021-11-08 14:14:16', '2021-11-08 14:11:43', '2021-11-08 14:14:16'),
('e6879837-a021-4a61-82ce-a7d6310cd650', 'App\\Notifications\\AddNewInvoice', 'App\\User', 4, '{\"id\":26,\"user\":\"\\u064a\\u0627\\u0633\\u0631 \\u0627\\u0644\\u0633\\u064a\\u062f \\u0645\\u062d\\u0645\\u062f\",\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0647 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0647 \\u062c\\u062f\\u064a\\u062f\\u0647 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0647 : \"}', NULL, '2021-11-08 14:09:46', '2021-11-08 14:09:46'),
('eef844e9-befb-4415-b2b6-e97f459ab0c6', 'App\\Notifications\\AddNewInvoice', 'App\\User', 4, '{\"id\":28,\"user\":\"\\u064a\\u0627\\u0633\\u0631 \\u0627\\u0644\\u0633\\u064a\\u062f \\u0645\\u062d\\u0645\\u062f\",\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0647 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0647 \\u062c\\u062f\\u064a\\u062f\\u0647 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0647 : \"}', NULL, '2021-11-08 14:13:39', '2021-11-08 14:13:39'),
('f5a64d54-16b2-4fd8-9f3b-b0b4b1747a92', 'App\\Notifications\\AddNewInvoice', 'App\\User', 3, '{\"id\":27,\"user\":\"\\u064a\\u0627\\u0633\\u0631 \\u0627\\u0644\\u0633\\u064a\\u062f \\u0645\\u062d\\u0645\\u062f\",\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0647 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0647 \\u062c\\u062f\\u064a\\u062f\\u0647 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0647 : \"}', NULL, '2021-11-08 14:11:38', '2021-11-08 14:11:38'),
('ff1287c4-9683-47a5-957c-e54b29c26047', 'App\\Notifications\\AddNewInvoice', 'App\\User', 5, '{\"id\":26,\"user\":\"\\u064a\\u0627\\u0633\\u0631 \\u0627\\u0644\\u0633\\u064a\\u062f \\u0645\\u062d\\u0645\\u062f\",\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0647 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0647 \\u062c\\u062f\\u064a\\u062f\\u0647 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0647 : \"}', '2021-11-08 14:14:16', '2021-11-08 14:09:48', '2021-11-08 14:14:16');

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
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'الفواتير', 'web', '2021-11-01 13:03:43', '2021-11-01 13:03:43'),
(2, 'فواتيري', 'web', '2021-11-01 13:03:43', '2021-11-01 13:03:43'),
(3, 'قائمه الفواتير', 'web', '2021-11-01 13:03:43', '2021-11-01 13:03:43'),
(4, 'الفواتير المدفوعه', 'web', '2021-11-01 13:03:43', '2021-11-01 13:03:43'),
(5, 'الفواتير المدفوعه جزئيا', 'web', '2021-11-01 13:03:43', '2021-11-01 13:03:43'),
(6, 'الفواتير الغير مدفوعه', 'web', '2021-11-01 13:03:43', '2021-11-01 13:03:43'),
(7, 'الفواتير المؤجله', 'web', '2021-11-01 13:03:43', '2021-11-01 13:03:43'),
(8, 'الفواتير المؤرشفه', 'web', '2021-11-01 13:03:43', '2021-11-01 13:03:43'),
(9, 'التقارير', 'web', '2021-11-01 13:03:43', '2021-11-01 13:03:43'),
(10, 'تقاريري', 'web', '2021-11-01 13:03:43', '2021-11-01 13:03:43'),
(11, 'تقرير الفواتير', 'web', '2021-11-01 13:03:43', '2021-11-01 13:03:43'),
(12, 'تقرير العملاء', 'web', '2021-11-01 13:03:43', '2021-11-01 13:03:43'),
(13, 'المستخدمين', 'web', '2021-11-01 13:03:43', '2021-11-01 13:03:43'),
(14, 'قائمه المستخدمين', 'web', '2021-11-01 13:03:43', '2021-11-01 13:03:43'),
(15, 'صلاحيات المستخدمين', 'web', '2021-11-01 13:03:43', '2021-11-01 13:03:43'),
(16, 'الاعدادات', 'web', '2021-11-01 13:03:43', '2021-11-01 13:03:43'),
(17, 'المنتجات', 'web', '2021-11-01 13:03:43', '2021-11-01 13:03:43'),
(18, 'الاقسام', 'web', '2021-11-01 13:03:43', '2021-11-01 13:03:43'),
(19, 'اضافه فاتوره', 'web', '2021-11-01 13:03:43', '2021-11-01 13:03:43'),
(20, 'حذف الفاتوره', 'web', '2021-11-01 13:03:44', '2021-11-01 13:03:44'),
(21, 'تصدير EXCEL', 'web', '2021-11-01 13:03:44', '2021-11-01 13:03:44'),
(22, 'تغيير حاله الدفع', 'web', '2021-11-01 13:03:44', '2021-11-01 13:03:44'),
(23, 'تعديل الفاتوره', 'web', '2021-11-01 13:03:44', '2021-11-01 13:03:44'),
(24, 'ارشفه الفاتوره', 'web', '2021-11-01 13:03:44', '2021-11-01 13:03:44'),
(25, 'طباعه الفاتوره', 'web', '2021-11-01 13:03:44', '2021-11-01 13:03:44'),
(26, 'اضافه مرفق', 'web', '2021-11-01 13:03:44', '2021-11-01 13:03:44'),
(27, 'حذف المرفق', 'web', '2021-11-01 13:03:44', '2021-11-01 13:03:44'),
(28, 'اضافه مستخدم', 'web', '2021-11-01 13:03:44', '2021-11-01 13:03:44'),
(29, 'تعديل مستخدم', 'web', '2021-11-01 13:03:44', '2021-11-01 13:03:44'),
(30, 'حذف مستخدم', 'web', '2021-11-01 13:03:44', '2021-11-01 13:03:44'),
(31, 'عرض صلاحيه', 'web', '2021-11-01 13:03:44', '2021-11-01 13:03:44'),
(32, 'اضافه صلاحيه', 'web', '2021-11-01 13:03:44', '2021-11-01 13:03:44'),
(33, 'تعديل صلاحيه', 'web', '2021-11-01 13:03:44', '2021-11-01 13:03:44'),
(34, 'حذف صلاحيه', 'web', '2021-11-01 13:03:44', '2021-11-01 13:03:44'),
(35, 'اضافه منتج', 'web', '2021-11-01 13:03:44', '2021-11-01 13:03:44'),
(36, 'تعديل منتج', 'web', '2021-11-01 13:03:44', '2021-11-01 13:03:44'),
(37, 'حذف منتج', 'web', '2021-11-01 13:03:44', '2021-11-01 13:03:44'),
(38, 'اضافه قسم', 'web', '2021-11-01 13:03:44', '2021-11-01 13:03:44'),
(39, 'تعديل قسم', 'web', '2021-11-01 13:03:44', '2021-11-01 13:03:44'),
(40, 'حذف قسم', 'web', '2021-11-01 13:03:44', '2021-11-01 13:03:44'),
(41, 'الاشعارات', 'web', '2021-11-01 13:03:44', '2021-11-01 13:03:44'),
(42, 'استرجاع الفاتوره', 'web', '2021-11-01 13:03:44', '2021-11-01 13:03:44');

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
(1, 'قروض سيارات', 'قرض سياره ميسر', 1, '2021-10-23 09:59:09', '2021-10-23 09:59:09'),
(2, 'قرض شباب', 'قرض للشباب', 1, '2021-10-23 09:59:31', '2021-10-23 09:59:31'),
(3, 'قرض الميسر', 'قرض ميسر', 1, '2021-10-23 09:59:45', '2021-10-23 09:59:45'),
(4, 'قرض اسكان', 'قرض للاسكان', 1, '2021-10-23 09:59:58', '2021-10-23 09:59:58'),
(5, 'قروض متعثره', 'متعثره', 1, '2021-10-23 10:00:11', '2021-10-23 10:00:11'),
(6, 'قروض مشتروات', 'مشتروات', 2, '2021-10-23 10:00:27', '2021-10-23 10:00:27'),
(7, 'قرض للشباب', 'قرض شباب مخفض', 2, '2021-10-23 10:00:42', '2021-10-23 10:00:42'),
(8, 'قرض سياره', 'قرض سياره جديده', 2, '2021-10-23 10:00:56', '2021-10-23 10:00:56'),
(9, 'تمويل عقاري', 'عقار', 2, '2021-10-23 10:01:07', '2021-10-23 10:01:07'),
(10, 'تمويل اسكان اجتماعي', 'اسكان', 3, '2021-10-23 10:01:23', '2021-10-23 10:01:23'),
(11, 'قروض ميسره', 'ميسره فيصل', 3, '2021-10-23 10:01:36', '2021-10-23 10:01:36'),
(12, 'قروض صغيره', 'قروض صغيره', 4, '2021-10-23 10:01:52', '2021-10-23 10:01:52'),
(13, 'قروض مشتريات', 'مشتريات', 5, '2021-10-23 10:02:20', '2021-10-23 10:02:20'),
(14, 'قروض عقاريه', 'عقارات', 6, '2021-10-23 10:02:33', '2021-10-23 10:02:33');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'superAdmin', 'web', '2021-11-01 13:03:44', '2021-11-01 13:03:44'),
(2, 'admin', 'web', '2021-11-01 13:15:53', '2021-11-01 13:15:53'),
(3, 'user', 'web', '2021-11-01 13:16:37', '2021-11-01 13:16:37');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(3, 3),
(4, 1),
(4, 2),
(4, 3),
(5, 1),
(5, 2),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 1),
(8, 2),
(9, 1),
(9, 2),
(9, 3),
(10, 1),
(10, 2),
(10, 3),
(11, 1),
(11, 2),
(11, 3),
(12, 1),
(12, 2),
(12, 3),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(16, 2),
(17, 1),
(17, 2),
(18, 1),
(18, 2),
(19, 1),
(19, 2),
(19, 3),
(20, 1),
(20, 2),
(21, 1),
(21, 2),
(21, 3),
(22, 1),
(22, 2),
(22, 3),
(23, 1),
(23, 2),
(23, 3),
(24, 1),
(24, 2),
(25, 1),
(25, 2),
(25, 3),
(26, 1),
(26, 2),
(26, 3),
(27, 1),
(27, 2),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(35, 2),
(36, 1),
(36, 2),
(37, 1),
(37, 2),
(38, 1),
(38, 2),
(39, 1),
(39, 2),
(40, 1),
(40, 2),
(41, 1),
(41, 2),
(42, 1);

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
(1, 'بنك مصر', 'البنك المصري', 'mohamed Ibrahiem', '2021-10-23 09:57:19', '2021-10-23 09:57:19'),
(2, 'البنك الاهلي', 'البنك الاهلي المصري', 'mohamed Ibrahiem', '2021-10-23 09:57:32', '2021-10-23 09:57:32'),
(3, 'بنك فيصل', 'بنك فيصل الاسلامي', 'mohamed Ibrahiem', '2021-10-23 09:57:48', '2021-10-23 09:57:48'),
(4, 'البنك العربي الافريقي', 'البنك الافريقي', 'mohamed Ibrahiem', '2021-10-23 09:58:08', '2021-10-23 09:58:08'),
(5, 'بنك CIB', 'CIB Bank', 'mohamed Ibrahiem', '2021-10-23 09:58:27', '2021-10-23 09:58:27'),
(6, 'بنك ابوظبي', 'بنك ابوظبي الاسلامي', 'mohamed Ibrahiem', '2021-10-23 09:58:44', '2021-10-23 09:58:44');

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
  `role_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role_name`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mohamed Ibrahiem', 'mohamed@yahoo.com', NULL, '$2y$10$Pv5ZI2wEa9o4IRgCk1J7SOwckjqY1yEckjEO.PUUenqlbGkBglVNa', 'superAdmin', 'مفعل', 'LfhodqOCz15yTtJhWkWmVWhzglTABA7EjncJ3KS9fQUrRjlGTd72fcXHiPSh', '2021-11-01 13:03:44', '2021-11-01 13:03:44'),
(2, 'Hady Mohamed', 'hady@yahoo.com', NULL, '$2y$10$MwN6SlxB/v6fX.EL1gNm9u50RaO7mRpoQzyQsrFioxJWJ.Y3NcA7e', 'admin', 'مفعل', 'JLKr8NGpR1xhuhG9R3QTarBJNJk6rmjU2H18RQGPkH3KOM0Fl4B0VVvNI9TX', '2021-11-01 13:19:29', '2021-11-08 12:27:45'),
(3, 'ياسر السيد محمد', 'yaser@gmail.com', NULL, '$2y$10$mAY6yzVTb8hO4Dfkl91Ekuoz17BniCqNR8sjO8wmtfNp4lWF93T8i', 'user', 'مفعل', 'gPW63EIo3tPkrFHXevanpvb96UxmG8awVdrXIzVG4FqBvnfhjz06UVlGLYeD', '2021-11-01 13:28:30', '2021-11-08 12:28:15'),
(4, 'Ahmed Samy Emad', 'ahmed2021@yahoo.com', NULL, '$2y$10$UDIWfWzU/ndaPLWugjo9uuABXwrir3xtYoSWQxU/zFPe/qwHZ3alS', 'user', 'مفعل', 'wQnuw1ybeOJLtoSZLBDFNluQVNcTG5K619ibMWJqT76o1dCEl6405fUq4TKi', '2021-11-01 13:44:50', '2021-11-01 16:06:19'),
(5, 'Admin', 'admin@yahoo.com', NULL, '$2y$10$.5RBIMAW.hthA0FUXIyt1uVvTFQyCszIkeBdkvu7grhyrH6/AsiJy', 'superAdmin', 'مفعل', 'eP9XIyoJzBdqzC1n0E55HvgU0apWTYLtGA1igEI7yHJ3KRbnJQBAcWvgpKsy', '2021-11-01 13:50:56', '2021-11-01 13:50:56');

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
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_section_id_foreign` (`section_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `invoices_attachments`
--
ALTER TABLE `invoices_attachments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `invoices_details`
--
ALTER TABLE `invoices_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
