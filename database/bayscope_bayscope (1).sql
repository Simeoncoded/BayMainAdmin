-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2024 at 03:48 AM
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
-- Database: `bayscope_bayscope`
--

-- --------------------------------------------------------

--
-- Table structure for table `billings`
--

CREATE TABLE `billings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `client_pin` varchar(255) NOT NULL,
  `service` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `receiptURL` varchar(50) DEFAULT NULL,
  `last_digits` int(11) NOT NULL,
  `card_type` varchar(255) NOT NULL,
  `date` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--

CREATE TABLE `cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_pin` varchar(255) NOT NULL,
  `authorization_code` varchar(255) DEFAULT NULL,
  `bin` varchar(255) DEFAULT NULL,
  `last4` varchar(255) DEFAULT NULL,
  `exp_month` varchar(255) DEFAULT NULL,
  `exp_year` varchar(255) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_pin` varchar(255) NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `client_pin`, `service_name`, `price`, `amount`, `created_at`, `updated_at`) VALUES
(5, 'BAY9777', 'bayscope-Ecommerce', 15000, 3, '2024-06-11 20:00:22', '2024-06-12 19:09:48'),
(11, 'BAY5391', 'edu-starter', 19000, 1, '2024-06-30 02:35:40', '2024-06-30 02:35:40'),
(13, 'BAY5391', 'Bayscope Ecommerce', 15000, 3, '2024-06-30 23:03:33', '2024-07-02 19:13:14'),
(15, 'BAY5391', 'Customer Relationship Management', 15000, 1, '2024-07-03 07:46:00', '2024-07-03 07:46:00'),
(16, 'BAY5391', 'Business Financial Solution', 0, 1, '2024-07-03 08:24:05', '2024-07-03 08:24:05');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `client_id` int(10) UNSIGNED NOT NULL,
  `client_pin` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact` varchar(255) NOT NULL,
  `industry` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `specialist` varchar(500) DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`client_id`, `client_pin`, `name`, `email`, `country`, `address`, `contact`, `industry`, `image`, `password`, `specialist`, `verified`, `created_at`, `updated_at`) VALUES
(10, 'BAY5391', 'Bayscope', 'sirabdull70@gmail.com', NULL, 'No 35 Abuja FCT', '08145931080', 'Healthcare', NULL, '$2y$10$CyBm7bQPJmc1rbGuGhBrCeZRPknPob5aG9bvTohl7xTH3n.C5r3pC', 'BAYEMP_19832', 0, '2024-06-13 15:08:28', '2024-06-13 15:08:28'),
(11, 'BAY6596', 'BAYSCOPE', 'sirabdull84@gmail.com', NULL, 'No 35 chief nnana street', '8145931080', 'Business', NULL, '$2y$10$RSM7LB0UW9fkDRs9rmo7nOmSGeHID.ZfJe5QvgyUgjEOIqTuJvFfO', 'BAYEMP_15157', 0, '2024-07-08 14:43:21', '2024-07-08 14:43:21'),
(12, 'BAY9157', 'Test', 'test@bayscope.org', NULL, 'lagos', '234232232', 'Real-estate', NULL, '$2y$10$8i94NPDLolvzNCrQq0OLzetPbmiur7eYUhI3DfXdkVe/B8yct2yUS', 'BAYEMP_14819', 0, '2024-07-10 01:11:10', '2024-07-10 01:11:10');

-- --------------------------------------------------------

--
-- Table structure for table `client_tokens`
--

CREATE TABLE `client_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_pin` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_tokens`
--

