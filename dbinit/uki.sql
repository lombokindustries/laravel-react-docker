-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 08, 2024 at 07:17 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uki`
--

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
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `usd` longtext NOT NULL,
  `lastsync` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `usd`, `lastsync`, `created_at`, `updated_at`) VALUES
(1, '{\"1000sats\":3267.31384412,\"1inch\":3.91786492,\"aave\":0.0077545544,\"ada\":3.05971489,\"aed\":3.6725,\"afn\":70.23150711,\"agix\":2.15502566,\"akt\":0.44402747,\"algo\":8.48402857,\"all\":89.73838308,\"amd\":387.30478503,\"amp\":268.87146436,\"ang\":1.79215873,\"aoa\":929.57818238,\"ape\":1.53741412,\"apt\":0.1724259,\"ar\":0.047499083,\"arb\":2.00468015,\"ars\":953.86292847,\"atom\":0.25632199,\"ats\":12.38376918,\"aud\":1.48501403,\"avax\":0.046670453,\"awg\":1.79,\"axs\":0.22514941,\"azm\":8499.82462179,\"azn\":1.69996492,\"bake\":4.21517326,\"bam\":1.76017582,\"bat\":6.33296378,\"bbd\":2,\"bch\":0.0032527042,\"bdt\":119.51502993,\"bef\":36.30444178,\"bgn\":1.76017582,\"bhd\":0.376,\"bif\":2885.50962768,\"bmd\":1,\"bnb\":0.0019887991,\"bnd\":1.29991754,\"bob\":6.90707283,\"brl\":5.56893717,\"bsd\":1,\"bsv\":0.022086821,\"bsw\":12.58505482,\"btc\":0.0000177709,\"btcb\":4.24905353,\"btg\":0.047338994,\"btn\":83.98731327,\"btt\":1269467.77642562,\"busd\":1.00020793,\"bwp\":13.32127212,\"byn\":3.27067636,\"byr\":32706.76362393,\"bzd\":2.0145452,\"cad\":1.35019159,\"cake\":0.60819141,\"cdf\":2834.79185733,\"celo\":2.39849683,\"cfx\":7.6993164,\"chf\":0.84345868,\"chz\":20.05093446,\"clp\":942.75836831,\"cnh\":7.0874557,\"cny\":7.08779144,\"comp\":0.02385037,\"cop\":4155.42150097,\"crc\":520.99574099,\"cro\":12.86397322,\"crv\":3.57162564,\"cspr\":87.06241417,\"cuc\":1,\"cup\":23.97944251,\"cve\":99.2389866,\"cvx\":0.50486369,\"cyp\":0.5267253,\"czk\":22.5259279,\"dai\":1.0000893,\"dash\":0.041770975,\"dcr\":0.089849366,\"dem\":1.76017582,\"dfi\":46.9369541,\"djf\":177.89775664,\"dkk\":6.71401036,\"doge\":9.99852278,\"dop\":59.82542712,\"dot\":0.24794164,\"dydx\":1.13273951,\"dzd\":132.70378352,\"eek\":14.08140652,\"egld\":0.04012657,\"egp\":48.44390512,\"enj\":7.4269545,\"eos\":2.14806255,\"ern\":15,\"esp\":149.7413442,\"etb\":110.93058925,\"etc\":0.056676577,\"eth\":0.0004201715,\"eur\":0.8999636,\"fei\":1.00348109,\"fil\":0.29707046,\"fim\":5.3509406,\"fjd\":2.22158588,\"fkp\":0.75898067,\"flow\":1.87975497,\"flr\":68.51776132,\"frax\":1.00302211,\"frf\":5.90337426,\"ftm\":2.61754589,\"ftt\":0.76470999,\"fxs\":0.56061159,\"gala\":57.17822069,\"gbp\":0.75898067,\"gel\":2.69199626,\"ggp\":0.75898067,\"ghc\":156495.88597725,\"ghs\":15.6495886,\"gip\":0.75898067,\"gmd\":70.75274878,\"gmx\":0.041368543,\"gnf\":8634.73645178,\"gno\":0.0067935982,\"grd\":306.66259803,\"grt\":7.43485415,\"gt\":0.13737703,\"gtq\":7.72680534,\"gusd\":0.99898328,\"gyd\":208.74839153,\"hbar\":20.77441926,\"hkd\":7.79545165,\"hnl\":24.76844316,\"hnt\":0.12007246,\"hot\":662.34286659,\"hrk\":6.78077577,\"ht\":2.23838525,\"htg\":132.3565536,\"huf\":353.90857937,\"icp\":0.13808534,\"idr\":15382.03964627,\"iep\":0.70877894,\"ils\":3.70601216,\"imp\":0.75898067,\"imx\":0.85163589,\"inj\":0.0588042,\"inr\":83.98731327,\"iqd\":1309.42029936,\"irr\":42072.06925982,\"isk\":137.96967688,\"itl\":1742.57252732,\"jep\":0.75898067,\"jmd\":157.01423601,\"jod\":0.709,\"jpy\":143.27748174,\"kas\":6.81713277,\"kava\":3.4802601,\"kcs\":0.12353401,\"kda\":1.98058346,\"kes\":128.60983598,\"kgs\":84.22958771,\"khr\":4071.61651357,\"klay\":7.80906374,\"kmf\":442.75306929,\"knc\":2.35817924,\"kpw\":899.98833104,\"krw\":1332.80864357,\"ksm\":0.057328013,\"kwd\":0.30550127,\"kyd\":0.82188567,\"kzt\":482.01225349,\"lak\":22142.14678172,\"lbp\":90826.27178437,\"ldo\":1.02353122,\"leo\":0.18151064,\"link\":0.099845732,\"lkr\":298.5016774,\"lrc\":8.39961296,\"lrd\":195.04211949,\"lsl\":17.70811826,\"ltc\":0.015040578,\"ltl\":3.10739433,\"luf\":36.30444178,\"luna\":3.02278971,\"lunc\":13178.31266282,\"lvl\":0.63249442,\"lyd\":4.76366059,\"mad\":9.72496945,\"mana\":3.85934743,\"matic\":2.72527161,\"mbx\":2.68353193,\"mdl\":17.42275109,\"mga\":4550.17412017,\"mgf\":22750.87060085,\"mina\":2.41699126,\"mkd\":55.5001933,\"mkr\":0.00061365159,\"mmk\":2097.24984582,\"mnt\":3397.29960327,\"mop\":8.0293152,\"mro\":396.57183365,\"mru\":39.65718336,\"mtl\":0.38635438,\"mur\":46.03155016,\"mvr\":15.42814072,\"mwk\":1732.67670485,\"mxn\":19.89279343,\"mxv\":2.42041955,\"myr\":4.33581877,\"mzm\":63836.08465189,\"mzn\":63.83608465,\"nad\":17.70811826,\"near\":0.26803069,\"neo\":0.10691801,\"nexo\":1.03862918,\"nft\":2251403.12764689,\"ngn\":1607.75109579,\"nio\":36.77157918,\"nlg\":1.98325879,\"nok\":10.62705799,\"npr\":134.44269172,\"nzd\":1.60864535,\"okb\":0.02750611,\"omr\":0.3847218,\"one\":92.1629289,\"op\":0.73754735,\"ordi\":0.034588759,\"pab\":1,\"paxg\":0.00039808652,\"pen\":3.79379345,\"pepe\":140787.29088795,\"pgk\":3.90308258,\"php\":55.98760191,\"pkr\":278.41629373,\"pln\":3.85456365,\"pte\":180.42650324,\"pyg\":7713.10947184,\"qar\":3.64,\"qnt\":0.016640106,\"qtum\":0.46312728,\"rol\":44767.80437019,\"ron\":4.47678044,\"rpl\":0.10177562,\"rsd\":105.30764371,\"rub\":88.32286223,\"rune\":0.27903734,\"rvn\":62.19146919,\"rwf\":1345.49098828,\"sand\":4.09318025,\"sar\":3.75,\"sbd\":8.31091719,\"scr\":13.74328779,\"sdd\":60088.93854385,\"sdg\":600.88938544,\"sek\":10.25294055,\"sgd\":1.29991754,\"shib\":75654.62691884,\"shp\":0.75898067,\"sit\":215.66727804,\"skk\":27.11230353,\"sle\":22.59587216,\"sll\":22595.87216214,\"snx\":0.78489865,\"sol\":0.0077216174,\"sos\":570.22057472,\"spl\":0.16666667,\"srd\":28.97818516,\"srg\":28978.1851584,\"std\":22183.36898219,\"stn\":22.18336898,\"stx\":0.72344544,\"sui\":1.23237091,\"svc\":8.75,\"syp\":13001.77695196,\"szl\":17.70811826,\"thb\":33.57403169,\"theta\":0.89911069,\"tjs\":10.64669311,\"tmm\":17478.36334058,\"tmt\":3.49567267,\"tnd\":3.04905825,\"ton\":0.20758887,\"top\":2.34062392,\"trl\":33998340.17707261,\"trx\":6.6630827,\"try\":33.99834018,\"ttd\":6.77242381,\"tusd\":1.00162638,\"tvd\":1.48501403,\"twd\":31.99368752,\"twt\":1.21288715,\"tzs\":2721.02983302,\"uah\":41.22181778,\"ugx\":3718.3063364,\"uni\":0.15912914,\"usd\":1,\"usdc\":1.0001756,\"usdd\":1.00195546,\"usdp\":0.99949589,\"usdt\":1.0004123,\"uyu\":40.32820765,\"uzs\":12719.82784134,\"val\":1742.57252732,\"veb\":3662349823.984474,\"ved\":36.63517201,\"vef\":3663517.20079485,\"ves\":36.63517201,\"vet\":48.34975621,\"vnd\":24805.27433699,\"vuv\":118.44933303,\"waves\":1.04465682,\"wemix\":1.18372757,\"woo\":7.09037922,\"wst\":2.70387982,\"xaf\":590.33742572,\"xag\":0.034806451,\"xau\":0.0003977462,\"xaut\":0.00039738818,\"xbt\":0.0000177709,\"xcd\":2.70179334,\"xch\":0.077096425,\"xdc\":37.93636603,\"xdr\":0.74123946,\"xec\":34024.03923269,\"xem\":61.83840037,\"xlm\":11.16878151,\"xmr\":0.0057851258,\"xof\":590.33742572,\"xpd\":0.0010644062,\"xpf\":107.39422481,\"xpt\":0.0010742287,\"xrp\":1.84265052,\"xtz\":1.61770687,\"yer\":250.34038138,\"zar\":17.70811826,\"zec\":0.034352671,\"zil\":76.7794688,\"zmk\":26307.88241643,\"zmw\":26.30788242,\"zwd\":361.9,\"zwg\":14.09009329,\"zwl\":35207.25707155}', '2024-09-07 11:22:56', '2024-09-07 04:14:12', '2024-09-07 04:23:15');

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_09_06_160642_create_currencies_table', 1),
(5, '2024_09_06_162700_create_personal_access_tokens_table', 1),
(6, '2024_09_07_024253_create_oauth_auth_codes_table', 2),
(7, '2024_09_07_024254_create_oauth_access_tokens_table', 2),
(8, '2024_09_07_024255_create_oauth_refresh_tokens_table', 2),
(9, '2024_09_07_024256_create_oauth_clients_table', 2),
(10, '2024_09_07_024257_create_oauth_personal_access_clients_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', '6EbhTW13oWnVXsDASyjOpVr7eVHuRmmOn5vbgwRY', NULL, 'http://localhost', 1, 0, 0, '2024-09-06 19:42:52', '2024-09-06 19:42:52'),
(2, NULL, 'Laravel Password Grant Client', 'ljOlLKVhhaMlnS2b0gpw8l5S0gzgjQiBVMurMGUS', 'users', 'http://localhost', 0, 1, 0, '2024-09-06 19:42:52', '2024-09-06 19:42:52');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-09-06 19:42:52', '2024-09-06 19:42:52');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
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
('Lf44hB3qKwVSu0JAmEFb2x6sQCRBNyQfwJTEm2R3', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidG1PMUN6M0NDUkxFYks1ZzNTZE5hOGZxS3dSdnRXMHlwZzVlalZEMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1725678716),
('njlWaGadYMMX4vjTgonkaPwmCbgCJ4Z6LgpwMw9c', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:130.0) Gecko/20100101 Firefox/130.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibmxSOHNSUkZwZ0Y2ckZZbDFPa3I4OFlWQ3NvY0xmQURvWldGeHlCSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1725677093),
('tHWYqQaJV5im7ANxdPhfOGzVxj0orENdNHLVxBW2', NULL, '127.0.0.1', 'PostmanRuntime/7.38.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWWlKMk1ZYVBJSnNralYxMGJwS256UTYwZ0licXZxQnhrYXc2TGxrNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1725681757);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `flag` int(11) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `email`, `email_verified_at`, `password`, `flag`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@email.com', NULL, '$2y$12$wCwlfaijxhGp1wpEdqhESOhNhtec.hebP0ki0Uad2L/BuEG4KDKqO', 0, NULL, NULL, '2024-09-06 20:38:55'),
(2, 'user', 'user@user.com', NULL, '$2y$12$EcENHYEFpnGE1/Omw33mKO3MSTUEwWo931fyqS6RmIIWZ8s3BnFde', 1, NULL, '2024-09-06 23:49:13', '2024-09-07 21:58:56');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

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
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
