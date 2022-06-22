-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jun 15, 2021 at 05:23 PM
-- Server version: 5.7.32
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `db_pdam`
--

-- --------------------------------------------------------

--
-- Table structure for table `debit_air`
--

CREATE TABLE `debit_air` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `bulan` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `debit_air` int(11) NOT NULL,
  `keasaman` int(11) DEFAULT NULL,
  `ket` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `debit_air`
--

INSERT INTO `debit_air` (`id`, `user_id`, `bulan`, `debit_air`, `keasaman`, `ket`, `created_at`, `updated_at`) VALUES
(1, 15, '', 5, 5, NULL, '2021-06-14 07:41:33', '2021-06-14 07:41:33'),
(2, 17, '', 2, 2, NULL, '2021-06-14 07:44:21', '2021-06-14 07:44:21'),
(3, 17, '', 7, 7, NULL, '2021-06-14 07:45:40', '2021-06-14 07:45:40'),
(4, 16, '', 55, 666, '66', '2021-06-14 07:47:56', '2021-06-14 07:47:56'),
(5, 249, 'Januari', 22, 232, NULL, '2021-06-14 08:41:19', '2021-06-14 08:41:19'),
(6, 249, 'Januari', 1, NULL, NULL, '2021-06-15 07:23:10', '2021-06-15 07:23:10'),
(7, 249, 'Februari', 11, 1, '1', '2021-06-15 07:24:30', '2021-06-15 07:24:30'),
(8, 249, 'Maret', 9, NULL, NULL, '2021-06-15 07:25:08', '2021-06-15 07:25:08');

--
-- Triggers `debit_air`
--
DELIMITER $$
CREATE TRIGGER `tambah_debit` AFTER INSERT ON `debit_air` FOR EACH ROW BEGIN
UPDATE users SET debit_air=debit_air+NEW.debit_air
WHERE id=NEW.user_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_05_29_060317_create_tranksaksi', 1),
(5, '2021_06_11_084321_create_debit_air_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tranksaksi`
--

CREATE TABLE `tranksaksi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `bulan` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `in_debit` int(11) NOT NULL,
  `keasaman` int(11) NOT NULL,
  `belum_lunas` int(11) NOT NULL,
  `sudah_dibayar` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nik` int(50) DEFAULT NULL,
  `kk` int(50) DEFAULT NULL,
  `tem_lahir` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_lahir` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uk_meter` int(11) DEFAULT NULL,
  `debit_air` int(15) DEFAULT NULL,
  `hrg` int(50) DEFAULT NULL,
  `belum_bayar` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `name`, `email`, `email_verified_at`, `password`, `nik`, `kk`, `tem_lahir`, `tgl_lahir`, `alamat`, `uk_meter`, `debit_air`, `hrg`, `belum_bayar`, `remember_token`, `created_at`, `updated_at`) VALUES
