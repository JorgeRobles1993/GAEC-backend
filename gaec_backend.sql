-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 23, 2024 at 07:08 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gaec_backend`
--

-- --------------------------------------------------------

--
-- Table structure for table `actualites`
--

CREATE TABLE `actualites` (
  `id` bigint UNSIGNED NOT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `actualites`
--

INSERT INTO `actualites` (`id`, `titre`, `content`, `image`, `slug`, `created_at`, `updated_at`) VALUES
(2, 'Minima voluptatem quod repellat in necessitatibus maxime modi.', 'Construction de un batiment fotovoltaique', 'https://via.placeholder.com/640x480.png/0011ee?text=technics+culpa', 'quia-omnis-fuga-qui-quisquam-sapiente-repellendus-laboriosam', '2024-09-19 10:41:40', '2024-09-19 10:41:40'),
(3, 'Aut rerum sint accusamus maiores quidem nihil.', 'Aut et provident minus omnis. Quia magni ea quis sed repellat ut expedita nemo. Eum adipisci laboriosam dolor in dolor. Aspernatur delectus dolor ut doloribus placeat.', 'https://via.placeholder.com/640x480.png/009933?text=technics+est', 'sed-illum-blanditiis-voluptas-labore-eaque-sit', '2024-09-19 10:41:40', '2024-09-19 10:41:40'),
(4, 'Ab quisquam ducimus porro vitae aut.', 'Rerum eum quibusdam itaque ea cumque saepe enim. Ut adipisci id facilis fugiat enim veniam. Unde amet in unde molestiae nostrum.', 'https://via.placeholder.com/640x480.png/0022ff?text=technics+voluptas', 'cupiditate-omnis-sit-praesentium-voluptas', '2024-09-19 10:41:40', '2024-09-19 10:41:40'),
(5, 'Voluptatem veniam consequatur facere omnis beatae quia sint ut.', 'Placeat aut reiciendis totam modi voluptas ad itaque. Saepe doloremque aperiam recusandae assumenda occaecati dicta modi. In vel molestiae harum culpa eum.', 'https://via.placeholder.com/640x480.png/004477?text=technics+nobis', 'consectetur-nobis-dignissimos-itaque-dolorum-sint-eos-laboriosam', '2024-09-19 10:41:40', '2024-09-19 10:41:40'),
(6, 'Consectetur autem illo dolor totam pariatur.', 'In iste accusantium nisi ut et iusto. Debitis nemo ullam a ut consequatur. Laborum ipsam hic beatae. Totam ut quasi quisquam.', 'https://via.placeholder.com/640x480.png/00eeaa?text=technics+praesentium', 'dolorem-dolorem-et-aut-temporibus-ullam-aliquid-non-temporibus', '2024-09-19 10:41:40', '2024-09-19 10:41:40'),
(7, 'Voluptatum laboriosam rem est aut.', 'Delectus exercitationem laudantium consequuntur quae. Dolorem omnis impedit sequi. Ipsum aut occaecati saepe sunt impedit est minus.', 'https://via.placeholder.com/640x480.png/004444?text=technics+aut', 'veritatis-non-odio-praesentium-voluptatum-sequi-et-soluta', '2024-09-19 10:41:40', '2024-09-19 10:41:40'),
(8, 'Quia voluptas explicabo qui debitis voluptatem molestiae reprehenderit.', 'Officiis consectetur nostrum veritatis error dolorem dolores. Quasi autem laboriosam rerum velit. Doloremque voluptas ad aut quaerat.', 'https://via.placeholder.com/640x480.png/0099dd?text=technics+non', 'beatae-corporis-voluptatum-nisi-est-ipsam', '2024-09-19 10:41:40', '2024-09-19 10:41:40'),
(9, 'Odit consequuntur eligendi voluptate et similique deserunt tenetur praesentium.', 'Voluptatem velit ab illum aut dignissimos voluptatem enim. Nulla harum quaerat laborum voluptatum quia. Est veritatis exercitationem qui unde odio accusantium.', 'https://via.placeholder.com/640x480.png/005544?text=technics+nobis', 'qui-suscipit-ut-nobis-rerum-quia-accusantium-consequuntur', '2024-09-19 10:41:40', '2024-09-19 10:41:40'),
(11, 'Sit qui ut accusamus perferendis ipsum maxime odit.', 'Consequatur architecto amet totam. Ut reprehenderit laborum veniam. Cum laborum qui rerum ea veritatis libero voluptatem.', 'https://via.placeholder.com/640x480.png/00bb00?text=technics+at', 'et-est-sunt-eum-explicabo-et-animi-at', '2024-09-19 10:41:40', '2024-09-19 10:41:40');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_09_06_142741_create_personal_access_tokens_table', 1),
(5, '2024_09_19_090608_add_telefono_and_rol_to_users_table', 1),
(6, '2024_09_19_121240_create_actualites_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'token-name', '0395b42f70ad7476d6ed356ed13ee306d7be2a8330631e8318f143beb38af51a', '[\"*\"]', '2024-09-19 12:28:05', NULL, '2024-09-19 12:03:45', '2024-09-19 12:28:05'),
(2, 'App\\Models\\User', 1, 'token-name', '128eaaf1367b94779b1fc6a82e47143e98a41b0d554600e1ac1c7452b97adba2', '[\"*\"]', NULL, NULL, '2024-09-20 06:18:43', '2024-09-20 06:18:43'),
(3, 'App\\Models\\User', 1, 'token-name', 'b9633348ddd708bcb0ca4a6a1343ccde8b16451e12f4e7cd5d0f906849c24a08', '[\"*\"]', NULL, NULL, '2024-09-20 06:27:34', '2024-09-20 06:27:34'),
(4, 'App\\Models\\User', 1, 'token-name', '99a51fd57a24a9cb60ca0b0d1b2b79937797e40e53d8c8645bd11957e8894f3a', '[\"*\"]', NULL, NULL, '2024-09-20 06:27:42', '2024-09-20 06:27:42'),
(5, 'App\\Models\\User', 1, 'token-name', 'f130e0b4b7b6a9f020ce032922fe5c58aaefad58080d2c1d00b2236f3146f0f2', '[\"*\"]', NULL, NULL, '2024-09-20 06:27:43', '2024-09-20 06:27:43'),
(6, 'App\\Models\\User', 1, 'token-name', 'cdba36cce2afce433fbe02bf586e7117a4b6043135949270d19191e7314629b0', '[\"*\"]', NULL, NULL, '2024-09-20 06:27:44', '2024-09-20 06:27:44'),
(7, 'App\\Models\\User', 1, 'token-name', 'e35221356bc2c368446d1ac4af24f454e1ba53d325e3fcde4dc2ed93cc3d8893', '[\"*\"]', NULL, NULL, '2024-09-20 06:27:44', '2024-09-20 06:27:44'),
(8, 'App\\Models\\User', 1, 'token-name', '8a69492b7bac192dd9f711a427d8fe3d6608dfe679a24396507e11c1a9629c27', '[\"*\"]', NULL, NULL, '2024-09-20 06:27:45', '2024-09-20 06:27:45'),
(9, 'App\\Models\\User', 1, 'token-name', 'ac15db9cd58f8d65119c1a668acbe9058f5fd7bc14cfa594f7fa879f91c83bfd', '[\"*\"]', NULL, NULL, '2024-09-20 06:32:41', '2024-09-20 06:32:41'),
(10, 'App\\Models\\User', 1, 'token-name', 'c01e2fc6d477d1627eafeb03d42c5f7b05618c9b08f60d91251d3f9082390d77', '[\"*\"]', NULL, NULL, '2024-09-20 06:32:43', '2024-09-20 06:32:43'),
(11, 'App\\Models\\User', 1, 'token-name', '8f9883d36bd2441ea8ee432e108c2fb56d4160f63e48dd2f1204eb767fe8ff9e', '[\"*\"]', NULL, NULL, '2024-09-20 06:32:44', '2024-09-20 06:32:44'),
(12, 'App\\Models\\User', 1, 'token-name', '55e3cb3657669bab433e7beda53e81dbdaafdd0f2eff4a8101b00bb97c541c9a', '[\"*\"]', NULL, NULL, '2024-09-20 06:33:10', '2024-09-20 06:33:10'),
(13, 'App\\Models\\User', 1, 'token-name', 'd5d40596caaeb3b822f634a0b2249322e2ad3ec850dfe856ad84277de4f694ef', '[\"*\"]', NULL, NULL, '2024-09-20 06:33:12', '2024-09-20 06:33:12'),
(14, 'App\\Models\\User', 1, 'token-name', '1ba1de7987f9267caf6417c87743c317ad955338ba9d43cd54bb758d6526633e', '[\"*\"]', NULL, NULL, '2024-09-20 06:33:13', '2024-09-20 06:33:13'),
(15, 'App\\Models\\User', 1, 'token-name', 'a74a08c9c99a95abc3717c4840aebcf503c84be2bd04b746554fc7e81ddffb4b', '[\"*\"]', NULL, NULL, '2024-09-20 06:33:13', '2024-09-20 06:33:13'),
(16, 'App\\Models\\User', 1, 'token-name', 'e2d65b2925486bb74451c1917901906e45f7e9c5e461642f78d394c9808dd4e8', '[\"*\"]', NULL, NULL, '2024-09-20 06:33:14', '2024-09-20 06:33:14'),
(17, 'App\\Models\\User', 1, 'token-name', '83d2fa7e56b98ebb11f2310a15ed5631997f04d9a8878478f32b74078e19c3bb', '[\"*\"]', NULL, NULL, '2024-09-20 06:33:17', '2024-09-20 06:33:17'),
(18, 'App\\Models\\User', 1, 'token-name', 'e07468d6d342a71580fe58983c3e648252e29cc163591cd04809736bd58fe1d1', '[\"*\"]', NULL, NULL, '2024-09-20 06:33:20', '2024-09-20 06:33:20'),
(19, 'App\\Models\\User', 1, 'token-name', '2f72cfe1d00bd190acdfde092a2879141afecbe253df0e64fd36d5cdb7c8341d', '[\"*\"]', NULL, NULL, '2024-09-20 06:33:21', '2024-09-20 06:33:21'),
(20, 'App\\Models\\User', 1, 'token-name', 'be476d03cb0715e45ddbb14b33e332e9ffbddb877121f1ea72e69da9e37b4604', '[\"*\"]', NULL, NULL, '2024-09-20 06:33:23', '2024-09-20 06:33:23'),
(21, 'App\\Models\\User', 1, 'token-name', '8ee9f5bbc300fd1d09f5e0d911ec858efd4d7a1e4e61b40302644f9f8cba3a28', '[\"*\"]', NULL, NULL, '2024-09-20 06:33:24', '2024-09-20 06:33:24'),
(22, 'App\\Models\\User', 1, 'token-name', 'e01c9b403df8ff52b4410f1666f8a8fb2932bda0638410d7edee672a3176b5cd', '[\"*\"]', NULL, NULL, '2024-09-20 06:33:26', '2024-09-20 06:33:26'),
(23, 'App\\Models\\User', 1, 'token-name', '46247215f405e7e002ec29a929b774ee3e68cde16619a91a6360221d004d4090', '[\"*\"]', NULL, NULL, '2024-09-20 06:33:27', '2024-09-20 06:33:27'),
(24, 'App\\Models\\User', 1, 'token-name', 'a52c4901596505614b10113cf60c2798d0465654b0aafe9bb80e54f160185e78', '[\"*\"]', NULL, NULL, '2024-09-20 06:33:29', '2024-09-20 06:33:29'),
(25, 'App\\Models\\User', 1, 'token-name', '9bb03b57ac2a376ccfa7c92eb414cc03b802f7afc12f0ef6319e1d527812267d', '[\"*\"]', NULL, NULL, '2024-09-20 06:40:45', '2024-09-20 06:40:45'),
(26, 'App\\Models\\User', 1, 'token-name', '1c9558afbd33fe2f46ecae883c350563c84b8ce31b4bceac5393d5c558628deb', '[\"*\"]', NULL, NULL, '2024-09-20 06:40:46', '2024-09-20 06:40:46'),
(27, 'App\\Models\\User', 1, 'token-name', 'ddfc78cf6a2eb71cc924b7f5d66ddfa660f7b0890b13f423f4b9a8d84cc4c16a', '[\"*\"]', NULL, NULL, '2024-09-20 06:51:31', '2024-09-20 06:51:31'),
(28, 'App\\Models\\User', 1, 'token-name', 'e8c358fc297cc1cb4b6bc2adeaacb1a6d347ed394c59a0d23dcd0379b0b620bb', '[\"*\"]', NULL, NULL, '2024-09-20 06:52:40', '2024-09-20 06:52:40'),
(29, 'App\\Models\\User', 1, 'token-name', '6d320b0f91e5180ecfc92e5e51b8114e8e6d002996d4de5bd09a58b03c10f89c', '[\"*\"]', NULL, NULL, '2024-09-20 07:12:30', '2024-09-20 07:12:30'),
(30, 'App\\Models\\User', 1, 'token-name', '7feeae5c8c9c4ba0e87e39ed022244f13b90a004fde535557a2e270f11c5e800', '[\"*\"]', NULL, NULL, '2024-09-20 07:15:03', '2024-09-20 07:15:03'),
(31, 'App\\Models\\User', 1, 'token-name', '2bf304fbe435dd41455729ec05589396898fef4c01f98a2ac8fa24247584efde', '[\"*\"]', NULL, NULL, '2024-09-20 07:15:18', '2024-09-20 07:15:18'),
(32, 'App\\Models\\User', 1, 'token-name', 'c1fde6081f8a8a1efb34706a048719a16b8449aff14fcc5db0182791150141fa', '[\"*\"]', NULL, NULL, '2024-09-20 07:18:18', '2024-09-20 07:18:18'),
(33, 'App\\Models\\User', 1, 'token-name', '850d5c537928febd6cece80003adf1cfe057c4630123a7b7ecb68fe31ec772ae', '[\"*\"]', NULL, NULL, '2024-09-20 07:22:12', '2024-09-20 07:22:12'),
(34, 'App\\Models\\User', 1, 'token-name', 'e5ad31c7eaf69bfbe4ec8a5eeb9c08107812276a50bb032587a2b46c9dc6bb48', '[\"*\"]', NULL, NULL, '2024-09-20 09:16:22', '2024-09-20 09:16:22'),
(35, 'App\\Models\\User', 1, 'token-name', '9b94bff0089c3b659f0afb8100aba3ce11a61406cdd620cd4abd9b4f67b56b14', '[\"*\"]', NULL, NULL, '2024-09-20 09:16:24', '2024-09-20 09:16:24'),
(36, 'App\\Models\\User', 1, 'token-name', '0580a13274cff79443adeceac7dc40887477ba39804107c58ebb8ca83c0e25eb', '[\"*\"]', '2024-09-20 09:55:55', NULL, '2024-09-20 09:33:15', '2024-09-20 09:55:55'),
(37, 'App\\Models\\User', 2, 'token-name', '3c0ceda1a3803631d5c65d482b2e1dc9629e6f73e1e5025a14fd1b4b566f6980', '[\"*\"]', NULL, NULL, '2024-09-20 10:00:22', '2024-09-20 10:00:22'),
(38, 'App\\Models\\User', 2, 'token-name', 'd51b7fefaa2acd5bf23c690e4ad1ade1b151acbc7af982242e9624df123f1fcc', '[\"*\"]', '2024-09-20 10:13:19', NULL, '2024-09-20 10:00:23', '2024-09-20 10:13:19'),
(39, 'App\\Models\\User', 1, 'token-name', '9cd16ff3bcb529871eb7c81bc5dd440787cc72f16bf49cab6ee97ee4ec48a76e', '[\"*\"]', '2024-09-20 10:37:01', NULL, '2024-09-20 10:37:00', '2024-09-20 10:37:01'),
(40, 'App\\Models\\User', 1, 'token-name', 'b6b54abf0d52aa743f6aee842392de65d6449ca1891c911e7c6b8b3b6bf042e9', '[\"*\"]', NULL, NULL, '2024-09-20 10:37:01', '2024-09-20 10:37:01'),
(41, 'App\\Models\\User', 1, 'token-name', '43b36cbec0afcae9e421d9b41287b6efd7534cb0c213bc65f1880dfc81311800', '[\"*\"]', '2024-09-20 10:38:30', NULL, '2024-09-20 10:38:29', '2024-09-20 10:38:30'),
(42, 'App\\Models\\User', 1, 'token-name', '2be64e2680797765b627b0cae64c404f40d37132417e0da66f3922f0bbf325a0', '[\"*\"]', NULL, NULL, '2024-09-20 10:38:30', '2024-09-20 10:38:30'),
(43, 'App\\Models\\User', 1, 'token-name', 'a94f753d574a46f14ccc8f9a889279cb92cd588ca589a8b2eab4d24ff96e4c4a', '[\"*\"]', '2024-09-20 10:39:07', NULL, '2024-09-20 10:38:31', '2024-09-20 10:39:07'),
(44, 'App\\Models\\User', 1, 'token-name', '6f12a88072bd35cc6967cf8425e10a5c969e315eee09d9e2618249d9185c43e3', '[\"*\"]', '2024-09-20 10:40:41', NULL, '2024-09-20 10:39:44', '2024-09-20 10:40:41'),
(45, 'App\\Models\\User', 1, 'token-name', '1c5fa17c29cdc21e9f01a279a64d55df0a239bc5fa81deceaf646dfe5bb75ad3', '[\"*\"]', '2024-09-20 10:48:53', NULL, '2024-09-20 10:41:37', '2024-09-20 10:48:53'),
(46, 'App\\Models\\User', 1, 'token-name', 'a5add643d72eb1f8376a0b42847611a941b0db8e9cf05b240bbe4dba66ec6f04', '[\"*\"]', '2024-09-20 10:49:03', NULL, '2024-09-20 10:49:02', '2024-09-20 10:49:03'),
(47, 'App\\Models\\User', 1, 'token-name', '7613631cb640a80e7857b118c1942123a86667cf4a8a7f562cff47c03e4d50b5', '[\"*\"]', NULL, NULL, '2024-09-20 10:49:03', '2024-09-20 10:49:03'),
(48, 'App\\Models\\User', 1, 'token-name', 'c674e5cfd93d88ba606349f5ecab8090d20ea01c907a690f8c4842c227bd2375', '[\"*\"]', '2024-09-20 10:53:16', NULL, '2024-09-20 10:50:14', '2024-09-20 10:53:16'),
(49, 'App\\Models\\User', 1, 'token-name', 'c864ae4d57185bf1c2a29e49702a002d111242a17c8d3432857cd70c927fa333', '[\"*\"]', '2024-09-20 10:53:24', NULL, '2024-09-20 10:53:23', '2024-09-20 10:53:24'),
(50, 'App\\Models\\User', 1, 'token-name', '50c5b1780d8d866cafa6088997d0c794ac569527cb1cb54b6a7d1c96481188fc', '[\"*\"]', '2024-09-23 05:07:45', NULL, '2024-09-20 11:28:36', '2024-09-23 05:07:45');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('usAC9xU61P6dNRgtG99CQdA4KMu7YsXnTLU6Cyud', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieGNKR05MUTJBRzJUcElJb2xMMndPSzI5MlM5YVNqQkltU05ldmxVRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1726838711),
('VOAW1yATyc7BSMkm89rCbb6LwS5zBC5onSrnwLn4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSkY0RnRtQ0plTUFNakE2aXQ4M0dXVkZXcVRONUVtY3NVcHBpSHltMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1726838915);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rol` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `telefono`, `rol`) VALUES
(1, 'Jorge', 'jorge@example.com', '2024-09-19 07:21:08', '$2y$12$LCqgSGysWWMRI8NVXAlZ5.LF60oejwbVSM.EqT9vopy4g2KQD8xTu', 'doepIcF2JL', '2024-09-19 07:21:08', '2024-09-19 07:21:08', '123-456-7890', 'admin'),
(2, 'Jodie Hintz', 'susan43@example.net', '2024-09-19 07:21:08', '$2y$12$fSzVDuQFXBRKxz7BCb5LLuNt49xaVWtvDRVqhzFqfEs9Cdee9WYUC', 'c4zQtowEY2', '2024-09-19 07:21:11', '2024-09-19 07:21:11', '(786) 335-7503', 'user'),
(3, 'Dr. Kacey Steuber', 'lyric15@example.net', '2024-09-19 07:21:08', '$2y$12$sa8bBfcdPsFBxKbyAYuWseOFUnOBo6HkDFB2bd1a4iyJt8k9khpPW', 'UBhTWzDS1s', '2024-09-19 07:21:11', '2024-09-19 07:21:11', '+1-501-544-8430', 'user'),
(4, 'Dr. Enola Wolf V', 'dejuan43@example.org', '2024-09-19 07:21:08', '$2y$12$1pKe/QzyR3O4N/vqm/dMMO8WdxUfKoFbquCoANOeCd.3rL0hy05S.', '9OVsMwYBlE', '2024-09-19 07:21:11', '2024-09-19 07:21:11', '+1.217.665.7437', 'user'),
(5, 'Ayana Bergnaum', 'gleichner.casey@example.com', '2024-09-19 07:21:08', '$2y$12$avJLdp.8YUL3266SSToYOe0Ey.1lwQ6tVhvhAuvy.gUqc48Y5yF.q', 'UVUtA36BMW', '2024-09-19 07:21:11', '2024-09-19 07:21:11', '1-478-792-2986', 'user'),
(6, 'Heber Rath', 'ofelia33@example.com', '2024-09-19 07:21:09', '$2y$12$PCPlh.j4EM4Sflg6dvzyxOUSV/CTNuUEQvpI.Y.VnE/LEon7q0yiS', '2jKyy8jFHM', '2024-09-19 07:21:11', '2024-09-19 07:21:11', '+1.272.907.6707', 'user'),
(7, 'Karianne Bernier', 'awilkinson@example.net', '2024-09-19 07:21:09', '$2y$12$U3okR7AvQeAPJfJYauBIfuMLT.Qmi9cUd6s6fJal4t2Hrb5dbugD6', 'tjv8ORYXlO', '2024-09-19 07:21:11', '2024-09-19 07:21:11', '+1.256.225.8749', 'user'),
(8, 'Mr. Floyd Powlowski MD', 'tmccullough@example.org', '2024-09-19 07:21:09', '$2y$12$gOZyrY5gO9Bdq3ztK4CDoOAFulMnzUmH9Z0v5I8DvHzAxd4s7mj/i', 'gp9Qsh8mBy', '2024-09-19 07:21:11', '2024-09-19 07:21:11', '(334) 729-7299', 'user'),
(9, 'Ms. Aliyah Boyer', 'rosemary.nicolas@example.org', '2024-09-19 07:21:09', '$2y$12$y/Z5hnVA0/l4nItN.g3Gu.C9ITW.0XMWFRJ5EwQ0.bUfzl7R3Lq1.', 'jLPu1BQ36a', '2024-09-19 07:21:11', '2024-09-19 07:21:11', '+1 (559) 603-9939', 'user'),
(10, 'Madaline Leannon', 'fhammes@example.com', '2024-09-19 07:21:09', '$2y$12$Pc/ED8S38..m.67t0.zWQe5fX85E.PF9GFyX9Uru2IHapCPeekwHi', 'JdVj2bHYMT', '2024-09-19 07:21:11', '2024-09-19 07:21:11', '+1-860-578-8432', 'user'),
(11, 'Maxime Rath', 'zdach@example.com', '2024-09-19 07:21:10', '$2y$12$jqGfgSCUGkLt6fc8kOnld.z1ZymsWdC/OxDZ3Ay6xHCA77YUlrMN.', 'z6qx3KATfH', '2024-09-19 07:21:11', '2024-09-19 07:21:11', '+1-845-472-5865', 'user'),
(12, 'Meggie Renner', 'nzboncak@example.org', '2024-09-19 07:21:10', '$2y$12$xARKYE6AupI5b7YEAiTfm.uyLZqLgMq6/NgnJ9BGCYznW/wTTvQEq', 'jXnSZxVS3M', '2024-09-19 07:21:11', '2024-09-19 07:21:11', '845.339.8397', 'user'),
(13, 'Brielle Botsford IV', 'antonette52@example.com', '2024-09-19 07:21:10', '$2y$12$WIkojzFW4ZG5IXKUPMrLcuLMZO71c0bcVgnQhPr/DIMOHx/6JERt2', '4zpjAWsJCO', '2024-09-19 07:21:11', '2024-09-19 07:21:11', '1-651-352-5563', 'user'),
(14, 'Aric Hickle', 'hailey.stoltenberg@example.com', '2024-09-19 07:21:10', '$2y$12$l47yWPG6R/OzINsG/2Jrg.0GsM2GQxsHDKRFfy98dSlurne2pCJC2', 's2NoDOLD3L', '2024-09-19 07:21:11', '2024-09-19 07:21:11', '+16618681062', 'user'),
(15, 'Damion Dickinson', 'irving75@example.net', '2024-09-19 07:21:10', '$2y$12$4Irn7vl2ZRGmyDQU8A4ZVOnFrG4riozFgE6OHGtEXS1rZIejLoMRO', 'FYSTeZz8TJ', '2024-09-19 07:21:11', '2024-09-19 07:21:11', '+1-641-867-0329', 'user'),
(16, 'Billy Buckridge', 'vhills@example.org', '2024-09-19 07:21:10', '$2y$12$TmD7iGZiCyGmEdkGvsZvLuskQQR9BJFO2Ix38jgbYLkb.wzYpUubG', 'MKIYRv3IN6', '2024-09-19 07:21:11', '2024-09-19 07:21:11', '575-815-6409', 'user'),
(17, 'Dr. Bernardo Turcotte', 'julia75@example.net', '2024-09-19 07:21:11', '$2y$12$tJ4CUudWD1SXSVGuLz1D5.t/lqBPrP86QdZDFNc1WHmmHTMLvxP0K', 'tqDmGRM28G', '2024-09-19 07:21:11', '2024-09-19 07:21:11', '+1.628.540.9600', 'user'),
(18, 'Margaretta Graham', 'ohegmann@example.org', '2024-09-19 07:21:11', '$2y$12$LixzErPLFUPse5QC0FuBH.NVedoBEh0rDeNiJKY6dLtMFDi/FvD8u', 'pEf3A0dJDY', '2024-09-19 07:21:11', '2024-09-19 07:21:11', '754.385.0782', 'user'),
(21, 'Ana Actualizada', 'ana.updated@example.com', NULL, '$2y$12$AF9G4xuc6VxgsrGVeqSrb.R9NoSy2NOfA.hzv.U/9.Xt2RS5NzrWe', NULL, '2024-09-19 07:44:37', '2024-09-19 09:53:48', NULL, 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actualites`
--
ALTER TABLE `actualites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `actualites_slug_unique` (`slug`);

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
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

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
-- AUTO_INCREMENT for table `actualites`
--
ALTER TABLE `actualites`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