INSERT INTO `client_tokens` (`id`, `client_pin`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(20, 'BAY5391', 'access-token', '9iBSjA4VXx7auDraK6v0', 'client', NULL, NULL, '2024-06-30 02:34:24', '2024-06-30 02:34:24'),
(21, 'BAY5391', 'access-token', 'JMCMQGoB56igU3MkrNf5', 'client', NULL, NULL, '2024-06-30 16:14:10', '2024-06-30 16:14:10'),
(22, 'BAY6596', 'access-token', 'J1bBpBrlHxOXMQBbAjmk', 'client', NULL, NULL, '2024-07-08 14:43:25', '2024-07-08 14:43:25'),
(23, 'BAY5391', 'access-token', 'dnFP6eDc5W8qmYyZ6hKk', 'client', NULL, NULL, '2024-07-09 06:54:54', '2024-07-09 06:54:54'),
(24, 'BAY5391', 'access-token', '6XeuZTKmiEDNn3ZiucVj', 'client', NULL, NULL, '2024-07-09 07:18:21', '2024-07-09 07:18:21'),
(25, 'BAY5391', 'access-token', 'j591jMwneGmhxTu76HpM', 'client', NULL, NULL, '2024-07-09 14:09:03', '2024-07-09 14:09:03'),
(26, 'BAY5391', 'access-token', 'ilIPpQ3MIjUG3BSOnh2b', 'client', NULL, NULL, '2024-07-09 14:09:05', '2024-07-09 14:09:05'),
(27, 'BAY5391', 'access-token', 'OukhKXwLJh8IyLUQ9Eaj', 'client', NULL, NULL, '2024-07-09 14:09:06', '2024-07-09 14:09:06'),
(28, 'BAY5391', 'access-token', 'pgCZ34dxiOokNJUwnRXM', 'client', NULL, NULL, '2024-07-09 14:09:07', '2024-07-09 14:09:07'),
(29, 'BAY5391', 'access-token', 'vAHSKjvvCwXgEXl5zHQE', 'client', NULL, NULL, '2024-07-09 14:09:09', '2024-07-09 14:09:09'),
(30, 'BAY5391', 'access-token', 'CnjuPFC1vL74cIhCRNvY', 'client', NULL, NULL, '2024-07-09 14:09:11', '2024-07-09 14:09:11'),
(31, 'BAY5391', 'access-token', 'bB8JsDvyB8fdVDkhg8bh', 'client', NULL, NULL, '2024-07-09 19:39:57', '2024-07-09 19:39:57'),
(32, 'BAY5391', 'access-token', 'fRDUGSBNHQBd7AyxC357', 'client', NULL, NULL, '2024-07-09 19:40:03', '2024-07-09 19:40:03'),
(33, 'BAY5391', 'access-token', '7NEXNNto3wrWiCFbXM2T', 'client', NULL, NULL, '2024-07-09 19:41:12', '2024-07-09 19:41:12'),
(35, 'BAY5391', 'access-token', 'D68x7T37efWdyO3K9V9x', 'client', NULL, NULL, '2024-07-11 00:14:35', '2024-07-11 00:14:35');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `contact` varchar(255) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `type`, `name`, `email`, `reason`, `contact`, `message`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Akintayo jide Abdullah', 'sirabdull70@gmail.com', 'Feedback', '08145931080', 'hi', '2024-06-23 15:56:53', '2024-06-23 15:56:53'),
(2, NULL, 'Akintayo jide Abdullah', 'sirabdull70@gmail.com', 'Feedback', '08145931080', 'hi', '2024-06-23 15:57:24', '2024-06-23 15:57:24'),
(3, NULL, 'Akintayo jide Abdullah', 'sirabdull84@gmail.com', 'Feedback', '08135665488', NULL, '2024-06-24 18:30:21', '2024-06-24 18:30:21'),
(4, NULL, 'Akintayo jide Abdullah', 'sirabdull84@gmail.com', 'Sales', '08135665488', 'hello i need support', '2024-06-24 20:32:58', '2024-06-24 20:32:58'),
(5, NULL, 'Akintayo jide Abdullah', 'sirabdull70@gmail.com', 'Sales', '08135665488', 'hello i need support', '2024-06-24 20:33:44', '2024-06-24 20:33:44'),
(6, NULL, 'Akintayo jide Abdullah', 'sirabdull70@gmail.com', 'Support', '08135665488', 'hey i nedd helopp', '2024-07-03 09:14:19', '2024-07-03 09:14:19'),
(7, NULL, 'Akintayo jide Abdullah', 'sirabdull84@gmail.com', 'Support', '08135665488', 'i need help with proSuite i will like to know how it works and how the functionalities goes because i really need it.', '2024-07-03 09:19:30', '2024-07-03 09:19:30'),
(8, NULL, 'abdullahi', 'sirabdull70@gmail.com', 'Support', '08145931080', 'i need help', '2024-07-09 15:11:18', '2024-07-09 15:11:18'),
(9, NULL, 'abdullahi', 'billing@bayscope.org', 'Support', '08145931080', 'i need help', '2024-07-09 15:12:40', '2024-07-09 15:12:40'),
(10, NULL, 'abdullahi', 'support@nmscompendium.com.ng', 'Support', '08145931080', 'i need help', '2024-07-09 15:17:30', '2024-07-09 15:17:30'),
(11, NULL, 'abdullahi', 'sirabdull70@gmail.com', 'Support', '08145931080', 'i need help', '2024-07-09 15:21:03', '2024-07-09 15:21:03'),
(12, NULL, 'abdullahi', 'sirabdull70@gmail.com', 'Support', '08145931080', 'i need help', '2024-07-09 15:29:13', '2024-07-09 15:29:13'),
(13, NULL, 'abdullahi', 'sirabdull70@gmail.com', 'Support', '08145931080', 'i need help', '2024-07-09 15:41:35', '2024-07-09 15:41:35'),
(14, NULL, 'abdullahi', 'sirabdull70@gmail.com', 'Support', '08145931080', 'i need help', '2024-07-09 15:48:24', '2024-07-09 15:48:24'),
(15, NULL, 'abdullahi', 'sirabdull70@gmail.com', 'Support', '08145931080', 'i need help', '2024-07-09 15:49:31', '2024-07-09 15:49:31'),
(16, NULL, 'abdullahi', 'sirabdull70@gmail.com', 'Support', '08145931080', 'i need help', '2024-07-09 15:54:35', '2024-07-09 15:54:35'),
(17, NULL, 'abdullahi', 'sirabdull70@gmail.com', 'Support', '67777777777', NULL, '2024-07-09 17:02:46', '2024-07-09 17:02:46'),
(18, NULL, 'abdullahi', 'billing@bayscope.org', 'Support', '67777777777', NULL, '2024-07-09 17:04:22', '2024-07-09 17:04:22');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `salary` decimal(8,2) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(67) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `skills` varchar(255) DEFAULT NULL,
  `deployment` varchar(255) DEFAULT NULL,
  `employment_type` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `salary_bank` varchar(255) DEFAULT NULL,
  `salary_account` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `salary`, `email`, `password`, `image`, `token`, `role`, `skills`, `deployment`, `employment_type`, `contact`, `address`, `salary_bank`, `salary_account`, `created_at`, `updated_at`)
 VALUES
