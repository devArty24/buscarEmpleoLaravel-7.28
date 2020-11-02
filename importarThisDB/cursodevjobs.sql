/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.1.21-MariaDB : Database - cursodevjobs
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `candidatos` */

DROP TABLE IF EXISTS `candidatos`;

CREATE TABLE `candidatos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cv` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vacante_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `candidatos` */

insert  into `candidatos`(`id`,`nombre`,`email`,`cv`,`vacante_id`,`created_at`,`updated_at`) values (1,'Arturo','correo1@correo.com','123.pdf','1','2020-10-15 23:28:10','2020-10-15 23:28:10'),(2,'segundaForma','segunda@forma.com','11234.pdf','1','2020-10-15 23:32:48','2020-10-15 23:32:48'),(3,'segundaForma','segunda@forma.com','11234.pdf','1','2020-10-15 23:36:02','2020-10-15 23:36:02'),(4,'terceraForma','tercera@forma.com','11234.pdf','1','2020-10-15 23:36:26','2020-10-15 23:36:26'),(5,'cuarta forma','cuarta@forma.com','1234.pdf','1','2020-10-15 23:48:44','2020-10-15 23:48:44'),(6,'conPDF','con@pdf.com','1602806446.pdf','1','2020-10-16 00:00:46','2020-10-16 00:00:46'),(7,'conMensaje','con@mensaje.com','1602806964.pdf','1','2020-10-16 00:09:24','2020-10-16 00:09:24'),(8,'notificacionLaravel','noti@ficacion.com','1603142547.pdf','1','2020-10-19 21:22:27','2020-10-19 21:22:27'),(9,'prueba','prueba@dos.com','1603142618.pdf','1','2020-10-19 21:23:38','2020-10-19 21:23:38'),(10,'NotiBase','notificacion@dabatbase.com','1603153081.pdf','1','2020-10-20 00:18:01','2020-10-20 00:18:01'),(11,'conID','con@id.com','1603314842.pdf','1','2020-10-21 21:14:02','2020-10-21 21:14:02'),(12,'nuevo','nuevo@vacante.com','1603673671.pdf','1','2020-10-26 00:54:31','2020-10-26 00:54:31');

/*Table structure for table `categorias` */

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `categorias` */

insert  into `categorias`(`id`,`nombre`,`created_at`,`updated_at`) values (1,'Front-end','2020-10-06 20:25:18','2020-10-06 20:25:18'),(2,'Back-end','2020-10-06 20:25:18','2020-10-06 20:25:18'),(3,'Full Stack','2020-10-06 20:25:18','2020-10-06 20:25:18'),(4,'devOps','2020-10-06 20:25:18','2020-10-06 20:25:18'),(5,'DBA','2020-10-06 20:25:19','2020-10-06 20:25:19'),(6,'UX / UI','2020-10-06 20:25:19','2020-10-06 20:25:19'),(7,'Teachlead','2020-10-06 20:25:19','2020-10-06 20:25:19');

/*Table structure for table `experiencias` */

DROP TABLE IF EXISTS `experiencias`;

CREATE TABLE `experiencias` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `experiencias` */

insert  into `experiencias`(`id`,`nombre`,`created_at`,`updated_at`) values (1,'0 - 6 Meses','2020-10-06 20:25:19','2020-10-06 20:25:19'),(2,'6 Meses - 1 Año','2020-10-06 20:25:19','2020-10-06 20:25:19'),(3,'1 - 3 Años','2020-10-06 20:25:19','2020-10-06 20:25:19'),(4,'3 - 5 Años','2020-10-06 20:25:19','2020-10-06 20:25:19'),(5,'5 - 7 Años','2020-10-06 20:25:19','2020-10-06 20:25:19'),(6,'7 - 10 Años','2020-10-06 20:25:19','2020-10-06 20:25:19'),(7,'10 - 12 Años','2020-10-06 20:25:19','2020-10-06 20:25:19'),(8,'12 - 15 Años','2020-10-06 20:25:19','2020-10-06 20:25:19');

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2020_09_29_213457_create_vacantes_table',1),(5,'2020_10_14_200939_create_candidatos_table',2),(6,'2020_10_19_234549_create_notifications_table',3);

/*Table structure for table `notifications` */

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(10) unsigned NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_id_index` (`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `notifications` */

insert  into `notifications`(`id`,`type`,`notifiable_id`,`notifiable_type`,`data`,`read_at`,`created_at`,`updated_at`) values ('81131d7d-5907-490a-8d99-fc94bcd5fee5','App\\Notifications\\NuevoCandidato',1,'App\\User','{\"vacante\":\"Front-end\",\"id_vacante\":1}','2020-10-26 01:06:08','2020-10-26 00:55:03','2020-10-26 01:06:08'),('96738b4b-4c1b-481d-8994-d51ba2392fd6','App\\Notifications\\NuevoCandidato',1,'App\\User','{\"vacante\":\"Front-end\",\"id_vacante\":1}','2020-10-26 01:06:08','2020-10-21 21:14:23','2020-10-26 01:06:08');

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `salarios` */

