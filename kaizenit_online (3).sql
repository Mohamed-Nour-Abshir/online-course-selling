-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 13, 2023 at 02:50 AM
-- Server version: 10.3.39-MariaDB
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kaizenit_online`
--

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_attribute_id` bigint(20) UNSIGNED DEFAULT NULL,
  `value` varchar(255) NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_values`
--

INSERT INTO `attribute_values` (`id`, `product_attribute_id`, `value`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 3, 'Basic Knowledge of com puter', 1, '2023-05-17 09:06:14', '2023-05-17 09:06:14'),
(2, 4, 'No', 1, '2023-05-17 09:06:14', '2023-05-17 09:06:14'),
(3, 5, 'No', 1, '2023-05-17 09:06:14', '2023-05-17 09:06:14'),
(6, 3, 'Basic computer knowlege', 2, '2023-05-17 09:22:50', '2023-05-17 09:22:50'),
(7, 3, 'Basic computer', 3, '2023-05-17 09:30:40', '2023-05-17 09:30:40');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(14, 'Design & Multimedia', 'design-multimedia', '2023-03-04 06:11:52', '2023-04-27 01:46:25'),
(15, 'Web  & Software', 'web-software', '2023-03-04 09:31:16', '2023-04-27 01:46:51'),
(16, 'Digital Marketing', 'digital-marketing', '2023-03-04 09:31:51', '2023-04-27 01:47:20'),
(17, 'Cyber Security', 'cyber-security', '2023-03-04 09:34:27', '2023-04-27 01:48:01'),
(18, 'Networking', 'networking', '2023-03-04 09:34:52', '2023-04-27 01:48:13');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `type` enum('fixed','percent') NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `cart_value` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expiry_date` date NOT NULL DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `cart_value`, `created_at`, `updated_at`, `expiry_date`) VALUES
(3, 'OFF10%', 'percent', 10.00, 500.00, '2023-05-21 13:22:22', '2023-05-21 13:22:22', '2023-09-20');

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
-- Table structure for table `home_categories`
--

CREATE TABLE `home_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sel_categories` varchar(255) NOT NULL,
  `no_of_products` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_categories`
--

INSERT INTO `home_categories` (`id`, `sel_categories`, `no_of_products`, `created_at`, `updated_at`) VALUES
(1, '14,15,16,17,18', 8, '2023-03-04 13:33:59', '2023-03-04 11:27:42');

-- --------------------------------------------------------

--
-- Table structure for table `home_sliders`
--

CREATE TABLE `home_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_sliders`
--

INSERT INTO `home_sliders` (`id`, `title`, `subtitle`, `price`, `link`, `image`, `status`, `created_at`, `updated_at`) VALUES
(5, '', '', '', 'http://127.0.0.1:8000/courses', '1684304070.png', 1, '2023-03-04 08:55:24', '2023-05-17 10:14:30');

-- --------------------------------------------------------

--
-- Table structure for table `laravisits`
--

CREATE TABLE `laravisits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `visitable_type` varchar(255) NOT NULL,
  `visitable_id` bigint(20) UNSIGNED NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `laravisits`
--

INSERT INTO `laravisits` (`id`, `visitable_type`, `visitable_id`, `data`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\HomeSlider', 5, '[]', '2023-04-04 23:02:34', '2023-04-04 23:02:34');

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
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2022_03_11_051004_create_sessions_table', 1),
(7, '2022_03_16_015734_create_categories_table', 1),
(8, '2022_03_16_015901_create_products_table', 1),
(9, '2022_04_03_085851_create_home_sliders_table', 1),
(10, '2022_04_04_065417_create_home_categories_table', 1),
(11, '2022_04_05_081130_create_sales_table', 1),
(12, '2022_04_11_083922_create_coupons_table', 1),
(13, '2022_04_13_165955_add_expiry_date_to_coupons_table', 1),
(14, '2022_04_14_081343_create_orders_table', 1),
(15, '2022_04_14_081420_create_order_items_table', 1),
(16, '2022_04_14_081440_create_shippings_table', 1),
(17, '2022_04_14_081455_create_transactions_table', 1),
(18, '2022_04_17_110950_add_delivered_canceled_date_to_orders_table', 1),
(19, '2022_04_17_193624_create_reveiws_table', 1),
(20, '2022_04_17_194451_add_rstatus_to_order_items_table', 1),
(21, '2022_04_19_091317_create_contacts_table', 1),
(22, '2022_04_19_150259_create_settings_table', 1),
(23, '2022_04_21_131930_create_shoppingcart_table', 1),
(24, '2022_04_21_155007_create_subcategories_table', 1),
(25, '2022_04_24_084511_create_profiles_table', 1),
(26, '2022_04_25_140138_create_product_attributes_table', 1),
(27, '2022_04_26_064410_create_attribute_values_table', 1),
(28, '2022_04_27_093110_add_options_to_order_items_table', 1),
(29, '2022_04_28_091126_add_subcategory_id_to_products_table', 2),
(30, '2023_04_05_042038_create_laravisits_table', 3),
(31, '2023_04_05_060955_create_visitors_table', 4),
(34, '2023_05_02_044650_create_upload_course_videos_table', 5),
(35, '2023_05_13_045918_create_payment_gateway_bd_table', 6),
(36, '2023_05_13_045918_create_payment_gateway_bds_table', 7),
(37, '2023_05_13_064455_create_payment_gateway_bds_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `discount` decimal(65,0) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `order_status` enum('ordered','canceled') NOT NULL DEFAULT 'ordered',
  `transaction_id` varchar(255) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `cancaled_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `email`, `phone`, `amount`, `discount`, `status`, `order_status`, `transaction_id`, `currency`, `created_at`, `updated_at`, `cancaled_date`) VALUES
(1, 2, 'al-amin', 'nourabshir@gmail.com', '065343567556', 8000, 0, 'Processing', 'ordered', '6466084b951a5', 'BDT', '2023-05-18 11:13:15', '2023-05-18 11:13:15', NULL),
(2, 2, 'al-amin', 'nourabshir@gmail.com', '065343567556', 10000, 0, 'Processing', 'ordered', '6466097b9363b', 'BDT', '2023-05-18 11:18:19', '2023-05-18 11:18:19', NULL),
(3, 3, 'Md Abdul Momin', 'momincse34@gmail.com', '01934453979', 8000, 0, 'Processing', 'ordered', '64662677049fc', 'BDT', '2023-05-18 13:21:59', '2023-05-18 13:21:59', NULL),
(4, 3, 'Md Abdul Momin', 'momincse34@gmail.com', '01934453979', 6500, 0, 'Processing', 'ordered', '6466273947cc7', 'BDT', '2023-05-18 13:25:13', '2023-05-18 13:25:13', NULL),
(5, 4, 'khondkr', 'kmr.selim@gmail.com', '01953739066', 8000, 0, 'Processing', 'ordered', '64684c79e640a', 'BDT', '2023-05-20 04:28:41', '2023-05-20 04:28:41', NULL),
(6, 2, 'al-amin', 'nourabshir@gmail.com', '065343567556', 8000, 0, 'Processing', 'canceled', '646859ca9e4f6', 'BDT', '2023-05-20 16:33:24', '2023-05-20 16:33:32', '2023-05-20'),
(7, 2, 'al-amin', 'nourabshir@gmail.com', '065343567556', 8500, 0, 'Processing', 'canceled', '646870bbb686f', 'BDT', '2023-05-20 07:03:23', '2023-05-20 16:33:51', '2023-05-20'),
(8, 2, 'al-amin', 'nourabshir@gmail.com', '065343567556', 8000, 0, 'Pending', 'ordered', '646a09fe6e23c', 'BDT', '2023-05-21 12:09:34', '2023-05-21 12:09:34', NULL),
(9, 2, 'al-amin', 'nourabshir@gmail.com', '065343567556', 6500, 0, 'Processing', 'ordered', '646c4c907e5cd', 'BDT', '2023-05-23 05:18:08', '2023-05-23 05:18:08', NULL),
(10, 5, 'momin', 'shahinalom.cit@gmail.com', '01934453979', 8500, 0, 'Processing', 'ordered', '6471bc4a6b504', 'BDT', '2023-05-27 08:16:10', '2023-05-27 08:16:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rstatus` tinyint(1) NOT NULL DEFAULT 0,
  `options` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `product_id`, `order_id`, `price`, `quantity`, `created_at`, `updated_at`, `rstatus`, `options`) VALUES
(1, 1, 1, 8000.00, 1, '2023-05-18 15:13:15', '2023-05-21 17:00:57', 1, 'O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}'),
(2, 2, 2, 10000.00, 1, '2023-05-18 15:18:19', '2023-05-18 15:18:19', 0, 'O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}'),
(3, 1, 3, 8000.00, 1, '2023-05-18 17:21:59', '2023-05-18 17:21:59', 0, 'O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}'),
(4, 3, 4, 6500.00, 1, '2023-05-18 17:25:13', '2023-05-18 17:25:13', 0, 'O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}'),
(5, 1, 5, 8000.00, 1, '2023-05-20 08:28:41', '2023-05-20 08:28:41', 0, 'O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}'),
(6, 3, 6, 8000.00, 1, '2023-05-20 09:25:30', '2023-05-20 09:25:30', 0, 'O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}'),
(7, 2, 7, 8500.00, 1, '2023-05-20 11:03:23', '2023-05-20 11:03:23', 0, 'O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}'),
(8, 1, 8, 8000.00, 1, '2023-05-21 16:09:34', '2023-05-21 16:09:34', 0, 'O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}'),
(9, 3, 9, 6500.00, 1, '2023-05-23 09:18:08', '2023-05-23 09:18:08', 0, 'O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}'),
(10, 2, 10, 8500.00, 1, '2023-05-27 12:16:10', '2023-05-27 12:16:10', 0, 'O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}');

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
-- Table structure for table `payment_gateway_bds`
--

CREATE TABLE `payment_gateway_bds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `gateway_name` varchar(255) DEFAULT NULL,
  `store_id` varchar(255) DEFAULT NULL,
  `signature_key` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_gateway_bds`
--

INSERT INTO `payment_gateway_bds` (`id`, `gateway_name`, `store_id`, `signature_key`, `status`, `created_at`, `updated_at`) VALUES
(1, 'AamarPay', 'aamarpay', '28c78bb1f45112f5d40b956fe104645a', 0, NULL, '2023-05-13 01:20:33');

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `short_description` text DEFAULT NULL,
  `description` text NOT NULL,
  `regular_price` decimal(8,2) NOT NULL,
  `sale_price` decimal(8,2) DEFAULT NULL,
  `students` varchar(255) DEFAULT NULL,
  `instructor_name` varchar(255) DEFAULT NULL,
  `instrucotr_profession` varchar(255) DEFAULT NULL,
  `instructor_details` text DEFAULT NULL,
  `instructor_image` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `subcategory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `stock_status` varchar(255) NOT NULL DEFAULT 'instock'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `short_description`, `description`, `regular_price`, `sale_price`, `students`, `instructor_name`, `instrucotr_profession`, `instructor_details`, `instructor_image`, `image`, `images`, `category_id`, `created_at`, `updated_at`, `subcategory_id`, `stock_status`) VALUES
(1, 'Web development', 'web-development', '<p>As a web developer with knowledge of PHP, Laravel, Livewire, HTML, CSS, and JavaScript, you already have a solid foundation in web development. To broaden your skills and transition into a software developer role, you can consider learning the following:</p>', '<p>As a web developer with knowledge of PHP, Laravel, Livewire, HTML, CSS, and JavaScript, you already have a solid foundation in web development. To broaden your skills and transition into a software developer role, you can consider learning the following:</p>', 10000.00, 8000.00, '120', 'Mohamednur Abshir', 'Software developer', '<p>As a web developer with knowledge of PHP, Laravel, Livewire, HTML, CSS, and JavaScript, you already have a solid foundation in web development. To broaden your skills and transition into a software developer role, you can consider learning the following:</p>', '1684299974.jpg', '1684299974.jpg', ',16842999740.jpg', 15, '2023-05-17 09:06:14', '2023-05-17 09:06:14', NULL, 'instock'),
(2, 'Professional Graphic Design with freelancing', 'professional-graphic-design-with-freelancing', '<p>As a web developer with knowledge of PHP, Laravel, Livewire, HTML, CSS, and JavaScript, you already have a solid foundation in web development. To broaden your skills and transition into a software developer role, you can consider learning the following:</p>', '<p>As a web developer with knowledge of PHP, Laravel, Livewire, HTML, CSS, and JavaScript, you already have a solid foundation in web development. To broaden your skills and transition into a software developer role, you can consider learning the following:</p>', 10000.00, 8500.00, '300', 'Md Farid Choudary', 'Professional Graphic Desiner', '<p>As a web developer with knowledge of PHP, Laravel, Livewire, HTML, CSS, and JavaScript, you already have a solid foundation in web development. To broaden your skills and transition into a software developer role, you can consider learning the following:</p>', '1684300275.jpg', '1684300275.jpg', ',16843002750.jpg', 14, '2023-05-17 09:11:15', '2023-05-17 09:22:44', NULL, 'instock'),
(3, 'Digital Marketing with freelancing', 'digital-marketing-with-freelancing', '<p>Digital marketing, also called online marketing, is&nbsp;<strong>the promotion of brands to connect with potential customers using the internet and other forms of digital communication</strong>. This includes not only email, social media, and web-based advertising, but also text and multimedia messages as a marketing channel.</p>', '<p>Digital marketing, also called online marketing, is&nbsp;<strong>the promotion of brands to connect with potential customers using the internet and other forms of digital communication</strong>. This includes not only email, social media, and web-based advertising, but also text and multimedia messages as a marketing channel.</p>', 8000.00, 6500.00, '120', 'Md. Abdul Momin', 'CEO at Kaizen IT LTD', '<p>Digital marketing, also called online marketing, is&nbsp;<strong>the promotion of brands to connect with potential customers using the internet and other forms of digital communication</strong>. This includes not only email, social media, and web-based advertising, but also text and multimedia messages as a marketing channel.</p>', '1684301440.jpg', '1684301440.jpg', ',16843014400.jpg', 15, '2023-05-17 09:30:40', '2023-05-17 09:30:40', NULL, 'instock');

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_attributes`
--

INSERT INTO `product_attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(3, 'Computer', '2023-04-29 02:41:23', '2023-04-29 02:41:23'),
(4, 'Basic HTML', '2023-04-29 02:41:31', '2023-04-29 02:41:56'),
(5, 'Basic CSS', '2023-04-29 02:41:38', '2023-04-29 02:41:38'),
(6, 'Basic Js', '2023-04-29 02:41:45', '2023-04-29 02:41:45');

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `line1` varchar(255) DEFAULT NULL,
  `line2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `image`, `mobile`, `line1`, `line2`, `city`, `province`, `country`, `zipcode`, `created_at`, `updated_at`) VALUES
