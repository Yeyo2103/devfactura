/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.6.23-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ardilapp_sri
-- ------------------------------------------------------
-- Server version	10.6.23-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Administrador'),(2,'Cliente');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (9,1,9),(10,1,10),(11,1,11),(12,1,12),(49,1,21),(47,1,22),(48,1,23),(46,1,24),(44,1,25),(45,1,26),(24,1,27),(25,1,28),(26,1,29),(27,1,30),(78,1,31),(50,1,32),(51,1,33),(52,1,34),(53,1,35),(40,1,36),(41,1,37),(42,1,38),(43,1,39),(39,1,40),(36,1,41),(37,1,42),(38,1,43),(64,1,44),(60,1,45),(61,1,46),(62,1,47),(63,1,49),(31,1,50),(28,1,51),(29,1,52),(30,1,53),(35,1,54),(74,1,55),(75,1,56),(76,1,57),(77,1,58),(20,1,59),(21,1,60),(22,1,61),(23,1,62),(34,1,63),(32,1,64),(33,1,65),(69,1,66),(65,1,67),(66,1,68),(67,1,69),(68,1,70),(54,1,71),(55,1,72),(56,1,73),(57,1,74),(59,1,75),(58,1,76),(73,1,77),(70,1,78),(71,1,79),(72,1,81),(13,1,82),(4,1,83),(1,1,84),(2,1,85),(3,1,86),(15,1,87),(14,1,88),(5,1,89),(6,1,90),(7,1,91),(8,1,92),(16,1,93),(17,1,94),(18,1,95),(19,1,96),(80,2,48),(79,2,49),(82,2,80),(81,2,81);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can view Cuenta por pagar',6,'view_account_payable'),(22,'Can add Cuenta por pagar',6,'add_account_payable'),(23,'Can delete Cuenta por pagar',6,'delete_account_payable'),(24,'Can view Cuenta por cobrar',7,'view_account_receivable'),(25,'Can add Cuenta por cobrar',7,'add_account_receivable'),(26,'Can delete Cuenta por cobrar',7,'delete_account_receivable'),(27,'Can add Categoria',8,'add_category'),(28,'Can change Categoria',8,'change_category'),(29,'Can delete Categoria',8,'delete_category'),(30,'Can view Categoria',8,'view_category'),(31,'Can change Compañia',9,'change_company'),(32,'Can add Cliente',10,'add_customer'),(33,'Can change Cliente',10,'change_customer'),(34,'Can delete Cliente',10,'delete_customer'),(35,'Can view Cliente',10,'view_customer'),(36,'Can add Gasto',11,'add_expense'),(37,'Can change Gasto',11,'change_expense'),(38,'Can delete Gasto',11,'delete_expense'),(39,'Can view Gasto',11,'view_expense'),(40,'Can view Tipo de Gasto',12,'view_expense_type'),(41,'Can add Tipo de Gasto',12,'add_expense_type'),(42,'Can change Tipo de Gasto',12,'change_expense_type'),(43,'Can delete Tipo de Gasto',12,'delete_expense_type'),(44,'Can view Factura',13,'view_invoice_admin'),(45,'Can add Factura',13,'add_invoice_admin'),(46,'Can update Factura',13,'change_invoice_admin'),(47,'Can delete Factura',13,'delete_invoice_admin'),(48,'Can view Factura | Cliente',13,'view_invoice_customer'),(49,'Can print Factura',13,'print_invoice'),(50,'Can view Producto',15,'view_product'),(51,'Can add Producto',15,'add_product'),(52,'Can change Producto',15,'change_product'),(53,'Can delete Producto',15,'delete_product'),(54,'Can adjust_product_stock Producto',15,'adjust_product_stock'),(55,'Can add Promoción',16,'add_promotion'),(56,'Can change Promoción',16,'change_promotion'),(57,'Can delete Promoción',16,'delete_promotion'),(58,'Can view Promoción',16,'view_promotion'),(59,'Can add Proveedor',18,'add_provider'),(60,'Can change Proveedor',18,'change_provider'),(61,'Can delete Proveedor',18,'delete_provider'),(62,'Can view Proveedor',18,'view_provider'),(63,'Can view Compra',19,'view_purchase'),(64,'Can add Compra',19,'add_purchase'),(65,'Can delete Compra',19,'delete_purchase'),(66,'Can view Proforma',21,'view_quotation'),(67,'Can add Proforma',21,'add_quotation'),(68,'Can change Proforma',21,'change_quotation'),(69,'Can delete Proforman',21,'delete_quotation'),(70,'Can print Proforma',21,'print_quotation'),(71,'Can add Comprobante',23,'add_receipt'),(72,'Can change Comprobante',23,'change_receipt'),(73,'Can delete Comprobante',23,'delete_receipt'),(74,'Can view Comprobante',23,'view_receipt'),(75,'Can view Error del Comprobante',24,'view_receipt_error'),(76,'Can delete Error del Comprobante',24,'delete_receipt_error'),(77,'Can view Nota de Crédito',27,'view_credit_note_admin'),(78,'Can add Nota de Crédito',27,'add_credit_note_admin'),(79,'Can delete Nota de Crédito',27,'delete_credit_note_admin'),(80,'Can view Nota de Crédito | Cliente',27,'view_credit_note_customer'),(81,'Can print Nota de Crédito',27,'print_credit_note'),(82,'Can view Dashboard',29,'view_dashboard'),(83,'Can view Tipo de Módulo',30,'view_module_type'),(84,'Can add Tipo de Módulo',30,'add_module_type'),(85,'Can change Tipo de Módulo',30,'change_module_type'),(86,'Can delete Tipo de Módulo',30,'delete_module_type'),(87,'Can view Acceso del usuario',31,'view_user_access'),(88,'Can delete Acceso del usuario',31,'delete_user_access'),(89,'Can add Módulo',32,'add_module'),(90,'Can change Módulo',32,'change_module'),(91,'Can delete Módulo',32,'delete_module'),(92,'Can view Módulo',32,'view_module'),(93,'Can add Usuario',34,'add_user'),(94,'Can change Usuario',34,'change_user'),(95,'Can delete Usuario',34,'delete_user'),(96,'Can view Usuario',34,'view_user');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_user_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(6,'pos','accountpayable'),(25,'pos','accountpayablepayment'),(7,'pos','accountreceivable'),(26,'pos','accountreceivablepayment'),(8,'pos','category'),(9,'pos','company'),(27,'pos','creditnote'),(28,'pos','creditnotedetail'),(10,'pos','customer'),(11,'pos','expense'),(12,'pos','expensetype'),(13,'pos','invoice'),(14,'pos','invoicedetail'),(15,'pos','product'),(16,'pos','promotion'),(17,'pos','promotiondetail'),(18,'pos','provider'),(19,'pos','purchase'),(20,'pos','purchasedetail'),(21,'pos','quotation'),(22,'pos','quotationdetail'),(23,'pos','receipt'),(24,'pos','receipterror'),(29,'security','dashboard'),(33,'security','groupmodule'),(32,'security','module'),(30,'security','moduletype'),(31,'security','useraccess'),(5,'sessions','session'),(34,'user','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-06-15 22:03:44.796176'),(2,'contenttypes','0002_remove_content_type_name','2026-06-15 22:03:44.823431'),(3,'auth','0001_initial','2026-06-15 22:03:44.931316'),(4,'auth','0002_alter_permission_name_max_length','2026-06-15 22:03:44.953286'),(5,'auth','0003_alter_user_email_max_length','2026-06-15 22:03:44.965231'),(6,'auth','0004_alter_user_username_opts','2026-06-15 22:03:44.976493'),(7,'auth','0005_alter_user_last_login_null','2026-06-15 22:03:44.991725'),(8,'auth','0006_require_contenttypes_0002','2026-06-15 22:03:44.994015'),(9,'auth','0007_alter_validators_add_error_messages','2026-06-15 22:03:45.005040'),(10,'auth','0008_alter_user_username_max_length','2026-06-15 22:03:45.018630'),(11,'auth','0009_alter_user_last_name_max_length','2026-06-15 22:03:45.027191'),(12,'auth','0010_alter_group_name_max_length','2026-06-15 22:03:45.050047'),(13,'auth','0011_update_proxy_permissions','2026-06-15 22:03:45.060115'),(14,'auth','0012_alter_user_first_name_max_length','2026-06-15 22:03:45.068855'),(15,'user','0001_initial','2026-06-15 22:03:45.187773'),(16,'admin','0001_initial','2026-06-15 22:03:45.238399'),(17,'admin','0002_logentry_remove_auto_add','2026-06-15 22:03:45.249911'),(18,'admin','0003_logentry_add_action_flag_choices','2026-06-15 22:03:45.266600'),(19,'pos','0001_initial','2026-06-15 22:03:45.571047'),(20,'pos','0002_initial','2026-06-15 22:03:46.852401'),(21,'security','0001_initial','2026-06-15 22:03:47.102080'),(22,'security','0002_initial','2026-06-15 22:03:47.165929'),(23,'sessions','0001_initial','2026-06-15 22:03:47.186530');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('jkpm495gnmgfcx03lptdroj6k4fjz02o','.eJx1kstu2zAURH9F4NqVqJdteZcWyC5A920hXJNXElOJJPhwEQT-9145ilsl9kqAZuZwhtIrayGGoY0eXaskO7Ccbf5_dwTxG_UsyGfQvUmF0cGpYzpb0kX16ZOROH5dvCvAAH6gdMmh2HMBRdOg3HVlXvNyV6Ksm7qCspMVP_KKQ77P5Z5vG9kUVbc_brGrmqIs6xnaOxMtO7yyuWe-YRomJPKDnJRWPjiQxrHzhkU3tiP4QFpmjc-UPhklMIPZmBFoMjKO-E4q8kvkrns55hFEiA78Nd-GF3uFVB99Qv2MnHelJr-iOyOlA5908EXAKOII4a2sRC-cskFdLN_RTSpgAtdNLqEpyQl1oIfEZDQ-sY4KiGD8J7YfjLVK93SIC7M6QT-XynyAoESmpj6T2EEcQ4aTDS-p1T357Hyu91TCs8OPZVJ93fQNNFWSybKNAoK-9yKS0C6X1l5606yFsF0RopVA225CxEA_F97j7FYc-tPwHudNu8dpVhzrlA63MRfpnfIvX63yJ4V_bsdn5WOHX-fzX-lDJbQ:1weM4W:AUwSd83Dp-1jyHXkZ2ebIFfYSzyNQp-uFzXfjhDQtV4','2026-07-14 00:11:28.488162'),('w6skoflnaj3r6l0050tgkap8az6t4qhe','.eJxVjkEOgyAURO_C2hAQUHHX7nsG8_GD0lZoQFfGu1cSF-123szL7GSAbZ2HLds0eCQ94aT6zQyMLxsKwCeEKdIxhjV5Q0uFXjTTR0T7vl_dP8EMeT7XgkHdsRFqrS22TnDFRCssKq0kCIeSGSYZ8I5jxxqNupauM411UtdCqCKdUtw-pN9J-ckrEmCxp_mGiw8-rwkwJnIcX1kVRDo:1wZwMV:LwiD_mGbC3CSqEnOMVHj3cfEObMPpKpybRYXxzselqs','2026-07-01 19:55:47.276840'),('zh2jnf4oxsr94s7v1llt79n6wmuagg5a','.eJx1kUlPwzAQhf9K5HNJnDqBpjfoGYk7oGhij1NDvMjLoUL979glrBLXeW--N8sbGSHF45gC-lEJsict2fysTcBf0RRBvICZbc2tiV5NdbHUqxrqeytwuVu9vwBHCMfczShsd5TDdhhQ3EjW9pTdMBT90HfApOjoRDsK7a4VO3o9iGHbyd10jbIbtoz1BTp7mxzZv5EyZ7shBjRm8q3QyqgQPQjryXlDkl_GBULMWuNsaLjVDsypSU5AxCaTtBVpwU8U6y89_9vXoEMRnhKlslXwRRnjyRVUDhYYuFcuKmuy_QG9VhGrGUOpgK8WqJSR1mvg6sJhphJYyvwPWvELQkKoJFxNSS1CmbkIGuYySxMiRMUbpedGoIS0xAa1i6faXXyuhIeQcwPZP657ft_sAKbix_xPrP5uxfMnV9eHY1wPQs7P5_M7wZa6nQ:1wdA5W:mKtbv4kQN67uelMqgtE89vOjB8ytCldcArTzvIToCBo','2026-07-10 17:11:34.082779');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_accountpayable`
--

DROP TABLE IF EXISTS `pos_accountpayable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_accountpayable` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_joined` date NOT NULL,
  `end_date` date NOT NULL,
  `debt` decimal(9,2) NOT NULL,
  `balance` decimal(9,2) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `purchase_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pos_accountpayable_purchase_id_b07325bc_fk_pos_purchase_id` (`purchase_id`),
  CONSTRAINT `pos_accountpayable_purchase_id_b07325bc_fk_pos_purchase_id` FOREIGN KEY (`purchase_id`) REFERENCES `pos_purchase` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_accountpayable`
--

LOCK TABLES `pos_accountpayable` WRITE;
/*!40000 ALTER TABLE `pos_accountpayable` DISABLE KEYS */;
/*!40000 ALTER TABLE `pos_accountpayable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_accountpayablepayment`
--

DROP TABLE IF EXISTS `pos_accountpayablepayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_accountpayablepayment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_joined` date NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `amount` decimal(9,2) NOT NULL,
  `account_payable_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pos_accountpayablepa_account_payable_id_f2a3836a_fk_pos_accou` (`account_payable_id`),
  CONSTRAINT `pos_accountpayablepa_account_payable_id_f2a3836a_fk_pos_accou` FOREIGN KEY (`account_payable_id`) REFERENCES `pos_accountpayable` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_accountpayablepayment`