DROP TABLE IF EXISTS `salarios`;

CREATE TABLE `salarios` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `salarios` */

insert  into `salarios`(`id`,`nombre`,`created_at`,`updated_at`) values (1,'0 - 1000 USD','2020-10-06 20:25:19','2020-10-06 20:25:19'),(2,'1000 - 2000 USD','2020-10-06 20:25:20','2020-10-06 20:25:20'),(3,'2000 - 4000 USD','2020-10-06 20:25:20','2020-10-06 20:25:20'),(4,'No Mostrar','2020-10-06 20:25:20','2020-10-06 20:25:20');

/*Table structure for table `ubicacions` */

DROP TABLE IF EXISTS `ubicacions`;

CREATE TABLE `ubicacions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ubicacions` */

insert  into `ubicacions`(`id`,`nombre`,`created_at`,`updated_at`) values (1,'Remoto','2020-10-06 20:25:19','2020-10-06 20:25:19'),(2,'USA','2020-10-06 20:25:19','2020-10-06 20:25:19'),(3,'Canada','2020-10-06 20:25:19','2020-10-06 20:25:19'),(4,'Mexico','2020-10-06 20:25:19','2020-10-06 20:25:19'),(5,'Colombia','2020-10-06 20:25:19','2020-10-06 20:25:19'),(6,'Argentina','2020-10-06 20:25:19','2020-10-06 20:25:19'),(7,'España','2020-10-06 20:25:19','2020-10-06 20:25:19');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values (1,'Arturo','correo@correo.com','2020-10-06 20:25:18','$2y$10$duJf/DNmflNaxJ319C1I7ODJXPOMkXgPRO6Cbmv3sdLYO.H4yz0mq',NULL,'2020-10-06 20:25:18','2020-10-06 20:25:18'),(2,'Arty','correo2@correo.com','2020-10-06 20:25:18','$2y$10$7dES3HeVNyvqLs/serCVl.WDfA1.j3UocU2J5xA3ggfOFsgqV1tU6',NULL,'2020-10-06 20:25:18','2020-10-06 20:25:18');

/*Table structure for table `vacantes` */

DROP TABLE IF EXISTS `vacantes`;

CREATE TABLE `vacantes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `skills` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `activa` tinyint(1) NOT NULL DEFAULT '1',
  `categoria_id` bigint(20) unsigned NOT NULL,
  `experiencia_id` bigint(20) unsigned NOT NULL,
  `ubicacion_id` bigint(20) unsigned NOT NULL,
  `salario_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vacantes_categoria_id_foreign` (`categoria_id`),
  KEY `vacantes_experiencia_id_foreign` (`experiencia_id`),
  KEY `vacantes_ubicacion_id_foreign` (`ubicacion_id`),
  KEY `vacantes_salario_id_foreign` (`salario_id`),
  KEY `vacantes_user_id_foreign` (`user_id`),
  CONSTRAINT `vacantes_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`),
  CONSTRAINT `vacantes_experiencia_id_foreign` FOREIGN KEY (`experiencia_id`) REFERENCES `experiencias` (`id`),
  CONSTRAINT `vacantes_salario_id_foreign` FOREIGN KEY (`salario_id`) REFERENCES `salarios` (`id`),
  CONSTRAINT `vacantes_ubicacion_id_foreign` FOREIGN KEY (`ubicacion_id`) REFERENCES `ubicacions` (`id`),
  CONSTRAINT `vacantes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `vacantes` */

insert  into `vacantes`(`id`,`titulo`,`imagen`,`descripcion`,`skills`,`activa`,`categoria_id`,`experiencia_id`,`ubicacion_id`,`salario_id`,`user_id`,`created_at`,`updated_at`) values (1,'Back-end','1602030383.jpeg','<p>Que sepas de todo full stack con poco sueldo y sin aumento, no pedir aumentos.</p><p>Que sepas de todo full stack con poco sueldo y sin aumento, no pedir aumentos.<br></p><p>Que sepas de todo full stack con poco sueldo y sin aumento, no pedir aumentos.<br></p>','HTML5,CSS3,CSSGrid,JavaScript,jQuery,Angular,VueJS,Flexbox,ReactJS,React Hooks,SASS,WordPress',1,2,2,2,1,1,'2020-10-07 00:32:03','2020-10-30 00:40:04'),(2,'Front-end','1602030897.jpeg','<p>Puesto para back dev pero que sepa front y base de datos, ingles intermedio que tenga habilidad de telequinecis y si pude volar seria un plus</p>','HTML5,Angular,Symfony,PHP,React Hooks',1,1,2,2,2,1,'2020-10-07 00:35:08','2020-10-30 00:40:38');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