(1, 1, '1684299115.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-17 08:51:40', '2023-05-17 08:51:55'),
(2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-17 09:20:34', '2023-05-17 09:20:34'),
(3, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-18 13:15:07', '2023-05-18 13:15:07'),
(4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-20 08:28:24', '2023-05-20 08:28:24'),
(5, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-27 12:15:33', '2023-05-27 12:15:33');

-- --------------------------------------------------------

--
-- Table structure for table `reveiws`
--

CREATE TABLE `reveiws` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text NOT NULL,
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reveiws`
--

INSERT INTO `reveiws` (`id`, `rating`, `comment`, `order_item_id`, `created_at`, `updated_at`) VALUES
(1, 5, 'very good course', 1, '2023-05-21 17:00:49', '2023-05-21 17:00:49'),
(2, 5, 'very good course', 1, '2023-05-21 17:00:57', '2023-05-21 17:00:57');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `sale_date`, `status`, `created_at`, `updated_at`) VALUES
(1, '2023-12-31 14:27:05', 1, NULL, '2023-05-30 12:50:39');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('6UJIvJ3CHyfk4y8zliZSPFWwtGMFAXc0uJ031gOa', NULL, '40.77.167.147', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVXlDS1F3aGhCTFdYN2dlZDNldE5GMWhXQXp2R1RUWUlWVVdWTWZEWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vb25saW5lLWNvdXJzZS1zZWxsaW5nLmthaXplbml0YmQuY29tL2NvbnRhY3QtdXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1686546347),
('8NzH7SNCU39NY4KqGMLiNfaRgLoN8qWzC7GIhXGq', NULL, '52.167.144.146', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSjJPNXJkMVp1a05XN3ZEOEpuRkhVMGpzQk9HTHVMM3FqNGpLTGFIZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njg6Imh0dHBzOi8vb25saW5lLWNvdXJzZS1zZWxsaW5nLmthaXplbml0YmQuY29tL2NvdXJzZXMvd2ViLWRldmVsb3BtZW50Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1686559026),
('9cn1NrMuCI0DOFXyroRJ2bVLFqIeCBYElZJI5pBa', NULL, '40.77.167.147', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNVBqVXIzOXdLTTAxZnFBeFdJWnAyUkdvc1czcHVQM21zZ3luTWlqVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vb25saW5lLWNvdXJzZS1zZWxsaW5nLmthaXplbml0YmQuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1686596260),
('ccPZ2PXWuJHif1htQHhyx5s1vf3mPs0ViGegJ335', NULL, '52.74.8.163', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOEVrenZwbEk1dHdaTWRmY251a2NGdWFraVo4VTRsWnJkR3VrTEd2ZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzM6Imh0dHBzOi8vb25saW5lLWNvdXJzZS1zZWxsaW5nLmthaXplbml0YmQuY29tL2NvdXJzZS1jYXRlZ29yeS93ZWItc29mdHdhcmUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1686485508),
('dlFoLmiuiVfynDdghNN3g1019x8GtN2wSzpYZBXj', NULL, '18.141.50.195', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRHlZQmw5R21rRDlsaTRVTFBIZ3k4a0w3SjdoamZXa2NkZXI2STZ0ZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vb25saW5lLWNvdXJzZS1zZWxsaW5nLmthaXplbml0YmQuY29tL2ZvcmdvdC1wYXNzd29yZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1686437474),
('DQdLZYjC3J6Uf7bfsznHW1iDouwyggMZk43pgl5v', NULL, '18.142.222.124', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQzhXekcwNjk3bDlIZE1kOE1sTVVOazlsTGU4MU1pMklyR2dUa0syOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzg6Imh0dHBzOi8vb25saW5lLWNvdXJzZS1zZWxsaW5nLmthaXplbml0YmQuY29tL2NvdXJzZS1jYXRlZ29yeS9kZXNpZ24tbXVsdGltZWRpYSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1686464658),
('et56JLkh99ggD6aSszvEboY4mGZNcvk2itJaRffi', NULL, '103.127.57.137', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoianFUNk1ScWZoN3hWbWlSVGFkSW9ITWoxNVZqRjRSNE9TdjhPOTFQUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njg6Imh0dHBzOi8vb25saW5lLWNvdXJzZS1zZWxsaW5nLmthaXplbml0YmQuY29tL2NvdXJzZXMvd2ViLWRldmVsb3BtZW50Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1686563818),
('G6uWf0KbSPr5acubNdE08wI0pbJN0S3DML7HDUBp', NULL, '160.202.147.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRzh0cmxLeXZNdGVBbHE5S2VnYmt2eE14VXdTeW5LZ3ZCdlFWeFh0YyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHBzOi8vb25saW5lLWNvdXJzZS1zZWxsaW5nLmthaXplbml0YmQuY29tL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1686577734),
('JsptfEXLomoS5Qa79GoN7kNJhrcToZVyOxExTM2V', NULL, '103.127.56.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.43', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSHR2RGd0SG1lUVNqd1JPc0hSVXNhY1V5UGN2TVk0VHI4SFQxbEVOZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHBzOi8vb25saW5lLWNvdXJzZS1zZWxsaW5nLmthaXplbml0YmQuY29tL2Fib3V0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1686595584),
('kdYYFGnjXFjMYAmnUywaXYZo33tbVn74clsFXeWh', NULL, '18.138.43.195', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNkhGektTcmRiVTZuYUNDWEFDeEFNb2Jib0NkYlhNcHVXcHFrbFk2USI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vb25saW5lLWNvdXJzZS1zZWxsaW5nLmthaXplbml0YmQuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1686472156),
('MzJxjRLRuPCvYJ1hlqHpe0dbjYC6JRs85OfvqiQk', NULL, '40.77.167.147', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQWpRb1RJamR5elpvaktaQmJNMFZnUkthY2JTMXZURHMyb1EydndhOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6OTc6Imh0dHBzOi8vb25saW5lLWNvdXJzZS1zZWxsaW5nLmthaXplbml0YmQuY29tL2NvdXJzZXMvcHJvZmVzc2lvbmFsLWdyYXBoaWMtZGVzaWduLXdpdGgtZnJlZWxhbmNpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1686480536),
('oXgApQvDBHwAVWMCwLUmQKO1qijDoJB3LUJTFhqV', NULL, '210.10.3.92', 'Mozilla/5.0 (Linux; Android 11; vivo 1901 Build/RP1A.200720.012; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/103.0.5060.70 Mobile Safari/537.36 [FB_IAB/Orca-Android;FBAV/396.0.0.14.82;]', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNlNleGp6c1B4dVFRZGZ2OVJUZ042ZVVSNENyZ3ZjYWJxTnJ3YXlsSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTE3OiJodHRwczovL29ubGluZS1jb3Vyc2Utc2VsbGluZy5rYWl6ZW5pdGJkLmNvbS9zZWFyY2g/cHJvZHVjdF9jYXQ9QWxsJTIwQ2F0ZWdvcnkmcHJvZHVjdF9jYXRfaWQ9JnNlYXJjaD1FeGNlbGwlMjBjb3Vyc2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1686485619),
('qErSgRx5WOXuDKUejj4O01wfGAOCFFjfeYaIIPJq', NULL, '103.251.245.215', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSHE1Nk9aa2p6V3BXd1E4WFdsZDdodjRFWTg0aFc4Z045d05HU3dsaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vb25saW5lLWNvdXJzZS1zZWxsaW5nLmthaXplbml0YmQuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1686390135),
('QZ2ZgFAzOAostO6jUn1YfYPgMQzXfPD3Px2KofnY', NULL, '66.249.72.138', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.90 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUzhDRkNlNDN3RXNzcEhsanZlSFM2QmlIR2s4WTBwc2E4MVdma1hMRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vb25saW5lLWNvdXJzZS1zZWxsaW5nLmthaXplbml0YmQuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1686536542),
('RIhP6C1VqrWZi2nzrASB98HwYrA3HmtEvW7D0gFs', NULL, '103.132.249.151', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoidWpiNUJZbExHbDdXc0tGNVJjYzh1eXVzdEFoY0NGUFNLZjRnellOaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDk6Imh0dHBzOi8vb25saW5lLWNvdXJzZS1zZWxsaW5nLmthaXplbml0YmQuY29tL2NhcnQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjQ6ImNhcnQiO2E6MTp7czo0OiJjYXJ0IjtPOjI5OiJJbGx1bWluYXRlXFN1cHBvcnRcQ29sbGVjdGlvbiI6Mjp7czo4OiIAKgBpdGVtcyI7YToxOntzOjMyOiIwMjdjOTEzNDFmZDVjZjRkMjU3OWI0OWM0YjZhOTBkYSI7TzozMjoiR2xvdWRlbWFuc1xTaG9wcGluZ2NhcnRcQ2FydEl0ZW0iOjk6e3M6NToicm93SWQiO3M6MzI6IjAyN2M5MTM0MWZkNWNmNGQyNTc5YjQ5YzRiNmE5MGRhIjtzOjI6ImlkIjtzOjE6IjEiO3M6MzoicXR5IjtpOjE7czo0OiJuYW1lIjtzOjE1OiJXZWIgZGV2ZWxvcG1lbnQiO3M6NToicHJpY2UiO2Q6ODAwMDtzOjc6Im9wdGlvbnMiO086Mzk6Ikdsb3VkZW1hbnNcU2hvcHBpbmdjYXJ0XENhcnRJdGVtT3B0aW9ucyI6Mjp7czo4OiIAKgBpdGVtcyI7YTowOnt9czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO31zOjQ5OiIAR2xvdWRlbWFuc1xTaG9wcGluZ2NhcnRcQ2FydEl0ZW0AYXNzb2NpYXRlZE1vZGVsIjtzOjE4OiJBcHBcTW9kZWxzXFByb2R1Y3QiO3M6NDE6IgBHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbQB0YXhSYXRlIjtpOjA7czo0MToiAEdsb3VkZW1hbnNcU2hvcHBpbmdjYXJ0XENhcnRJdGVtAGlzU2F2ZWQiO2I6MDt9fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9fXM6ODoiY2hlY2tvdXQiO2E6NDp7czo4OiJkaXNjb3VudCI7aTowO3M6ODoic3VidG90YWwiO3M6NzoiODAwMC4wMCI7czozOiJ0YXgiO047czo1OiJ0b3RhbCI7ZDo4MDAwO319', 1686577783),
('tdD32HU1iwk3SQKXThBPPsuDkmE2Nt6wKWhRPKfN', NULL, '63.141.36.110', 'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US) AppleWebKit/532.2 (KHTML, like Gecko) Chrome/4.0.221.6 Safari/532.2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieFROZmgwcUxNT1ZxbG1Fb2pRTlFmMU9OTUNCZXNiQTNwNTV3ZGs0YyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHBzOi8vb25saW5lLWNvdXJzZS1zZWxsaW5nLmthaXplbml0YmQuY29tL2NvdXJzZS1jYXRlZ29yeS9uZXR3b3JraW5nIjt9fQ==', 1686391051),
('tO6Ew4LONaTCUQscvWmOnFYeITlBL35iZOWAlEAo', NULL, '66.249.71.169', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.90 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVXhZRVdJYTVSUmNGZ2NCdXNMdVBaMzRreWNWMmc5WmRtV1EyVERiSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vb25saW5lLWNvdXJzZS1zZWxsaW5nLmthaXplbml0YmQuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1686536514),
('UjVVEFX8anyT0VEqzgvYN67E599YGjLB4LsfHqhh', NULL, '66.249.71.169', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieXJEdXltUmY0dUJXaUdlSVZ2d3lEQjFvQjVZV0Z6TWxVNVJybU9KcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vb25saW5lLWNvdXJzZS1zZWxsaW5nLmthaXplbml0YmQuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1686536535),
('ULTI0KznrHmrmWBIKKtdW7JFr2K8RZBz1TTd4HQX', NULL, '123.136.24.122', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieFBJRXlmSnVhZ2tvSm1DYlBFWkVQS0lJdFlJS0Zmb0RvOFUya2RPaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vb25saW5lLWNvdXJzZS1zZWxsaW5nLmthaXplbml0YmQuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1686396609),
('UmvmOW5llhFsKcB7vjyPCkAjM9MwniI7pWzGzhA5', NULL, '18.138.110.222', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicVR2NlBweUJneVN3bnR4OVBYdHEyVk1KR1h6dFA0OHVjOGUzdDFTQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzg6Imh0dHBzOi8vb25saW5lLWNvdXJzZS1zZWxsaW5nLmthaXplbml0YmQuY29tL2NvdXJzZS1jYXRlZ29yeS9kaWdpdGFsLW1hcmtldGluZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1686455879),
('yGwFEy1SSkTjxJdA0jq6c3VggLtfAPuRVpjqVctH', NULL, '66.249.72.138', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidjV2VTY1MjRjQzBGMWZKZ3FBZ0M5SGlxTDhuMGRPakxabmo1OUZmVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vb25saW5lLWNvdXJzZS1zZWxsaW5nLmthaXplbml0YmQuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1686536869);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `phone2` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `map` varchar(500) NOT NULL,
  `twitter` varchar(255) NOT NULL,
  `facebokk` varchar(255) NOT NULL,
  `pinterest` varchar(255) NOT NULL,
  `instgram` varchar(255) NOT NULL,
  `youtube` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `email`, `phone`, `phone2`, `address`, `map`, `twitter`, `facebokk`, `pinterest`, `instgram`, `youtube`, `created_at`, `updated_at`) VALUES
(1, 'info@kaizenitbd.com', '+8801730931984', '+8801730931984', 'panthapath', 'https://goo.gl/maps/dAG17eZXdiWhqJNw5', '#', '#', '#', '#', '#', '2023-03-04 08:35:55', '2023-04-29 04:12:18');

-- --------------------------------------------------------

--
-- Table structure for table `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `identifier` varchar(255) NOT NULL,
  `instance` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shoppingcart`
--

INSERT INTO `shoppingcart` (`identifier`, `instance`, `content`, `created_at`, `updated_at`) VALUES
('admin@gmail.com', 'cart', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2023-05-21 13:22:57', NULL),
('admin@gmail.com', 'wishlist', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2023-05-21 13:22:57', NULL),
('kmr.selim@gmail.com', 'cart', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:1:{s:32:\"027c91341fd5cf4d2579b49c4b6a90da\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":9:{s:5:\"rowId\";s:32:\"027c91341fd5cf4d2579b49c4b6a90da\";s:2:\"id\";s:1:\"1\";s:3:\"qty\";i:1;s:4:\"name\";s:15:\"Web development\";s:5:\"price\";d:8000;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:18:\"App\\Models\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:0;s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0isSaved\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2023-05-20 08:28:33', NULL),
('kmr.selim@gmail.com', 'wishlist', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2023-05-20 08:28:33', NULL),
('momincse34@gmail.com', 'cart', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:1:{s:32:\"a775bac9cff7dec2b984e023b95206aa\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":9:{s:5:\"rowId\";s:32:\"a775bac9cff7dec2b984e023b95206aa\";s:2:\"id\";s:1:\"3\";s:3:\"qty\";i:1;s:4:\"name\";s:34:\"Digital Marketing with freelancing\";s:5:\"price\";d:6500;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:18:\"App\\Models\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:0;s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0isSaved\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2023-05-18 17:25:08', NULL),
('momincse34@gmail.com', 'wishlist', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2023-05-18 17:25:08', NULL),
('nourabshir@gmail.com', 'cart', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2023-05-23 09:20:56', NULL),
('nourabshir@gmail.com', 'wishlist', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2023-05-23 09:20:56', NULL),
('shahinalom.cit@gmail.com', 'cart', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2023-05-27 12:18:55', NULL),
('shahinalom.cit@gmail.com', 'wishlist', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2023-05-27 12:18:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `upload_course_videos`
--

CREATE TABLE `upload_course_videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `course_id` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `upload_course_videos`
--

INSERT INTO `upload_course_videos` (`id`, `title`, `duration`, `course_id`, `status`, `video`, `created_at`, `updated_at`) VALUES
(1, 'Introduction to web development', '1', '1', 'demo', '1684303527.mp4', '2023-05-17 09:13:36', '2023-05-17 10:05:27'),
(2, 'Introduction to graphic design', '1', '2', 'demo', '1684303724.mp4', '2023-05-17 09:16:54', '2023-05-17 10:08:44'),
(3, 'Laravel ', '1', '1', 'lock', '1684302599.mp4', '2023-05-17 09:49:59', '2023-05-17 09:49:59'),
(4, 'Introduction to Digital marketing', '3 ', '3', 'demo', '1684560975.mp4', '2023-05-20 09:36:15', '2023-05-20 09:36:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `usertype` varchar(255) NOT NULL DEFAULT 'USR' COMMENT 'USR for users and ADM for Admins',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `district`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `usertype`, `created_at`, `updated_at`) VALUES
(1, 'admin', '01730931984', 'Dhaka', 'admin@gmail.com', NULL, '$2y$10$GO9uk7bqv.SAnLgPtYVsQ.xShEnG.wlbPtRWnRYRb6alCzGgEVlSm', NULL, NULL, NULL, NULL, NULL, 'ADM', '2023-05-17 08:51:28', '2023-05-17 08:51:28'),
(2, 'al-amin', '065343567556', 'Dhaka', 'nourabshir@gmail.com', NULL, '$2y$10$jILg4oBSIXZ9TVdkRQpAEuN2EDeEDjhAyG.CR.bw4pp/eIwhYm3LS', NULL, NULL, NULL, NULL, NULL, 'USR', '2023-05-17 09:20:33', '2023-05-17 09:20:33'),
(3, 'Md Abdul Momin', '01934453979', 'Dhaka', 'momincse34@gmail.com', NULL, '$2y$10$HaD53ZIhOaV1ZQMUQ88dVOI4rW3hL.hfP6X3AWG5vSisIEXve0sTy', NULL, NULL, NULL, NULL, NULL, 'USR', '2023-05-18 13:15:06', '2023-05-18 13:15:06'),
(4, 'khondkr', '01953739066', 'Dhaka', 'kmr.selim@gmail.com', NULL, '$2y$10$nIBZBRXtdnN2u9RTgZxRI.CyyEh9XgQNgZscFOpgJ0GwHNdw0Aln.', NULL, NULL, NULL, NULL, NULL, 'USR', '2023-05-20 08:28:24', '2023-05-20 08:28:24'),
(5, 'momin', '01934453979', 'Dhaka', 'shahinalom.cit@gmail.com', NULL, '$2y$10$eVPo5wza1QWKleTeO8F.Aem9Iv2idqI5AehxV1WKJfAgilPJU6NvW', NULL, NULL, NULL, NULL, NULL, 'USR', '2023-05-27 12:15:33', '2023-05-27 12:15:33');

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `visitable_type` varchar(255) NOT NULL,
  `visitable_id` bigint(20) UNSIGNED NOT NULL,
  `visitor_ip` varchar(255) NOT NULL,
  `visited_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `visitors`
--

INSERT INTO `visitors` (`id`, `visitable_type`, `visitable_id`, `visitor_ip`, `visited_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 08:41:27', '2023-05-17 08:41:27', '2023-05-17 08:41:27'),
(2, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 08:48:03', '2023-05-17 08:48:03', '2023-05-17 08:48:03'),
(3, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 08:48:51', '2023-05-17 08:48:51', '2023-05-17 08:48:51'),
(4, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 08:51:40', '2023-05-17 08:51:40', '2023-05-17 08:51:40'),
(5, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 08:51:58', '2023-05-17 08:51:58', '2023-05-17 08:51:58'),
(6, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 08:52:20', '2023-05-17 08:52:20', '2023-05-17 08:52:20'),
(7, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 08:52:32', '2023-05-17 08:52:32', '2023-05-17 08:52:32'),
(8, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 09:18:37', '2023-05-17 09:18:37', '2023-05-17 09:18:37'),
(9, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 09:18:45', '2023-05-17 09:18:45', '2023-05-17 09:18:45'),
(10, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 09:19:28', '2023-05-17 09:19:28', '2023-05-17 09:19:28'),
(11, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 09:20:34', '2023-05-17 09:20:34', '2023-05-17 09:20:34'),
(12, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 09:21:45', '2023-05-17 09:21:45', '2023-05-17 09:21:45'),
(13, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 09:41:24', '2023-05-17 09:41:24', '2023-05-17 09:41:24'),
(14, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 09:50:05', '2023-05-17 09:50:05', '2023-05-17 09:50:05'),
(15, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 09:50:09', '2023-05-17 09:50:09', '2023-05-17 09:50:09'),
(16, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 09:51:41', '2023-05-17 09:51:41', '2023-05-17 09:51:41'),
(17, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 09:54:49', '2023-05-17 09:54:49', '2023-05-17 09:54:49'),
(18, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 09:55:24', '2023-05-17 09:55:24', '2023-05-17 09:55:24'),
(19, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 09:56:46', '2023-05-17 09:56:46', '2023-05-17 09:56:46'),
(20, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 09:56:59', '2023-05-17 09:56:59', '2023-05-17 09:56:59'),
(21, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 09:57:16', '2023-05-17 09:57:16', '2023-05-17 09:57:16'),
(22, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 09:58:25', '2023-05-17 09:58:25', '2023-05-17 09:58:25'),
(23, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 10:00:32', '2023-05-17 10:00:32', '2023-05-17 10:00:32'),
(24, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 10:00:47', '2023-05-17 10:00:47', '2023-05-17 10:00:47'),
(25, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 10:01:11', '2023-05-17 10:01:11', '2023-05-17 10:01:11'),
(26, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 10:01:54', '2023-05-17 10:01:54', '2023-05-17 10:01:54'),
(27, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 10:02:42', '2023-05-17 10:02:42', '2023-05-17 10:02:42'),
(28, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 10:08:20', '2023-05-17 10:08:20', '2023-05-17 10:08:20'),
(29, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 10:09:59', '2023-05-17 10:09:59', '2023-05-17 10:09:59'),
(30, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 10:11:03', '2023-05-17 10:11:03', '2023-05-17 10:11:03'),
(31, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 10:11:40', '2023-05-17 10:11:40', '2023-05-17 10:11:40'),
(32, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 10:13:28', '2023-05-17 10:13:28', '2023-05-17 10:13:28'),
(33, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 10:14:34', '2023-05-17 10:14:34', '2023-05-17 10:14:34'),
(34, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 10:23:39', '2023-05-17 10:23:39', '2023-05-17 10:23:39'),
(35, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 10:23:46', '2023-05-17 10:23:46', '2023-05-17 10:23:46'),
(36, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 10:25:42', '2023-05-17 10:25:42', '2023-05-17 10:25:42'),
(37, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 10:26:25', '2023-05-17 10:26:25', '2023-05-17 10:26:25'),
(38, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 11:01:02', '2023-05-17 11:01:02', '2023-05-17 11:01:02'),
(39, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 12:17:53', '2023-05-17 12:17:53', '2023-05-17 12:17:53'),
(40, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-17 12:18:47', '2023-05-17 12:18:47', '2023-05-17 12:18:47'),
(41, 'App\\Models\\HomeSlider', 5, '45.127.247.224', '2023-05-18 11:04:31', '2023-05-18 11:04:31', '2023-05-18 11:04:31'),
(42, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-18 11:08:21', '2023-05-18 11:08:21', '2023-05-18 11:08:21'),
(43, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-18 11:08:59', '2023-05-18 11:08:59', '2023-05-18 11:08:59'),
(44, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-18 11:13:12', '2023-05-18 11:13:12', '2023-05-18 11:13:12'),
(45, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-18 11:14:38', '2023-05-18 11:14:38', '2023-05-18 11:14:38'),
(46, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-18 12:47:46', '2023-05-18 12:47:46', '2023-05-18 12:47:46'),
(47, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-18 12:48:29', '2023-05-18 12:48:29', '2023-05-18 12:48:29'),
(48, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-18 12:51:12', '2023-05-18 12:51:12', '2023-05-18 12:51:12'),
(49, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-18 12:53:59', '2023-05-18 12:53:59', '2023-05-18 12:53:59'),
(50, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-18 13:06:25', '2023-05-18 13:06:25', '2023-05-18 13:06:25'),
(51, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-18 13:15:07', '2023-05-18 13:15:07', '2023-05-18 13:15:07'),
(52, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-18 13:21:23', '2023-05-18 13:21:23', '2023-05-18 13:21:23'),
(53, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-18 13:22:41', '2023-05-18 13:22:41', '2023-05-18 13:22:41'),
(54, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-18 13:25:21', '2023-05-18 13:25:21', '2023-05-18 13:25:21'),
(55, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-18 13:25:40', '2023-05-18 13:25:40', '2023-05-18 13:25:40'),
(56, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-18 14:38:14', '2023-05-18 14:38:14', '2023-05-18 14:38:14'),
(57, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-18 14:38:23', '2023-05-18 14:38:23', '2023-05-18 14:38:23'),
(58, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-18 14:40:29', '2023-05-18 14:40:29', '2023-05-18 14:40:29'),
(59, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-18 14:40:45', '2023-05-18 14:40:45', '2023-05-18 14:40:45'),
(60, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-18 14:41:11', '2023-05-18 14:41:11', '2023-05-18 14:41:11'),
(61, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-18 15:04:30', '2023-05-18 15:04:30', '2023-05-18 15:04:30'),
(62, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-18 15:05:01', '2023-05-18 15:05:01', '2023-05-18 15:05:01'),
(63, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-18 15:13:00', '2023-05-18 15:13:00', '2023-05-18 15:13:00'),
(64, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-18 15:48:21', '2023-05-18 15:48:21', '2023-05-18 15:48:21'),
(65, 'App\\Models\\HomeSlider', 5, '178.128.43.104', '2023-05-18 17:07:32', '2023-05-18 17:07:32', '2023-05-18 17:07:32'),
(66, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-18 17:20:40', '2023-05-18 17:20:40', '2023-05-18 17:20:40'),
(67, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-18 17:21:42', '2023-05-18 17:21:42', '2023-05-18 17:21:42'),
(68, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-18 17:23:47', '2023-05-18 17:23:47', '2023-05-18 17:23:47'),
(69, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-18 17:24:08', '2023-05-18 17:24:08', '2023-05-18 17:24:08'),
(70, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-18 17:24:50', '2023-05-18 17:24:50', '2023-05-18 17:24:50'),
(71, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-18 17:25:02', '2023-05-18 17:25:02', '2023-05-18 17:25:02'),
(72, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-18 17:25:52', '2023-05-18 17:25:52', '2023-05-18 17:25:52'),
(73, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 08:26:24', '2023-05-20 08:26:24', '2023-05-20 08:26:24'),
(74, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 08:28:24', '2023-05-20 08:28:24', '2023-05-20 08:28:24'),
(75, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 08:29:31', '2023-05-20 08:29:31', '2023-05-20 08:29:31'),
(76, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 08:30:19', '2023-05-20 08:30:19', '2023-05-20 08:30:19'),
(77, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 09:24:55', '2023-05-20 09:24:55', '2023-05-20 09:24:55'),
(78, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 09:32:15', '2023-05-20 09:32:15', '2023-05-20 09:32:15'),
(79, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 09:34:51', '2023-05-20 09:34:51', '2023-05-20 09:34:51'),
(80, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 09:37:00', '2023-05-20 09:37:00', '2023-05-20 09:37:00'),
(81, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 09:44:17', '2023-05-20 09:44:17', '2023-05-20 09:44:17'),
(82, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 09:47:38', '2023-05-20 09:47:38', '2023-05-20 09:47:38'),
(83, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 09:47:59', '2023-05-20 09:47:59', '2023-05-20 09:47:59'),
(84, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 09:49:03', '2023-05-20 09:49:03', '2023-05-20 09:49:03'),
(85, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 09:50:40', '2023-05-20 09:50:40', '2023-05-20 09:50:40'),
(86, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 09:52:00', '2023-05-20 09:52:00', '2023-05-20 09:52:00'),
(87, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 09:52:14', '2023-05-20 09:52:14', '2023-05-20 09:52:14'),
(88, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 09:57:02', '2023-05-20 09:57:02', '2023-05-20 09:57:02'),
(89, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 09:57:32', '2023-05-20 09:57:32', '2023-05-20 09:57:32'),
(90, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 09:57:56', '2023-05-20 09:57:56', '2023-05-20 09:57:56'),
(91, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 09:59:12', '2023-05-20 09:59:12', '2023-05-20 09:59:12'),
(92, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 10:01:32', '2023-05-20 10:01:32', '2023-05-20 10:01:32'),
(93, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 10:16:39', '2023-05-20 10:16:39', '2023-05-20 10:16:39'),
(94, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 10:17:48', '2023-05-20 10:17:48', '2023-05-20 10:17:48'),
(95, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 10:27:05', '2023-05-20 10:27:05', '2023-05-20 10:27:05'),
(96, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 10:27:14', '2023-05-20 10:27:14', '2023-05-20 10:27:14'),
(97, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 10:27:54', '2023-05-20 10:27:54', '2023-05-20 10:27:54'),
(98, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 10:28:07', '2023-05-20 10:28:07', '2023-05-20 10:28:07'),
(99, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 10:28:13', '2023-05-20 10:28:13', '2023-05-20 10:28:13'),
(100, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 10:28:22', '2023-05-20 10:28:22', '2023-05-20 10:28:22'),
(101, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 10:28:36', '2023-05-20 10:28:36', '2023-05-20 10:28:36'),
(102, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 10:29:29', '2023-05-20 10:29:29', '2023-05-20 10:29:29'),
(103, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 10:33:39', '2023-05-20 10:33:39', '2023-05-20 10:33:39'),
(104, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 10:36:46', '2023-05-20 10:36:46', '2023-05-20 10:36:46'),
(105, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 10:39:25', '2023-05-20 10:39:25', '2023-05-20 10:39:25'),
(106, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 10:39:29', '2023-05-20 10:39:29', '2023-05-20 10:39:29'),
(107, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 10:42:13', '2023-05-20 10:42:13', '2023-05-20 10:42:13'),
(108, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 10:42:41', '2023-05-20 10:42:41', '2023-05-20 10:42:41'),
(109, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 10:44:31', '2023-05-20 10:44:31', '2023-05-20 10:44:31'),
(110, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 10:48:13', '2023-05-20 10:48:13', '2023-05-20 10:48:13'),
(111, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 10:55:50', '2023-05-20 10:55:50', '2023-05-20 10:55:50'),
(112, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 10:58:08', '2023-05-20 10:58:08', '2023-05-20 10:58:08'),
(113, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 10:58:16', '2023-05-20 10:58:16', '2023-05-20 10:58:16'),
(114, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 11:12:07', '2023-05-20 11:12:07', '2023-05-20 11:12:07'),
(115, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 11:20:04', '2023-05-20 11:20:04', '2023-05-20 11:20:04'),
(116, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 11:40:59', '2023-05-20 11:40:59', '2023-05-20 11:40:59'),
(117, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 11:50:18', '2023-05-20 11:50:18', '2023-05-20 11:50:18'),
(118, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 11:55:51', '2023-05-20 11:55:51', '2023-05-20 11:55:51'),
(119, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 12:03:06', '2023-05-20 12:03:06', '2023-05-20 12:03:06'),
(120, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 12:04:42', '2023-05-20 12:04:42', '2023-05-20 12:04:42'),
(121, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 12:05:40', '2023-05-20 12:05:40', '2023-05-20 12:05:40'),
(122, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 12:06:38', '2023-05-20 12:06:38', '2023-05-20 12:06:38'),
(123, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 12:06:56', '2023-05-20 12:06:56', '2023-05-20 12:06:56'),
(124, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 12:17:00', '2023-05-20 12:17:00', '2023-05-20 12:17:00'),
(125, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 12:35:08', '2023-05-20 12:35:08', '2023-05-20 12:35:08'),
(126, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 12:40:54', '2023-05-20 12:40:54', '2023-05-20 12:40:54'),
(127, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 13:43:30', '2023-05-20 13:43:30', '2023-05-20 13:43:30'),
(128, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 13:44:07', '2023-05-20 13:44:07', '2023-05-20 13:44:07'),
(129, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 15:07:07', '2023-05-20 15:07:07', '2023-05-20 15:07:07'),
(130, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 15:24:37', '2023-05-20 15:24:37', '2023-05-20 15:24:37'),
(131, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 16:30:08', '2023-05-20 16:30:08', '2023-05-20 16:30:08'),
(132, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 16:30:50', '2023-05-20 16:30:50', '2023-05-20 16:30:50'),
(133, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 16:53:52', '2023-05-20 16:53:52', '2023-05-20 16:53:52'),
(134, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 17:00:10', '2023-05-20 17:00:10', '2023-05-20 17:00:10'),
(135, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 17:00:17', '2023-05-20 17:00:17', '2023-05-20 17:00:17'),
(136, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 17:01:08', '2023-05-20 17:01:08', '2023-05-20 17:01:08'),
(137, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 17:03:15', '2023-05-20 17:03:15', '2023-05-20 17:03:15'),
(138, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 17:04:52', '2023-05-20 17:04:52', '2023-05-20 17:04:52'),
(139, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 17:06:18', '2023-05-20 17:06:18', '2023-05-20 17:06:18'),
(140, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 17:08:17', '2023-05-20 17:08:17', '2023-05-20 17:08:17'),
(141, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 17:08:21', '2023-05-20 17:08:21', '2023-05-20 17:08:21'),
(142, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 17:08:41', '2023-05-20 17:08:41', '2023-05-20 17:08:41'),
(143, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 17:09:31', '2023-05-20 17:09:31', '2023-05-20 17:09:31'),
(144, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 17:09:55', '2023-05-20 17:09:55', '2023-05-20 17:09:55'),
(145, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 17:10:17', '2023-05-20 17:10:17', '2023-05-20 17:10:17'),
(146, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 17:10:22', '2023-05-20 17:10:22', '2023-05-20 17:10:22'),
(147, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 17:11:01', '2023-05-20 17:11:01', '2023-05-20 17:11:01'),
(148, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 17:11:13', '2023-05-20 17:11:13', '2023-05-20 17:11:13'),
(149, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 17:15:10', '2023-05-20 17:15:10', '2023-05-20 17:15:10'),
(150, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 17:15:27', '2023-05-20 17:15:27', '2023-05-20 17:15:27'),
(151, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-20 17:24:40', '2023-05-20 17:24:40', '2023-05-20 17:24:40'),
(152, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-21 07:56:50', '2023-05-21 07:56:50', '2023-05-21 07:56:50'),
(153, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-21 09:41:41', '2023-05-21 09:41:41', '2023-05-21 09:41:41'),
(154, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-21 13:19:27', '2023-05-21 13:19:27', '2023-05-21 13:19:27'),
(155, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-21 13:22:59', '2023-05-21 13:22:59', '2023-05-21 13:22:59'),
(156, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-21 15:51:22', '2023-05-21 15:51:22', '2023-05-21 15:51:22'),
(157, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-21 15:52:25', '2023-05-21 15:52:25', '2023-05-21 15:52:25'),
(158, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-21 16:09:14', '2023-05-21 16:09:14', '2023-05-21 16:09:14'),
(159, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-21 16:11:02', '2023-05-21 16:11:02', '2023-05-21 16:11:02'),
(160, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-21 16:36:11', '2023-05-21 16:36:11', '2023-05-21 16:36:11'),
(161, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-21 16:38:10', '2023-05-21 16:38:10', '2023-05-21 16:38:10'),
(162, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-21 16:38:24', '2023-05-21 16:38:24', '2023-05-21 16:38:24'),
(163, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-21 16:38:37', '2023-05-21 16:38:37', '2023-05-21 16:38:37'),
(164, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-21 16:38:44', '2023-05-21 16:38:44', '2023-05-21 16:38:44'),
(165, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-21 16:38:51', '2023-05-21 16:38:51', '2023-05-21 16:38:51'),
(166, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-21 16:38:59', '2023-05-21 16:38:59', '2023-05-21 16:38:59'),
(167, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-21 16:39:24', '2023-05-21 16:39:24', '2023-05-21 16:39:24'),
(168, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-21 16:39:28', '2023-05-21 16:39:28', '2023-05-21 16:39:28'),
(169, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-21 16:39:36', '2023-05-21 16:39:36', '2023-05-21 16:39:36'),
(170, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-21 16:39:46', '2023-05-21 16:39:46', '2023-05-21 16:39:46'),
(171, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-21 16:40:00', '2023-05-21 16:40:00', '2023-05-21 16:40:00'),
(172, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-21 16:40:09', '2023-05-21 16:40:09', '2023-05-21 16:40:09'),
(173, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-21 16:40:13', '2023-05-21 16:40:13', '2023-05-21 16:40:13'),
(174, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-21 16:40:23', '2023-05-21 16:40:23', '2023-05-21 16:40:23'),
(175, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-21 16:40:36', '2023-05-21 16:40:36', '2023-05-21 16:40:36'),
(176, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-21 16:40:44', '2023-05-21 16:40:44', '2023-05-21 16:40:44'),
(177, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-21 16:42:16', '2023-05-21 16:42:16', '2023-05-21 16:42:16'),
(178, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-21 16:42:37', '2023-05-21 16:42:37', '2023-05-21 16:42:37'),
(179, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-21 16:42:44', '2023-05-21 16:42:44', '2023-05-21 16:42:44'),
(180, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-21 16:57:44', '2023-05-21 16:57:44', '2023-05-21 16:57:44'),
(181, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-21 17:01:59', '2023-05-21 17:01:59', '2023-05-21 17:01:59'),
(182, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-23 08:35:54', '2023-05-23 08:35:54', '2023-05-23 08:35:54'),
(183, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-23 08:37:06', '2023-05-23 08:37:06', '2023-05-23 08:37:06'),
(184, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-23 09:17:57', '2023-05-23 09:17:57', '2023-05-23 09:17:57'),
(185, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-23 09:20:38', '2023-05-23 09:20:38', '2023-05-23 09:20:38'),
(186, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-23 09:20:39', '2023-05-23 09:20:39', '2023-05-23 09:20:39'),
(187, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-23 09:20:40', '2023-05-23 09:20:40', '2023-05-23 09:20:40'),
(188, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-23 09:20:59', '2023-05-23 09:20:59', '2023-05-23 09:20:59'),
(189, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-23 11:25:55', '2023-05-23 11:25:55', '2023-05-23 11:25:55'),
(190, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-23 11:26:12', '2023-05-23 11:26:12', '2023-05-23 11:26:12'),
(191, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-23 11:26:26', '2023-05-23 11:26:26', '2023-05-23 11:26:26'),
(192, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-23 11:27:18', '2023-05-23 11:27:18', '2023-05-23 11:27:18'),
(193, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-23 11:52:07', '2023-05-23 11:52:07', '2023-05-23 11:52:07'),
(194, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-23 13:19:57', '2023-05-23 13:19:57', '2023-05-23 13:19:57'),
(195, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-23 17:09:06', '2023-05-23 17:09:06', '2023-05-23 17:09:06'),
(196, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-23 17:10:39', '2023-05-23 17:10:39', '2023-05-23 17:10:39'),
(197, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-24 12:29:29', '2023-05-24 12:29:29', '2023-05-24 12:29:29'),
(198, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-24 15:20:38', '2023-05-24 15:20:38', '2023-05-24 15:20:38'),
(199, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-25 08:11:27', '2023-05-25 08:11:27', '2023-05-25 08:11:27'),
(200, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-25 10:14:25', '2023-05-25 10:14:25', '2023-05-25 10:14:25'),
(201, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-25 13:31:47', '2023-05-25 13:31:47', '2023-05-25 13:31:47'),
(202, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-25 13:32:06', '2023-05-25 13:32:06', '2023-05-25 13:32:06'),
(203, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-25 13:32:25', '2023-05-25 13:32:25', '2023-05-25 13:32:25'),
(204, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-27 12:08:59', '2023-05-27 12:08:59', '2023-05-27 12:08:59'),
(205, 'App\\Models\\HomeSlider', 5, '173.252.87.20', '2023-05-27 12:09:35', '2023-05-27 12:09:35', '2023-05-27 12:09:35'),
(206, 'App\\Models\\HomeSlider', 5, '173.252.87.7', '2023-05-27 12:09:38', '2023-05-27 12:09:38', '2023-05-27 12:09:38'),
(207, 'App\\Models\\HomeSlider', 5, '43.245.123.53', '2023-05-27 12:09:57', '2023-05-27 12:09:57', '2023-05-27 12:09:57'),
(208, 'App\\Models\\HomeSlider', 5, '43.245.123.54', '2023-05-27 12:11:00', '2023-05-27 12:11:00', '2023-05-27 12:11:00'),
(209, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-27 12:11:09', '2023-05-27 12:11:09', '2023-05-27 12:11:09'),
(210, 'App\\Models\\HomeSlider', 5, '43.245.123.54', '2023-05-27 12:11:11', '2023-05-27 12:11:11', '2023-05-27 12:11:11'),
(211, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-27 12:11:12', '2023-05-27 12:11:12', '2023-05-27 12:11:12'),
(212, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-27 12:12:04', '2023-05-27 12:12:04', '2023-05-27 12:12:04'),
(213, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-27 12:12:18', '2023-05-27 12:12:18', '2023-05-27 12:12:18'),
(214, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-27 12:13:16', '2023-05-27 12:13:16', '2023-05-27 12:13:16'),
(215, 'App\\Models\\HomeSlider', 5, '43.245.123.53', '2023-05-27 12:13:36', '2023-05-27 12:13:36', '2023-05-27 12:13:36'),
(216, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-27 12:14:21', '2023-05-27 12:14:21', '2023-05-27 12:14:21'),
(217, 'App\\Models\\HomeSlider', 5, '43.245.123.53', '2023-05-27 12:15:33', '2023-05-27 12:15:33', '2023-05-27 12:15:33'),
(218, 'App\\Models\\HomeSlider', 5, '43.245.123.53', '2023-05-27 12:15:54', '2023-05-27 12:15:54', '2023-05-27 12:15:54'),
(219, 'App\\Models\\HomeSlider', 5, '103.67.157.202', '2023-05-27 20:31:09', '2023-05-27 20:31:09', '2023-05-27 20:31:09'),
(220, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-29 13:26:32', '2023-05-29 13:26:32', '2023-05-29 13:26:32'),
(221, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-30 08:51:30', '2023-05-30 08:51:30', '2023-05-30 08:51:30'),
(222, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-30 08:51:31', '2023-05-30 08:51:31', '2023-05-30 08:51:31'),
(223, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-30 08:52:38', '2023-05-30 08:52:38', '2023-05-30 08:52:38'),
(224, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-30 08:54:00', '2023-05-30 08:54:00', '2023-05-30 08:54:00'),
(225, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-30 09:00:21', '2023-05-30 09:00:21', '2023-05-30 09:00:21'),
(226, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-30 09:00:38', '2023-05-30 09:00:38', '2023-05-30 09:00:38'),
(227, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-30 09:03:35', '2023-05-30 09:03:35', '2023-05-30 09:03:35'),
(228, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-30 10:07:10', '2023-05-30 10:07:10', '2023-05-30 10:07:10'),
(229, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-30 11:33:43', '2023-05-30 11:33:43', '2023-05-30 11:33:43'),
(230, 'App\\Models\\HomeSlider', 5, '66.249.79.243', '2023-05-30 11:42:20', '2023-05-30 11:42:20', '2023-05-30 11:42:20'),
(231, 'App\\Models\\HomeSlider', 5, '66.249.79.243', '2023-05-30 11:42:49', '2023-05-30 11:42:49', '2023-05-30 11:42:49'),
(232, 'App\\Models\\HomeSlider', 5, '66.249.79.243', '2023-05-30 11:42:49', '2023-05-30 11:42:49', '2023-05-30 11:42:49'),
(233, 'App\\Models\\HomeSlider', 5, '66.249.79.243', '2023-05-30 11:42:55', '2023-05-30 11:42:55', '2023-05-30 11:42:55'),
(234, 'App\\Models\\HomeSlider', 5, '66.249.79.243', '2023-05-30 11:42:55', '2023-05-30 11:42:55', '2023-05-30 11:42:55'),
(235, 'App\\Models\\HomeSlider', 5, '103.156.180.238', '2023-05-30 12:17:03', '2023-05-30 12:17:03', '2023-05-30 12:17:03'),
(236, 'App\\Models\\HomeSlider', 5, '45.127.247.231', '2023-05-30 12:49:15', '2023-05-30 12:49:15', '2023-05-30 12:49:15'),
(237, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-30 12:49:55', '2023-05-30 12:49:55', '2023-05-30 12:49:55'),
(238, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-30 12:50:45', '2023-05-30 12:50:45', '2023-05-30 12:50:45'),
(239, 'App\\Models\\HomeSlider', 5, '157.55.39.212', '2023-05-30 13:35:03', '2023-05-30 13:35:03', '2023-05-30 13:35:03'),
(240, 'App\\Models\\HomeSlider', 5, '66.249.79.245', '2023-05-31 13:37:49', '2023-05-31 13:37:49', '2023-05-31 13:37:49'),
(241, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-05-31 17:08:53', '2023-05-31 17:08:53', '2023-05-31 17:08:53'),
(242, 'App\\Models\\HomeSlider', 5, '157.55.39.212', '2023-05-31 21:23:17', '2023-05-31 21:23:17', '2023-05-31 21:23:17'),
(243, 'App\\Models\\HomeSlider', 5, '66.249.79.243', '2023-06-01 01:37:23', '2023-06-01 01:37:23', '2023-06-01 01:37:23'),
(244, 'App\\Models\\HomeSlider', 5, '66.249.79.245', '2023-06-01 04:48:21', '2023-06-01 04:48:21', '2023-06-01 04:48:21'),
(245, 'App\\Models\\HomeSlider', 5, '66.249.79.245', '2023-06-01 11:43:42', '2023-06-01 11:43:42', '2023-06-01 11:43:42'),
(246, 'App\\Models\\HomeSlider', 5, '66.249.79.243', '2023-06-01 11:43:43', '2023-06-01 11:43:43', '2023-06-01 11:43:43'),
(247, 'App\\Models\\HomeSlider', 5, '40.77.167.189', '2023-06-02 10:23:02', '2023-06-02 10:23:02', '2023-06-02 10:23:02'),
(248, 'App\\Models\\HomeSlider', 5, '175.44.42.169', '2023-06-02 13:23:45', '2023-06-02 13:23:45', '2023-06-02 13:23:45'),
(249, 'App\\Models\\HomeSlider', 5, '175.44.42.169', '2023-06-02 13:23:50', '2023-06-02 13:23:50', '2023-06-02 13:23:50'),
(250, 'App\\Models\\HomeSlider', 5, '175.44.42.8', '2023-06-02 14:41:41', '2023-06-02 14:41:41', '2023-06-02 14:41:41'),
(251, 'App\\Models\\HomeSlider', 5, '175.44.42.8', '2023-06-02 14:41:45', '2023-06-02 14:41:45', '2023-06-02 14:41:45'),
(252, 'App\\Models\\HomeSlider', 5, '175.44.42.231', '2023-06-02 15:35:10', '2023-06-02 15:35:10', '2023-06-02 15:35:10'),
(253, 'App\\Models\\HomeSlider', 5, '175.44.42.231', '2023-06-02 15:35:14', '2023-06-02 15:35:14', '2023-06-02 15:35:14'),
(254, 'App\\Models\\HomeSlider', 5, '40.77.167.189', '2023-06-02 18:33:49', '2023-06-02 18:33:49', '2023-06-02 18:33:49'),
(255, 'App\\Models\\HomeSlider', 5, '103.186.226.19', '2023-06-02 22:08:07', '2023-06-02 22:08:07', '2023-06-02 22:08:07'),
(256, 'App\\Models\\HomeSlider', 5, '103.186.226.19', '2023-06-02 22:10:11', '2023-06-02 22:10:11', '2023-06-02 22:10:11'),
(257, 'App\\Models\\HomeSlider', 5, '31.13.115.15', '2023-06-02 23:08:15', '2023-06-02 23:08:15', '2023-06-02 23:08:15'),
(258, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-06-03 09:43:50', '2023-06-03 09:43:50', '2023-06-03 09:43:50'),
(259, 'App\\Models\\HomeSlider', 5, '66.249.79.245', '2023-06-03 11:14:51', '2023-06-03 11:14:51', '2023-06-03 11:14:51'),
(260, 'App\\Models\\HomeSlider', 5, '66.249.79.245', '2023-06-03 11:14:52', '2023-06-03 11:14:52', '2023-06-03 11:14:52'),
(261, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-06-03 15:53:07', '2023-06-03 15:53:07', '2023-06-03 15:53:07'),
(262, 'App\\Models\\HomeSlider', 5, '103.72.136.154', '2023-06-03 16:21:35', '2023-06-03 16:21:35', '2023-06-03 16:21:35'),
(263, 'App\\Models\\HomeSlider', 5, '114.31.1.69', '2023-06-03 16:21:37', '2023-06-03 16:21:37', '2023-06-03 16:21:37'),
(264, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-06-03 16:27:04', '2023-06-03 16:27:04', '2023-06-03 16:27:04'),
(265, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-06-03 16:27:50', '2023-06-03 16:27:50', '2023-06-03 16:27:50'),
(266, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-06-03 16:28:03', '2023-06-03 16:28:03', '2023-06-03 16:28:03'),
(267, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-06-03 16:28:42', '2023-06-03 16:28:42', '2023-06-03 16:28:42'),
(268, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-06-03 16:30:18', '2023-06-03 16:30:18', '2023-06-03 16:30:18'),
(269, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-06-03 16:30:47', '2023-06-03 16:30:47', '2023-06-03 16:30:47'),
(270, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-06-03 16:32:01', '2023-06-03 16:32:01', '2023-06-03 16:32:01'),
(271, 'App\\Models\\HomeSlider', 5, '103.198.132.45', '2023-06-03 16:59:00', '2023-06-03 16:59:00', '2023-06-03 16:59:00'),
(272, 'App\\Models\\HomeSlider', 5, '85.208.98.192', '2023-06-03 20:46:47', '2023-06-03 20:46:47', '2023-06-03 20:46:47'),
(273, 'App\\Models\\HomeSlider', 5, '85.208.98.192', '2023-06-03 20:46:53', '2023-06-03 20:46:53', '2023-06-03 20:46:53'),
(274, 'App\\Models\\HomeSlider', 5, '85.208.98.197', '2023-06-03 20:47:05', '2023-06-03 20:47:05', '2023-06-03 20:47:05'),
(275, 'App\\Models\\HomeSlider', 5, '85.208.98.200', '2023-06-03 20:47:11', '2023-06-03 20:47:11', '2023-06-03 20:47:11'),
(276, 'App\\Models\\HomeSlider', 5, '35.236.204.152', '2023-06-03 20:47:11', '2023-06-03 20:47:11', '2023-06-03 20:47:11'),
(277, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-06-04 10:27:46', '2023-06-04 10:27:46', '2023-06-04 10:27:46'),
(278, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-06-04 10:28:02', '2023-06-04 10:28:02', '2023-06-04 10:28:02'),
(279, 'App\\Models\\HomeSlider', 5, '103.7.248.214', '2023-06-04 12:31:57', '2023-06-04 12:31:57', '2023-06-04 12:31:57'),
(280, 'App\\Models\\HomeSlider', 5, '103.197.48.252', '2023-06-04 16:13:22', '2023-06-04 16:13:22', '2023-06-04 16:13:22'),
(281, 'App\\Models\\HomeSlider', 5, '103.120.38.206', '2023-06-04 23:43:31', '2023-06-04 23:43:31', '2023-06-04 23:43:31'),
(282, 'App\\Models\\HomeSlider', 5, '18.143.218.146', '2023-06-05 01:27:57', '2023-06-05 01:27:57', '2023-06-05 01:27:57'),
(283, 'App\\Models\\HomeSlider', 5, '45.118.61.201', '2023-06-05 12:54:42', '2023-06-05 12:54:42', '2023-06-05 12:54:42'),
(284, 'App\\Models\\HomeSlider', 5, '163.53.140.70', '2023-06-05 12:54:44', '2023-06-05 12:54:44', '2023-06-05 12:54:44'),
(285, 'App\\Models\\HomeSlider', 5, '40.77.167.147', '2023-06-05 17:44:32', '2023-06-05 17:44:32', '2023-06-05 17:44:32'),
(286, 'App\\Models\\HomeSlider', 5, '45.118.61.218', '2023-06-05 21:34:14', '2023-06-05 21:34:14', '2023-06-05 21:34:14'),
(287, 'App\\Models\\HomeSlider', 5, '45.118.61.218', '2023-06-05 21:34:49', '2023-06-05 21:34:49', '2023-06-05 21:34:49'),
(288, 'App\\Models\\HomeSlider', 5, '52.72.128.253', '2023-06-05 21:57:55', '2023-06-05 21:57:55', '2023-06-05 21:57:55'),
(289, 'App\\Models\\HomeSlider', 5, '35.175.194.235', '2023-06-05 22:05:29', '2023-06-05 22:05:29', '2023-06-05 22:05:29'),
(290, 'App\\Models\\HomeSlider', 5, '66.249.71.184', '2023-06-06 01:57:14', '2023-06-06 01:57:14', '2023-06-06 01:57:14'),
(291, 'App\\Models\\HomeSlider', 5, '85.208.98.196', '2023-06-06 02:18:26', '2023-06-06 02:18:26', '2023-06-06 02:18:26'),
(292, 'App\\Models\\HomeSlider', 5, '85.208.98.201', '2023-06-06 02:18:27', '2023-06-06 02:18:27', '2023-06-06 02:18:27'),
(293, 'App\\Models\\HomeSlider', 5, '85.208.98.197', '2023-06-06 02:18:30', '2023-06-06 02:18:30', '2023-06-06 02:18:30'),
(294, 'App\\Models\\HomeSlider', 5, '85.208.98.198', '2023-06-06 02:18:40', '2023-06-06 02:18:40', '2023-06-06 02:18:40'),
(295, 'App\\Models\\HomeSlider', 5, '85.208.98.193', '2023-06-06 02:18:49', '2023-06-06 02:18:49', '2023-06-06 02:18:49'),
(296, 'App\\Models\\HomeSlider', 5, '85.208.98.200', '2023-06-06 02:18:51', '2023-06-06 02:18:51', '2023-06-06 02:18:51'),
(297, 'App\\Models\\HomeSlider', 5, '85.208.98.194', '2023-06-06 02:21:54', '2023-06-06 02:21:54', '2023-06-06 02:21:54'),
(298, 'App\\Models\\HomeSlider', 5, '85.208.98.199', '2023-06-06 02:21:59', '2023-06-06 02:21:59', '2023-06-06 02:21:59'),
(299, 'App\\Models\\HomeSlider', 5, '34.247.37.154', '2023-06-06 06:07:15', '2023-06-06 06:07:15', '2023-06-06 06:07:15'),
(300, 'App\\Models\\HomeSlider', 5, '176.34.80.198', '2023-06-06 06:15:17', '2023-06-06 06:15:17', '2023-06-06 06:15:17'),
(301, 'App\\Models\\HomeSlider', 5, '27.147.224.213', '2023-06-06 09:46:50', '2023-06-06 09:46:50', '2023-06-06 09:46:50'),
(302, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-06-06 09:51:16', '2023-06-06 09:51:16', '2023-06-06 09:51:16'),
(303, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-06-06 09:52:40', '2023-06-06 09:52:40', '2023-06-06 09:52:40'),
(304, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-06-06 09:52:53', '2023-06-06 09:52:53', '2023-06-06 09:52:53'),
(305, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-06-06 11:09:06', '2023-06-06 11:09:06', '2023-06-06 11:09:06'),
(306, 'App\\Models\\HomeSlider', 5, '103.111.225.1', '2023-06-06 15:39:42', '2023-06-06 15:39:42', '2023-06-06 15:39:42'),
(307, 'App\\Models\\HomeSlider', 5, '103.175.132.172', '2023-06-06 15:46:03', '2023-06-06 15:46:03', '2023-06-06 15:46:03'),
(308, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-06-06 16:16:20', '2023-06-06 16:16:20', '2023-06-06 16:16:20'),
(309, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-06-06 16:18:53', '2023-06-06 16:18:53', '2023-06-06 16:18:53'),
(310, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-06-07 07:50:02', '2023-06-07 07:50:02', '2023-06-07 07:50:02'),
(311, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-06-07 08:54:43', '2023-06-07 08:54:43', '2023-06-07 08:54:43'),
(312, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-06-07 09:02:04', '2023-06-07 09:02:04', '2023-06-07 09:02:04'),
(313, 'App\\Models\\HomeSlider', 5, '85.208.98.200', '2023-06-07 10:33:44', '2023-06-07 10:33:44', '2023-06-07 10:33:44'),
(314, 'App\\Models\\HomeSlider', 5, '85.208.98.198', '2023-06-07 10:33:48', '2023-06-07 10:33:48', '2023-06-07 10:33:48'),
(315, 'App\\Models\\HomeSlider', 5, '85.208.98.197', '2023-06-07 10:33:56', '2023-06-07 10:33:56', '2023-06-07 10:33:56'),
(316, 'App\\Models\\HomeSlider', 5, '85.208.98.198', '2023-06-07 10:34:35', '2023-06-07 10:34:35', '2023-06-07 10:34:35'),
(317, 'App\\Models\\HomeSlider', 5, '85.208.98.193', '2023-06-07 10:35:26', '2023-06-07 10:35:26', '2023-06-07 10:35:26'),
(318, 'App\\Models\\HomeSlider', 5, '85.208.98.197', '2023-06-07 10:35:27', '2023-06-07 10:35:27', '2023-06-07 10:35:27'),
(319, 'App\\Models\\HomeSlider', 5, '85.208.98.201', '2023-06-07 10:37:27', '2023-06-07 10:37:27', '2023-06-07 10:37:27'),
(320, 'App\\Models\\HomeSlider', 5, '85.208.98.192', '2023-06-07 21:21:58', '2023-06-07 21:21:58', '2023-06-07 21:21:58'),
(321, 'App\\Models\\HomeSlider', 5, '85.208.98.196', '2023-06-07 21:22:02', '2023-06-07 21:22:02', '2023-06-07 21:22:02'),
(322, 'App\\Models\\HomeSlider', 5, '85.208.98.194', '2023-06-07 21:22:11', '2023-06-07 21:22:11', '2023-06-07 21:22:11'),
(323, 'App\\Models\\HomeSlider', 5, '85.208.98.198', '2023-06-07 21:22:48', '2023-06-07 21:22:48', '2023-06-07 21:22:48'),
(324, 'App\\Models\\HomeSlider', 5, '85.208.98.194', '2023-06-07 21:22:53', '2023-06-07 21:22:53', '2023-06-07 21:22:53'),
(325, 'App\\Models\\HomeSlider', 5, '85.208.98.194', '2023-06-07 21:23:02', '2023-06-07 21:23:02', '2023-06-07 21:23:02'),
(326, 'App\\Models\\HomeSlider', 5, '85.208.98.193', '2023-06-07 21:23:10', '2023-06-07 21:23:10', '2023-06-07 21:23:10'),
(327, 'App\\Models\\HomeSlider', 5, '85.208.98.198', '2023-06-07 21:25:49', '2023-06-07 21:25:49', '2023-06-07 21:25:49'),
(328, 'App\\Models\\HomeSlider', 5, '103.106.239.58', '2023-06-08 08:04:25', '2023-06-08 08:04:25', '2023-06-08 08:04:25'),
(329, 'App\\Models\\HomeSlider', 5, '182.48.66.249', '2023-06-08 08:06:10', '2023-06-08 08:06:10', '2023-06-08 08:06:10'),
(330, 'App\\Models\\HomeSlider', 5, '45.127.247.227', '2023-06-08 16:10:07', '2023-06-08 16:10:07', '2023-06-08 16:10:07'),
(331, 'App\\Models\\HomeSlider', 5, '116.58.200.54', '2023-06-08 18:08:57', '2023-06-08 18:08:57', '2023-06-08 18:08:57'),
(332, 'App\\Models\\HomeSlider', 5, '116.58.200.54', '2023-06-08 18:09:04', '2023-06-08 18:09:04', '2023-06-08 18:09:04'),
(333, 'App\\Models\\HomeSlider', 5, '103.147.163.50', '2023-06-09 17:20:42', '2023-06-09 17:20:42', '2023-06-09 17:20:42'),
(334, 'App\\Models\\HomeSlider', 5, '66.249.72.142', '2023-06-10 03:32:13', '2023-06-10 03:32:13', '2023-06-10 03:32:13'),
(335, 'App\\Models\\HomeSlider', 5, '66.249.71.171', '2023-06-10 03:34:13', '2023-06-10 03:34:13', '2023-06-10 03:34:13'),
(336, 'App\\Models\\HomeSlider', 5, '66.249.71.170', '2023-06-10 03:34:13', '2023-06-10 03:34:13', '2023-06-10 03:34:13'),
(337, 'App\\Models\\HomeSlider', 5, '66.249.72.142', '2023-06-10 10:16:12', '2023-06-10 10:16:12', '2023-06-10 10:16:12'),
(338, 'App\\Models\\HomeSlider', 5, '103.251.245.215', '2023-06-10 13:42:15', '2023-06-10 13:42:15', '2023-06-10 13:42:15'),
(339, 'App\\Models\\HomeSlider', 5, '92.43.87.2', '2023-06-10 13:56:30', '2023-06-10 13:56:30', '2023-06-10 13:56:30'),
(340, 'App\\Models\\HomeSlider', 5, '194.41.120.133', '2023-06-10 13:56:42', '2023-06-10 13:56:42', '2023-06-10 13:56:42'),
(341, 'App\\Models\\HomeSlider', 5, '123.136.24.122', '2023-06-10 15:30:09', '2023-06-10 15:30:09', '2023-06-10 15:30:09'),
(342, 'App\\Models\\HomeSlider', 5, '18.138.43.195', '2023-06-11 12:29:16', '2023-06-11 12:29:16', '2023-06-11 12:29:16'),
(343, 'App\\Models\\HomeSlider', 5, '210.10.3.92', '2023-06-11 16:12:12', '2023-06-11 16:12:12', '2023-06-11 16:12:12'),
(344, 'App\\Models\\HomeSlider', 5, '66.249.71.169', '2023-06-12 06:21:54', '2023-06-12 06:21:54', '2023-06-12 06:21:54'),
(345, 'App\\Models\\HomeSlider', 5, '66.249.71.169', '2023-06-12 06:22:15', '2023-06-12 06:22:15', '2023-06-12 06:22:15'),
(346, 'App\\Models\\HomeSlider', 5, '66.249.72.138', '2023-06-12 06:22:22', '2023-06-12 06:22:22', '2023-06-12 06:22:22'),
(347, 'App\\Models\\HomeSlider', 5, '66.249.72.138', '2023-06-12 06:27:49', '2023-06-12 06:27:49', '2023-06-12 06:27:49'),
(348, 'App\\Models\\HomeSlider', 5, '103.127.57.137', '2023-06-12 13:56:50', '2023-06-12 13:56:50', '2023-06-12 13:56:50'),
(349, 'App\\Models\\HomeSlider', 5, '103.132.249.151', '2023-06-12 17:47:47', '2023-06-12 17:47:47', '2023-06-12 17:47:47'),
(350, 'App\\Models\\HomeSlider', 5, '103.127.56.162', '2023-06-12 22:43:56', '2023-06-12 22:43:56', '2023-06-12 22:43:56'),
(351, 'App\\Models\\HomeSlider', 5, '40.77.167.147', '2023-06-12 22:57:40', '2023-06-12 22:57:40', '2023-06-12 22:57:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_values_product_attribute_id_foreign` (`product_attribute_id`),
  ADD KEY `attribute_values_product_id_foreign` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `home_categories`
--
ALTER TABLE `home_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_sliders`
--
ALTER TABLE `home_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `laravisits`
--
ALTER TABLE `laravisits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `laravisits_visitable_type_visitable_id_index` (`visitable_type`,`visitable_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_gateway_bds`
--
ALTER TABLE `payment_gateway_bds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_subcategory_id_foreign` (`subcategory_id`);

--
-- Indexes for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profiles_user_id_foreign` (`user_id`);

--
-- Indexes for table `reveiws`
--
ALTER TABLE `reveiws`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reveiws_order_item_id_foreign` (`order_item_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`identifier`,`instance`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcategories_category_id_foreign` (`category_id`);

--
-- Indexes for table `upload_course_videos`
--
ALTER TABLE `upload_course_videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visitors_visitable_type_visitable_id_index` (`visitable_type`,`visitable_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_categories`
--
ALTER TABLE `home_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `home_sliders`
--
ALTER TABLE `home_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `laravisits`
--
ALTER TABLE `laravisits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payment_gateway_bds`
--
ALTER TABLE `payment_gateway_bds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reveiws`
--
ALTER TABLE `reveiws`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `upload_course_videos`
--
ALTER TABLE `upload_course_videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=352;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD CONSTRAINT `attribute_values_product_attribute_id_foreign` FOREIGN KEY (`product_attribute_id`) REFERENCES `product_attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attribute_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
