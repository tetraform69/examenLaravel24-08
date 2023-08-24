-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para laravel
CREATE DATABASE IF NOT EXISTS `laravel` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `laravel`;

-- Volcando estructura para tabla laravel.equipos
CREATE TABLE IF NOT EXISTS `equipos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `programa` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `escudo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla laravel.equipos: ~8 rows (aproximadamente)
INSERT INTO `equipos` (`id`, `created_at`, `updated_at`, `nombre`, `programa`, `escudo`) VALUES
	(1, '2023-08-24 19:32:29', '2023-08-24 19:32:29', 'equipo 1', 'sena', 'public/YWImqpj8bJjGjpwhJiIdnG0DisJmi9l8z8aray9e.jpg'),
	(2, '2023-08-24 19:33:00', '2023-08-24 19:33:00', 'equipo 2', 'sena', 'public/jl2iwSDwNHvH8LvwIhl0Isyf4NglZltW2hGO0DJL.jpg'),
	(3, '2023-08-24 19:33:10', '2023-08-24 19:33:10', 'equipo 3', 'sena', 'public/Wpfd8yQ1vbsoL9crJ4zneWomZJf4HgJQAHcGaVjr.jpg'),
	(4, '2023-08-24 19:33:20', '2023-08-24 19:33:20', 'equipo 4', 'sena', 'public/D4hqNFQN2pTFikXN2YLTI4GWfuVwPxSDKQVNNOc0.jpg'),
	(5, '2023-08-24 19:33:29', '2023-08-24 19:33:29', 'equipo 5', 'sena', 'public/pW03VYe2UzNvH3EprzMcYeLmTr5z3gE7NzJobJ6P.jpg'),
	(6, '2023-08-24 19:34:02', '2023-08-24 19:34:02', 'equipo 6', 'sena', 'public/7DGrc5cZFtRaRpBWfQbtxgITKnphsMrvxZfj04bB.jpg'),
	(7, '2023-08-24 19:34:12', '2023-08-24 19:34:12', 'equipo 7', 'sena', 'public/VCth72tuvFfYql16aoVMaUvQNdkPMddPIohfEOrj.jpg'),
	(8, '2023-08-24 19:34:22', '2023-08-24 19:34:22', 'equipo 8', 'sena', 'public/0Q3ZxXlgdobt9ltK0VvNlQsQNZERFOGy6ptg5JqA.jpg');

-- Volcando estructura para tabla laravel.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla laravel.failed_jobs: ~0 rows (aproximadamente)

-- Volcando estructura para tabla laravel.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla laravel.migrations: ~0 rows (aproximadamente)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2023_08_24_115408_create_equipos_table', 1),
	(6, '2023_08_24_120329_create_partidos_table', 1);

-- Volcando estructura para tabla laravel.partidos
CREATE TABLE IF NOT EXISTS `partidos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `goles_local` int NOT NULL DEFAULT '0',
  `goles_rival` int NOT NULL DEFAULT '0',
  `penales` int NOT NULL,
  `equipo_local` bigint unsigned NOT NULL,
  `equipo_rival` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `partidos_equipo_local_foreign` (`equipo_local`),
  KEY `partidos_equipo_rival_foreign` (`equipo_rival`),
  CONSTRAINT `partidos_equipo_local_foreign` FOREIGN KEY (`equipo_local`) REFERENCES `equipos` (`id`),
  CONSTRAINT `partidos_equipo_rival_foreign` FOREIGN KEY (`equipo_rival`) REFERENCES `equipos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla laravel.partidos: ~0 rows (aproximadamente)

-- Volcando estructura para tabla laravel.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla laravel.password_reset_tokens: ~0 rows (aproximadamente)

-- Volcando estructura para tabla laravel.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla laravel.personal_access_tokens: ~0 rows (aproximadamente)

-- Volcando estructura para tabla laravel.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla laravel.users: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