(15, 'pelanggan', 'pelanggan 29339', 'pelanggan29339@gmail.com', NULL, '$2y$10$KK9TvSJiFaIrj8H9dihOLuykflWon0RDgQrZEma.Zm5GtdoWG12e2', 29339, 29339, 'Test Place', NULL, 'Jl. No 29339', NULL, 29339, 29339, 'belum', '', '2021-06-09 19:58:51', '2021-06-11 21:28:32'),
(16, 'pelanggan', 'pelanggan 43800', 'pelanggan43800@gmail.com', NULL, '$2y$10$eXoRAyFG7TdAw5lS.42eqOxq8xnEgXzfpvTdqAsnvl6.U99kglXfe', 43800, 43800, 'Test Place', '22-05-1990', 'Jl. No 43800', NULL, 43800, 43800, 'belum', '', '2021-06-09 19:58:51', '2021-06-09 19:58:51'),
(17, 'pelanggan', 'pelanggan 98333', 'pelanggan98333@gmail.com', NULL, '$2y$10$oLbopT/5q25q94q7NYjRgONb9oNfuw3PrWGTIKBBaH5cw7QrX4ywS', 98333, 98333, 'Test Place', '22-05-1990', 'Jl. No 98333', NULL, 98333, 98333, 'belum', '', '2021-06-09 19:58:51', '2021-06-09 19:58:51'),
(18, 'pelanggan', 'pelanggan 31210', 'pelanggan31210@gmail.com', NULL, '$2y$10$I9dHyqByU7dJKkI6YDFHv.qIGFHs7eQ15UgGQg.K67r0Oi1B.9ZVW', 31210, 31210, 'Test Place', '22-05-1990', 'Jl. No 31210', NULL, 31210, 31210, 'belum', '', '2021-06-09 19:58:51', '2021-06-09 19:58:51'),
(19, 'pelanggan', 'pelanggan 41755', 'pelanggan41755@gmail.com', NULL, '$2y$10$07ru5ao0BUJESaBSH8tk..gweU4WIxJbGtiHFWSqx5ICKORz82fDO', 41755, 41755, 'Test Place', '22-05-1990', 'Jl. No 41755', NULL, 41755, 41755, 'belum', '', '2021-06-09 19:58:51', '2021-06-09 19:58:51'),
(20, 'pelanggan', 'pelanggan 86328', 'pelanggan86328@gmail.com', NULL, '$2y$10$0EtKTGQps1mWuMast9iLCeQUfcmRJ/EcSqT5zRJTEhvyTBMkBKrY.', 86328, 86328, 'Test Place', '22-05-1990', 'Jl. No 86328', NULL, 86328, 86328, 'belum', '', '2021-06-09 19:58:51', '2021-06-09 19:58:51'),
(21, 'pelanggan', 'pelanggan 34079', 'pelanggan34079@gmail.com', NULL, '$2y$10$7FRiPDq3f2vkLetIwgHbheNeXKY5ndfwpOJHx0kq9G7x2Mvob1AL2', 34079, 34079, 'Test Place', '22-05-1990', 'Jl. No 34079', NULL, 34079, 34079, 'belum', '', '2021-06-09 19:58:51', '2021-06-09 19:58:51'),
(22, 'pelanggan', 'pelanggan 43002', 'pelanggan43002@gmail.com', NULL, '$2y$10$1ctHA1onN02vDwYgPULi6eb5cUBFeruIo808iSJ7owY0XIOSLc9fW', 43002, 43002, 'Test Place', '22-05-1990', 'Jl. No 43002', NULL, 43002, 43002, 'belum', '', '2021-06-09 19:58:51', '2021-06-09 19:58:51'),
(23, 'pelanggan', 'pelanggan 27992', 'pelanggan27992@gmail.com', NULL, '$2y$10$IfllGNkr3qx0T8P.K0FLP.CWBv9ePdf5GalcbK/lxdMWZiiXXhWzC', 27992, 27992, 'Test Place', '22-05-1990', 'Jl. No 27992', NULL, 27992, 27992, 'belum', '', '2021-06-09 19:58:51', '2021-06-09 19:58:51'),
(24, 'pelanggan', 'pelanggan 51256', 'pelanggan51256@gmail.com', NULL, '$2y$10$8WoYXyegfUgznrwPkWSgnu3CANWokajE4Yc9E3lq/m3yRtWMaTSVa', 51256, 51256, 'Test Place', '22-05-1990', 'Jl. No 51256', NULL, 51256, 51256, 'belum', '', '2021-06-09 19:58:52', '2021-06-09 19:58:52'),
(25, 'pelanggan', 'pelanggan 60488', 'pelanggan60488@gmail.com', NULL, '$2y$10$arZzl1QYPlOhHQDw1kCuUezxA3sJIFSIUs05VjCZ5ETXoR9ODrcNO', 60488, 60488, 'Test Place', '22-05-1990', 'Jl. No 60488', NULL, 60488, 60488, 'belum', '', '2021-06-09 19:58:52', '2021-06-09 19:58:52'),
(26, 'pelanggan', 'pelanggan 34158', 'pelanggan34158@gmail.com', NULL, '$2y$10$p0T4Tmu6I9leyAldt3jLpOEwmtVINEInFCO2a3z53QbOUBjAMfEEq', 34158, 34158, 'Test Place', '22-05-1990', 'Jl. No 34158', NULL, 34158, 34158, 'belum', '', '2021-06-09 19:58:52', '2021-06-09 19:58:52'),
(27, 'pelanggan', 'pelanggan 44567', 'pelanggan44567@gmail.com', NULL, '$2y$10$eia/kAd.8x605PsMWyarOO0ZdefWQL/yk0teTqFnnaJOk1n1hsO82', 44567, 44567, 'Test Place', '22-05-1990', 'Jl. No 44567', NULL, 44567, 44567, 'belum', '', '2021-06-09 19:58:52', '2021-06-09 19:58:52'),
(28, 'pelanggan', 'pelanggan 26030', 'pelanggan26030@gmail.com', NULL, '$2y$10$/iv73XQxOvGASrm09hzM4.CsnF0UBT9xf8VkNSIWVFbekAk9gsPUW', 26030, 26030, 'Test Place', '22-05-1990', 'Jl. No 26030', NULL, 26030, 26030, 'belum', '', '2021-06-09 19:58:52', '2021-06-09 19:58:52'),
(29, 'pelanggan', 'pelanggan 44845', 'pelanggan44845@gmail.com', NULL, '$2y$10$0B2tAKF.rqopMnW5xcUf4OWkiyKue4RRBEnizjjG7pPaVSBDWRJIa', 44845, 44845, 'Test Place', '22-05-1990', 'Jl. No 44845', NULL, 44845, 44845, 'belum', '', '2021-06-09 19:58:52', '2021-06-09 19:58:52'),
(30, 'pelanggan', 'pelanggan 51405', 'pelanggan51405@gmail.com', NULL, '$2y$10$RcqYRSoEpDdqvL0lbQTudOwmFjs4lNOHkWTOqxbQ91jctOR0UVwEC', 51405, 51405, 'Test Place', '22-05-1990', 'Jl. No 51405', NULL, 51405, 51405, 'belum', '', '2021-06-09 19:58:52', '2021-06-09 19:58:52'),
(31, 'pelanggan', 'pelanggan 32901', 'pelanggan32901@gmail.com', NULL, '$2y$10$iLV78FWBfQTNaEYj9/ExNOGAERw1.6dY5JCv4CmJbtE4rWYMCIrEm', 32901, 32901, 'Test Place', '22-05-1990', 'Jl. No 32901', NULL, 32901, 32901, 'belum', '', '2021-06-09 19:58:52', '2021-06-09 19:58:52'),
(32, 'pelanggan', 'pelanggan 97433', 'pelanggan97433@gmail.com', NULL, '$2y$10$I/rea34teYedD5c4JM/2ve7WCIM5Uk7AgB/aiSGhvU42j5zELDi8e', 97433, 97433, 'Test Place', '22-05-1990', 'Jl. No 97433', NULL, 97433, 97433, 'belum', '', '2021-06-09 19:58:52', '2021-06-09 19:58:52'),
(33, 'pelanggan', 'pelanggan 59711', 'pelanggan59711@gmail.com', NULL, '$2y$10$zITn2QiwcWJRaFzjku923en47XFNxHIUqBp6Aa8QWMNVXCJyOSXi.', 59711, 59711, 'Test Place', '22-05-1990', 'Jl. No 59711', NULL, 59711, 59711, 'belum', '', '2021-06-09 19:58:52', '2021-06-09 19:58:52'),
(34, 'pelanggan', 'pelanggan 10956', 'pelanggan10956@gmail.com', NULL, '$2y$10$KV3rj.8GCbQ9QIVD27sMl.y4I7TMD.14rk62Nl8FQVtsD5Mg5QAUi', 10956, 10956, 'Test Place', '22-05-1990', 'Jl. No 10956', NULL, 10956, 10956, 'belum', '', '2021-06-09 19:58:52', '2021-06-09 19:58:52'),
(35, 'pelanggan', 'pelanggan 9010', 'pelanggan9010@gmail.com', NULL, '$2y$10$I5z4dNpl3VBSmcvoLZsRieLpMC1bWUjQpWak95OEQ4tTg5LxGf78S', 9010, 9010, 'Test Place', '22-05-1990', 'Jl. No 9010', NULL, 9010, 9010, 'belum', '', '2021-06-09 19:58:52', '2021-06-09 19:58:52'),
(36, 'pelanggan', 'pelanggan 66739', 'pelanggan66739@gmail.com', NULL, '$2y$10$FxVk9i0pRYybehexgdOKfufLzJY93OHn73L9r82k6cj.z4VHEeYR2', 66739, 66739, 'Test Place', '22-05-1990', 'Jl. No 66739', NULL, 66739, 66739, 'belum', '', '2021-06-09 19:58:52', '2021-06-09 19:58:52'),
(37, 'pelanggan', 'pelanggan 53343', 'pelanggan53343@gmail.com', NULL, '$2y$10$JjaN3DFNUe7pNYc1CLoKM.uqN/qT/1qcFEtcuXLwR9CAaNWhtYtSm', 53343, 53343, 'Test Place', '22-05-1990', 'Jl. No 53343', NULL, 53343, 53343, 'belum', '', '2021-06-09 19:58:52', '2021-06-09 19:58:52'),
(38, 'pelanggan', 'pelanggan 75376', 'pelanggan75376@gmail.com', NULL, '$2y$10$YKtzYg.TUI.zghwj7YUONeUYPYbyOtknP8KrN1t9pCFwolsv4Qxgu', 75376, 75376, 'Test Place', '22-05-1990', 'Jl. No 75376', NULL, 75376, 75376, 'belum', '', '2021-06-09 19:58:52', '2021-06-09 19:58:52'),
(39, 'pelanggan', 'pelanggan 21365', 'pelanggan21365@gmail.com', NULL, '$2y$10$C6oxHzSNaeqtk8Ji3Wpca.ciWFGwk3c3NF7eIBP/CNVwlOWp4xH8C', 21365, 21365, 'Test Place', '22-05-1990', 'Jl. No 21365', NULL, 21365, 21365, 'belum', '', '2021-06-09 19:58:52', '2021-06-09 19:58:52'),
(40, 'pelanggan', 'pelanggan 60380', 'pelanggan60380@gmail.com', NULL, '$2y$10$poJh8Wf.lbAaSbypDHmnOeC3aBuh/L7tVJd3lTCSRxSc.LVw5UeAy', 60380, 60380, 'Test Place', '22-05-1990', 'Jl. No 60380', NULL, 60380, 60380, 'belum', '', '2021-06-09 19:58:52', '2021-06-09 19:58:52'),
(41, 'pelanggan', 'pelanggan 31408', 'pelanggan31408@gmail.com', NULL, '$2y$10$iJD/lG.AizlQ/2p6es5lG.42Y4aHcFvwbHt1Q/tPgrZ9jpCLCmgim', 31408, 31408, 'Test Place', '22-05-1990', 'Jl. No 31408', NULL, 31408, 31408, 'belum', '', '2021-06-09 19:58:52', '2021-06-09 19:58:52'),
(42, 'pelanggan', 'pelanggan 14359', 'pelanggan14359@gmail.com', NULL, '$2y$10$PeVc86UkQpvGOnmCjW7g6.Q4lDUB.Lx/5C/u80WHXkmt/pqSRh21y', 14359, 14359, 'Test Place', '22-05-1990', 'Jl. No 14359', NULL, 14359, 14359, 'belum', '', '2021-06-09 19:58:53', '2021-06-09 19:58:53'),
(43, 'pelanggan', 'pelanggan 66798', 'pelanggan66798@gmail.com', NULL, '$2y$10$3wEUwQOTsxUisuhP1KGa8eME5M7to.599s5GuorsNdXAAomyBKBJu', 66798, 66798, 'Test Place', '22-05-1990', 'Jl. No 66798', NULL, 66798, 66798, 'belum', '', '2021-06-09 19:58:53', '2021-06-09 19:58:53'),
(44, 'pelanggan', 'pelanggan 67243', 'pelanggan67243@gmail.com', NULL, '$2y$10$0r9VBcopbD4ZkGu99F28y.yUoDBaPdIKM1hDzldGCZjj89yPw7mXe', 67243, 67243, 'Test Place', '22-05-1990', 'Jl. No 67243', NULL, 67243, 67243, 'belum', '', '2021-06-09 19:58:53', '2021-06-09 19:58:53'),
(45, 'pelanggan', 'pelanggan 85612', 'pelanggan85612@gmail.com', NULL, '$2y$10$7EaYbUR8EaVHLK3pwU.QveUkiZ0eSCTp92AaNLMyL9B9Yo99MWLj.', 85612, 85612, 'Test Place', '22-05-1990', 'Jl. No 85612', NULL, 85612, 85612, 'belum', '', '2021-06-09 19:58:53', '2021-06-09 19:58:53'),
(46, 'pelanggan', 'pelanggan 29214', 'pelanggan29214@gmail.com', NULL, '$2y$10$GrI52nuEq9lOYcIaUfyAA.VuGR.y0yhY.W57Q1kC.soBsWkof2qFa', 29214, 29214, 'Test Place', '22-05-1990', 'Jl. No 29214', NULL, 29214, 29214, 'belum', '', '2021-06-09 19:58:53', '2021-06-09 19:58:53'),
(47, 'pelanggan', 'pelanggan 75248', 'pelanggan75248@gmail.com', NULL, '$2y$10$OxcoVAbH3ax97S.09KEpuO9k0BYdo73p8AGWPgUKv8PXQg7I0hjoS', 75248, 75248, 'Test Place', '22-05-1990', 'Jl. No 75248', NULL, 75248, 75248, 'belum', '', '2021-06-09 19:58:53', '2021-06-09 19:58:53'),
(48, 'pelanggan', 'pelanggan 23417', 'pelanggan23417@gmail.com', NULL, '$2y$10$1tzEnBN79qJTN1kyagenwu5eCI35Mq9v657vEsY7TQ/0W1dD5UtqO', 23417, 23417, 'Test Place', '22-05-1990', 'Jl. No 23417', NULL, 23417, 23417, 'belum', '', '2021-06-09 19:58:53', '2021-06-09 19:58:53'),
(49, 'pelanggan', 'pelanggan 11130', 'pelanggan11130@gmail.com', NULL, '$2y$10$ix1Hxe7SoHzv/8bxf2bu6uLnlUSdX.8n7FaFE/ZZk0mFa5xpCNTAG', 11130, 11130, 'Test Place', '22-05-1990', 'Jl. No 11130', NULL, 11130, 11130, 'belum', '', '2021-06-09 19:58:53', '2021-06-09 19:58:53'),
(50, 'pelanggan', 'pelanggan 45954', 'pelanggan45954@gmail.com', NULL, '$2y$10$mVc53O7za5prKM9S5GYYOuZZHx2DkymopZffqQQW/ulNYBI1/k6Yy', 45954, 45954, 'Test Place', '22-05-1990', 'Jl. No 45954', NULL, 45954, 45954, 'belum', '', '2021-06-09 19:58:53', '2021-06-09 19:58:53'),
(51, 'pelanggan', 'pelanggan 59166', 'pelanggan59166@gmail.com', NULL, '$2y$10$objhC1MIdRrVKjSoEPi7TO27RtsQCAXXmKo22pgUtA5CKp48sD2Bu', 59166, 59166, 'Test Place', '22-05-1990', 'Jl. No 59166', NULL, 59166, 59166, 'belum', '', '2021-06-09 19:58:53', '2021-06-09 19:58:53'),
(52, 'pelanggan', 'pelanggan 65277', 'pelanggan65277@gmail.com', NULL, '$2y$10$yTtwyG0uuTGb50wr8DzzfuHx1aC6dgguy72MPdJJtPsuq.mhpt2lC', 65277, 65277, 'Test Place', '22-05-1990', 'Jl. No 65277', NULL, 65277, 65277, 'belum', '', '2021-06-09 19:58:53', '2021-06-09 19:58:53'),
(53, 'pelanggan', 'pelanggan 58909', 'pelanggan58909@gmail.com', NULL, '$2y$10$33gFCaY2N88fYEUwaWawgO4cEExEl3y0Fnj0G1kfwLfQa3hFfVVti', 58909, 58909, 'Test Place', '22-05-1990', 'Jl. No 58909', NULL, 58909, 58909, 'belum', '', '2021-06-09 19:58:53', '2021-06-09 19:58:53'),
(54, 'pelanggan', 'pelanggan 31484', 'pelanggan31484@gmail.com', NULL, '$2y$10$2De/N3udRQF2ctKk64kQmORLIIagxlQmswAligkkslck3At7rwtgS', 31484, 31484, 'Test Place', '22-05-1990', 'Jl. No 31484', NULL, 31484, 31484, 'belum', '', '2021-06-09 19:58:53', '2021-06-09 19:58:53'),
(55, 'pelanggan', 'pelanggan 89745', 'pelanggan89745@gmail.com', NULL, '$2y$10$kc9.rYZdQof53x2paQJbHOu0oge2SkGa6ooRCWKi9zuJabXdz8KQu', 89745, 89745, 'Test Place', '22-05-1990', 'Jl. No 89745', NULL, 89745, 89745, 'belum', '', '2021-06-09 19:58:53', '2021-06-09 19:58:53'),
(56, 'pelanggan', 'pelanggan 72318', 'pelanggan72318@gmail.com', NULL, '$2y$10$dy4bTxLZ6.Z9Es8zsa0JgOH858D6TcVPSwEvomh8SQ4QccbUbNwWG', 72318, 72318, 'Test Place', '22-05-1990', 'Jl. No 72318', NULL, 72318, 72318, 'belum', '', '2021-06-09 19:58:53', '2021-06-09 19:58:53'),
(57, 'pelanggan', 'pelanggan 9578', 'pelanggan9578@gmail.com', NULL, '$2y$10$HE9JwY2aPMOsa245VKFsPez.ckhoQNQi3iGz5tGmZ6Y3h0OeVHK1i', 9578, 9578, 'Test Place', '22-05-1990', 'Jl. No 9578', NULL, 9578, 9578, 'belum', '', '2021-06-09 19:58:53', '2021-06-09 19:58:53'),
(58, 'pelanggan', 'pelanggan 45516', 'pelanggan45516@gmail.com', NULL, '$2y$10$cK.8G2ul6eJ21ueBugKE0.8Y0tQnMbUi90zryumGp3Xcp3IJCKGCm', 45516, 45516, 'Test Place', '22-05-1990', 'Jl. No 45516', NULL, 45516, 45516, 'belum', '', '2021-06-09 19:58:53', '2021-06-09 19:58:53'),
(59, 'pelanggan', 'pelanggan 44033', 'pelanggan44033@gmail.com', NULL, '$2y$10$WTQQ7vE2yBtoDS3k9CnjIeevxdS0anI2HRYrAMcxgyOsr/2Qb7zS6', 44033, 44033, 'Test Place', '22-05-1990', 'Jl. No 44033', NULL, 44033, 44033, 'belum', '', '2021-06-09 19:58:53', '2021-06-09 19:58:53'),
(60, 'pelanggan', 'pelanggan 88759', 'pelanggan88759@gmail.com', NULL, '$2y$10$ys7BOkDVsp0Gp.IlL6kFwuggpQkFdaaKCrs.l0otqbvPQIyKHlBB2', 88759, 88759, 'Test Place', '22-05-1990', 'Jl. No 88759', NULL, 88759, 88759, 'belum', '', '2021-06-09 19:58:53', '2021-06-09 19:58:53'),
(61, 'pelanggan', 'pelanggan 57720', 'pelanggan57720@gmail.com', NULL, '$2y$10$2hxWT/msvdSdFK7gPcm5oeq3PJcrLD79JDbg32nTPFwOjcXUJd5Jy', 57720, 57720, 'Test Place', '22-05-1990', 'Jl. No 57720', NULL, 57720, 57720, 'belum', '', '2021-06-09 19:58:54', '2021-06-09 19:58:54'),
(62, 'pelanggan', 'pelanggan 63635', 'pelanggan63635@gmail.com', NULL, '$2y$10$PmnjSOuF2ZIXhmtp0t6XyeuYH7e6nrb539HQosRAOd7f8LGFg7Mba', 63635, 63635, 'Test Place', '22-05-1990', 'Jl. No 63635', NULL, 63635, 63635, 'belum', '', '2021-06-09 19:58:54', '2021-06-09 19:58:54'),
(63, 'pelanggan', 'pelanggan 82056', 'pelanggan82056@gmail.com', NULL, '$2y$10$427ewzLyU3dnoGEES9kuM.LsCtEI.sgrHoDoNpAsr5t6oG58/oF32', 82056, 82056, 'Test Place', '22-05-1990', 'Jl. No 82056', NULL, 82056, 82056, 'belum', '', '2021-06-09 19:58:54', '2021-06-09 19:58:54'),
(64, 'pelanggan', 'pelanggan 36851', 'pelanggan36851@gmail.com', NULL, '$2y$10$MNKFyJAeq5HiVS/UyNfV3.VUeUGT4zCWD4Odt8JlwcUlOlGyMa8XW', 36851, 36851, 'Test Place', '22-05-1990', 'Jl. No 36851', NULL, 36851, 36851, 'belum', '', '2021-06-09 19:58:54', '2021-06-09 19:58:54'),
(65, 'pelanggan', 'pelanggan 77432', 'pelanggan77432@gmail.com', NULL, '$2y$10$gnWZRqxj.uIhm2oNdTN9/.O1liqsnyBCf5MZLMYsyKq1.G6TI1k2K', 77432, 77432, 'Test Place', '22-05-1990', 'Jl. No 77432', NULL, 77432, 77432, 'belum', '', '2021-06-09 19:58:54', '2021-06-09 19:58:54'),
(66, 'pelanggan', 'pelanggan 67504', 'pelanggan67504@gmail.com', NULL, '$2y$10$bQMu7GdjE/TI5rTbLmVm8OS.VeB8L91bdco68b.1U0EMsm3C357Yi', 67504, 67504, 'Test Place', '22-05-1990', 'Jl. No 67504', NULL, 67504, 67504, 'belum', '', '2021-06-09 19:58:54', '2021-06-09 19:58:54'),
(67, 'pelanggan', 'pelanggan 88412', 'pelanggan88412@gmail.com', NULL, '$2y$10$b4fz13fb4n3D4k1ahEbSHeFPcJnqNNW96rD0kagt04O3EW26JdtbC', 88412, 88412, 'Test Place', '22-05-1990', 'Jl. No 88412', NULL, 88412, 88412, 'belum', '', '2021-06-09 19:58:54', '2021-06-09 19:58:54'),
(68, 'pelanggan', 'pelanggan 28068', 'pelanggan28068@gmail.com', NULL, '$2y$10$uujwDhVdz0mZZ2/OgppDveiGAUStcz/atO6fU4ntRRFPZdiz19tZ.', 28068, 28068, 'Test Place', '22-05-1990', 'Jl. No 28068', NULL, 28068, 28068, 'belum', '', '2021-06-09 19:58:54', '2021-06-09 19:58:54'),
(69, 'pelanggan', 'pelanggan 42942', 'pelanggan42942@gmail.com', NULL, '$2y$10$zqQtTnnlZ6jtGRQilx5cBe58lA/wE4uEDoQzElR2JgqFtoib1kXwG', 42942, 42942, 'Test Place', '22-05-1990', 'Jl. No 42942', NULL, 42942, 42942, 'belum', '', '2021-06-09 19:58:54', '2021-06-09 19:58:54'),
(70, 'pelanggan', 'pelanggan 53510', 'pelanggan53510@gmail.com', NULL, '$2y$10$1Duf3G9a5BJor727OXz80.mm6PeDMV8GSXo3mTSYx.1/pAQEpNFyS', 53510, 53510, 'Test Place', '22-05-1990', 'Jl. No 53510', NULL, 53510, 53510, 'belum', '', '2021-06-09 19:58:54', '2021-06-09 19:58:54'),
(71, 'pelanggan', 'pelanggan 12127', 'pelanggan12127@gmail.com', NULL, '$2y$10$qeas7lIRgEQ6jBk9gOgDHuraEJk3mq0fb0q07DbsvkwtqyN8rP4Ia', 12127, 12127, 'Test Place', '22-05-1990', 'Jl. No 12127', NULL, 12127, 12127, 'belum', '', '2021-06-09 19:58:54', '2021-06-09 19:58:54'),
(72, 'pelanggan', 'pelanggan 82634', 'pelanggan82634@gmail.com', NULL, '$2y$10$T6j6ffn1w/Ya8pfk1QY9DOa6GvKdIHHCFgoie2DM1.suW4V6iR0j6', 82634, 82634, 'Test Place', '22-05-1990', 'Jl. No 82634', NULL, 82634, 82634, 'belum', '', '2021-06-09 19:58:54', '2021-06-09 19:58:54'),
(73, 'pelanggan', 'pelanggan 35137', 'pelanggan35137@gmail.com', NULL, '$2y$10$FGgFd9PUb88sleFPT5WQkuU6Um.QiGeCIZx37TqyCw4i4AXrVs062', 35137, 35137, 'Test Place', '22-05-1990', 'Jl. No 35137', NULL, 35137, 35137, 'belum', '', '2021-06-09 19:58:54', '2021-06-09 19:58:54'),
(74, 'pelanggan', 'pelanggan 43400', 'pelanggan43400@gmail.com', NULL, '$2y$10$fAANfWkpjLG6lNbbmwUuh.jpW4V5M7.dcrI4E4UbBeWX54xxJek0O', 43400, 43400, 'Test Place', '22-05-1990', 'Jl. No 43400', NULL, 43400, 43400, 'belum', '', '2021-06-09 19:58:54', '2021-06-09 19:58:54'),
(75, 'pelanggan', 'pelanggan 12140', 'pelanggan12140@gmail.com', NULL, '$2y$10$.cxdkWni4l36/xQqxSr2ROhawHxipSrPxwBqengJvUmHEGwyvSaUK', 12140, 12140, 'Test Place', '22-05-1990', 'Jl. No 12140', NULL, 12140, 12140, 'belum', '', '2021-06-09 19:58:54', '2021-06-09 19:58:54'),
(76, 'pelanggan', 'pelanggan 2732', 'pelanggan2732@gmail.com', NULL, '$2y$10$DucnxM2habc/2gFRVpzpDO2W9OdyQnETzr9iXT4agP4IH1daGED8e', 2732, 2732, 'Test Place', '22-05-1990', 'Jl. No 2732', NULL, 2732, 2732, 'belum', '', '2021-06-09 19:58:54', '2021-06-09 19:58:54'),
(77, 'pelanggan', 'pelanggan 99681', 'pelanggan99681@gmail.com', NULL, '$2y$10$CMzo/15BBTSiP9B1Nms9WeX5C4XYbeKErLBz9a6arBXNe1P/9UuVm', 99681, 99681, 'Test Place', '22-05-1990', 'Jl. No 99681', NULL, 99681, 99681, 'belum', '', '2021-06-09 19:58:54', '2021-06-09 19:58:54'),
(78, 'pelanggan', 'pelanggan 4074', 'pelanggan4074@gmail.com', NULL, '$2y$10$vyRy7X4GtbcBDW0ZSyrlyODQExSdIv2wJAmnZqku63m2IWD1SCL6O', 4074, 4074, 'Test Place', '22-05-1990', 'Jl. No 4074', NULL, 4074, 4074, 'belum', '', '2021-06-09 19:58:54', '2021-06-09 19:58:54'),
(79, 'pelanggan', 'pelanggan 23788', 'pelanggan23788@gmail.com', NULL, '$2y$10$kb8cwioJ.S5PGDrojZseEe/5KtOaCHtn.tt1eMxVAsX4DpSaR/2P2', 23788, 23788, 'Test Place', '22-05-1990', 'Jl. No 23788', NULL, 23788, 23788, 'belum', '', '2021-06-09 19:58:54', '2021-06-09 19:58:54'),
(80, 'pelanggan', 'pelanggan 99312', 'pelanggan99312@gmail.com', NULL, '$2y$10$DTDPRxm/EIBhVqdWRCBAuuVfNPjmKF/Vw.ew8umgk03YFWgDFmN8K', 99312, 99312, 'Test Place', '22-05-1990', 'Jl. No 99312', NULL, 99312, 99312, 'belum', '', '2021-06-09 19:58:55', '2021-06-09 19:58:55'),
(81, 'pelanggan', 'pelanggan 78565', 'pelanggan78565@gmail.com', NULL, '$2y$10$9M.MSgtLlQ8qUoZk8JzXXeKpzA.ERLGqsNs09ms.mQVGFpDhcQ86C', 78565, 78565, 'Test Place', '22-05-1990', 'Jl. No 78565', NULL, 78565, 78565, 'belum', '', '2021-06-09 19:58:55', '2021-06-09 19:58:55'),
(82, 'pelanggan', 'pelanggan 36021', 'pelanggan36021@gmail.com', NULL, '$2y$10$chzQe4QC3KEvOzEjxjLT3OENVGRrJu9ogHkHaV/vz0iloDzGAkm36', 36021, 36021, 'Test Place', '22-05-1990', 'Jl. No 36021', NULL, 36021, 36021, 'belum', '', '2021-06-09 19:58:55', '2021-06-09 19:58:55'),
(83, 'pelanggan', 'pelanggan 90627', 'pelanggan90627@gmail.com', NULL, '$2y$10$0Cd1m7T.QIUDhIWF9kzTQukW29XNXJ0/r3EgMudPXVdDTmiLjixmO', 90627, 90627, 'Test Place', '22-05-1990', 'Jl. No 90627', NULL, 90627, 90627, 'belum', '', '2021-06-09 19:58:55', '2021-06-09 19:58:55'),
(84, 'pelanggan', 'pelanggan 77546', 'pelanggan77546@gmail.com', NULL, '$2y$10$k/3sFZS4z7S9aBM4zhEvPeZw5Nj0JxKZnlWl.OBqf/CEdw/EOYue.', 77546, 77546, 'Test Place', '22-05-1990', 'Jl. No 77546', NULL, 77546, 77546, 'belum', '', '2021-06-09 19:58:55', '2021-06-09 19:58:55'),
(85, 'pelanggan', 'pelanggan 21138', 'pelanggan21138@gmail.com', NULL, '$2y$10$8d93mGcZYIwHEiK5bgEUI.HxQNTk/C6Y1dvZGAFPZt3hSyP3esaAS', 21138, 21138, 'Test Place', '22-05-1990', 'Jl. No 21138', NULL, 21138, 21138, 'belum', '', '2021-06-09 19:58:55', '2021-06-09 19:58:55'),
(86, 'pelanggan', 'pelanggan 5250', 'pelanggan5250@gmail.com', NULL, '$2y$10$MBvN2OVdKOU.pNPIuxXl5OcVdcdi2V3kMWtnqZm5p4OsSQwuC5UVW', 5250, 5250, 'Test Place', '22-05-1990', 'Jl. No 5250', NULL, 5250, 5250, 'belum', '', '2021-06-09 19:58:55', '2021-06-09 19:58:55'),
(87, 'pelanggan', 'pelanggan 85062', 'pelanggan85062@gmail.com', NULL, '$2y$10$BIWrKdGGAZbwfi4GQy7n1.YVE/nNgNuxiq651eSvckZXAXXkRF4zO', 85062, 85062, 'Test Place', '22-05-1990', 'Jl. No 85062', NULL, 85062, 85062, 'belum', '', '2021-06-09 19:58:55', '2021-06-09 19:58:55'),
(88, 'pelanggan', 'pelanggan 58935', 'pelanggan58935@gmail.com', NULL, '$2y$10$KOV8bLLLm1CBfzOzOeM7P.WCiBeHIZV5vikocmWSy8xH8di1zAVHm', 58935, 58935, 'Test Place', '22-05-1990', 'Jl. No 58935', NULL, 58935, 58935, 'belum', '', '2021-06-09 19:58:55', '2021-06-09 19:58:55'),
(89, 'pelanggan', 'pelanggan 60679', 'pelanggan60679@gmail.com', NULL, '$2y$10$OnCmHofxwH5Ra5qd9V7TI.Y6G9TTT8LHJbIAqXknLzFHt87NeK/HW', 60679, 60679, 'Test Place', '22-05-1990', 'Jl. No 60679', NULL, 60679, 60679, 'belum', '', '2021-06-09 19:58:55', '2021-06-09 19:58:55'),
(90, 'pelanggan', 'pelanggan 40865', 'pelanggan40865@gmail.com', NULL, '$2y$10$kcQFFHmOXIo2zrAc5RmBru68yOli2d1krlPiENnOmRF6vLruV9KU2', 40865, 40865, 'Test Place', '22-05-1990', 'Jl. No 40865', NULL, 40865, 40865, 'belum', '', '2021-06-09 19:58:55', '2021-06-09 19:58:55'),
(91, 'pelanggan', 'pelanggan 60386', 'pelanggan60386@gmail.com', NULL, '$2y$10$ct6xtHLIRQh8PxGkFwKKHOVru0ZRdQ3iPYLf.wPFZNLR/wCAMY98a', 60386, 60386, 'Test Place', '22-05-1990', 'Jl. No 60386', NULL, 60386, 60386, 'belum', '', '2021-06-09 19:58:55', '2021-06-09 19:58:55'),
(92, 'pelanggan', 'pelanggan 83925', 'pelanggan83925@gmail.com', NULL, '$2y$10$3rRo7qGEx8qqy//gMMGyEe.9GHopRxLI4A1F7HotGjaZfrjUlTcPe', 83925, 83925, 'Test Place', '22-05-1990', 'Jl. No 83925', NULL, 83925, 83925, 'belum', '', '2021-06-09 19:58:55', '2021-06-09 19:58:55'),
(93, 'pelanggan', 'pelanggan 86947', 'pelanggan86947@gmail.com', NULL, '$2y$10$UbqHlaeE5/o1OgCp7JK8iOoNmJZgV0NEViJBh2ezsuZd4Kf4s1oM2', 86947, 86947, 'Test Place', '22-05-1990', 'Jl. No 86947', NULL, 86947, 86947, 'belum', '', '2021-06-09 19:58:55', '2021-06-09 19:58:55'),
(94, 'pelanggan', 'pelanggan 85059', 'pelanggan85059@gmail.com', NULL, '$2y$10$p0YbUGI1QPjohTRnZXpjce2V1VXosfIbl2rChPh29KKtuFMNRkmy6', 85059, 85059, 'Test Place', '22-05-1990', 'Jl. No 85059', NULL, 85059, 85059, 'belum', '', '2021-06-09 19:58:55', '2021-06-09 19:58:55'),
(95, 'pelanggan', 'pelanggan 11769', 'pelanggan11769@gmail.com', NULL, '$2y$10$7pOJV4t6x.biqTLaJ1TCLuIImcQwP1lBXHaKuLuKpGdKmydM0uqL.', 11769, 11769, 'Test Place', '22-05-1990', 'Jl. No 11769', NULL, 11769, 11769, 'belum', '', '2021-06-09 19:58:55', '2021-06-09 19:58:55'),
(96, 'pelanggan', 'pelanggan 41744', 'pelanggan41744@gmail.com', NULL, '$2y$10$1aI2.Uux9l2BkyfwEDZrLutKh7nZ/hNboXrYCJyMcQrMXYf1zZyOa', 41744, 41744, 'Test Place', '22-05-1990', 'Jl. No 41744', NULL, 41744, 41744, 'belum', '', '2021-06-09 19:58:55', '2021-06-09 19:58:55'),
(97, 'pelanggan', 'pelanggan 32454', 'pelanggan32454@gmail.com', NULL, '$2y$10$OE6YUtjjvXVd7EEEuPNxOu0CempHtOlO.F5focLtigQ3BMpJmYseK', 32454, 32454, 'Test Place', '22-05-1990', 'Jl. No 32454', NULL, 32454, 32454, 'belum', '', '2021-06-09 19:58:55', '2021-06-09 19:58:55'),
(98, 'pelanggan', 'pelanggan 66352', 'pelanggan66352@gmail.com', NULL, '$2y$10$5RVLYPnI.cRnwfaw/LmYEusxGDLBJfi/Hb4Fb5xHiF83Cd63/0drC', 66352, 66352, 'Test Place', '22-05-1990', 'Jl. No 66352', NULL, 66352, 66352, 'belum', '', '2021-06-09 19:58:56', '2021-06-09 19:58:56'),
(99, 'pelanggan', 'pelanggan 1663', 'pelanggan1663@gmail.com', NULL, '$2y$10$rK.uc5jDubGo1b3.SDnGnuyK8EB3q.00.1iOl5eCH8CKh6g2iI7qe', 1663, 1663, 'Test Place', '22-05-1990', 'Jl. No 1663', NULL, 1663, 1663, 'belum', '', '2021-06-09 19:58:56', '2021-06-09 19:58:56'),
(100, 'pelanggan', 'pelanggan 61357', 'pelanggan61357@gmail.com', NULL, '$2y$10$AL2U2Z.M2Fnx/s7N.2DZvOtGpbtdNMqHaKjm4dR2OGOXE4Oe9ZeOi', 61357, 61357, 'Test Place', '22-05-1990', 'Jl. No 61357', NULL, 61357, 61357, 'belum', '', '2021-06-09 19:58:56', '2021-06-09 19:58:56'),
(101, 'pelanggan', 'pelanggan 5461', 'pelanggan5461@gmail.com', NULL, '$2y$10$klaeolB3.aioHp728kpmI.UuArNKitFqvll03A/cJ38LIcB321uPq', 5461, 5461, 'Test Place', '22-05-1990', 'Jl. No 5461', NULL, 5461, 5461, 'belum', '', '2021-06-09 19:58:56', '2021-06-09 19:58:56'),
(102, 'pelanggan', 'pelanggan 63104', 'pelanggan63104@gmail.com', NULL, '$2y$10$ouLMwfiCBEenUu0uwVDjF.jQCPje2CxFCgDWwWEWUty4RkhfLHSDS', 63104, 63104, 'Test Place', '22-05-1990', 'Jl. No 63104', NULL, 63104, 63104, 'belum', '', '2021-06-09 19:58:56', '2021-06-09 19:58:56'),
(103, 'pelanggan', 'pelanggan 84466', 'pelanggan84466@gmail.com', NULL, '$2y$10$yJbUiy2FdFnuU720.ogjm.QyMm1aoVSyn7tAJuIizfN8KBQXuz2Xe', 84466, 84466, 'Test Place', '22-05-1990', 'Jl. No 84466', NULL, 84466, 84466, 'belum', '', '2021-06-09 19:58:56', '2021-06-09 19:58:56'),
(104, 'pelanggan', 'pelanggan 56054', 'pelanggan56054@gmail.com', NULL, '$2y$10$uuV3TX7CGcFe3c1tucUpVOw20WhGdpIjzR6nEeKHLT36OERV7WSQO', 56054, 56054, 'Test Place', '22-05-1990', 'Jl. No 56054', NULL, 56054, 56054, 'belum', '', '2021-06-09 19:58:56', '2021-06-09 19:58:56'),
(105, 'pelanggan', 'pelanggan 23306', 'pelanggan23306@gmail.com', NULL, '$2y$10$JJC7HIZTECmjKDuRLWPS6.uV.Ei3MMug1Cz1LtjYTmLgRxMRxkRRO', 23306, 23306, 'Test Place', '22-05-1990', 'Jl. No 23306', NULL, 23306, 23306, 'belum', '', '2021-06-09 19:58:56', '2021-06-09 19:58:56'),
(106, 'pelanggan', 'pelanggan 40948', 'pelanggan40948@gmail.com', NULL, '$2y$10$T48IklCoML90l/asoX.A8.Eq90ttdQ39kURMXT2rrauH8rg52YxnG', 40948, 40948, 'Test Place', '22-05-1990', 'Jl. No 40948', NULL, 40948, 40948, 'belum', '', '2021-06-09 19:58:56', '2021-06-09 19:58:56'),
(107, 'pelanggan', 'pelanggan 83739', 'pelanggan83739@gmail.com', NULL, '$2y$10$gafRbKQj4ZNBVP5H0M9baOQeecZkKX0kiiyifRYRR9WcBZSZWD0Ia', 83739, 83739, 'Test Place', '22-05-1990', 'Jl. No 83739', NULL, 83739, 83739, 'belum', '', '2021-06-09 19:58:56', '2021-06-09 19:58:56'),
(108, 'pelanggan', 'pelanggan 58092', 'pelanggan58092@gmail.com', NULL, '$2y$10$fwJJTDB0hdMVXz0WlULBSOSzCSRwPkY0ystCW0vB3E7IefbViYiEi', 58092, 58092, 'Test Place', '22-05-1990', 'Jl. No 58092', NULL, 58092, 58092, 'belum', '', '2021-06-09 19:58:56', '2021-06-09 19:58:56'),
(109, 'pelanggan', 'pelanggan 57138', 'pelanggan57138@gmail.com', NULL, '$2y$10$SQtmFKpvM7V.drnVPElJ1.c8ijCRxIyvsKxebcT7lnRTlrGLYXTXW', 57138, 57138, 'Test Place', '22-05-1990', 'Jl. No 57138', NULL, 57138, 57138, 'belum', '', '2021-06-09 19:58:56', '2021-06-09 19:58:56'),
(110, 'pelanggan', 'pelanggan 9063', 'pelanggan9063@gmail.com', NULL, '$2y$10$sPgzQ1/mE7Q7tMM/DSSx5eFGQvO.oYbm9rdhasWmD5fcs8I7W9zAW', 9063, 9063, 'Test Place', '22-05-1990', 'Jl. No 9063', NULL, 9063, 9063, 'belum', '', '2021-06-09 19:58:56', '2021-06-09 19:58:56'),
(111, 'pelanggan', 'pelanggan 53642', 'pelanggan53642@gmail.com', NULL, '$2y$10$XNL/KQFrhjc..VWKhTsiReMWu3RIlo2V/2aRBDKk4VCbHybz9aK3q', 53642, 53642, 'Test Place', '22-05-1990', 'Jl. No 53642', NULL, 53642, 53642, 'belum', '', '2021-06-09 19:58:56', '2021-06-09 19:58:56'),
(112, 'pelanggan', 'pelanggan 79275', 'pelanggan79275@gmail.com', NULL, '$2y$10$dXXFOcAC2lvgc9YnHfo6BOGLZriHYA/j4e60RCUGNQq8czxJTnOcK', 79275, 79275, 'Test Place', '22-05-1990', 'Jl. No 79275', NULL, 79275, 79275, 'belum', '', '2021-06-09 19:58:56', '2021-06-09 19:58:56'),
(113, 'pelanggan', 'pelanggan 34027', 'pelanggan34027@gmail.com', NULL, '$2y$10$mAYl0U1P7VBfS5rPB5gwbO.OGn4VffPvxBXlG3m1do5orZMnqMjd6', 34027, 34027, 'Test Place', '22-05-1990', 'Jl. No 34027', NULL, 34027, 34027, 'belum', '', '2021-06-09 19:58:56', '2021-06-09 19:58:56'),
(114, 'pelanggan', 'pelanggan 68461', 'pelanggan68461@gmail.com', NULL, '$2y$10$F6VQ.05plOFGwckLt2LpB.9AEo7BSD7EUsg7//ekguCbq0vjUI862', 68461, 68461, 'Test Place', '22-05-1990', 'Jl. No 68461', NULL, 68461, 68461, 'belum', '', '2021-06-09 19:58:56', '2021-06-09 19:58:56'),
(115, 'pelanggan', 'pelanggan 37236', 'pelanggan37236@gmail.com', NULL, '$2y$10$yZmXUedya8aMHjmAYKmUiOt6R3NEQytK.64bMKgiAUp1AA0yogsw2', 37236, 37236, 'Test Place', '22-05-1990', 'Jl. No 37236', NULL, 37236, 37236, 'belum', '', '2021-06-09 19:58:56', '2021-06-09 19:58:56'),
(116, 'pelanggan', 'pelanggan 65013', 'pelanggan65013@gmail.com', NULL, '$2y$10$r3ycgYM1JNgsEQeD.xGJEeLz2ExzLQSUk5x9rGMul4hn7LOyGg5pW', 65013, 65013, 'Test Place', '22-05-1990', 'Jl. No 65013', NULL, 65013, 65013, 'belum', '', '2021-06-09 19:58:56', '2021-06-09 19:58:56'),
(117, 'pelanggan', 'pelanggan 6572', 'pelanggan6572@gmail.com', NULL, '$2y$10$fgsUprXhMkVH7ZfOcPgs1O8TSlNzARjRYAw/7A00QnfOsft.UOLmy', 6572, 6572, 'Test Place', '22-05-1990', 'Jl. No 6572', NULL, 6572, 6572, 'belum', '', '2021-06-09 19:58:57', '2021-06-09 19:58:57'),
(118, 'pelanggan', 'pelanggan 82818', 'pelanggan82818@gmail.com', NULL, '$2y$10$8fZnHW6JZij5JV21aulnaewgYdhexu9I/0vajxhXzlbUw.ii9TiRG', 82818, 82818, 'Test Place', '22-05-1990', 'Jl. No 82818', NULL, 82818, 82818, 'belum', '', '2021-06-09 19:58:57', '2021-06-09 19:58:57'),
(119, 'pelanggan', 'pelanggan 43865', 'pelanggan43865@gmail.com', NULL, '$2y$10$.tifoEKpjlJB5moW67kEVeTOa1INHPTUABYZECHv/hBMbro6YEsBm', 43865, 43865, 'Test Place', '22-05-1990', 'Jl. No 43865', NULL, 43865, 43865, 'belum', '', '2021-06-09 19:58:57', '2021-06-09 19:58:57'),
(120, 'pelanggan', 'pelanggan 5288', 'pelanggan5288@gmail.com', NULL, '$2y$10$KFoScIkSwwPEhOQGtZNK1.taXJEB8MXum9XbOs30XVEP25zZJfH4u', 5288, 5288, 'Test Place', '22-05-1990', 'Jl. No 5288', NULL, 5288, 5288, 'belum', '', '2021-06-09 19:58:57', '2021-06-09 19:58:57'),
(121, 'pelanggan', 'pelanggan 1173', 'pelanggan1173@gmail.com', NULL, '$2y$10$OKCJ7JBBUhDqKoP.OT3s.O2eQjKK8oM2GWtJxGROme//9Pic3zGsy', 1173, 1173, 'Test Place', '22-05-1990', 'Jl. No 1173', NULL, 1173, 1173, 'belum', '', '2021-06-09 19:58:57', '2021-06-09 19:58:57'),
(122, 'pelanggan', 'pelanggan 44530', 'pelanggan44530@gmail.com', NULL, '$2y$10$5YKxMSDq7OKCveZDAsaKx.oJIl2.x34r3brYnrgVJcu4ECfx1Fakq', 44530, 44530, 'Test Place', '22-05-1990', 'Jl. No 44530', NULL, 44530, 44530, 'belum', '', '2021-06-09 19:58:57', '2021-06-09 19:58:57'),
(123, 'pelanggan', 'pelanggan 62296', 'pelanggan62296@gmail.com', NULL, '$2y$10$EDYS8mQhKVO291IK2HnYZuSRsT1MTKRVDwk8PRkLHl2epo/dQ0mrO', 62296, 62296, 'Test Place', '22-05-1990', 'Jl. No 62296', NULL, 62296, 62296, 'belum', '', '2021-06-09 19:58:57', '2021-06-09 19:58:57'),
(124, 'pelanggan', 'pelanggan 81428', 'pelanggan81428@gmail.com', NULL, '$2y$10$RCmxvYP7zR5T/xPk..L.sO036W5Vf5WIVuhTTGqhBJg6.Zv4alEde', 81428, 81428, 'Test Place', '22-05-1990', 'Jl. No 81428', NULL, 81428, 81428, 'belum', '', '2021-06-09 19:58:57', '2021-06-09 19:58:57'),
(125, 'pelanggan', 'pelanggan 28010', 'pelanggan28010@gmail.com', NULL, '$2y$10$2PEvwLcyL8q6D7DZ/ttXhu26khGSd1zJ/JlUVInCM8r62T/l8Tr2a', 28010, 28010, 'Test Place', '22-05-1990', 'Jl. No 28010', NULL, 28010, 28010, 'belum', '', '2021-06-09 19:58:57', '2021-06-09 19:58:57'),
(126, 'pelanggan', 'pelanggan 21057', 'pelanggan21057@gmail.com', NULL, '$2y$10$fmqJEfhsoGTT0Q5rDZvqduNhsl6dt/VgHJslu2E6.OKGmcejiKpaG', 21057, 21057, 'Test Place', '22-05-1990', 'Jl. No 21057', NULL, 21057, 21057, 'belum', '', '2021-06-09 19:58:57', '2021-06-09 19:58:57'),
(127, 'pelanggan', 'pelanggan 77859', 'pelanggan77859@gmail.com', NULL, '$2y$10$h92GothRjh8JxmSbu6oam.thVEZhorcnBQOG8T/vuieGwe//dQ6Rq', 77859, 77859, 'Test Place', '22-05-1990', 'Jl. No 77859', NULL, 77859, 77859, 'belum', '', '2021-06-09 19:58:57', '2021-06-09 19:58:57'),
(128, 'pelanggan', 'pelanggan 35836', 'pelanggan35836@gmail.com', NULL, '$2y$10$C5CfgrxbSdLJDVYvq.j1JunzWLm0QAeSy3YzVVQdZKNzWT3G3oI1y', 35836, 35836, 'Test Place', '22-05-1990', 'Jl. No 35836', NULL, 35836, 35836, 'belum', '', '2021-06-09 19:58:57', '2021-06-09 19:58:57'),
(129, 'pelanggan', 'pelanggan 59063', 'pelanggan59063@gmail.com', NULL, '$2y$10$gsfqkbdE.Vex7rL97dN/5uTOP/dQvoTWQsk1tyKAznBmBjUXPXhWS', 59063, 59063, 'Test Place', '22-05-1990', 'Jl. No 59063', NULL, 59063, 59063, 'belum', '', '2021-06-09 19:58:57', '2021-06-09 19:58:57'),
(130, 'pelanggan', 'pelanggan 97886', 'pelanggan97886@gmail.com', NULL, '$2y$10$gsvcfuJSDPwWBbJR7cZ3qOHbU/PbLEXo5FDMTyXEwWcIJ.wW3epme', 97886, 97886, 'Test Place', '22-05-1990', 'Jl. No 97886', NULL, 97886, 97886, 'belum', '', '2021-06-09 19:58:57', '2021-06-09 19:58:57'),
(131, 'pelanggan', 'pelanggan 84900', 'pelanggan84900@gmail.com', NULL, '$2y$10$dOpS7hqDV1cW0VUUccaO.eU3d.t7PLKHkRex1K3LI1G4VVj18r43.', 84900, 84900, 'Test Place', '22-05-1990', 'Jl. No 84900', NULL, 84900, 84900, 'belum', '', '2021-06-09 19:58:57', '2021-06-09 19:58:57'),
(132, 'pelanggan', 'pelanggan 7394', 'pelanggan7394@gmail.com', NULL, '$2y$10$ZyF6v9DxuI3oYqGiZodCd.OrVCMj4ck9Qh3gwEZSyLs/iE1xeKrBy', 7394, 7394, 'Test Place', '22-05-1990', 'Jl. No 7394', NULL, 7394, 7394, 'belum', '', '2021-06-09 19:58:57', '2021-06-09 19:58:57'),
(133, 'pelanggan', 'pelanggan 30346', 'pelanggan30346@gmail.com', NULL, '$2y$10$VV4iNzgPgFjNcnFNPdODmurM04Nqv.6ZHC/y6k/94lf9Qr68vAYV.', 30346, 30346, 'Test Place', '22-05-1990', 'Jl. No 30346', NULL, 30346, 30346, 'belum', '', '2021-06-09 19:58:57', '2021-06-09 19:58:57'),
(134, 'pelanggan', 'pelanggan 55568', 'pelanggan55568@gmail.com', NULL, '$2y$10$2s1edlu/ZyMN0cnWMWOPne.F0L5GTwhMvOpsqjfXvsIjAOPJWPURq', 55568, 55568, 'Test Place', '22-05-1990', 'Jl. No 55568', NULL, 55568, 55568, 'belum', '', '2021-06-09 19:58:57', '2021-06-09 19:58:57'),
(135, 'pelanggan', 'pelanggan 32848', 'pelanggan32848@gmail.com', NULL, '$2y$10$/Vuj4KZNFc3VVcqSabusxuPyysbwsc8JHSC1TkGDAygwxC4cJBtZC', 32848, 32848, 'Test Place', '22-05-1990', 'Jl. No 32848', NULL, 32848, 32848, 'belum', '', '2021-06-09 19:58:58', '2021-06-09 19:58:58'),
(136, 'pelanggan', 'pelanggan 28807', 'pelanggan28807@gmail.com', NULL, '$2y$10$Eu4QYXezygUcFfuFi2QNUe1US3REywA/DSeLyr7Gwh0hnssFrDsWq', 28807, 28807, 'Test Place', '22-05-1990', 'Jl. No 28807', NULL, 28807, 28807, 'belum', '', '2021-06-09 19:58:58', '2021-06-09 19:58:58'),
(137, 'pelanggan', 'pelanggan 21368', 'pelanggan21368@gmail.com', NULL, '$2y$10$SbKrf79NU7lmjQMWT9gdwuxrNZDhzXcg1NRJg/thTBlMfMFJFV/EO', 21368, 21368, 'Test Place', '22-05-1990', 'Jl. No 21368', NULL, 21368, 21368, 'belum', '', '2021-06-09 19:58:58', '2021-06-09 19:58:58'),
(138, 'pelanggan', 'pelanggan 15771', 'pelanggan15771@gmail.com', NULL, '$2y$10$JxMHiwODmi.RsiuiTrfuZuQsy7rcl8kQQXNKM5BNbTtSE2QDvh8Rm', 15771, 15771, 'Test Place', '22-05-1990', 'Jl. No 15771', NULL, 15771, 15771, 'belum', '', '2021-06-09 19:58:58', '2021-06-09 19:58:58'),
(139, 'pelanggan', 'pelanggan 91026', 'pelanggan91026@gmail.com', NULL, '$2y$10$SiK9MayXFiV6/Y5Pm4fIt.TI5OufFLiYQ3NLB8sfsxC/PJ06BE852', 91026, 91026, 'Test Place', '22-05-1990', 'Jl. No 91026', NULL, 91026, 91026, 'belum', '', '2021-06-09 19:58:58', '2021-06-09 19:58:58'),
(140, 'pelanggan', 'pelanggan 15007', 'pelanggan15007@gmail.com', NULL, '$2y$10$eRY.Lf67f/FeuqX7IUj1FOKwVKPd4I2j8E50iZLebamp9v93BOgaO', 15007, 15007, 'Test Place', '22-05-1990', 'Jl. No 15007', NULL, 15007, 15007, 'belum', '', '2021-06-09 19:58:58', '2021-06-09 19:58:58'),
(141, 'pelanggan', 'pelanggan 85899', 'pelanggan85899@gmail.com', NULL, '$2y$10$VssAuwM/UWSX2RtvZQaKku84G5H/CGiip303cUEnezOAgFQ5Oqtoa', 85899, 85899, 'Test Place', '22-05-1990', 'Jl. No 85899', NULL, 85899, 85899, 'belum', '', '2021-06-09 19:58:58', '2021-06-09 19:58:58'),
(142, 'pelanggan', 'pelanggan 79552', 'pelanggan79552@gmail.com', NULL, '$2y$10$lR6WYXWBcSAd74LDE8v6A.vVdDgmCWw8bpBUPKEVoPpz8qkPfxv4K', 79552, 79552, 'Test Place', '22-05-1990', 'Jl. No 79552', NULL, 79552, 79552, 'belum', '', '2021-06-09 19:58:58', '2021-06-09 19:58:58'),
(143, 'pelanggan', 'pelanggan 19354', 'pelanggan19354@gmail.com', NULL, '$2y$10$bYeeac7gZq1D7POBrniF8exVLo8jpmyKruiPaHodSFsIKJX.lM.wW', 19354, 19354, 'Test Place', '22-05-1990', 'Jl. No 19354', NULL, 19354, 19354, 'belum', '', '2021-06-09 19:58:58', '2021-06-09 19:58:58'),
(144, 'pelanggan', 'pelanggan 97817', 'pelanggan97817@gmail.com', NULL, '$2y$10$Yx39xZH4HpOkE03NAshhFu.rNFLZJE2G/KSU7ZdFk/ps6u3W/LS5u', 97817, 97817, 'Test Place', '22-05-1990', 'Jl. No 97817', NULL, 97817, 97817, 'belum', '', '2021-06-09 19:58:58', '2021-06-09 19:58:58'),
(145, 'pelanggan', 'pelanggan 8094', 'pelanggan8094@gmail.com', NULL, '$2y$10$jEk0QM3J59LSZw3vcM5HceqC7pYZOpp5P4zNrpM2wzoWb/P.jZN5O', 8094, 8094, 'Test Place', '22-05-1990', 'Jl. No 8094', NULL, 8094, 8094, 'belum', '', '2021-06-09 19:58:58', '2021-06-09 19:58:58'),
(146, 'pelanggan', 'pelanggan 65767', 'pelanggan65767@gmail.com', NULL, '$2y$10$N2jXffjSPDU5lgamtJp8q.nqECULKq6DVn/gIOL3HPHp8ZUAxCYtO', 65767, 65767, 'Test Place', '22-05-1990', 'Jl. No 65767', NULL, 65767, 65767, 'belum', '', '2021-06-09 19:58:58', '2021-06-09 19:58:58'),
(147, 'pelanggan', 'pelanggan 88014', 'pelanggan88014@gmail.com', NULL, '$2y$10$pZIuWB9HzVHF4T5pYnIX2.hlOdhU01BBZ2m4NtWeyO8UNCMK6gDk6', 88014, 88014, 'Test Place', '22-05-1990', 'Jl. No 88014', NULL, 88014, 88014, 'belum', '', '2021-06-09 19:58:58', '2021-06-09 19:58:58'),
(148, 'pelanggan', 'pelanggan 12359', 'pelanggan12359@gmail.com', NULL, '$2y$10$.n7ZlhBydJadjVbAb5kN6OSro8xwEJA/DtOTskSJB1xKoet.sGeMu', 12359, 12359, 'Test Place', '22-05-1990', 'Jl. No 12359', NULL, 12359, 12359, 'belum', '', '2021-06-09 19:58:58', '2021-06-09 19:58:58'),
(149, 'pelanggan', 'pelanggan 98002', 'pelanggan98002@gmail.com', NULL, '$2y$10$.UufkagOJFpcZYCrO/GpW.q0j7H9zLEAgiTP9Avmn79/CCCUpHdye', 98002, 98002, 'Test Place', '22-05-1990', 'Jl. No 98002', NULL, 98002, 98002, 'belum', '', '2021-06-09 19:58:58', '2021-06-09 19:58:58'),
(150, 'pelanggan', 'pelanggan 56276', 'pelanggan56276@gmail.com', NULL, '$2y$10$jeLO50CIRyQR8OQVZHmIGeeF9/g45hBe5gPjTdyO/xDFmtVQ.QR1S', 56276, 56276, 'Test Place', '22-05-1990', 'Jl. No 56276', NULL, 56276, 56276, 'belum', '', '2021-06-09 19:58:58', '2021-06-09 19:58:58'),
(151, 'pelanggan', 'pelanggan 29141', 'pelanggan29141@gmail.com', NULL, '$2y$10$gYYj7GoNMCz85G5Z9b.25uIhZBMfmENGVjFqXfUTTmcsbK679KW5C', 29141, 29141, 'Test Place', '22-05-1990', 'Jl. No 29141', NULL, 29141, 29141, 'belum', '', '2021-06-09 19:58:58', '2021-06-09 19:58:58'),
(152, 'pelanggan', 'pelanggan 79180', 'pelanggan79180@gmail.com', NULL, '$2y$10$5p//TMF.g/RfbTgUyXLdr.mZX79QH.ujr1HW4m1/xbqcqQGtr1q1u', 79180, 79180, 'Test Place', '22-05-1990', 'Jl. No 79180', NULL, 79180, 79180, 'belum', '', '2021-06-09 19:58:58', '2021-06-09 19:58:58'),
(153, 'pelanggan', 'pelanggan 17655', 'pelanggan17655@gmail.com', NULL, '$2y$10$XvTMyOE2hxSFSS1/sSA/weDOko9TC2M8KZ0dT.p985noo5sbLp1dW', 17655, 17655, 'Test Place', '22-05-1990', 'Jl. No 17655', NULL, 17655, 17655, 'belum', '', '2021-06-09 19:58:58', '2021-06-09 19:58:58'),
(154, 'pelanggan', 'pelanggan 58268', 'pelanggan58268@gmail.com', NULL, '$2y$10$TDrU6dyWoXCG3xKUuy4bSe4bvR9oAnogpL7HsXqRmnd2DplS2rk0K', 58268, 58268, 'Test Place', '22-05-1990', 'Jl. No 58268', NULL, 58268, 58268, 'belum', '', '2021-06-09 19:58:59', '2021-06-09 19:58:59'),
(155, 'pelanggan', 'pelanggan 96400', 'pelanggan96400@gmail.com', NULL, '$2y$10$dDQK7vP0iDF.ChmilXVgW.tbxNXO0jyIk.8OYHytQePGjenrIl76K', 96400, 96400, 'Test Place', '22-05-1990', 'Jl. No 96400', NULL, 96400, 96400, 'belum', '', '2021-06-09 19:58:59', '2021-06-09 19:58:59'),
(156, 'pelanggan', 'pelanggan 45924', 'pelanggan45924@gmail.com', NULL, '$2y$10$PBtGTHpt4XltTIstRUt99O0qCTO7ztFFUNY4.jhrNm6tfiL7iZod2', 45924, 45924, 'Test Place', '22-05-1990', 'Jl. No 45924', NULL, 45924, 45924, 'belum', '', '2021-06-09 19:58:59', '2021-06-09 19:58:59'),
(157, 'pelanggan', 'pelanggan 17773', 'pelanggan17773@gmail.com', NULL, '$2y$10$ROTd06PbWl6amkfktc47Y.b/dkWpMjU6QMjDnw6uMn5Opo0ufRwvO', 17773, 17773, 'Test Place', '22-05-1990', 'Jl. No 17773', NULL, 17773, 17773, 'belum', '', '2021-06-09 19:58:59', '2021-06-09 19:58:59'),
(158, 'pelanggan', 'pelanggan 76666', 'pelanggan76666@gmail.com', NULL, '$2y$10$rZPSwQUrO71rFDzFEhm4KuG9J5rjvVGdCg9SFLyZaSoh3D3w8d87i', 76666, 76666, 'Test Place', '22-05-1990', 'Jl. No 76666', NULL, 76666, 76666, 'belum', '', '2021-06-09 19:58:59', '2021-06-09 19:58:59'),
(159, 'pelanggan', 'pelanggan 94828', 'pelanggan94828@gmail.com', NULL, '$2y$10$nK704YRshVFFS3MT.JbXMeStkRP3fo7s0WHAlYzs2CwU1MMIcOBx.', 94828, 94828, 'Test Place', '22-05-1990', 'Jl. No 94828', NULL, 94828, 94828, 'belum', '', '2021-06-09 19:58:59', '2021-06-09 19:58:59'),
(160, 'pelanggan', 'pelanggan 59479', 'pelanggan59479@gmail.com', NULL, '$2y$10$YHQDv.yeoE4vLluiJ9G51OpQa/jh7jYDzcUZj8Z5eylcyVGavSUJi', 59479, 59479, 'Test Place', '22-05-1990', 'Jl. No 59479', NULL, 59479, 59479, 'belum', '', '2021-06-09 19:58:59', '2021-06-09 19:58:59'),
(161, 'pelanggan', 'pelanggan 17995', 'pelanggan17995@gmail.com', NULL, '$2y$10$Vep4GxiYew0bQscGxVPxhOenc5MdT5u0xcCFileodiDdonIXNHFdS', 17995, 17995, 'Test Place', '22-05-1990', 'Jl. No 17995', NULL, 17995, 17995, 'belum', '', '2021-06-09 19:58:59', '2021-06-09 19:58:59'),
(162, 'pelanggan', 'pelanggan 81639', 'pelanggan81639@gmail.com', NULL, '$2y$10$ldc4Rem0xXT9ZBZHpcc2VeVZm05BqoET4hW5jYgXX5zNSysX2Q1/6', 81639, 81639, 'Test Place', '22-05-1990', 'Jl. No 81639', NULL, 81639, 81639, 'belum', '', '2021-06-09 19:58:59', '2021-06-09 19:58:59'),
(163, 'pelanggan', 'pelanggan 31231', 'pelanggan31231@gmail.com', NULL, '$2y$10$oiu.beStDmf9BtafH3fnFO3GZls/aRw4N0COXNWOkpPpa8dCNRYY2', 31231, 31231, 'Test Place', '22-05-1990', 'Jl. No 31231', NULL, 31231, 31231, 'belum', '', '2021-06-09 19:58:59', '2021-06-09 19:58:59'),
(164, 'pelanggan', 'pelanggan 49389', 'pelanggan49389@gmail.com', NULL, '$2y$10$uqzP3MYtoOVm2qHzeF2BMuVeewj4P7XigttswXV9UFA9.isArMk/u', 49389, 49389, 'Test Place', '22-05-1990', 'Jl. No 49389', NULL, 49389, 49389, 'belum', '', '2021-06-09 19:58:59', '2021-06-09 19:58:59'),
(165, 'pelanggan', 'pelanggan 46769', 'pelanggan46769@gmail.com', NULL, '$2y$10$vXruKKx6zV.k/N4uc8AereRuLmeL1g6umHWFio5tK3WWLEGocwFp.', 46769, 46769, 'Test Place', '22-05-1990', 'Jl. No 46769', NULL, 46769, 46769, 'belum', '', '2021-06-09 19:58:59', '2021-06-09 19:58:59'),
(166, 'pelanggan', 'pelanggan 13665', 'pelanggan13665@gmail.com', NULL, '$2y$10$CXVBFWs8e42jMjIPWxqyv.E//.QX5ORn5WJ.yIRpziDW.E56ECzgu', 13665, 13665, 'Test Place', '22-05-1990', 'Jl. No 13665', NULL, 13665, 13665, 'belum', '', '2021-06-09 19:58:59', '2021-06-09 19:58:59'),
(167, 'pelanggan', 'pelanggan 47003', 'pelanggan47003@gmail.com', NULL, '$2y$10$shyXHbQ52oqkTMobWk9dX.94wFoY8cgp.M82wOXgJ.gqODk6jKqbG', 47003, 47003, 'Test Place', '22-05-1990', 'Jl. No 47003', NULL, 47003, 47003, 'belum', '', '2021-06-09 19:58:59', '2021-06-09 19:58:59'),
(168, 'pelanggan', 'pelanggan 2967', 'pelanggan2967@gmail.com', NULL, '$2y$10$juuK3P1t.txYd4VUexLX5eNbo4NuF48XABmUHxDfMeD7Phw/KCE3K', 2967, 2967, 'Test Place', '22-05-1990', 'Jl. No 2967', NULL, 2967, 2967, 'belum', '', '2021-06-09 19:58:59', '2021-06-09 19:58:59'),
(169, 'pelanggan', 'pelanggan 48696', 'pelanggan48696@gmail.com', NULL, '$2y$10$ipM2vbJS.w4ENUI9221dIOoO7oxwoWwMfvF/G1eLsuAR7mgQxwBzm', 48696, 48696, 'Test Place', '22-05-1990', 'Jl. No 48696', NULL, 48696, 48696, 'belum', '', '2021-06-09 19:58:59', '2021-06-09 19:58:59'),
(170, 'pelanggan', 'pelanggan 43353', 'pelanggan43353@gmail.com', NULL, '$2y$10$GgsecIaEjWw0yofwwomB3.BAMtA.9p5kC8BaK/BnnIYAjfCmW9XGm', 43353, 43353, 'Test Place', '22-05-1990', 'Jl. No 43353', NULL, 43353, 43353, 'belum', '', '2021-06-09 19:58:59', '2021-06-09 19:58:59'),
(171, 'pelanggan', 'pelanggan 45216', 'pelanggan45216@gmail.com', NULL, '$2y$10$.AIlBu2OwuzNbQuHrhuWgOqsR71rgN7jijURflcFw3zhMOjW706LK', 45216, 45216, 'Test Place', '22-05-1990', 'Jl. No 45216', NULL, 45216, 45216, 'belum', '', '2021-06-09 19:58:59', '2021-06-09 19:58:59'),
(172, 'pelanggan', 'pelanggan 45600', 'pelanggan45600@gmail.com', NULL, '$2y$10$8ZYIxcJ60lD.jX4WUeeKmO8SJjMFBam9GiUEj9p28HX9sIsJgyhfW', 45600, 45600, 'Test Place', '22-05-1990', 'Jl. No 45600', NULL, 45600, 45600, 'belum', '', '2021-06-09 19:59:00', '2021-06-09 19:59:00'),
(173, 'pelanggan', 'pelanggan 26248', 'pelanggan26248@gmail.com', NULL, '$2y$10$JrWUy4LgQiJYsxTSvd/Rme4GMH5k/7mYOFvVpRx8PlT3mgC/jd1Si', 26248, 26248, 'Test Place', '22-05-1990', 'Jl. No 26248', NULL, 26248, 26248, 'belum', '', '2021-06-09 19:59:00', '2021-06-09 19:59:00'),
(174, 'pelanggan', 'pelanggan 40965', 'pelanggan40965@gmail.com', NULL, '$2y$10$/1G1..eOFQBJ1GZtqD3EcemruVtNgoYsMoAWMKVBm8BAG0Z3FKYxK', 40965, 40965, 'Test Place', '22-05-1990', 'Jl. No 40965', NULL, 40965, 40965, 'belum', '', '2021-06-09 19:59:00', '2021-06-09 19:59:00'),
(175, 'pelanggan', 'pelanggan 26082', 'pelanggan26082@gmail.com', NULL, '$2y$10$KjAAtKiujM5NGUBdo658Su6DLTMLLc4RKTOJdK0qXTliRcP9nC5eC', 26082, 26082, 'Test Place', '22-05-1990', 'Jl. No 26082', NULL, 26082, 26082, 'belum', '', '2021-06-09 19:59:00', '2021-06-09 19:59:00'),
(176, 'pelanggan', 'pelanggan 70572', 'pelanggan70572@gmail.com', NULL, '$2y$10$2HYcYwo2mfvvYqti5WG8TOG5vYWUiE90TbwhCxeIdEomzwn/MVZdO', 70572, 70572, 'Test Place', '22-05-1990', 'Jl. No 70572', NULL, 70572, 70572, 'belum', '', '2021-06-09 19:59:00', '2021-06-09 19:59:00'),
(177, 'pelanggan', 'pelanggan 32050', 'pelanggan32050@gmail.com', NULL, '$2y$10$ZOdYiwRB7X4RCjf1A6Cli.sMvqNhCbSwPdGqzd/bWfInWfKq8.ed.', 32050, 32050, 'Test Place', '22-05-1990', 'Jl. No 32050', NULL, 32050, 32050, 'belum', '', '2021-06-09 19:59:00', '2021-06-09 19:59:00'),
(178, 'pelanggan', 'pelanggan 64370', 'pelanggan64370@gmail.com', NULL, '$2y$10$W2EVeJiTireHOioAn8DIQuF2RAcfD2IqeOQqvEVsvtfIrjEUXeYtm', 64370, 64370, 'Test Place', '22-05-1990', 'Jl. No 64370', NULL, 64370, 64370, 'belum', '', '2021-06-09 19:59:00', '2021-06-09 19:59:00'),
(179, 'pelanggan', 'pelanggan 95938', 'pelanggan95938@gmail.com', NULL, '$2y$10$gQmBlEI83.RzKlY6XyBKAeqkqxJ6YYRpZzuBtRKteWw5WJ8d8hnPS', 95938, 95938, 'Test Place', '22-05-1990', 'Jl. No 95938', NULL, 95938, 95938, 'belum', '', '2021-06-09 19:59:00', '2021-06-09 19:59:00'),
(180, 'pelanggan', 'pelanggan 55456', 'pelanggan55456@gmail.com', NULL, '$2y$10$2NQsNVOHC.6SET27AYJEpuNPCy2Akut2ioNaVb7X6OdDrfb84kQxG', 55456, 55456, 'Test Place', '22-05-1990', 'Jl. No 55456', NULL, 55456, 55456, 'belum', '', '2021-06-09 19:59:00', '2021-06-09 19:59:00'),
(181, 'pelanggan', 'pelanggan 9303', 'pelanggan9303@gmail.com', NULL, '$2y$10$Xw0vfhDbrGes71XpuHLm2OaTxz7Fb2jt5vmzuA61PaIvxsy.d4KCq', 9303, 9303, 'Test Place', '22-05-1990', 'Jl. No 9303', NULL, 9303, 9303, 'belum', '', '2021-06-09 19:59:00', '2021-06-09 19:59:00'),
(182, 'pelanggan', 'pelanggan 60141', 'pelanggan60141@gmail.com', NULL, '$2y$10$wLxiHbW0rbwqWOoeOVZ9b.98RAbS8.z6QMpvG5DnzRuEiIhsN95Sy', 60141, 60141, 'Test Place', '22-05-1990', 'Jl. No 60141', NULL, 60141, 60141, 'belum', '', '2021-06-09 19:59:00', '2021-06-09 19:59:00'),
(183, 'pelanggan', 'pelanggan 44800', 'pelanggan44800@gmail.com', NULL, '$2y$10$n3N91KLza1ut31rtP30yeOoWQqbvw0ZRtDWytyn1UESZYZQf3w/7S', 44800, 44800, 'Test Place', '22-05-1990', 'Jl. No 44800', NULL, 44800, 44800, 'belum', '', '2021-06-09 19:59:00', '2021-06-09 19:59:00'),
(184, 'pelanggan', 'pelanggan 97045', 'pelanggan97045@gmail.com', NULL, '$2y$10$g8SUTzMa2DLU86kujMbdTOpluWd4TStrwaIGOku1ZR4gHiKCNjL6C', 97045, 97045, 'Test Place', '22-05-1990', 'Jl. No 97045', NULL, 97045, 97045, 'belum', '', '2021-06-09 19:59:00', '2021-06-09 19:59:00'),
(185, 'pelanggan', 'pelanggan 34456', 'pelanggan34456@gmail.com', NULL, '$2y$10$ROOdDwuW7lJuCF8jX7eYSOnWKz9W0ly0nJ6Q/Rics.j8vKZT2ckQO', 34456, 34456, 'Test Place', '22-05-1990', 'Jl. No 34456', NULL, 34456, 34456, 'belum', '', '2021-06-09 19:59:00', '2021-06-09 19:59:00'),
(186, 'pelanggan', 'pelanggan 85461', 'pelanggan85461@gmail.com', NULL, '$2y$10$lGFTcE/6fpzw05yyu/7Cbeta9o3S9MynCXzISDiV0m0M8P7zINr/O', 85461, 85461, 'Test Place', '22-05-1990', 'Jl. No 85461', NULL, 85461, 85461, 'belum', '', '2021-06-09 19:59:00', '2021-06-09 19:59:00'),
(187, 'pelanggan', 'pelanggan 22858', 'pelanggan22858@gmail.com', NULL, '$2y$10$3NQLeXFMIXaAeU4WnOa6qO9yGRYERaYYnc3vmZsB97/MS.rKfOpNm', 22858, 22858, 'Test Place', '22-05-1990', 'Jl. No 22858', NULL, 22858, 22858, 'belum', '', '2021-06-09 19:59:00', '2021-06-09 19:59:00'),
(188, 'pelanggan', 'pelanggan 9166', 'pelanggan9166@gmail.com', NULL, '$2y$10$mnQWhq2E0ClFsvtEeuWTj.in3zGgmAecROasme/SUxD7g6ZOPSEqC', 9166, 9166, 'Test Place', '22-05-1990', 'Jl. No 9166', NULL, 9166, 9166, 'belum', '', '2021-06-09 19:59:00', '2021-06-09 19:59:00'),
(189, 'pelanggan', 'pelanggan 94708', 'pelanggan94708@gmail.com', NULL, '$2y$10$rD5nnycSCBY8YNVokidTF.gIs7UeS1MA04jAibg2wBvKnE2SbdbL2', 94708, 94708, 'Test Place', '22-05-1990', 'Jl. No 94708', NULL, 94708, 94708, 'belum', '', '2021-06-09 19:59:00', '2021-06-09 19:59:00'),
(190, 'pelanggan', 'pelanggan 88413', 'pelanggan88413@gmail.com', NULL, '$2y$10$mk7T55DilaOs89yYWX//qubYM8BIX4/U9UDPTxdDc9dgnBrnSWAD6', 88413, 88413, 'Test Place', '22-05-1990', 'Jl. No 88413', NULL, 88413, 88413, 'belum', '', '2021-06-09 19:59:00', '2021-06-09 19:59:00'),
(191, 'pelanggan', 'pelanggan 75578', 'pelanggan75578@gmail.com', NULL, '$2y$10$ougjCViMHw4/PJFdDe5Rb.Ug7nUWnDn.XVRuGTdgwLlWZ4DvNjZhq', 75578, 75578, 'Test Place', '22-05-1990', 'Jl. No 75578', NULL, 75578, 75578, 'belum', '', '2021-06-09 19:59:01', '2021-06-09 19:59:01'),
(192, 'pelanggan', 'pelanggan 34999', 'pelanggan34999@gmail.com', NULL, '$2y$10$.i4uJHNuBjU1MontTi4gUu1xqy.9oRn92SA5AsgQDrn2AQQb3SJh.', 34999, 34999, 'Test Place', '22-05-1990', 'Jl. No 34999', NULL, 34999, 34999, 'belum', '', '2021-06-09 19:59:01', '2021-06-09 19:59:01'),
(193, 'pelanggan', 'pelanggan 35602', 'pelanggan35602@gmail.com', NULL, '$2y$10$54u4EqUa6/zkZQK/YZTRJOkLjWF9vVUmbMh48gvM8kbN.AtXN/5Rq', 35602, 35602, 'Test Place', '22-05-1990', 'Jl. No 35602', NULL, 35602, 35602, 'belum', '', '2021-06-09 19:59:01', '2021-06-09 19:59:01'),
(194, 'pelanggan', 'pelanggan 47646', 'pelanggan47646@gmail.com', NULL, '$2y$10$OcU1Uwn0RJSwHGFqEQ6Bw.2rkx3QdTKibq9hXWdwrmF3JP969bBp2', 47646, 47646, 'Test Place', '22-05-1990', 'Jl. No 47646', NULL, 47646, 47646, 'belum', '', '2021-06-09 19:59:01', '2021-06-09 19:59:01'),
(195, 'pelanggan', 'pelanggan 60765', 'pelanggan60765@gmail.com', NULL, '$2y$10$DHLVywP.foS35SE2D86LLu7BNYXqiskvPidiZnK2QfgvSKEvA4qyO', 60765, 60765, 'Test Place', '22-05-1990', 'Jl. No 60765', NULL, 60765, 60765, 'belum', '', '2021-06-09 19:59:01', '2021-06-09 19:59:01'),
(196, 'pelanggan', 'pelanggan 49466', 'pelanggan49466@gmail.com', NULL, '$2y$10$.qHRCskp6WV.P4HK5WvW3OfcILQiymwQOREpO9r/.34MTbV64Kpwi', 49466, 49466, 'Test Place', '22-05-1990', 'Jl. No 49466', NULL, 49466, 49466, 'belum', '', '2021-06-09 19:59:01', '2021-06-09 19:59:01'),
(197, 'pelanggan', 'pelanggan 71069', 'pelanggan71069@gmail.com', NULL, '$2y$10$GpcpxhXPYpiSMGyDqOrxqOyaZOobVqIHHBH1kKw5u5oieyi5zbI52', 71069, 71069, 'Test Place', '22-05-1990', 'Jl. No 71069', NULL, 71069, 71069, 'belum', '', '2021-06-09 19:59:01', '2021-06-09 19:59:01');
INSERT INTO `users` (`id`, `role`, `name`, `email`, `email_verified_at`, `password`, `nik`, `kk`, `tem_lahir`, `tgl_lahir`, `alamat`, `uk_meter`, `debit_air`, `hrg`, `belum_bayar`, `remember_token`, `created_at`, `updated_at`) VALUES
(198, 'pelanggan', 'pelanggan 92424', 'pelanggan92424@gmail.com', NULL, '$2y$10$RqyA1nprGRGg.PW5eAHFZujwxUan2yqFkkxxz81OQLASxd.XPvE4O', 92424, 92424, 'Test Place', '22-05-1990', 'Jl. No 92424', NULL, 92424, 92424, 'belum', '', '2021-06-09 19:59:01', '2021-06-09 19:59:01'),
(199, 'pelanggan', 'pelanggan 46712', 'pelanggan46712@gmail.com', NULL, '$2y$10$z3boqnvKtLzNNPtRhw8rT.jJAO7RklVpK9SYekBnIReYZ47uRzWuW', 46712, 46712, 'Test Place', '22-05-1990', 'Jl. No 46712', NULL, 46712, 46712, 'belum', '', '2021-06-09 19:59:01', '2021-06-09 19:59:01'),
(200, 'pelanggan', 'pelanggan 20315', 'pelanggan20315@gmail.com', NULL, '$2y$10$8iqCWJUBeBjM9CHyIIswt.N2m0XXvhHFhqTmhrCcR2.dwQorlExYq', 20315, 20315, 'Test Place', '22-05-1990', 'Jl. No 20315', NULL, 20315, 20315, 'belum', '', '2021-06-09 19:59:01', '2021-06-09 19:59:01'),
(201, 'pelanggan', 'pelanggan 61631', 'pelanggan61631@gmail.com', NULL, '$2y$10$j84uiLUyf.Vl3lsB8RWNBe/vg1SGrlPluGOB2JER..qZDsm27EWMe', 61631, 61631, 'Test Place', '22-05-1990', 'Jl. No 61631', NULL, 61631, 61631, 'belum', '', '2021-06-09 19:59:01', '2021-06-09 19:59:01'),
(202, 'pelanggan', 'pelanggan 54060', 'pelanggan54060@gmail.com', NULL, '$2y$10$8r2gRxOGjr8iepuGzadU3etIrNVYJXl1gkbyep0VyhYQzKSVXyLrO', 54060, 54060, 'Test Place', '22-05-1990', 'Jl. No 54060', NULL, 54060, 54060, 'belum', '', '2021-06-09 19:59:01', '2021-06-09 19:59:01'),
(203, 'pelanggan', 'pelanggan 81018', 'pelanggan81018@gmail.com', NULL, '$2y$10$GTDT9QvGeF.s5bSFT2YW3eXp5tUnEAufgapJYQkCRwSVcON1jCUua', 81018, 81018, 'Test Place', '22-05-1990', 'Jl. No 81018', NULL, 81018, 81018, 'belum', '', '2021-06-09 19:59:01', '2021-06-09 19:59:01'),
(204, 'pelanggan', 'pelanggan 8382', 'pelanggan8382@gmail.com', NULL, '$2y$10$ssSVrXNvijkL6ca/TkWhzuI3g5i/X1xQOa51cVwuHREivbmQpTs3S', 8382, 8382, 'Test Place', '22-05-1990', 'Jl. No 8382', NULL, 8382, 8382, 'belum', '', '2021-06-09 19:59:01', '2021-06-09 19:59:01'),
(205, 'pelanggan', 'pelanggan 24770', 'pelanggan24770@gmail.com', NULL, '$2y$10$UFWH4dOGCtPzTL/e37DpAO4Z1rPhtDokhEQXkmKEOdXmM.WP34oJe', 24770, 24770, 'Test Place', '22-05-1990', 'Jl. No 24770', NULL, 24770, 24770, 'belum', '', '2021-06-09 19:59:01', '2021-06-09 19:59:01'),
(206, 'pelanggan', 'pelanggan 72804', 'pelanggan72804@gmail.com', NULL, '$2y$10$zvKBqvebh8B45vmJTJJ9ae0U.I016QCTelm4zdznaE0DG/SRLpNO6', 72804, 72804, 'Test Place', '22-05-1990', 'Jl. No 72804', NULL, 72804, 72804, 'belum', '', '2021-06-09 19:59:01', '2021-06-09 19:59:01'),
(207, 'pelanggan', 'pelanggan 38223', 'pelanggan38223@gmail.com', NULL, '$2y$10$fNsVRBomsFhP6SnM.D4/6O8TLEhRnWodDdSTe2ORc/I/ME8iPmdCe', 38223, 38223, 'Test Place', '22-05-1990', 'Jl. No 38223', NULL, 38223, 38223, 'belum', '', '2021-06-09 19:59:01', '2021-06-09 19:59:01'),
(208, 'pelanggan', 'pelanggan 87905', 'pelanggan87905@gmail.com', NULL, '$2y$10$xZKNQlzzlQtPjsHD4OLOYuSDZ9ysixXY.F4sPpkqnChwLYkTYqbHS', 87905, 87905, 'Test Place', '22-05-1990', 'Jl. No 87905', NULL, 87905, 87905, 'belum', '', '2021-06-09 19:59:01', '2021-06-09 19:59:01'),
(209, 'pelanggan', 'pelanggan 70081', 'pelanggan70081@gmail.com', NULL, '$2y$10$abwatmt0GSDkBiVnRPxYRu57mS80Ccse/TF99s0x8MB8aJPJ2MQAi', 70081, 70081, 'Test Place', '22-05-1990', 'Jl. No 70081', NULL, 70081, 70081, 'belum', '', '2021-06-09 19:59:02', '2021-06-09 19:59:02'),
(210, 'pelanggan', 'pelanggan 9519', 'pelanggan9519@gmail.com', NULL, '$2y$10$HT33Q.2xNLFj/H8D9vZ30.cG8K0LJSyHPXJwjZY7Let.tvUiR4aV2', 9519, 9519, 'Test Place', '22-05-1990', 'Jl. No 9519', NULL, 9519, 9519, 'belum', '', '2021-06-09 19:59:02', '2021-06-09 19:59:02'),
(211, 'pelanggan', 'pelanggan 1259', 'pelanggan1259@gmail.com', NULL, '$2y$10$.Y3b9RhFk0UNThaYPTItkOUQ9mTxYCpH1PsFv0aPyMOcEBfFUpdrO', 1259, 1259, 'Test Place', '22-05-1990', 'Jl. No 1259', NULL, 1259, 1259, 'belum', '', '2021-06-09 19:59:02', '2021-06-09 19:59:02'),
(212, 'pelanggan', 'pelanggan 35226', 'pelanggan35226@gmail.com', NULL, '$2y$10$bwThE9ozIU1GUu0tcmxJ9urZnYSx3EQfyrMvNCOaSe1B2uXK5JLV.', 35226, 35226, 'Test Place', '22-05-1990', 'Jl. No 35226', NULL, 35226, 35226, 'belum', '', '2021-06-09 19:59:02', '2021-06-09 19:59:02'),
(213, 'pelanggan', 'pelanggan 45734', 'pelanggan45734@gmail.com', NULL, '$2y$10$UMobLYS0.fyw4Ii1Wq9vo.y5755scxLwBSy57Lz7OOzW6PWkOutBS', 45734, 45734, 'Test Place', '22-05-1990', 'Jl. No 45734', NULL, 45734, 45734, 'belum', '', '2021-06-09 19:59:02', '2021-06-09 19:59:02'),
(214, 'pelanggan', 'pelanggan 90899', 'pelanggan90899@gmail.com', NULL, '$2y$10$ru3WaJ4Aw4FgU1Hu.uP7s.39JfmhTyIUMBgf9qf/jlOWXLuHWnCaa', 90899, 90899, 'Test Place', '22-05-1990', 'Jl. No 90899', NULL, 90899, 90899, 'belum', '', '2021-06-09 19:59:02', '2021-06-09 19:59:02'),
(215, 'pelanggan', 'pelanggan 29035', 'pelanggan29035@gmail.com', NULL, '$2y$10$E3YZNlJ7F1YlzBzL.TfaROhjiGtliu0VHuGY5FT7Q/xjPSpwSdxu2', 29035, 29035, 'Test Place', '22-05-1990', 'Jl. No 29035', NULL, 29035, 29035, 'belum', '', '2021-06-09 19:59:02', '2021-06-09 19:59:02'),
(216, 'pelanggan', 'pelanggan 2711', 'pelanggan2711@gmail.com', NULL, '$2y$10$HEDcn1me2bD7OqVjAKKjnur8Vv92fzZ583cazskvTKcXcVInmKWAe', 2711, 2711, 'Test Place', '22-05-1990', 'Jl. No 2711', NULL, 2711, 2711, 'belum', '', '2021-06-09 19:59:02', '2021-06-09 19:59:02'),
(217, 'pelanggan', 'pelanggan 78897', 'pelanggan78897@gmail.com', NULL, '$2y$10$JwJtCT18lL0RRMTrrheZg.MM3KACGr5I81fXBC3tY5Or.LHdxwZQC', 78897, 78897, 'Test Place', '22-05-1990', 'Jl. No 78897', NULL, 78897, 78897, 'belum', '', '2021-06-09 19:59:02', '2021-06-09 19:59:02'),
(218, 'pelanggan', 'pelanggan 4169', 'pelanggan4169@gmail.com', NULL, '$2y$10$mbrGdjDjzJpv9DpyQQBITuCblLqsI6ok8UVcxp5pxSNObO0qr6Z9K', 4169, 4169, 'Test Place', '22-05-1990', 'Jl. No 4169', NULL, 4169, 4169, 'belum', '', '2021-06-09 19:59:02', '2021-06-09 19:59:02'),
(219, 'pelanggan', 'pelanggan 88968', 'pelanggan88968@gmail.com', NULL, '$2y$10$Lfujxiop0KtedLm.EWs4feuX2XgSspJd3.qnY1Bzisb7oFzrtS3l2', 88968, 88968, 'Test Place', '22-05-1990', 'Jl. No 88968', NULL, 88968, 88968, 'belum', '', '2021-06-09 19:59:02', '2021-06-09 19:59:02'),
(220, 'pelanggan', 'pelanggan 91660', 'pelanggan91660@gmail.com', NULL, '$2y$10$UmBlDmo5j0V3y5xh7szqgOTpUENsWJTg0ZmYz7r3nksGs9KY7Sx3e', 91660, 91660, 'Test Place', '22-05-1990', 'Jl. No 91660', NULL, 91660, 91660, 'belum', '', '2021-06-09 19:59:02', '2021-06-09 19:59:02'),
(221, 'pelanggan', 'pelanggan 93925', 'pelanggan93925@gmail.com', NULL, '$2y$10$j9a8Pw64e4H5MXsv.HL4xeJqOlsNmt6ZDkFj2Isc9V4kpLtx/.ye2', 93925, 93925, 'Test Place', '22-05-1990', 'Jl. No 93925', NULL, 93925, 93925, 'belum', '', '2021-06-09 19:59:02', '2021-06-09 19:59:02'),
(222, 'pelanggan', 'pelanggan 48846', 'pelanggan48846@gmail.com', NULL, '$2y$10$hNz3VG2qWJjAjQM.WHfPDe2ChX0EcEs.bfj6GBFEVF6G6tkxEKLFm', 48846, 48846, 'Test Place', '22-05-1990', 'Jl. No 48846', NULL, 48846, 48846, 'belum', '', '2021-06-09 19:59:02', '2021-06-09 19:59:02'),
(223, 'pelanggan', 'pelanggan 61147', 'pelanggan61147@gmail.com', NULL, '$2y$10$yylhEFL7Dzebu.HckNnttOlfHmXd9gMvLfZLvX6XgO8IYPKPG.Mb.', 61147, 61147, 'Test Place', '22-05-1990', 'Jl. No 61147', NULL, 61147, 61147, 'belum', '', '2021-06-09 19:59:02', '2021-06-09 19:59:02'),
(224, 'pelanggan', 'pelanggan 79862', 'pelanggan79862@gmail.com', NULL, '$2y$10$stZDxpLXUs.fg.R0yJvcSeaO2cdrnZHbvS6TUfzc6Rg6RoMG/Dx2e', 79862, 79862, 'Test Place', '22-05-1990', 'Jl. No 79862', NULL, 79862, 79862, 'belum', '', '2021-06-09 19:59:02', '2021-06-09 19:59:02'),
(225, 'pelanggan', 'pelanggan 41400', 'pelanggan41400@gmail.com', NULL, '$2y$10$COFatUsHl0WStxAFgzg63OJD7CUcPaIuDa7OivX5KzIZ/WsFsQh7m', 41400, 41400, 'Test Place', '22-05-1990', 'Jl. No 41400', NULL, 41400, 41400, 'belum', '', '2021-06-09 19:59:02', '2021-06-09 19:59:02'),
(226, 'pelanggan', 'pelanggan 72080', 'pelanggan72080@gmail.com', NULL, '$2y$10$GcrvpewkqnYFHtA1x/Y/ie5yRjhWwGwiwe5pTSMqZ95a4zqn8H.F2', 72080, 72080, 'Test Place', '22-05-1990', 'Jl. No 72080', NULL, 72080, 72080, 'belum', '', '2021-06-09 19:59:02', '2021-06-09 19:59:02'),
(227, 'pelanggan', 'pelanggan 84242', 'pelanggan84242@gmail.com', NULL, '$2y$10$agE1BXdIPUNElyx5RWVe0OpDyWTrO2WpidgWZiDJTusoJ.cuWDpnW', 84242, 84242, 'Test Place', '22-05-1990', 'Jl. No 84242', NULL, 84242, 84242, 'belum', '', '2021-06-09 19:59:02', '2021-06-09 19:59:02'),
(228, 'pelanggan', 'pelanggan 32595', 'pelanggan32595@gmail.com', NULL, '$2y$10$J2D8IYjKHbK4mEZd45.p8OSPkt0ZqdH9t4.PrJRZV1WYSque1lO4q', 32595, 32595, 'Test Place', '22-05-1990', 'Jl. No 32595', NULL, 32595, 32595, 'belum', '', '2021-06-09 19:59:03', '2021-06-09 19:59:03'),
(229, 'pelanggan', 'pelanggan 47484', 'pelanggan47484@gmail.com', NULL, '$2y$10$tTzBBSP4V9mhJdygM/du6eDk0qh6.PEKAqJGRLpS0aUQjNIhz4qoC', 47484, 47484, 'Test Place', '22-05-1990', 'Jl. No 47484', NULL, 47484, 47484, 'belum', '', '2021-06-09 19:59:03', '2021-06-09 19:59:03'),
(230, 'pelanggan', 'pelanggan 7673', 'pelanggan7673@gmail.com', NULL, '$2y$10$yEnrDDpIW8d76L6Gkbp5ZuhDq/SRS/sDSBdwFhkuTKe9Tmm9RZZBC', 7673, 7673, 'Test Place', '22-05-1990', 'Jl. No 7673', NULL, 7673, 7673, 'belum', '', '2021-06-09 19:59:03', '2021-06-09 19:59:03'),
(231, 'pelanggan', 'pelanggan 17755', 'pelanggan17755@gmail.com', NULL, '$2y$10$Qe4ZPK/n/G7LM3dLBZ4ZZeV48.tYbVFGHzPBoljvMeAcRyH4N7IAG', 17755, 17755, 'Test Place', '22-05-1990', 'Jl. No 17755', NULL, 17755, 17755, 'belum', '', '2021-06-09 19:59:03', '2021-06-09 19:59:03'),
(232, 'pelanggan', 'pelanggan 79392', 'pelanggan79392@gmail.com', NULL, '$2y$10$5/VMrZHyGkmRn.Ep09BljepaawH6sq5NZTdChnYTtUd7IfxzRZhKi', 79392, 79392, 'Test Place', '22-05-1990', 'Jl. No 79392', NULL, 79392, 79392, 'belum', '', '2021-06-09 19:59:03', '2021-06-09 19:59:03'),
(233, 'pelanggan', 'pelanggan 88771', 'pelanggan88771@gmail.com', NULL, '$2y$10$qs8aMi.lnenjeKl7S9V46uof/8ZbDn8n6nI1pUrM9E8gPzyCvXi/S', 88771, 88771, 'Test Place', '22-05-1990', 'Jl. No 88771', NULL, 88771, 88771, 'belum', '', '2021-06-09 19:59:03', '2021-06-09 19:59:03'),
(234, 'pelanggan', 'pelanggan 99243', 'pelanggan99243@gmail.com', NULL, '$2y$10$KvX20DeqyicDAh/SarfkdeuVFnqL28AFAo/MIH5CdXm2UAK.JXp7K', 99243, 99243, 'Test Place', '22-05-1990', 'Jl. No 99243', NULL, 99243, 99243, 'belum', '', '2021-06-09 19:59:03', '2021-06-09 19:59:03'),
(235, 'pelanggan', 'pelanggan 77442', 'pelanggan77442@gmail.com', NULL, '$2y$10$LFUFhNMLG58ywrzfHNtgz.G9If41FI5gpBVYmsxPY5Gk98tpeOr6u', 77442, 77442, 'Test Place', '22-05-1990', 'Jl. No 77442', NULL, 77442, 77442, 'belum', '', '2021-06-09 19:59:03', '2021-06-09 19:59:03'),
(236, 'pelanggan', 'pelanggan 25325', 'pelanggan25325@gmail.com', NULL, '$2y$10$TFqmVXEXwVJiBrdLzgQtcOflIzpa0WldOOihpGb21z49pAzNjpQ.u', 25325, 25325, 'Test Place', '22-05-1990', 'Jl. No 25325', NULL, 25325, 25325, 'belum', '', '2021-06-09 19:59:03', '2021-06-09 19:59:03'),
(237, 'pelanggan', 'pelanggan 78213', 'pelanggan78213@gmail.com', NULL, '$2y$10$jHOQ52JdEwck7Mm5w9jN2.DMgnIcYaYVUkghR7atM9ROJoIPd99Am', 78213, 78213, 'Test Place', '22-05-1990', 'Jl. No 78213', NULL, 78213, 78213, 'belum', '', '2021-06-09 19:59:03', '2021-06-09 19:59:03'),
(238, 'pelanggan', 'pelanggan 81251', 'pelanggan81251@gmail.com', NULL, '$2y$10$LMsnIJlgatqoPayy6.g7WuDO0bmG6qZIBSApvzj1mAE3gXQKakaHK', 81251, 81251, 'Test Place', '22-05-1990', 'Jl. No 81251', NULL, 81251, 81251, 'belum', '', '2021-06-09 19:59:03', '2021-06-09 19:59:03'),
(239, 'pelanggan', 'pelanggan 1562', 'pelanggan1562@gmail.com', NULL, '$2y$10$p5FCl6hkv2lAv8Fm10D6Quh8A4tAGhnJhizTlwR4HrPJVks/GCqn2', 1562, 1562, 'Test Place', '22-05-1990', 'Jl. No 1562', NULL, 1562, 1562, 'belum', '', '2021-06-09 19:59:03', '2021-06-09 19:59:03'),
(240, 'pelanggan', 'pelanggan 38191', 'pelanggan38191@gmail.com', NULL, '$2y$10$fJF.nT26xcwwWe9SYHIpDe39fWGTcU0EekcBsXwX7Khu4ZC/UkKf2', 38191, 38191, 'Test Place', '22-05-1990', 'Jl. No 38191', NULL, 38191, 38191, 'belum', '', '2021-06-09 19:59:03', '2021-06-09 19:59:03'),
(241, 'pelanggan', 'pelanggan 83693', 'pelanggan83693@gmail.com', NULL, '$2y$10$I7xzaCL6h84AewuaW3hHzu8Jn7062HrYFh19sKOhQbYZT7LjCV4yG', 83693, 83693, 'Test Place', '22-05-1990', 'Jl. No 83693', NULL, 83693, 83693, 'belum', '', '2021-06-09 19:59:03', '2021-06-09 19:59:03'),
(242, 'pelanggan', 'pelanggan 12468', 'pelanggan12468@gmail.com', NULL, '$2y$10$lmS2QSG6hORllHUZ07L9w.aKQY6X/Akp6meQEXfjM29lxF19ecFGq', 12468, 12468, 'Test Place', '22-05-1990', 'Jl. No 12468', NULL, 12468, 12468, 'belum', '', '2021-06-09 19:59:03', '2021-06-09 19:59:03'),
(243, 'pelanggan', 'pelanggan 79140', 'pelanggan79140@gmail.com', NULL, '$2y$10$pN9SsnREAbI4QB/F1oVWvOc6U/T6TJnyhcHik8KDnw3WdH1lcBX8C', 79140, 79140, 'Test Place', '22-05-1990', 'Jl. No 79140', NULL, 79140, 79140, 'belum', '', '2021-06-09 19:59:03', '2021-06-09 19:59:03'),
(244, 'pelanggan', 'pelanggan 78757', 'pelanggan78757@gmail.com', NULL, '$2y$10$hNCX8SI4qhpKz6a4oQzY9ODPHByfues3WVVwqTvgXMFheRcOujiMm', 78757, 78757, 'Test Place', '22-05-1990', 'Jl. No 78757', NULL, 78757, 78757, 'belum', '', '2021-06-09 19:59:03', '2021-06-09 19:59:03'),
(245, 'pelanggan', 'pelanggan 74053', 'pelanggan74053@gmail.com', NULL, '$2y$10$Mptuz20kGpwc5HlrZ.Vbj.JhrxyoI9.EeDsongAmwUqYcV.2P1i/2', 74053, 74053, 'Test Place', '22-05-1990', 'Jl. No 74053', NULL, 74053, 74053, 'belum', '', '2021-06-09 19:59:03', '2021-06-09 19:59:03'),
(246, 'pelanggan', 'pelanggan 36445', 'pelanggan36445@gmail.com', NULL, '$2y$10$6IF9fiQ7/iDs/8pIo9wI0eK7JxZm1M1utq6Wu9glyVh3ihHfFsxxq', 36445, 36445, 'Test Place', '22-05-1990', 'Jl. No 36445', NULL, 36445, 36445, 'belum', '', '2021-06-09 19:59:03', '2021-06-09 19:59:03'),
(247, 'pelanggan', 'pelanggan 37807', 'pelanggan37807@gmail.com', NULL, '$2y$10$egAl02.gXoghz1p5l/ySyO9F7b8cCJPbhtdF5X90n26aVuRyu4zeu', 37807, 37807, 'Test Place', '22-05-1990', 'Jl. No 37807', NULL, 37807, 37807, 'belum', '', '2021-06-09 19:59:04', '2021-06-09 19:59:04'),
(248, 'admin', 'admin', 'admin@gmail.com', NULL, '$2y$10$rlBIA2n6ynInsuFaOPPeVuPeI/NIJoz1Ny0.1spQJ0WnA1Thx.Mhq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-11 01:57:03', '2021-06-11 01:57:03'),
(249, 'pelanggan', 'pelanggan jabbar', 'pelanggan@gmail.com', NULL, '$2y$10$DV90pLt/6g3dB3RB/65M5e0yr69ggloWBUn7e6JeOPMWyocUjIaMe', NULL, NULL, NULL, NULL, NULL, NULL, 20, 1000, NULL, NULL, '2021-06-14 08:03:58', '2021-06-15 08:44:47'),
(250, 'pelanggan', 'pelanggan iksan', 'pelangganiksan@gmail.com', NULL, '$2y$10$wl6PL7Kv5FbYffsy.85/guK7kOU8Q2txsQAm2nwz50umHIkJqj7vu', 321, 3214, 'Majalengka', '35423', 'Jl. No 29339', 2, 100, 200, '300', NULL, '2021-06-15 10:14:43', '2021-06-15 10:14:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `debit_air`
--
ALTER TABLE `debit_air`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `tranksaksi`
--
ALTER TABLE `tranksaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_nik_unique` (`nik`),
  ADD UNIQUE KEY `users_kk_unique` (`kk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `debit_air`
--
ALTER TABLE `debit_air`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tranksaksi`
--
ALTER TABLE `tranksaksi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;ß