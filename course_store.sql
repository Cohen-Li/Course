-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2022 at 10:07 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `course_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'Sales'),
(2, 'Update');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(6, 1, 28),
(1, 1, 32),
(2, 1, 36),
(3, 1, 40),
(4, 1, 44),
(5, 1, 48),
(7, 2, 25),
(8, 2, 26),
(9, 2, 27),
(10, 2, 28),
(11, 2, 29),
(12, 2, 30),
(13, 2, 31),
(14, 2, 32),
(15, 2, 33),
(16, 2, 34),
(17, 2, 35),
(18, 2, 36),
(19, 2, 37),
(20, 2, 38),
(21, 2, 39),
(22, 2, 40),
(23, 2, 41),
(24, 2, 42),
(25, 2, 43),
(26, 2, 44),
(27, 2, 45),
(28, 2, 46),
(29, 2, 47),
(30, 2, 48);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add category', 7, 'add_category'),
(26, 'Can change category', 7, 'change_category'),
(27, 'Can delete category', 7, 'delete_category'),
(28, 'Can view category', 7, 'view_category'),
(29, 'Can add course', 8, 'add_course'),
(30, 'Can change course', 8, 'change_course'),
(31, 'Can delete course', 8, 'delete_course'),
(32, 'Can view course', 8, 'view_course'),
(33, 'Can add lesson', 9, 'add_lesson'),
(34, 'Can change lesson', 9, 'change_lesson'),
(35, 'Can delete lesson', 9, 'delete_lesson'),
(36, 'Can view lesson', 9, 'view_lesson'),
(37, 'Can add tag', 10, 'add_tag'),
(38, 'Can change tag', 10, 'change_tag'),
(39, 'Can delete tag', 10, 'delete_tag'),
(40, 'Can view tag', 10, 'view_tag'),
(41, 'Can add video course less', 11, 'add_videocourseless'),
(42, 'Can change video course less', 11, 'change_videocourseless'),
(43, 'Can delete video course less', 11, 'delete_videocourseless'),
(44, 'Can view video course less', 11, 'view_videocourseless'),
(45, 'Can add image course less', 12, 'add_imagecourseless'),
(46, 'Can change image course less', 12, 'change_imagecourseless'),
(47, 'Can delete image course less', 12, 'delete_imagecourseless'),
(48, 'Can view image course less', 12, 'view_imagecourseless'),
(49, 'Can add variation', 13, 'add_variation'),
(50, 'Can change variation', 13, 'change_variation'),
(51, 'Can delete variation', 13, 'delete_variation'),
(52, 'Can view variation', 13, 'view_variation');

-- --------------------------------------------------------

--
-- Table structure for table `core_user`
--

CREATE TABLE `core_user` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `sex` int(11) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zalo` varchar(15) NOT NULL,
  `social` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `core_user`
--

INSERT INTO `core_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `avatar`, `sex`, `mobile`, `address`, `zalo`, `social`) VALUES
(1, 'pbkdf2_sha256$390000$1gVBifooEtkJuNTnKpzHgr$8Xhb/ijsKa222kogkptccSLfIJPg6kq+1G5HBIyaYxw=', '2022-12-03 07:25:25.269483', 1, 'admin', '', '', 'lycaohung@gmail.com', 1, 1, '2022-12-02 09:28:27.000000', 'avatar/2022/anonymous.jpg', 0, '0902997317', 'Sài Gòn', '0902997317', 'lycaohung'),
(2, 'pbkdf2_sha256$390000$a5tXanSb75j0L76d4Y2tAz$+Ym5L6euApZoZqmgc7bjy+1TPmdPIhfjyzyoDN5lKgw=', '2022-12-03 05:02:04.899068', 0, 'updatebasic', 'Nguyễn', 'Văn A', 'abc@gmail.com', 1, 1, '2022-12-03 04:59:34.000000', 'avatar/2022/anonymous_KZEKx4C.jpg', 0, '0902997317', 'Sài Gòn', '0902997317', 'lycaohung');

-- --------------------------------------------------------

--
-- Table structure for table `core_user_groups`
--

CREATE TABLE `core_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `core_user_groups`
--