--

LOCK TABLES `pos_accountpayablepayment` WRITE;
/*!40000 ALTER TABLE `pos_accountpayablepayment` DISABLE KEYS */;
/*!40000 ALTER TABLE `pos_accountpayablepayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_accountreceivable`
--

DROP TABLE IF EXISTS `pos_accountreceivable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_accountreceivable` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_joined` date NOT NULL,
  `end_date` date NOT NULL,
  `debt` decimal(9,2) NOT NULL,
  `balance` decimal(9,2) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `invoice_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pos_accountreceivable_invoice_id_14f3908a_fk_pos_invoice_id` (`invoice_id`),
  CONSTRAINT `pos_accountreceivable_invoice_id_14f3908a_fk_pos_invoice_id` FOREIGN KEY (`invoice_id`) REFERENCES `pos_invoice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_accountreceivable`
--

LOCK TABLES `pos_accountreceivable` WRITE;
/*!40000 ALTER TABLE `pos_accountreceivable` DISABLE KEYS */;
/*!40000 ALTER TABLE `pos_accountreceivable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_accountreceivablepayment`
--

DROP TABLE IF EXISTS `pos_accountreceivablepayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_accountreceivablepayment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_joined` date NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `amount` decimal(9,2) NOT NULL,
  `account_receivable_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pos_accountreceivabl_account_receivable_i_f99b9f90_fk_pos_accou` (`account_receivable_id`),
  CONSTRAINT `pos_accountreceivabl_account_receivable_i_f99b9f90_fk_pos_accou` FOREIGN KEY (`account_receivable_id`) REFERENCES `pos_accountreceivable` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_accountreceivablepayment`
--

LOCK TABLES `pos_accountreceivablepayment` WRITE;
/*!40000 ALTER TABLE `pos_accountreceivablepayment` DISABLE KEYS */;
/*!40000 ALTER TABLE `pos_accountreceivablepayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_category`
--

DROP TABLE IF EXISTS `pos_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_category`
--

LOCK TABLES `pos_category` WRITE;
/*!40000 ALTER TABLE `pos_category` DISABLE KEYS */;
INSERT INTO `pos_category` VALUES (4,'BODEGA 1'),(5,'BODEGA 2 AL FONDO'),(2,'BODEGA 3'),(6,'BODEGA 3 AL FONDO'),(3,'BODEGA 4'),(1,'LOCAL');
/*!40000 ALTER TABLE `pos_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_company`
--

DROP TABLE IF EXISTS `pos_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_company` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ruc` varchar(13) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `commercial_name` varchar(50) NOT NULL,
  `main_address` varchar(200) NOT NULL,
  `establishment_address` varchar(200) NOT NULL,
  `establishment_code` varchar(3) NOT NULL,
  `issuing_point_code` varchar(3) NOT NULL,
  `special_taxpayer` varchar(13) NOT NULL,
  `obligated_accounting` varchar(2) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `environment_type` int(10) unsigned NOT NULL CHECK (`environment_type` >= 0),
  `emission_type` int(10) unsigned NOT NULL CHECK (`emission_type` >= 0),
  `retention_agent` varchar(2) NOT NULL,
  `regimen_rimpe` varchar(50) NOT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `phone` varchar(9) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `website` varchar(250) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `tax` decimal(9,2) NOT NULL,
  `tax_percentage` int(11) NOT NULL,
  `electronic_signature` varchar(100) DEFAULT NULL,
  `electronic_signature_key` varchar(100) NOT NULL,
  `email_host` varchar(30) NOT NULL,
  `email_port` int(11) NOT NULL,
  `email_host_user` varchar(100) NOT NULL,
  `email_host_password` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_company`
--

LOCK TABLES `pos_company` WRITE;
/*!40000 ALTER TABLE `pos_company` DISABLE KEYS */;
INSERT INTO `pos_company` VALUES (1,'1002376026001','CAZARES ZULETA JUAN FRANCISCO','DISTRIBUIDORA MAYORGA','ORELLANA / LORETO / LORETO / AV. RAFAEL ANDRADE S/N Y GREGORIO URAPARI','ORELLANA / LORETO / LORETO / AV. RAFAEL ANDRADE S/N Y GREGORIO URAPARI','006','006','000','NO','company/2026/06/15/logo.png',1,1,'NO','CONTRIBUYENTE RÉGIMEN GENERAL','0986462199','982270674','cazareszuleta@gmail.com','http://www.ialoreto.com','VENTA AL POR MENOR DE ARTÍCULOS DE FERRETERÍA: MARTILLOS, SIERRAS, DESTORNILLADORES Y PEQUEÑAS HERRAMIENTAS EN GENERAL, EQUIPO Y MATERIALES DE PREFABRICADOS PARA ARMADO CASERO (EQUIPO DE BRICOLAJE); ALAMBRES Y CABLES ELÉCTRICOS, CERRADURAS, MONTAJES Y ADORNOS, EXTINTORES, SEGADORAS DE CÉSPED DE CUALQUIER TIPO, ETCÉTERA EN ESTABLECIMIENTOS ESPECIALIZADOS.',15.00,4,'company/2026/06/15/firma.p12','JFcz0326','smtp.gmail.com',587,'netdev@in-planet.net','llylnrfzcsvykyyl');
/*!40000 ALTER TABLE `pos_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_creditnote`
--

DROP TABLE IF EXISTS `pos_creditnote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_creditnote` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_joined` date NOT NULL,
  `subtotal_without_tax` decimal(9,2) NOT NULL,
  `subtotal_with_tax` decimal(9,2) NOT NULL,
  `tax` decimal(9,2) NOT NULL,
  `total_tax` decimal(9,2) NOT NULL,
  `total_discount` decimal(9,2) NOT NULL,
  `total_amount` decimal(9,2) NOT NULL,
  `time_joined` datetime(6) NOT NULL,
  `receipt_number` varchar(9) DEFAULT NULL,
  `receipt_number_full` varchar(20) DEFAULT NULL,
  `environment_type` int(10) unsigned NOT NULL CHECK (`environment_type` >= 0),
  `access_code` varchar(49) DEFAULT NULL,
  `authorized_date` datetime(6) DEFAULT NULL,
  `authorized_xml` varchar(100) DEFAULT NULL,
  `authorized_pdf` varchar(100) DEFAULT NULL,
  `create_electronic_invoice` tinyint(1) NOT NULL,
  `additional_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`additional_info`)),
  `status` varchar(50) NOT NULL,
  `motive` varchar(300) DEFAULT NULL,
  `company_id` bigint(20) NOT NULL,
  `invoice_id` bigint(20) NOT NULL,
  `receipt_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pos_creditnote_company_id_199f4317_fk_pos_company_id` (`company_id`),
  KEY `pos_creditnote_invoice_id_8235925a_fk_pos_invoice_id` (`invoice_id`),
  KEY `pos_creditnote_receipt_id_6eae7f49_fk_pos_receipt_id` (`receipt_id`),
  CONSTRAINT `pos_creditnote_company_id_199f4317_fk_pos_company_id` FOREIGN KEY (`company_id`) REFERENCES `pos_company` (`id`),
  CONSTRAINT `pos_creditnote_invoice_id_8235925a_fk_pos_invoice_id` FOREIGN KEY (`invoice_id`) REFERENCES `pos_invoice` (`id`),
  CONSTRAINT `pos_creditnote_receipt_id_6eae7f49_fk_pos_receipt_id` FOREIGN KEY (`receipt_id`) REFERENCES `pos_receipt` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_creditnote`
--

LOCK TABLES `pos_creditnote` WRITE;
/*!40000 ALTER TABLE `pos_creditnote` DISABLE KEYS */;
/*!40000 ALTER TABLE `pos_creditnote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_creditnotedetail`
--

DROP TABLE IF EXISTS `pos_creditnotedetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_creditnotedetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `price` decimal(9,4) NOT NULL,
  `price_with_tax` decimal(9,4) NOT NULL,
  `subtotal` decimal(9,4) NOT NULL,
  `tax` decimal(9,4) NOT NULL,
  `total_tax` decimal(9,4) NOT NULL,
  `discount` decimal(9,4) NOT NULL,
  `total_discount` decimal(9,4) NOT NULL,
  `total_amount` decimal(9,4) NOT NULL,
  `credit_note_id` bigint(20) NOT NULL,
  `invoice_detail_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pos_creditnotedetail_credit_note_id_143bc7ff_fk_pos_credi` (`credit_note_id`),
  KEY `pos_creditnotedetail_invoice_detail_id_4d8f8dee_fk_pos_invoi` (`invoice_detail_id`),
  KEY `pos_creditnotedetail_product_id_b7dc6662_fk_pos_product_id` (`product_id`),
  CONSTRAINT `pos_creditnotedetail_credit_note_id_143bc7ff_fk_pos_credi` FOREIGN KEY (`credit_note_id`) REFERENCES `pos_creditnote` (`id`),
  CONSTRAINT `pos_creditnotedetail_invoice_detail_id_4d8f8dee_fk_pos_invoi` FOREIGN KEY (`invoice_detail_id`) REFERENCES `pos_invoicedetail` (`id`),
  CONSTRAINT `pos_creditnotedetail_product_id_b7dc6662_fk_pos_product_id` FOREIGN KEY (`product_id`) REFERENCES `pos_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_creditnotedetail`
--

LOCK TABLES `pos_creditnotedetail` WRITE;
/*!40000 ALTER TABLE `pos_creditnotedetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `pos_creditnotedetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_customer`
--

DROP TABLE IF EXISTS `pos_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dni` varchar(13) NOT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `birthdate` date NOT NULL,
  `address` varchar(500) DEFAULT NULL,
  `identification_type` varchar(30) NOT NULL,
  `send_email_invoice` tinyint(1) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dni` (`dni`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `pos_customer_user_id_a3ecc11f_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_customer`
--

LOCK TABLES `pos_customer` WRITE;
/*!40000 ALTER TABLE `pos_customer` DISABLE KEYS */;
INSERT INTO `pos_customer` VALUES (1,'9999999999999','0999999999','2003-05-13','ECUADOR','07',0,2),(2,'1754696373','0991652268','2003-05-13','PARQUE ARTESANAL ULTIMA MANZANA','05',1,3),(3,'0401325345','0969941191','2001-10-01','GERÓNIMO CARRION Y COLON','05',1,4),(4,'0400958609','0960073020','2005-01-10','AV. ANDRES BELLO Y CARLOS ONA','05',1,5),(5,'0401977327','0987610731','1999-10-01','CONJUNTO EL ROSAL','05',1,6),(6,'0401294400','0992019695','2001-12-15','OLMEDO Y LAS GRADAS','05',1,7),(7,'0401256409','0983626601','1996-10-02','OLMEDO Y CARABOBO','05',1,8),(8,'0402038418','0981776307','1998-02-15','POLICIA','05',1,9),(9,'1713379970','0991728843','2005-02-01','GRAL PLAZA Y JOSE MARIA URBINA','05',1,10),(10,'1713841763','0980513332','2004-09-06','PANAMÁ Y OLMEDO','04',1,11),(11,'0401478417','0960752910','1999-09-01','ANTISANA PULIDA Y MAGDALENA','05',1,12),(12,'0402082986','0967164429','1995-03-13','CALLE MANUEL YEPEZ CASA COLOR BLANCO','05',1,13),(13,'0401488952','0939911099','1995-10-02','TULCÁN /AV. VENTIMILLA Y ALEJANDRO R.MERA','05',1,14),(14,'0400875613','0980601552','1999-10-12','TUNGURAHUA Y 10 DE AGOSTO','05',1,15),(15,'0401624176','0991133675','1998-09-03','CDLA. PADRE CARLOS DE LA VEGA - MANUEL MACHADO Y JORGE MANRIQUE','05',1,16),(16,'0401497185','0991571113','2000-03-10','EL ROSARIO REGISTRO CIVIL','05',1,17),(17,'0401641378','0994541825','1996-03-02','ANDRES BELLO','05',1,18),(18,'0402075162','0985880436','1998-11-11','MALDONADO Y CARABOBO ','04',1,19),(19,'0402037238','0969531603','1997-01-10','COLON Y ORIENTE','05',1,20),(20,'0401054077','0958871303','1999-08-08','CALLE ARGENTINA TRAS DEL COLEGIO BOLIVAR','05',1,21);
/*!40000 ALTER TABLE `pos_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_expense`
--

DROP TABLE IF EXISTS `pos_expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_expense` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(500) DEFAULT NULL,
  `date_joined` date NOT NULL,
  `amount` decimal(9,2) NOT NULL,
  `expense_type_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pos_expense_expense_type_id_5dc84768_fk_pos_expensetype_id` (`expense_type_id`),
  CONSTRAINT `pos_expense_expense_type_id_5dc84768_fk_pos_expensetype_id` FOREIGN KEY (`expense_type_id`) REFERENCES `pos_expensetype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_expense`
--

LOCK TABLES `pos_expense` WRITE;
/*!40000 ALTER TABLE `pos_expense` DISABLE KEYS */;
/*!40000 ALTER TABLE `pos_expense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_expensetype`
--

DROP TABLE IF EXISTS `pos_expensetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_expensetype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_expensetype`
--

LOCK TABLES `pos_expensetype` WRITE;
/*!40000 ALTER TABLE `pos_expensetype` DISABLE KEYS */;
INSERT INTO `pos_expensetype` VALUES (1,'AGUA'),(4,'ALQUILER'),(8,'COMBUSTIBLE'),(2,'ELECTRICIDAD'),(3,'GAS'),(6,'INTERNET'),(9,'MANTENIMIENTO'),(15,'OFICINA'),(14,'PUBLICIDAD'),(7,'SALARIOS'),(12,'SEGURIDAD'),(13,'SEGUROS'),(10,'SUMINISTROS'),(5,'TELÉFONO'),(11,'TRANSPORTE');
/*!40000 ALTER TABLE `pos_expensetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_invoice`
--

DROP TABLE IF EXISTS `pos_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_invoice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_joined` date NOT NULL,
  `subtotal_without_tax` decimal(9,2) NOT NULL,
  `subtotal_with_tax` decimal(9,2) NOT NULL,
  `tax` decimal(9,2) NOT NULL,
  `total_tax` decimal(9,2) NOT NULL,
  `total_discount` decimal(9,2) NOT NULL,
  `total_amount` decimal(9,2) NOT NULL,
  `time_joined` datetime(6) NOT NULL,
  `receipt_number` varchar(9) DEFAULT NULL,
  `receipt_number_full` varchar(20) DEFAULT NULL,
  `environment_type` int(10) unsigned NOT NULL CHECK (`environment_type` >= 0),
  `access_code` varchar(49) DEFAULT NULL,
  `authorized_date` datetime(6) DEFAULT NULL,
  `authorized_xml` varchar(100) DEFAULT NULL,
  `authorized_pdf` varchar(100) DEFAULT NULL,
  `create_electronic_invoice` tinyint(1) NOT NULL,
  `additional_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`additional_info`)),
  `status` varchar(50) NOT NULL,
  `payment_type` varchar(50) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `time_limit` int(11) NOT NULL,
  `end_credit` date NOT NULL,
  `cash` decimal(9,2) NOT NULL,
  `change` decimal(9,2) NOT NULL,
  `is_draft_invoice` tinyint(1) NOT NULL,
  `company_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  `receipt_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pos_invoice_company_id_94f0a799_fk_pos_company_id` (`company_id`),
  KEY `pos_invoice_customer_id_1f94ced1_fk_pos_customer_id` (`customer_id`),
  KEY `pos_invoice_employee_id_c3e020f8_fk_user_user_id` (`employee_id`),
  KEY `pos_invoice_receipt_id_d7278b8d_fk_pos_receipt_id` (`receipt_id`),
  CONSTRAINT `pos_invoice_company_id_94f0a799_fk_pos_company_id` FOREIGN KEY (`company_id`) REFERENCES `pos_company` (`id`),
  CONSTRAINT `pos_invoice_customer_id_1f94ced1_fk_pos_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `pos_customer` (`id`),
  CONSTRAINT `pos_invoice_employee_id_c3e020f8_fk_user_user_id` FOREIGN KEY (`employee_id`) REFERENCES `user_user` (`id`),
  CONSTRAINT `pos_invoice_receipt_id_d7278b8d_fk_pos_receipt_id` FOREIGN KEY (`receipt_id`) REFERENCES `pos_receipt` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_invoice`
--

LOCK TABLES `pos_invoice` WRITE;
/*!40000 ALTER TABLE `pos_invoice` DISABLE KEYS */;
INSERT INTO `pos_invoice` VALUES (2,'2026-06-26',0.00,1.00,0.15,0.15,0.00,1.15,'2026-06-26 17:06:40.062520','000084857','006-006-000084857',1,NULL,NULL,'','',0,'[]','without_authorizing','efectivo','20',31,'2026-06-26',0.00,0.00,0,1,1,1,1),(4,'2026-06-29',0.00,2.25,0.15,0.34,0.00,2.59,'2026-06-30 00:10:51.693988','000084858','006-006-000084858',1,'2906202601100237602600110060060000848581787863512','2026-06-30 00:10:54.000000','authorized_xml/2026/06/29/xml/FACTURA-006-006-000084858.xml','',1,'{}','authorized','efectivo','20',31,'2026-06-29',0.00,0.00,0,1,1,NULL,1);
/*!40000 ALTER TABLE `pos_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_invoicedetail`
--

DROP TABLE IF EXISTS `pos_invoicedetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_invoicedetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `price` decimal(9,4) NOT NULL,
  `price_with_tax` decimal(9,4) NOT NULL,
  `subtotal` decimal(9,4) NOT NULL,
  `tax` decimal(9,4) NOT NULL,
  `total_tax` decimal(9,4) NOT NULL,
  `discount` decimal(9,4) NOT NULL,
  `total_discount` decimal(9,4) NOT NULL,
  `total_amount` decimal(9,4) NOT NULL,
  `invoice_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pos_invoicedetail_invoice_id_810719a5_fk_pos_invoice_id` (`invoice_id`),
  KEY `pos_invoicedetail_product_id_3534a242_fk_pos_product_id` (`product_id`),
  CONSTRAINT `pos_invoicedetail_invoice_id_810719a5_fk_pos_invoice_id` FOREIGN KEY (`invoice_id`) REFERENCES `pos_invoice` (`id`),
  CONSTRAINT `pos_invoicedetail_product_id_3534a242_fk_pos_product_id` FOREIGN KEY (`product_id`) REFERENCES `pos_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_invoicedetail`
--

LOCK TABLES `pos_invoicedetail` WRITE;
/*!40000 ALTER TABLE `pos_invoicedetail` DISABLE KEYS */;
INSERT INTO `pos_invoicedetail` VALUES (2,1,1.0000,1.1500,1.0000,0.1500,0.1500,0.0000,0.0000,1.0000,2,9),(4,1,2.2500,2.5875,2.2500,0.1500,0.3375,0.0000,0.0000,2.2500,4,1);
/*!40000 ALTER TABLE `pos_invoicedetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_product`
--

DROP TABLE IF EXISTS `pos_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `code` varchar(50) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `price` decimal(9,4) NOT NULL,
  `pvp` decimal(9,4) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `barcode` varchar(100) DEFAULT NULL,
  `is_inventoried` tinyint(1) NOT NULL,
  `stock` int(11) NOT NULL,
  `has_tax` tinyint(1) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `pos_product_category_id_28aa8bd5_fk_pos_category_id` (`category_id`),
  CONSTRAINT `pos_product_category_id_28aa8bd5_fk_pos_category_id` FOREIGN KEY (`category_id`) REFERENCES `pos_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_product`
--

LOCK TABLES `pos_product` WRITE;
/*!40000 ALTER TABLE `pos_product` DISABLE KEYS */;
INSERT INTO `pos_product` VALUES (1,'BORRADOR GRANDE PZ 20','7703064446502',NULL,2.2500,2.2500,'','barcode/2026/06/15/7703064446502.png',1,0,1,1),(2,'PINTURA MI NOTA LARGA X 12','7862116784464',NULL,5.5000,5.5000,'','barcode/2026/06/15/7862116784464_DtodTzk.png',1,33,1,1),(3,'CARPETA TAPA TRANSPARENTE DM OFICIO','7862108142807',NULL,4.2500,4.2500,'','barcode/2026/06/15/7862108142807_dGKofVU.png',1,27,1,2),(4,'CARTULINAS A4 MI NOTA X 25 COLORES','7862116781197',NULL,1.5000,1.5000,'','barcode/2026/06/15/7862116781197_H1DhX7R.png',1,33,1,1),(5,'GOMA SOL 250 GR','7862102580810',NULL,1.0900,1.2500,'','barcode/2026/06/15/7862102580810.png',1,45,1,1),(6,'GOMA EN BARRA GRANDE 36 GR ESTILO','7861098342631',NULL,0.6500,0.7500,'','barcode/2026/06/15/7861098342631.png',1,0,1,1),(7,'FOMIX A4 LLANO SURTIDO X 10','8699101005636',NULL,0.8700,1.0000,'','barcode/2026/06/15/8699101005636.png',1,56,1,1),(8,'FOMIX A4 ESCARCHADO SURTIDO X 10 IMPORTADO','8699010005819',NULL,1.3000,1.5000,'','barcode/2026/06/15/8699010005819.png',1,63,1,1),(9,'PAPEL BOND X 100','173605',NULL,0.8700,1.0000,'','barcode/2026/06/15/173605.png',1,45,1,1),(10,'PLIEGO PAPEL BOND 4L','173626',NULL,0.2200,0.2500,'','barcode/2026/06/15/173626.png',1,0,1,1),(11,'CREPE PAPEL','173628',NULL,0.2200,0.2500,'','barcode/2026/06/15/173628_EbUCES6.png',1,50,1,1),(12,'PAPEL BRILLANTE A4 MI NOTA','7862116780671',NULL,0.4300,0.4900,'','barcode/2026/06/15/7862116780671.png',1,0,1,3),(13,'LAPIZ MONGOL','7808718509586',NULL,0.2600,0.3000,'','barcode/2026/06/15/7808718509586_Lw9vriZ.png',1,38,1,1),(14,'MARCADOR BORRABLE NEGRO MI NOTA','7862116789971',NULL,0.4300,0.4900,'','barcode/2026/06/15/7862116789971.png',1,0,1,4),(15,'MARCADOR BORRABLE AZUL MI NOTA','7862116789964',NULL,0.4300,0.4900,'','barcode/2026/06/15/7862116789964_meLhcJ2.png',1,29,1,4),(16,'MARCADOR BORRABLE ROJO MI NOTA','7862116789988',NULL,0.4300,0.4900,'','barcode/2026/06/15/7862116789988.png',1,52,1,4),(17,'MARCADOR PERMANENTE AZUL MI NOTA','7862116789926',NULL,0.4300,0.4900,'','barcode/2026/06/15/7862116789926_ClIE4ue.png',1,33,1,4),(18,'MARCADOR PERMANENTE ROJO MI NOTA','7862116789940',NULL,0.4300,0.4900,'','barcode/2026/06/15/7862116789940_ue4nJ4o.png',1,10,1,4),(19,'BARRAS DE SILICON DELGADA','173579',NULL,0.1300,0.1500,'','barcode/2026/06/15/173579.png',1,0,1,1),(20,'REGLA JEFF 20 CM','4712856532067',NULL,0.2200,0.2500,'','barcode/2026/06/15/4712856532067.png',1,0,1,1),(21,'SACAPUNTAS METAL 1 SERVICIO','3154145063004',NULL,0.2200,0.2500,'','barcode/2026/06/15/3154145063004.png',1,0,1,1),(22,'TIJERA ESCOLAR ESTILO','7861098323395',NULL,0.4300,0.4900,'','barcode/2026/06/15/7861098323395_eBmuoMX.png',1,23,1,4),(23,'MASKING DESK 36 X 40','7862108198309',NULL,1.3000,1.5000,'','barcode/2026/06/15/7862108198309.png',1,0,1,5),(24,'ULAS DM PEQUEÑAS','173623',NULL,1.3000,1.5000,'','barcode/2026/06/15/173623_7LbIa8i.png',1,22,1,1),(25,'CUERDA DE SALTAR MEDIANA','7861143604288',NULL,1.1700,1.3500,'','barcode/2026/06/15/7861143604288.png',1,0,1,1),(26,'PINCEL 12','7862117674023',NULL,0.6500,0.7500,'','barcode/2026/06/15/7862117674023.png',1,52,1,3),(27,'TAPTANA','173656',NULL,4.3000,4.9500,'','barcode/2026/06/15/173656_Easfwss.png',1,22,1,1),(28,'PAPEL HIGIENICO X 2','7861175503887',NULL,0.4300,0.4900,'','barcode/2026/06/15/7861175503887.png',1,38,1,1),(29,'TOALLA ESCOLAR','786000012',NULL,0.6500,0.7500,'','barcode/2026/06/15/786000012.png',1,0,1,3),(30,'CANDANDO MINI','6322255306305',NULL,0.7400,0.8500,'','barcode/2026/06/15/6322255306305_HF8DZaH.png',1,102,1,1),(31,'FORROS PEQUEÑO','786059801',NULL,0.1300,0.1500,'','barcode/2026/06/15/786059801.png',1,83,1,6),(32,'FORROS PLASTICO UNIV COSIDO','173587',NULL,0.1700,0.2000,'','barcode/2026/06/15/173587_8DuP7Ge.png',1,10,1,1),(33,'CUADERNO COSIDO CUADROS ESTILO','7862108144948',NULL,1.0400,1.2000,'','barcode/2026/06/15/7862108144948_EiZlD87.png',1,32,1,1),(34,'CUADERNO COSIDO 4 LINEAS ESTILO','7861098306886',NULL,1.0400,1.2000,'','barcode/2026/06/15/7861098306886.png',1,0,1,1),(35,'CUADERNO GRAPADO 30H CUADROS','7861084211330',NULL,0.4300,0.4900,'','barcode/2026/06/15/7861084211330.png',1,0,1,1),(36,'NACHO','9789942851505',NULL,2.7500,3.1600,'','barcode/2026/06/15/9789942851505.png',1,0,1,1),(37,'TEMPERA LINEA AZUL X 6','7862108203966',NULL,1.0900,1.2500,'','barcode/2026/06/15/7862108203966_84zhUhd.png',1,23,1,5),(38,'PLASTILINA CARIOCA LARGA X 12','7861129531072',NULL,1.0900,1.2500,'','barcode/2026/06/15/7861129531072_lE8lnlo.png',1,9,1,1),(39,'PAPEL CONTAC TRANSPARENTE BESTER','7861123902458',NULL,1.9600,2.2500,'','barcode/2026/06/15/7861123902458.png',1,0,1,1);
/*!40000 ALTER TABLE `pos_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_promotion`
--

DROP TABLE IF EXISTS `pos_promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_promotion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_promotion`
--

LOCK TABLES `pos_promotion` WRITE;
/*!40000 ALTER TABLE `pos_promotion` DISABLE KEYS */;
/*!40000 ALTER TABLE `pos_promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_promotiondetail`
--

DROP TABLE IF EXISTS `pos_promotiondetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_promotiondetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `current_price` decimal(9,4) NOT NULL,
  `discount` decimal(9,4) NOT NULL,
  `total_discount` decimal(9,4) NOT NULL,
  `final_price` decimal(9,4) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `promotion_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pos_promotiondetail_product_id_affee462_fk_pos_product_id` (`product_id`),
  KEY `pos_promotiondetail_promotion_id_a9f7b1b4_fk_pos_promotion_id` (`promotion_id`),
  CONSTRAINT `pos_promotiondetail_product_id_affee462_fk_pos_product_id` FOREIGN KEY (`product_id`) REFERENCES `pos_product` (`id`),
  CONSTRAINT `pos_promotiondetail_promotion_id_a9f7b1b4_fk_pos_promotion_id` FOREIGN KEY (`promotion_id`) REFERENCES `pos_promotion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_promotiondetail`
--

LOCK TABLES `pos_promotiondetail` WRITE;
/*!40000 ALTER TABLE `pos_promotiondetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `pos_promotiondetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_provider`
--

DROP TABLE IF EXISTS `pos_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_provider` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `ruc` varchar(13) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address` varchar(500) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `ruc` (`ruc`),
  UNIQUE KEY `mobile` (`mobile`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_provider`
--

LOCK TABLES `pos_provider` WRITE;
/*!40000 ALTER TABLE `pos_provider` DISABLE KEYS */;
INSERT INTO `pos_provider` VALUES (1,'Corporación Favorita','1790174562','0987654321','Av. de los Shyris 195, Quito','contacto@favorita.com'),(2,'Distribuidora Nacional de Alimentos','1790165789','0998765432','Calle 9 de Octubre 750, Guayaquil','ventas@dnalimentos.com'),(3,'Supermercados Tía','1790178294','0986543210','Av. Francisco de Orellana, Guayaquil','proveedores@tia.com'),(4,'Café San Blas','1790154321','0984321098','Calle Bolívar 125, Loja','contacto@cafesanblas.com'),(5,'La Fabril','1790164567','0993210987','Av. Juan Tanca Marengo, Guayaquil','ventas@lafabril.com'),(6,'Industrias Lácteas San Juan','1790171234','0972109876','Calle José Mascote 250, Quito','contacto@sanjuanleche.com'),(7,'Petroamazonas','1790198765','0982109876','Av. Amazonas 800, Quito','info@petroamazonas.com'),(8,'Cervecería Nacional','1790167898','0971098765','Calle Jacinto de la Peña, Guayaquil','proveedores@cerveceria.com'),(9,'Alpina Ecuador','1790189876','0987654320','Av. América 950, Quito','contacto@alpina.com'),(10,'Ferroaluminio','1790178765','0998321098','Calle Norte 400, Ambato','contacto@ferroaluminio.com'),(11,'Arcos Dorados','1790159876','0972108765','Av. de la Prensa 75, Quito','ventas@arcosdorados.com'),(12,'Aceites Naranjo','1790176543','0987651209','Calle 24 de Mayo 700, Guayaquil','info@aceitesnaranjo.com'),(13,'La Universal','1790172345','0986541098','Calle de la 6 de Diciembre, Guayaquil','ventas@launiversal.com'),(14,'Maresa Ecuador','1790198745','0988765432','Calle Pérez Guerrero 130, Quito','informes@maresa.com');
/*!40000 ALTER TABLE `pos_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_purchase`
--

DROP TABLE IF EXISTS `pos_purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_purchase` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` varchar(8) NOT NULL,
  `payment_type` varchar(50) NOT NULL,
  `date_joined` date NOT NULL,
  `end_credit` date NOT NULL,
  `subtotal` decimal(9,2) NOT NULL,
  `tax` decimal(9,2) NOT NULL,
  `total_tax` decimal(9,2) NOT NULL,
  `total_amount` decimal(9,2) NOT NULL,
  `provider_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`),
  KEY `pos_purchase_provider_id_835fe47e_fk_pos_provider_id` (`provider_id`),
  CONSTRAINT `pos_purchase_provider_id_835fe47e_fk_pos_provider_id` FOREIGN KEY (`provider_id`) REFERENCES `pos_provider` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_purchase`
--

LOCK TABLES `pos_purchase` WRITE;
/*!40000 ALTER TABLE `pos_purchase` DISABLE KEYS */;
INSERT INTO `pos_purchase` VALUES (1,'97196107','efectivo','2026-06-15','2026-06-15',128.25,0.00,0.00,128.25,8),(2,'70984097','efectivo','2026-06-15','2026-06-15',48.00,0.00,0.00,48.00,5),(3,'14565475','efectivo','2026-06-15','2026-06-15',314.27,0.00,0.00,314.27,14),(4,'88142707','efectivo','2026-06-15','2026-06-15',35.28,0.00,0.00,35.28,7),(5,'61751059','efectivo','2026-06-15','2026-06-15',196.07,0.00,0.00,196.07,4),(6,'02894046','efectivo','2026-06-15','2026-06-15',44.92,0.00,0.00,44.92,2),(7,'57564034','efectivo','2026-06-15','2026-06-15',143.26,0.00,0.00,143.26,9),(8,'81866440','efectivo','2026-06-15','2026-06-15',162.45,0.00,0.00,162.45,12);
/*!40000 ALTER TABLE `pos_purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_purchasedetail`
--

DROP TABLE IF EXISTS `pos_purchasedetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_purchasedetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `price` decimal(9,4) NOT NULL,
  `subtotal` decimal(9,4) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `purchase_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pos_purchasedetail_product_id_7d6eb5a0_fk_pos_product_id` (`product_id`),
  KEY `pos_purchasedetail_purchase_id_06994b38_fk_pos_purchase_id` (`purchase_id`),
  CONSTRAINT `pos_purchasedetail_product_id_7d6eb5a0_fk_pos_product_id` FOREIGN KEY (`product_id`) REFERENCES `pos_product` (`id`),
  CONSTRAINT `pos_purchasedetail_purchase_id_06994b38_fk_pos_purchase_id` FOREIGN KEY (`purchase_id`) REFERENCES `pos_purchase` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_purchasedetail`
--

LOCK TABLES `pos_purchasedetail` WRITE;
/*!40000 ALTER TABLE `pos_purchasedetail` DISABLE KEYS */;
INSERT INTO `pos_purchasedetail` VALUES (1,37,1.0000,37.0000,7,1),(2,23,1.0000,23.0000,9,1),(3,38,1.5000,57.0000,8,1),(4,9,1.2500,11.2500,5,1),(5,14,1.5000,21.0000,4,2),(6,26,0.8500,22.1000,30,2),(7,10,0.4900,4.9000,18,2),(8,45,0.1500,6.7500,31,3),(9,27,4.2500,114.7500,3,3),(10,33,5.5000,181.5000,2,3),(11,23,0.4900,11.2700,22,3),(12,28,0.4900,13.7200,28,4),(13,44,0.4900,21.5600,16,4),(14,8,0.4900,3.9200,16,5),(15,10,0.4900,4.9000,28,5),(16,9,1.2500,11.2500,38,5),(17,38,0.1500,5.7000,31,5),(18,25,1.5000,37.5000,8,5),(19,50,0.2500,12.5000,11,5),(20,22,4.9500,108.9000,27,5),(21,38,0.3000,11.4000,13,5),(22,33,0.4900,16.1700,17,6),(23,23,1.2500,28.7500,37,6),(24,32,1.2000,38.4000,33,7),(25,26,0.7500,19.5000,26,7),(26,15,1.5000,22.5000,4,7),(27,22,1.0000,22.0000,9,7),(28,29,0.8500,24.6500,30,7),(29,10,0.2000,2.0000,32,7),(30,29,0.4900,14.2100,15,7),(31,47,0.8500,39.9500,30,8),(32,26,0.7500,19.5000,26,8),(33,36,1.2500,45.0000,5,8),(34,22,1.5000,33.0000,24,8),(35,4,1.5000,6.0000,4,8),(36,19,1.0000,19.0000,7,8);
/*!40000 ALTER TABLE `pos_purchasedetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_quotation`
--

DROP TABLE IF EXISTS `pos_quotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_quotation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_joined` date NOT NULL,
  `subtotal_without_tax` decimal(9,2) NOT NULL,
  `subtotal_with_tax` decimal(9,2) NOT NULL,
  `tax` decimal(9,2) NOT NULL,
  `total_tax` decimal(9,2) NOT NULL,
  `total_discount` decimal(9,2) NOT NULL,
  `total_amount` decimal(9,2) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `company_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pos_quotation_company_id_1adc83b6_fk_pos_company_id` (`company_id`),
  KEY `pos_quotation_customer_id_6dc1f6b7_fk_pos_customer_id` (`customer_id`),
  KEY `pos_quotation_employee_id_a453ab29_fk_user_user_id` (`employee_id`),
  CONSTRAINT `pos_quotation_company_id_1adc83b6_fk_pos_company_id` FOREIGN KEY (`company_id`) REFERENCES `pos_company` (`id`),
  CONSTRAINT `pos_quotation_customer_id_6dc1f6b7_fk_pos_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `pos_customer` (`id`),
  CONSTRAINT `pos_quotation_employee_id_a453ab29_fk_user_user_id` FOREIGN KEY (`employee_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_quotation`
--

LOCK TABLES `pos_quotation` WRITE;
/*!40000 ALTER TABLE `pos_quotation` DISABLE KEYS */;
/*!40000 ALTER TABLE `pos_quotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_quotationdetail`
--

DROP TABLE IF EXISTS `pos_quotationdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_quotationdetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `price` decimal(9,4) NOT NULL,
  `price_with_tax` decimal(9,4) NOT NULL,
  `subtotal` decimal(9,4) NOT NULL,
  `tax` decimal(9,4) NOT NULL,
  `total_tax` decimal(9,4) NOT NULL,
  `discount` decimal(9,4) NOT NULL,
  `total_discount` decimal(9,4) NOT NULL,
  `total_amount` decimal(9,4) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `quotation_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pos_quotationdetail_product_id_09e94bfe_fk_pos_product_id` (`product_id`),
  KEY `pos_quotationdetail_quotation_id_0f36da2f_fk_pos_quotation_id` (`quotation_id`),
  CONSTRAINT `pos_quotationdetail_product_id_09e94bfe_fk_pos_product_id` FOREIGN KEY (`product_id`) REFERENCES `pos_product` (`id`),
  CONSTRAINT `pos_quotationdetail_quotation_id_0f36da2f_fk_pos_quotation_id` FOREIGN KEY (`quotation_id`) REFERENCES `pos_quotation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_quotationdetail`
--

LOCK TABLES `pos_quotationdetail` WRITE;
/*!40000 ALTER TABLE `pos_quotationdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `pos_quotationdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_receipt`
--

DROP TABLE IF EXISTS `pos_receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_receipt` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `voucher_type` varchar(10) NOT NULL,
  `establishment_code` varchar(3) NOT NULL,
  `issuing_point_code` varchar(3) NOT NULL,
  `sequence` int(10) unsigned NOT NULL CHECK (`sequence` >= 0),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_receipt`
--

LOCK TABLES `pos_receipt` WRITE;
/*!40000 ALTER TABLE `pos_receipt` DISABLE KEYS */;
INSERT INTO `pos_receipt` VALUES (1,'01','006','006',84858),(2,'04','006','006',93197),(3,'08','006','006',0);
/*!40000 ALTER TABLE `pos_receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_receipterror`
--

DROP TABLE IF EXISTS `pos_receipterror`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_receipterror` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_joined` date NOT NULL,
  `time_joined` datetime(6) NOT NULL,
  `environment_type` int(10) unsigned NOT NULL CHECK (`environment_type` >= 0),
  `receipt_number_full` varchar(50) NOT NULL,
  `stage` varchar(20) NOT NULL,
  `errors` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`errors`)),
  `receipt_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pos_receipterror_receipt_id_1f244a8a_fk_pos_receipt_id` (`receipt_id`),
  CONSTRAINT `pos_receipterror_receipt_id_1f244a8a_fk_pos_receipt_id` FOREIGN KEY (`receipt_id`) REFERENCES `pos_receipt` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_receipterror`
--

LOCK TABLES `pos_receipterror` WRITE;
/*!40000 ALTER TABLE `pos_receipterror` DISABLE KEYS */;
INSERT INTO `pos_receipterror` VALUES (2,'2026-06-26','2026-06-26 17:06:23.109940',1,'006-006-000084857','xml_signature','{\"resp\": false, \"stage\": \"xml_signature\", \"error\": \"[Errno 2] No such file or directory: \'java\'\"}',1);
/*!40000 ALTER TABLE `pos_receipterror` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security_dashboard`
--

DROP TABLE IF EXISTS `security_dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `security_dashboard` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `author` varchar(120) NOT NULL,
  `footer_url` varchar(200) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `icon` varchar(500) NOT NULL,
  `layout` int(11) NOT NULL,
  `card` varchar(50) NOT NULL,
  `navbar` varchar(50) NOT NULL,
  `brand_logo` varchar(50) NOT NULL,
  `sidebar` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_dashboard`
--

LOCK TABLES `security_dashboard` WRITE;
/*!40000 ALTER TABLE `security_dashboard` DISABLE KEYS */;
INSERT INTO `security_dashboard` VALUES (1,'INVOICE','Ardila App','https://algorisoft.com','dashboard/2026/06/15/logo_OACJtB3.png','fas fa-shopping-cart',1,' ','navbar-dark navbar-navy',' ','sidebar-dark-navy');
/*!40000 ALTER TABLE `security_dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security_groupmodule`
--

DROP TABLE IF EXISTS `security_groupmodule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `security_groupmodule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `module_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `security_groupmodule_group_id_046c92f7_fk_auth_group_id` (`group_id`),
  KEY `security_groupmodule_module_id_27738d2a_fk_security_module_id` (`module_id`),
  CONSTRAINT `security_groupmodule_group_id_046c92f7_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `security_groupmodule_module_id_27738d2a_fk_security_module_id` FOREIGN KEY (`module_id`) REFERENCES `security_module` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_groupmodule`
--

LOCK TABLES `security_groupmodule` WRITE;
/*!40000 ALTER TABLE `security_groupmodule` DISABLE KEYS */;
INSERT INTO `security_groupmodule` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,26),(25,1,27),(26,1,28),(27,1,29),(28,1,30),(29,1,31),(30,1,32),(31,1,33),(32,1,35),(33,2,7),(34,2,24),(35,2,25),(36,2,34);
/*!40000 ALTER TABLE `security_groupmodule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security_module`
--

DROP TABLE IF EXISTS `security_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `security_module` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(250) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `icon` varchar(30) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `module_type_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `security_module_module_type_id_7c4505db_fk_security_` (`module_type_id`),
  CONSTRAINT `security_module_module_type_id_7c4505db_fk_security_` FOREIGN KEY (`module_type_id`) REFERENCES `security_moduletype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_module`
--

LOCK TABLES `security_module` WRITE;
/*!40000 ALTER TABLE `security_module` DISABLE KEYS */;
INSERT INTO `security_module` VALUES (1,'/security/module/type/','Tipos de Módulos','Permite administrar los tipos de módulos del sistema','fas fa-door-open','',1),(2,'/security/module/','Módulos','Permite administrar los módulos del sistema','fas fa-th-large','',1),(3,'/security/group/','Grupos','Permite administrar los grupos de usuarios del sistema','fas fa-users','',1),(4,'/security/dashboard/update/','Conf. Dashboard','Permite configurar los datos de la plantilla','fas fa-tools','',1),(5,'/security/user/access/','Accesos','Permite administrar los accesos de los usuarios','fas fa-user-secret','',1),(6,'/user/','Usuarios','Permite administrar a los administradores del sistema','fas fa-user','',1),(7,'/user/update/password/','Cambiar password','Permite cambiar tu password de tu cuenta','fas fa-key','',NULL),(8,'/user/update/profile/','Editar perfil','Permite cambiar la información de tu cuenta','fas fa-user','',NULL),(9,'/pos/provider/','Proveedores','Permite administrar a los proveedores de las compras','fas fa-truck','',2),(10,'/pos/category/','Categorías','Permite administrar las categorías de los productos','fas fa-truck-loading','',2),(11,'/pos/product/','Productos','Permite administrar los productos del sistema','fas fa-box','',2),(12,'/pos/purchase/','Compras','Permite administrar las compras de los productos','fas fa-dolly-flatbed','',2),(13,'/pos/product/stock/adjustment/','Ajuste de Stock','Permite administrar los ajustes de stock de productos','fas fa-sliders-h','',2),(14,'/pos/expense/type/','Tipos de Gastos','Permite administrar los tipos de gastos','fas fa-comments-dollar','',3),(15,'/pos/expense/','Gastos','Permite administrar los gastos de la compañia','fas fa-file-invoice-dollar','',3),(16,'/pos/account/receivable/','Cuentas por cobrar','Permite administrar las cuentas por cobrar de los clientes','fas fa-funnel-dollar','',3),(17,'/pos/account/payable/','Cuentas por pagar','Permite administrar las cuentas por pagar de los proveedores','fas fa-money-check-alt','',3),(18,'/pos/customer/','Clientes','Permite administrar los clientes del sistema','fas fa-user-friends','',4),(19,'/pos/receipt/','Comprobantes','Permite administrar los tipos de comprobantes para la facturación','fas fa-file-export','',4),(20,'/pos/receipt/error/','Errores de Comprob.','Permite administrar los errores de los comprobantes de las facturas','fas fa-file-archive','',4),(21,'/pos/invoice/admin/','Facturas','Permite administrar las ventas de los productos','fas fa-shopping-cart','',4),(22,'/pos/quotation/','Proformas','Permite administrar las cotizaciones de los clientes','fa-solid fa-file-lines','',4),(23,'/pos/credit/note/admin/','Notas de Credito','Permite administrar las notas de créditos de las ventas','fa-solid fa-boxes-packing','',4),(24,'/pos/invoice/customer/','Facturas','Permite administrar las ventas de los productos','fas fa-shopping-cart','',NULL),(25,'/pos/credit/note/customer/','Notas de Credito','Permite administrar las notas de créditos de las ventas','fa-solid fa-boxes-packing','',NULL),(26,'/pos/promotion/','Promociones','Permite administrar las promociones de los productos','far fa-calendar-check','',4),(27,'/report/invoice/','Facturas','Permite ver los reportes de las ventas','fas fa-chart-bar','',5),(28,'/report/purchase/','Compras','Permite ver los reportes de las compras','fas fa-chart-bar','',5),(29,'/report/expense/','Gastos','Permite ver los reportes de los gastos','fas fa-chart-bar','',5),(30,'/report/account/payable/','Cuentas por Pagar','Permite ver los reportes de las cuentas por pagar','fas fa-chart-bar','',5),(31,'/report/account/receivable/','Cuentas por Cobrar','Permite ver los reportes de las cuentas por cobrar','fas fa-chart-bar','',5),(32,'/report/result/','Resultados','Permite ver los reportes de pérdidas y ganancias','fas fa-chart-bar','',5),(33,'/report/earning/','Ganancias','Permite ver los reportes de las ganancias','fas fa-chart-bar','',5),(34,'/pos/customer/update/profile/','Editar perfil','Permite cambiar la información de tu cuenta','fas fa-user','',NULL),(35,'/pos/company/update/','Compañia','Permite gestionar la información de la compañia','fas fa-building','',NULL);
/*!40000 ALTER TABLE `security_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security_module_permissions`
--

DROP TABLE IF EXISTS `security_module_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `security_module_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `security_module_permissi_module_id_permission_id_19ff829b_uniq` (`module_id`,`permission_id`),
  KEY `security_module_perm_permission_id_088d4204_fk_auth_perm` (`permission_id`),
  CONSTRAINT `security_module_perm_module_id_d16f89bb_fk_security_` FOREIGN KEY (`module_id`) REFERENCES `security_module` (`id`),
  CONSTRAINT `security_module_perm_permission_id_088d4204_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_module_permissions`
--

LOCK TABLES `security_module_permissions` WRITE;
/*!40000 ALTER TABLE `security_module_permissions` DISABLE KEYS */;
INSERT INTO `security_module_permissions` VALUES (1,1,83),(2,1,84),(3,1,85),(4,1,86),(6,2,89),(7,2,90),(8,2,91),(5,2,92),(10,3,9),(11,3,10),(12,3,11),(9,3,12),(13,4,82),(14,5,87),(15,5,88),(17,6,93),(18,6,94),(19,6,95),(16,6,96),(21,9,59),(22,9,60),(23,9,61),(20,9,62),(25,10,27),(26,10,28),(27,10,29),(24,10,30),(28,11,50),(29,11,51),(30,11,52),(31,11,53),(32,12,63),(33,12,64),(34,12,65),(35,13,54),(36,14,40),(37,14,41),(38,14,42),(39,14,43),(41,15,36),(42,15,37),(43,15,38),(40,15,39),(44,16,24),(45,16,25),(46,16,26),(47,17,21),(48,17,22),(49,17,23),(51,18,32),(52,18,33),(53,18,34),(50,18,35),(55,19,71),(56,19,72),(57,19,73),(54,19,74),(58,20,75),(59,20,76),(60,21,44),(61,21,45),(62,21,46),(63,21,47),(64,21,49),(65,22,66),(66,22,67),(67,22,68),(68,22,69),(69,22,70),(70,23,77),(71,23,78),(72,23,79),(73,23,81),(74,24,48),(75,24,49),(76,25,80),(77,25,81),(79,26,55),(80,26,56),(81,26,57),(78,26,58),(82,35,31);
/*!40000 ALTER TABLE `security_module_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security_moduletype`
--

DROP TABLE IF EXISTS `security_moduletype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `security_moduletype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `icon` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `icon` (`icon`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_moduletype`
--

LOCK TABLES `security_moduletype` WRITE;
/*!40000 ALTER TABLE `security_moduletype` DISABLE KEYS */;
INSERT INTO `security_moduletype` VALUES (1,'Seguridad','fas fa-lock'),(2,'Bodega','fas fa-boxes'),(3,'Administrativo','fas fa-hand-holding-usd'),(4,'Facturación','fas fa-calculator'),(5,'Reportes','fas fa-chart-pie');
/*!40000 ALTER TABLE `security_moduletype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security_useraccess`
--

DROP TABLE IF EXISTS `security_useraccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `security_useraccess` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_joined` date NOT NULL,
  `hour` time(6) NOT NULL,
  `remote_addr` varchar(100) DEFAULT NULL,
  `http_user_agent` varchar(150) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `security_useraccess_user_id_8630fb23_fk_user_user_id` (`user_id`),
  CONSTRAINT `security_useraccess_user_id_8630fb23_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_useraccess`
--

LOCK TABLES `security_useraccess` WRITE;
/*!40000 ALTER TABLE `security_useraccess` DISABLE KEYS */;
INSERT INTO `security_useraccess` VALUES (1,'2026-06-15','22:05:15.887001','127.0.0.1','PC / Windows 10 / Chrome 149.0.0',1),(2,'2026-06-17','19:55:47.266606','127.0.0.1','PC / Windows 10 / Chrome 147.0.0',1),(3,'2026-06-17','21:29:18.747584','127.0.0.1','PC / Windows 10 / Chrome 149.0.0',1),(4,'2026-06-29','00:08:08.859029','127.0.0.1','PC / Windows 10 / Chrome 149.0.0',1);
/*!40000 ALTER TABLE `security_useraccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user`
--

DROP TABLE IF EXISTS `user_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `names` varchar(150) DEFAULT NULL,
  `username` varchar(150) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `is_password_change` tinyint(1) NOT NULL,
  `password_reset_token` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user`
--

LOCK TABLES `user_user` WRITE;
/*!40000 ALTER TABLE `user_user` DISABLE KEYS */;
INSERT INTO `user_user` VALUES (1,'pbkdf2_sha256$720000$UX5ctJyVa2Xn9A5yrIRoPD$BJsFKCaMbfigYj//EwcnFKIachGciRwCm7zQK+A2WjM=','2026-06-30 00:08:08.850793',1,'Ardila App','admin','','admin@ardila.app',1,1,'2026-06-15 22:03:51.063069',0,NULL),(2,'pbkdf2_sha256$720000$XoLsBDd0w8sort4fyWGm0P$71Vjc6FrkTSO5P3b3qG7+bJ3C0ZCS16v+KleFkttVzY=',NULL,0,'CONSUMIDOR FINAL','9999999999999','','consumidorfinal@hotmail.com',0,0,'2026-06-15 22:03:55.030186',0,NULL),(3,'pbkdf2_sha256$720000$MafEOZDrEyRTvxWl6tGdcJ$63n/1sFRZhxopwImOV+YqSczTdS/vKzyTYVMdqyr8iY=',NULL,0,'AGUSTIN GARCIA CADENA ABONOS','1754696373','','agroinsumostulcan@hotmail.com',1,0,'2026-06-15 22:03:55.920013',0,NULL),(4,'pbkdf2_sha256$720000$p1WeIA2Ad4i5iXu0mnrk9i$Fl42yby7q3Dr5RPafUq5iKs2Gz9hlPRxSl4weTQIL3E=',NULL,0,'ALEX ANTONIO TERAN RIOS','0401325345','','alexeh19@hotmail.com',1,0,'2026-06-15 22:03:56.822157',0,NULL),(5,'pbkdf2_sha256$720000$BRjj2Y10G8ecRcxXEMQEdy$eDOXmjpGO1lgvPdH5X69E/uWmjX56IphqrI2tjhC1Gw=',NULL,0,'ALVARO EDUARDO JURADO CHUQUIZAN','0400958609','','alvarojch10@gmail.com',1,0,'2026-06-15 22:03:57.626886',0,NULL),(6,'pbkdf2_sha256$720000$B5XsgXcVB1E5z2Xupw8d1l$Bm4+YALNl6tm5s+A1rGl71E/hR2+Z16gYnrjMZ0CQRI=',NULL,0,'ANDREA DEL CARMEN POTOSI CEPEDA','0401977327','','andrea.carmen@gmail.com',1,0,'2026-06-15 22:03:58.565945',0,NULL),(7,'pbkdf2_sha256$720000$UCTcr9hEvOtJEuW61H0PO9$pkJyPviaHIcd7gFBkTydxQsWHLsm0gJ2eS8NM0NsC6Y=',NULL,0,'ANITA SOCORRO ROSERO TACAN','0401294400','','alexis.rosero17@outlook.com',1,0,'2026-06-15 22:03:59.652527',0,NULL),(8,'pbkdf2_sha256$720000$prYIMUkyhcf1Eqxrfg1m7D$nq2eBN4gkF8tZ7jG5V9/PntChNc37UsbQ+siSnUD7yQ=',NULL,0,'ARGOTI OVIEDO PAOLA XIMENA','0401256409','','paola.argoti94@gmail.com',1,0,'2026-06-15 22:04:00.538398',0,NULL),(9,'pbkdf2_sha256$720000$wBERRx01ieu5gHdMjSwPbt$4NXHI4r46AVjvK+vEsZz3M0yXukfbOnqSUcGtpzOGgA=',NULL,0,'AYALA MARTINEZ FRANKLIN DAVID','0402038418','','fdayalam@utn.edu.ec',1,0,'2026-06-15 22:04:01.389707',0,NULL),(10,'pbkdf2_sha256$720000$HU03PnuHAU1j8ddw38NpAo$x5fNqvNawO1ET0RsLtAmOrrvz8tGYDvh1Xf8CdSYGCE=',NULL,0,'BALSECA VILLEGAS MARCO VINICIO','1713379970','','vicobal_04@yahoo.com',1,0,'2026-06-15 22:04:02.279280',0,NULL),(11,'pbkdf2_sha256$720000$seKbcrFp1KSE8f5Rr69RK7$hYKvrWK7yYNfsAEJ1tUnqjWz8X1VRZl4sO006MIz0io=',NULL,0,'RODRIGUEZ CARRERA BETTY MABELA','1713841763','','casaminaoro@hotmail.com',1,0,'2026-06-15 22:04:03.262803',0,NULL),(12,'pbkdf2_sha256$720000$CbHzisj6CmTEAIndxN7rQX$aq5YhA6g/x4TmC4ip/vwmZQhdP1JdVcPUATM/UGP0uE=',NULL,0,'BRAYAN ALEXANDER ROMO AGUIRRE PEKIN','0401478417','','alexanrromo6@gmail.com',1,0,'2026-06-15 22:04:04.299722',0,NULL),(13,'pbkdf2_sha256$720000$cY5e8vS4aQVrr67xO5cjre$0vJJE4+RY8uFuhVJvlu1Tt9/1YGjNmp1ptlL+VVSr5o=',NULL,0,'BRAYAN DAVID GUERRON TAPIA','0402082986','','davisguerron@gmail.com',1,0,'2026-06-15 22:04:05.306523',0,NULL),(14,'pbkdf2_sha256$720000$DRYL20VG3UMZSHjLQMgcGm$c9B7HAH87Yy1uzuL/gsPAeqZMhNhfaYsy/BUCKsJVac=',NULL,0,'CAMACAS MORILLO YADIRA ELIZABETH','0401488952','','yady_49@hotmail.com',1,0,'2026-06-15 22:04:06.411630',0,NULL),(15,'pbkdf2_sha256$720000$FznNrf9b3PyHjHoodN19s8$Q1Iaqqr8Joke2HqaajwY/AcgRr1QPv36HnpjFyB1+uQ=',NULL,0,'CARLOS ROLANDO ARGOTI ARGOTI','0400875613','','maji.argo@gmail.com',1,0,'2026-06-15 22:04:07.361441',0,NULL),(16,'pbkdf2_sha256$720000$7QSAukfHKOXu8wksZxaxq8$Q5GEBZ2W0I9izV8fuPEUnViP25M3yPv+MaO0IwsOOnI=',NULL,0,'CHICANGO TREJO JENIFFER ELIZABEHT','0401624176','','03diefer@hotmail.com',1,0,'2026-06-15 22:04:08.188863',0,NULL),(17,'pbkdf2_sha256$720000$bUMfr1kMen9NWYATms7Av9$IHOAWNA/VwEVR/pKsTvEoNe/kRGYoU81Y+WZZBOiCNg=',NULL,0,'CRISTIAN JAVIER GUERRERO POZO','0401497185','','magandre2006@hotmail.com',1,0,'2026-06-15 22:04:09.109365',0,NULL),(18,'pbkdf2_sha256$720000$LmDcDfv3tTkhDZADUkNiGu$IChe+yZADQab1lE5qvIIAxnG3bA6NSBcHRBT4tA908M=',NULL,0,'FRAGA REYES ANDREA ELIZABETH','0401641378','','cristianmorrios@gmail.com',1,0,'2026-06-15 22:04:10.045079',0,NULL),(19,'pbkdf2_sha256$720000$RUDacIuTKDaTwDWeG2Mk84$SWAIQN7wR1ZwkhEXmNHU257dKZPG2DHuYQ190FwmmpA=',NULL,0,'VILLACRECES ACOSTA CRISTIAN STIVEN','0402075162','','villacreces.acosta.estiven@gmail.com',1,0,'2026-06-15 22:04:10.951433',0,NULL),(20,'pbkdf2_sha256$720000$2e2nmhrYswmrpbGvlJIX2m$b0ceQr2VIhcP0fLqemiM7NQd+m4pGHDbk5tz5SstkA8=',NULL,0,'DAYANA CAROLINA NARVAEZ CRUZ','0402037238','','dayanarvaez1997@hotmail.com',1,0,'2026-06-15 22:04:11.926491',0,NULL),(21,'pbkdf2_sha256$720000$EbDr9n3ZP97oNIQm4f0QIv$D41Or67ONO/pUM3J+5qGXImMupGaRzwb56IArokoaRc=',NULL,0,'DELIA ELIZABETH JIMENEZ TIRIRA','0401054077','','delissjim72@hotmail.com',1,0,'2026-06-15 22:04:12.990982',0,NULL);
/*!40000 ALTER TABLE `user_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_groups`
--

DROP TABLE IF EXISTS `user_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_user_groups_user_id_group_id_bb60391f_uniq` (`user_id`,`group_id`),
  KEY `user_user_groups_group_id_c57f13c0_fk_auth_group_id` (`group_id`),
  CONSTRAINT `user_user_groups_group_id_c57f13c0_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_user_groups_user_id_13f9a20d_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_groups`
--

LOCK TABLES `user_user_groups` WRITE;
/*!40000 ALTER TABLE `user_user_groups` DISABLE KEYS */;
INSERT INTO `user_user_groups` VALUES (1,1,1),(2,2,2),(3,3,2),(4,4,2),(5,5,2),(6,6,2),(7,7,2),(8,8,2),(9,9,2),(10,10,2),(11,11,2),(12,12,2),(13,13,2),(14,14,2),(15,15,2),(16,16,2),(17,17,2),(18,18,2),(19,19,2),(20,20,2),(21,21,2);
/*!40000 ALTER TABLE `user_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_user_permissions`
--

DROP TABLE IF EXISTS `user_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_user_user_permissions_user_id_permission_id_64f4d5b8_uniq` (`user_id`,`permission_id`),
  KEY `user_user_user_permi_permission_id_ce49d4de_fk_auth_perm` (`permission_id`),
  CONSTRAINT `user_user_user_permi_permission_id_ce49d4de_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_user_user_permissions_user_id_31782f58_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_user_permissions`
--

LOCK TABLES `user_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `user_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ardilapp_sri'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-30  2:19:29