(2, 'Prof. Waldo Kunze MD', 95976.00, 'lavinia34@example.org', '', 'https://via.placeholder.com/640x480.png/00dd33?text=temporibus', 'BAYEMP_11950', 'frontend-developer', 'payment-gateway', '', 'Hybrid', '+1 (662) 683-3679', '7745 Christiansen Rapid Suite 631\nDaijaville, MO 31166-7391', 'keystone bank', '5961', '2024-06-13 14:46:44', '2024-06-13 14:46:44'),
(11, 'Akintayo jide Abdullah', NULL, 'sirabdull70@gmail.com', '$2y$12$YHErhCHMyD8pc7BJkL8zle9ai2JsTDdiwsCs88tEdDe5pfJO6BMZ2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 08:42:00', '2024-07-16 08:42:00');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_number` varchar(255) NOT NULL,
  `client_pin` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `amount_paid` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` enum('unpaid','paid','overdue') NOT NULL DEFAULT 'unpaid',
  `issue_date` date NOT NULL,
  `due_date` date NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mailist`
--

CREATE TABLE `mailist` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mailist`
--

INSERT INTO `mailist` (`id`, `email`, `created_at`, `updated_at`) 
VALUES(1, 'sirabdull70@gmail.com', '2024-06-11 11:18:46', '2024-06-11 11:18:46');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_04_01_181309_create_clients_table', 1),
(6, '2024_04_02_065528_create_billings_table', 1),
(7, '2024_04_02_065835_create_services_table', 1),
(8, '2024_04_03_033546_create_service_details_table', 1),
(9, '2024_04_03_041112_create_service_emails_table', 1),
(10, '2024_04_03_055537_create_service_payment-gateways_table', 1),
(11, '2024_04_04_071319_create_carts_table', 1),
(12, '2024_04_15_014518_create_client_tokens_table', 1),
(13, '2024_04_16_005617_create_employees_table', 1),
(14, '2024_04_21_112019_maillist', 1),
(15, '2024_04_27_002906_dropcart', 1),
(18, '2024_06_11_134859_create_otps_table', 2),
(19, '2024_06_13_133038_create_requests_table', 3),
(23, '2024_06_13_133117_create_invoices_table', 4),
(24, '2024_06_23_134042_create_contacts_table', 4),
(25, '2024_06_23_160430_crete_requests_table', 4),
(27, '2024_06_30_202655_create_cards_table', 5),
(28, '2024_07_04_165005_create_plans_table', 5),
(29, '2024_07_07_113209_update_service_table', 6),
(30, '0001_01_01_000000_create_users_table', 7),
(31, '0001_01_01_000001_create_cache_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `otps`
--

CREATE TABLE `otps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `otp` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `expiry` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `otps`
--



-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `plan_name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `paystack_plan_code` varchar(255) DEFAULT NULL,
  `plan_type` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_pin` bigint(20) UNSIGNED DEFAULT NULL,
  `request_type` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `contact` varchar(255) NOT NULL,
  `interest` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `status` enum('pending','in_progress','completed','cancelled') NOT NULL DEFAULT 'pending',
  `scheduled_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `client_pin`, `request_type`, `name`, `email`, `company`, `contact`, `interest`, `message`, `status`, `scheduled_at`, `created_at`, `updated_at`) VALUES
