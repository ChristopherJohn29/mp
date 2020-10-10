-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: mobile_drs
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.16.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `home_health_care`
--

DROP TABLE IF EXISTS `home_health_care`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `home_health_care` (
  `hhc_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hhc_name` varchar(45) DEFAULT NULL,
  `hhc_contact_name` varchar(45) DEFAULT NULL,
  `hhc_phoneNumber` varchar(45) DEFAULT NULL,
  `hhc_faxNumber` varchar(45) DEFAULT NULL,
  `hhc_email` varchar(45) DEFAULT NULL,
  `hhc_address` varchar(255) DEFAULT NULL,
  `hhc_dateCreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`hhc_id`),
  FULLTEXT KEY `hhc_contact_name` (`hhc_contact_name`)
) ENGINE=InnoDB AUTO_INCREMENT=376 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `home_health_care_notes`
--

DROP TABLE IF EXISTS `home_health_care_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `home_health_care_notes` (
  `hhcn_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hhcn_notes` varchar(255) DEFAULT NULL,
  `hhcn_date` date DEFAULT NULL,
  `hhcn_userID` int(10) unsigned DEFAULT NULL,
  `hhcn_hhcID` int(10) unsigned DEFAULT NULL,
  `hhcn_archive` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`hhcn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `patient_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `patient_name` varchar(90) DEFAULT NULL,
  `patient_gender` varchar(10) DEFAULT NULL,
  `patient_medicareNum` varchar(45) DEFAULT NULL,
  `patient_dateOfBirth` date DEFAULT NULL,
  `patient_phoneNum` varchar(45) DEFAULT NULL,
  `patient_address` varchar(255) DEFAULT NULL,
  `patient_hhcID` int(10) unsigned DEFAULT NULL,
  `patient_dateCreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `patient_caregiver_family` varchar(45) DEFAULT NULL,
  `patient_placeOfService` int(10) unsigned DEFAULT NULL,
  `patient_pharmacy` varchar(255) DEFAULT NULL,
  `patient_pharmacyPhone` varchar(45) DEFAULT NULL,
  `patient_drug_allergy` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`patient_id`),
  KEY `patient_hhcID_idx` (`patient_hhcID`),
  KEY `patient_placeOfService_idx` (`patient_placeOfService`),
  CONSTRAINT `patient_hhcID` FOREIGN KEY (`patient_hhcID`) REFERENCES `home_health_care` (`hhc_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `patient_placeOfService` FOREIGN KEY (`patient_placeOfService`) REFERENCES `place_of_service` (`pos_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7761 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_CPO`
--

DROP TABLE IF EXISTS `patient_CPO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_CPO` (
  `ptcpo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ptcpo_patientID` int(10) unsigned DEFAULT NULL,
  `ptcpo_period` varchar(45) DEFAULT NULL,
  `ptcpo_dateSigned` date DEFAULT NULL,
  `ptcpo_firstMonthCPO` varchar(45) DEFAULT NULL,
  `ptcpo_secondMonthCPO` varchar(45) DEFAULT NULL,
  `ptcpo_thirdMonthCPO` varchar(45) DEFAULT NULL,
  `ptcpo_dischargeDate` date DEFAULT NULL,
  `ptcpo_dateBilled` date DEFAULT NULL,
  `ptcpo_status` varchar(30) DEFAULT NULL,
  `ptcpo_dateCreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ptcpo_archive` tinyint(1) DEFAULT NULL,
  `ptcpo_addedByUserID` int(10) unsigned DEFAULT NULL,
  `ptcpo_dateOfService` date DEFAULT NULL,
  PRIMARY KEY (`ptcpo_id`),
  KEY `ptcpo_patientID_idx` (`ptcpo_patientID`),
  CONSTRAINT `ptcpo_patientID` FOREIGN KEY (`ptcpo_patientID`) REFERENCES `patient` (`patient_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15005 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_communication_notes`
--

DROP TABLE IF EXISTS `patient_communication_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_communication_notes` (
  `ptcn_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ptcn_patientID` int(10) unsigned DEFAULT NULL,
  `ptcn_message` longtext,
  `ptcn_dateCreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ptcn_archive` tinyint(1) DEFAULT NULL,
  `ptcn_category` enum('CPO','Medications','DME','Scheduling','Issues','HH Comm','485','Billing','Misc') DEFAULT NULL,
  `ptcn_notesFromUserID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ptcn_id`),
  KEY `ptcn_patientID_idx` (`ptcn_patientID`),
  CONSTRAINT `ptcn_patientID` FOREIGN KEY (`ptcn_patientID`) REFERENCES `patient` (`patient_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9139 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_transactions`
--

DROP TABLE IF EXISTS `patient_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_transactions` (
  `pt_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pt_tovID` int(10) unsigned DEFAULT NULL,
  `pt_patientID` int(10) unsigned DEFAULT NULL,
  `pt_providerID` int(10) unsigned DEFAULT NULL,
  `pt_dateOfService` date DEFAULT NULL,
  `pt_deductible` varchar(10) DEFAULT NULL,
  `pt_service_billed` varchar(10) DEFAULT NULL,
  `pt_aw_ippe_date` date DEFAULT NULL,
  `pt_aw_ippe_code` varchar(10) DEFAULT NULL,
  `pt_performed` tinyint(1) DEFAULT NULL,
  `pt_acp` tinyint(1) DEFAULT NULL,
  `pt_diabetes` tinyint(1) DEFAULT NULL,
  `pt_tobacco` tinyint(1) DEFAULT NULL,
  `pt_tcm` tinyint(1) DEFAULT NULL,
  `pt_others` varchar(45) DEFAULT NULL,
  `pt_icd10_codes` varchar(255) DEFAULT NULL,
  `pt_visitBilled` date DEFAULT NULL,
  `pt_dateRef` date DEFAULT NULL,
  `pt_dateRefEmailed` date DEFAULT NULL,
  `pt_notes` varchar(255) DEFAULT NULL,
  `pt_dateCreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `pt_mileage` varchar(45) DEFAULT NULL,
  `pt_aw_billed` date DEFAULT NULL,
  `pt_supervising_mdID` int(10) unsigned DEFAULT NULL,
  `pt_archive` tinyint(1) DEFAULT NULL,
  `pt_status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`pt_id`),
  KEY `pt_patientID_idx` (`pt_patientID`),
  KEY `pt_providerID_idx` (`pt_providerID`),
  KEY `pt_tovID_idx` (`pt_tovID`),
  KEY `pt_supervising_mdID` (`pt_supervising_mdID`),
  CONSTRAINT `pt_patientID` FOREIGN KEY (`pt_patientID`) REFERENCES `patient` (`patient_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pt_providerID` FOREIGN KEY (`pt_providerID`) REFERENCES `provider` (`provider_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `pt_supervising_mdID` FOREIGN KEY (`pt_supervising_mdID`) REFERENCES `provider` (`provider_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pt_tovID` FOREIGN KEY (`pt_tovID`) REFERENCES `type_of_visits` (`tov_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15762 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payroll_summary`
--

DROP TABLE IF EXISTS `payroll_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payroll_summary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_id` int(11) DEFAULT NULL,
  `from` varchar(20) NOT NULL,
  `to` varchar(20) NOT NULL,
  `mileage` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `permissions_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permissions_name` varchar(255) DEFAULT NULL,
  `permissions_module` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`permissions_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `place_of_service`
--

DROP TABLE IF EXISTS `place_of_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `place_of_service` (
  `pos_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pos_code` varchar(45) DEFAULT NULL,
  `pos_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`pos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider` (
  `provider_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `provider_firstname` varchar(45) DEFAULT NULL,
  `provider_lastname` varchar(45) DEFAULT NULL,
  `provider_contactNum` varchar(45) DEFAULT NULL,
  `provider_email` varchar(45) DEFAULT NULL,
  `provider_address` varchar(255) DEFAULT NULL,
  `provider_dateOfBirth` date DEFAULT NULL,
  `provider_languages` varchar(255) DEFAULT NULL,
  `provider_areas` varchar(255) DEFAULT NULL,
  `provider_npi` varchar(45) DEFAULT NULL,
  `provider_dea` varchar(45) DEFAULT NULL,
  `provider_license` varchar(45) DEFAULT NULL,
  `provider_dateCreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `provider_rate_initialVisit` varchar(10) DEFAULT NULL,
  `provider_rate_followUpVisit` varchar(10) DEFAULT NULL,
  `provider_rate_aw` varchar(10) DEFAULT NULL,
  `provider_rate_acp` varchar(10) DEFAULT NULL,
  `provider_rate_noShowPT` varchar(10) DEFAULT NULL,
  `provider_rate_mileage` varchar(10) DEFAULT NULL,
  `provider_gender` varchar(10) DEFAULT NULL,
  `provider_rate_initialVisit_TeleHealth` varchar(10) DEFAULT NULL,
  `provider_rate_followUpVisit_TeleHealth` mediumtext,
  `provider_supervising_MD` tinyint(1) NOT NULL,
  PRIMARY KEY (`provider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `provider_route_sheet`
--

DROP TABLE IF EXISTS `provider_route_sheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider_route_sheet` (
  `prs_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prs_providerID` int(10) unsigned DEFAULT NULL,
  `prs_dateOfService` date DEFAULT NULL,
  `prs_dateCreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `prs_archive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`prs_id`),
  KEY `prs_providerID_idx` (`prs_providerID`),
  CONSTRAINT `prs_providerID` FOREIGN KEY (`prs_providerID`) REFERENCES `provider` (`provider_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2295 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `provider_route_sheet_list`
--

DROP TABLE IF EXISTS `provider_route_sheet_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider_route_sheet_list` (
  `prsl_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prsl_prsID` int(10) unsigned DEFAULT NULL,
  `prsl_fromTime` time DEFAULT NULL,
  `prsl_toTime` time DEFAULT NULL,
  `prsl_tovID` int(10) unsigned DEFAULT NULL,
  `prsl_hhcID` int(10) unsigned DEFAULT NULL,
  `prsl_patientID` int(10) unsigned DEFAULT NULL,
  `prsl_notes` varchar(2000) DEFAULT NULL,
  `prsl_patientTransID` int(10) unsigned DEFAULT NULL,
  `prsl_dateRef` date DEFAULT NULL,
  PRIMARY KEY (`prsl_id`),
  KEY `prsl_prsID_idx` (`prsl_prsID`),
  KEY `prsl_tovID_idx` (`prsl_tovID`),
  KEY `prsl_hhcID_idx` (`prsl_hhcID`),
  KEY `prsl_patientID_idx` (`prsl_patientID`),
  KEY `prsl_patientTransID` (`prsl_patientTransID`),
  CONSTRAINT `prsl_hhcID` FOREIGN KEY (`prsl_hhcID`) REFERENCES `home_health_care` (`hhc_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prsl_patientID` FOREIGN KEY (`prsl_patientID`) REFERENCES `patient` (`patient_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prsl_prsID` FOREIGN KEY (`prsl_prsID`) REFERENCES `provider_route_sheet` (`prs_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prsl_tovID` FOREIGN KEY (`prsl_tovID`) REFERENCES `type_of_visits` (`tov_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24932 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `roles_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roles_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`roles_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles_permission`
--

DROP TABLE IF EXISTS `roles_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_permission` (
  `rp_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rp_rolesID` int(10) unsigned DEFAULT NULL,
  `rp_permissionsID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`rp_id`),
  KEY `rp_rolesID_idx` (`rp_rolesID`),
  KEY `rp_permissionsID_idx` (`rp_permissionsID`),
  CONSTRAINT `rp_permissionsID` FOREIGN KEY (`rp_permissionsID`) REFERENCES `permissions` (`permissions_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `rp_rolesID` FOREIGN KEY (`rp_rolesID`) REFERENCES `roles` (`roles_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scheduled_holidays`
--

DROP TABLE IF EXISTS `scheduled_holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduled_holidays` (
  `sh_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sh_description` varchar(255) DEFAULT NULL,
  `sh_date` varchar(45) DEFAULT NULL,
  `sh_archive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`sh_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `type_of_visits`
--

DROP TABLE IF EXISTS `type_of_visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_of_visits` (
  `tov_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tov_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tov_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_firstname` varchar(45) DEFAULT NULL,
  `user_lastname` varchar(45) DEFAULT NULL,
  `user_email` varchar(45) DEFAULT NULL,
  `user_dateCreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_password` varchar(255) DEFAULT NULL,
  `user_roleID` int(10) unsigned DEFAULT NULL,
  `user_sessionID` varchar(255) DEFAULT NULL,
  `user_archive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_roleID_idx` (`user_roleID`),
  CONSTRAINT `user_roleID` FOREIGN KEY (`user_roleID`) REFERENCES `roles` (`roles_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_logs`
--

DROP TABLE IF EXISTS `user_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_logs` (
  `user_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_log_userID` int(10) unsigned DEFAULT NULL,
  `user_log_time` time DEFAULT NULL,
  `user_log_date` date DEFAULT NULL,
  `user_log_description` varchar(255) DEFAULT NULL,
  `user_log_link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_log_id`),
  KEY `user_log_userID_idx` (`user_log_userID`),
  CONSTRAINT `user_log_userID` FOREIGN KEY (`user_log_userID`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=869359 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-10  8:19:26

START TRANSACTION;
USE `mobile-physician`;
INSERT INTO `mobile-physician`.`roles` (`roles_id`, `roles_name`) VALUES (1, 'Super Administrator');
INSERT INTO `mobile-physician`.`roles` (`roles_id`, `roles_name`) VALUES (2, 'Administrator');
INSERT INTO `mobile-physician`.`roles` (`roles_id`, `roles_name`) VALUES (3, 'Normal');

COMMIT;


START TRANSACTION;
USE `mobile-physician`;
INSERT INTO `mobile-physician`.`user` (`user_id`, `user_firstname`, `user_lastname`, `user_email`, `user_dateCreated`, `user_password`, `user_roleID`, `user_sessionID`) VALUES (1, 'Nikkolai', 'Fernandez', 'nikkolaifernandez14@gmail.com', '2018/11/25', '$2y$10$NRfEbjlqjRpXiSZaw.DzW.d5.Zw2I5q8HOODaKPvsfAM3HFmgrOrW', 1, NULL);
INSERT INTO `mobile-physician`.`user` (`user_id`, `user_firstname`, `user_lastname`, `user_email`, `user_dateCreated`, `user_password`, `user_roleID`, `user_sessionID`) VALUES (2, 'Jayson', 'Arcayna', 'jayson.arcayna@gmail.com', '2018/11/25', '$2y$10$CVTPVGMFB4QcC4OXyQcYMOsDdxjRQ57E0/nGNrn3P3QVdLS3b0zZq', 1, NULL);

COMMIT;



-- -----------------------------------------------------
-- Data for table `mobile-physician`.`permissions`
-- -----------------------------------------------------
START TRANSACTION;
USE `mobile-physician`;
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (1, 'add_user', 'UM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (2, 'edit_user', 'UM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (3, 'view_user', 'UM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (4, 'search_user', 'UM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (5, 'list_user', 'UM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (6, 'add_provider', 'PPM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (7, 'edit_provider', 'PPM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (8, 'view_provider', 'PPM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (9, 'search_provider', 'PPM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (10, 'list_provider', 'PPM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (11, 'add_hhc', 'HHCPM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (12, 'edit_hhc', 'HHCPM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (13, 'view_hhc', 'HHCPM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (14, 'search_hhc', 'HHCPM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (15, 'list_hhc', 'HHCPM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (16, 'add_pt', 'PTPM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (17, 'edit_pt', 'PTPM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (18, 'view_pt', 'PTPM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (19, 'search_pt', 'PTPM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (20, 'list_pt', 'PTPM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (21, 'add_tr', 'PTPM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (22, 'edit_tr', 'PTPM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (23, 'view_tr', 'PTPM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (24, 'list_tr', 'PTPM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (25, 'add_cn', 'PTPM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (26, 'edit_cn', 'PTPM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (27, 'list_cn', 'PTPM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (28, 'view_cn', 'PTPM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (29, 'add_cpo', 'PTPM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (30, 'edit_cpo', 'PTPM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (31, 'view_cpo', 'PTPM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (32, 'add_prs', 'PRSM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (33, 'edit_prs', 'PRSM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (34, 'view_prs', 'PRSM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (35, 'list_prs', 'PRSM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (36, 'search_prs', 'PRSM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (37, 'download_prs', 'PRSM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (38, 'print_prs', 'PRSM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (39, 'generate_pr', 'PRG');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (40, 'save_pr', 'PRG');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (41, 'print_pr', 'PRG');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (42, 'send_pr', 'PRG');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (43, 'paid_batch_pr', 'PRG');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (44, 'generate_sbawr', 'SBAWRG');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (45, 'save_sbawr', 'SBAWRG');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (46, 'print_sbawr', 'SBAWRG');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (47, 'generate_sbhvr', 'SBHVRG');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (48, 'save_sbhvr', 'SBHVRG');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (49, 'print_sbhvr', 'SBHVRG');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (50, 'generate_sbfvr', 'SBFVRG');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (51, 'save_sbfvr', 'SBFVRG');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (52, 'print_sbfvr', 'SBFVRG');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (53, 'generate_sbcpor', 'SBCPORG');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (54, 'save__sbcpor', 'SBCPORG');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (55, 'print__sbcpor', 'SBCPORG');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (56, 'delete_user', 'UM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (57, 'email_prs', 'PRSM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (58, 'print_pt', 'PTPM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (59, 'downoad_pt', 'PTPM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (60, 'delete_cn', 'PTPM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (61, 'edit_account', 'AM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (62, 'headcount_pt', 'PTPM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (63, 'delete_tr', 'PTPM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (64, 'delete_prs', 'PRSM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (65, 'delete_cpo', 'PTPM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (66, 'mark_service_paid', 'PTPM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (67, 'logs', 'UM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (68, 'scheduled_holidays', 'SHM');
INSERT INTO `mobile-physician`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (69, 'generate_sbtv', 'SBTVRG');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mobile-physician`.`roles_permission`
-- -----------------------------------------------------
START TRANSACTION;
USE `mobile-physician`;
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (1, 1, 1);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (2, 1, 2);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (3, 1, 3);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (4, 1, 4);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (5, 1, 5);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (6, 1, 6);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (7, 1, 7);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (8, 1, 8);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (9, 1, 9);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (10, 1, 10);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (11, 1, 11);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (12, 1, 12);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (13, 1, 13);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (14, 1, 14);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (15, 1, 15);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (16, 1, 16);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (17, 1, 17);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (18, 1, 18);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (19, 1, 19);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (20, 1, 20);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (21, 1, 21);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (22, 1, 22);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (23, 1, 23);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (24, 1, 24);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (25, 1, 25);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (26, 1, 26);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (27, 1, 27);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (28, 1, 28);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (29, 1, 29);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (30, 1, 30);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (31, 1, 31);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (32, 1, 32);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (33, 1, 33);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (34, 1, 34);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (35, 1, 35);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (36, 1, 36);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (37, 1, 37);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (38, 1, 38);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (39, 1, 39);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (40, 1, 40);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (41, 1, 41);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (42, 1, 42);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (43, 1, 43);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (44, 1, 44);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (45, 1, 45);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (46, 1, 46);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (47, 1, 47);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (48, 1, 48);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (49, 1, 49);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (50, 1, 50);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (51, 1, 51);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (52, 1, 52);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (53, 1, 53);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (54, 1, 54);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (55, 1, 55);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (56, 2, 1);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (57, 2, 2);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (58, 2, 3);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (59, 2, 4);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (60, 2, 5);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (61, 2, 6);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (62, 2, 7);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (63, 2, 8);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (64, 2, 9);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (65, 2, 10);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (66, 2, 11);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (67, 2, 12);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (68, 2, 13);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (69, 2, 14);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (70, 2, 15);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (71, 2, 16);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (72, 2, 17);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (73, 2, 18);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (74, 2, 19);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (75, 2, 20);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (76, 2, 21);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (77, 2, 22);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (78, 2, 23);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (79, 2, 24);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (80, 2, 25);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (81, 2, 26);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (82, 2, 27);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (83, 2, 28);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (84, 2, 29);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (85, 2, 30);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (86, 2, 31);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (87, 2, 32);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (88, 2, 33);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (89, 2, 34);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (90, 2, 35);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (91, 2, 36);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (92, 2, 37);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (93, 2, 38);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (94, 2, 39);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (95, 2, 40);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (96, 2, 41);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (97, 2, 42);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (98, 2, 43);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (99, 2, 44);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (100, 2, 45);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (101, 2, 46);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (102, 2, 47);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (103, 2, 48);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (104, 2, 49);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (105, 2, 50);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (106, 2, 51);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (107, 2, 52);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (108, 2, 53);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (109, 2, 54);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (110, 2, 55);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (111, 3, 16);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (112, 3, 17);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (113, 3, 18);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (114, 3, 19);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (115, 3, 20);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (116, 3, 21);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (117, 3, 22);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (118, 3, 23);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (119, 3, 24);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (120, 3, 25);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (121, 3, 26);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (122, 3, 27);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (123, 3, 28);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (124, 3, 29);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (125, 3, 30);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (126, 3, 31);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (127, 1, 55);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (128, 2, 55);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (129, 1, 56);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (130, 2, 56);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (131, 1, 57);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (132, 2, 57);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (133, 1, 58);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (134, 1, 59);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (135, 2, 58);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (136, 2, 59);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (137, 3, 58);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (138, 3, 59);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (139, 1, 60);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (140, 2, 60);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (141, 3, 60);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (142, 3, 6);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (143, 3, 7);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (144, 3, 8);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (145, 3, 9);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (146, 3, 10);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (147, 3, 32);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (148, 3, 33);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (149, 3, 34);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (150, 3, 35);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (151, 3, 36);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (152, 3, 37);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (153, 3, 38);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (154, 3, 11);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (155, 3, 12);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (156, 3, 13);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (157, 3, 14);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (158, 3, 15);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (159, 2, 61);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (160, 3, 61);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (161, 1, 62);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (162, 2, 62);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (163, 3, 62);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (164, 1, 63);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (165, 1, 64);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (166, 2, 63);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (167, 2, 64);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (168, 1, 65);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (169, 2, 65);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (170, 1, 66);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (171, 2, 66);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (172, 1, 67);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (173, 2, 67);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (174, 1, 68);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (175, 2, 68);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (176, 1, 69);
INSERT INTO `mobile-physician`.`roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES (177, 2, 69);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mobile-physician`.`place_of_service`
-- -----------------------------------------------------
START TRANSACTION;
USE `mobile-physician`;
INSERT INTO `mobile-physician`.`place_of_service` (`pos_id`, `pos_code`, `pos_name`) VALUES (1, 'POS11', 'Office');
INSERT INTO `mobile-physician`.`place_of_service` (`pos_id`, `pos_code`, `pos_name`) VALUES (2, 'POS12', 'Home');
INSERT INTO `mobile-physician`.`place_of_service` (`pos_id`, `pos_code`, `pos_name`) VALUES (3, 'POS13', 'Facility');
INSERT INTO `mobile-physician`.`place_of_service` (`pos_id`, `pos_code`, `pos_name`) VALUES (4, 'POS14', 'Board & Care');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mobile-physician`.`type_of_visits`
-- -----------------------------------------------------
START TRANSACTION;
USE `mobile-physician`;
INSERT INTO `mobile-physician`.`type_of_visits` (`tov_id`, `tov_name`) VALUES (1, ' Initial Visit (Home)');
INSERT INTO `mobile-physician`.`type_of_visits` (`tov_id`, `tov_name`) VALUES (7, ' Initial Visit (Office)');
INSERT INTO `mobile-physician`.`type_of_visits` (`tov_id`, `tov_name`) VALUES (2, ' Initial Visit (TeleHealth)');
INSERT INTO `mobile-physician`.`type_of_visits` (`tov_id`, `tov_name`) VALUES (3, ' Follow-up Visit (Home)');
INSERT INTO `mobile-physician`.`type_of_visits` (`tov_id`, `tov_name`) VALUES (4, ' Follow-up Visit (Facility)');
INSERT INTO `mobile-physician`.`type_of_visits` (`tov_id`, `tov_name`) VALUES (8, ' Follow-up Visit (TeleHealth)');
INSERT INTO `mobile-physician`.`type_of_visits` (`tov_id`, `tov_name`) VALUES (5, ' No Show');
INSERT INTO `mobile-physician`.`type_of_visits` (`tov_id`, `tov_name`) VALUES (6, ' Cancelled');

COMMIT;