INSERT INTO `core_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `core_user_user_permissions`
--

CREATE TABLE `core_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL
) ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-12-02 09:40:55.309399', '1', 'Công cụ lập trình', 1, '[{\"added\": {}}]', 7, 1),
(2, '2022-12-02 09:41:13.191222', '2', 'Blockchain', 1, '[{\"added\": {}}]', 7, 1),
(3, '2022-12-02 09:42:25.260915', '1', 'Lập trình hiện đại', 1, '[{\"added\": {}}]', 8, 1),
(4, '2022-12-02 09:46:42.674643', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Avatar\", \"Mobile\", \"Address\", \"Zalo\", \"Social\"]}}]', 6, 1),
(5, '2022-12-02 09:50:43.243078', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Avatar\"]}}]', 6, 1),
(6, '2022-12-02 09:53:08.873260', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Avatar\"]}}]', 6, 1),
(7, '2022-12-02 09:59:03.875754', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Avatar\"]}}]', 6, 1),
(8, '2022-12-03 03:29:32.579237', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Avatar\"]}}]', 6, 1),
(9, '2022-12-03 03:30:28.376916', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Avatar\"]}}]', 6, 1),
(10, '2022-12-03 03:31:28.839769', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Avatar\"]}}]', 6, 1),
(11, '2022-12-03 03:33:09.380944', '2', 'Blockchain cơ bản', 1, '[{\"added\": {}}]', 8, 1),
(12, '2022-12-03 03:37:22.817242', '2', 'Blockchain cơ bản', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 8, 1),
(13, '2022-12-03 03:38:03.968319', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Avatar\"]}}]', 6, 1),
(14, '2022-12-03 03:39:32.517936', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Avatar\"]}}]', 6, 1),
(15, '2022-12-03 03:40:24.593446', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Avatar\"]}}]', 6, 1),
(16, '2022-12-03 03:43:44.611350', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Avatar\"]}}]', 6, 1),
(17, '2022-12-03 03:50:51.520203', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Avatar\"]}}]', 6, 1),
(18, '2022-12-03 03:52:12.641780', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Avatar\"]}}]', 6, 1),
(19, '2022-12-03 03:53:06.070736', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Avatar\"]}}]', 6, 1),
(20, '2022-12-03 03:55:18.012621', '2', 'Blockchain cơ bản', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 8, 1),
(21, '2022-12-03 03:59:35.674064', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Avatar\"]}}]', 6, 1),
(22, '2022-12-03 04:00:46.226989', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Avatar\"]}}]', 6, 1),
(23, '2022-12-03 04:01:02.634012', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Avatar\"]}}]', 6, 1),
(24, '2022-12-03 04:01:59.811153', '2', 'Blockchain cơ bản', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 8, 1),
(25, '2022-12-03 04:21:46.387151', '1', 'Lập trình hiện đại', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 8, 1),
(26, '2022-12-03 04:23:35.185208', '1', 'django', 1, '[{\"added\": {}}]', 10, 1),
(27, '2022-12-03 04:23:41.444063', '2', 'javascript', 1, '[{\"added\": {}}]', 10, 1),
(28, '2022-12-03 04:23:50.702928', '3', 'python', 1, '[{\"added\": {}}]', 10, 1),
(29, '2022-12-03 04:24:10.915833', '1', 'Bài 1: Hướng dẫn tạo project django', 1, '[{\"added\": {}}]', 9, 1),
(30, '2022-12-03 04:31:59.421430', '3', 'Lập trình web app', 1, '[{\"added\": {}}]', 7, 1),
(31, '2022-12-03 04:33:17.366199', '3', 'Lập trình NodeJs', 1, '[{\"added\": {}}]', 8, 1),
(32, '2022-12-03 04:37:07.819044', '4', 'Công nghệ lập trình', 1, '[{\"added\": {}}]', 10, 1),
(33, '2022-12-03 04:37:23.785481', '5', 'đừng có tưởng bở', 1, '[{\"added\": {}}]', 10, 1),
(34, '2022-12-03 04:37:38.433602', '5', 'đừng có tưởng bở', 3, '', 10, 1),
(35, '2022-12-03 04:39:46.692981', '4', 'Lập trình điện thoại', 1, '[{\"added\": {}}]', 7, 1),
(36, '2022-12-03 04:41:41.338388', '1', 'ImageCourseLess object (1)', 1, '[{\"added\": {}}]', 12, 1),
(37, '2022-12-03 04:42:18.757722', '2', 'ImageCourseLess object (2)', 1, '[{\"added\": {}}]', 12, 1),
(38, '2022-12-03 04:58:49.747466', '1', 'Sales', 1, '[{\"added\": {}}]', 3, 1),
(39, '2022-12-03 04:59:28.299712', '2', 'Update', 1, '[{\"added\": {}}]', 3, 1),
(40, '2022-12-03 05:00:33.591918', '2', 'updatebasic', 1, '[{\"added\": {}}]', 6, 1),
(41, '2022-12-03 05:07:02.670241', '1', 'VideoCourseLess object (1)', 1, '[{\"added\": {}}]', 11, 1),
(42, '2022-12-03 06:53:47.137880', '3', 'Lập trình NodeJs', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 8, 1),
(43, '2022-12-03 06:53:58.781315', '2', 'Blockchain cơ bản', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 8, 1),
(44, '2022-12-03 06:54:45.771670', '1', 'Lập trình hiện đại', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 8, 1),
(45, '2022-12-03 07:12:34.120477', '3', 'Lập trình NodeJs', 2, '[{\"changed\": {\"fields\": [\"Star\", \"Inventory\"]}}]', 8, 1),
(46, '2022-12-03 07:12:49.791377', '2', 'Blockchain cơ bản', 2, '[{\"changed\": {\"fields\": [\"Star\", \"Inventory\"]}}]', 8, 1),
(47, '2022-12-03 07:13:06.272847', '1', 'Lập trình hiện đại', 2, '[{\"changed\": {\"fields\": [\"Star\", \"Inventory\"]}}]', 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(6, 'core', 'user'),
(7, 'products', 'category'),
(8, 'products', 'course'),
(12, 'products', 'imagecourseless'),
(9, 'products', 'lesson'),
(10, 'products', 'tag'),
(13, 'products', 'variation'),
(11, 'products', 'videocourseless'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-12-02 08:42:45.379753'),
(2, 'contenttypes', '0002_remove_content_type_name', '2022-12-02 08:42:45.480753'),
(3, 'auth', '0001_initial', '2022-12-02 08:42:45.831191'),
(4, 'auth', '0002_alter_permission_name_max_length', '2022-12-02 08:42:45.902193'),
(5, 'auth', '0003_alter_user_email_max_length', '2022-12-02 08:42:45.912191'),
(6, 'auth', '0004_alter_user_username_opts', '2022-12-02 08:42:45.924197'),
(7, 'auth', '0005_alter_user_last_login_null', '2022-12-02 08:42:45.932190'),
(8, 'auth', '0006_require_contenttypes_0002', '2022-12-02 08:42:45.939192'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2022-12-02 08:42:45.948189'),
(10, 'auth', '0008_alter_user_username_max_length', '2022-12-02 08:42:45.958190'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2022-12-02 08:42:45.968193'),
(12, 'auth', '0010_alter_group_name_max_length', '2022-12-02 08:42:45.990192'),
(13, 'auth', '0011_update_proxy_permissions', '2022-12-02 08:42:46.002194'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2022-12-02 08:42:46.015190'),
(15, 'core', '0001_initial', '2022-12-02 08:42:46.401400'),
(16, 'admin', '0001_initial', '2022-12-02 08:42:46.578403'),
(17, 'admin', '0002_logentry_remove_auto_add', '2022-12-02 08:42:46.593404'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2022-12-02 08:42:46.608401'),
(19, 'sessions', '0001_initial', '2022-12-02 08:42:46.667403'),
(20, 'products', '0001_initial', '2022-12-02 09:21:53.502868'),
(21, 'core', '0002_alter_user_avatar', '2022-12-03 06:53:09.639312'),
(22, 'products', '0002_course_price', '2022-12-03 06:53:09.748309'),
(23, 'products', '0003_alter_course_price', '2022-12-03 06:55:35.183698'),
(24, 'products', '0004_alter_course_price_variation', '2022-12-03 07:00:54.845059'),
(25, 'products', '0005_remove_variation_inventory_course_inventory_and_more', '2022-12-03 07:10:54.417504'),
(26, 'products', '0006_alter_course_inventory_alter_course_star', '2022-12-03 07:13:41.317694');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('5trvhlj670ak258djxqilde6h3q3uuse', '.eJxVjEEOwiAQRe_C2pDCFFpcuvcMBGYGqRpISrsy3l1JutDte-__l_Bh37LfG69-IXEWSpx-WQz44NIF3UO5VYm1bOsSZU_kYZu8VuLn5Wj_DnJoua-tNpNiTZMFaxmcw9FpJsNp_lIEB444aa0iYABQaAaYxyFGRzZhEu8P2oY4EQ:1p12Li:iLzBZ51bHDQMj0USgMK5-9zaNrXD2jEB_pGs9dKZQNE', '2022-12-16 09:28:50.154582'),
('irpi0y3cn0lmv5kavv0e7lisqf6getjv', '.eJxVjEEOwiAQRe_C2pDCFFpcuvcMBGYGqRpISrsy3l1JutDte-__l_Bh37LfG69-IXEWSpx-WQz44NIF3UO5VYm1bOsSZU_kYZu8VuLn5Wj_DnJoua-tNpNiTZMFaxmcw9FpJsNp_lIEB444aa0iYABQaAaYxyFGRzZhEu8P2oY4EQ:1p1LDt:x0QKhjUw6hemDCvDQOmCXRuDoJrhhS9NUhOIwh651Vc', '2022-12-17 05:38:01.627436'),
('mbsel3auq4fze1r5xlesh5zbnrzaa8v9', '.eJxVjEEOwiAQRe_C2pDCFFpcuvcMBGYGqRpISrsy3l1JutDte-__l_Bh37LfG69-IXEWSpx-WQz44NIF3UO5VYm1bOsSZU_kYZu8VuLn5Wj_DnJoua-tNpNiTZMFaxmcw9FpJsNp_lIEB444aa0iYABQaAaYxyFGRzZhEu8P2oY4EQ:1p12X8:R5Bx9pisrw9aV-3JVGgqZcdQBUTgJtyG8kg3TyaFPpU', '2022-12-16 09:40:38.831610'),
('o4fhdtmyn04j1h2nlny45uzln18w2ecx', '.eJxVjEEOwiAQRe_C2pDCFFpcuvcMBGYGqRpISrsy3l1JutDte-__l_Bh37LfG69-IXEWSpx-WQz44NIF3UO5VYm1bOsSZU_kYZu8VuLn5Wj_DnJoua-tNpNiTZMFaxmcw9FpJsNp_lIEB444aa0iYABQaAaYxyFGRzZhEu8P2oY4EQ:1p1Mtp:_SzqcG28agegpzPYQWfdC9K7HT694ZFCV1UvTcfWe5Y', '2022-12-17 07:25:25.272495'),
('tyckvjr7jcguvwizd8x3j67wlhmr0re9', '.eJxVjEEOwiAQRe_C2pDCFFpcuvcMBGYGqRpISrsy3l1JutDte-__l_Bh37LfG69-IXEWSpx-WQz44NIF3UO5VYm1bOsSZU_kYZu8VuLn5Wj_DnJoua-tNpNiTZMFaxmcw9FpJsNp_lIEB444aa0iYABQaAaYxyFGRzZhEu8P2oY4EQ:1p12nt:FnhVVVNf5ah9OUtDtpxeCZKOcmMfAcGS1n-yKviEpKg', '2022-12-16 09:57:57.523606');

-- --------------------------------------------------------

--
-- Table structure for table `products_category`
--

CREATE TABLE `products_category` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `decription` longtext DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_category`
--

INSERT INTO `products_category` (`id`, `title`, `decription`, `slug`, `active`) VALUES
(1, 'Công cụ lập trình', '', 'cong-c-lp-trinh', 1),
(2, 'Blockchain', '', 'blockchain', 1),
(3, 'Lập trình web app', 'Lập trình web app', 'Lap-trinh-web-app', 1),
(4, 'Lập trình điện thoại', 'Hướng dẫn lập trình điện thoại', 'lp-trinh-djin-thoi', 1);

-- --------------------------------------------------------

--
-- Table structure for table `products_course`
--

CREATE TABLE `products_course` (
  `id` bigint(20) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `update_date` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `link_video` varchar(300) NOT NULL,
  `type` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `inventory` int(11) NOT NULL,
  `star` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_course`
--

INSERT INTO `products_course` (`id`, `subject`, `image`, `created_date`, `update_date`, `active`, `link_video`, `type`, `slug`, `description`, `category_id`, `price`, `inventory`, `star`) VALUES
(1, 'Lập trình hiện đại', 'itembase/2022/12/03/djangoRest.jpg', '2022-12-02 09:42:25.256915', '2022-12-03 07:13:06.269827', 1, 'https://www.youtube.com/watch?v=oFgg7K2tpfk', 1, 'lp-trinh-hin-dji-test-mu', '<p>C&ocirc;ng cụ lập tr&igrave;nh</p>', 1, 800000, 300, 7),
(2, 'Blockchain cơ bản', 'itembase/2022/12/03/blockchain.jpg', '2022-12-03 03:33:09.374929', '2022-12-03 07:12:49.789366', 1, 'https://www.youtube.com/watch?v=oFgg7K2tpfk', 1, 'blockchain-c-bn', '<p>Blocchain cơ bản</p>', 2, 700000, 200, 4),
(3, 'Lập trình NodeJs', 'itembase/2022/12/03/nodejs.jpg', '2022-12-03 04:33:17.365196', '2022-12-03 07:12:34.118474', 1, 'https://www.youtube.com/watch?v=oFgg7K2tpfk', 1, 'lp-trinh-nodejs', '<p><img alt=\"\" src=\"/media/editor/2022/12/03/blockchain1.jpg\" style=\"height:185px; width:300px\" /></p>\r\n\r\n<p>Lập tr&igrave;nh nodejs</p>', 3, 600000, 100, 5);

-- --------------------------------------------------------

--
-- Table structure for table `products_imagecourseless`
--

CREATE TABLE `products_imagecourseless` (
  `id` bigint(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  `lesson_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_imagecourseless`
--

INSERT INTO `products_imagecourseless` (`id`, `image`, `course_id`, `lesson_id`) VALUES
(1, 'itembase/2022/12/03/GraphQLRest.jpg', 1, 1),
(2, 'itembase/2022/12/03/nodejs_GRcj1Zb.jpg', 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products_lesson`
--

CREATE TABLE `products_lesson` (
  `id` bigint(20) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `update_date` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `link_video` varchar(300) NOT NULL,
  `type` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `course_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_lesson`
--

INSERT INTO `products_lesson` (`id`, `subject`, `image`, `created_date`, `update_date`, `active`, `link_video`, `type`, `slug`, `content`, `course_id`) VALUES
(1, 'Bài 1: Hướng dẫn tạo project django', 'itembase/2022/12/03/django.png', '2022-12-03 04:24:10.910834', '2022-12-03 04:24:10.910834', 1, 'https://www.youtube.com/watch?v=oFgg7K2tpfk', 1, 'bai-1-hng-dn-to-project-django', '<p><img alt=\"\" src=\"/media/editor/2022/12/03/django.png\" style=\"height:137px; width:300px\" /></p>\r\n\r\n<p>độc như con nồng nọc</p>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `products_lesson_tags`
--

CREATE TABLE `products_lesson_tags` (
  `id` bigint(20) NOT NULL,
  `lesson_id` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_lesson_tags`
--

INSERT INTO `products_lesson_tags` (`id`, `lesson_id`, `tag_id`) VALUES
(1, 1, 1),
(2, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `products_tag`
--

CREATE TABLE `products_tag` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_tag`
--

INSERT INTO `products_tag` (`id`, `name`, `slug`) VALUES
(1, 'django', 'django'),
(2, 'javascript', 'javascript'),
(3, 'python', 'python'),
(4, 'Công nghệ lập trình', 'cong-nghe-lap-trinh');

-- --------------------------------------------------------

--
-- Table structure for table `products_variation`
--

CREATE TABLE `products_variation` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `sale_price` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `discount_from_date` datetime(6) DEFAULT NULL,
  `discount_percentage` int(11) NOT NULL,
  `discount_to_date` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_variation`
--

INSERT INTO `products_variation` (`id`, `title`, `sale_price`, `active`, `product_id`, `discount_from_date`, `discount_percentage`, `discount_to_date`) VALUES
(1, 'Khuyến mãi mùa noel', 400000, 1, 1, '2022-12-23 00:00:00.000000', 10, '2022-12-24 00:00:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `products_videocourseless`
--

CREATE TABLE `products_videocourseless` (
  `id` bigint(20) NOT NULL,
  `video` varchar(200) NOT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  `lesson_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_videocourseless`
--

INSERT INTO `products_videocourseless` (`id`, `video`, `course_id`, `lesson_id`) VALUES
(1, 'https://www.youtube.com/watch?v=bWkUdsy8YGE&list=PLZEIt444jqpB1j3RD4BrYm9JmNVYuzVNm&index=42', 1, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `core_user`
--
ALTER TABLE `core_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `core_user_groups`
--
ALTER TABLE `core_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `core_user_groups_user_id_group_id_c82fcad1_uniq` (`user_id`,`group_id`),
  ADD KEY `core_user_groups_group_id_fe8c697f_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `core_user_user_permissions`
--
ALTER TABLE `core_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `core_user_user_permissions_user_id_permission_id_73ea0daa_uniq` (`user_id`,`permission_id`),
  ADD KEY `core_user_user_permi_permission_id_35ccf601_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `products_category`
--
ALTER TABLE `products_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `products_course`
--
ALTER TABLE `products_course`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `products_course_subject_category_id_892d650a_uniq` (`subject`,`category_id`),
  ADD KEY `products_course_category_id_13a7d20c_fk_products_category_id` (`category_id`);

--
-- Indexes for table `products_imagecourseless`
--
ALTER TABLE `products_imagecourseless`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_imagecourse_course_id_3efa94e0_fk_products_` (`course_id`),
  ADD KEY `products_imagecourse_lesson_id_b7c7acc5_fk_products_` (`lesson_id`);

--
-- Indexes for table `products_lesson`
--
ALTER TABLE `products_lesson`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `products_lesson_subject_course_id_d5186197_uniq` (`subject`,`course_id`),
  ADD KEY `products_lesson_course_id_7fc5ba04_fk_products_course_id` (`course_id`);

--
-- Indexes for table `products_lesson_tags`
--
ALTER TABLE `products_lesson_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_lesson_tags_lesson_id_tag_id_c2cbdef8_uniq` (`lesson_id`,`tag_id`),
  ADD KEY `products_lesson_tags_tag_id_3a9a7196_fk_products_tag_id` (`tag_id`);

--
-- Indexes for table `products_tag`
--
ALTER TABLE `products_tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `products_variation`
--
ALTER TABLE `products_variation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD KEY `products_variation_product_id_58e457dc_fk_products_course_id` (`product_id`);

--
-- Indexes for table `products_videocourseless`
--
ALTER TABLE `products_videocourseless`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_videocourse_course_id_14e226eb_fk_products_` (`course_id`),
  ADD KEY `products_videocourse_lesson_id_66fb7930_fk_products_` (`lesson_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `core_user`
--
ALTER TABLE `core_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `core_user_groups`
--
ALTER TABLE `core_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `core_user_user_permissions`
--
ALTER TABLE `core_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `products_category`
--
ALTER TABLE `products_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products_course`
--
ALTER TABLE `products_course`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products_imagecourseless`
--
ALTER TABLE `products_imagecourseless`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products_lesson`
--
ALTER TABLE `products_lesson`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products_lesson_tags`
--
ALTER TABLE `products_lesson_tags`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products_tag`
--
ALTER TABLE `products_tag`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products_variation`
--
ALTER TABLE `products_variation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products_videocourseless`
--
ALTER TABLE `products_videocourseless`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `core_user_groups`
--
ALTER TABLE `core_user_groups`
  ADD CONSTRAINT `core_user_groups_group_id_fe8c697f_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `core_user_groups_user_id_70b4d9b8_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`);

--
-- Constraints for table `core_user_user_permissions`
--
ALTER TABLE `core_user_user_permissions`
  ADD CONSTRAINT `core_user_user_permi_permission_id_35ccf601_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `core_user_user_permissions_user_id_085123d3_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`);

--
-- Constraints for table `products_course`
--
ALTER TABLE `products_course`
  ADD CONSTRAINT `products_course_category_id_13a7d20c_fk_products_category_id` FOREIGN KEY (`category_id`) REFERENCES `products_category` (`id`);

--
-- Constraints for table `products_imagecourseless`
--
ALTER TABLE `products_imagecourseless`
  ADD CONSTRAINT `products_imagecourse_course_id_3efa94e0_fk_products_` FOREIGN KEY (`course_id`) REFERENCES `products_course` (`id`),
  ADD CONSTRAINT `products_imagecourse_lesson_id_b7c7acc5_fk_products_` FOREIGN KEY (`lesson_id`) REFERENCES `products_lesson` (`id`);

--
-- Constraints for table `products_lesson`
--
ALTER TABLE `products_lesson`
  ADD CONSTRAINT `products_lesson_course_id_7fc5ba04_fk_products_course_id` FOREIGN KEY (`course_id`) REFERENCES `products_course` (`id`);

--
-- Constraints for table `products_lesson_tags`
--
ALTER TABLE `products_lesson_tags`
  ADD CONSTRAINT `products_lesson_tags_lesson_id_339d8990_fk_products_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `products_lesson` (`id`),
  ADD CONSTRAINT `products_lesson_tags_tag_id_3a9a7196_fk_products_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `products_tag` (`id`);

--
-- Constraints for table `products_variation`
--
ALTER TABLE `products_variation`
  ADD CONSTRAINT `products_variation_product_id_58e457dc_fk_products_course_id` FOREIGN KEY (`product_id`) REFERENCES `products_course` (`id`);

--
-- Constraints for table `products_videocourseless`
--
ALTER TABLE `products_videocourseless`
  ADD CONSTRAINT `products_videocourse_course_id_14e226eb_fk_products_` FOREIGN KEY (`course_id`) REFERENCES `products_course` (`id`),
  ADD CONSTRAINT `products_videocourse_lesson_id_66fb7930_fk_products_` FOREIGN KEY (`lesson_id`) REFERENCES `products_lesson` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