(1, NULL, 'callback', 'Akintayo jide Abdullah', 'sirabdull70@gmail.com', NULL, '81459310809', NULL, 'hello', 'pending', NULL, '2024-06-24 01:03:22', '2024-06-24 01:03:22'),
(2, NULL, 'callback', 'Akintayo jide Abdullah', 'sirabdull70@gmail.com', NULL, '81459310809', NULL, 'hello', 'pending', NULL, '2024-06-24 01:10:01', '2024-06-24 01:10:01'),
(3, NULL, 'callback', 'Akintayo jide Abdullah', 'sirabdull70@gmail.com', NULL, '81459310809', NULL, 'hello hi', 'pending', NULL, '2024-06-24 01:10:33', '2024-06-24 01:10:33'),
(4, NULL, 'callback', 'Akintayo jide Abdullah', 'sirabdull70@gmail.com', NULL, '81459310809', NULL, 'hello hi', 'pending', NULL, '2024-06-24 01:11:14', '2024-06-24 01:11:14'),
(5, NULL, 'demo', 'Akintayo jide Abdullah', 'sirabdull70@gmail.com', 'BAYSCOPE', '894322234', 'CRM Systems', 'wow nice solution', 'pending', NULL, '2024-06-24 01:17:22', '2024-06-24 01:17:22'),
(6, NULL, 'demo', 'Akintayo jide Abdullah', 'sirabdull70@gmail.com', 'BAYSCOPE', '894322234', 'CRM Systems', 'wow nice solution', 'pending', NULL, '2024-06-24 01:21:31', '2024-06-24 01:21:31'),
(7, NULL, 'demo', 'Akintayo jide Abdullah', 'sirabdull70@gmail.com', 'BAYSCOPE', '894322234', 'CRM Systems', 'wow nice solution', 'pending', NULL, '2024-06-24 01:21:58', '2024-06-24 01:21:58'),
(8, NULL, 'demo', 'Akintayo jide Abdullah', 'sirabdull70@gmail.com', 'BAYSCOPE', '894322234', 'CRM Systems', 'wow nice solution', 'pending', NULL, '2024-06-24 01:22:28', '2024-06-24 01:22:28'),
(9, NULL, 'demo', 'Akintayo jide Abdullah', 'sirabdull70@gmail.com', 'BAYSCOPE', '894322234', 'CRM Systems', 'wow nice solution', 'pending', NULL, '2024-06-24 01:32:44', '2024-06-24 01:32:44'),
(10, NULL, 'demo', 'Akintayo jide Abdullah', 'sirabdull70@gmail.com', 'BAYSCOPE', '894322234', 'CRM Systems', 'wow nice solution', 'pending', NULL, '2024-06-24 01:33:42', '2024-06-24 01:33:42'),
(11, NULL, 'demo', 'Akintayo jide Abdullah', 'sirabdull70@gmail.com', 'BAYSCOPE', '914558893-30', 'Business Financial solutions', 'i love this solution i just need', 'pending', NULL, '2024-06-24 20:15:54', '2024-06-24 20:15:54'),
(12, NULL, 'demo', 'Akintayo jide Abdullah', 'sirabdull70@gmail.com', 'BAYSCOPE', '914558893-30', 'Business Financial solutions', 'i love this solution i just need', 'pending', NULL, '2024-06-24 20:16:01', '2024-06-24 20:16:01'),
(13, NULL, 'demo', 'Akintayo jide Abdullah', 'sirabdull70@gmail.com', 'BAYSCOPE', '914558893-30', 'Business Financial solutions', 'i love this solution i just need', 'pending', NULL, '2024-06-24 20:16:41', '2024-06-24 20:16:41'),
(14, NULL, 'demo', 'Akintayo jide Abdullah', 'sirabdull70@gmail.com', 'BAYSCOPE', '914558893-30', 'Business Financial solutions', 'i love this solution i just need', 'pending', NULL, '2024-06-24 20:16:45', '2024-06-24 20:16:45'),
(15, NULL, 'demo', 'Akintayo jide Abdullah', 'sirabdull70@gmail.com', 'BAYSCOPE', '914558893-30', 'Business Financial solutions', 'i love this solution i just need', 'pending', NULL, '2024-06-24 20:17:10', '2024-06-24 20:17:10'),
(16, NULL, 'demo', 'Akintayo jide Abdullah', 'sirabdull70@gmail.com', 'BAYSCOPE', '914558893-30', 'Business Financial solutions', 'i love this solution i just need', 'pending', NULL, '2024-06-24 20:17:21', '2024-06-24 20:17:21'),
(17, NULL, 'demo', 'Akintayo jide Abdullah', 'sirabdull70@gmail.com', 'BAYSCOPE', '914558893-30', 'Business Financial solutions', 'i love this solution i just need', 'pending', NULL, '2024-06-24 20:20:12', '2024-06-24 20:20:12'),
(18, NULL, 'demo', 'Akintayo jide Abdullah', 'sirabdull70@gmail.com', 'BAYSCOPE', '914558893-30', 'Business Financial solutions', 'i love this solution i just need', 'pending', NULL, '2024-06-24 20:20:17', '2024-06-24 20:20:17'),
(19, NULL, 'demo', 'Akintayo jide Abdullah', 'sirabdull70@gmail.com', 'BAYSCOPE', '914558893-30', 'Business Financial solutions', 'i love this solution i just need', 'pending', NULL, '2024-06-24 20:21:27', '2024-06-24 20:21:27'),
(20, NULL, 'demo', 'Akintayo jide Abdullah', 'sirabdull70@gmail.com', 'BAYSCOPE', '914558893-30', 'Business Financial solutions', 'i love this solution i just need', 'pending', NULL, '2024-06-24 20:21:31', '2024-06-24 20:21:31'),
(21, NULL, 'demo', 'Akintayo jide Abdullah', 'sirabdull70@gmail.com', 'BAYSCOPE', '914558893-30', 'Business Financial solutions', 'i love this solution i just need', 'pending', NULL, '2024-06-24 20:22:25', '2024-06-24 20:22:25'),
(22, NULL, 'demo', 'Akintayo jide Abdullah', 'sirabdull70@gmail.com', 'BAYSCOPE', '914558893-30', 'Business Financial solutions', 'i love this solution i just need', 'pending', NULL, '2024-06-24 20:22:38', '2024-06-24 20:22:38'),
(23, NULL, 'callback', 'Akintayo jide Abdullah', 'sirabdull70@gmail.com', NULL, '90532345456', NULL, 'i need  something', 'pending', NULL, '2024-06-24 20:35:20', '2024-06-24 20:35:20'),
(24, NULL, 'demo', 'Akintayo jide Abdullah', 'sirabdull70@gmail.com', 'BAYSCOPE', '914558893-30', 'Bayscope EduPortals', 'i love this solution i just need', 'pending', NULL, '2024-06-24 20:44:42', '2024-06-24 20:44:42'),
(25, NULL, 'callback', 'Akintayo jide Abdullah', 'sirabdull70@gmail.com', NULL, '8145931080', NULL, 'i need to talk to someone', 'pending', NULL, '2024-07-03 09:27:00', '2024-07-03 09:27:00');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_code` int(11) NOT NULL,
  `client_pin` varchar(255) NOT NULL,
  `solution` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `last_billed_date` varchar(255) NOT NULL,
  `next_billing_date` varchar(255) NOT NULL,
  `status` enum('Canceled','Pending','Active') DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `service_code`, `client_pin`, `solution`, `description`, `last_billed_date`, `next_billing_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 2345674, 'BAY_3454', 'Bayscope Ecommerce', 'Bayscope Ecommerce provides ecommerce solutions to small and large businesses', '12/07/2024', '13/08/2024', 'Pending', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('Gqih2VT8cFs5QeqQiE9d0C7VdrvzKqIR5cwwahTj', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidXpyMW1Vb1JrN2dxUWRWdEVldHZvNVFXeXdTRm9xTVpUS1JJWFFoZCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWdpc3RlciI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjExO30=', 1721094288);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Akintayo jide Abdullah', 'sirabdull@bayscope.org', NULL, '$2y$12$OM4R6B3MBDmlIPr.jcS.zunkbVapg3tkgma.pedtyJe19zDbeSr6u', NULL, '2024-07-16 08:13:51', '2024-07-16 08:13:51'),
