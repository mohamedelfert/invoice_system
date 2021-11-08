-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2021 at 10:55 AM
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
(3, '456328', '2021-11-01', '2021-11-24', 4, 12, '200000.00', '35000.00', '0.00', '0.13', '4550.00', '39550.00', 'مدفوعه جزئيا', 3, 'تم دفع جزئ', NULL, '2021-11-01 15:08:17', '2021-11-06 15:51:20'),
(4, 'FS-10-021', '2021-11-04', '2021-12-11', 3, 11, '80000.00', '20000.00', '3485.00', '0.05', '825.75', '17340.75', 'مؤجله', 4, 'الفاتوره مؤجله', NULL, '2021-11-06 16:15:51', '2021-11-06 16:15:51'),
(5, 'NB-10-159', '2021-11-06', '2021-12-10', 2, 7, '250000.00', '25000.00', '5620.00', '0.13', '2519.40', '21899.40', 'غير مدفوعه', 1, 'غير مدفوعه', NULL, '2021-11-06 19:49:51', '2021-11-06 19:49:51'),
(6, '4563282', '2021-11-06', '2021-12-11', 4, 12, '80000.00', '5000.00', '2530.00', '0.10', '247.00', '2717.00', 'غير مدفوعه', 1, 'not paid', NULL, '2021-11-06 19:52:21', '2021-11-06 19:52:21'),
(7, '1646312', '2021-11-06', '2021-11-30', 5, 13, '50000.00', '3670.00', '1500.00', '0.14', '303.80', '2473.80', 'غير مدفوعه', 1, 'not paid', NULL, '2021-11-06 19:53:13', '2021-11-06 19:53:13'),
(8, '235631', '2021-11-06', '2021-12-22', 1, 5, '80000.00', '5000.00', '2680.00', '0.05', '116.00', '2436.00', 'مدفوعه جزئيا', 3, 'مدفوع جزئ', NULL, '2021-11-06 19:54:21', '2021-11-06 19:54:21');

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
(8, 8, 'FRqzlTXozBrX4MYAUTuw5AKWgQboRAPUmTrrKafz.jpeg', '235631', 'Admin', NULL, '2021-11-06 19:54:21', '2021-11-06 19:54:21');

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
(12, 8, '235631', '5', '1', 'مدفوعه جزئيا', 3, '2021-11-06', 'مدفوع جزئ', 'Admin', NULL, '2021-11-06 19:54:21', '2021-11-06 19:54:21');

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
(9, '2021_10_31_123346_create_permission_tables', 1);

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
(1, 'Mohamed Ibrahiem', 'mohamed@yahoo.com', NULL, '$2y$10$Pv5ZI2wEa9o4IRgCk1J7SOwckjqY1yEckjEO.PUUenqlbGkBglVNa', 'superAdmin', 'مفعل', '6JlcOKYqODC1BFmFzFaPSTryqZAPCjzwYiZrWCtmTA2IgozPq09ATl1c8Fhu', '2021-11-01 13:03:44', '2021-11-01 13:03:44'),
(2, 'Hady Mohamed', 'hady@yahoo.com', NULL, '$2y$10$WYtTd/o3HLdQduASw8capeXFGrhO1JPdjfGsnI8YNt0uFOJihPJoy', 'user', 'مفعل', 'AQXPAIhzDqBEyOFemSSQQ3jJShdXFuxrTmNwMEDDpeCVwKzQYGhyz4uki9Y4', '2021-11-01 13:19:29', '2021-11-01 13:19:29'),
(3, 'ياسر السيد محمد', 'yaser@gmail.com', NULL, '$2y$10$KNJklFL1NFJDVujDLS18heLfi8M9muqlJVpqPudVBV40YWlXO6OAS', 'admin', 'مفعل', 'gPW63EIo3tPkrFHXevanpvb96UxmG8awVdrXIzVG4FqBvnfhjz06UVlGLYeD', '2021-11-01 13:28:30', '2021-11-01 13:28:30'),
(4, 'Ahmed Samy Emad', 'ahmed2021@yahoo.com', NULL, '$2y$10$UDIWfWzU/ndaPLWugjo9uuABXwrir3xtYoSWQxU/zFPe/qwHZ3alS', 'user', 'مفعل', 'RApFBcF9icqOJzlOuQ60e4376fJvdwZ6mzoI2aWwi42zWXiIgwZOUqmKVtSo', '2021-11-01 13:44:50', '2021-11-01 16:06:19'),
(5, 'Admin', 'admin@yahoo.com', NULL, '$2y$10$.5RBIMAW.hthA0FUXIyt1uVvTFQyCszIkeBdkvu7grhyrH6/AsiJy', 'superAdmin', 'مفعل', 'U7yoFwcchxLolGkr1Qh6pWOMj0ghJsXKh0LhBssWfA7HZ0eH75mkxE8hO6lF', '2021-11-01 13:50:56', '2021-11-01 13:50:56');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `invoices_attachments`
--
ALTER TABLE `invoices_attachments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `invoices_details`
--
ALTER TABLE `invoices_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
