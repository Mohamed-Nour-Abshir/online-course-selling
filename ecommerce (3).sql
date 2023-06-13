-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2023 at 02:32 PM
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
-- Database: `ecommerce`
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
(28, 3, 'Basic Understanding of Computer', 33, '2023-04-29 02:51:41', '2023-04-29 02:51:41'),
(72, 3, 'Basic', 37, '2023-05-04 02:15:09', '2023-05-04 02:15:09'),
(73, 4, 'Basic', 37, '2023-05-04 02:15:09', '2023-05-04 02:15:09'),
(74, 5, 'Basic', 37, '2023-05-04 02:15:09', '2023-05-04 02:15:09'),
(75, 6, 'No', 37, '2023-05-04 02:15:09', '2023-05-04 02:15:09');

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
(5, '', '', '', 'https://sikdershop.com/shop', '1682579028.jpg', 1, '2023-03-04 08:55:24', '2023-04-27 01:03:48');

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
(34, '2023_05_02_044650_create_upload_course_videos_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subtotal` decimal(8,2) NOT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(8,2) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `status` enum('ordered','delivered','canceled') NOT NULL DEFAULT 'ordered',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivered_date` date DEFAULT NULL,
  `cancaled_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `subtotal`, `discount`, `tax`, `total`, `firstname`, `email`, `mobile`, `status`, `created_at`, `updated_at`, `delivered_date`, `cancaled_date`) VALUES
(9, 7, '12.00', '0.00', '0.00', '12.00', 'Nour', 'mdnourabshir@gmail.com', '', 'ordered', '2023-04-29 03:47:04', '2023-04-29 03:47:04', NULL, NULL),
(10, 7, '12.00', '0.00', '0.00', '12.00', 'Nour', 'mdnourabshir@gmail.com', '01730931984', 'ordered', '2023-04-29 03:58:37', '2023-04-29 03:58:37', NULL, NULL),
(11, 9, '800.00', '0.00', '0.00', '800.00', 'Nour', 'nourabshir@gmail.com', '065343567556', 'canceled', '2023-05-02 03:08:30', '2023-05-03 04:09:22', '2023-05-02', '2023-05-03');

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
(13, 37, 11, '800.00', 1, '2023-05-02 03:08:30', '2023-05-02 06:19:04', 1, 'O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}');

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
(33, 'Graphic Design', 'graphic-design', 'Graphic design is a craft where professionals create visual content to communicate messages. ', 'Graphic design is a craft where professionals create visual content to communicate messages. By applying visual hierarchy and page layout techniques, designers use typography and pictures to meet users\' specific needs and focus on the logic of displaying elements in interactive designs, to optimize the user experience.', '450.00', '400.00', '234', NULL, NULL, NULL, NULL, '1682581851.jpg', ',16825818510.jpg', 14, '2023-04-01 14:58:39', '2023-04-29 00:12:38', NULL, 'instock'),
(37, 'Web development', 'web-developments', '<p>Web development is <strong>the work involved in developing a website for the Internet (World Wide Web) or an intranet (a private network)</strong>. Web development can range from developing a simple single static page of plain text to complex web applications, electronic businesses, and social network services.</p>', '<p>Web development is&nbsp;<strong>the work involved in developing a website for the Internet (World Wide Web) or an intranet (a private network)</strong>. Web development can range from developing a simple single static page of plain text to complex web applications, electronic businesses, and social network services.</p>', '1000.00', '800.00', '20', 'Mohamednur Abshir', 'Fullstack Web developer', '<p>I\'m highly motivated and experienced full stack web developer, I have a passion for creating dynamic and engaging websites and applications. My expertise in both front-end and back-end technologies, combined with my strong problem-solving skills and attention to detail, allow me to bring innovative solutions to complex development challenges. I am proficient in HTML, CSS, JavaScript, and have experience working with PHP,Laravel and Livewire. I hold a Bachelor\'s degree in Computer Science and Engineering and have received certifications in both Frontend and Back-end Development . I am a quick learner, team player and thrive in fast-paced environments. With my technical skills and passion for web development, I am confident in my ability to make a valuable contribution to your team</p>', '1682771452.jpg', '1682771452.jpg', ',16828534090.jpg', 15, '2023-04-29 06:30:52', '2023-05-04 02:15:09', NULL, 'instock'),
(40, 'App development', 'app-development', '<p>Mobile&nbsp;<em>app development</em>&nbsp;is the act or process by which a mobile app is developed for one or more mobile devices, which can include personal digital&nbsp;...</p>', '<p>Mobile&nbsp;<em>app development</em>&nbsp;is the act or process by which a mobile app is developed for one or more mobile devices, which can include personal digital&nbsp;...</p>', '8000.00', '7000.00', '130', 'Nour', 'KJHKJSds', '<p>Mobile&nbsp;<em>app development</em>&nbsp;is the act or process by which a mobile app is developed for one or more mobile devices, which can include personal digital&nbsp;...</p>', '1683196596.jpg', '1683196596.jpg', ',16831965960.jpg,16831965961.jpg', 15, '2023-05-04 04:36:36', '2023-05-04 04:36:36', NULL, 'instock');

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
(5, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-04 06:09:00', '2023-03-04 06:09:00'),
(6, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-04 11:26:00', '2023-03-04 11:26:00'),
(7, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-04 11:27:04', '2023-03-04 11:27:04'),
(8, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-02 02:21:42', '2023-04-02 02:21:42'),
(9, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-04 23:48:18', '2023-04-04 23:48:18'),
(10, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-27 04:01:13', '2023-04-27 04:01:13'),
(11, 8, '1682590402.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-27 04:07:05', '2023-04-27 04:13:22'),
(12, 9, '1683102041.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-02 03:07:20', '2023-05-03 02:20:41');

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
(2, 5, 'good course', 9, '2023-04-27 04:10:39', '2023-04-27 04:10:39'),
(3, 5, 'Very Good course and very trained instuctor', 13, '2023-05-02 06:19:03', '2023-05-02 06:19:03');

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
(1, '2023-05-27 14:27:05', 1, NULL, NULL);

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
('sKoE0dKJYw9lj4A1TbgsTYi3YXzZRxy7kwSwSme8', 9, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiZEdBcmdIYnh1YWVMcjE1dUhlc0M0cll4RjJtREU1Z090V001a3lzeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91c2VyL2NvdXJzZXMvMTEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo5O3M6ODoidXNlcnR5cGUiO3M6MzoiVVNSIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJGVCQVo0RzdNQ1lHQ0N5ZFFoMmhIME8xWEZIVmo5LmI1VVdQczJYL2JlUTBMMmpNMFR4Qkc2IjtzOjQ6ImNhcnQiO2E6Mjp7czo0OiJjYXJ0IjtPOjI5OiJJbGx1bWluYXRlXFN1cHBvcnRcQ29sbGVjdGlvbiI6Mjp7czo4OiIAKgBpdGVtcyI7YTowOnt9czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO31zOjg6Indpc2hsaXN0IjtPOjI5OiJJbGx1bWluYXRlXFN1cHBvcnRcQ29sbGVjdGlvbiI6Mjp7czo4OiIAKgBpdGVtcyI7YTowOnt9czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO319czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkZUJBWjRHN01DWUdDQ3lkUWgyaEgwTzFYRkhWajkuYjVVV1BzMlgvYmVRMEwyak0wVHhCRzYiO30=', 1683376195);

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
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `line1` varchar(255) NOT NULL,
  `line2` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
('info@temobd.com', 'cart', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2023-04-27 05:23:43', NULL),
('info@temobd.com', 'wishlist', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2023-04-27 05:23:43', NULL),
('mdnourabshir@gmail.com', 'cart', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2023-05-04 06:29:55', NULL),
('mdnourabshir@gmail.com', 'wishlist', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2023-05-04 06:29:55', NULL),
('nourabshir@gmail.com', 'cart', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2023-05-06 06:29:08', NULL),
('nourabshir@gmail.com', 'wishlist', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2023-05-06 06:29:08', NULL);

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
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `mode` enum('cod','card','paypal') NOT NULL,
  `status` enum('pending','approved','declined','refunded') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `order_id`, `mode`, `status`, `created_at`, `updated_at`) VALUES
(6, 2, 9, 'cod', 'pending', '2023-04-09 04:23:34', '2023-04-09 04:23:34'),
(7, 9, 11, 'cod', 'pending', '2023-04-27 04:08:16', '2023-04-27 04:08:16');

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
(5, 'Html Attributes', '2', '37', 'demo', '1683015039.mp4', '2023-05-02 02:09:07', '2023-05-02 02:10:39'),
(6, 'Introduction To Laravel', '6', '37', 'lock', '1683014983.mp4', '2023-05-02 02:09:43', '2023-05-02 02:09:43'),
(8, 'Introduction', '10', '33', 'demo', '1683183421.mp4', '2023-05-04 00:57:01', '2023-05-04 00:57:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
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

INSERT INTO `users` (`id`, `name`, `phone`, `district`, `province`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `usertype`, `created_at`, `updated_at`) VALUES
(7, 'Nour', '01730931984', 'Dhaka', 'Rampura', 'mdnourabshir@gmail.com', NULL, '$2y$10$RmbN0xb0C38eO84xdgmET.SRWIzSwe1mkKEGTo6h45vWsrsPZ4Hw6', NULL, NULL, NULL, NULL, NULL, 'ADM', '2023-04-27 04:01:12', '2023-04-27 04:01:12'),
(8, 'test', '01730931984', 'dfghf', 'fdghfh', 'info@temobd.com', NULL, '$2y$10$YTXixBziOBfPyRTUZOMeBOF5YzYkckrJzdfc3SsKihe3GyMiF94s6', NULL, NULL, NULL, NULL, NULL, 'USR', '2023-04-27 04:07:05', '2023-04-27 04:07:05'),
(9, 'Nour', '065343567556', 'gfdgh', 'hfghfg', 'nourabshir@gmail.com', NULL, '$2y$10$eBAZ4G7MCYGCCydQh2hH0O1XFHVj9.b5UWPs2X/beQ0L2jM0TxBG6', NULL, NULL, NULL, NULL, NULL, 'USR', '2023-05-02 03:07:19', '2023-05-02 03:07:19');

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
(1, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-05 00:19:30', '2023-04-05 00:19:30', '2023-04-05 00:19:30'),
(2, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-05 00:26:13', '2023-04-05 00:26:13', '2023-04-05 00:26:13'),
(3, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-05 00:26:41', '2023-04-05 00:26:41', '2023-04-05 00:26:41'),
(4, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-05 03:09:06', '2023-04-05 03:09:06', '2023-04-05 03:09:06'),
(5, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-09 03:10:34', '2023-04-09 03:10:34', '2023-04-09 03:10:34'),
(6, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-09 03:27:39', '2023-04-09 03:27:39', '2023-04-09 03:27:39'),
(7, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-09 03:29:23', '2023-04-09 03:29:23', '2023-04-09 03:29:23'),
(8, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-09 04:11:29', '2023-04-09 04:11:29', '2023-04-09 04:11:29'),
(9, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-10 21:14:34', '2023-04-10 21:14:36', '2023-04-10 21:14:36'),
(10, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:02:27', '2023-04-27 00:02:27', '2023-04-27 00:02:27'),
(11, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:11:25', '2023-04-27 00:11:25', '2023-04-27 00:11:25'),
(12, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:15:17', '2023-04-27 00:15:17', '2023-04-27 00:15:17'),
(13, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:17:45', '2023-04-27 00:17:45', '2023-04-27 00:17:45'),
(14, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:18:21', '2023-04-27 00:18:21', '2023-04-27 00:18:21'),
(15, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:19:21', '2023-04-27 00:19:21', '2023-04-27 00:19:21'),
(16, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:19:31', '2023-04-27 00:19:31', '2023-04-27 00:19:31'),
(17, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:19:45', '2023-04-27 00:19:45', '2023-04-27 00:19:45'),
(18, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:20:47', '2023-04-27 00:20:47', '2023-04-27 00:20:47'),
(19, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:20:50', '2023-04-27 00:20:50', '2023-04-27 00:20:50'),
(20, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:20:59', '2023-04-27 00:20:59', '2023-04-27 00:20:59'),
(21, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:21:31', '2023-04-27 00:21:31', '2023-04-27 00:21:31'),
(22, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:21:39', '2023-04-27 00:21:39', '2023-04-27 00:21:39'),
(23, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:21:49', '2023-04-27 00:21:49', '2023-04-27 00:21:49'),
(24, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:22:07', '2023-04-27 00:22:07', '2023-04-27 00:22:07'),
(25, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:22:32', '2023-04-27 00:22:33', '2023-04-27 00:22:33'),
(26, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:22:36', '2023-04-27 00:22:36', '2023-04-27 00:22:36'),
(27, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:22:43', '2023-04-27 00:22:43', '2023-04-27 00:22:43'),
(28, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:24:42', '2023-04-27 00:24:42', '2023-04-27 00:24:42'),
(29, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:28:24', '2023-04-27 00:28:24', '2023-04-27 00:28:24'),
(30, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:29:53', '2023-04-27 00:29:53', '2023-04-27 00:29:53'),
(31, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:30:11', '2023-04-27 00:30:11', '2023-04-27 00:30:11'),
(32, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:30:15', '2023-04-27 00:30:15', '2023-04-27 00:30:15'),
(33, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:31:02', '2023-04-27 00:31:02', '2023-04-27 00:31:02'),
(34, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:33:47', '2023-04-27 00:33:47', '2023-04-27 00:33:47'),
(35, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:34:25', '2023-04-27 00:34:25', '2023-04-27 00:34:25'),
(36, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:37:39', '2023-04-27 00:37:39', '2023-04-27 00:37:39'),
(37, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:39:24', '2023-04-27 00:39:24', '2023-04-27 00:39:24'),
(38, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:39:38', '2023-04-27 00:39:38', '2023-04-27 00:39:38'),
(39, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:39:47', '2023-04-27 00:39:47', '2023-04-27 00:39:47'),
(40, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:44:26', '2023-04-27 00:44:26', '2023-04-27 00:44:26'),
(41, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:45:25', '2023-04-27 00:45:25', '2023-04-27 00:45:25'),
(42, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:46:12', '2023-04-27 00:46:12', '2023-04-27 00:46:12'),
(43, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:47:11', '2023-04-27 00:47:11', '2023-04-27 00:47:11'),
(44, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:47:24', '2023-04-27 00:47:24', '2023-04-27 00:47:24'),
(45, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:51:47', '2023-04-27 00:51:47', '2023-04-27 00:51:47'),
(46, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:52:10', '2023-04-27 00:52:10', '2023-04-27 00:52:10'),
(47, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:53:19', '2023-04-27 00:53:19', '2023-04-27 00:53:19'),
(48, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:54:23', '2023-04-27 00:54:23', '2023-04-27 00:54:23'),
(49, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:55:48', '2023-04-27 00:55:48', '2023-04-27 00:55:48'),
(50, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:56:19', '2023-04-27 00:56:19', '2023-04-27 00:56:19'),
(51, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:56:50', '2023-04-27 00:56:50', '2023-04-27 00:56:50'),
(52, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:58:12', '2023-04-27 00:58:12', '2023-04-27 00:58:12'),
(53, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 00:59:22', '2023-04-27 00:59:22', '2023-04-27 00:59:22'),
(54, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 01:01:08', '2023-04-27 01:01:08', '2023-04-27 01:01:08'),
(55, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 01:03:54', '2023-04-27 01:03:54', '2023-04-27 01:03:54'),
(56, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 01:05:06', '2023-04-27 01:05:06', '2023-04-27 01:05:06'),
(57, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 01:05:26', '2023-04-27 01:05:26', '2023-04-27 01:05:26'),
(58, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 01:09:19', '2023-04-27 01:09:19', '2023-04-27 01:09:19'),
(59, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 01:10:31', '2023-04-27 01:10:31', '2023-04-27 01:10:31'),
(60, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 01:11:00', '2023-04-27 01:11:00', '2023-04-27 01:11:00'),
(61, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 01:12:16', '2023-04-27 01:12:16', '2023-04-27 01:12:16'),
(62, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 01:12:43', '2023-04-27 01:12:43', '2023-04-27 01:12:43'),
(63, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 01:13:00', '2023-04-27 01:13:00', '2023-04-27 01:13:00'),
(64, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 01:13:12', '2023-04-27 01:13:12', '2023-04-27 01:13:12'),
(65, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 01:13:41', '2023-04-27 01:13:41', '2023-04-27 01:13:41'),
(66, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 01:15:22', '2023-04-27 01:15:22', '2023-04-27 01:15:22'),
(67, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 01:16:33', '2023-04-27 01:16:33', '2023-04-27 01:16:33'),
(68, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 01:16:54', '2023-04-27 01:16:54', '2023-04-27 01:16:54'),
(69, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 01:18:23', '2023-04-27 01:18:23', '2023-04-27 01:18:23'),
(70, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 01:18:34', '2023-04-27 01:18:34', '2023-04-27 01:18:34'),
(71, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 01:18:40', '2023-04-27 01:18:40', '2023-04-27 01:18:40'),
(72, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 01:21:30', '2023-04-27 01:21:30', '2023-04-27 01:21:30'),
(73, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 01:22:13', '2023-04-27 01:22:13', '2023-04-27 01:22:13'),
(74, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 01:22:51', '2023-04-27 01:22:51', '2023-04-27 01:22:51'),
(75, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 01:23:37', '2023-04-27 01:23:37', '2023-04-27 01:23:37'),
(76, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 01:48:19', '2023-04-27 01:48:19', '2023-04-27 01:48:19'),
(77, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 01:50:56', '2023-04-27 01:50:56', '2023-04-27 01:50:56'),
(78, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 01:57:54', '2023-04-27 01:57:54', '2023-04-27 01:57:54'),
(79, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 01:58:18', '2023-04-27 01:58:18', '2023-04-27 01:58:18'),
(80, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 01:58:41', '2023-04-27 01:58:41', '2023-04-27 01:58:41'),
(81, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 01:59:06', '2023-04-27 01:59:06', '2023-04-27 01:59:06'),
(82, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:00:30', '2023-04-27 02:00:30', '2023-04-27 02:00:30'),
(83, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:01:58', '2023-04-27 02:01:58', '2023-04-27 02:01:58'),
(84, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:02:01', '2023-04-27 02:02:01', '2023-04-27 02:02:01'),
(85, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:02:16', '2023-04-27 02:02:16', '2023-04-27 02:02:16'),
(86, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:02:41', '2023-04-27 02:02:41', '2023-04-27 02:02:41'),
(87, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:02:51', '2023-04-27 02:02:51', '2023-04-27 02:02:51'),
(88, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:02:54', '2023-04-27 02:02:54', '2023-04-27 02:02:54'),
(89, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:03:42', '2023-04-27 02:03:42', '2023-04-27 02:03:42'),
(90, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:07:41', '2023-04-27 02:07:41', '2023-04-27 02:07:41'),
(91, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:08:02', '2023-04-27 02:08:02', '2023-04-27 02:08:02'),
(92, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:09:13', '2023-04-27 02:09:13', '2023-04-27 02:09:13'),
(93, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:09:29', '2023-04-27 02:09:29', '2023-04-27 02:09:29'),
(94, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:09:46', '2023-04-27 02:09:46', '2023-04-27 02:09:46'),
(95, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:10:10', '2023-04-27 02:10:10', '2023-04-27 02:10:10'),
(96, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:10:23', '2023-04-27 02:10:23', '2023-04-27 02:10:23'),
(97, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:10:37', '2023-04-27 02:10:37', '2023-04-27 02:10:37'),
(98, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:11:26', '2023-04-27 02:11:26', '2023-04-27 02:11:26'),
(99, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:12:25', '2023-04-27 02:12:25', '2023-04-27 02:12:25'),
(100, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:13:42', '2023-04-27 02:13:42', '2023-04-27 02:13:42'),
(101, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:15:02', '2023-04-27 02:15:02', '2023-04-27 02:15:02'),
(102, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:15:29', '2023-04-27 02:15:29', '2023-04-27 02:15:29'),
(103, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:15:46', '2023-04-27 02:15:46', '2023-04-27 02:15:46'),
(104, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:16:21', '2023-04-27 02:16:21', '2023-04-27 02:16:21'),
(105, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:16:41', '2023-04-27 02:16:41', '2023-04-27 02:16:41'),
(106, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:16:56', '2023-04-27 02:16:56', '2023-04-27 02:16:56'),
(107, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:18:30', '2023-04-27 02:18:30', '2023-04-27 02:18:30'),
(108, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:19:01', '2023-04-27 02:19:01', '2023-04-27 02:19:01'),
(109, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:20:46', '2023-04-27 02:20:46', '2023-04-27 02:20:46'),
(110, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:21:18', '2023-04-27 02:21:18', '2023-04-27 02:21:18'),
(111, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:25:45', '2023-04-27 02:25:45', '2023-04-27 02:25:45'),
(112, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:26:28', '2023-04-27 02:26:28', '2023-04-27 02:26:28'),
(113, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:26:40', '2023-04-27 02:26:40', '2023-04-27 02:26:40'),
(114, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:28:31', '2023-04-27 02:28:31', '2023-04-27 02:28:31'),
(115, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:28:55', '2023-04-27 02:28:55', '2023-04-27 02:28:55'),
(116, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:30:54', '2023-04-27 02:30:54', '2023-04-27 02:30:54'),
(117, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:31:03', '2023-04-27 02:31:03', '2023-04-27 02:31:03'),
(118, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:31:33', '2023-04-27 02:31:33', '2023-04-27 02:31:33'),
(119, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:32:14', '2023-04-27 02:32:14', '2023-04-27 02:32:14'),
(120, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:33:36', '2023-04-27 02:33:36', '2023-04-27 02:33:36'),
(121, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:34:05', '2023-04-27 02:34:05', '2023-04-27 02:34:05'),
(122, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:34:35', '2023-04-27 02:34:35', '2023-04-27 02:34:35'),
(123, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:34:56', '2023-04-27 02:34:56', '2023-04-27 02:34:56'),
(124, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:35:11', '2023-04-27 02:35:11', '2023-04-27 02:35:11'),
(125, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:36:18', '2023-04-27 02:36:18', '2023-04-27 02:36:18'),
(126, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:51:50', '2023-04-27 02:51:50', '2023-04-27 02:51:50'),
(127, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:52:14', '2023-04-27 02:52:14', '2023-04-27 02:52:14'),
(128, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:52:57', '2023-04-27 02:52:57', '2023-04-27 02:52:57'),
(129, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:53:54', '2023-04-27 02:53:54', '2023-04-27 02:53:54'),
(130, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:54:21', '2023-04-27 02:54:21', '2023-04-27 02:54:21'),
(131, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:54:40', '2023-04-27 02:54:40', '2023-04-27 02:54:40'),
(132, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:55:31', '2023-04-27 02:55:31', '2023-04-27 02:55:31'),
(133, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:56:18', '2023-04-27 02:56:18', '2023-04-27 02:56:18'),
(134, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:56:32', '2023-04-27 02:56:32', '2023-04-27 02:56:32'),
(135, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:56:47', '2023-04-27 02:56:47', '2023-04-27 02:56:47'),
(136, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 02:57:01', '2023-04-27 02:57:01', '2023-04-27 02:57:01'),
(137, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:02:02', '2023-04-27 03:02:02', '2023-04-27 03:02:02'),
(138, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:08:46', '2023-04-27 03:08:46', '2023-04-27 03:08:46'),
(139, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:09:15', '2023-04-27 03:09:15', '2023-04-27 03:09:15'),
(140, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:09:51', '2023-04-27 03:09:51', '2023-04-27 03:09:51'),
(141, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:10:02', '2023-04-27 03:10:02', '2023-04-27 03:10:02'),
(142, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:12:27', '2023-04-27 03:12:27', '2023-04-27 03:12:27'),
(143, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:12:56', '2023-04-27 03:12:56', '2023-04-27 03:12:56'),
(144, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:13:33', '2023-04-27 03:13:33', '2023-04-27 03:13:33'),
(145, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:13:56', '2023-04-27 03:13:56', '2023-04-27 03:13:56'),
(146, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:14:02', '2023-04-27 03:14:02', '2023-04-27 03:14:02'),
(147, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:14:27', '2023-04-27 03:14:27', '2023-04-27 03:14:27'),
(148, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:14:38', '2023-04-27 03:14:38', '2023-04-27 03:14:38'),
(149, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:15:21', '2023-04-27 03:15:21', '2023-04-27 03:15:21'),
(150, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:16:26', '2023-04-27 03:16:26', '2023-04-27 03:16:26'),
(151, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:17:05', '2023-04-27 03:17:05', '2023-04-27 03:17:05'),
(152, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:17:28', '2023-04-27 03:17:28', '2023-04-27 03:17:28'),
(153, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:17:45', '2023-04-27 03:17:45', '2023-04-27 03:17:45'),
(154, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:21:08', '2023-04-27 03:21:08', '2023-04-27 03:21:08'),
(155, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:21:55', '2023-04-27 03:21:55', '2023-04-27 03:21:55'),
(156, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:22:25', '2023-04-27 03:22:25', '2023-04-27 03:22:25'),
(157, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:22:50', '2023-04-27 03:22:50', '2023-04-27 03:22:50'),
(158, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:24:06', '2023-04-27 03:24:06', '2023-04-27 03:24:06'),
(159, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:25:00', '2023-04-27 03:25:00', '2023-04-27 03:25:00'),
(160, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:27:03', '2023-04-27 03:27:03', '2023-04-27 03:27:03'),
(161, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:27:32', '2023-04-27 03:27:32', '2023-04-27 03:27:32'),
(162, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:27:46', '2023-04-27 03:27:46', '2023-04-27 03:27:46'),
(163, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:28:52', '2023-04-27 03:28:52', '2023-04-27 03:28:52'),
(164, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:30:23', '2023-04-27 03:30:23', '2023-04-27 03:30:23'),
(165, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:30:44', '2023-04-27 03:30:44', '2023-04-27 03:30:44'),
(166, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:31:43', '2023-04-27 03:31:43', '2023-04-27 03:31:43'),
(167, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:32:25', '2023-04-27 03:32:25', '2023-04-27 03:32:25'),
(168, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:33:01', '2023-04-27 03:33:01', '2023-04-27 03:33:01'),
(169, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:34:06', '2023-04-27 03:34:06', '2023-04-27 03:34:06'),
(170, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:42:29', '2023-04-27 03:42:29', '2023-04-27 03:42:29'),
(171, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:42:56', '2023-04-27 03:42:56', '2023-04-27 03:42:56'),
(172, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:43:18', '2023-04-27 03:43:18', '2023-04-27 03:43:18'),
(173, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:43:45', '2023-04-27 03:43:45', '2023-04-27 03:43:45'),
(174, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:44:12', '2023-04-27 03:44:12', '2023-04-27 03:44:12'),
(175, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:44:33', '2023-04-27 03:44:33', '2023-04-27 03:44:33'),
(176, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:46:24', '2023-04-27 03:46:24', '2023-04-27 03:46:24'),
(177, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:46:52', '2023-04-27 03:46:52', '2023-04-27 03:46:52'),
(178, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:48:40', '2023-04-27 03:48:40', '2023-04-27 03:48:40'),
(179, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:48:57', '2023-04-27 03:48:57', '2023-04-27 03:48:57'),
(180, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:56:26', '2023-04-27 03:56:26', '2023-04-27 03:56:26'),
(181, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:58:30', '2023-04-27 03:58:30', '2023-04-27 03:58:30'),
(182, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 03:58:42', '2023-04-27 03:58:42', '2023-04-27 03:58:42'),
(183, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:00:02', '2023-04-27 04:00:02', '2023-04-27 04:00:02'),
(184, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:00:06', '2023-04-27 04:00:06', '2023-04-27 04:00:06'),
(185, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:01:12', '2023-04-27 04:01:12', '2023-04-27 04:01:12'),
(186, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:01:46', '2023-04-27 04:01:46', '2023-04-27 04:01:46'),
(187, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:02:24', '2023-04-27 04:02:24', '2023-04-27 04:02:24'),
(188, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:02:30', '2023-04-27 04:02:30', '2023-04-27 04:02:30'),
(189, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:06:35', '2023-04-27 04:06:35', '2023-04-27 04:06:35'),
(190, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:07:05', '2023-04-27 04:07:05', '2023-04-27 04:07:05'),
(191, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:09:08', '2023-04-27 04:09:08', '2023-04-27 04:09:08'),
(192, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:09:15', '2023-04-27 04:09:15', '2023-04-27 04:09:15'),
(193, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:09:58', '2023-04-27 04:09:58', '2023-04-27 04:09:58'),
(194, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:10:10', '2023-04-27 04:10:10', '2023-04-27 04:10:10'),
(195, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:10:43', '2023-04-27 04:10:43', '2023-04-27 04:10:43'),
(196, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:11:04', '2023-04-27 04:11:04', '2023-04-27 04:11:04'),
(197, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:11:41', '2023-04-27 04:11:41', '2023-04-27 04:11:41'),
(198, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:11:48', '2023-04-27 04:11:48', '2023-04-27 04:11:48'),
(199, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:13:26', '2023-04-27 04:13:26', '2023-04-27 04:13:26'),
(200, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:14:01', '2023-04-27 04:14:01', '2023-04-27 04:14:01'),
(201, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:14:45', '2023-04-27 04:14:45', '2023-04-27 04:14:45'),
(202, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:16:53', '2023-04-27 04:16:53', '2023-04-27 04:16:53'),
(203, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:23:45', '2023-04-27 04:23:45', '2023-04-27 04:23:45'),
(204, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:24:11', '2023-04-27 04:24:11', '2023-04-27 04:24:11'),
(205, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:25:10', '2023-04-27 04:25:10', '2023-04-27 04:25:10'),
(206, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:26:03', '2023-04-27 04:26:03', '2023-04-27 04:26:03'),
(207, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:28:22', '2023-04-27 04:28:22', '2023-04-27 04:28:22'),
(208, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:28:56', '2023-04-27 04:28:56', '2023-04-27 04:28:56'),
(209, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:31:18', '2023-04-27 04:31:18', '2023-04-27 04:31:18'),
(210, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:38:08', '2023-04-27 04:38:08', '2023-04-27 04:38:08'),
(211, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:40:04', '2023-04-27 04:40:04', '2023-04-27 04:40:04'),
(212, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:40:15', '2023-04-27 04:40:15', '2023-04-27 04:40:15'),
(213, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:40:48', '2023-04-27 04:40:48', '2023-04-27 04:40:48'),
(214, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:41:25', '2023-04-27 04:41:25', '2023-04-27 04:41:25'),
(215, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:42:18', '2023-04-27 04:42:18', '2023-04-27 04:42:18'),
(216, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:42:56', '2023-04-27 04:42:56', '2023-04-27 04:42:56'),
(217, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:43:11', '2023-04-27 04:43:11', '2023-04-27 04:43:11'),
(218, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:43:20', '2023-04-27 04:43:20', '2023-04-27 04:43:20'),
(219, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:45:30', '2023-04-27 04:45:30', '2023-04-27 04:45:30'),
(220, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:45:47', '2023-04-27 04:45:47', '2023-04-27 04:45:47'),
(221, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:46:02', '2023-04-27 04:46:02', '2023-04-27 04:46:02'),
(222, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:46:16', '2023-04-27 04:46:16', '2023-04-27 04:46:16'),
(223, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:46:27', '2023-04-27 04:46:27', '2023-04-27 04:46:27'),
(224, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:47:02', '2023-04-27 04:47:02', '2023-04-27 04:47:02'),
(225, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:47:44', '2023-04-27 04:47:44', '2023-04-27 04:47:44'),
(226, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:48:06', '2023-04-27 04:48:06', '2023-04-27 04:48:06'),
(227, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:48:16', '2023-04-27 04:48:16', '2023-04-27 04:48:16'),
(228, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:48:37', '2023-04-27 04:48:37', '2023-04-27 04:48:37'),
(229, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:49:08', '2023-04-27 04:49:08', '2023-04-27 04:49:08'),
(230, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:49:28', '2023-04-27 04:49:28', '2023-04-27 04:49:28'),
(231, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:55:35', '2023-04-27 04:55:35', '2023-04-27 04:55:35'),
(232, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 04:56:34', '2023-04-27 04:56:34', '2023-04-27 04:56:34'),
(233, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 05:11:52', '2023-04-27 05:11:52', '2023-04-27 05:11:52'),
(234, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 05:13:35', '2023-04-27 05:13:35', '2023-04-27 05:13:35'),
(235, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-27 05:13:50', '2023-04-27 05:13:50', '2023-04-27 05:13:50'),
(236, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:01:44', '2023-04-28 22:01:44', '2023-04-28 22:01:44'),
(237, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:04:36', '2023-04-28 22:04:36', '2023-04-28 22:04:36'),
(238, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:05:26', '2023-04-28 22:05:26', '2023-04-28 22:05:26'),
(239, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:07:56', '2023-04-28 22:07:56', '2023-04-28 22:07:56'),
(240, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:08:07', '2023-04-28 22:08:07', '2023-04-28 22:08:07'),
(241, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:10:02', '2023-04-28 22:10:02', '2023-04-28 22:10:02'),
(242, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:13:07', '2023-04-28 22:13:07', '2023-04-28 22:13:07'),
(243, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:13:51', '2023-04-28 22:13:51', '2023-04-28 22:13:51'),
(244, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:14:37', '2023-04-28 22:14:37', '2023-04-28 22:14:37'),
(245, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:15:09', '2023-04-28 22:15:09', '2023-04-28 22:15:09'),
(246, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:15:13', '2023-04-28 22:15:13', '2023-04-28 22:15:13'),
(247, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:15:22', '2023-04-28 22:15:22', '2023-04-28 22:15:22'),
(248, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:15:56', '2023-04-28 22:15:56', '2023-04-28 22:15:56'),
(249, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:18:31', '2023-04-28 22:18:31', '2023-04-28 22:18:31'),
(250, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:19:12', '2023-04-28 22:19:12', '2023-04-28 22:19:12'),
(251, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:42:02', '2023-04-28 22:42:02', '2023-04-28 22:42:02'),
(252, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:42:38', '2023-04-28 22:42:38', '2023-04-28 22:42:38'),
(253, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:44:09', '2023-04-28 22:44:09', '2023-04-28 22:44:09'),
(254, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:44:39', '2023-04-28 22:44:39', '2023-04-28 22:44:39'),
(255, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:44:44', '2023-04-28 22:44:44', '2023-04-28 22:44:44'),
(256, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:44:52', '2023-04-28 22:44:52', '2023-04-28 22:44:52'),
(257, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:46:26', '2023-04-28 22:46:26', '2023-04-28 22:46:26'),
(258, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:51:55', '2023-04-28 22:51:55', '2023-04-28 22:51:55'),
(259, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:52:36', '2023-04-28 22:52:36', '2023-04-28 22:52:36'),
(260, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:52:58', '2023-04-28 22:52:58', '2023-04-28 22:52:58'),
(261, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:53:32', '2023-04-28 22:53:32', '2023-04-28 22:53:32'),
(262, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:53:42', '2023-04-28 22:53:42', '2023-04-28 22:53:42'),
(263, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:53:53', '2023-04-28 22:53:53', '2023-04-28 22:53:53'),
(264, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:54:03', '2023-04-28 22:54:03', '2023-04-28 22:54:03'),
(265, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:55:29', '2023-04-28 22:55:29', '2023-04-28 22:55:29'),
(266, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:56:44', '2023-04-28 22:56:44', '2023-04-28 22:56:44'),
(267, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:56:59', '2023-04-28 22:56:59', '2023-04-28 22:56:59'),
(268, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:57:35', '2023-04-28 22:57:35', '2023-04-28 22:57:35'),
(269, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:57:58', '2023-04-28 22:57:58', '2023-04-28 22:57:58'),
(270, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:58:26', '2023-04-28 22:58:26', '2023-04-28 22:58:26'),
(271, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:58:50', '2023-04-28 22:58:50', '2023-04-28 22:58:50'),
(272, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:59:20', '2023-04-28 22:59:20', '2023-04-28 22:59:20'),
(273, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:59:29', '2023-04-28 22:59:29', '2023-04-28 22:59:29'),
(274, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 22:59:47', '2023-04-28 22:59:47', '2023-04-28 22:59:47'),
(275, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 23:00:09', '2023-04-28 23:00:09', '2023-04-28 23:00:09'),
(276, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 23:00:20', '2023-04-28 23:00:20', '2023-04-28 23:00:20'),
(277, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 23:00:37', '2023-04-28 23:00:37', '2023-04-28 23:00:37'),
(278, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 23:01:42', '2023-04-28 23:01:42', '2023-04-28 23:01:42'),
(279, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 23:07:29', '2023-04-28 23:07:29', '2023-04-28 23:07:29'),
(280, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 23:07:47', '2023-04-28 23:07:47', '2023-04-28 23:07:47'),
(281, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 23:13:49', '2023-04-28 23:13:49', '2023-04-28 23:13:49'),
(282, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 23:14:05', '2023-04-28 23:14:05', '2023-04-28 23:14:05'),
(283, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 23:14:32', '2023-04-28 23:14:32', '2023-04-28 23:14:32'),
(284, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 23:16:35', '2023-04-28 23:16:35', '2023-04-28 23:16:35'),
(285, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 23:16:54', '2023-04-28 23:16:54', '2023-04-28 23:16:54'),
(286, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 23:17:31', '2023-04-28 23:17:31', '2023-04-28 23:17:31'),
(287, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 23:22:00', '2023-04-28 23:22:00', '2023-04-28 23:22:00'),
(288, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-28 23:23:04', '2023-04-28 23:23:04', '2023-04-28 23:23:04'),
(289, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-29 00:36:00', '2023-04-29 00:36:00', '2023-04-29 00:36:00'),
(290, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-29 02:06:30', '2023-04-29 02:06:30', '2023-04-29 02:06:30'),
(291, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-29 02:08:35', '2023-04-29 02:08:35', '2023-04-29 02:08:35'),
(292, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-29 02:11:29', '2023-04-29 02:11:30', '2023-04-29 02:11:30'),
(293, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-29 02:11:37', '2023-04-29 02:11:37', '2023-04-29 02:11:37'),
(294, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-29 02:34:11', '2023-04-29 02:34:11', '2023-04-29 02:34:11'),
(295, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-29 02:43:05', '2023-04-29 02:43:05', '2023-04-29 02:43:05'),
(296, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-29 02:51:01', '2023-04-29 02:51:01', '2023-04-29 02:51:01'),
(297, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-29 02:52:18', '2023-04-29 02:52:18', '2023-04-29 02:52:18'),
(298, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-29 03:14:49', '2023-04-29 03:14:49', '2023-04-29 03:14:49'),
(299, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-29 04:14:26', '2023-04-29 04:14:26', '2023-04-29 04:14:26'),
(300, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-29 04:16:10', '2023-04-29 04:16:10', '2023-04-29 04:16:10'),
(301, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-29 04:16:24', '2023-04-29 04:16:24', '2023-04-29 04:16:24'),
(302, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-29 04:18:44', '2023-04-29 04:18:44', '2023-04-29 04:18:44'),
(303, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-29 04:18:54', '2023-04-29 04:18:54', '2023-04-29 04:18:54'),
(304, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-29 04:20:07', '2023-04-29 04:20:07', '2023-04-29 04:20:07'),
(305, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-29 04:20:35', '2023-04-29 04:20:35', '2023-04-29 04:20:35'),
(306, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-29 04:21:08', '2023-04-29 04:21:08', '2023-04-29 04:21:08'),
(307, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-29 04:28:45', '2023-04-29 04:28:45', '2023-04-29 04:28:45'),
(308, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-29 04:28:57', '2023-04-29 04:28:57', '2023-04-29 04:28:57'),
(309, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-29 04:30:26', '2023-04-29 04:30:26', '2023-04-29 04:30:26'),
(310, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-29 04:30:33', '2023-04-29 04:30:33', '2023-04-29 04:30:33'),
(311, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-29 04:31:07', '2023-04-29 04:31:07', '2023-04-29 04:31:07'),
(312, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-29 04:32:12', '2023-04-29 04:32:12', '2023-04-29 04:32:12'),
(313, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-29 04:32:44', '2023-04-29 04:32:44', '2023-04-29 04:32:44'),
(314, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-29 04:32:52', '2023-04-29 04:32:52', '2023-04-29 04:32:52'),
(315, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-29 05:05:02', '2023-04-29 05:05:02', '2023-04-29 05:05:02'),
(316, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-30 02:16:09', '2023-04-30 02:16:09', '2023-04-30 02:16:09'),
(317, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-30 02:16:59', '2023-04-30 02:16:59', '2023-04-30 02:16:59'),
(318, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-30 02:22:38', '2023-04-30 02:22:38', '2023-04-30 02:22:38'),
(319, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-30 04:26:39', '2023-04-30 04:26:39', '2023-04-30 04:26:39'),
(320, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-30 05:50:58', '2023-04-30 05:50:58', '2023-04-30 05:50:58'),
(321, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-30 06:37:47', '2023-04-30 06:37:47', '2023-04-30 06:37:47'),
(322, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-04-30 07:16:21', '2023-04-30 07:16:21', '2023-04-30 07:16:21'),
(323, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-01 22:18:35', '2023-05-01 22:18:36', '2023-05-01 22:18:36'),
(324, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-01 22:19:16', '2023-05-01 22:19:16', '2023-05-01 22:19:16'),
(325, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-01 22:19:26', '2023-05-01 22:19:26', '2023-05-01 22:19:26'),
(326, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-02 03:04:50', '2023-05-02 03:04:50', '2023-05-02 03:04:50'),
(327, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-02 03:05:34', '2023-05-02 03:05:34', '2023-05-02 03:05:34'),
(328, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-02 03:07:20', '2023-05-02 03:07:20', '2023-05-02 03:07:20'),
(329, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-02 06:19:07', '2023-05-02 06:19:07', '2023-05-02 06:19:07'),
(330, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 01:45:56', '2023-05-03 01:45:56', '2023-05-03 01:45:56'),
(331, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 02:02:56', '2023-05-03 02:02:56', '2023-05-03 02:02:56'),
(332, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 02:11:45', '2023-05-03 02:11:45', '2023-05-03 02:11:45'),
(333, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 02:11:49', '2023-05-03 02:11:49', '2023-05-03 02:11:49'),
(334, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 02:15:14', '2023-05-03 02:15:14', '2023-05-03 02:15:14'),
(335, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 04:10:42', '2023-05-03 04:10:42', '2023-05-03 04:10:42'),
(336, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 04:16:50', '2023-05-03 04:16:50', '2023-05-03 04:16:50'),
(337, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 04:18:28', '2023-05-03 04:18:28', '2023-05-03 04:18:28'),
(338, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 04:18:58', '2023-05-03 04:18:58', '2023-05-03 04:18:58'),
(339, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 04:27:09', '2023-05-03 04:27:09', '2023-05-03 04:27:09'),
(340, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 04:38:09', '2023-05-03 04:38:09', '2023-05-03 04:38:09'),
(341, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 04:52:52', '2023-05-03 04:52:52', '2023-05-03 04:52:52'),
(342, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 04:53:00', '2023-05-03 04:53:00', '2023-05-03 04:53:00'),
(343, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 04:53:50', '2023-05-03 04:53:50', '2023-05-03 04:53:50'),
(344, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 04:54:13', '2023-05-03 04:54:13', '2023-05-03 04:54:13'),
(345, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 04:55:10', '2023-05-03 04:55:10', '2023-05-03 04:55:10'),
(346, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 04:56:02', '2023-05-03 04:56:02', '2023-05-03 04:56:02'),
(347, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 04:56:48', '2023-05-03 04:56:48', '2023-05-03 04:56:48'),
(348, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 05:12:13', '2023-05-03 05:12:13', '2023-05-03 05:12:13'),
(349, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 05:14:46', '2023-05-03 05:14:46', '2023-05-03 05:14:46'),
(350, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 05:16:06', '2023-05-03 05:16:06', '2023-05-03 05:16:06'),
(351, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 05:16:53', '2023-05-03 05:16:53', '2023-05-03 05:16:53'),
(352, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 05:17:42', '2023-05-03 05:17:42', '2023-05-03 05:17:42'),
(353, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 05:20:17', '2023-05-03 05:20:17', '2023-05-03 05:20:17'),
(354, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 05:22:50', '2023-05-03 05:22:50', '2023-05-03 05:22:50'),
(355, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 05:27:02', '2023-05-03 05:27:02', '2023-05-03 05:27:02'),
(356, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 05:27:46', '2023-05-03 05:27:46', '2023-05-03 05:27:46'),
(357, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 05:32:50', '2023-05-03 05:32:50', '2023-05-03 05:32:50'),
(358, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 05:33:45', '2023-05-03 05:33:45', '2023-05-03 05:33:45'),
(359, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 05:33:57', '2023-05-03 05:33:57', '2023-05-03 05:33:57'),
(360, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 05:34:09', '2023-05-03 05:34:09', '2023-05-03 05:34:09'),
(361, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 05:37:03', '2023-05-03 05:37:03', '2023-05-03 05:37:03'),
(362, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 05:47:50', '2023-05-03 05:47:50', '2023-05-03 05:47:50'),
(363, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 05:50:01', '2023-05-03 05:50:01', '2023-05-03 05:50:01'),
(364, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 05:50:15', '2023-05-03 05:50:15', '2023-05-03 05:50:15'),
(365, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 05:56:30', '2023-05-03 05:56:30', '2023-05-03 05:56:30'),
(366, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 05:57:24', '2023-05-03 05:57:24', '2023-05-03 05:57:24'),
(367, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 05:58:56', '2023-05-03 05:58:56', '2023-05-03 05:58:56'),
(368, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-03 06:03:53', '2023-05-03 06:03:53', '2023-05-03 06:03:53'),
(369, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 00:18:27', '2023-05-04 00:18:27', '2023-05-04 00:18:27'),
(370, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 00:24:12', '2023-05-04 00:24:12', '2023-05-04 00:24:12'),
(371, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 00:24:48', '2023-05-04 00:24:48', '2023-05-04 00:24:48'),
(372, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 00:27:04', '2023-05-04 00:27:04', '2023-05-04 00:27:04'),
(373, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 00:27:52', '2023-05-04 00:27:52', '2023-05-04 00:27:52'),
(374, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 00:29:18', '2023-05-04 00:29:18', '2023-05-04 00:29:18'),
(375, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 00:29:28', '2023-05-04 00:29:28', '2023-05-04 00:29:28'),
(376, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 00:30:29', '2023-05-04 00:30:29', '2023-05-04 00:30:29'),
(377, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 00:31:00', '2023-05-04 00:31:01', '2023-05-04 00:31:01'),
(378, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 00:31:57', '2023-05-04 00:31:57', '2023-05-04 00:31:57'),
(379, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 00:34:48', '2023-05-04 00:34:48', '2023-05-04 00:34:48'),
(380, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 00:35:27', '2023-05-04 00:35:27', '2023-05-04 00:35:27'),
(381, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 00:38:36', '2023-05-04 00:38:36', '2023-05-04 00:38:36'),
(382, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 00:38:52', '2023-05-04 00:38:52', '2023-05-04 00:38:52'),
(383, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 00:39:17', '2023-05-04 00:39:17', '2023-05-04 00:39:17'),
(384, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 00:41:08', '2023-05-04 00:41:08', '2023-05-04 00:41:08'),
(385, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 00:41:22', '2023-05-04 00:41:22', '2023-05-04 00:41:22'),
(386, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 00:42:54', '2023-05-04 00:42:54', '2023-05-04 00:42:54'),
(387, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 00:43:29', '2023-05-04 00:43:29', '2023-05-04 00:43:29'),
(388, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 00:44:34', '2023-05-04 00:44:34', '2023-05-04 00:44:34'),
(389, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 00:46:46', '2023-05-04 00:46:46', '2023-05-04 00:46:46'),
(390, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 00:49:03', '2023-05-04 00:49:03', '2023-05-04 00:49:03'),
(391, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 00:50:00', '2023-05-04 00:50:00', '2023-05-04 00:50:00'),
(392, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 00:50:42', '2023-05-04 00:50:42', '2023-05-04 00:50:42'),
(393, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 00:51:12', '2023-05-04 00:51:12', '2023-05-04 00:51:12'),
(394, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 00:51:37', '2023-05-04 00:51:37', '2023-05-04 00:51:37'),
(395, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 00:53:03', '2023-05-04 00:53:03', '2023-05-04 00:53:03'),
(396, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 00:53:34', '2023-05-04 00:53:34', '2023-05-04 00:53:34'),
(397, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 00:54:44', '2023-05-04 00:54:44', '2023-05-04 00:54:44'),
(398, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 00:56:09', '2023-05-04 00:56:09', '2023-05-04 00:56:09'),
(399, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 00:57:54', '2023-05-04 00:57:54', '2023-05-04 00:57:54'),
(400, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 00:59:08', '2023-05-04 00:59:08', '2023-05-04 00:59:08'),
(401, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 00:59:14', '2023-05-04 00:59:14', '2023-05-04 00:59:14'),
(402, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 00:59:45', '2023-05-04 00:59:45', '2023-05-04 00:59:45'),
(403, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 01:02:27', '2023-05-04 01:02:27', '2023-05-04 01:02:27'),
(404, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 01:05:20', '2023-05-04 01:05:20', '2023-05-04 01:05:20'),
(405, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 01:12:18', '2023-05-04 01:12:18', '2023-05-04 01:12:18'),
(406, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 01:56:28', '2023-05-04 01:56:28', '2023-05-04 01:56:28'),
(407, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 01:56:43', '2023-05-04 01:56:43', '2023-05-04 01:56:43'),
(408, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 01:56:48', '2023-05-04 01:56:48', '2023-05-04 01:56:48'),
(409, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 01:57:05', '2023-05-04 01:57:05', '2023-05-04 01:57:05'),
(410, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 01:57:17', '2023-05-04 01:57:17', '2023-05-04 01:57:17'),
(411, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 04:39:16', '2023-05-04 04:39:16', '2023-05-04 04:39:16'),
(412, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-04 04:50:57', '2023-05-04 04:50:57', '2023-05-04 04:50:57'),
(413, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-05 21:43:12', '2023-05-05 21:43:12', '2023-05-05 21:43:12'),
(414, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-05 21:43:35', '2023-05-05 21:43:35', '2023-05-05 21:43:35'),
(415, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-05 21:44:20', '2023-05-05 21:44:20', '2023-05-05 21:44:20'),
(416, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-05 21:44:34', '2023-05-05 21:44:34', '2023-05-05 21:44:34'),
(417, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-06 04:04:43', '2023-05-06 04:04:43', '2023-05-06 04:04:43'),
(418, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-06 04:19:41', '2023-05-06 04:19:41', '2023-05-06 04:19:41'),
(419, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-06 04:20:41', '2023-05-06 04:20:41', '2023-05-06 04:20:41'),
(420, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-06 04:21:36', '2023-05-06 04:21:36', '2023-05-06 04:21:36'),
(421, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-06 04:35:21', '2023-05-06 04:35:21', '2023-05-06 04:35:21'),
(422, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-06 04:36:25', '2023-05-06 04:36:25', '2023-05-06 04:36:25'),
(423, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-06 04:44:21', '2023-05-06 04:44:21', '2023-05-06 04:44:21'),
(424, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-06 04:48:48', '2023-05-06 04:48:48', '2023-05-06 04:48:48'),
(425, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-06 04:49:31', '2023-05-06 04:49:31', '2023-05-06 04:49:31'),
(426, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-06 04:49:51', '2023-05-06 04:49:51', '2023-05-06 04:49:51'),
(427, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-06 04:50:18', '2023-05-06 04:50:18', '2023-05-06 04:50:18');
INSERT INTO `visitors` (`id`, `visitable_type`, `visitable_id`, `visitor_ip`, `visited_at`, `created_at`, `updated_at`) VALUES
(428, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-06 04:50:54', '2023-05-06 04:50:54', '2023-05-06 04:50:54'),
(429, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-06 04:51:21', '2023-05-06 04:51:21', '2023-05-06 04:51:21'),
(430, 'App\\Models\\HomeSlider', 5, '127.0.0.1', '2023-05-06 04:51:34', '2023-05-06 04:51:34', '2023-05-06 04:51:34');

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
  ADD KEY `orders_user_id_foreign` (`user_id`);

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
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shippings_order_id_foreign` (`order_id`);

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
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_order_id_foreign` (`order_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `reveiws`
--
ALTER TABLE `reveiws`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `upload_course_videos`
--
ALTER TABLE `upload_course_videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=431;

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
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