(2, 'Akintayo jide Abdullah', 'sirabdull70@gmail.com', NULL, '$2y$12$VmeLnKxeqov8syKHzPbD0ObJzBimcFr3yFqKzhMgw.tmsp0r863ve', NULL, '2024-07-16 08:15:59', '2024-07-16 08:15:59'),
(3, 'Akintayo jide Abdullah', 'sirabdull84@gmail.com', NULL, '$2y$12$Pt4au683A/SCQ2nswLQ0Iu9v1uej91RAksJSGF/lErDf39sw0vRYy', NULL, '2024-07-16 08:24:21', '2024-07-16 08:24:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `billings`
--
ALTER TABLE `billings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cards_client_pin_unique` (`client_pin`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `client_tokens`
--
ALTER TABLE `client_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `client_tokens_token_unique` (`token`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employees_email_unique` (`email`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoices_invoice_number_unique` (`invoice_number`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mailist`
--
ALTER TABLE `mailist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `otps`
--
ALTER TABLE `otps`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `otps_otp_unique` (`otp`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plans_plan_name_unique` (`plan_name`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `services_service_code_unique` (`service_code`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT for table `billings`
--
ALTER TABLE `billings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cards`
--
ALTER TABLE `cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `client_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `client_tokens`
--
ALTER TABLE `client_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mailist`
--
ALTER TABLE `mailist`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `otps`
--
ALTER TABLE `otps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
