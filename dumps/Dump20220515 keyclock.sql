-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: keyclock
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_event_entity`
--

DROP TABLE IF EXISTS `admin_event_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_event_entity` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `ADMIN_EVENT_TIME` bigint DEFAULT NULL,
  `REALM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IP_ADDRESS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESOURCE_PATH` text COLLATE utf8_unicode_ci,
  `REPRESENTATION` text COLLATE utf8_unicode_ci,
  `ERROR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_event_entity`
--

LOCK TABLES `admin_event_entity` WRITE;
/*!40000 ALTER TABLE `admin_event_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_event_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `associated_policy`
--

DROP TABLE IF EXISTS `associated_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `associated_policy` (
  `POLICY_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `resource_server_policy` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `associated_policy`
--

LOCK TABLES `associated_policy` WRITE;
/*!40000 ALTER TABLE `associated_policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `associated_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentication_execution`
--

DROP TABLE IF EXISTS `authentication_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authentication_execution` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `ALIAS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FLOW_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUIREMENT` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `authentication_flow` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentication_execution`
--

LOCK TABLES `authentication_execution` WRITE;
/*!40000 ALTER TABLE `authentication_execution` DISABLE KEYS */;
INSERT INTO `authentication_execution` VALUES ('02924e65-019b-4131-a125-6fb88409c566',NULL,'conditional-user-configured','master','b2051783-7371-456d-b755-65ae316563d9',0,10,_binary '\0',NULL,NULL),('06a6c80f-0f92-4015-9f5f-284e269c014d',NULL,'auth-spnego','teste','a8fed838-d040-4305-8816-6270eeb65f2c',3,30,_binary '\0',NULL,NULL),('0cffe0ba-580b-4355-bda7-ad562c38cea3',NULL,NULL,'master','fe27a2ff-a3d7-49d1-a472-8673d4ddbc66',2,20,_binary '','05584dc3-dab9-4195-ad76-3a98942de164',NULL),('0e7e5a25-ca1f-4258-9393-2193872f505e',NULL,'idp-email-verification','ecommerce','315b6c0f-d2e0-463a-813b-c246ee0597d7',2,10,_binary '\0',NULL,NULL),('10021c1b-4f92-47b9-89ba-89b40b238e33',NULL,NULL,'teste','22d6e96c-c441-4dbc-9009-97ffe2c05e7f',1,20,_binary '','87d86a2e-fb10-4ef7-9c60-208fc2352ccd',NULL),('11394de3-014e-4de3-a816-4099ddf54e5c',NULL,NULL,'teste','3665bc8c-4899-4bad-9b88-d9bbbab56584',2,20,_binary '','043e55dd-8478-49e5-82d4-e28756331045',NULL),('11750cbf-aaf3-4d3b-9162-0cb40e4e2b90',NULL,'conditional-user-configured','master','4d1fe7c9-aa29-41ef-a52a-1210ca4a0ab9',0,10,_binary '\0',NULL,NULL),('1311a323-be2f-482a-885f-0bed47cb9e25',NULL,'direct-grant-validate-username','master','17080ecc-2717-49c5-9889-d26397832e45',0,10,_binary '\0',NULL,NULL),('158217ee-1e5f-49af-bc8b-070e19d65da8',NULL,'client-x509','master','a4f63335-59c5-45a0-9ac6-9d8bd45e1175',2,40,_binary '\0',NULL,NULL),('1725a2ee-8136-445e-ad34-eb723f949d5f',NULL,NULL,'ecommerce','2f9a76c3-e197-47a8-b9da-d76df25cb60e',1,40,_binary '','048676ac-72f4-4a69-aeb5-116ad9b89e6a',NULL),('1a5c3ee3-7a35-4c53-a374-619359d61a8f',NULL,'client-x509','teste','09e09255-e7c5-4407-8dbc-ff6169645f38',2,40,_binary '\0',NULL,NULL),('1b5f8ac1-b195-4e39-8401-dc1e04dc8023',NULL,'direct-grant-validate-username','ecommerce','c4600205-6a60-406b-b96c-a596c430d752',0,10,_binary '\0',NULL,NULL),('1f5b02ce-367c-4d34-b5a1-05b71d62d84a',NULL,'reset-password','teste','ee5b39e2-9680-4552-89e2-df3c77d2592b',0,30,_binary '\0',NULL,NULL),('1fae989b-56ef-43b8-bfca-1410ab9bb3a2',NULL,'basic-auth-otp','teste','a8fed838-d040-4305-8816-6270eeb65f2c',3,20,_binary '\0',NULL,NULL),('2058b926-1e80-4607-8532-6db4fd75298b',NULL,'registration-password-action','ecommerce','f3cb5c5a-98f7-46a1-8456-580a980e6a7d',0,50,_binary '\0',NULL,NULL),('26b15435-3516-4ce2-adac-9c73ceef9981',NULL,NULL,'master','bd8a3105-d529-47a4-9552-33cb0dc68176',2,30,_binary '','acf63a0a-05e6-4f8f-bb8d-bef7c5d8b679',NULL),('29b4e967-9fd1-4fe6-909c-27c8d0b984fc',NULL,'client-secret-jwt','master','a4f63335-59c5-45a0-9ac6-9d8bd45e1175',2,30,_binary '\0',NULL,NULL),('2b1ab70a-eaaf-42a9-90fd-8817847458ac',NULL,'no-cookie-redirect','master','e49f670b-ce5e-4c96-8226-94f4ed9eb699',0,10,_binary '\0',NULL,NULL),('2bb9d57a-e2d8-4b18-920a-89311abe071c',NULL,'idp-review-profile','teste','ba8e4542-26b3-4400-ae00-af9a48c55d1c',0,10,_binary '\0',NULL,'c3d7e259-bc7d-442a-bb9d-6d9bead408e4'),('2be4988f-00f4-4f3c-ab55-516e2c78c1f3',NULL,'reset-otp','master','4d1fe7c9-aa29-41ef-a52a-1210ca4a0ab9',0,20,_binary '\0',NULL,NULL),('2cb165b6-1eb4-48c1-8f25-89b0831badea',NULL,'reset-credentials-choose-user','ecommerce','2f9a76c3-e197-47a8-b9da-d76df25cb60e',0,10,_binary '\0',NULL,NULL),('2d2efb9e-0a54-494d-872e-b2f92dd38931',NULL,'auth-username-password-form','ecommerce','88b704c5-2ac2-4764-a67b-bab412032556',0,10,_binary '\0',NULL,NULL),('2ddc9a2f-32f1-466a-80ec-45b123fccc52',NULL,'direct-grant-validate-password','master','17080ecc-2717-49c5-9889-d26397832e45',0,20,_binary '\0',NULL,NULL),('2ebab452-9be4-4fbe-81a8-a6fdeb303036',NULL,'registration-page-form','teste','70c34686-1e57-4869-9b36-39e067c34e1a',0,10,_binary '','b523db0b-d626-49f7-ae6c-fa6369d85076',NULL),('2fb3b9d9-4760-4913-a7ae-34d49dae8026',NULL,'no-cookie-redirect','ecommerce','556dbf8d-a883-4f18-afc1-604d87d096f9',0,10,_binary '\0',NULL,NULL),('32273f00-ba32-4090-886c-e0c02f746bad',NULL,'identity-provider-redirector','master','bd8a3105-d529-47a4-9552-33cb0dc68176',2,25,_binary '\0',NULL,NULL),('389003e8-c746-49a7-8e5a-51e9be40ea34',NULL,'basic-auth','ecommerce','1119463b-dc00-4725-bc1b-98643ce5e755',0,10,_binary '\0',NULL,NULL),('3db99f5c-4806-47a7-a444-2a8a7527fa9a',NULL,'auth-cookie','teste','f5c2ea22-5cff-4e5b-bfbf-63c7d6286921',2,10,_binary '\0',NULL,NULL),('3e7a9838-d0a0-47d2-813e-defb22d34032',NULL,'idp-confirm-link','ecommerce','45915bee-55bf-4062-86c3-f1e685b0aa88',0,10,_binary '\0',NULL,NULL),('3fb457eb-caae-4827-9847-7c694dd6419c',NULL,'auth-spnego','ecommerce','ccac688b-2d66-4169-8282-08311862ec91',3,20,_binary '\0',NULL,NULL),('42a9eb39-6eff-4185-9f93-40ca55ab077e',NULL,NULL,'master','05584dc3-dab9-4195-ad76-3a98942de164',1,20,_binary '','e6c128d0-2be2-43cc-87e4-4a9db40ac8a9',NULL),('43e11e00-bb6e-4d93-8774-d8d3ba030582',NULL,'basic-auth','master','f18d41b4-3b84-43f6-b76b-35cd5bc68e48',0,10,_binary '\0',NULL,NULL),('457cbde4-9553-408b-85ba-7e1de22315c8',NULL,'conditional-user-configured','ecommerce','a5034f37-b79c-4c3e-8b66-40f14ddac84d',0,10,_binary '\0',NULL,NULL),('4617f776-68ad-4e40-b54d-176e78384715',NULL,'http-basic-authenticator','teste','3ef6062c-59b5-427b-bf7b-9b396b5d0ef2',0,10,_binary '\0',NULL,NULL),('4977be22-bb33-4187-9085-fe790e90be07',NULL,'conditional-user-configured','teste','939d8506-8c71-4334-a27d-7168f95b3cbc',0,10,_binary '\0',NULL,NULL),('4af268d5-8290-4f9f-b1b7-c069121c9326',NULL,'identity-provider-redirector','teste','f5c2ea22-5cff-4e5b-bfbf-63c7d6286921',2,25,_binary '\0',NULL,NULL),('4f32e070-98bc-4636-8712-58a11dfcdd63',NULL,'direct-grant-validate-otp','master','b2051783-7371-456d-b755-65ae316563d9',0,20,_binary '\0',NULL,NULL),('5080a066-db89-4519-8c4a-f673d789700e',NULL,NULL,'teste','43eb0ad9-e6a5-4b7e-a4b6-98a860082cbe',2,20,_binary '','bec05540-1187-4469-915e-e24b77eff976',NULL),('555c13f2-5ad1-4a40-92c1-83359af8e925',NULL,'basic-auth-otp','master','f18d41b4-3b84-43f6-b76b-35cd5bc68e48',3,20,_binary '\0',NULL,NULL),('558536a3-cc3a-45dc-b42d-8ee7863f8b4e',NULL,'direct-grant-validate-username','teste','a675a501-311d-42b6-9e0c-8375d35d4835',0,10,_binary '\0',NULL,NULL),('562e4f25-3edf-44c6-969d-3721d04c8f93',NULL,'registration-recaptcha-action','master','4fd9cf9f-7c6a-4989-b4aa-9aa82bf8ad1e',3,60,_binary '\0',NULL,NULL),('5acd469e-509a-4ca8-8339-7ebaeb658448',NULL,'idp-review-profile','ecommerce','e3d735ab-f562-4b75-a87c-b4b328ad24ca',0,10,_binary '\0',NULL,'e3081474-6ed5-4877-a091-5ca7a6443d3c'),('5b6670c5-2e2e-4710-aaf6-e72839f38866',NULL,'client-secret','ecommerce','b2866354-8297-4a9f-a16d-75d3effc1bdd',2,10,_binary '\0',NULL,NULL),('5cc252df-29a5-42a1-ade2-b2cc52e7c4b4',NULL,'idp-confirm-link','master','1f3641a1-4431-442e-8fb1-17c260bb45c2',0,10,_binary '\0',NULL,NULL),('5d8c71ad-0364-4e86-a7e9-3d3c530e6413',NULL,NULL,'master','acf63a0a-05e6-4f8f-bb8d-bef7c5d8b679',1,20,_binary '','e3d5fec9-7f60-494e-b6c2-5f3a55e78aca',NULL),('5dd3e555-1ce6-4baf-93bb-e62c31b2ed66',NULL,'client-secret-jwt','ecommerce','b2866354-8297-4a9f-a16d-75d3effc1bdd',2,30,_binary '\0',NULL,NULL),('5e297b82-7f55-4bed-9231-e84ace6534ee',NULL,'auth-username-password-form','master','acf63a0a-05e6-4f8f-bb8d-bef7c5d8b679',0,10,_binary '\0',NULL,NULL),('5e3d07f9-cf8c-4410-94bc-9aed64dc142d',NULL,'http-basic-authenticator','master','51f61c1b-47b8-4116-90f9-823eed3a38b5',0,10,_binary '\0',NULL,NULL),('5f2385e1-9202-4aac-bc3c-e098dff71725',NULL,NULL,'master','33881fa5-4542-4e58-b558-62c40260f1d0',0,20,_binary '','abb73a51-737c-4f88-b879-1fd7ac0c5073',NULL),('621bee94-7022-464f-a13c-48685e433f43',NULL,'idp-create-user-if-unique','ecommerce','a788c900-179d-4990-9495-c48303979901',2,10,_binary '\0',NULL,'e694eb02-0cbe-4249-9f02-725cb4f80ffa'),('6581fb7f-9b5c-4352-947e-12d7d1255e56',NULL,'idp-create-user-if-unique','master','abb73a51-737c-4f88-b879-1fd7ac0c5073',2,10,_binary '\0',NULL,'4ef14e8d-040e-4eb8-b7f4-75a7f4b2d4ac'),('65973328-9db5-4e20-a9e9-576f3fa49679',NULL,'idp-username-password-form','teste','043e55dd-8478-49e5-82d4-e28756331045',0,10,_binary '\0',NULL,NULL),('667e1807-a4af-4fc1-a4f4-83a94e50167b',NULL,'basic-auth','teste','a8fed838-d040-4305-8816-6270eeb65f2c',0,10,_binary '\0',NULL,NULL),('68b423d8-35c1-4956-a829-4498d4aadfb9',NULL,NULL,'ecommerce','e3d735ab-f562-4b75-a87c-b4b328ad24ca',0,20,_binary '','a788c900-179d-4990-9495-c48303979901',NULL),('6b3e1bc8-b0ed-405d-a338-a3f871907291',NULL,NULL,'ecommerce','a788c900-179d-4990-9495-c48303979901',2,20,_binary '','45915bee-55bf-4062-86c3-f1e685b0aa88',NULL),('6b6d0dae-aafc-4e89-8f36-d6558df417c8',NULL,'conditional-user-configured','master','e6c128d0-2be2-43cc-87e4-4a9db40ac8a9',0,10,_binary '\0',NULL,NULL),('6c82ed4b-4588-436f-8d3b-a7e48bd2756f',NULL,'reset-credentials-choose-user','teste','ee5b39e2-9680-4552-89e2-df3c77d2592b',0,10,_binary '\0',NULL,NULL),('6cda4b6f-74fb-40cf-b8bb-fda243971b76',NULL,'reset-otp','teste','cf712e21-0fcc-4aac-878a-df4dc0d17bba',0,20,_binary '\0',NULL,NULL),('6cfc8048-2396-42c7-ba28-c7cfeb2eb07c',NULL,NULL,'ecommerce','315b6c0f-d2e0-463a-813b-c246ee0597d7',2,20,_binary '','fcfddfd9-8634-486d-8fd0-006a3c1e1513',NULL),('6ea63ae3-7c1f-41a6-86e3-aae4939ce4ba',NULL,'registration-password-action','teste','b523db0b-d626-49f7-ae6c-fa6369d85076',0,50,_binary '\0',NULL,NULL),('715c20e7-f8dd-4ad8-bbab-511a1b5fb955',NULL,'conditional-user-configured','teste','87d86a2e-fb10-4ef7-9c60-208fc2352ccd',0,10,_binary '\0',NULL,NULL),('73cecb14-96bb-4cd5-93e8-d1d32fbc3499',NULL,'registration-user-creation','ecommerce','f3cb5c5a-98f7-46a1-8456-580a980e6a7d',0,20,_binary '\0',NULL,NULL),('7438c5a0-8fb1-46b3-b083-fb8d2a6a4fb1',NULL,NULL,'master','f8fd5751-144a-4e37-b84c-da0385e97ed3',1,40,_binary '','4d1fe7c9-aa29-41ef-a52a-1210ca4a0ab9',NULL),('74676684-a142-4e4f-8ff6-b15a6fd5fc8e',NULL,NULL,'ecommerce','556dbf8d-a883-4f18-afc1-604d87d096f9',0,20,_binary '','1119463b-dc00-4725-bc1b-98643ce5e755',NULL),('7a4090cb-2ade-4600-8a1e-ff0b96fc79aa',NULL,'idp-review-profile','master','33881fa5-4542-4e58-b558-62c40260f1d0',0,10,_binary '\0',NULL,'7b62c623-7e5f-41b1-9751-5b3fa543a94a'),('7aa91826-15cb-4896-b897-a0a0ad8a952e',NULL,'idp-username-password-form','master','05584dc3-dab9-4195-ad76-3a98942de164',0,10,_binary '\0',NULL,NULL),('7bc9d1e3-0bfb-4498-9558-fefa856a9555',NULL,'auth-spnego','teste','f5c2ea22-5cff-4e5b-bfbf-63c7d6286921',3,20,_binary '\0',NULL,NULL),('7e66351a-bedb-4e8b-96f7-b044043a9e8f',NULL,NULL,'teste','ba8e4542-26b3-4400-ae00-af9a48c55d1c',0,20,_binary '','43eb0ad9-e6a5-4b7e-a4b6-98a860082cbe',NULL),('7fee26b6-f0ba-45a5-84c6-e935167425f5',NULL,'auth-otp-form','teste','87d86a2e-fb10-4ef7-9c60-208fc2352ccd',0,20,_binary '\0',NULL,NULL),('80b9f0ce-2d44-4500-bbc6-cb4f53c2945f',NULL,'client-x509','ecommerce','b2866354-8297-4a9f-a16d-75d3effc1bdd',2,40,_binary '\0',NULL,NULL),('83693e86-e339-4bac-9ce7-3a4ef221a74c',NULL,'direct-grant-validate-otp','teste','0ea96a9b-c70e-40b3-8863-9612c654e3fb',0,20,_binary '\0',NULL,NULL),('8458746c-cfd0-4f80-88ff-e620c1e21682',NULL,'reset-password','ecommerce','2f9a76c3-e197-47a8-b9da-d76df25cb60e',0,30,_binary '\0',NULL,NULL),('89fe63d5-8962-4040-ae20-6f45d3c27f0a',NULL,'auth-username-password-form','teste','22d6e96c-c441-4dbc-9009-97ffe2c05e7f',0,10,_binary '\0',NULL,NULL),('8a210716-668c-49b9-91e7-3fca3872def3',NULL,'reset-credential-email','teste','ee5b39e2-9680-4552-89e2-df3c77d2592b',0,20,_binary '\0',NULL,NULL),('8b007a77-312d-485a-8066-d7b2f61cc53f',NULL,'client-secret','teste','09e09255-e7c5-4407-8dbc-ff6169645f38',2,10,_binary '\0',NULL,NULL),('95de34e4-48c6-4073-afaa-f8c1028ab79a',NULL,'registration-recaptcha-action','ecommerce','f3cb5c5a-98f7-46a1-8456-580a980e6a7d',3,60,_binary '\0',NULL,NULL),('965057d0-0d59-465e-8c4e-3e259fb7d6a1',NULL,'reset-password','master','f8fd5751-144a-4e37-b84c-da0385e97ed3',0,30,_binary '\0',NULL,NULL),('977ec8cf-bef1-45b9-b9a7-e1c4330a6262',NULL,'auth-cookie','ecommerce','ccac688b-2d66-4169-8282-08311862ec91',2,10,_binary '\0',NULL,NULL),('9805f095-d61d-44e1-8aad-71c0bedbaf9f',NULL,'idp-email-verification','teste','3665bc8c-4899-4bad-9b88-d9bbbab56584',2,10,_binary '\0',NULL,NULL),('989fee82-1a19-4089-bb98-c176973ad04b',NULL,NULL,'teste','bec05540-1187-4469-915e-e24b77eff976',0,20,_binary '','3665bc8c-4899-4bad-9b88-d9bbbab56584',NULL),('995385e3-fa6f-4a70-834f-4a4a37b52a73',NULL,NULL,'teste','09f0f045-2572-4ea0-a7bc-637dc23a46e5',0,20,_binary '','a8fed838-d040-4305-8816-6270eeb65f2c',NULL),('99b9bcf4-a633-4af9-8e5f-87eac060901e',NULL,'registration-profile-action','master','4fd9cf9f-7c6a-4989-b4aa-9aa82bf8ad1e',0,40,_binary '\0',NULL,NULL),('9d5fdec3-0cf6-4494-81bf-32c742b7dadb',NULL,'http-basic-authenticator','ecommerce','1f762e9b-2dfa-4b53-a821-8207709c0d0b',0,10,_binary '\0',NULL,NULL),('9dc417e1-7019-498e-9a51-d91c1a4802df',NULL,NULL,'teste','043e55dd-8478-49e5-82d4-e28756331045',1,20,_binary '','939d8506-8c71-4334-a27d-7168f95b3cbc',NULL),('9ed98e12-ba9e-495e-99a0-e51d0d69ac2c',NULL,'auth-otp-form','teste','939d8506-8c71-4334-a27d-7168f95b3cbc',0,20,_binary '\0',NULL,NULL),('a0a0d98d-40d8-4542-8eac-b613613e3a87',NULL,'client-jwt','master','a4f63335-59c5-45a0-9ac6-9d8bd45e1175',2,20,_binary '\0',NULL,NULL),('a2a96252-57f7-4521-98bf-35091a4bc551',NULL,'idp-email-verification','master','fe27a2ff-a3d7-49d1-a472-8673d4ddbc66',2,10,_binary '\0',NULL,NULL),('a3106ccf-c156-4d2e-987d-cbdf5f2eb327',NULL,'direct-grant-validate-otp','ecommerce','a5034f37-b79c-4c3e-8b66-40f14ddac84d',0,20,_binary '\0',NULL,NULL),('a337a342-65bd-4021-ab13-1f61c3755dd8',NULL,'reset-credential-email','master','f8fd5751-144a-4e37-b84c-da0385e97ed3',0,20,_binary '\0',NULL,NULL),('a3f31815-b3ce-4fd8-ba90-7bd8756a4ea5',NULL,NULL,'master','17080ecc-2717-49c5-9889-d26397832e45',1,30,_binary '','b2051783-7371-456d-b755-65ae316563d9',NULL),('a738e7f2-182b-4dab-97eb-955b548605f3',NULL,'idp-create-user-if-unique','teste','43eb0ad9-e6a5-4b7e-a4b6-98a860082cbe',2,10,_binary '\0',NULL,'0adb8d23-7de8-4fc2-babd-dd549dbb8839'),('ab06c35a-14cc-46ff-96ff-d14976f9e71b',NULL,'client-jwt','teste','09e09255-e7c5-4407-8dbc-ff6169645f38',2,20,_binary '\0',NULL,NULL),('ac03af77-0a9d-427b-8cb2-0fddb47173f5',NULL,'registration-user-creation','master','4fd9cf9f-7c6a-4989-b4aa-9aa82bf8ad1e',0,20,_binary '\0',NULL,NULL),('ad3693a9-7e6e-4e5c-8042-bbfdea95ef70',NULL,'docker-http-basic-authenticator','ecommerce','87889594-e98a-4638-b03f-e0c43cd6a329',0,10,_binary '\0',NULL,NULL),('b07e462c-fbdb-4e6a-b78d-29b3f13b8aa9',NULL,'conditional-user-configured','ecommerce','9515b3e2-9a19-4b25-9972-b43ae7de0fc5',0,10,_binary '\0',NULL,NULL),('b18d7267-8bfb-46a7-a410-aae66ab8cc41',NULL,'docker-http-basic-authenticator','teste','6080b261-724b-491e-be52-2f93fdacfbdb',0,10,_binary '\0',NULL,NULL),('b401fbc8-f961-4b79-825b-aed77c4bd666',NULL,'client-secret','master','a4f63335-59c5-45a0-9ac6-9d8bd45e1175',2,10,_binary '\0',NULL,NULL),('b5ead325-1002-466c-9d49-49dd93925f7b',NULL,'conditional-user-configured','teste','cf712e21-0fcc-4aac-878a-df4dc0d17bba',0,10,_binary '\0',NULL,NULL),('b6e80b6a-db66-45b2-acab-de78d66e27e6',NULL,NULL,'master','abb73a51-737c-4f88-b879-1fd7ac0c5073',2,20,_binary '','1f3641a1-4431-442e-8fb1-17c260bb45c2',NULL),('b8ae1b93-e6c5-4f3d-9a7c-d816b55348ef',NULL,'auth-otp-form','master','e6c128d0-2be2-43cc-87e4-4a9db40ac8a9',0,20,_binary '\0',NULL,NULL),('bb066e79-ea38-40a6-a4ae-ec978d63f723',NULL,NULL,'ecommerce','fcfddfd9-8634-486d-8fd0-006a3c1e1513',1,20,_binary '','9515b3e2-9a19-4b25-9972-b43ae7de0fc5',NULL),('bc495de6-a400-4218-988e-c6fafd9fb57e',NULL,'no-cookie-redirect','teste','09f0f045-2572-4ea0-a7bc-637dc23a46e5',0,10,_binary '\0',NULL,NULL),('bd30d269-4a68-46e2-8c04-35e98043c21e',NULL,'auth-spnego','master','bd8a3105-d529-47a4-9552-33cb0dc68176',3,20,_binary '\0',NULL,NULL),('beb35652-f514-4231-9dc7-01dc326e1242',NULL,'registration-profile-action','teste','b523db0b-d626-49f7-ae6c-fa6369d85076',0,40,_binary '\0',NULL,NULL),('bf954b37-3fcb-42d7-bf18-cffc25dbc7e2',NULL,NULL,'teste','a675a501-311d-42b6-9e0c-8375d35d4835',1,30,_binary '','0ea96a9b-c70e-40b3-8863-9612c654e3fb',NULL),('c2b8a2ac-6372-4a82-986e-3bab28433a38',NULL,NULL,'ecommerce','ccac688b-2d66-4169-8282-08311862ec91',2,30,_binary '','88b704c5-2ac2-4764-a67b-bab412032556',NULL),('ca83b9e7-307f-4aad-b940-1dbf5079899f',NULL,'basic-auth-otp','ecommerce','1119463b-dc00-4725-bc1b-98643ce5e755',3,20,_binary '\0',NULL,NULL),('cca5b134-6270-442b-bb1a-28f336c21082',NULL,'idp-confirm-link','teste','bec05540-1187-4469-915e-e24b77eff976',0,10,_binary '\0',NULL,NULL),('cd075ebd-3460-4787-8562-5ef39fae48cb',NULL,'registration-profile-action','ecommerce','f3cb5c5a-98f7-46a1-8456-580a980e6a7d',0,40,_binary '\0',NULL,NULL),('cda71b73-75da-4aad-9f40-410d61edbe39',NULL,'auth-otp-form','ecommerce','0e439367-fbb3-4b93-b133-4f68f09afd93',0,20,_binary '\0',NULL,NULL),('ce085bca-4cfc-44ce-b892-3f36dee39213',NULL,NULL,'master','1f3641a1-4431-442e-8fb1-17c260bb45c2',0,20,_binary '','fe27a2ff-a3d7-49d1-a472-8673d4ddbc66',NULL),('d22d9047-5f32-47a6-9c30-e7379a78650f',NULL,'identity-provider-redirector','ecommerce','ccac688b-2d66-4169-8282-08311862ec91',2,25,_binary '\0',NULL,NULL),('d238153e-3b02-4f64-a488-b5b7511d0e58',NULL,'direct-grant-validate-password','ecommerce','c4600205-6a60-406b-b96c-a596c430d752',0,20,_binary '\0',NULL,NULL),('d381b9ef-c855-43bd-afd0-044d8dbad890',NULL,'idp-username-password-form','ecommerce','fcfddfd9-8634-486d-8fd0-006a3c1e1513',0,10,_binary '\0',NULL,NULL),('d60f9453-50a3-4be3-95ce-a60971f673bd',NULL,'conditional-user-configured','teste','0ea96a9b-c70e-40b3-8863-9612c654e3fb',0,10,_binary '\0',NULL,NULL),('d739481d-8609-48e9-b23f-4405f9e227b6',NULL,NULL,'ecommerce','c4600205-6a60-406b-b96c-a596c430d752',1,30,_binary '','a5034f37-b79c-4c3e-8b66-40f14ddac84d',NULL),('d9380ca5-fa86-4c75-a2e6-af8c3e68a914',NULL,'client-secret-jwt','teste','09e09255-e7c5-4407-8dbc-ff6169645f38',2,30,_binary '\0',NULL,NULL),('d9ce07df-926b-4e38-a687-9aa380ba038d',NULL,NULL,'teste','ee5b39e2-9680-4552-89e2-df3c77d2592b',1,40,_binary '','cf712e21-0fcc-4aac-878a-df4dc0d17bba',NULL),('db6cda9d-4022-4f5c-bf59-d4fb60a5c6bd',NULL,'reset-otp','ecommerce','048676ac-72f4-4a69-aeb5-116ad9b89e6a',0,20,_binary '\0',NULL,NULL),('de163ef9-bfec-4f19-a344-4a6d386dead8',NULL,NULL,'ecommerce','45915bee-55bf-4062-86c3-f1e685b0aa88',0,20,_binary '','315b6c0f-d2e0-463a-813b-c246ee0597d7',NULL),('e0095419-d246-446a-b0fd-2959034a04a1',NULL,'registration-recaptcha-action','teste','b523db0b-d626-49f7-ae6c-fa6369d85076',3,60,_binary '\0',NULL,NULL),('e11c8f3c-6a37-41b1-a375-a56bd9aab3de',NULL,'registration-page-form','ecommerce','f87a631e-3e55-4f48-8b06-6c5ec9325caa',0,10,_binary '','f3cb5c5a-98f7-46a1-8456-580a980e6a7d',NULL),('e1e9e2e0-8f80-4e22-af7a-55fd9290d88d',NULL,'client-jwt','ecommerce','b2866354-8297-4a9f-a16d-75d3effc1bdd',2,20,_binary '\0',NULL,NULL),('e44a3418-96e6-40f6-b0cf-7ba64ac4d954',NULL,'direct-grant-validate-password','teste','a675a501-311d-42b6-9e0c-8375d35d4835',0,20,_binary '\0',NULL,NULL),('e591c8a7-8952-4f99-9047-3715f1e65fa9',NULL,NULL,'teste','f5c2ea22-5cff-4e5b-bfbf-63c7d6286921',2,30,_binary '','22d6e96c-c441-4dbc-9009-97ffe2c05e7f',NULL),('e9710ea2-4917-4387-9f12-6f14f0d9c5d1',NULL,'registration-password-action','master','4fd9cf9f-7c6a-4989-b4aa-9aa82bf8ad1e',0,50,_binary '\0',NULL,NULL),('eda48889-28d2-4192-97bc-e3cd286ee38f',NULL,'auth-spnego','ecommerce','1119463b-dc00-4725-bc1b-98643ce5e755',3,30,_binary '\0',NULL,NULL),('eeeea3be-e7a6-4592-a1b4-83c90190f327',NULL,'reset-credentials-choose-user','master','f8fd5751-144a-4e37-b84c-da0385e97ed3',0,10,_binary '\0',NULL,NULL),('ef1a1dd5-9d50-4105-aa81-e61c603e8b49',NULL,'auth-spnego','master','f18d41b4-3b84-43f6-b76b-35cd5bc68e48',3,30,_binary '\0',NULL,NULL),('f04a0136-d79c-4655-94df-230ca832ae8c',NULL,NULL,'master','e49f670b-ce5e-4c96-8226-94f4ed9eb699',0,20,_binary '','f18d41b4-3b84-43f6-b76b-35cd5bc68e48',NULL),('f07cd4de-a037-4fda-9ce1-09ad6e7f3173',NULL,'reset-credential-email','ecommerce','2f9a76c3-e197-47a8-b9da-d76df25cb60e',0,20,_binary '\0',NULL,NULL),('f21f1bfb-84dc-48ee-8d6d-2247ebbb88b5',NULL,'registration-user-creation','teste','b523db0b-d626-49f7-ae6c-fa6369d85076',0,20,_binary '\0',NULL,NULL),('f2b26d67-989b-4b1f-b554-4a7c762881b4',NULL,'auth-cookie','master','bd8a3105-d529-47a4-9552-33cb0dc68176',2,10,_binary '\0',NULL,NULL),('f45f9b07-d4cd-4a70-ac58-1b82c552f45b',NULL,'conditional-user-configured','master','e3d5fec9-7f60-494e-b6c2-5f3a55e78aca',0,10,_binary '\0',NULL,NULL),('f5681f3f-2df7-410e-a301-0a52a596fd9b',NULL,NULL,'ecommerce','88b704c5-2ac2-4764-a67b-bab412032556',1,20,_binary '','0e439367-fbb3-4b93-b133-4f68f09afd93',NULL),('f680098f-7f45-4986-b1df-fbb8fb5aa762',NULL,'registration-page-form','master','0e781be3-41dd-47fc-9bbd-45de13a2722d',0,10,_binary '','4fd9cf9f-7c6a-4989-b4aa-9aa82bf8ad1e',NULL),('f791a4ae-0b99-45ec-b346-552cbc8d6fcc',NULL,'auth-otp-form','ecommerce','9515b3e2-9a19-4b25-9972-b43ae7de0fc5',0,20,_binary '\0',NULL,NULL),('f80ece3d-e3a8-436b-8e37-51179446e671',NULL,'conditional-user-configured','ecommerce','048676ac-72f4-4a69-aeb5-116ad9b89e6a',0,10,_binary '\0',NULL,NULL),('f8e5f55c-03bc-4cf3-bf9b-8083d430ce8a',NULL,'docker-http-basic-authenticator','master','03354e26-4d9a-473f-afeb-3f29d8dcfaf9',0,10,_binary '\0',NULL,NULL),('fb79bb51-e796-4601-86e9-3e6b47e3966c',NULL,'conditional-user-configured','ecommerce','0e439367-fbb3-4b93-b133-4f68f09afd93',0,10,_binary '\0',NULL,NULL),('fe5ac824-b40c-4ad9-843b-4c3d1df9ecdf',NULL,'auth-otp-form','master','e3d5fec9-7f60-494e-b6c2-5f3a55e78aca',0,20,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `authentication_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentication_flow`
--

DROP TABLE IF EXISTS `authentication_flow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authentication_flow` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `ALIAS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROVIDER_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentication_flow`
--

LOCK TABLES `authentication_flow` WRITE;
/*!40000 ALTER TABLE `authentication_flow` DISABLE KEYS */;
INSERT INTO `authentication_flow` VALUES ('03354e26-4d9a-473f-afeb-3f29d8dcfaf9','docker auth','Used by Docker clients to authenticate against the IDP','master','basic-flow',_binary '',_binary ''),('043e55dd-8478-49e5-82d4-e28756331045','Verify Existing Account by Re-authentication','Reauthentication of existing account','teste','basic-flow',_binary '\0',_binary ''),('048676ac-72f4-4a69-aeb5-116ad9b89e6a','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','ecommerce','basic-flow',_binary '\0',_binary ''),('05584dc3-dab9-4195-ad76-3a98942de164','Verify Existing Account by Re-authentication','Reauthentication of existing account','master','basic-flow',_binary '\0',_binary ''),('09e09255-e7c5-4407-8dbc-ff6169645f38','clients','Base authentication for clients','teste','client-flow',_binary '',_binary ''),('09f0f045-2572-4ea0-a7bc-637dc23a46e5','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','teste','basic-flow',_binary '',_binary ''),('0e439367-fbb3-4b93-b133-4f68f09afd93','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','ecommerce','basic-flow',_binary '\0',_binary ''),('0e781be3-41dd-47fc-9bbd-45de13a2722d','registration','registration flow','master','basic-flow',_binary '',_binary ''),('0ea96a9b-c70e-40b3-8863-9612c654e3fb','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','teste','basic-flow',_binary '\0',_binary ''),('1119463b-dc00-4725-bc1b-98643ce5e755','Authentication Options','Authentication options.','ecommerce','basic-flow',_binary '\0',_binary ''),('17080ecc-2717-49c5-9889-d26397832e45','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow',_binary '',_binary ''),('1f3641a1-4431-442e-8fb1-17c260bb45c2','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','master','basic-flow',_binary '\0',_binary ''),('1f762e9b-2dfa-4b53-a821-8207709c0d0b','saml ecp','SAML ECP Profile Authentication Flow','ecommerce','basic-flow',_binary '',_binary ''),('22d6e96c-c441-4dbc-9009-97ffe2c05e7f','forms','Username, password, otp and other auth forms.','teste','basic-flow',_binary '\0',_binary ''),('2f9a76c3-e197-47a8-b9da-d76df25cb60e','reset credentials','Reset credentials for a user if they forgot their password or something','ecommerce','basic-flow',_binary '',_binary ''),('315b6c0f-d2e0-463a-813b-c246ee0597d7','Account verification options','Method with which to verity the existing account','ecommerce','basic-flow',_binary '\0',_binary ''),('33881fa5-4542-4e58-b558-62c40260f1d0','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','master','basic-flow',_binary '',_binary ''),('3665bc8c-4899-4bad-9b88-d9bbbab56584','Account verification options','Method with which to verity the existing account','teste','basic-flow',_binary '\0',_binary ''),('3ef6062c-59b5-427b-bf7b-9b396b5d0ef2','saml ecp','SAML ECP Profile Authentication Flow','teste','basic-flow',_binary '',_binary ''),('43eb0ad9-e6a5-4b7e-a4b6-98a860082cbe','User creation or linking','Flow for the existing/non-existing user alternatives','teste','basic-flow',_binary '\0',_binary ''),('45915bee-55bf-4062-86c3-f1e685b0aa88','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','ecommerce','basic-flow',_binary '\0',_binary ''),('4d1fe7c9-aa29-41ef-a52a-1210ca4a0ab9','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','master','basic-flow',_binary '\0',_binary ''),('4fd9cf9f-7c6a-4989-b4aa-9aa82bf8ad1e','registration form','registration form','master','form-flow',_binary '\0',_binary ''),('51f61c1b-47b8-4116-90f9-823eed3a38b5','saml ecp','SAML ECP Profile Authentication Flow','master','basic-flow',_binary '',_binary ''),('556dbf8d-a883-4f18-afc1-604d87d096f9','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','ecommerce','basic-flow',_binary '',_binary ''),('6080b261-724b-491e-be52-2f93fdacfbdb','docker auth','Used by Docker clients to authenticate against the IDP','teste','basic-flow',_binary '',_binary ''),('70c34686-1e57-4869-9b36-39e067c34e1a','registration','registration flow','teste','basic-flow',_binary '',_binary ''),('87889594-e98a-4638-b03f-e0c43cd6a329','docker auth','Used by Docker clients to authenticate against the IDP','ecommerce','basic-flow',_binary '',_binary ''),('87d86a2e-fb10-4ef7-9c60-208fc2352ccd','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','teste','basic-flow',_binary '\0',_binary ''),('88b704c5-2ac2-4764-a67b-bab412032556','forms','Username, password, otp and other auth forms.','ecommerce','basic-flow',_binary '\0',_binary ''),('939d8506-8c71-4334-a27d-7168f95b3cbc','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','teste','basic-flow',_binary '\0',_binary ''),('9515b3e2-9a19-4b25-9972-b43ae7de0fc5','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','ecommerce','basic-flow',_binary '\0',_binary ''),('a4f63335-59c5-45a0-9ac6-9d8bd45e1175','clients','Base authentication for clients','master','client-flow',_binary '',_binary ''),('a5034f37-b79c-4c3e-8b66-40f14ddac84d','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','ecommerce','basic-flow',_binary '\0',_binary ''),('a675a501-311d-42b6-9e0c-8375d35d4835','direct grant','OpenID Connect Resource Owner Grant','teste','basic-flow',_binary '',_binary ''),('a788c900-179d-4990-9495-c48303979901','User creation or linking','Flow for the existing/non-existing user alternatives','ecommerce','basic-flow',_binary '\0',_binary ''),('a8fed838-d040-4305-8816-6270eeb65f2c','Authentication Options','Authentication options.','teste','basic-flow',_binary '\0',_binary ''),('abb73a51-737c-4f88-b879-1fd7ac0c5073','User creation or linking','Flow for the existing/non-existing user alternatives','master','basic-flow',_binary '\0',_binary ''),('acf63a0a-05e6-4f8f-bb8d-bef7c5d8b679','forms','Username, password, otp and other auth forms.','master','basic-flow',_binary '\0',_binary ''),('b2051783-7371-456d-b755-65ae316563d9','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('b2866354-8297-4a9f-a16d-75d3effc1bdd','clients','Base authentication for clients','ecommerce','client-flow',_binary '',_binary ''),('b523db0b-d626-49f7-ae6c-fa6369d85076','registration form','registration form','teste','form-flow',_binary '\0',_binary ''),('ba8e4542-26b3-4400-ae00-af9a48c55d1c','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','teste','basic-flow',_binary '',_binary ''),('bd8a3105-d529-47a4-9552-33cb0dc68176','browser','browser based authentication','master','basic-flow',_binary '',_binary ''),('bec05540-1187-4469-915e-e24b77eff976','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','teste','basic-flow',_binary '\0',_binary ''),('c4600205-6a60-406b-b96c-a596c430d752','direct grant','OpenID Connect Resource Owner Grant','ecommerce','basic-flow',_binary '',_binary ''),('ccac688b-2d66-4169-8282-08311862ec91','browser','browser based authentication','ecommerce','basic-flow',_binary '',_binary ''),('cf712e21-0fcc-4aac-878a-df4dc0d17bba','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','teste','basic-flow',_binary '\0',_binary ''),('e3d5fec9-7f60-494e-b6c2-5f3a55e78aca','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('e3d735ab-f562-4b75-a87c-b4b328ad24ca','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','ecommerce','basic-flow',_binary '',_binary ''),('e49f670b-ce5e-4c96-8226-94f4ed9eb699','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','master','basic-flow',_binary '',_binary ''),('e6c128d0-2be2-43cc-87e4-4a9db40ac8a9','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('ee5b39e2-9680-4552-89e2-df3c77d2592b','reset credentials','Reset credentials for a user if they forgot their password or something','teste','basic-flow',_binary '',_binary ''),('f18d41b4-3b84-43f6-b76b-35cd5bc68e48','Authentication Options','Authentication options.','master','basic-flow',_binary '\0',_binary ''),('f3cb5c5a-98f7-46a1-8456-580a980e6a7d','registration form','registration form','ecommerce','form-flow',_binary '\0',_binary ''),('f5c2ea22-5cff-4e5b-bfbf-63c7d6286921','browser','browser based authentication','teste','basic-flow',_binary '',_binary ''),('f87a631e-3e55-4f48-8b06-6c5ec9325caa','registration','registration flow','ecommerce','basic-flow',_binary '',_binary ''),('f8fd5751-144a-4e37-b84c-da0385e97ed3','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow',_binary '',_binary ''),('fcfddfd9-8634-486d-8fd0-006a3c1e1513','Verify Existing Account by Re-authentication','Reauthentication of existing account','ecommerce','basic-flow',_binary '\0',_binary ''),('fe27a2ff-a3d7-49d1-a472-8673d4ddbc66','Account verification options','Method with which to verity the existing account','master','basic-flow',_binary '\0',_binary '');
/*!40000 ALTER TABLE `authentication_flow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authenticator_config`
--

DROP TABLE IF EXISTS `authenticator_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authenticator_config` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `ALIAS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authenticator_config`
--

LOCK TABLES `authenticator_config` WRITE;
/*!40000 ALTER TABLE `authenticator_config` DISABLE KEYS */;
INSERT INTO `authenticator_config` VALUES ('0adb8d23-7de8-4fc2-babd-dd549dbb8839','create unique user config','teste'),('4ef14e8d-040e-4eb8-b7f4-75a7f4b2d4ac','create unique user config','master'),('7b62c623-7e5f-41b1-9751-5b3fa543a94a','review profile config','master'),('c3d7e259-bc7d-442a-bb9d-6d9bead408e4','review profile config','teste'),('e3081474-6ed5-4877-a091-5ca7a6443d3c','review profile config','ecommerce'),('e694eb02-0cbe-4249-9f02-725cb4f80ffa','create unique user config','ecommerce');
/*!40000 ALTER TABLE `authenticator_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authenticator_config_entry`
--

DROP TABLE IF EXISTS `authenticator_config_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authenticator_config_entry` (
  `AUTHENTICATOR_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` longtext COLLATE utf8_unicode_ci,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authenticator_config_entry`
--

LOCK TABLES `authenticator_config_entry` WRITE;
/*!40000 ALTER TABLE `authenticator_config_entry` DISABLE KEYS */;
INSERT INTO `authenticator_config_entry` VALUES ('0adb8d23-7de8-4fc2-babd-dd549dbb8839','false','require.password.update.after.registration'),('4ef14e8d-040e-4eb8-b7f4-75a7f4b2d4ac','false','require.password.update.after.registration'),('7b62c623-7e5f-41b1-9751-5b3fa543a94a','missing','update.profile.on.first.login'),('c3d7e259-bc7d-442a-bb9d-6d9bead408e4','missing','update.profile.on.first.login'),('e3081474-6ed5-4877-a091-5ca7a6443d3c','missing','update.profile.on.first.login'),('e694eb02-0cbe-4249-9f02-725cb4f80ffa','false','require.password.update.after.registration');
/*!40000 ALTER TABLE `authenticator_config_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `broker_link`
--

DROP TABLE IF EXISTS `broker_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `broker_link` (
  `IDENTITY_PROVIDER` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `BROKER_USER_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TOKEN` text COLLATE utf8_unicode_ci,
  `USER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `broker_link`
--

LOCK TABLES `broker_link` WRITE;
/*!40000 ALTER TABLE `broker_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `broker_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BASE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ROOT_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ALWAYS_DISPLAY_IN_CONSOLE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES ('1552a7c5-a7fc-4aa9-ba43-1acafcbcb7a7',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/ecommerce/console/',_binary '\0',NULL,_binary '\0','ecommerce','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('2572573e-8bf0-499c-b556-af0edcd22ce3',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/teste/console/',_binary '\0',NULL,_binary '\0','teste','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('25f383aa-0115-4175-ae70-f150fa71c5c3',_binary '',_binary '\0','realm-management',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','ecommerce','openid-connect',0,_binary '\0',_binary '\0','${client_realm-management}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('289b03fd-53d1-432d-ad18-16d809920475',_binary '',_binary '','ecommerce',0,_binary '',NULL,NULL,_binary '\0','http://localhost:3000',_binary '\0','ecommerce','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret','http://localhost:3000',NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('3ab1a78f-5cc4-4cf9-b523-a96f34c9565a',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/ecommerce/account/',_binary '\0',NULL,_binary '\0','ecommerce','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('3ee60457-8e9f-4165-89ee-781dd69c8eae',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/teste/account/',_binary '\0',NULL,_binary '\0','teste','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('4019a917-a2c0-411b-b786-1d7d39e78c0b',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('428caa2d-69fd-478f-90ef-acb8375b3773',_binary '',_binary '\0','realm-management',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','teste','openid-connect',0,_binary '\0',_binary '\0','${client_realm-management}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('45759025-c500-44f8-9792-05e9d08b5ba0',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/teste/account/',_binary '\0',NULL,_binary '\0','teste','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('5927e3ac-1c44-4cad-ba3f-7a257f4c4590',_binary '',_binary '\0','ecommerce-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','ecommerce Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('5a71649f-df11-4101-9a6b-ca68c5140314',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',_binary '',_binary '\0','master-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','master Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('864ed488-7df6-4b5e-b02f-b329b864361d',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('8971ba95-904e-4e39-885a-4c08b51de078',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','ecommerce','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('8e272df4-e68a-4c46-91e3-e3edc0bd3a5e',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','ecommerce','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('9338200f-e9d4-4c7b-a679-d56ffed9ee8c',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('bc608c00-b971-4080-859d-536d0738f5f5',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','teste','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('c80da043-8847-4537-8b85-3dd4620df8a6',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','teste','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('d2b83dc4-9823-4e9b-95c0-c39c8b667eb4',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/ecommerce/account/',_binary '\0',NULL,_binary '\0','ecommerce','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('d45b0897-a81c-4d1e-ab67-75d9452b5389',_binary '',_binary '','cuida',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','teste','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('d9e5f172-c255-4f81-98c5-eae6c26a4b61',_binary '',_binary '\0','teste-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','teste Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('ee662877-97f9-4147-9631-b92ce80cc566',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/master/console/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_attributes`
--

DROP TABLE IF EXISTS `client_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_attributes` (
  `CLIENT_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  KEY `IDX_CLIENT_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`(255)),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_attributes`
--

LOCK TABLES `client_attributes` WRITE;
/*!40000 ALTER TABLE `client_attributes` DISABLE KEYS */;
INSERT INTO `client_attributes` VALUES ('1552a7c5-a7fc-4aa9-ba43-1acafcbcb7a7','S256','pkce.code.challenge.method'),('2572573e-8bf0-499c-b556-af0edcd22ce3','S256','pkce.code.challenge.method'),('289b03fd-53d1-432d-ad18-16d809920475','false','backchannel.logout.revoke.offline.tokens'),('289b03fd-53d1-432d-ad18-16d809920475','false','backchannel.logout.session.required'),('289b03fd-53d1-432d-ad18-16d809920475','false','client_credentials.use_refresh_token'),('289b03fd-53d1-432d-ad18-16d809920475','false','display.on.consent.screen'),('289b03fd-53d1-432d-ad18-16d809920475','false','exclude.session.state.from.auth.response'),('289b03fd-53d1-432d-ad18-16d809920475','false','id.token.as.detached.signature'),('289b03fd-53d1-432d-ad18-16d809920475','false','oauth2.device.authorization.grant.enabled'),('289b03fd-53d1-432d-ad18-16d809920475','false','oidc.ciba.grant.enabled'),('289b03fd-53d1-432d-ad18-16d809920475','false','require.pushed.authorization.requests'),('289b03fd-53d1-432d-ad18-16d809920475','false','saml_force_name_id_format'),('289b03fd-53d1-432d-ad18-16d809920475','false','saml.artifact.binding'),('289b03fd-53d1-432d-ad18-16d809920475','false','saml.assertion.signature'),('289b03fd-53d1-432d-ad18-16d809920475','false','saml.authnstatement'),('289b03fd-53d1-432d-ad18-16d809920475','false','saml.client.signature'),('289b03fd-53d1-432d-ad18-16d809920475','false','saml.encrypt'),('289b03fd-53d1-432d-ad18-16d809920475','false','saml.force.post.binding'),('289b03fd-53d1-432d-ad18-16d809920475','false','saml.multivalued.roles'),('289b03fd-53d1-432d-ad18-16d809920475','false','saml.onetimeuse.condition'),('289b03fd-53d1-432d-ad18-16d809920475','false','saml.server.signature'),('289b03fd-53d1-432d-ad18-16d809920475','false','saml.server.signature.keyinfo.ext'),('289b03fd-53d1-432d-ad18-16d809920475','false','tls.client.certificate.bound.access.tokens'),('289b03fd-53d1-432d-ad18-16d809920475','true','use.refresh.tokens'),('3ab1a78f-5cc4-4cf9-b523-a96f34c9565a','S256','pkce.code.challenge.method'),('45759025-c500-44f8-9792-05e9d08b5ba0','S256','pkce.code.challenge.method'),('5a71649f-df11-4101-9a6b-ca68c5140314','S256','pkce.code.challenge.method'),('d45b0897-a81c-4d1e-ab67-75d9452b5389','false','backchannel.logout.revoke.offline.tokens'),('d45b0897-a81c-4d1e-ab67-75d9452b5389','true','backchannel.logout.session.required'),('ee662877-97f9-4147-9631-b92ce80cc566','S256','pkce.code.challenge.method');
/*!40000 ALTER TABLE `client_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_auth_flow_bindings`
--

DROP TABLE IF EXISTS `client_auth_flow_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_auth_flow_bindings` (
  `CLIENT_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `FLOW_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BINDING_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_auth_flow_bindings`
--

LOCK TABLES `client_auth_flow_bindings` WRITE;
/*!40000 ALTER TABLE `client_auth_flow_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_auth_flow_bindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_initial_access`
--

DROP TABLE IF EXISTS `client_initial_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_initial_access` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `EXPIRATION` int DEFAULT NULL,
  `COUNT` int DEFAULT NULL,
  `REMAINING_COUNT` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_initial_access`
--

LOCK TABLES `client_initial_access` WRITE;
/*!40000 ALTER TABLE `client_initial_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_initial_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_node_registrations`
--

DROP TABLE IF EXISTS `client_node_registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_node_registrations` (
  `CLIENT_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` int DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_node_registrations`
--

LOCK TABLES `client_node_registrations` WRITE;
/*!40000 ALTER TABLE `client_node_registrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_node_registrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_scope`
--

DROP TABLE IF EXISTS `client_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_scope` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_scope`
--

LOCK TABLES `client_scope` WRITE;
/*!40000 ALTER TABLE `client_scope` DISABLE KEYS */;
INSERT INTO `client_scope` VALUES ('008f4ded-c329-48c2-9c92-1a03dbbf78ac','offline_access','teste','OpenID Connect built-in scope: offline_access','openid-connect'),('0db8d451-717f-425a-bdd7-9123bf1b7c8b','role_list','ecommerce','SAML role list','saml'),('1cf9ab4e-b07c-4c1a-a7d9-305e43d25a03','web-origins','teste','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('1f8afd59-9ffa-4983-b809-11e89bff3220','address','master','OpenID Connect built-in scope: address','openid-connect'),('2b87fc24-50ab-434e-b3ca-acf0c7891804','profile','teste','OpenID Connect built-in scope: profile','openid-connect'),('2ea621ac-e268-418b-a40d-813cd782ead6','address','teste','OpenID Connect built-in scope: address','openid-connect'),('397fcd6a-6c3f-4dea-96e6-6eb13c2ea790','phone','teste','OpenID Connect built-in scope: phone','openid-connect'),('4208e432-8707-4acc-a289-74e115b35561','offline_access','master','OpenID Connect built-in scope: offline_access','openid-connect'),('4d392da9-bb7f-4500-80cb-9fe7d09d7ecf','phone','ecommerce','OpenID Connect built-in scope: phone','openid-connect'),('5159dfd5-2a50-4bee-bcc7-a2b9acc7c2f8','roles','teste','OpenID Connect scope for add user roles to the access token','openid-connect'),('545c9eca-624d-4da7-b66e-e8e4c0f58178','web-origins','master','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('64f01f75-4fbd-45d9-9fe5-f6608da26a08','profile','master','OpenID Connect built-in scope: profile','openid-connect'),('770a7a4d-438a-4f5f-90eb-063215b4df81','microprofile-jwt','ecommerce','Microprofile - JWT built-in scope','openid-connect'),('77d2cbe1-ea69-4085-81c9-e61c33a3b7c8','address','ecommerce','OpenID Connect built-in scope: address','openid-connect'),('7ae86941-ce2d-4ba0-ac86-5ad0983ef252','roles','ecommerce','OpenID Connect scope for add user roles to the access token','openid-connect'),('84b7e072-0523-44e3-add4-ad5acf6b1c3a','roles','master','OpenID Connect scope for add user roles to the access token','openid-connect'),('8a01f0a0-74da-46b7-9183-d0d1017ccf52','microprofile-jwt','teste','Microprofile - JWT built-in scope','openid-connect'),('958e4eec-b00e-4963-9d93-f722bc6e5595','profile','ecommerce','OpenID Connect built-in scope: profile','openid-connect'),('a60a01d1-4b76-4d12-915e-9e2fdeb55e09','role_list','master','SAML role list','saml'),('bb6813d4-0ac1-43e3-ad21-a7ef3c251e0c','email','ecommerce','OpenID Connect built-in scope: email','openid-connect'),('c04cbf2d-b342-4d4c-b242-ff9652bf5980','offline_access','ecommerce','OpenID Connect built-in scope: offline_access','openid-connect'),('c7f2d128-f598-4b0f-8325-8d344555322f','microprofile-jwt','master','Microprofile - JWT built-in scope','openid-connect'),('c98eb9bd-76e3-4f2e-b27c-7a0d3526fcd0','email','master','OpenID Connect built-in scope: email','openid-connect'),('c9db35e1-d8cf-4de6-a005-e265abfd83af','phone','master','OpenID Connect built-in scope: phone','openid-connect'),('d42e4740-91f0-441f-b70c-3adb96dfa6de','role_list','teste','SAML role list','saml'),('d917b551-9990-4ea6-afe7-4fec8711e923','email','teste','OpenID Connect built-in scope: email','openid-connect'),('faab6469-8297-441f-9967-e779741d5079','web-origins','ecommerce','OpenID Connect scope for add allowed web origins to the access token','openid-connect');
/*!40000 ALTER TABLE `client_scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_scope_attributes`
--

DROP TABLE IF EXISTS `client_scope_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_scope_attributes` (
  `SCOPE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `client_scope` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_scope_attributes`
--

LOCK TABLES `client_scope_attributes` WRITE;
/*!40000 ALTER TABLE `client_scope_attributes` DISABLE KEYS */;
INSERT INTO `client_scope_attributes` VALUES ('008f4ded-c329-48c2-9c92-1a03dbbf78ac','${offlineAccessScopeConsentText}','consent.screen.text'),('008f4ded-c329-48c2-9c92-1a03dbbf78ac','true','display.on.consent.screen'),('0db8d451-717f-425a-bdd7-9123bf1b7c8b','${samlRoleListScopeConsentText}','consent.screen.text'),('0db8d451-717f-425a-bdd7-9123bf1b7c8b','true','display.on.consent.screen'),('1cf9ab4e-b07c-4c1a-a7d9-305e43d25a03','','consent.screen.text'),('1cf9ab4e-b07c-4c1a-a7d9-305e43d25a03','false','display.on.consent.screen'),('1cf9ab4e-b07c-4c1a-a7d9-305e43d25a03','false','include.in.token.scope'),('1f8afd59-9ffa-4983-b809-11e89bff3220','${addressScopeConsentText}','consent.screen.text'),('1f8afd59-9ffa-4983-b809-11e89bff3220','true','display.on.consent.screen'),('1f8afd59-9ffa-4983-b809-11e89bff3220','true','include.in.token.scope'),('2b87fc24-50ab-434e-b3ca-acf0c7891804','${profileScopeConsentText}','consent.screen.text'),('2b87fc24-50ab-434e-b3ca-acf0c7891804','true','display.on.consent.screen'),('2b87fc24-50ab-434e-b3ca-acf0c7891804','true','include.in.token.scope'),('2ea621ac-e268-418b-a40d-813cd782ead6','${addressScopeConsentText}','consent.screen.text'),('2ea621ac-e268-418b-a40d-813cd782ead6','true','display.on.consent.screen'),('2ea621ac-e268-418b-a40d-813cd782ead6','true','include.in.token.scope'),('397fcd6a-6c3f-4dea-96e6-6eb13c2ea790','${phoneScopeConsentText}','consent.screen.text'),('397fcd6a-6c3f-4dea-96e6-6eb13c2ea790','true','display.on.consent.screen'),('397fcd6a-6c3f-4dea-96e6-6eb13c2ea790','true','include.in.token.scope'),('4208e432-8707-4acc-a289-74e115b35561','${offlineAccessScopeConsentText}','consent.screen.text'),('4208e432-8707-4acc-a289-74e115b35561','true','display.on.consent.screen'),('4d392da9-bb7f-4500-80cb-9fe7d09d7ecf','${phoneScopeConsentText}','consent.screen.text'),('4d392da9-bb7f-4500-80cb-9fe7d09d7ecf','true','display.on.consent.screen'),('4d392da9-bb7f-4500-80cb-9fe7d09d7ecf','true','include.in.token.scope'),('5159dfd5-2a50-4bee-bcc7-a2b9acc7c2f8','${rolesScopeConsentText}','consent.screen.text'),('5159dfd5-2a50-4bee-bcc7-a2b9acc7c2f8','true','display.on.consent.screen'),('5159dfd5-2a50-4bee-bcc7-a2b9acc7c2f8','false','include.in.token.scope'),('545c9eca-624d-4da7-b66e-e8e4c0f58178','','consent.screen.text'),('545c9eca-624d-4da7-b66e-e8e4c0f58178','false','display.on.consent.screen'),('545c9eca-624d-4da7-b66e-e8e4c0f58178','false','include.in.token.scope'),('64f01f75-4fbd-45d9-9fe5-f6608da26a08','${profileScopeConsentText}','consent.screen.text'),('64f01f75-4fbd-45d9-9fe5-f6608da26a08','true','display.on.consent.screen'),('64f01f75-4fbd-45d9-9fe5-f6608da26a08','true','include.in.token.scope'),('770a7a4d-438a-4f5f-90eb-063215b4df81','false','display.on.consent.screen'),('770a7a4d-438a-4f5f-90eb-063215b4df81','true','include.in.token.scope'),('77d2cbe1-ea69-4085-81c9-e61c33a3b7c8','${addressScopeConsentText}','consent.screen.text'),('77d2cbe1-ea69-4085-81c9-e61c33a3b7c8','true','display.on.consent.screen'),('77d2cbe1-ea69-4085-81c9-e61c33a3b7c8','true','include.in.token.scope'),('7ae86941-ce2d-4ba0-ac86-5ad0983ef252','${rolesScopeConsentText}','consent.screen.text'),('7ae86941-ce2d-4ba0-ac86-5ad0983ef252','true','display.on.consent.screen'),('7ae86941-ce2d-4ba0-ac86-5ad0983ef252','false','include.in.token.scope'),('84b7e072-0523-44e3-add4-ad5acf6b1c3a','${rolesScopeConsentText}','consent.screen.text'),('84b7e072-0523-44e3-add4-ad5acf6b1c3a','true','display.on.consent.screen'),('84b7e072-0523-44e3-add4-ad5acf6b1c3a','false','include.in.token.scope'),('8a01f0a0-74da-46b7-9183-d0d1017ccf52','false','display.on.consent.screen'),('8a01f0a0-74da-46b7-9183-d0d1017ccf52','true','include.in.token.scope'),('958e4eec-b00e-4963-9d93-f722bc6e5595','${profileScopeConsentText}','consent.screen.text'),('958e4eec-b00e-4963-9d93-f722bc6e5595','true','display.on.consent.screen'),('958e4eec-b00e-4963-9d93-f722bc6e5595','true','include.in.token.scope'),('a60a01d1-4b76-4d12-915e-9e2fdeb55e09','${samlRoleListScopeConsentText}','consent.screen.text'),('a60a01d1-4b76-4d12-915e-9e2fdeb55e09','true','display.on.consent.screen'),('bb6813d4-0ac1-43e3-ad21-a7ef3c251e0c','${emailScopeConsentText}','consent.screen.text'),('bb6813d4-0ac1-43e3-ad21-a7ef3c251e0c','true','display.on.consent.screen'),('bb6813d4-0ac1-43e3-ad21-a7ef3c251e0c','true','include.in.token.scope'),('c04cbf2d-b342-4d4c-b242-ff9652bf5980','${offlineAccessScopeConsentText}','consent.screen.text'),('c04cbf2d-b342-4d4c-b242-ff9652bf5980','true','display.on.consent.screen'),('c7f2d128-f598-4b0f-8325-8d344555322f','false','display.on.consent.screen'),('c7f2d128-f598-4b0f-8325-8d344555322f','true','include.in.token.scope'),('c98eb9bd-76e3-4f2e-b27c-7a0d3526fcd0','${emailScopeConsentText}','consent.screen.text'),('c98eb9bd-76e3-4f2e-b27c-7a0d3526fcd0','true','display.on.consent.screen'),('c98eb9bd-76e3-4f2e-b27c-7a0d3526fcd0','true','include.in.token.scope'),('c9db35e1-d8cf-4de6-a005-e265abfd83af','${phoneScopeConsentText}','consent.screen.text'),('c9db35e1-d8cf-4de6-a005-e265abfd83af','true','display.on.consent.screen'),('c9db35e1-d8cf-4de6-a005-e265abfd83af','true','include.in.token.scope'),('d42e4740-91f0-441f-b70c-3adb96dfa6de','${samlRoleListScopeConsentText}','consent.screen.text'),('d42e4740-91f0-441f-b70c-3adb96dfa6de','true','display.on.consent.screen'),('d917b551-9990-4ea6-afe7-4fec8711e923','${emailScopeConsentText}','consent.screen.text'),('d917b551-9990-4ea6-afe7-4fec8711e923','true','display.on.consent.screen'),('d917b551-9990-4ea6-afe7-4fec8711e923','true','include.in.token.scope'),('faab6469-8297-441f-9967-e779741d5079','','consent.screen.text'),('faab6469-8297-441f-9967-e779741d5079','false','display.on.consent.screen'),('faab6469-8297-441f-9967-e779741d5079','false','include.in.token.scope');
/*!40000 ALTER TABLE `client_scope_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_scope_client`
--

DROP TABLE IF EXISTS `client_scope_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_scope_client` (
  `CLIENT_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_scope_client`
--

LOCK TABLES `client_scope_client` WRITE;
/*!40000 ALTER TABLE `client_scope_client` DISABLE KEYS */;
INSERT INTO `client_scope_client` VALUES ('1552a7c5-a7fc-4aa9-ba43-1acafcbcb7a7','4d392da9-bb7f-4500-80cb-9fe7d09d7ecf',_binary '\0'),('1552a7c5-a7fc-4aa9-ba43-1acafcbcb7a7','770a7a4d-438a-4f5f-90eb-063215b4df81',_binary '\0'),('1552a7c5-a7fc-4aa9-ba43-1acafcbcb7a7','77d2cbe1-ea69-4085-81c9-e61c33a3b7c8',_binary '\0'),('1552a7c5-a7fc-4aa9-ba43-1acafcbcb7a7','7ae86941-ce2d-4ba0-ac86-5ad0983ef252',_binary ''),('1552a7c5-a7fc-4aa9-ba43-1acafcbcb7a7','958e4eec-b00e-4963-9d93-f722bc6e5595',_binary ''),('1552a7c5-a7fc-4aa9-ba43-1acafcbcb7a7','bb6813d4-0ac1-43e3-ad21-a7ef3c251e0c',_binary ''),('1552a7c5-a7fc-4aa9-ba43-1acafcbcb7a7','c04cbf2d-b342-4d4c-b242-ff9652bf5980',_binary '\0'),('1552a7c5-a7fc-4aa9-ba43-1acafcbcb7a7','faab6469-8297-441f-9967-e779741d5079',_binary ''),('2572573e-8bf0-499c-b556-af0edcd22ce3','008f4ded-c329-48c2-9c92-1a03dbbf78ac',_binary '\0'),('2572573e-8bf0-499c-b556-af0edcd22ce3','1cf9ab4e-b07c-4c1a-a7d9-305e43d25a03',_binary ''),('2572573e-8bf0-499c-b556-af0edcd22ce3','2b87fc24-50ab-434e-b3ca-acf0c7891804',_binary ''),('2572573e-8bf0-499c-b556-af0edcd22ce3','2ea621ac-e268-418b-a40d-813cd782ead6',_binary '\0'),('2572573e-8bf0-499c-b556-af0edcd22ce3','397fcd6a-6c3f-4dea-96e6-6eb13c2ea790',_binary '\0'),('2572573e-8bf0-499c-b556-af0edcd22ce3','5159dfd5-2a50-4bee-bcc7-a2b9acc7c2f8',_binary ''),('2572573e-8bf0-499c-b556-af0edcd22ce3','8a01f0a0-74da-46b7-9183-d0d1017ccf52',_binary '\0'),('2572573e-8bf0-499c-b556-af0edcd22ce3','d917b551-9990-4ea6-afe7-4fec8711e923',_binary ''),('25f383aa-0115-4175-ae70-f150fa71c5c3','4d392da9-bb7f-4500-80cb-9fe7d09d7ecf',_binary '\0'),('25f383aa-0115-4175-ae70-f150fa71c5c3','770a7a4d-438a-4f5f-90eb-063215b4df81',_binary '\0'),('25f383aa-0115-4175-ae70-f150fa71c5c3','77d2cbe1-ea69-4085-81c9-e61c33a3b7c8',_binary '\0'),('25f383aa-0115-4175-ae70-f150fa71c5c3','7ae86941-ce2d-4ba0-ac86-5ad0983ef252',_binary ''),('25f383aa-0115-4175-ae70-f150fa71c5c3','958e4eec-b00e-4963-9d93-f722bc6e5595',_binary ''),('25f383aa-0115-4175-ae70-f150fa71c5c3','bb6813d4-0ac1-43e3-ad21-a7ef3c251e0c',_binary ''),('25f383aa-0115-4175-ae70-f150fa71c5c3','c04cbf2d-b342-4d4c-b242-ff9652bf5980',_binary '\0'),('25f383aa-0115-4175-ae70-f150fa71c5c3','faab6469-8297-441f-9967-e779741d5079',_binary ''),('289b03fd-53d1-432d-ad18-16d809920475','4d392da9-bb7f-4500-80cb-9fe7d09d7ecf',_binary '\0'),('289b03fd-53d1-432d-ad18-16d809920475','770a7a4d-438a-4f5f-90eb-063215b4df81',_binary '\0'),('289b03fd-53d1-432d-ad18-16d809920475','77d2cbe1-ea69-4085-81c9-e61c33a3b7c8',_binary '\0'),('289b03fd-53d1-432d-ad18-16d809920475','7ae86941-ce2d-4ba0-ac86-5ad0983ef252',_binary ''),('289b03fd-53d1-432d-ad18-16d809920475','958e4eec-b00e-4963-9d93-f722bc6e5595',_binary ''),('289b03fd-53d1-432d-ad18-16d809920475','bb6813d4-0ac1-43e3-ad21-a7ef3c251e0c',_binary ''),('289b03fd-53d1-432d-ad18-16d809920475','c04cbf2d-b342-4d4c-b242-ff9652bf5980',_binary '\0'),('289b03fd-53d1-432d-ad18-16d809920475','faab6469-8297-441f-9967-e779741d5079',_binary ''),('3ab1a78f-5cc4-4cf9-b523-a96f34c9565a','4d392da9-bb7f-4500-80cb-9fe7d09d7ecf',_binary '\0'),('3ab1a78f-5cc4-4cf9-b523-a96f34c9565a','770a7a4d-438a-4f5f-90eb-063215b4df81',_binary '\0'),('3ab1a78f-5cc4-4cf9-b523-a96f34c9565a','77d2cbe1-ea69-4085-81c9-e61c33a3b7c8',_binary '\0'),('3ab1a78f-5cc4-4cf9-b523-a96f34c9565a','7ae86941-ce2d-4ba0-ac86-5ad0983ef252',_binary ''),('3ab1a78f-5cc4-4cf9-b523-a96f34c9565a','958e4eec-b00e-4963-9d93-f722bc6e5595',_binary ''),('3ab1a78f-5cc4-4cf9-b523-a96f34c9565a','bb6813d4-0ac1-43e3-ad21-a7ef3c251e0c',_binary ''),('3ab1a78f-5cc4-4cf9-b523-a96f34c9565a','c04cbf2d-b342-4d4c-b242-ff9652bf5980',_binary '\0'),('3ab1a78f-5cc4-4cf9-b523-a96f34c9565a','faab6469-8297-441f-9967-e779741d5079',_binary ''),('3ee60457-8e9f-4165-89ee-781dd69c8eae','008f4ded-c329-48c2-9c92-1a03dbbf78ac',_binary '\0'),('3ee60457-8e9f-4165-89ee-781dd69c8eae','1cf9ab4e-b07c-4c1a-a7d9-305e43d25a03',_binary ''),('3ee60457-8e9f-4165-89ee-781dd69c8eae','2b87fc24-50ab-434e-b3ca-acf0c7891804',_binary ''),('3ee60457-8e9f-4165-89ee-781dd69c8eae','2ea621ac-e268-418b-a40d-813cd782ead6',_binary '\0'),('3ee60457-8e9f-4165-89ee-781dd69c8eae','397fcd6a-6c3f-4dea-96e6-6eb13c2ea790',_binary '\0'),('3ee60457-8e9f-4165-89ee-781dd69c8eae','5159dfd5-2a50-4bee-bcc7-a2b9acc7c2f8',_binary ''),('3ee60457-8e9f-4165-89ee-781dd69c8eae','8a01f0a0-74da-46b7-9183-d0d1017ccf52',_binary '\0'),('3ee60457-8e9f-4165-89ee-781dd69c8eae','d917b551-9990-4ea6-afe7-4fec8711e923',_binary ''),('4019a917-a2c0-411b-b786-1d7d39e78c0b','1f8afd59-9ffa-4983-b809-11e89bff3220',_binary '\0'),('4019a917-a2c0-411b-b786-1d7d39e78c0b','4208e432-8707-4acc-a289-74e115b35561',_binary '\0'),('4019a917-a2c0-411b-b786-1d7d39e78c0b','545c9eca-624d-4da7-b66e-e8e4c0f58178',_binary ''),('4019a917-a2c0-411b-b786-1d7d39e78c0b','64f01f75-4fbd-45d9-9fe5-f6608da26a08',_binary ''),('4019a917-a2c0-411b-b786-1d7d39e78c0b','84b7e072-0523-44e3-add4-ad5acf6b1c3a',_binary ''),('4019a917-a2c0-411b-b786-1d7d39e78c0b','c7f2d128-f598-4b0f-8325-8d344555322f',_binary '\0'),('4019a917-a2c0-411b-b786-1d7d39e78c0b','c98eb9bd-76e3-4f2e-b27c-7a0d3526fcd0',_binary ''),('4019a917-a2c0-411b-b786-1d7d39e78c0b','c9db35e1-d8cf-4de6-a005-e265abfd83af',_binary '\0'),('428caa2d-69fd-478f-90ef-acb8375b3773','008f4ded-c329-48c2-9c92-1a03dbbf78ac',_binary '\0'),('428caa2d-69fd-478f-90ef-acb8375b3773','1cf9ab4e-b07c-4c1a-a7d9-305e43d25a03',_binary ''),('428caa2d-69fd-478f-90ef-acb8375b3773','2b87fc24-50ab-434e-b3ca-acf0c7891804',_binary ''),('428caa2d-69fd-478f-90ef-acb8375b3773','2ea621ac-e268-418b-a40d-813cd782ead6',_binary '\0'),('428caa2d-69fd-478f-90ef-acb8375b3773','397fcd6a-6c3f-4dea-96e6-6eb13c2ea790',_binary '\0'),('428caa2d-69fd-478f-90ef-acb8375b3773','5159dfd5-2a50-4bee-bcc7-a2b9acc7c2f8',_binary ''),('428caa2d-69fd-478f-90ef-acb8375b3773','8a01f0a0-74da-46b7-9183-d0d1017ccf52',_binary '\0'),('428caa2d-69fd-478f-90ef-acb8375b3773','d917b551-9990-4ea6-afe7-4fec8711e923',_binary ''),('45759025-c500-44f8-9792-05e9d08b5ba0','008f4ded-c329-48c2-9c92-1a03dbbf78ac',_binary '\0'),('45759025-c500-44f8-9792-05e9d08b5ba0','1cf9ab4e-b07c-4c1a-a7d9-305e43d25a03',_binary ''),('45759025-c500-44f8-9792-05e9d08b5ba0','2b87fc24-50ab-434e-b3ca-acf0c7891804',_binary ''),('45759025-c500-44f8-9792-05e9d08b5ba0','2ea621ac-e268-418b-a40d-813cd782ead6',_binary '\0'),('45759025-c500-44f8-9792-05e9d08b5ba0','397fcd6a-6c3f-4dea-96e6-6eb13c2ea790',_binary '\0'),('45759025-c500-44f8-9792-05e9d08b5ba0','5159dfd5-2a50-4bee-bcc7-a2b9acc7c2f8',_binary ''),('45759025-c500-44f8-9792-05e9d08b5ba0','8a01f0a0-74da-46b7-9183-d0d1017ccf52',_binary '\0'),('45759025-c500-44f8-9792-05e9d08b5ba0','d917b551-9990-4ea6-afe7-4fec8711e923',_binary ''),('5a71649f-df11-4101-9a6b-ca68c5140314','1f8afd59-9ffa-4983-b809-11e89bff3220',_binary '\0'),('5a71649f-df11-4101-9a6b-ca68c5140314','4208e432-8707-4acc-a289-74e115b35561',_binary '\0'),('5a71649f-df11-4101-9a6b-ca68c5140314','545c9eca-624d-4da7-b66e-e8e4c0f58178',_binary ''),('5a71649f-df11-4101-9a6b-ca68c5140314','64f01f75-4fbd-45d9-9fe5-f6608da26a08',_binary ''),('5a71649f-df11-4101-9a6b-ca68c5140314','84b7e072-0523-44e3-add4-ad5acf6b1c3a',_binary ''),('5a71649f-df11-4101-9a6b-ca68c5140314','c7f2d128-f598-4b0f-8325-8d344555322f',_binary '\0'),('5a71649f-df11-4101-9a6b-ca68c5140314','c98eb9bd-76e3-4f2e-b27c-7a0d3526fcd0',_binary ''),('5a71649f-df11-4101-9a6b-ca68c5140314','c9db35e1-d8cf-4de6-a005-e265abfd83af',_binary '\0'),('5b5c1cc1-81f5-4f48-930d-76bd7a5153d9','1f8afd59-9ffa-4983-b809-11e89bff3220',_binary '\0'),('5b5c1cc1-81f5-4f48-930d-76bd7a5153d9','4208e432-8707-4acc-a289-74e115b35561',_binary '\0'),('5b5c1cc1-81f5-4f48-930d-76bd7a5153d9','545c9eca-624d-4da7-b66e-e8e4c0f58178',_binary ''),('5b5c1cc1-81f5-4f48-930d-76bd7a5153d9','64f01f75-4fbd-45d9-9fe5-f6608da26a08',_binary ''),('5b5c1cc1-81f5-4f48-930d-76bd7a5153d9','84b7e072-0523-44e3-add4-ad5acf6b1c3a',_binary ''),('5b5c1cc1-81f5-4f48-930d-76bd7a5153d9','c7f2d128-f598-4b0f-8325-8d344555322f',_binary '\0'),('5b5c1cc1-81f5-4f48-930d-76bd7a5153d9','c98eb9bd-76e3-4f2e-b27c-7a0d3526fcd0',_binary ''),('5b5c1cc1-81f5-4f48-930d-76bd7a5153d9','c9db35e1-d8cf-4de6-a005-e265abfd83af',_binary '\0'),('864ed488-7df6-4b5e-b02f-b329b864361d','1f8afd59-9ffa-4983-b809-11e89bff3220',_binary '\0'),('864ed488-7df6-4b5e-b02f-b329b864361d','4208e432-8707-4acc-a289-74e115b35561',_binary '\0'),('864ed488-7df6-4b5e-b02f-b329b864361d','545c9eca-624d-4da7-b66e-e8e4c0f58178',_binary ''),('864ed488-7df6-4b5e-b02f-b329b864361d','64f01f75-4fbd-45d9-9fe5-f6608da26a08',_binary ''),('864ed488-7df6-4b5e-b02f-b329b864361d','84b7e072-0523-44e3-add4-ad5acf6b1c3a',_binary ''),('864ed488-7df6-4b5e-b02f-b329b864361d','c7f2d128-f598-4b0f-8325-8d344555322f',_binary '\0'),('864ed488-7df6-4b5e-b02f-b329b864361d','c98eb9bd-76e3-4f2e-b27c-7a0d3526fcd0',_binary ''),('864ed488-7df6-4b5e-b02f-b329b864361d','c9db35e1-d8cf-4de6-a005-e265abfd83af',_binary '\0'),('8971ba95-904e-4e39-885a-4c08b51de078','4d392da9-bb7f-4500-80cb-9fe7d09d7ecf',_binary '\0'),('8971ba95-904e-4e39-885a-4c08b51de078','770a7a4d-438a-4f5f-90eb-063215b4df81',_binary '\0'),('8971ba95-904e-4e39-885a-4c08b51de078','77d2cbe1-ea69-4085-81c9-e61c33a3b7c8',_binary '\0'),('8971ba95-904e-4e39-885a-4c08b51de078','7ae86941-ce2d-4ba0-ac86-5ad0983ef252',_binary ''),('8971ba95-904e-4e39-885a-4c08b51de078','958e4eec-b00e-4963-9d93-f722bc6e5595',_binary ''),('8971ba95-904e-4e39-885a-4c08b51de078','bb6813d4-0ac1-43e3-ad21-a7ef3c251e0c',_binary ''),('8971ba95-904e-4e39-885a-4c08b51de078','c04cbf2d-b342-4d4c-b242-ff9652bf5980',_binary '\0'),('8971ba95-904e-4e39-885a-4c08b51de078','faab6469-8297-441f-9967-e779741d5079',_binary ''),('8e272df4-e68a-4c46-91e3-e3edc0bd3a5e','4d392da9-bb7f-4500-80cb-9fe7d09d7ecf',_binary '\0'),('8e272df4-e68a-4c46-91e3-e3edc0bd3a5e','770a7a4d-438a-4f5f-90eb-063215b4df81',_binary '\0'),('8e272df4-e68a-4c46-91e3-e3edc0bd3a5e','77d2cbe1-ea69-4085-81c9-e61c33a3b7c8',_binary '\0'),('8e272df4-e68a-4c46-91e3-e3edc0bd3a5e','7ae86941-ce2d-4ba0-ac86-5ad0983ef252',_binary ''),('8e272df4-e68a-4c46-91e3-e3edc0bd3a5e','958e4eec-b00e-4963-9d93-f722bc6e5595',_binary ''),('8e272df4-e68a-4c46-91e3-e3edc0bd3a5e','bb6813d4-0ac1-43e3-ad21-a7ef3c251e0c',_binary ''),('8e272df4-e68a-4c46-91e3-e3edc0bd3a5e','c04cbf2d-b342-4d4c-b242-ff9652bf5980',_binary '\0'),('8e272df4-e68a-4c46-91e3-e3edc0bd3a5e','faab6469-8297-441f-9967-e779741d5079',_binary ''),('9338200f-e9d4-4c7b-a679-d56ffed9ee8c','1f8afd59-9ffa-4983-b809-11e89bff3220',_binary '\0'),('9338200f-e9d4-4c7b-a679-d56ffed9ee8c','4208e432-8707-4acc-a289-74e115b35561',_binary '\0'),('9338200f-e9d4-4c7b-a679-d56ffed9ee8c','545c9eca-624d-4da7-b66e-e8e4c0f58178',_binary ''),('9338200f-e9d4-4c7b-a679-d56ffed9ee8c','64f01f75-4fbd-45d9-9fe5-f6608da26a08',_binary ''),('9338200f-e9d4-4c7b-a679-d56ffed9ee8c','84b7e072-0523-44e3-add4-ad5acf6b1c3a',_binary ''),('9338200f-e9d4-4c7b-a679-d56ffed9ee8c','c7f2d128-f598-4b0f-8325-8d344555322f',_binary '\0'),('9338200f-e9d4-4c7b-a679-d56ffed9ee8c','c98eb9bd-76e3-4f2e-b27c-7a0d3526fcd0',_binary ''),('9338200f-e9d4-4c7b-a679-d56ffed9ee8c','c9db35e1-d8cf-4de6-a005-e265abfd83af',_binary '\0'),('bc608c00-b971-4080-859d-536d0738f5f5','008f4ded-c329-48c2-9c92-1a03dbbf78ac',_binary '\0'),('bc608c00-b971-4080-859d-536d0738f5f5','1cf9ab4e-b07c-4c1a-a7d9-305e43d25a03',_binary ''),('bc608c00-b971-4080-859d-536d0738f5f5','2b87fc24-50ab-434e-b3ca-acf0c7891804',_binary ''),('bc608c00-b971-4080-859d-536d0738f5f5','2ea621ac-e268-418b-a40d-813cd782ead6',_binary '\0'),('bc608c00-b971-4080-859d-536d0738f5f5','397fcd6a-6c3f-4dea-96e6-6eb13c2ea790',_binary '\0'),('bc608c00-b971-4080-859d-536d0738f5f5','5159dfd5-2a50-4bee-bcc7-a2b9acc7c2f8',_binary ''),('bc608c00-b971-4080-859d-536d0738f5f5','8a01f0a0-74da-46b7-9183-d0d1017ccf52',_binary '\0'),('bc608c00-b971-4080-859d-536d0738f5f5','d917b551-9990-4ea6-afe7-4fec8711e923',_binary ''),('c80da043-8847-4537-8b85-3dd4620df8a6','008f4ded-c329-48c2-9c92-1a03dbbf78ac',_binary '\0'),('c80da043-8847-4537-8b85-3dd4620df8a6','1cf9ab4e-b07c-4c1a-a7d9-305e43d25a03',_binary ''),('c80da043-8847-4537-8b85-3dd4620df8a6','2b87fc24-50ab-434e-b3ca-acf0c7891804',_binary ''),('c80da043-8847-4537-8b85-3dd4620df8a6','2ea621ac-e268-418b-a40d-813cd782ead6',_binary '\0'),('c80da043-8847-4537-8b85-3dd4620df8a6','397fcd6a-6c3f-4dea-96e6-6eb13c2ea790',_binary '\0'),('c80da043-8847-4537-8b85-3dd4620df8a6','5159dfd5-2a50-4bee-bcc7-a2b9acc7c2f8',_binary ''),('c80da043-8847-4537-8b85-3dd4620df8a6','8a01f0a0-74da-46b7-9183-d0d1017ccf52',_binary '\0'),('c80da043-8847-4537-8b85-3dd4620df8a6','d917b551-9990-4ea6-afe7-4fec8711e923',_binary ''),('d2b83dc4-9823-4e9b-95c0-c39c8b667eb4','4d392da9-bb7f-4500-80cb-9fe7d09d7ecf',_binary '\0'),('d2b83dc4-9823-4e9b-95c0-c39c8b667eb4','770a7a4d-438a-4f5f-90eb-063215b4df81',_binary '\0'),('d2b83dc4-9823-4e9b-95c0-c39c8b667eb4','77d2cbe1-ea69-4085-81c9-e61c33a3b7c8',_binary '\0'),('d2b83dc4-9823-4e9b-95c0-c39c8b667eb4','7ae86941-ce2d-4ba0-ac86-5ad0983ef252',_binary ''),('d2b83dc4-9823-4e9b-95c0-c39c8b667eb4','958e4eec-b00e-4963-9d93-f722bc6e5595',_binary ''),('d2b83dc4-9823-4e9b-95c0-c39c8b667eb4','bb6813d4-0ac1-43e3-ad21-a7ef3c251e0c',_binary ''),('d2b83dc4-9823-4e9b-95c0-c39c8b667eb4','c04cbf2d-b342-4d4c-b242-ff9652bf5980',_binary '\0'),('d2b83dc4-9823-4e9b-95c0-c39c8b667eb4','faab6469-8297-441f-9967-e779741d5079',_binary ''),('d45b0897-a81c-4d1e-ab67-75d9452b5389','008f4ded-c329-48c2-9c92-1a03dbbf78ac',_binary '\0'),('d45b0897-a81c-4d1e-ab67-75d9452b5389','1cf9ab4e-b07c-4c1a-a7d9-305e43d25a03',_binary ''),('d45b0897-a81c-4d1e-ab67-75d9452b5389','2b87fc24-50ab-434e-b3ca-acf0c7891804',_binary ''),('d45b0897-a81c-4d1e-ab67-75d9452b5389','2ea621ac-e268-418b-a40d-813cd782ead6',_binary '\0'),('d45b0897-a81c-4d1e-ab67-75d9452b5389','397fcd6a-6c3f-4dea-96e6-6eb13c2ea790',_binary '\0'),('d45b0897-a81c-4d1e-ab67-75d9452b5389','5159dfd5-2a50-4bee-bcc7-a2b9acc7c2f8',_binary ''),('d45b0897-a81c-4d1e-ab67-75d9452b5389','8a01f0a0-74da-46b7-9183-d0d1017ccf52',_binary '\0'),('d45b0897-a81c-4d1e-ab67-75d9452b5389','d917b551-9990-4ea6-afe7-4fec8711e923',_binary ''),('ee662877-97f9-4147-9631-b92ce80cc566','1f8afd59-9ffa-4983-b809-11e89bff3220',_binary '\0'),('ee662877-97f9-4147-9631-b92ce80cc566','4208e432-8707-4acc-a289-74e115b35561',_binary '\0'),('ee662877-97f9-4147-9631-b92ce80cc566','545c9eca-624d-4da7-b66e-e8e4c0f58178',_binary ''),('ee662877-97f9-4147-9631-b92ce80cc566','64f01f75-4fbd-45d9-9fe5-f6608da26a08',_binary ''),('ee662877-97f9-4147-9631-b92ce80cc566','84b7e072-0523-44e3-add4-ad5acf6b1c3a',_binary ''),('ee662877-97f9-4147-9631-b92ce80cc566','c7f2d128-f598-4b0f-8325-8d344555322f',_binary '\0'),('ee662877-97f9-4147-9631-b92ce80cc566','c98eb9bd-76e3-4f2e-b27c-7a0d3526fcd0',_binary ''),('ee662877-97f9-4147-9631-b92ce80cc566','c9db35e1-d8cf-4de6-a005-e265abfd83af',_binary '\0');
/*!40000 ALTER TABLE `client_scope_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_scope_role_mapping`
--

DROP TABLE IF EXISTS `client_scope_role_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_scope_role_mapping` (
  `SCOPE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `ROLE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `client_scope` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_scope_role_mapping`
--

LOCK TABLES `client_scope_role_mapping` WRITE;
/*!40000 ALTER TABLE `client_scope_role_mapping` DISABLE KEYS */;
INSERT INTO `client_scope_role_mapping` VALUES ('008f4ded-c329-48c2-9c92-1a03dbbf78ac','416a77aa-0b90-46a2-9bf9-a5189758fb06'),('4208e432-8707-4acc-a289-74e115b35561','7140caa1-8028-4c06-be89-af7b6bd003e4'),('c04cbf2d-b342-4d4c-b242-ff9652bf5980','bca06f48-1ad1-444d-8ba2-a09587576a31');
/*!40000 ALTER TABLE `client_scope_role_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_session`
--

DROP TABLE IF EXISTS `client_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_session` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REDIRECT_URI` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `SESSION_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTH_METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `user_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_session`
--

LOCK TABLES `client_session` WRITE;
/*!40000 ALTER TABLE `client_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_session_auth_status`
--

DROP TABLE IF EXISTS `client_session_auth_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_session_auth_status` (
  `AUTHENTICATOR` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `STATUS` int DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_session_auth_status`
--

LOCK TABLES `client_session_auth_status` WRITE;
/*!40000 ALTER TABLE `client_session_auth_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_session_auth_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_session_note`
--

DROP TABLE IF EXISTS `client_session_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_session_note` (
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_session_note`
--

LOCK TABLES `client_session_note` WRITE;
/*!40000 ALTER TABLE `client_session_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_session_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_session_prot_mapper`
--

DROP TABLE IF EXISTS `client_session_prot_mapper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_session_prot_mapper` (
  `PROTOCOL_MAPPER_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_SESSION` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_session_prot_mapper`
--

LOCK TABLES `client_session_prot_mapper` WRITE;
/*!40000 ALTER TABLE `client_session_prot_mapper` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_session_prot_mapper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_session_role`
--

DROP TABLE IF EXISTS `client_session_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_session_role` (
  `ROLE_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_SESSION` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_session_role`
--

LOCK TABLES `client_session_role` WRITE;
/*!40000 ALTER TABLE `client_session_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_session_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_user_session_note`
--

DROP TABLE IF EXISTS `client_user_session_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_user_session_note` (
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `CLIENT_SESSION` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_user_session_note`
--

LOCK TABLES `client_user_session_note` WRITE;
/*!40000 ALTER TABLE `client_user_session_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_user_session_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `component`
--

DROP TABLE IF EXISTS `component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `component` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARENT_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROVIDER_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUB_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component`
--

LOCK TABLES `component` WRITE;
/*!40000 ALTER TABLE `component` DISABLE KEYS */;
INSERT INTO `component` VALUES ('03106c17-aaa8-4b79-aa26-ac753244f66e','Consent Required','master','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('033d7b45-cc5a-43a8-aee4-ddf288155a88',NULL,'teste','declarative-user-profile','org.keycloak.userprofile.UserProfileProvider','teste',NULL),('0af6f795-015e-4701-b6a8-370d48ccdd50','Allowed Protocol Mapper Types','ecommerce','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ecommerce','authenticated'),('0c3cb808-5fbe-465d-9876-c6e9e89375e2','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('0d36b7ee-a377-4e02-8b6a-e5cb1695c144',NULL,'ecommerce','declarative-user-profile','org.keycloak.userprofile.UserProfileProvider','ecommerce',NULL),('0f6d437e-aad3-479d-82a5-270959d6228c','Allowed Client Scopes','ecommerce','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ecommerce','authenticated'),('12cd61b4-e4d0-4fc8-a88b-16ca144e392d','Max Clients Limit','master','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('14dac11e-361e-4262-9ef7-4888c9d01a28','Full Scope Disabled','teste','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','teste','anonymous'),('1551ee4f-e3d7-4c8c-941a-504edcb32263','Trusted Hosts','ecommerce','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ecommerce','anonymous'),('2c103973-8804-4999-baea-c80cab4a4a00','rsa-enc-generated','ecommerce','rsa-enc-generated','org.keycloak.keys.KeyProvider','ecommerce',NULL),('2dff3fe4-ac63-4077-831b-7b9d1ecb094a','Allowed Client Scopes','teste','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','teste','anonymous'),('30dceb8b-1d20-4a75-bc57-90ead48cb19f',NULL,'master','declarative-user-profile','org.keycloak.userprofile.UserProfileProvider','master',NULL),('398ad085-fc6d-4138-86b6-357c1fc5754c','rsa-enc-generated','master','rsa-enc-generated','org.keycloak.keys.KeyProvider','master',NULL),('4012d29b-c27f-41eb-b9d1-0ce5bf048cb2','Trusted Hosts','teste','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','teste','anonymous'),('45e7d418-f0d9-4412-abfa-40ee44156256','Allowed Client Scopes','ecommerce','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ecommerce','anonymous'),('51c40498-0cc7-4b11-ab27-1040f9ae654a','aes-generated','master','aes-generated','org.keycloak.keys.KeyProvider','master',NULL),('524963cc-2e8a-47c1-9141-96c7780f2591','Trusted Hosts','master','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('5676d506-5601-4b94-b4a1-417e32b27574','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('58096dfa-bb75-4653-9f08-926ccc7a8fd8','rsa-generated','master','rsa-generated','org.keycloak.keys.KeyProvider','master',NULL),('7251da62-c7a2-42b4-aae9-157f5177418d','hmac-generated','teste','hmac-generated','org.keycloak.keys.KeyProvider','teste',NULL),('75a24b66-c24f-43fb-be0f-887775774bd5','rsa-generated','teste','rsa-generated','org.keycloak.keys.KeyProvider','teste',NULL),('78a84d93-f2e6-4f5b-8eb3-f936468df0c9','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('8fccf82a-2bcc-4bdc-8d0e-25943db0da49','Allowed Client Scopes','teste','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','teste','authenticated'),('94a5dd46-44d9-4b4f-bedb-6c5e52a7ef7c','Consent Required','teste','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','teste','anonymous'),('a58c8945-24e6-4549-a452-efe03a006f25','Allowed Protocol Mapper Types','teste','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','teste','anonymous'),('aeabd232-c7ea-4786-b842-3ab0e10c325f','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('b2eaa575-8271-48e7-b9f7-26507742931c','rsa-enc-generated','teste','rsa-enc-generated','org.keycloak.keys.KeyProvider','teste',NULL),('bcf9a361-a31c-4ffc-aae3-7058bdf22bea','rsa-generated','ecommerce','rsa-generated','org.keycloak.keys.KeyProvider','ecommerce',NULL),('bda31d8c-4bf2-48f4-b9a6-9263c19b930e','Allowed Protocol Mapper Types','teste','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','teste','authenticated'),('c30109b8-c92a-4e4d-a13e-c7555c6ad2be','hmac-generated','master','hmac-generated','org.keycloak.keys.KeyProvider','master',NULL),('cb33c424-4059-4f2e-834f-fe33a9c8105f','Max Clients Limit','teste','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','teste','anonymous'),('d64d1971-712a-4ac6-bd6b-e710cc4892c7','Allowed Protocol Mapper Types','ecommerce','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ecommerce','anonymous'),('d6e7a417-fec0-4db5-95a1-760d0adaa2b7','hmac-generated','ecommerce','hmac-generated','org.keycloak.keys.KeyProvider','ecommerce',NULL),('d7c67757-37b2-46fe-8ca4-5d001b433aaf','Full Scope Disabled','master','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('e9c761e4-7866-4ab6-9cc9-555f7029706f','aes-generated','teste','aes-generated','org.keycloak.keys.KeyProvider','teste',NULL),('f3cdd2bf-2237-43b5-9d88-e79fd73c2a62','aes-generated','ecommerce','aes-generated','org.keycloak.keys.KeyProvider','ecommerce',NULL),('f84ce546-d023-41fd-b122-de48a8cba603','Full Scope Disabled','ecommerce','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ecommerce','anonymous'),('f97c2bb2-91f4-45a3-a1f2-8bdc45b38963','Max Clients Limit','ecommerce','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ecommerce','anonymous'),('ff34be0a-2389-46c2-95a7-58838090429f','Consent Required','ecommerce','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ecommerce','anonymous');
/*!40000 ALTER TABLE `component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `component_config`
--

DROP TABLE IF EXISTS `component_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `component_config` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `COMPONENT_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `component` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component_config`
--

LOCK TABLES `component_config` WRITE;
/*!40000 ALTER TABLE `component_config` DISABLE KEYS */;
INSERT INTO `component_config` VALUES ('01e34031-a365-4504-9252-1216c9113bf7','2c103973-8804-4999-baea-c80cab4a4a00','privateKey','MIIEogIBAAKCAQEAiRcjrx6/Jib4B/jmt731CFntqoHcqcdI5D5OUa/d/AtPxkoIRge4ZFnyZELU1wz92x4+jHQRtPLGZPOcbr5hi4Hk+31WnCs6Du8552B+rhSev4W1kSF3ou4tmyrCiEfxbT3aXWYOPYYlVmGuMN78hDr396j9hE7n1UjkxOZtzf066pPKJcVdhn1EEGezY3wOPZwpzQBW2UXICuNkKfm53qfQAvD9mq1dcVEtGRmLXxY4NdBJwwr5MCRLdjuDJLiInMngnymhfFnJ40m4yflsstZkLSEPsTXT4tD9xBOWyeomclGDdSnQd+aJaCllyIPRFuoTbmP0BNiyGXTjI1VqNwIDAQABAoIBAANBPWOnAzrQqgrmafPq2qp8GBx4QNj3Fk/0+r8NweN+EULP9ypSfJpFWG/w9kS01kIhkbKb/t+g8/zpm8k1U/OP/fPKogfLLvGz1Fgd/mP7sVkyv4DWnpSLuyF3/m5l5uGFGm4lQilLyg8m+o/Ge5BYJhMHPB2sEe0KcgQKxIijdaAKzNl2vetZNXEPrIRsyeWohumfxa8fDnBk60QlHC6cShHsBJc+gwOoHHORBwdO+uiOeLpXzZdFqukYSvCWCNPzQObNJDmdY1SIXBjFuABfTe0w+1A1cjB1KfBYXmdDcxPq/HZ0arnIRD+rUt8W3jmVWM0uwC3ZptOBPUS4zcECgYEAwbwIupyLoFinC7qm0CTbNtP6sdQ8O61Kz3hgJYDFXYK+y7onqyWriTR8IlQvP8RkDRZoTX2qLIxmHgz9hbEC4csOq3Z3LIeLwAF09iNTPLnS81zakY6OfzH/zeSmyvu9qx5DeqOOLBRhalmd2SjD+cOJIgBIfggrNSmiDt649l8CgYEAtSaTeCFQNz3GS7RWBCIdf3uonSEgWof+ATfNAfDgEgo6gkZ39nHdQxlwVdhqMoqSNwtvq9lc3JYLeUvCQxDVqnD6PrE+yratouclmlIdLP8M7xY2nYc3t8APT98LmoIwC45JM1up7RNl20iHLsby9N2mTx81j43Q6f2iALIsKykCgYAntBh53hFDaEe7wKHlMFh4sRLElQFPHaGiSUIzDWPlWSEu8VSl3497C/WQt34DbIUwpXH0x5czkAZxjCn81x0HFy1HeHzN9G1wiRvmQbESVebklxf4EqYjbSTGlmCUYukpA4fCv3gokniwafNOiOs46ZjWDgbNRXFNcN3UfFKdswKBgD+UbInrV1YsLl7/ynjk6GmII2QS7mIX/QS8aw3VVy+9u09iIFS1Hi2gzhazQILAtBTxxJ4SSk95skk+V85mKDgMMyix2RIZD9RvQHlrfKYAVq/LohukC+BIXpdv94ihTO+hXvvRnlCBUGyohhna5gcfjHGUyJ277qlRxfxsjKgRAoGAIkhfiLC/nzcRG1ApBI4T1O8WUqapxnvTj9lrsnPhbV2BLtMjWzNW5NjUJQPQC17TogEplyMojGJzqUDSSUaeJAipR67zFvQc5qmKV/YNfyzaoDhOg9ahCXmDo5NIGbhT5ZntEvflE+rZVpbymO0AEJ7sFVRWSGJkEb4sJ36kyLs='),('0245cf97-153f-48ed-b99a-d60ec46f1ec2','c30109b8-c92a-4e4d-a13e-c7555c6ad2be','priority','100'),('04c5c69a-f83f-494b-82f1-5046f6661130','f97c2bb2-91f4-45a3-a1f2-8bdc45b38963','max-clients','200'),('0a2bb181-35db-4455-8ee4-7e771989afc8','bcf9a361-a31c-4ffc-aae3-7058bdf22bea','keyUse','SIG'),('0a32ed3a-bd43-4a5f-927a-177ad6ac3c3a','bda31d8c-4bf2-48f4-b9a6-9263c19b930e','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('0f982ac7-5358-40ac-9fde-9fb6523187e6','5676d506-5601-4b94-b4a1-417e32b27574','allow-default-scopes','true'),('1013f87f-6844-4011-b2dc-f40d933fd14c','a58c8945-24e6-4549-a452-efe03a006f25','allowed-protocol-mapper-types','oidc-full-name-mapper'),('102b120e-611a-41f3-930e-9a85452b4c32','0af6f795-015e-4701-b6a8-370d48ccdd50','allowed-protocol-mapper-types','saml-role-list-mapper'),('113ad23b-2b52-47db-bf40-7e96fd3ead30','d64d1971-712a-4ac6-bd6b-e710cc4892c7','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('1255aa8b-3419-438d-baa4-79b5f79454d3','7251da62-c7a2-42b4-aae9-157f5177418d','secret','h3rEvCVFSpOKlcUbIuVrOKnMTA_UfMGOU3mqYCFAfDpFIK-59SGVf_j22FSYdPkWr6bkDiJurdvEpmwGTSnj0g'),('1422583f-cc15-45c2-9879-78fb2b9e4e9f','b2eaa575-8271-48e7-b9f7-26507742931c','certificate','MIICmTCCAYECBgF/BBUX7TANBgkqhkiG9w0BAQsFADAQMQ4wDAYDVQQDDAV0ZXN0ZTAeFw0yMjAyMTYxOTQ3NDVaFw0zMjAyMTYxOTQ5MjVaMBAxDjAMBgNVBAMMBXRlc3RlMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAoYWAILqFQs5HBl9XsiVw5fuU6ApBgJzIA4qQ7Aa78UMyA5bq4oV0tVfpGXbJU/Qypl/vsvHk0+ezHkh4dJ9JYgOkwvMZDElU31YRZS/XgeIiVu+Zx3r6eAs1iD1aM+2dzeO4wBL8UXwO1xCx6i9o6XUYup507JMfontYYtgfn32d1jRQ1ePNnHBiHsewqaOUxDvkrHCJV9SEBva3BkxK2GIe/ErOl4EqEIEyoEI7vLz4KPaAQ3S+28HGlb9UjRKoayXbVXe3NfSeRiZ/sorY2vDv+pc1wzettZ7r6AfWa1M/sgvdmAvXS3a7rQfjr8auVAMh3CZbCOWzDi51h8809wIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQBHmUB6QYwd3YsZIxudZiQjeod7OecuOorz7N2/AgNOb0Ib6r18RlCkdvuspreUF+WtrZZ//RxvtsRfSXos5vknWq0pLgmjda9VkaCGvlIrT74quhtjYeMf77OC3gv9r44bt+oI3ZgNb8qG18Gi9oGU1c7J5RiWfFH5tIPsqqCXlSJD2rMMkjcD+JzfozQp3iKwIiYbZfFdJ/10Vac25ZGf9SQpcl8fGAKb/J0LxuWKb5UJpiRIYC5CZanzL/IjGrcq6bi0e3CEv2p2c+yRjkwp5sTspPD5oJxOJHKa50GDDzdut+2DBlXxMg9eFA0BlhPtEm5blNCRdX9rgBeXf3KP'),('1b5758e6-ca3a-4a00-aa91-5e5b37bbddf0','a58c8945-24e6-4549-a452-efe03a006f25','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('1bb2ca6e-0f04-4199-9c3e-384ec6e316dc','4012d29b-c27f-41eb-b9d1-0ce5bf048cb2','host-sending-registration-request-must-match','true'),('1f5ac344-125c-418d-bc7c-60bd74a25bc3','e9c761e4-7866-4ab6-9cc9-555f7029706f','kid','1a998abc-81cc-44d9-9fa7-6d5bfaaa1d28'),('2006bc4d-bf07-4354-b21b-8d2d3c52f3e0','b2eaa575-8271-48e7-b9f7-26507742931c','keyUse','ENC'),('214f12eb-589d-4443-90a9-1abac9fa3d43','78a84d93-f2e6-4f5b-8eb3-f936468df0c9','allowed-protocol-mapper-types','oidc-full-name-mapper'),('220fce16-8379-42b1-b3e5-d586edd6173f','78a84d93-f2e6-4f5b-8eb3-f936468df0c9','allowed-protocol-mapper-types','saml-role-list-mapper'),('242c7cc5-6571-4a12-83b8-f4a33bc6b9cb','75a24b66-c24f-43fb-be0f-887775774bd5','keyUse','SIG'),('24baf117-afa5-41c0-8e9d-43682e8845ca','bda31d8c-4bf2-48f4-b9a6-9263c19b930e','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('24fb3410-1b24-450a-a875-40fc72052849','bda31d8c-4bf2-48f4-b9a6-9263c19b930e','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('295d9f27-597c-47d3-8851-86a5959bed3e','d64d1971-712a-4ac6-bd6b-e710cc4892c7','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('2dee67b8-77b0-4c91-a73c-6fbeaa1d144a','a58c8945-24e6-4549-a452-efe03a006f25','allowed-protocol-mapper-types','oidc-address-mapper'),('33e11248-e75e-4fdf-9d82-2b5b2405206a','524963cc-2e8a-47c1-9141-96c7780f2591','client-uris-must-match','true'),('33e7aa36-08a5-496b-92f1-398c56cb6c5f','c30109b8-c92a-4e4d-a13e-c7555c6ad2be','algorithm','HS256'),('35d57bdf-1a7c-44db-ab1b-7aa26321de87','d6e7a417-fec0-4db5-95a1-760d0adaa2b7','kid','2f0f920f-12a6-40cd-9bf9-a25da014e7b6'),('37d89e9d-d2ab-459a-bd1e-c4a0bf05eb88','75a24b66-c24f-43fb-be0f-887775774bd5','certificate','MIICmTCCAYECBgF/BBUWfjANBgkqhkiG9w0BAQsFADAQMQ4wDAYDVQQDDAV0ZXN0ZTAeFw0yMjAyMTYxOTQ3NDVaFw0zMjAyMTYxOTQ5MjVaMBAxDjAMBgNVBAMMBXRlc3RlMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAk81mNweBMLts0BQttf0gTV96ovbMk50IX//T/gWAmwzqCR+rrAdOwu1tJtm03ZtDeWCVq6F5yRxxM2giPeknpUIzYTPj6OSzqeBhdVOpY6fE65e2b5N6dpJ5xmQ8vCmynH5Z7lY6f2IH1czi9O8SDy7LsmPV5Zpg3DopEd28jcF9IonnB3vaKb8h3Su5kdiKcVVWx6tj4e0glTMB0qP/OlUnszL8YK35W8MYC+jjxsUdQmQ9kfE4zNwcrE6TyOGMNdlC6FU6JZwekbXhsuKVJ4BjWjRpoP8K9UAQB5BsV6Z8Qayaw/BD06IoZF5c0aQNnhLa8NTK3wRp7pa8fgilfQIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQAFIt6e6lpcc/ZjU819Ar6aNkiXlpx90m5/fGrP+HSx7SvC1UjTVM7vNLQLfLSOJloD0gWI5iq+4Xs0C8nbKYH+Dm+fkX0Uhk24ukibqOgIKnsdQ4dPmaCnw4mkcNLPTCrGYqsfQdMj+4Z+tmgSWmyB/d8EdOMUgBbxP9jhwHo2o687E4nVWtLG1xNaG22KfUFDx1fR9rJR+LuiOa+Ve7Wue7KvcZWrSbfspXp2p6mNIvxSPF8THA8eWXiaF97tDAqwbo00CbTlLZMDcUqBigM59jsq8F4nEqiWPnbuFeTZp9N9dRUofEW6rCLvMG/MsYbfYJrpEoZmBGd15DM98rCu'),('3b68ef9b-fb8c-4563-9f1a-7522d240a6d5','e9c761e4-7866-4ab6-9cc9-555f7029706f','priority','100'),('3be3cd2b-c6e2-4fde-82dd-54873535b51e','0f6d437e-aad3-479d-82a5-270959d6228c','allow-default-scopes','true'),('3d982e72-7551-43bc-b0f3-4a24ef8498e8','aeabd232-c7ea-4786-b842-3ab0e10c325f','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('434f93b7-c570-407c-afa7-5a7b91c49013','7251da62-c7a2-42b4-aae9-157f5177418d','priority','100'),('4f2b0ca5-44a4-4d66-836c-eba55adc3d53','a58c8945-24e6-4549-a452-efe03a006f25','allowed-protocol-mapper-types','saml-role-list-mapper'),('523c4bc4-e71d-4ac0-96ba-e0cf33cef3bb','398ad085-fc6d-4138-86b6-357c1fc5754c','keyUse','ENC'),('5424f355-cae4-4164-8da1-fdcaa3f5901e','2c103973-8804-4999-baea-c80cab4a4a00','priority','100'),('5567003d-b131-493b-8652-2f3cdb4f6af1','d6e7a417-fec0-4db5-95a1-760d0adaa2b7','priority','100'),('56d19ab1-ebfb-4c98-a5fe-1d6a2456fa6d','aeabd232-c7ea-4786-b842-3ab0e10c325f','allowed-protocol-mapper-types','oidc-address-mapper'),('58ce6ac3-5610-43f5-9bf5-ed9135352883','a58c8945-24e6-4549-a452-efe03a006f25','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('597ad4f9-5e9e-4274-a712-71b3603be59e','d64d1971-712a-4ac6-bd6b-e710cc4892c7','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('5a3a240a-e58d-40c7-a888-a6395a9bfedf','51c40498-0cc7-4b11-ab27-1040f9ae654a','kid','3aa2fd5d-4110-400e-a297-708d3850aebb'),('5ae512d5-59d2-44cf-8212-680311ad98dc','0af6f795-015e-4701-b6a8-370d48ccdd50','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('5d29ca1d-3005-4aaa-957f-77ce283a1f03','12cd61b4-e4d0-4fc8-a88b-16ca144e392d','max-clients','200'),('5d44e9de-814e-4e49-9b24-4fc1b3153c19','0af6f795-015e-4701-b6a8-370d48ccdd50','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('5fefbfe5-7857-4e26-8bf5-8b6172a0d7d8','d6e7a417-fec0-4db5-95a1-760d0adaa2b7','algorithm','HS256'),('62443222-c5d2-4a5b-aee4-b6de793cdbc1','78a84d93-f2e6-4f5b-8eb3-f936468df0c9','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('6550f51b-9ac0-4ad3-8d8b-ef9c3613d13c','75a24b66-c24f-43fb-be0f-887775774bd5','privateKey','MIIEowIBAAKCAQEAk81mNweBMLts0BQttf0gTV96ovbMk50IX//T/gWAmwzqCR+rrAdOwu1tJtm03ZtDeWCVq6F5yRxxM2giPeknpUIzYTPj6OSzqeBhdVOpY6fE65e2b5N6dpJ5xmQ8vCmynH5Z7lY6f2IH1czi9O8SDy7LsmPV5Zpg3DopEd28jcF9IonnB3vaKb8h3Su5kdiKcVVWx6tj4e0glTMB0qP/OlUnszL8YK35W8MYC+jjxsUdQmQ9kfE4zNwcrE6TyOGMNdlC6FU6JZwekbXhsuKVJ4BjWjRpoP8K9UAQB5BsV6Z8Qayaw/BD06IoZF5c0aQNnhLa8NTK3wRp7pa8fgilfQIDAQABAoIBACsneqOwlkDjSGcMrTgIuyi8KvNv+dVTsUFOUdhGRQGAaMjXLWmiDJYPeqIwSIW3sqC62ZhuIj/dBRRMYEsRS1kOFjBYVUAHnomIEQyPq9KEBpP/DO5Q8h2ysMmDNNR/nD3jCmDzXksZFU6Qbuey8ePq9uCUE7zhMUy70of75PTCSvK+x9sxGxhh2ZiCYdzToRLpZJN0cUgLOvjrc/SEhhkjKJsn3IytOb+V0kDdGN3gCh1OvfkHSAmd6HEW9r0747X1hhxbGlxFoOZrFoMvawM1/ygoUlQPjn1QJL8wYu9timgFvVHQBB3tgHtdLcm3Dk98UQN+wyJMU25TWELntYECgYEAz3VikhSE6reWjWIXfeGdiCW4RPdRYGcqcCmApCS/Hbpy0qaQ6ZPI1rxw5RQKzUY9IbuLf/uQbPc0ZHLHPHiCUY/yQHk3mgsleMr9AaKtJtP/qb6xjeUSif/vzcQn/IEfHVvEq7v7+MnY724DJo5DIrJwCYjGCkb/n2Y1U8Ajxp0CgYEAtmKm1eEXXH0TgktfA8NQsnHKN0asA8RxcMbMq4Q6A6IJS1GiQFWB2MZdnPwTvWMuAuuko/UAcUaqRi9y+yjKI3ArscaixfW51S0VCqFk/US0uQsi0e+RHtB8sD6abl5sKSl3Uj1Um1ZlqqtHrVkG/HdJfuBSMu0/buuqkanktGECgYEAv9sPDYlsYqTl1lqg3wmHZiF8CEuwNjcySAgZr7NMC3IiPi1MVrcVRYF/5lpiovQSFOAcYn+DUUJMcZi0KHhKDKPSpU103kDwpoUS9jA7cW0dQx3XliICwxyt6N0/HYVMARqdBzUSEUKaHNLglwd5jtz2P9r9SwPd4svjBVDrxQECgYB202sy6YXY4jx1pTlwMC5BNFW1Ebw8cB4ghcUO8gUCHO3FPphhJdSFMSgIgUszFo0BphkMITF6m7mQJJXbAMZBtHEjT/D43JGIS+jrlh8/yyWbcZ/r+xMnalnyUbc3tRju8G8nC4I1+mIegZ0fWWNt1SHzIZ8sQtoTIENux6uTwQKBgEC5mEkx/vtj2kEu7w0uT6Tsqlo7iYtos9c2ldlP3pM8ZbK7KVTJuEZQiVwvogjqFwSaojzBD9pHRjxuIC0r/1sY4vjleIYbqU9IvgmUseWi75r0tBRJIfqvOKc20OD+aqVXC7TltPExLUfWRjlHh3kFYrsgup/MZkUyjLc+Y4Uz'),('66bf21dc-1e44-4220-a49f-e74bc0f039fd','f3cdd2bf-2237-43b5-9d88-e79fd73c2a62','kid','698130a5-2dda-4446-ad1e-fd0e3bd621c4'),('67315a75-58bf-46a0-b3ee-f3a71a747f92','45e7d418-f0d9-4412-abfa-40ee44156256','allow-default-scopes','true'),('67da7a7e-f652-4eab-b897-0d1d0a64b80a','78a84d93-f2e6-4f5b-8eb3-f936468df0c9','allowed-protocol-mapper-types','oidc-address-mapper'),('707c146a-6425-46a7-9dbf-4763d8c68899','58096dfa-bb75-4653-9f08-926ccc7a8fd8','certificate','MIICmzCCAYMCBgF+kTeoqjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjIwMTI1MTIyOTExWhcNMzIwMTI1MTIzMDUxWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCTWnBKl7pk3GhtxKNdCIdQNVAZQB/qgmI9KQ30Oxe4ip6eMfbN7n8jGwDpCdsxfi46/LBrMOuirCHkzcecHAH0Fv2pFsbyzWBoAgIhX8XxClps70BE9R0CnB9a023wRoXalOu4vIDLLaFk9dTJpKgREiDuk1j/8I9l+7fS9kgWeGHjGsMF71W9It+oZLVS/8tPfJ9G/BreYegYtwUld/If/b23slzMaU5Bsnu4Ha1o7NhWlVj+EL5eKhFyQ1H8n35FN9dIj2cvAPFo6IOwS8rHsLn3vzZUyefScLfNC+FegKPxuUpdcD2JJB1dUTePFpntmL4ovxi1eiGs//Q4PQFnAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAFHAfo72332bxqYfiYqEYKWHzQDohnzi0SimN7F/zgI0jI9O4JB/V937xY4jgUU5vEFPmZg2MLSK9xQKM+TWfZU57RGt4Df+OFxOfq8oFSc4SFnXPJFjwiU+2mjgD7rTqkyr5qOyxNr74We34scbGe2Z385EpblO4uuRltygPT0sSfyL4wJBJi8cWrCq43Tadh8yy2g8f9OzkLMk7q+rsf4VVstewHzTuwwIAcC8LeuV8e2/Diy3M7PV6y84mg3JhjwI+HOwXjtePFI6e+HzIfLCfZzrdO/JZwedE3nChWUfXKzV1s90+7eM7QAev69/+a3dYuNDtTG9dXEo5dPSM/Q='),('71fe7c09-bbcb-44f3-b76f-9ae2af3a2513','aeabd232-c7ea-4786-b842-3ab0e10c325f','allowed-protocol-mapper-types','saml-user-property-mapper'),('72a2c94e-7887-4790-8045-5207b5bae14e','bda31d8c-4bf2-48f4-b9a6-9263c19b930e','allowed-protocol-mapper-types','saml-role-list-mapper'),('72c77c91-16d3-4458-8512-4abd9322b07f','2c103973-8804-4999-baea-c80cab4a4a00','certificate','MIICoTCCAYkCBgF+kVu3IjANBgkqhkiG9w0BAQsFADAUMRIwEAYDVQQDDAllY29tbWVyY2UwHhcNMjIwMTI1MTMwODM0WhcNMzIwMTI1MTMxMDE0WjAUMRIwEAYDVQQDDAllY29tbWVyY2UwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCJFyOvHr8mJvgH+Oa3vfUIWe2qgdypx0jkPk5Rr938C0/GSghGB7hkWfJkQtTXDP3bHj6MdBG08sZk85xuvmGLgeT7fVacKzoO7znnYH6uFJ6/hbWRIXei7i2bKsKIR/FtPdpdZg49hiVWYa4w3vyEOvf3qP2ETufVSOTE5m3N/Trqk8olxV2GfUQQZ7NjfA49nCnNAFbZRcgK42Qp+bnep9AC8P2arV1xUS0ZGYtfFjg10EnDCvkwJEt2O4MkuIicyeCfKaF8WcnjSbjJ+Wyy1mQtIQ+xNdPi0P3EE5bJ6iZyUYN1KdB35oloKWXIg9EW6hNuY/QE2LIZdOMjVWo3AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAITx3yoNn7o7dMZv+4FNBYHCVo3D1VBTV2e51krclHquugmubBba6wE69eYuLMoF4STMbNzUmc0oyMERbPvDrTwSOGJbfCmzItFfNb8NxhVGlEJmeFvo1S/Mahe4G6spdnQtDWZLipksl6y7WRsuToXGBQaMGUXRVv0sOf7iXiKs9vXm/hVRJZT6kHGaFNIfHFhWf1XPN1Ts5m6RXxkq5X4WcRzLaFpUY9tqpegO6uz+1i/lBnH7Jj/RtF/hunj4FOB772+kJTtRjLP00P+xRxnW7WQUOa9QPj7xIvDqBGUWb+gaql5LNVZCXD+T6P3rumVBoP/xkp/2JkfmP8upsSo='),('75080e5f-267c-4616-bb4d-1244adb2d19c','0af6f795-015e-4701-b6a8-370d48ccdd50','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('77cf6dc6-9105-4569-87a9-bc7f454d53cf','d64d1971-712a-4ac6-bd6b-e710cc4892c7','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('790afa45-140a-4696-9657-a7be7b5380ca','f3cdd2bf-2237-43b5-9d88-e79fd73c2a62','secret','OxfFIdPX0GOPppWlra1uJA'),('7c857881-54f7-46e4-8765-4911c7a561f8','bda31d8c-4bf2-48f4-b9a6-9263c19b930e','allowed-protocol-mapper-types','oidc-address-mapper'),('7eceb800-9d2d-4960-bf09-7462e0ec296f','d6e7a417-fec0-4db5-95a1-760d0adaa2b7','secret','8WIAti0AKmCpTN4e7wrgPq9PLfyMS2pJ9vA92egYy8k1oxpyD94jco90b0wrZ7Kyi_kyz0wP4BIrK_emIg4dgg'),('7fa32580-bd8d-470c-bcd1-5ec4eb90f03d','b2eaa575-8271-48e7-b9f7-26507742931c','privateKey','MIIEpAIBAAKCAQEAoYWAILqFQs5HBl9XsiVw5fuU6ApBgJzIA4qQ7Aa78UMyA5bq4oV0tVfpGXbJU/Qypl/vsvHk0+ezHkh4dJ9JYgOkwvMZDElU31YRZS/XgeIiVu+Zx3r6eAs1iD1aM+2dzeO4wBL8UXwO1xCx6i9o6XUYup507JMfontYYtgfn32d1jRQ1ePNnHBiHsewqaOUxDvkrHCJV9SEBva3BkxK2GIe/ErOl4EqEIEyoEI7vLz4KPaAQ3S+28HGlb9UjRKoayXbVXe3NfSeRiZ/sorY2vDv+pc1wzettZ7r6AfWa1M/sgvdmAvXS3a7rQfjr8auVAMh3CZbCOWzDi51h8809wIDAQABAoIBAAlc6sN67HSl7noRFs1N3FCIl+YnigqBjBqgcqwr68MdiQ2qNu1wnQZSFUITn7INKs54KzXtTb125ewweUMRZLiYy3k9jEspCRF1NMbv0gdGa4UsmHZ2y4Qf6jd+jvcJpCcmNzRzJUs37MhMwHN50hQOZKOUweRg1umdSs9YBeVB0/HYK2ybLQkDPuq5w9PkWMDONUe7cYYXvawVnsEPVJk3tQCjHIoX53HpSIz7G00BfmVQHO7nD7lTvX/0JqHqGYCzagBYpIJpD6vxpknDHvjiz0nv1LLLTbSva/75hcCBbJjSLQAA0zOtT7baFgm88cMcRxCwRJ2szABUfGPuMOECgYEA8bWzPGUnIMd2WCSRjz9T/acvxyrlO+E/2cUCPMVUacTQ3Hng5xc9BqzGIvkMuxdWXGw5XF0YWW2bv9aLo95Yo2rLqYYpBYTD2xthQGoW9Bq303mYlTF1RT1GAMmzzcse5OUDb5UrObnvvAabEhZ+Hb/VP3ZKLaXeAPUHcZSU8LECgYEAqxIkrOIKQsDgb93/gq02rms3xpT4UO5gHqUx8dGBgTdlcagTKpqVkmMTPQ259vf2c2LPuOO7tJUzg+dR+XSF5uSphzRGnhRG7Uh3VUphHFgPDPRrRz2YDk7lcKau0j5H0oeSt9q6H8rFXzFSRqkNkXN+iKRN+NRYg3VfCDwZqicCgYEAq/xF1KuE8+X5Zy5eBDdjZBEaBfWXtsvHywRLW0JtlfTdSIPQa541ZhJ5yVi8nkM0x/6Zsgbr1HYRZKccJTWIjH7o+27isXKOidEpmdPjET4Rnv/eegn/D41Ryi27KqtlCCmMEFFruF99HaT1oiEvC6v76HQaw/BJzxSKf17hu4ECgYEAiViKu4bLqCaEyyvYPYll8olAgZ4O86M+5rvIqpaDPERGnQbNRJJR7fK/enAv0xnn82Hs1kt445Y6gvdQeFBWRTdm6JdO7xHmlBFvRbnu17vXcZY3Hz5Te4FacqRQjZnVPjD82cGxV18MMc4+eV629wVcHMaVl2adHgY44zqlfFcCgYAZzVuctbwWQ+W+irdW9SUytRVK7qr8aN0YmPj7SXfj13Sw0YjjDxQilDNZYN4H3LoLU6g2siGOH5p2PJrR0ih2P3Lm1DCdtMCOPBo7gh3Wup51vw2dDjBmC19+GZ/gN3uibT3/AF2V1lt/tEwG2Q00cGHvPt0ybBbMNOtP7hz14A=='),('81417b7e-e54b-4303-bc6c-d4be4ee923d9','d64d1971-712a-4ac6-bd6b-e710cc4892c7','allowed-protocol-mapper-types','saml-role-list-mapper'),('865466b0-922b-4dee-a019-dafc5e22d39a','58096dfa-bb75-4653-9f08-926ccc7a8fd8','priority','100'),('893be0a2-4578-45c2-a214-69aea55744f9','aeabd232-c7ea-4786-b842-3ab0e10c325f','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('8a3c6fb7-2624-4762-a77f-a86a9ee924fe','8fccf82a-2bcc-4bdc-8d0e-25943db0da49','allow-default-scopes','true'),('8a43c4db-30f8-4596-b3df-a7d306231da6','7251da62-c7a2-42b4-aae9-157f5177418d','kid','3e8c4e8e-be08-472e-bbd8-39606142ce5d'),('8e7eeeeb-bec7-4fa8-a5dc-f3d479bbe213','d64d1971-712a-4ac6-bd6b-e710cc4892c7','allowed-protocol-mapper-types','oidc-address-mapper'),('8eafff32-419e-4e01-8b82-50b5b614383b','bda31d8c-4bf2-48f4-b9a6-9263c19b930e','allowed-protocol-mapper-types','saml-user-property-mapper'),('9039bb9e-9ae6-4f1c-8459-82cf82d75a87','4012d29b-c27f-41eb-b9d1-0ce5bf048cb2','client-uris-must-match','true'),('94a1f91b-4455-4ceb-9da0-d83e054d6357','d64d1971-712a-4ac6-bd6b-e710cc4892c7','allowed-protocol-mapper-types','oidc-full-name-mapper'),('95511f41-fcc6-4193-9229-0bdabbf4e031','0af6f795-015e-4701-b6a8-370d48ccdd50','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('9880c38e-e453-4140-8c6c-ba164dea4f96','a58c8945-24e6-4549-a452-efe03a006f25','allowed-protocol-mapper-types','saml-user-property-mapper'),('98fc8445-d793-41fe-9603-ae870f706ece','2c103973-8804-4999-baea-c80cab4a4a00','algorithm','RSA-OAEP'),('994be732-695f-4949-9ed1-e48d95c94f76','75a24b66-c24f-43fb-be0f-887775774bd5','priority','100'),('99eb1639-e072-4881-b0f2-340fa44b64fe','a58c8945-24e6-4549-a452-efe03a006f25','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('9d689a91-3a53-4b91-9d21-024a4a3f1de0','78a84d93-f2e6-4f5b-8eb3-f936468df0c9','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('a417ccd0-2cd0-45c0-a900-bd1755a35860','398ad085-fc6d-4138-86b6-357c1fc5754c','priority','100'),('a4f70cb8-a889-465e-b5d0-b95b38efa848','78a84d93-f2e6-4f5b-8eb3-f936468df0c9','allowed-protocol-mapper-types','saml-user-property-mapper'),('a5897c04-50f9-4820-a4e4-f34242c82d0a','e9c761e4-7866-4ab6-9cc9-555f7029706f','secret','57-zK7xXlu2XkXXm9evDIQ'),('a799558e-286d-412f-b6a5-666092cb944d','398ad085-fc6d-4138-86b6-357c1fc5754c','privateKey','MIIEowIBAAKCAQEAhzSy2Y4djemIDdptXzuqHOFHuagrnElJzJ0yL3Uui5XrICVJmDMLv/7nde/jBcOpYzlOpDAX31VAF7/msKsBEaasSEcvqUqBgOMFcebIWGZ8q1qNzGgWhgqJIh+phP/gskJRSCu0O0kVUonYIJrier9Tly3V2GEcokfm8ugNHocBnZC+0Wf/YmKK0VSgArV5hupNF9nWBviHGhTc9VlLAPPE3oyNBFVv2Df2loaVkF41xiccd+ydG0Fl3GK+uSFNlKaWJn8PNPA33R2sU5fHqsbVkM5EM2YqR0Cr8gEicIpHFTlBXNy3IKwUnXRvt/ygMOaZj44YRRRRxvBHRWATMQIDAQABAoIBADFwV6WtjakCp7lJEY0tJ/r/dVax46B2PAIRyPQJiUeJPjy25b49jCJcdw5s9Tp6XUnm/paS72e+qH0GsrgPD4kAxSZ4wTjKAai7WpZXqRKKBzQxHICN3w6Mc7CCm14CoosMLOSS9ohnJODVfq4NdJslss8o93TzraC5Yf2YVJPAiZDWs15meyOv4Qy+lqiRd0w79YbZYn+u84pFUlzx048D2beWREvMoihmahORCdoRjlGpEUKOPhIzmK0E7I5iTmTSEl0hcoxaiRgaZPFZNhGQCPWPQqgLx01/wKMPg8pFUHxX1OPJ9PQqEEt3CSCy8pkCvnlCizPQ9/IpXGgmQrECgYEAylWIgiSosm12N2HO0cKLkHgv2mSS7u96Ltnkfvqu1PvWUc46G50KZb1PoTiOs+qZTd1Q1zpEvv3+vWxsCqJbAn97FiorYiYc9FdIv86cFrwJuux7NHQ7kyoaS/67If24u624JyZX85YYGymkaHn4nZDtMpkoxJzY6lK+rM5kx2MCgYEAqxEpvFexe2y1PPPdHGoJ3R4Tm7wMY8+7q/J+xXLogC5QVYAFOtBxj8xyoGGRLyuxlmM5dcl54fSQGRyfIZ2ETwXz6nqvCa3QmVc3yq3wX6v4g/+5JJtU/HUkg7qGfqf2u8zxmW0u/slGSPVAUYLap4X6xmxHc/qoaa9nlm6T8VsCgYAe6Qo9t5P+DjLtKwgJi4r+ux20Y4D+957W4XrC21EyQHbxcGv4I/meqVks7BMA8WoSNylOeBxggTUVgybOSRdWPltze2W9TM1Hlr4Kb2nxHzDtWYtI7CjdxqTVz0iPXM+H/HYRpQ3yrI9qNuZi/583kxhpjnRn9P4+bf2rMKy8uQKBgHCxv9Lp2mw68zKSXKmpWZInjDdeLLNcWIAwIj+lMXGwERAiZE+YnhdjUmhBnkl6+WTfPS1Ra0/ls0A30MVuZYlBnKxt4f34WaGLCaAl8mK0geVDhA6Pne8qpMF7EbtCn5KcstSmTv1eT0Uk/Bg2oiEWbFxnXLMU//mPqig59JBdAoGBAJ31tETq2GKrhCLMLhdosNCbjWCK0UQ9sEY2Bes/Xft7V7vYtiC6Z3058AfG6RC7VVrKNe41O4lbg8UK2NOBp44aO7XOBZTmQAEj1y5BAL32rrfLxfPAgA640FondrkvMv5a/gLXCebXjq7UXMlf2nla8Vh5jIO6tTJGZ3rq2Ptb'),('a82f58e0-9270-44c3-86dc-d1c4e020678e','b2eaa575-8271-48e7-b9f7-26507742931c','algorithm','RSA-OAEP'),('aac096f8-7dfd-4ea0-a3d2-b17fe3c141d9','c30109b8-c92a-4e4d-a13e-c7555c6ad2be','secret','jSiTPGgzVau89xYxbvzZgY8F3uJ-oKwI_PfLWkc3fhXFdY7ahj-6yGs1ZKxTHtWfJHDWRfEeeec-mXTG6AFrMw'),('ad37356d-2752-443a-b170-6275b42a5705','51c40498-0cc7-4b11-ab27-1040f9ae654a','secret','rtMPWjmH3RskCHBAypdT1A'),('b2d9f660-14c9-49cc-a66b-b7e22d18d673','0af6f795-015e-4701-b6a8-370d48ccdd50','allowed-protocol-mapper-types','oidc-full-name-mapper'),('b3050700-2a47-4506-8153-eb6acceaf376','2c103973-8804-4999-baea-c80cab4a4a00','keyUse','ENC'),('b49eac81-6da6-45aa-8087-740c75e043cb','398ad085-fc6d-4138-86b6-357c1fc5754c','algorithm','RSA-OAEP'),('b7e5f1dd-069a-45a3-bac3-375683e1f317','aeabd232-c7ea-4786-b842-3ab0e10c325f','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('bab2aaa6-ad5b-4014-9c52-4528ec3a4021','0af6f795-015e-4701-b6a8-370d48ccdd50','allowed-protocol-mapper-types','saml-user-property-mapper'),('bf0bcd77-6132-4dfe-9cc3-240580cb0f69','7251da62-c7a2-42b4-aae9-157f5177418d','algorithm','HS256'),('c0fe595f-076f-4b92-9d0b-c8d2b99ddaa4','51c40498-0cc7-4b11-ab27-1040f9ae654a','priority','100'),('c16245a7-a038-47d8-9040-f49809077a94','2dff3fe4-ac63-4077-831b-7b9d1ecb094a','allow-default-scopes','true'),('c3838477-6412-4337-aeda-eceb1e2c4885','398ad085-fc6d-4138-86b6-357c1fc5754c','certificate','MIICmzCCAYMCBgF+kTep8TANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjIwMTI1MTIyOTExWhcNMzIwMTI1MTIzMDUxWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCHNLLZjh2N6YgN2m1fO6oc4Ue5qCucSUnMnTIvdS6LlesgJUmYMwu//ud17+MFw6ljOU6kMBffVUAXv+awqwERpqxIRy+pSoGA4wVx5shYZnyrWo3MaBaGCokiH6mE/+CyQlFIK7Q7SRVSidggmuJ6v1OXLdXYYRyiR+by6A0ehwGdkL7RZ/9iYorRVKACtXmG6k0X2dYG+IcaFNz1WUsA88TejI0EVW/YN/aWhpWQXjXGJxx37J0bQWXcYr65IU2UppYmfw808DfdHaxTl8eqxtWQzkQzZipHQKvyASJwikcVOUFc3LcgrBSddG+3/KAw5pmPjhhFFFHG8EdFYBMxAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAHMP0d0vJcCIkLaNH9ndIqZYbupE8b8FSNYl3+P9uLaJdIvfHgUu5MiqnY0Tw6kCMPLU4OB4hALHWhJzr1Rs/haE4NAcaJwhH12IlwPTC9QB3BtBtF1wFjBr4Ge5Gnuqxn6LASSA+9uVcAc2p/0UKMhk2QCg/sArFH5OK9qyL/SonNlFVex/yaQqqI+qLemIj/ZKtHjzJ3qw5T0jsA9+wFOgRyzT74FzPhtJuWqNCAeDcMQmg6PY30zcmGlId5xwhlqjtq5YYrQNqucrDf/YsUUyXjfuutaj/OnOqvFcgxe5d+x9Ixksk/Qkn+OSR9zX76/InPNERx/NoFPi9j+Wxvc='),('c66d8894-5d28-49ca-aa17-99e8c02c16ab','bcf9a361-a31c-4ffc-aae3-7058bdf22bea','priority','100'),('c7c1bf99-2fb9-49db-9048-9e9522ca0496','b2eaa575-8271-48e7-b9f7-26507742931c','priority','100'),('cb49e49b-35e7-456d-9932-2fc5bb16c43a','bcf9a361-a31c-4ffc-aae3-7058bdf22bea','privateKey','MIIEpAIBAAKCAQEAqbc6knr0tYhqUD+qmnMs/WOZSwawItsDROs0RN3B/8WvEoXq2AgewYj+PshBEXkByPdrWRAeH7qGX4tWYU8LDBwziYiFABg2kczI5H0UID5UIeVtlAD2ROHgiA4ti9TUZVffcNOV9PuO0vjKq1XpJ2RGmhOOz2az+FnQyeoApxIAtuL8szc6+ydglD/PO7JVIjTHUrLTraG+0opLi7WGM7UJtaFjlGDpVT4xkYM3y29a0kkp3bRey5YlQjEdYYY1PUCznI022bwDMCWM0VeH5UzAsXCzbfOOZp92WmjMV670KGjfQYoeLuLL5Ax38KC9bOUI/+EWfwkMuI9WmiXK6QIDAQABAoIBAA6LFQnYX3/u4K1fx07U79YG4uv69r0F55HQVfpQxn8UgZwkvaslhv0usBrRLkJBDFYcXaaUKwCtCzbEyfIsw9WV1RTEDiGj8Yks80ohLchVjwAYmPtF2dStRoBiNqT05/6HOS6B8ye7JtINX9Cu2/v0K9ioNGSxeFqf17R1yPiH/qrDy3r+YjpDfhuYOlL5S6pF6DNCGcn5K7a9Ln/VPtEB4ZoxGrQgqcSKZMwiPk44tjmaZEZXuQBEjFPPnWMznAKFhTX540r/70FkpNniqw/+LYKmipJdnH2EWtcMTFeoUswD7sC0KX0CsfB4/oUx3MgrKTOIfyRTiE7U65MICAECgYEA1mC9xltYgPR+6shpAGehKMu9oe/4loy9cPutz+q3Nw0GUTSxL/pEIhc7vpe9+mSMOqHfHxioFCyNxQ5hFJDRYCXiH47MM0s8FuvvxabnrWhC5kmx/aHGAMGIj3nYMdBWyaObgq+mjaXS3q4Y+zBkApvE90Rw8OGyCBasd/mqsVECgYEAyqqjGq7xFkI0HNuYizfSgveUNQNxcFyQK5BwTRY/SE1OVAh5GGC0k/NtPLTkIDT4zarqgOPc6fvFbmiCq1SsHb8MigxWG2b3zB1ghlI1R8TSiWkE2paQESYlG5l+NyhRIBwy+qBXy48SKZoaMECVnqUApR6NMuM8L45R/CrkWhkCgYEArK5kb0DpO4a2LPydx9uxryDecXDRNsPLXRT93vrb9hYhvovJJjJba3J3h4DHYMhZRGlbRrsfuJBi6hY5EM3OObqKOI1X4wF5N6V5ECbve3j+Wm2GWB1VVwqNq7Sj9wwwvF9zRoOij3rBLunh6YQDKy66K8sPhpjmRSmuZz3OxuECgYBqy8aNXhivGQ3rExDsc+sblqlj0j+p7S0Pt9pl1M5eJFadU6W0YelmeYVb0xrPmfpuLp3Kc8jLCCB+0NXiwQi92BoceOm7IOR9jBF8Vr+65Q3o2Q10vpiGYOp3A8iN+lHdsN5wUaRSIT956rnYKYBujBat7E6NvU7O5JlxX4zbqQKBgQDGRCCfvrO/Zy+7lb4DbVKYOidSsNkiNNMVqqGlo3hB0BPd24yUpVMJS11mJcEJT5lz54H2VqsF5nieVhxmuNPvdPB2wIXxd2WHBzoNLdBkiO8Zd6LLVYKKO5ERhhIxRp/2puXbhu+PfGW7LYM8wlYxskw9j0/WGhgM5wwR8kN4CQ=='),('cb932c19-3ef7-4633-9d8e-14d630b3fa05','aeabd232-c7ea-4786-b842-3ab0e10c325f','allowed-protocol-mapper-types','oidc-full-name-mapper'),('cc5ebca6-856e-458a-9d54-32081f556586','524963cc-2e8a-47c1-9141-96c7780f2591','host-sending-registration-request-must-match','true'),('cd159c3a-365b-4b69-bbb9-9671b6f6fbb9','cb33c424-4059-4f2e-834f-fe33a9c8105f','max-clients','200'),('cd177b94-2fc9-4acb-bfa6-8669934f016f','1551ee4f-e3d7-4c8c-941a-504edcb32263','client-uris-must-match','true'),('cf20c1e1-b602-46cc-b87f-cd4224712f43','78a84d93-f2e6-4f5b-8eb3-f936468df0c9','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('d253fc75-9afe-4d52-b921-43e7be8f6add','aeabd232-c7ea-4786-b842-3ab0e10c325f','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('d37e05b1-4970-44c3-b693-7d58d891ea3d','1551ee4f-e3d7-4c8c-941a-504edcb32263','host-sending-registration-request-must-match','true'),('d6e9bef4-e16e-42e0-9fd8-ba9fe06bbab3','0c3cb808-5fbe-465d-9876-c6e9e89375e2','allow-default-scopes','true'),('d8eed4b0-3f83-4f2e-b9be-2901133f20b9','78a84d93-f2e6-4f5b-8eb3-f936468df0c9','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('dc487f4b-1e6d-41ac-a5ec-eb36cc4a49d6','0af6f795-015e-4701-b6a8-370d48ccdd50','allowed-protocol-mapper-types','oidc-address-mapper'),('de5fc9ca-08fc-49be-afb9-7951bd94f83f','a58c8945-24e6-4549-a452-efe03a006f25','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('e24e31a7-f969-4c53-98c2-6a9ae3eb44fa','58096dfa-bb75-4653-9f08-926ccc7a8fd8','privateKey','MIIEogIBAAKCAQEAk1pwSpe6ZNxobcSjXQiHUDVQGUAf6oJiPSkN9DsXuIqenjH2ze5/IxsA6QnbMX4uOvywazDroqwh5M3HnBwB9Bb9qRbG8s1gaAICIV/F8QpabO9ARPUdApwfWtNt8EaF2pTruLyAyy2hZPXUyaSoERIg7pNY//CPZfu30vZIFnhh4xrDBe9VvSLfqGS1Uv/LT3yfRvwa3mHoGLcFJXfyH/29t7JczGlOQbJ7uB2taOzYVpVY/hC+XioRckNR/J9+RTfXSI9nLwDxaOiDsEvKx7C59782VMnn0nC3zQvhXoCj8blKXXA9iSQdXVE3jxaZ7Zi+KL8YtXohrP/0OD0BZwIDAQABAoIBAHEhYk0iqIx/W/3KltH6lkjSZai9PsPBTsM+HeSA6flZE+bI3X/Ft/6v4McKNiuNgNjw4FGrwX2nQm50Puhv6GAKtr13K0+Gtpmj0RbmfQZOuJYiKenHdnpmevw0j5eFzYbABypSL1/OrLbitngJ3q8ciAQjRJVbj/zwgXWKeFYm9FKQUJ50G/nFwFwVadTi5XWwZy5llii/Xh8r5YYOiKuzlrgxnnZaAJuea+4ihDJchCyXF4ZRwUkm0iwd8RVesg8iwkYE7dfw5Cmmg8FKNy9H0jChvPU9ogFLwg4qTtNzbqphpRK0KytxekZGc57GJCmt217lkYwxRybUO3FxFIECgYEAxoH3h8KBTY5q/yiOWbT/llfzNTtmEYgF+PR1B8a+ws59ZTXa30A2d7zhDcEe40QoVtg+Rr+kI/YxY2NRfxggOmHlYWVZiPf9t7bJ+Ya2IEZUM6DO1DiB+fqNxkvDDDvFXPFkaSdax7yuB4bWLcUPXiQYUCWb8j9BxvXYWXJvEZECgYEAvge13go9HYBMVFSADuvm9ZHFOPa+C2GGNa/bo5xJN9BZpTul69ouxeIsv5yaM4TC7QZKg42a3STU59digNbc4mp4sY3HhgcnEEnDn3io+iH1j0WEwc7PeRz9pc72wBqPJRD6N5SrtHEzz/4+Vz2DbE5DiHcYPVkfpq/FMbCi53cCgYB1bEXvIah5Jyi1vNjPydhyp53vPC65ahwWUwyzR+Zpt9nHN987tnFBzRHXoAhUaWnvTUUxdoVy3FwErah0pOHThzs3rMsU0ZVcyhyZpQ0w9Ek0rQgL001XgNXCmehL4UNzIjvCVAxIIJ1VSHaDZpEboABd0JF5799KAP00lBONcQKBgATq7inw2eQJjfAgv6+jKzbvrsrql8BzpaV+B5EUWlC3c5pzELgpzUwRrlbHFrZ+mQzJPORqpbdTXK8jQ8lRxiWV28m8gY1WYgxp3EYkOTs/5brvcaASWgwoU+gWkwwlo86xwcfucQMaatzXF4XqcZw76kN90YLE66zEn7XJfG3BAoGAd83gY5GYYL3764fn6iLYzRsqJ6bzoweRNYmLEJOXGU2YW7kwOuIyRigdpyH9mVviGm6T6OBg99p6PseVoRPJ+pZ3rHj4L/tYnXx+bCD85op4WvRK9hgsmWuQW1+3pxNWNX7JG+l5jHXQ+WQLs+f8Kmge7ECuGGOi5Ial6UfaJCY='),('e39c85a1-278f-4a71-a082-7b8101507685','bda31d8c-4bf2-48f4-b9a6-9263c19b930e','allowed-protocol-mapper-types','oidc-full-name-mapper'),('ebed974d-db7f-4c53-8233-12226ca40775','aeabd232-c7ea-4786-b842-3ab0e10c325f','allowed-protocol-mapper-types','saml-role-list-mapper'),('ec4dbc4b-4d8e-4fd7-ac26-f430655d660c','58096dfa-bb75-4653-9f08-926ccc7a8fd8','keyUse','SIG'),('f2047619-ddfc-483b-8708-a51a254df5d8','c30109b8-c92a-4e4d-a13e-c7555c6ad2be','kid','88b5fe05-f13c-4a65-9781-d6732281353f'),('f3b9e4e1-e61d-41bd-a5ad-b973c8771194','d64d1971-712a-4ac6-bd6b-e710cc4892c7','allowed-protocol-mapper-types','saml-user-property-mapper'),('f9b33592-1dc7-45e1-9b3f-f116063d1eef','f3cdd2bf-2237-43b5-9d88-e79fd73c2a62','priority','100'),('f9c93a38-1d93-4d98-ae70-71df7c26d792','bcf9a361-a31c-4ffc-aae3-7058bdf22bea','certificate','MIICoTCCAYkCBgF+kVu2fzANBgkqhkiG9w0BAQsFADAUMRIwEAYDVQQDDAllY29tbWVyY2UwHhcNMjIwMTI1MTMwODMzWhcNMzIwMTI1MTMxMDEzWjAUMRIwEAYDVQQDDAllY29tbWVyY2UwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCptzqSevS1iGpQP6qacyz9Y5lLBrAi2wNE6zRE3cH/xa8SherYCB7BiP4+yEEReQHI92tZEB4fuoZfi1ZhTwsMHDOJiIUAGDaRzMjkfRQgPlQh5W2UAPZE4eCIDi2L1NRlV99w05X0+47S+MqrVeknZEaaE47PZrP4WdDJ6gCnEgC24vyzNzr7J2CUP887slUiNMdSstOtob7SikuLtYYztQm1oWOUYOlVPjGRgzfLb1rSSSndtF7LliVCMR1hhjU9QLOcjTbZvAMwJYzRV4flTMCxcLNt845mn3ZaaMxXrvQoaN9Bih4u4svkDHfwoL1s5Qj/4RZ/CQy4j1aaJcrpAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAEgKCkTykKLUonZ4nFsyaOHR63ITZ5VVkwiRrB+24CEOWb64s9gSmshWB+uI6/2ZSXgZCF1yFhQqUxXIkji8WcK6L0/YyDZvcXtgA+oVrItMkAlqrTfZ2m6H2m9MWDtVAexKp7DvO+V16H2DlT38VFJvcq4ZuuDKw9QSCuKjhdwa7NSSXJIOaQj5i65G5Ueu6uLE7lExe+lEimEpaR4YB+/HM0nahAcA7Vvr7LXfqF+WqUjf9pfe1q1pMEn2H8JXNnMtiRAbELV+W5M9pYCUDtBBFJ11ZESbCBfuyCno1bo1X5f+ioW9EKGicxIWrREsH3KPZBSmC7KWmGkZcmbk4+Y='),('ff09f68d-8622-4b87-9d80-1beb943f353a','bda31d8c-4bf2-48f4-b9a6-9263c19b930e','allowed-protocol-mapper-types','oidc-usermodel-property-mapper');
/*!40000 ALTER TABLE `component_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `composite_role`
--

DROP TABLE IF EXISTS `composite_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `composite_role` (
  `COMPOSITE` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `CHILD_ROLE` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `keycloak_role` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `keycloak_role` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composite_role`
--

LOCK TABLES `composite_role` WRITE;
/*!40000 ALTER TABLE `composite_role` DISABLE KEYS */;
INSERT INTO `composite_role` VALUES ('01d30d87-be33-4ecb-a2e5-d9c8dd798d25','e6845123-e97f-4efc-be37-13e8d5b711e7'),('07e59398-2ab6-4f0c-b485-8d4525dfd7e3','f81cc296-d3ee-48ee-a5fd-13f8b82eabc0'),('125c2669-ad81-4b5b-a708-00c8655a648d','1b6258a1-b3ba-464f-8899-d846c4f815e7'),('125c2669-ad81-4b5b-a708-00c8655a648d','3ad7a30d-218b-4bd0-aaea-61b64d010cc0'),('125c2669-ad81-4b5b-a708-00c8655a648d','56401ce7-4a65-4c56-bc25-3020aed825a7'),('125c2669-ad81-4b5b-a708-00c8655a648d','7140caa1-8028-4c06-be89-af7b6bd003e4'),('13b0f046-09a3-404e-bf9d-a8871f210a39','5c3c6705-4824-432e-855b-60b3f19c3287'),('13b0f046-09a3-404e-bf9d-a8871f210a39','de76d24d-be7d-49e2-8bd4-2aa906f88101'),('154cdaea-53e1-4810-836b-ef196a786bd0','15d51bf3-1525-41af-a283-5e7ba4f154c5'),('154cdaea-53e1-4810-836b-ef196a786bd0','c127891b-b4af-4647-ac20-ff92efad1226'),('2089ae83-f475-41df-a120-25d1baf194b3','6bb0dfdb-7de5-4530-9d8d-1737c9ccc0ef'),('21eda573-fe67-4135-91fc-d2d507fbfff7','6360d09a-844f-4389-a0aa-22d33d718222'),('418e8675-24f1-4b9c-b821-b67276586b31','2089ae83-f475-41df-a120-25d1baf194b3'),('418e8675-24f1-4b9c-b821-b67276586b31','416a77aa-0b90-46a2-9bf9-a5189758fb06'),('418e8675-24f1-4b9c-b821-b67276586b31','4326580b-40d8-4a4d-8bc0-7c5d6eff8a4d'),('418e8675-24f1-4b9c-b821-b67276586b31','62882b3e-2bb4-453f-a6ac-317d68492267'),('56401ce7-4a65-4c56-bc25-3020aed825a7','52a99e10-e911-4599-925a-1a178463827b'),('688fbd57-96fa-4937-82ad-e49d77cf3096','08a78aa1-2d85-4809-ace8-12197a0af4e7'),('688fbd57-96fa-4937-82ad-e49d77cf3096','e8aee63e-ea72-4a59-aa02-dd36f673a935'),('6ce5a60b-c48f-49c0-a81c-1242b5766cf9','11f7f9a6-3144-4a00-b001-3a751d0381b8'),('6ce5a60b-c48f-49c0-a81c-1242b5766cf9','534fce3c-0a0e-4f63-9682-a21fcb5be18d'),('6ce5a60b-c48f-49c0-a81c-1242b5766cf9','b5e6e2d8-9429-4c2f-8361-bc8da9ea93a0'),('6ce5a60b-c48f-49c0-a81c-1242b5766cf9','bca06f48-1ad1-444d-8ba2-a09587576a31'),('8dd914fb-b4f5-4d30-a541-04dec99cc3fd','2eaec1e7-4c8f-48ce-9607-a3edbdfc5f97'),('8dd914fb-b4f5-4d30-a541-04dec99cc3fd','78d68b35-a500-47d9-b553-6b9f9ece9425'),('9009a157-290f-4199-8845-6d8e8bff3fbf','651e47a4-ed33-4630-9495-2f9bb763709d'),('b50f6e14-09fc-45f5-9c25-b4ba64daacb9','13b0f046-09a3-404e-bf9d-a8871f210a39'),('b50f6e14-09fc-45f5-9c25-b4ba64daacb9','31a22002-3d36-4893-933f-a81392250eae'),('b50f6e14-09fc-45f5-9c25-b4ba64daacb9','47fc244d-7f31-4c0b-be1e-56d9961db482'),('b50f6e14-09fc-45f5-9c25-b4ba64daacb9','5c3c6705-4824-432e-855b-60b3f19c3287'),('b50f6e14-09fc-45f5-9c25-b4ba64daacb9','651e47a4-ed33-4630-9495-2f9bb763709d'),('b50f6e14-09fc-45f5-9c25-b4ba64daacb9','6d29adbc-b392-4619-a6a6-20399474f472'),('b50f6e14-09fc-45f5-9c25-b4ba64daacb9','6e22cab6-c8a7-49b2-8ef4-ea1711327b00'),('b50f6e14-09fc-45f5-9c25-b4ba64daacb9','772ef8e3-7209-4c77-aa7a-720a88b91377'),('b50f6e14-09fc-45f5-9c25-b4ba64daacb9','81ce5e7a-6210-449f-a65c-8c06c0b97b77'),('b50f6e14-09fc-45f5-9c25-b4ba64daacb9','9009a157-290f-4199-8845-6d8e8bff3fbf'),('b50f6e14-09fc-45f5-9c25-b4ba64daacb9','907e6b18-1464-4fc7-a4df-39496f1945e8'),('b50f6e14-09fc-45f5-9c25-b4ba64daacb9','ab279453-47f1-49a7-ac11-fa7d2390871f'),('b50f6e14-09fc-45f5-9c25-b4ba64daacb9','aceacee7-0f95-4f41-8583-e07b694fc20b'),('b50f6e14-09fc-45f5-9c25-b4ba64daacb9','ba5463ef-417b-47bd-bd68-50ba2c84f00e'),('b50f6e14-09fc-45f5-9c25-b4ba64daacb9','bb966c12-fe95-4486-8b6d-55042e615405'),('b50f6e14-09fc-45f5-9c25-b4ba64daacb9','de76d24d-be7d-49e2-8bd4-2aa906f88101'),('b50f6e14-09fc-45f5-9c25-b4ba64daacb9','e0243a26-bd23-498e-9684-63482be24245'),('b50f6e14-09fc-45f5-9c25-b4ba64daacb9','fc402014-ad6d-42cd-97fe-ea039286f24a'),('b5e6e2d8-9429-4c2f-8361-bc8da9ea93a0','76bb7e34-5334-4f20-8145-c6810fd15b49'),('d452654b-3df5-4644-a6b1-2c15787a0134','9dda3b01-0197-4216-927a-a16e51e14867'),('d4fff40b-7007-4923-8a01-6c9074ae5138','281a6125-1f38-43d1-b9c4-eee76d82ab71'),('d8522fb9-e998-46dc-9436-5389d31f6f76','a03c25cd-6231-4fce-a798-6907c2e7dab2'),('d9199d8b-858a-44a0-a746-ef870befefa8','2f950a89-6cf9-449c-b09c-7869e0d383ce'),('d9199d8b-858a-44a0-a746-ef870befefa8','dfc6f745-d727-4ff7-8ccf-07baac6d0eb1'),('e231b287-faa8-43dc-979f-cffb52477a88','154cdaea-53e1-4810-836b-ef196a786bd0'),('e231b287-faa8-43dc-979f-cffb52477a88','15d51bf3-1525-41af-a283-5e7ba4f154c5'),('e231b287-faa8-43dc-979f-cffb52477a88','177290a0-c12a-452a-9873-95795a3d3c8d'),('e231b287-faa8-43dc-979f-cffb52477a88','21446007-f2ea-4c6c-9487-3114d48f9ed8'),('e231b287-faa8-43dc-979f-cffb52477a88','23d92cec-2a70-47dd-8380-e63a53341527'),('e231b287-faa8-43dc-979f-cffb52477a88','281a6125-1f38-43d1-b9c4-eee76d82ab71'),('e231b287-faa8-43dc-979f-cffb52477a88','31dc9896-7e71-48fd-bd69-2ee5056bcbeb'),('e231b287-faa8-43dc-979f-cffb52477a88','7ffbba11-dd31-4779-bb99-2c0f666b1a8d'),('e231b287-faa8-43dc-979f-cffb52477a88','abfdd8e4-f135-4be7-9999-126bf55553be'),('e231b287-faa8-43dc-979f-cffb52477a88','c127891b-b4af-4647-ac20-ff92efad1226'),('e231b287-faa8-43dc-979f-cffb52477a88','c391ba6b-035a-4ea2-903f-f187cdc383b9'),('e231b287-faa8-43dc-979f-cffb52477a88','c6b8edb3-9df3-47a2-b133-4fca58adb56f'),('e231b287-faa8-43dc-979f-cffb52477a88','d4fff40b-7007-4923-8a01-6c9074ae5138'),('e231b287-faa8-43dc-979f-cffb52477a88','d5ee3291-0675-4320-b639-3d20f073eaa4'),('e231b287-faa8-43dc-979f-cffb52477a88','d85e3394-6093-4eda-9685-fbad11ee5efc'),('e231b287-faa8-43dc-979f-cffb52477a88','f03bef03-e051-42ab-8572-2fcf3bf6abfa'),('e231b287-faa8-43dc-979f-cffb52477a88','f7e31ac1-d1a3-4cca-a787-54410cd6d5f2'),('e231b287-faa8-43dc-979f-cffb52477a88','fbe6f4b4-ccd3-4a72-bb3c-7a0f4523194f'),('e6580f5e-0000-41a9-b481-b1b195715659','01d30d87-be33-4ecb-a2e5-d9c8dd798d25'),('e6580f5e-0000-41a9-b481-b1b195715659','0773aab9-25f2-4022-aa91-15a74fa4f074'),('e6580f5e-0000-41a9-b481-b1b195715659','08a78aa1-2d85-4809-ace8-12197a0af4e7'),('e6580f5e-0000-41a9-b481-b1b195715659','0a188c77-8790-4aee-9a70-8b2346dcefcb'),('e6580f5e-0000-41a9-b481-b1b195715659','0e5ee697-e621-4dfc-9d49-99f4c3613620'),('e6580f5e-0000-41a9-b481-b1b195715659','12f313ed-9c5f-486c-b8ff-7eba9cff79ca'),('e6580f5e-0000-41a9-b481-b1b195715659','168b9421-d70d-46ed-a360-f5e3b392c775'),('e6580f5e-0000-41a9-b481-b1b195715659','172061eb-0304-49a3-81c8-7836e7efc552'),('e6580f5e-0000-41a9-b481-b1b195715659','1949d0a4-6037-447c-90da-8b214f443439'),('e6580f5e-0000-41a9-b481-b1b195715659','1f212159-bf66-41c8-9247-f25ec787a528'),('e6580f5e-0000-41a9-b481-b1b195715659','267b6c5c-6123-407c-90e8-34f3b5c1e769'),('e6580f5e-0000-41a9-b481-b1b195715659','2eaec1e7-4c8f-48ce-9607-a3edbdfc5f97'),('e6580f5e-0000-41a9-b481-b1b195715659','2f950a89-6cf9-449c-b09c-7869e0d383ce'),('e6580f5e-0000-41a9-b481-b1b195715659','343d34c5-1ffb-47c9-95de-d496332eb4fc'),('e6580f5e-0000-41a9-b481-b1b195715659','371de157-4833-4692-92b2-24eeedf98b33'),('e6580f5e-0000-41a9-b481-b1b195715659','46625b64-2789-4089-9901-0372eda84411'),('e6580f5e-0000-41a9-b481-b1b195715659','4d502640-ac17-49bf-8433-bc4a2c1887f7'),('e6580f5e-0000-41a9-b481-b1b195715659','57b4621f-3394-4b69-961b-31e7c7cab6e2'),('e6580f5e-0000-41a9-b481-b1b195715659','5f4b0a70-b780-4231-8b2f-6487de163ba9'),('e6580f5e-0000-41a9-b481-b1b195715659','61fca772-7bf3-4acf-b38d-c2510ea31e07'),('e6580f5e-0000-41a9-b481-b1b195715659','66637a63-0619-4d8a-8ad5-5ce8b632e1a1'),('e6580f5e-0000-41a9-b481-b1b195715659','688fbd57-96fa-4937-82ad-e49d77cf3096'),('e6580f5e-0000-41a9-b481-b1b195715659','70eb9b15-d40d-4329-b3b6-2124321bdbf1'),('e6580f5e-0000-41a9-b481-b1b195715659','710f13d4-e1b5-4709-8152-497b351ea0a4'),('e6580f5e-0000-41a9-b481-b1b195715659','75a290bb-f04d-4e88-bb7a-98021c931e6c'),('e6580f5e-0000-41a9-b481-b1b195715659','7609d2c8-0152-42bd-9b0b-4a6c91cb57b8'),('e6580f5e-0000-41a9-b481-b1b195715659','78d68b35-a500-47d9-b553-6b9f9ece9425'),('e6580f5e-0000-41a9-b481-b1b195715659','8dd914fb-b4f5-4d30-a541-04dec99cc3fd'),('e6580f5e-0000-41a9-b481-b1b195715659','9dda3b01-0197-4216-927a-a16e51e14867'),('e6580f5e-0000-41a9-b481-b1b195715659','9f13245f-be8c-4fac-942e-0f665bd7362b'),('e6580f5e-0000-41a9-b481-b1b195715659','a25ed234-1f11-46ab-ba9c-61ed9866a048'),('e6580f5e-0000-41a9-b481-b1b195715659','a2977db2-d308-427e-bc3a-65613c881c30'),('e6580f5e-0000-41a9-b481-b1b195715659','a6bdeb9f-ec5e-49bc-8bad-81c07dad3450'),('e6580f5e-0000-41a9-b481-b1b195715659','abb5cb4a-0129-4d9d-a249-207f01c9b8a4'),('e6580f5e-0000-41a9-b481-b1b195715659','add40534-30c5-4018-a5b8-2c35a3bae63c'),('e6580f5e-0000-41a9-b481-b1b195715659','c0b43cdf-64c5-40c1-9b41-40c18d06db4e'),('e6580f5e-0000-41a9-b481-b1b195715659','c19c6dae-1b8b-42a8-b82b-6345686061cc'),('e6580f5e-0000-41a9-b481-b1b195715659','c4c385ec-746b-4864-b0e0-0a56eeeb306f'),('e6580f5e-0000-41a9-b481-b1b195715659','cb3959c9-ad70-4d77-830d-dc2393bcb0c2'),('e6580f5e-0000-41a9-b481-b1b195715659','ce392d05-0bb7-430c-82c3-2fcaa6480271'),('e6580f5e-0000-41a9-b481-b1b195715659','ced25b1c-5547-4603-998d-d869040e5566'),('e6580f5e-0000-41a9-b481-b1b195715659','d452654b-3df5-4644-a6b1-2c15787a0134'),('e6580f5e-0000-41a9-b481-b1b195715659','d9199d8b-858a-44a0-a746-ef870befefa8'),('e6580f5e-0000-41a9-b481-b1b195715659','d9701ffc-e844-4377-bf2d-a88152d365b3'),('e6580f5e-0000-41a9-b481-b1b195715659','dbaacdf6-5748-4a06-a69f-f135e2d79078'),('e6580f5e-0000-41a9-b481-b1b195715659','dfc6f745-d727-4ff7-8ccf-07baac6d0eb1'),('e6580f5e-0000-41a9-b481-b1b195715659','e1e58d2b-a5b0-43b2-a825-b4048f0496c7'),('e6580f5e-0000-41a9-b481-b1b195715659','e6845123-e97f-4efc-be37-13e8d5b711e7'),('e6580f5e-0000-41a9-b481-b1b195715659','e8aee63e-ea72-4a59-aa02-dd36f673a935'),('e6580f5e-0000-41a9-b481-b1b195715659','eab32d9f-1665-455a-83d8-6510166f1542'),('e6580f5e-0000-41a9-b481-b1b195715659','ed092d71-d622-4f31-8e7f-8e88eb4a6055'),('e6580f5e-0000-41a9-b481-b1b195715659','f088e439-f47c-44c8-8a30-5abcd9167ec7'),('e6580f5e-0000-41a9-b481-b1b195715659','f3becc51-ff88-4ff9-936a-87731363a11c'),('e6580f5e-0000-41a9-b481-b1b195715659','f4818633-e1b3-486e-aad0-cee4807049da'),('e6580f5e-0000-41a9-b481-b1b195715659','fb83f87d-66d2-4101-a567-8a88e172f8a3'),('e836cc08-2077-42f5-8dad-d5cd2b67e01b','e836cc08-2077-42f5-8dad-d5cd2b67e01b'),('f088e439-f47c-44c8-8a30-5abcd9167ec7','46625b64-2789-4089-9901-0372eda84411');
/*!40000 ALTER TABLE `composite_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credential`
--

DROP TABLE IF EXISTS `credential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credential` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECRET_DATA` longtext COLLATE utf8_unicode_ci,
  `CREDENTIAL_DATA` longtext COLLATE utf8_unicode_ci,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credential`
--

LOCK TABLES `credential` WRITE;
/*!40000 ALTER TABLE `credential` DISABLE KEYS */;
INSERT INTO `credential` VALUES ('0176de5e-3101-44c5-8631-5baedb6ace72',NULL,'password','a23b4e56-1762-435d-bdb5-da891d9f5913',1643138954358,NULL,'{\"value\":\"LCCrX7epMCg3aKXeHRt1oLkwyLKknGeV4Vzi5sjMF/EiYixW1gcZAIuzxxaHa+OgGojVg+ecENCu41Gz2FqwMw==\",\"salt\":\"oE3dk6tuNXRut8VhqmaWjQ==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('2df21e0a-f671-426d-a6d9-65b81b3dc8b2',NULL,'password','96c2f765-8a74-4c34-b212-82483e9a9402',1643113982959,NULL,'{\"value\":\"d2JQAkXv0demYlwGmpoPxB2D/MlcoGqy1Oa3tw87j5JaFOnHRxgO6GkLYRInr7TVjmi8auZh8HRAI8hU+UHSJw==\",\"salt\":\"MTiC1MgTUmzG/0hgoYqtUw==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('f7f0d51e-7a1e-4f12-9b83-bf13438aeb81',NULL,'password','ac984c4b-a3ee-4209-8e6e-47e1636252d2',1645041106198,NULL,'{\"value\":\"4uXsy/YxE0LEq61PkdWbd7ULVf0MTrP6wdUcPFSDiE4Dq9QR9CMzSo/OAd3FE3tXCbE9/uXIMTw9U7v3J818Xg==\",\"salt\":\"3NsqU630uVpJEvfmB8cCgQ==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('fbec731e-89f7-4373-80d2-276249f9f076',NULL,'password','9beeed86-c753-4240-bca6-55a2bed9db7f',1643120267402,NULL,'{\"value\":\"7ieAmoTg5X3SrzfSlPDtfFZWkF4Mvt1KV7bX+F7gwKOH21d6zZvSxCUbGnAU2n/rsAHi/dife1D2vh8EsL2q4A==\",\"salt\":\"YcvT7PtxOHIFGww+IIoszw==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10);
/*!40000 ALTER TABLE `credential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `databasechangelog`
--

DROP TABLE IF EXISTS `databasechangelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `databasechangelog` (
  `ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `databasechangelog`
--

LOCK TABLES `databasechangelog` WRITE;
/*!40000 ALTER TABLE `databasechangelog` DISABLE KEYS */;
INSERT INTO `databasechangelog` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2022-01-25 09:30:12',1,'EXECUTED','7:4e70412f24a3f382c82183742ec79317','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2022-01-25 09:30:12',2,'MARK_RAN','7:cb16724583e9675711801c6875114f28','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2022-01-25 09:30:12',3,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2022-01-25 09:30:12',4,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'3113809886'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2022-01-25 09:30:13',5,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2022-01-25 09:30:13',6,'MARK_RAN','7:2e01012df20974c1c2a605ef8afe25b7','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2022-01-25 09:30:15',7,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2022-01-25 09:30:15',8,'MARK_RAN','7:a77ea2ad226b345e7d689d366f185c8c','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2022-01-25 09:30:15',9,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'3113809886'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2022-01-25 09:30:16',10,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2022-01-25 09:30:16',11,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2022-01-25 09:30:16',12,'MARK_RAN','7:d909180b2530479a716d3f9c9eaea3d7','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2022-01-25 09:30:16',13,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2022-01-25 09:30:17',14,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2022-01-25 09:30:17',15,'MARK_RAN','7:980ba23cc0ec39cab731ce903dd01291','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'3113809886'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2022-01-25 09:30:17',16,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2022-01-25 09:30:17',17,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'3.5.4',NULL,NULL,'3113809886'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2022-01-25 09:30:17',18,'EXECUTED','7:91ace540896df890cc00a0490ee52bbc','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2022-01-25 09:30:18',19,'EXECUTED','7:c31d1646dfa2618a9335c00e07f89f24','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2022-01-25 09:30:18',20,'EXECUTED','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'3113809886'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2022-01-25 09:30:18',21,'MARK_RAN','7:f987971fe6b37d963bc95fee2b27f8df','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2022-01-25 09:30:18',22,'MARK_RAN','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'3113809886'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2022-01-25 09:30:18',23,'EXECUTED','7:ed2dc7f799d19ac452cbcda56c929e47','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2022-01-25 09:30:18',24,'EXECUTED','7:80b5db88a5dda36ece5f235be8757615','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'3113809886'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2022-01-25 09:30:18',25,'MARK_RAN','7:1437310ed1305a9b93f8848f301726ce','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'3113809886'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2022-01-25 09:30:19',26,'EXECUTED','7:b82ffb34850fa0836be16deefc6a87c4','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2022-01-25 09:30:19',27,'EXECUTED','7:9cc98082921330d8d9266decdd4bd658','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2022-01-25 09:30:19',28,'EXECUTED','7:03d64aeed9cb52b969bd30a7ac0db57e','update tableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'3113809886'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2022-01-25 09:30:21',29,'EXECUTED','7:f1f9fd8710399d725b780f463c6b21cd','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2022-01-25 09:30:21',30,'EXECUTED','7:53188c3eb1107546e6f765835705b6c1','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2022-01-25 09:30:22',31,'EXECUTED','7:d6e6f3bc57a0c5586737d1351725d4d4','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2022-01-25 09:30:22',32,'EXECUTED','7:454d604fbd755d9df3fd9c6329043aa5','customChange','',NULL,'3.5.4',NULL,NULL,'3113809886'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2022-01-25 09:30:23',33,'EXECUTED','7:57e98a3077e29caf562f7dbf80c72600','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'3113809886'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2022-01-25 09:30:23',34,'MARK_RAN','7:e4c7e8f2256210aee71ddc42f538b57a','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2022-01-25 09:30:24',35,'EXECUTED','7:09a43c97e49bc626460480aa1379b522','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2022-01-25 09:30:24',36,'EXECUTED','7:26bfc7c74fefa9126f2ce702fb775553','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'3113809886'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2022-01-25 09:30:24',37,'EXECUTED','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'3113809886'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2022-01-25 09:30:24',38,'EXECUTED','7:37fc1781855ac5388c494f1442b3f717','addColumn tableName=FED_USER_CONSENT','',NULL,'3.5.4',NULL,NULL,'3113809886'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2022-01-25 09:30:24',39,'EXECUTED','7:13a27db0dae6049541136adad7261d27','addColumn tableName=IDENTITY_PROVIDER','',NULL,'3.5.4',NULL,NULL,'3113809886'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2022-01-25 09:30:24',40,'MARK_RAN','7:550300617e3b59e8af3a6294df8248a3','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'3113809886'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2022-01-25 09:30:24',41,'MARK_RAN','7:e3a9482b8931481dc2772a5c07c44f17','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'3113809886'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2022-01-25 09:30:24',42,'EXECUTED','7:72b07d85a2677cb257edb02b408f332d','customChange','',NULL,'3.5.4',NULL,NULL,'3113809886'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2022-01-25 09:30:28',43,'EXECUTED','7:a72a7858967bd414835d19e04d880312','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2022-01-25 09:30:28',44,'EXECUTED','7:94edff7cf9ce179e7e85f0cd78a3cf2c','addColumn tableName=USER_ENTITY','',NULL,'3.5.4',NULL,NULL,'3113809886'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2022-01-25 09:30:28',45,'EXECUTED','7:6a48ce645a3525488a90fbf76adf3bb3','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'3113809886'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2022-01-25 09:30:28',46,'EXECUTED','7:e64b5dcea7db06077c6e57d3b9e5ca14','customChange','',NULL,'3.5.4',NULL,NULL,'3113809886'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2022-01-25 09:30:28',47,'MARK_RAN','7:fd8cf02498f8b1e72496a20afc75178c','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'3113809886'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2022-01-25 09:30:30',48,'EXECUTED','7:542794f25aa2b1fbabb7e577d6646319','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2022-01-25 09:30:30',49,'EXECUTED','7:edad604c882df12f74941dac3cc6d650','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'3113809886'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2022-01-25 09:30:33',50,'EXECUTED','7:0f88b78b7b46480eb92690cbf5e44900','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2022-01-25 09:30:33',51,'EXECUTED','7:d560e43982611d936457c327f872dd59','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2022-01-25 09:30:33',52,'EXECUTED','7:c155566c42b4d14ef07059ec3b3bbd8e','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'3113809886'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2022-01-25 09:30:33',53,'EXECUTED','7:b40376581f12d70f3c89ba8ddf5b7dea','update tableName=REALM','',NULL,'3.5.4',NULL,NULL,'3113809886'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2022-01-25 09:30:33',54,'EXECUTED','7:a1132cc395f7b95b3646146c2e38f168','update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'3113809886'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2022-01-25 09:30:33',55,'EXECUTED','7:d8dc5d89c789105cfa7ca0e82cba60af','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'3.5.4',NULL,NULL,'3113809886'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2022-01-25 09:30:33',56,'EXECUTED','7:7822e0165097182e8f653c35517656a3','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'3.5.4',NULL,NULL,'3113809886'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2022-01-25 09:30:34',57,'EXECUTED','7:c6538c29b9c9a08f9e9ea2de5c2b6375','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2022-01-25 09:30:38',58,'EXECUTED','7:6d4893e36de22369cf73bcb051ded875','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2022-01-25 09:30:39',59,'EXECUTED','7:57960fc0b0f0dd0563ea6f8b2e4a1707','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2022-01-25 09:30:40',60,'EXECUTED','7:2b4b8bff39944c7097977cc18dbceb3b','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'3113809886'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2022-01-25 09:30:40',61,'EXECUTED','7:2aa42a964c59cd5b8ca9822340ba33a8','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2022-01-25 09:30:40',62,'EXECUTED','7:9ac9e58545479929ba23f4a3087a0346','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'3.5.4',NULL,NULL,'3113809886'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2022-01-25 09:30:40',63,'EXECUTED','7:14d407c35bc4fe1976867756bcea0c36','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'3113809886'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2022-01-25 09:30:40',64,'EXECUTED','7:241a8030c748c8548e346adee548fa93','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'3113809886'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2022-01-25 09:30:40',65,'EXECUTED','7:7d3182f65a34fcc61e8d23def037dc3f','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'3.5.4',NULL,NULL,'3113809886'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2022-01-25 09:30:41',66,'EXECUTED','7:b30039e00a0b9715d430d1b0636728fa','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2022-01-25 09:30:41',67,'EXECUTED','7:3797315ca61d531780f8e6f82f258159','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'3.5.4',NULL,NULL,'3113809886'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2022-01-25 09:30:41',68,'EXECUTED','7:c7aa4c8d9573500c2d347c1941ff0301','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'3113809886'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2022-01-25 09:30:41',69,'EXECUTED','7:b207faee394fc074a442ecd42185a5dd','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2022-01-25 09:30:41',70,'EXECUTED','7:ab9a9762faaba4ddfa35514b212c4922','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'3113809886'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2022-01-25 09:30:41',71,'EXECUTED','7:b9710f74515a6ccb51b72dc0d19df8c4','addColumn tableName=RESOURCE_SERVER','',NULL,'3.5.4',NULL,NULL,'3113809886'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-01-25 09:30:41',72,'EXECUTED','7:ec9707ae4d4f0b7452fee20128083879','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'3113809886'),('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-01-25 09:30:41',73,'EXECUTED','7:3979a0ae07ac465e920ca696532fc736','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'3113809886'),('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-01-25 09:30:42',74,'MARK_RAN','7:5abfde4c259119d143bd2fbf49ac2bca','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'3113809886'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-01-25 09:30:43',75,'EXECUTED','7:b48da8c11a3d83ddd6b7d0c8c2219345','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-01-25 09:30:43',76,'EXECUTED','7:a73379915c23bfad3e8f5c6d5c0aa4bd','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'3.5.4',NULL,NULL,'3113809886'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2022-01-25 09:30:43',77,'EXECUTED','7:39e0073779aba192646291aa2332493d','addColumn tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'3113809886'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2022-01-25 09:30:43',78,'MARK_RAN','7:81f87368f00450799b4bf42ea0b3ec34','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2022-01-25 09:30:45',79,'EXECUTED','7:20b37422abb9fb6571c618148f013a15','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2022-01-25 09:30:45',80,'MARK_RAN','7:1970bb6cfb5ee800736b95ad3fb3c78a','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2022-01-25 09:30:45',81,'EXECUTED','7:45d9b25fc3b455d522d8dcc10a0f4c80','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'3113809886'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2022-01-25 09:30:45',82,'MARK_RAN','7:890ae73712bc187a66c2813a724d037f','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'3113809886'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2022-01-25 09:30:45',83,'EXECUTED','7:0a211980d27fafe3ff50d19a3a29b538','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'3113809886'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2022-01-25 09:30:45',84,'MARK_RAN','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'3113809886'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2022-01-25 09:30:45',85,'EXECUTED','7:01c49302201bdf815b0a18d1f98a55dc','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'3113809886'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2022-01-25 09:30:45',86,'EXECUTED','7:3dace6b144c11f53f1ad2c0361279b86','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'3.5.4',NULL,NULL,'3113809886'),('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2022-01-25 09:30:45',87,'EXECUTED','7:578d0b92077eaf2ab95ad0ec087aa903','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2022-01-25 09:30:45',88,'EXECUTED','7:c95abe90d962c57a09ecaee57972835d','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'3.5.4',NULL,NULL,'3113809886'),('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-01-25 09:30:45',89,'EXECUTED','7:f1313bcc2994a5c4dc1062ed6d8282d3','addColumn tableName=REALM; customChange','',NULL,'3.5.4',NULL,NULL,'3113809886'),('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-01-25 09:30:45',90,'EXECUTED','7:90d763b52eaffebefbcbde55f269508b','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'3.5.4',NULL,NULL,'3113809886'),('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-01-25 09:30:45',91,'EXECUTED','7:d554f0cb92b764470dccfa5e0014a7dd','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'3113809886'),('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-01-25 09:30:46',92,'EXECUTED','7:73193e3ab3c35cf0f37ccea3bf783764','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-01-25 09:30:46',93,'MARK_RAN','7:90a1e74f92e9cbaa0c5eab80b8a037f3','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'3113809886'),('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-01-25 09:30:46',94,'EXECUTED','7:5b9248f29cd047c200083cc6d8388b16','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'3113809886'),('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-01-25 09:30:46',95,'MARK_RAN','7:64db59e44c374f13955489e8990d17a1','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'3.5.4',NULL,NULL,'3113809886'),('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-01-25 09:30:46',96,'EXECUTED','7:329a578cdb43262fff975f0a7f6cda60','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'3113809886'),('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-01-25 09:30:46',97,'EXECUTED','7:fae0de241ac0fd0bbc2b380b85e4f567','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'3113809886'),('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-01-25 09:30:46',98,'MARK_RAN','7:075d54e9180f49bb0c64ca4218936e81','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'3113809886'),('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-01-25 09:30:46',99,'MARK_RAN','7:06499836520f4f6b3d05e35a59324910','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'3113809886'),('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-01-25 09:30:46',100,'EXECUTED','7:b558ad47ea0e4d3c3514225a49cc0d65','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'3113809886'),('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-01-25 09:30:46',101,'MARK_RAN','7:3d2b23076e59c6f70bae703aa01be35b','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'3113809886'),('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-01-25 09:30:46',102,'EXECUTED','7:1a7f28ff8d9e53aeb879d76ea3d9341a','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'3113809886'),('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-01-25 09:30:46',103,'EXECUTED','7:2fd554456fed4a82c698c555c5b751b6','customChange','',NULL,'3.5.4',NULL,NULL,'3113809886'),('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2022-01-25 09:30:47',104,'EXECUTED','7:b06356d66c2790ecc2ae54ba0458397a','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'3.5.4',NULL,NULL,'3113809886');
/*!40000 ALTER TABLE `databasechangelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `databasechangeloglock`
--

DROP TABLE IF EXISTS `databasechangeloglock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `databasechangeloglock` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `databasechangeloglock`
--

LOCK TABLES `databasechangeloglock` WRITE;
/*!40000 ALTER TABLE `databasechangeloglock` DISABLE KEYS */;
INSERT INTO `databasechangeloglock` VALUES (1,_binary '\0',NULL,NULL),(1000,_binary '\0',NULL,NULL),(1001,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `databasechangeloglock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_client_scope`
--

DROP TABLE IF EXISTS `default_client_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `default_client_scope` (
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_client_scope`
--

LOCK TABLES `default_client_scope` WRITE;
/*!40000 ALTER TABLE `default_client_scope` DISABLE KEYS */;
INSERT INTO `default_client_scope` VALUES ('ecommerce','0db8d451-717f-425a-bdd7-9123bf1b7c8b',_binary ''),('ecommerce','4d392da9-bb7f-4500-80cb-9fe7d09d7ecf',_binary '\0'),('ecommerce','770a7a4d-438a-4f5f-90eb-063215b4df81',_binary '\0'),('ecommerce','77d2cbe1-ea69-4085-81c9-e61c33a3b7c8',_binary '\0'),('ecommerce','7ae86941-ce2d-4ba0-ac86-5ad0983ef252',_binary ''),('ecommerce','958e4eec-b00e-4963-9d93-f722bc6e5595',_binary ''),('ecommerce','bb6813d4-0ac1-43e3-ad21-a7ef3c251e0c',_binary ''),('ecommerce','c04cbf2d-b342-4d4c-b242-ff9652bf5980',_binary '\0'),('ecommerce','faab6469-8297-441f-9967-e779741d5079',_binary ''),('master','1f8afd59-9ffa-4983-b809-11e89bff3220',_binary '\0'),('master','4208e432-8707-4acc-a289-74e115b35561',_binary '\0'),('master','545c9eca-624d-4da7-b66e-e8e4c0f58178',_binary ''),('master','64f01f75-4fbd-45d9-9fe5-f6608da26a08',_binary ''),('master','84b7e072-0523-44e3-add4-ad5acf6b1c3a',_binary ''),('master','a60a01d1-4b76-4d12-915e-9e2fdeb55e09',_binary ''),('master','c7f2d128-f598-4b0f-8325-8d344555322f',_binary '\0'),('master','c98eb9bd-76e3-4f2e-b27c-7a0d3526fcd0',_binary ''),('master','c9db35e1-d8cf-4de6-a005-e265abfd83af',_binary '\0'),('teste','008f4ded-c329-48c2-9c92-1a03dbbf78ac',_binary '\0'),('teste','1cf9ab4e-b07c-4c1a-a7d9-305e43d25a03',_binary ''),('teste','2b87fc24-50ab-434e-b3ca-acf0c7891804',_binary ''),('teste','2ea621ac-e268-418b-a40d-813cd782ead6',_binary '\0'),('teste','397fcd6a-6c3f-4dea-96e6-6eb13c2ea790',_binary '\0'),('teste','5159dfd5-2a50-4bee-bcc7-a2b9acc7c2f8',_binary ''),('teste','8a01f0a0-74da-46b7-9183-d0d1017ccf52',_binary '\0'),('teste','d42e4740-91f0-441f-b70c-3adb96dfa6de',_binary ''),('teste','d917b551-9990-4ea6-afe7-4fec8711e923',_binary '');
/*!40000 ALTER TABLE `default_client_scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_entity`
--

DROP TABLE IF EXISTS `event_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_entity` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAILS_JSON` text COLLATE utf8_unicode_ci,
  `ERROR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IP_ADDRESS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SESSION_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EVENT_TIME` bigint DEFAULT NULL,
  `TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_entity`
--

LOCK TABLES `event_entity` WRITE;
/*!40000 ALTER TABLE `event_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fed_user_attribute`
--

DROP TABLE IF EXISTS `fed_user_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fed_user_attribute` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fed_user_attribute`
--

LOCK TABLES `fed_user_attribute` WRITE;
/*!40000 ALTER TABLE `fed_user_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `fed_user_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fed_user_consent`
--

DROP TABLE IF EXISTS `fed_user_consent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fed_user_consent` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fed_user_consent`
--

LOCK TABLES `fed_user_consent` WRITE;
/*!40000 ALTER TABLE `fed_user_consent` DISABLE KEYS */;
/*!40000 ALTER TABLE `fed_user_consent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fed_user_consent_cl_scope`
--

DROP TABLE IF EXISTS `fed_user_consent_cl_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fed_user_consent_cl_scope` (
  `USER_CONSENT_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fed_user_consent_cl_scope`
--

LOCK TABLES `fed_user_consent_cl_scope` WRITE;
/*!40000 ALTER TABLE `fed_user_consent_cl_scope` DISABLE KEYS */;
/*!40000 ALTER TABLE `fed_user_consent_cl_scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fed_user_credential`
--

DROP TABLE IF EXISTS `fed_user_credential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fed_user_credential` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECRET_DATA` longtext COLLATE utf8_unicode_ci,
  `CREDENTIAL_DATA` longtext COLLATE utf8_unicode_ci,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fed_user_credential`
--

LOCK TABLES `fed_user_credential` WRITE;
/*!40000 ALTER TABLE `fed_user_credential` DISABLE KEYS */;
/*!40000 ALTER TABLE `fed_user_credential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fed_user_group_membership`
--

DROP TABLE IF EXISTS `fed_user_group_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fed_user_group_membership` (
  `GROUP_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fed_user_group_membership`
--

LOCK TABLES `fed_user_group_membership` WRITE;
/*!40000 ALTER TABLE `fed_user_group_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `fed_user_group_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fed_user_required_action`
--

DROP TABLE IF EXISTS `fed_user_required_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fed_user_required_action` (
  `REQUIRED_ACTION` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fed_user_required_action`
--

LOCK TABLES `fed_user_required_action` WRITE;
/*!40000 ALTER TABLE `fed_user_required_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `fed_user_required_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fed_user_role_mapping`
--

DROP TABLE IF EXISTS `fed_user_role_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fed_user_role_mapping` (
  `ROLE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fed_user_role_mapping`
--

LOCK TABLES `fed_user_role_mapping` WRITE;
/*!40000 ALTER TABLE `fed_user_role_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `fed_user_role_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `federated_identity`
--

DROP TABLE IF EXISTS `federated_identity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `federated_identity` (
  `IDENTITY_PROVIDER` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TOKEN` text COLLATE utf8_unicode_ci,
  `USER_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `federated_identity`
--

LOCK TABLES `federated_identity` WRITE;
/*!40000 ALTER TABLE `federated_identity` DISABLE KEYS */;
INSERT INTO `federated_identity` VALUES ('facebook','ecommerce','4782799675139750','eltilopes@gmail.com','{\"access_token\":\"EABDG0v9pD7wBAPqbwbKtJtvAboZAcWnEYtsKnnFrqAIPaqqwa86GpE1mYKXl2QZA3X9XgK7Cp4mIo5VV63A1d09nUrb3pfTBmKgNpDu3EAAJKuIVqVyuXTSmeqANwT8kvP3TzoL7pmJLZCKrfrOUGBBzcXbJcgOKljKccTN7As4v9ZBun9iOUV5cAIvu53leF2eAYT20yCScG9CZCLy5qrjEm408XJgyUMPvVEotZAtwZDZD\",\"token_type\":\"bearer\",\"expires_in\":5183999}','9beeed86-c753-4240-bca6-55a2bed9db7f'),('google','ecommerce','111465855209832202330','eltonlopesempresa@gmail.com','{\"access_token\":\"ya29.A0ARrdaM9ZcDvGPBI9ABlfgk6YW1Y-TtpGJBjBy5BcI5RhHUS8PNZHYxOhTQ121qwuL2h7sMT-xWY7UmQda6geMvA6X_A-EwBjvpfdctFb6ePyEHsD0-uPTORiFHI3pcqF4m4yyxN9wtEpPAKfiHlblZ5oRkua\",\"expires_in\":3599,\"refresh_expires_in\":0,\"token_type\":\"Bearer\",\"id_token\":\"eyJhbGciOiJSUzI1NiIsImtpZCI6IjE4MmU0NTBhMzVhMjA4MWZhYTFkOWFlMWQyZDc1YTBmMjNkOTFkZjgiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiI5OTUxMTIxMzQ2NTEtaDgycHFnc2VyNTNxdXA3bWE1NGU0Nm1uN2djYm9sajcuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiI5OTUxMTIxMzQ2NTEtaDgycHFnc2VyNTNxdXA3bWE1NGU0Nm1uN2djYm9sajcuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMTE0NjU4NTUyMDk4MzIyMDIzMzAiLCJlbWFpbCI6ImVsdG9ubG9wZXNlbXByZXNhQGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJhdF9oYXNoIjoiNldMSG54empjWjZ0SzZZZ2ZGZ0pmdyIsIm5vbmNlIjoiSVgzMXI5RFFkQmQzeV8tZFpINS04dyIsIm5hbWUiOiJlbHRvbiBsb3BlcyIsInBpY3R1cmUiOiJodHRwczovL2xoMy5nb29nbGV1c2VyY29udGVudC5jb20vYS9BQVRYQUp5UldRVXlhX2tXT2Z0cnZYdllpa1FFbDRwOXo3TmEzbEdZR2ZaYz1zOTYtYyIsImdpdmVuX25hbWUiOiJlbHRvbiIsImZhbWlseV9uYW1lIjoibG9wZXMiLCJsb2NhbGUiOiJwdC1CUiIsImlhdCI6MTY0NDM0MDE2MCwiZXhwIjoxNjQ0MzQzNzYwfQ.YgaLTQR0fLVQV-TopV7hZzCDuhKC4dhmiwm-jpJx1YWwf1Pypnmn6HJMJJ7Y_s4m041fTbplKsYi1u07uIcGlXdoudwLQhJslxZ2opBdHrD-h0qocOnZ85z5Iq6JB7WvV1A9KNqN-wilb9gCHvWhm9IriEb9Dqdn8FY56Zg2F5rKO0nacMFpyN27kigpNhuWMTIQoArzJZKGbTT2_bSii0rAUSPOHKAPPsAZ1-5agxepvY1amthfX_3pF9N1AdpjMN5k3kuvaOGKgQySOdqITYVP6JT9COiL8TttVPY0yPiV5O_0QfLvO3AEN6FYrATTCgb5hNZeMxZqC-ErTJbZMQ\",\"not-before-policy\":0,\"scope\":\"openid https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email\",\"accessTokenExpiration\":1644343758}','02e8ea00-9a18-478c-9d2b-48e84a353866'),('google','ecommerce','101885015790496464132','eltilopes@gmail.com','{\"access_token\":\"ya29.A0ARrdaM-Id1dA4mz05vP8lQ7dNhWBmI5ZJyHObaiW3xpNF1Tnavih0i1Ym_mKbMwD0xXQCRD_NTy6Z3kjiBzhPQjoWIIAz4dkFJP7nFJZ-QmbNAF9484tjvnxXDjMWqhq8eebguwyk5vq_FLfVbUok8m4RHxZ\",\"expires_in\":3599,\"refresh_expires_in\":0,\"token_type\":\"Bearer\",\"id_token\":\"eyJhbGciOiJSUzI1NiIsImtpZCI6ImZjYmQ3ZjQ4MWE4MjVkMTEzZTBkMDNkZDk0ZTYwYjY5ZmYxNjY1YTIiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiI5OTUxMTIxMzQ2NTEtaDgycHFnc2VyNTNxdXA3bWE1NGU0Nm1uN2djYm9sajcuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiI5OTUxMTIxMzQ2NTEtaDgycHFnc2VyNTNxdXA3bWE1NGU0Nm1uN2djYm9sajcuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMDE4ODUwMTU3OTA0OTY0NjQxMzIiLCJlbWFpbCI6ImVsdGlsb3Blc0BnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiYXRfaGFzaCI6Im5sM0MySWF6bmgyakg2WFFtRDVlUmciLCJub25jZSI6IjZSSF9IemZZcUdiVGxDMklHcnEzcnciLCJuYW1lIjoiRWx0b24gTG9wZXMiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EtL0FPaDE0R2pOM0V1U3dQMTZVLW12RVd3TGY0TUxmSk1CLVp0N3VSM0hMWlZTSGc9czk2LWMiLCJnaXZlbl9uYW1lIjoiRWx0b24iLCJmYW1pbHlfbmFtZSI6IkxvcGVzIiwibG9jYWxlIjoicHQtQlIiLCJpYXQiOjE2NTIyODIxNjMsImV4cCI6MTY1MjI4NTc2M30.Wzr88iInGoWec3gYOI1_CbphkgeLJhend7FTl7eNH6S1z-_7zdJziMsTGSLuivLRqpf9fj9eZ5KXTQ26iqBa92ZjlXpz9AA41O7jENwKH5i_AV4G1PpYtBUx06kwkIKkkmbhQba1i5tqWylZSjL5txnE144qGGdruah6SbhzLGY8zIJmsVRF3ElHA4IB_zRY33L7t2TrQbTxXzSFLy_SnZrKRRH5d5ckyCaQKpC2FVJoUd7F0X8axMx_42OfVzmsLo1o6NP7j6Lpmsk9ezJM6JwQpSXhZ1meprx1Wx5ico85Ld3vPHZDXo7aEIyMv6k0f5U_ZyV2Xx6ZgIbkOr2GmA\",\"not-before-policy\":0,\"scope\":\"openid https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email\",\"accessTokenExpiration\":1652285762}','9beeed86-c753-4240-bca6-55a2bed9db7f'),('google','ecommerce','113713628246715529268','eltonlopesdeveloper@gmail.com','{\"access_token\":\"ya29.A0ARrdaM951noC6GNdwJOiwC1BD6nivNog8GumAT38_BdlL5rZajOgh8xvQMyH14XbcUCRmkRBLkPT02bj9B8HeX7KKCZRT9ENvHUD-s-nr1m-bfmFn7cbVRQ36JuOH3tJScncJroZCmKeM9eyiENSNOflpYVQ\",\"expires_in\":3599,\"refresh_expires_in\":0,\"token_type\":\"Bearer\",\"id_token\":\"eyJhbGciOiJSUzI1NiIsImtpZCI6IjE4MmU0NTBhMzVhMjA4MWZhYTFkOWFlMWQyZDc1YTBmMjNkOTFkZjgiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiI5OTUxMTIxMzQ2NTEtaDgycHFnc2VyNTNxdXA3bWE1NGU0Nm1uN2djYm9sajcuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiI5OTUxMTIxMzQ2NTEtaDgycHFnc2VyNTNxdXA3bWE1NGU0Nm1uN2djYm9sajcuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMTM3MTM2MjgyNDY3MTU1MjkyNjgiLCJlbWFpbCI6ImVsdG9ubG9wZXNkZXZlbG9wZXJAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImF0X2hhc2giOiJDTW1rM2Y2N0tDeXpnYUZZUWFaR1Z3Iiwibm9uY2UiOiJXTVR6RElWeG1QZ0FuaDlxTGNlV0tnIiwibmFtZSI6IkVsdG9uIERldmVsb3BlciIsInBpY3R1cmUiOiJodHRwczovL2xoMy5nb29nbGV1c2VyY29udGVudC5jb20vYS9BQVRYQUp5M01oQXZFVVhacXJxSy0zRXgxTC1Ec1VaTkRNS1ZoN2JhUjJUbz1zOTYtYyIsImdpdmVuX25hbWUiOiJFbHRvbiIsImZhbWlseV9uYW1lIjoiRGV2ZWxvcGVyIiwibG9jYWxlIjoicHQtQlIiLCJpYXQiOjE2NDM5MTA1NjEsImV4cCI6MTY0MzkxNDE2MX0.OPXNQINnOH1Po-i4v7HPBw8QWK4MqDfDv82uFxIFuw1v2yvVMrplZoiNbfHVRc6PcPj4bTc9RqJFfzrAoCnwO__PxZXOJCVyHaOEvSwP6QS36hi70kSbz90KzNaWykNoz_PlVPj3Bqrw2z-mc0fw16YE769Ty78vuYTeh_vEuRFR37ileUxqvkUwWMSND-6_Jz7aZs7etZv_1LpSp5V4hoOmJ5NHiDgYeUj5cJqslalNE_QzDjIY1kodvJEOkYSX_eyOQjyoH0mlxQ1fDvrwicqt3M90EAG7gcRrMLbfAkKW_80VTVj5gGEBxDscp21xO-NZqJKEfdfNpfewU_BbCg\",\"not-before-policy\":0,\"scope\":\"https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email openid\",\"accessTokenExpiration\":1643914160}','e65af92c-fd75-4776-be5c-abad5339accb');
/*!40000 ALTER TABLE `federated_identity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `federated_user`
--

DROP TABLE IF EXISTS `federated_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `federated_user` (
  `ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `federated_user`
--

LOCK TABLES `federated_user` WRITE;
/*!40000 ALTER TABLE `federated_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `federated_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_attribute`
--

DROP TABLE IF EXISTS `group_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_attribute` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `GROUP_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `keycloak_group` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_attribute`
--

LOCK TABLES `group_attribute` WRITE;
/*!40000 ALTER TABLE `group_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_role_mapping`
--

DROP TABLE IF EXISTS `group_role_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_role_mapping` (
  `ROLE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `keycloak_group` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_role_mapping`
--

LOCK TABLES `group_role_mapping` WRITE;
/*!40000 ALTER TABLE `group_role_mapping` DISABLE KEYS */;
INSERT INTO `group_role_mapping` VALUES ('e836cc08-2077-42f5-8dad-d5cd2b67e01b','a49f0ad0-ceac-4d00-a90b-1f913c2a0fac');
/*!40000 ALTER TABLE `group_role_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identity_provider`
--

DROP TABLE IF EXISTS `identity_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identity_provider` (
  `INTERNAL_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROVIDER_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identity_provider`
--

LOCK TABLES `identity_provider` WRITE;
/*!40000 ALTER TABLE `identity_provider` DISABLE KEYS */;
INSERT INTO `identity_provider` VALUES ('9f2341ec-f01d-4de1-a27b-52c5368bb40b',_binary '','facebook','facebook',_binary '',_binary '\0','ecommerce',_binary '',_binary '\0','e3d735ab-f562-4b75-a87c-b4b328ad24ca',NULL,NULL,_binary '\0'),('d8871cf7-b4c5-4d34-9c42-36e963382003',_binary '','google','google',_binary '',_binary '\0','ecommerce',_binary '',_binary '\0','e3d735ab-f562-4b75-a87c-b4b328ad24ca',NULL,NULL,_binary '\0');
/*!40000 ALTER TABLE `identity_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identity_provider_config`
--

DROP TABLE IF EXISTS `identity_provider_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identity_provider_config` (
  `IDENTITY_PROVIDER_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` longtext COLLATE utf8_unicode_ci,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `identity_provider` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identity_provider_config`
--

LOCK TABLES `identity_provider_config` WRITE;
/*!40000 ALTER TABLE `identity_provider_config` DISABLE KEYS */;
INSERT INTO `identity_provider_config` VALUES ('9f2341ec-f01d-4de1-a27b-52c5368bb40b','4722209157877692','clientId'),('9f2341ec-f01d-4de1-a27b-52c5368bb40b','f41dd10f25611be9beb0cf866a11a2c5','clientSecret'),('9f2341ec-f01d-4de1-a27b-52c5368bb40b','IMPORT','syncMode'),('9f2341ec-f01d-4de1-a27b-52c5368bb40b','true','useJwksUrl'),('d8871cf7-b4c5-4d34-9c42-36e963382003','995112134651-h82pqgser53qup7ma54e46mn7gcbolj7.apps.googleusercontent.com','clientId'),('d8871cf7-b4c5-4d34-9c42-36e963382003','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','clientSecret'),('d8871cf7-b4c5-4d34-9c42-36e963382003','IMPORT','syncMode'),('d8871cf7-b4c5-4d34-9c42-36e963382003','true','useJwksUrl'),('d8871cf7-b4c5-4d34-9c42-36e963382003','false','userIp');
/*!40000 ALTER TABLE `identity_provider_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identity_provider_mapper`
--

DROP TABLE IF EXISTS `identity_provider_mapper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identity_provider_mapper` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `IDP_ALIAS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identity_provider_mapper`
--

LOCK TABLES `identity_provider_mapper` WRITE;
/*!40000 ALTER TABLE `identity_provider_mapper` DISABLE KEYS */;
/*!40000 ALTER TABLE `identity_provider_mapper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idp_mapper_config`
--

DROP TABLE IF EXISTS `idp_mapper_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idp_mapper_config` (
  `IDP_MAPPER_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` longtext COLLATE utf8_unicode_ci,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `identity_provider_mapper` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idp_mapper_config`
--

LOCK TABLES `idp_mapper_config` WRITE;
/*!40000 ALTER TABLE `idp_mapper_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `idp_mapper_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keycloak_group`
--

DROP TABLE IF EXISTS `keycloak_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keycloak_group` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PARENT_GROUP` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keycloak_group`
--

LOCK TABLES `keycloak_group` WRITE;
/*!40000 ALTER TABLE `keycloak_group` DISABLE KEYS */;
INSERT INTO `keycloak_group` VALUES ('a49f0ad0-ceac-4d00-a90b-1f913c2a0fac','Fornecedor',' ','ecommerce');
/*!40000 ALTER TABLE `keycloak_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keycloak_role`
--

DROP TABLE IF EXISTS `keycloak_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keycloak_role` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLIENT` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REALM` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keycloak_role`
--

LOCK TABLES `keycloak_role` WRITE;
/*!40000 ALTER TABLE `keycloak_role` DISABLE KEYS */;
INSERT INTO `keycloak_role` VALUES ('01d30d87-be33-4ecb-a2e5-d9c8dd798d25','d9e5f172-c255-4f81-98c5-eae6c26a4b61',_binary '','${role_view-clients}','view-clients','master','d9e5f172-c255-4f81-98c5-eae6c26a4b61',NULL),('0773aab9-25f2-4022-aa91-15a74fa4f074','d9e5f172-c255-4f81-98c5-eae6c26a4b61',_binary '','${role_view-realm}','view-realm','master','d9e5f172-c255-4f81-98c5-eae6c26a4b61',NULL),('07e59398-2ab6-4f0c-b485-8d4525dfd7e3','4019a917-a2c0-411b-b786-1d7d39e78c0b',_binary '','${role_manage-consent}','manage-consent','master','4019a917-a2c0-411b-b786-1d7d39e78c0b',NULL),('08a78aa1-2d85-4809-ace8-12197a0af4e7','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',_binary '','${role_query-users}','query-users','master','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',NULL),('0a188c77-8790-4aee-9a70-8b2346dcefcb','d9e5f172-c255-4f81-98c5-eae6c26a4b61',_binary '','${role_view-authorization}','view-authorization','master','d9e5f172-c255-4f81-98c5-eae6c26a4b61',NULL),('0e5ee697-e621-4dfc-9d49-99f4c3613620','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',_binary '','${role_view-authorization}','view-authorization','master','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',NULL),('11f7f9a6-3144-4a00-b001-3a751d0381b8','ecommerce',_binary '\0','${role_uma_authorization}','uma_authorization','ecommerce',NULL,NULL),('125c2669-ad81-4b5b-a708-00c8655a648d','master',_binary '\0','${role_default-roles}','default-roles-master','master',NULL,NULL),('12f313ed-9c5f-486c-b8ff-7eba9cff79ca','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',_binary '','${role_manage-authorization}','manage-authorization','master','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',NULL),('13b0f046-09a3-404e-bf9d-a8871f210a39','25f383aa-0115-4175-ae70-f150fa71c5c3',_binary '','${role_view-users}','view-users','ecommerce','25f383aa-0115-4175-ae70-f150fa71c5c3',NULL),('154cdaea-53e1-4810-836b-ef196a786bd0','428caa2d-69fd-478f-90ef-acb8375b3773',_binary '','${role_view-users}','view-users','teste','428caa2d-69fd-478f-90ef-acb8375b3773',NULL),('15d51bf3-1525-41af-a283-5e7ba4f154c5','428caa2d-69fd-478f-90ef-acb8375b3773',_binary '','${role_query-groups}','query-groups','teste','428caa2d-69fd-478f-90ef-acb8375b3773',NULL),('168b9421-d70d-46ed-a360-f5e3b392c775','d9e5f172-c255-4f81-98c5-eae6c26a4b61',_binary '','${role_manage-clients}','manage-clients','master','d9e5f172-c255-4f81-98c5-eae6c26a4b61',NULL),('172061eb-0304-49a3-81c8-7836e7efc552','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',_binary '','${role_view-identity-providers}','view-identity-providers','master','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',NULL),('177290a0-c12a-452a-9873-95795a3d3c8d','428caa2d-69fd-478f-90ef-acb8375b3773',_binary '','${role_manage-identity-providers}','manage-identity-providers','teste','428caa2d-69fd-478f-90ef-acb8375b3773',NULL),('17cf34d8-59fd-4511-9a61-cda9a9a76e26','3ee60457-8e9f-4165-89ee-781dd69c8eae',_binary '','${role_delete-account}','delete-account','teste','3ee60457-8e9f-4165-89ee-781dd69c8eae',NULL),('1949d0a4-6037-447c-90da-8b214f443439','d9e5f172-c255-4f81-98c5-eae6c26a4b61',_binary '','${role_manage-users}','manage-users','master','d9e5f172-c255-4f81-98c5-eae6c26a4b61',NULL),('1b6258a1-b3ba-464f-8899-d846c4f815e7','master',_binary '\0','${role_uma_authorization}','uma_authorization','master',NULL,NULL),('1f212159-bf66-41c8-9247-f25ec787a528','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',_binary '','${role_view-authorization}','view-authorization','master','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',NULL),('2089ae83-f475-41df-a120-25d1baf194b3','3ee60457-8e9f-4165-89ee-781dd69c8eae',_binary '','${role_manage-account}','manage-account','teste','3ee60457-8e9f-4165-89ee-781dd69c8eae',NULL),('21446007-f2ea-4c6c-9487-3114d48f9ed8','428caa2d-69fd-478f-90ef-acb8375b3773',_binary '','${role_view-realm}','view-realm','teste','428caa2d-69fd-478f-90ef-acb8375b3773',NULL),('21eda573-fe67-4135-91fc-d2d507fbfff7','d2b83dc4-9823-4e9b-95c0-c39c8b667eb4',_binary '','${role_manage-consent}','manage-consent','ecommerce','d2b83dc4-9823-4e9b-95c0-c39c8b667eb4',NULL),('23d92cec-2a70-47dd-8380-e63a53341527','428caa2d-69fd-478f-90ef-acb8375b3773',_binary '','${role_manage-authorization}','manage-authorization','teste','428caa2d-69fd-478f-90ef-acb8375b3773',NULL),('267b6c5c-6123-407c-90e8-34f3b5c1e769','d9e5f172-c255-4f81-98c5-eae6c26a4b61',_binary '','${role_impersonation}','impersonation','master','d9e5f172-c255-4f81-98c5-eae6c26a4b61',NULL),('2735d198-3de5-4322-9b81-644a917af0de','bc608c00-b971-4080-859d-536d0738f5f5',_binary '','${role_read-token}','read-token','teste','bc608c00-b971-4080-859d-536d0738f5f5',NULL),('281a6125-1f38-43d1-b9c4-eee76d82ab71','428caa2d-69fd-478f-90ef-acb8375b3773',_binary '','${role_query-clients}','query-clients','teste','428caa2d-69fd-478f-90ef-acb8375b3773',NULL),('2eaec1e7-4c8f-48ce-9607-a3edbdfc5f97','d9e5f172-c255-4f81-98c5-eae6c26a4b61',_binary '','${role_query-groups}','query-groups','master','d9e5f172-c255-4f81-98c5-eae6c26a4b61',NULL),('2f950a89-6cf9-449c-b09c-7869e0d383ce','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',_binary '','${role_query-groups}','query-groups','master','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',NULL),('31a22002-3d36-4893-933f-a81392250eae','25f383aa-0115-4175-ae70-f150fa71c5c3',_binary '','${role_view-realm}','view-realm','ecommerce','25f383aa-0115-4175-ae70-f150fa71c5c3',NULL),('31dc9896-7e71-48fd-bd69-2ee5056bcbeb','428caa2d-69fd-478f-90ef-acb8375b3773',_binary '','${role_view-events}','view-events','teste','428caa2d-69fd-478f-90ef-acb8375b3773',NULL),('343d34c5-1ffb-47c9-95de-d496332eb4fc','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',_binary '','${role_manage-users}','manage-users','master','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',NULL),('371de157-4833-4692-92b2-24eeedf98b33','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',_binary '','${role_manage-realm}','manage-realm','master','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',NULL),('3ad7a30d-218b-4bd0-aaea-61b64d010cc0','4019a917-a2c0-411b-b786-1d7d39e78c0b',_binary '','${role_view-profile}','view-profile','master','4019a917-a2c0-411b-b786-1d7d39e78c0b',NULL),('416a77aa-0b90-46a2-9bf9-a5189758fb06','teste',_binary '\0','${role_offline-access}','offline_access','teste',NULL,NULL),('418e8675-24f1-4b9c-b821-b67276586b31','teste',_binary '\0','${role_default-roles}','default-roles-teste','teste',NULL,NULL),('4326580b-40d8-4a4d-8bc0-7c5d6eff8a4d','3ee60457-8e9f-4165-89ee-781dd69c8eae',_binary '','${role_view-profile}','view-profile','teste','3ee60457-8e9f-4165-89ee-781dd69c8eae',NULL),('46625b64-2789-4089-9901-0372eda84411','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',_binary '','${role_query-clients}','query-clients','master','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',NULL),('47fc244d-7f31-4c0b-be1e-56d9961db482','25f383aa-0115-4175-ae70-f150fa71c5c3',_binary '','${role_manage-authorization}','manage-authorization','ecommerce','25f383aa-0115-4175-ae70-f150fa71c5c3',NULL),('4d502640-ac17-49bf-8433-bc4a2c1887f7','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',_binary '','${role_create-client}','create-client','master','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',NULL),('4f18bb12-3c5f-4cb9-b85b-616247342b7c','4019a917-a2c0-411b-b786-1d7d39e78c0b',_binary '','${role_delete-account}','delete-account','master','4019a917-a2c0-411b-b786-1d7d39e78c0b',NULL),('52a99e10-e911-4599-925a-1a178463827b','4019a917-a2c0-411b-b786-1d7d39e78c0b',_binary '','${role_manage-account-links}','manage-account-links','master','4019a917-a2c0-411b-b786-1d7d39e78c0b',NULL),('534fce3c-0a0e-4f63-9682-a21fcb5be18d','d2b83dc4-9823-4e9b-95c0-c39c8b667eb4',_binary '','${role_view-profile}','view-profile','ecommerce','d2b83dc4-9823-4e9b-95c0-c39c8b667eb4',NULL),('56401ce7-4a65-4c56-bc25-3020aed825a7','4019a917-a2c0-411b-b786-1d7d39e78c0b',_binary '','${role_manage-account}','manage-account','master','4019a917-a2c0-411b-b786-1d7d39e78c0b',NULL),('57b4621f-3394-4b69-961b-31e7c7cab6e2','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',_binary '','${role_manage-clients}','manage-clients','master','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',NULL),('5a21d36f-251a-4059-b2fb-ae035659f597','864ed488-7df6-4b5e-b02f-b329b864361d',_binary '','${role_read-token}','read-token','master','864ed488-7df6-4b5e-b02f-b329b864361d',NULL),('5c3c6705-4824-432e-855b-60b3f19c3287','25f383aa-0115-4175-ae70-f150fa71c5c3',_binary '','${role_query-users}','query-users','ecommerce','25f383aa-0115-4175-ae70-f150fa71c5c3',NULL),('5e888b45-0bbd-4dcd-b034-5a0715308aa8','ecommerce',_binary '\0',NULL,'fornecedor','ecommerce',NULL,NULL),('5f4b0a70-b780-4231-8b2f-6487de163ba9','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',_binary '','${role_manage-events}','manage-events','master','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',NULL),('61fca772-7bf3-4acf-b38d-c2510ea31e07','d9e5f172-c255-4f81-98c5-eae6c26a4b61',_binary '','${role_query-realms}','query-realms','master','d9e5f172-c255-4f81-98c5-eae6c26a4b61',NULL),('62882b3e-2bb4-453f-a6ac-317d68492267','teste',_binary '\0','${role_uma_authorization}','uma_authorization','teste',NULL,NULL),('6360d09a-844f-4389-a0aa-22d33d718222','d2b83dc4-9823-4e9b-95c0-c39c8b667eb4',_binary '','${role_view-consent}','view-consent','ecommerce','d2b83dc4-9823-4e9b-95c0-c39c8b667eb4',NULL),('63a615bb-19f5-4921-873d-194285f75bbe','3ee60457-8e9f-4165-89ee-781dd69c8eae',_binary '','${role_view-applications}','view-applications','teste','3ee60457-8e9f-4165-89ee-781dd69c8eae',NULL),('651e47a4-ed33-4630-9495-2f9bb763709d','25f383aa-0115-4175-ae70-f150fa71c5c3',_binary '','${role_query-clients}','query-clients','ecommerce','25f383aa-0115-4175-ae70-f150fa71c5c3',NULL),('66637a63-0619-4d8a-8ad5-5ce8b632e1a1','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',_binary '','${role_impersonation}','impersonation','master','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',NULL),('688fbd57-96fa-4937-82ad-e49d77cf3096','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',_binary '','${role_view-users}','view-users','master','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',NULL),('6bb0dfdb-7de5-4530-9d8d-1737c9ccc0ef','3ee60457-8e9f-4165-89ee-781dd69c8eae',_binary '','${role_manage-account-links}','manage-account-links','teste','3ee60457-8e9f-4165-89ee-781dd69c8eae',NULL),('6ce5a60b-c48f-49c0-a81c-1242b5766cf9','ecommerce',_binary '\0','${role_default-roles}','default-roles-ecommerce','ecommerce',NULL,NULL),('6d29adbc-b392-4619-a6a6-20399474f472','25f383aa-0115-4175-ae70-f150fa71c5c3',_binary '','${role_manage-events}','manage-events','ecommerce','25f383aa-0115-4175-ae70-f150fa71c5c3',NULL),('6e22cab6-c8a7-49b2-8ef4-ea1711327b00','25f383aa-0115-4175-ae70-f150fa71c5c3',_binary '','${role_manage-clients}','manage-clients','ecommerce','25f383aa-0115-4175-ae70-f150fa71c5c3',NULL),('70eb9b15-d40d-4329-b3b6-2124321bdbf1','d9e5f172-c255-4f81-98c5-eae6c26a4b61',_binary '','${role_view-events}','view-events','master','d9e5f172-c255-4f81-98c5-eae6c26a4b61',NULL),('710f13d4-e1b5-4709-8152-497b351ea0a4','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',_binary '','${role_view-events}','view-events','master','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',NULL),('7140caa1-8028-4c06-be89-af7b6bd003e4','master',_binary '\0','${role_offline-access}','offline_access','master',NULL,NULL),('75a290bb-f04d-4e88-bb7a-98021c931e6c','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',_binary '','${role_view-realm}','view-realm','master','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',NULL),('7609d2c8-0152-42bd-9b0b-4a6c91cb57b8','d9e5f172-c255-4f81-98c5-eae6c26a4b61',_binary '','${role_manage-events}','manage-events','master','d9e5f172-c255-4f81-98c5-eae6c26a4b61',NULL),('76bb7e34-5334-4f20-8145-c6810fd15b49','d2b83dc4-9823-4e9b-95c0-c39c8b667eb4',_binary '','${role_manage-account-links}','manage-account-links','ecommerce','d2b83dc4-9823-4e9b-95c0-c39c8b667eb4',NULL),('772ef8e3-7209-4c77-aa7a-720a88b91377','25f383aa-0115-4175-ae70-f150fa71c5c3',_binary '','${role_impersonation}','impersonation','ecommerce','25f383aa-0115-4175-ae70-f150fa71c5c3',NULL),('78d68b35-a500-47d9-b553-6b9f9ece9425','d9e5f172-c255-4f81-98c5-eae6c26a4b61',_binary '','${role_query-users}','query-users','master','d9e5f172-c255-4f81-98c5-eae6c26a4b61',NULL),('7ffbba11-dd31-4779-bb99-2c0f666b1a8d','428caa2d-69fd-478f-90ef-acb8375b3773',_binary '','${role_view-identity-providers}','view-identity-providers','teste','428caa2d-69fd-478f-90ef-acb8375b3773',NULL),('81ce5e7a-6210-449f-a65c-8c06c0b97b77','25f383aa-0115-4175-ae70-f150fa71c5c3',_binary '','${role_manage-identity-providers}','manage-identity-providers','ecommerce','25f383aa-0115-4175-ae70-f150fa71c5c3',NULL),('834f75ff-5e9d-412c-8d00-b30ff25485ff','d2b83dc4-9823-4e9b-95c0-c39c8b667eb4',_binary '','${role_view-applications}','view-applications','ecommerce','d2b83dc4-9823-4e9b-95c0-c39c8b667eb4',NULL),('86052d55-5148-4259-91a8-3803c28160d3','8e272df4-e68a-4c46-91e3-e3edc0bd3a5e',_binary '','${role_read-token}','read-token','ecommerce','8e272df4-e68a-4c46-91e3-e3edc0bd3a5e',NULL),('8dd914fb-b4f5-4d30-a541-04dec99cc3fd','d9e5f172-c255-4f81-98c5-eae6c26a4b61',_binary '','${role_view-users}','view-users','master','d9e5f172-c255-4f81-98c5-eae6c26a4b61',NULL),('9009a157-290f-4199-8845-6d8e8bff3fbf','25f383aa-0115-4175-ae70-f150fa71c5c3',_binary '','${role_view-clients}','view-clients','ecommerce','25f383aa-0115-4175-ae70-f150fa71c5c3',NULL),('907e6b18-1464-4fc7-a4df-39496f1945e8','25f383aa-0115-4175-ae70-f150fa71c5c3',_binary '','${role_manage-users}','manage-users','ecommerce','25f383aa-0115-4175-ae70-f150fa71c5c3',NULL),('9dab3974-b627-4741-958c-2f01cd9fc5d8','4019a917-a2c0-411b-b786-1d7d39e78c0b',_binary '','${role_view-applications}','view-applications','master','4019a917-a2c0-411b-b786-1d7d39e78c0b',NULL),('9dda3b01-0197-4216-927a-a16e51e14867','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',_binary '','${role_query-clients}','query-clients','master','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',NULL),('9f13245f-be8c-4fac-942e-0f665bd7362b','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',_binary '','${role_manage-realm}','manage-realm','master','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',NULL),('a03c25cd-6231-4fce-a798-6907c2e7dab2','3ee60457-8e9f-4165-89ee-781dd69c8eae',_binary '','${role_view-consent}','view-consent','teste','3ee60457-8e9f-4165-89ee-781dd69c8eae',NULL),('a25ed234-1f11-46ab-ba9c-61ed9866a048','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',_binary '','${role_view-identity-providers}','view-identity-providers','master','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',NULL),('a2977db2-d308-427e-bc3a-65613c881c30','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',_binary '','${role_manage-users}','manage-users','master','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',NULL),('a6bdeb9f-ec5e-49bc-8bad-81c07dad3450','d9e5f172-c255-4f81-98c5-eae6c26a4b61',_binary '','${role_view-identity-providers}','view-identity-providers','master','d9e5f172-c255-4f81-98c5-eae6c26a4b61',NULL),('ab279453-47f1-49a7-ac11-fa7d2390871f','25f383aa-0115-4175-ae70-f150fa71c5c3',_binary '','${role_view-authorization}','view-authorization','ecommerce','25f383aa-0115-4175-ae70-f150fa71c5c3',NULL),('abb5cb4a-0129-4d9d-a249-207f01c9b8a4','d9e5f172-c255-4f81-98c5-eae6c26a4b61',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','d9e5f172-c255-4f81-98c5-eae6c26a4b61',NULL),('abfdd8e4-f135-4be7-9999-126bf55553be','428caa2d-69fd-478f-90ef-acb8375b3773',_binary '','${role_manage-clients}','manage-clients','teste','428caa2d-69fd-478f-90ef-acb8375b3773',NULL),('aceacee7-0f95-4f41-8583-e07b694fc20b','25f383aa-0115-4175-ae70-f150fa71c5c3',_binary '','${role_view-identity-providers}','view-identity-providers','ecommerce','25f383aa-0115-4175-ae70-f150fa71c5c3',NULL),('add40534-30c5-4018-a5b8-2c35a3bae63c','d9e5f172-c255-4f81-98c5-eae6c26a4b61',_binary '','${role_manage-authorization}','manage-authorization','master','d9e5f172-c255-4f81-98c5-eae6c26a4b61',NULL),('b50f6e14-09fc-45f5-9c25-b4ba64daacb9','25f383aa-0115-4175-ae70-f150fa71c5c3',_binary '','${role_realm-admin}','realm-admin','ecommerce','25f383aa-0115-4175-ae70-f150fa71c5c3',NULL),('b5e6e2d8-9429-4c2f-8361-bc8da9ea93a0','d2b83dc4-9823-4e9b-95c0-c39c8b667eb4',_binary '','${role_manage-account}','manage-account','ecommerce','d2b83dc4-9823-4e9b-95c0-c39c8b667eb4',NULL),('ba5463ef-417b-47bd-bd68-50ba2c84f00e','25f383aa-0115-4175-ae70-f150fa71c5c3',_binary '','${role_query-realms}','query-realms','ecommerce','25f383aa-0115-4175-ae70-f150fa71c5c3',NULL),('bb966c12-fe95-4486-8b6d-55042e615405','25f383aa-0115-4175-ae70-f150fa71c5c3',_binary '','${role_create-client}','create-client','ecommerce','25f383aa-0115-4175-ae70-f150fa71c5c3',NULL),('bca06f48-1ad1-444d-8ba2-a09587576a31','ecommerce',_binary '\0','${role_offline-access}','offline_access','ecommerce',NULL,NULL),('c0b43cdf-64c5-40c1-9b41-40c18d06db4e','d9e5f172-c255-4f81-98c5-eae6c26a4b61',_binary '','${role_manage-realm}','manage-realm','master','d9e5f172-c255-4f81-98c5-eae6c26a4b61',NULL),('c127891b-b4af-4647-ac20-ff92efad1226','428caa2d-69fd-478f-90ef-acb8375b3773',_binary '','${role_query-users}','query-users','teste','428caa2d-69fd-478f-90ef-acb8375b3773',NULL),('c19c6dae-1b8b-42a8-b82b-6345686061cc','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',_binary '','${role_view-events}','view-events','master','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',NULL),('c391ba6b-035a-4ea2-903f-f187cdc383b9','428caa2d-69fd-478f-90ef-acb8375b3773',_binary '','${role_impersonation}','impersonation','teste','428caa2d-69fd-478f-90ef-acb8375b3773',NULL),('c4c385ec-746b-4864-b0e0-0a56eeeb306f','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',_binary '','${role_view-realm}','view-realm','master','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',NULL),('c6b8edb3-9df3-47a2-b133-4fca58adb56f','428caa2d-69fd-478f-90ef-acb8375b3773',_binary '','${role_query-realms}','query-realms','teste','428caa2d-69fd-478f-90ef-acb8375b3773',NULL),('cb3959c9-ad70-4d77-830d-dc2393bcb0c2','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',_binary '','${role_query-realms}','query-realms','master','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',NULL),('ce392d05-0bb7-430c-82c3-2fcaa6480271','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',_binary '','${role_impersonation}','impersonation','master','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',NULL),('ced25b1c-5547-4603-998d-d869040e5566','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',NULL),('d452654b-3df5-4644-a6b1-2c15787a0134','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',_binary '','${role_view-clients}','view-clients','master','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',NULL),('d4fff40b-7007-4923-8a01-6c9074ae5138','428caa2d-69fd-478f-90ef-acb8375b3773',_binary '','${role_view-clients}','view-clients','teste','428caa2d-69fd-478f-90ef-acb8375b3773',NULL),('d5ee3291-0675-4320-b639-3d20f073eaa4','428caa2d-69fd-478f-90ef-acb8375b3773',_binary '','${role_create-client}','create-client','teste','428caa2d-69fd-478f-90ef-acb8375b3773',NULL),('d8522fb9-e998-46dc-9436-5389d31f6f76','3ee60457-8e9f-4165-89ee-781dd69c8eae',_binary '','${role_manage-consent}','manage-consent','teste','3ee60457-8e9f-4165-89ee-781dd69c8eae',NULL),('d85e3394-6093-4eda-9685-fbad11ee5efc','428caa2d-69fd-478f-90ef-acb8375b3773',_binary '','${role_manage-events}','manage-events','teste','428caa2d-69fd-478f-90ef-acb8375b3773',NULL),('d9199d8b-858a-44a0-a746-ef870befefa8','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',_binary '','${role_view-users}','view-users','master','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',NULL),('d9701ffc-e844-4377-bf2d-a88152d365b3','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',_binary '','${role_create-client}','create-client','master','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',NULL),('dbaacdf6-5748-4a06-a69f-f135e2d79078','master',_binary '\0','${role_create-realm}','create-realm','master',NULL,NULL),('de76d24d-be7d-49e2-8bd4-2aa906f88101','25f383aa-0115-4175-ae70-f150fa71c5c3',_binary '','${role_query-groups}','query-groups','ecommerce','25f383aa-0115-4175-ae70-f150fa71c5c3',NULL),('dfc6f745-d727-4ff7-8ccf-07baac6d0eb1','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',_binary '','${role_query-users}','query-users','master','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',NULL),('e0243a26-bd23-498e-9684-63482be24245','25f383aa-0115-4175-ae70-f150fa71c5c3',_binary '','${role_manage-realm}','manage-realm','ecommerce','25f383aa-0115-4175-ae70-f150fa71c5c3',NULL),('e1e58d2b-a5b0-43b2-a825-b4048f0496c7','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',_binary '','${role_manage-clients}','manage-clients','master','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',NULL),('e231b287-faa8-43dc-979f-cffb52477a88','428caa2d-69fd-478f-90ef-acb8375b3773',_binary '','${role_realm-admin}','realm-admin','teste','428caa2d-69fd-478f-90ef-acb8375b3773',NULL),('e6580f5e-0000-41a9-b481-b1b195715659','master',_binary '\0','${role_admin}','admin','master',NULL,NULL),('e6845123-e97f-4efc-be37-13e8d5b711e7','d9e5f172-c255-4f81-98c5-eae6c26a4b61',_binary '','${role_query-clients}','query-clients','master','d9e5f172-c255-4f81-98c5-eae6c26a4b61',NULL),('e836cc08-2077-42f5-8dad-d5cd2b67e01b','289b03fd-53d1-432d-ad18-16d809920475',_binary '',NULL,'fornecedor','ecommerce','289b03fd-53d1-432d-ad18-16d809920475',NULL),('e8aee63e-ea72-4a59-aa02-dd36f673a935','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',_binary '','${role_query-groups}','query-groups','master','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',NULL),('eab32d9f-1665-455a-83d8-6510166f1542','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',NULL),('eb6b8c4d-67ad-404c-bb86-c66db7ea9910','d2b83dc4-9823-4e9b-95c0-c39c8b667eb4',_binary '','${role_delete-account}','delete-account','ecommerce','d2b83dc4-9823-4e9b-95c0-c39c8b667eb4',NULL),('ed092d71-d622-4f31-8e7f-8e88eb4a6055','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',_binary '','${role_query-realms}','query-realms','master','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',NULL),('f03bef03-e051-42ab-8572-2fcf3bf6abfa','428caa2d-69fd-478f-90ef-acb8375b3773',_binary '','${role_view-authorization}','view-authorization','teste','428caa2d-69fd-478f-90ef-acb8375b3773',NULL),('f088e439-f47c-44c8-8a30-5abcd9167ec7','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',_binary '','${role_view-clients}','view-clients','master','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',NULL),('f3becc51-ff88-4ff9-936a-87731363a11c','d9e5f172-c255-4f81-98c5-eae6c26a4b61',_binary '','${role_create-client}','create-client','master','d9e5f172-c255-4f81-98c5-eae6c26a4b61',NULL),('f4818633-e1b3-486e-aad0-cee4807049da','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',_binary '','${role_manage-authorization}','manage-authorization','master','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',NULL),('f7e31ac1-d1a3-4cca-a787-54410cd6d5f2','428caa2d-69fd-478f-90ef-acb8375b3773',_binary '','${role_manage-users}','manage-users','teste','428caa2d-69fd-478f-90ef-acb8375b3773',NULL),('f81cc296-d3ee-48ee-a5fd-13f8b82eabc0','4019a917-a2c0-411b-b786-1d7d39e78c0b',_binary '','${role_view-consent}','view-consent','master','4019a917-a2c0-411b-b786-1d7d39e78c0b',NULL),('fb83f87d-66d2-4101-a567-8a88e172f8a3','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',_binary '','${role_manage-events}','manage-events','master','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',NULL),('fbe6f4b4-ccd3-4a72-bb3c-7a0f4523194f','428caa2d-69fd-478f-90ef-acb8375b3773',_binary '','${role_manage-realm}','manage-realm','teste','428caa2d-69fd-478f-90ef-acb8375b3773',NULL),('fc402014-ad6d-42cd-97fe-ea039286f24a','25f383aa-0115-4175-ae70-f150fa71c5c3',_binary '','${role_view-events}','view-events','ecommerce','25f383aa-0115-4175-ae70-f150fa71c5c3',NULL);
/*!40000 ALTER TABLE `keycloak_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration_model`
--

DROP TABLE IF EXISTS `migration_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migration_model` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VERSION` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UPDATE_TIME` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration_model`
--

LOCK TABLES `migration_model` WRITE;
/*!40000 ALTER TABLE `migration_model` DISABLE KEYS */;
INSERT INTO `migration_model` VALUES ('7c8iz','16.1.0',1643113849);
/*!40000 ALTER TABLE `migration_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_client_session`
--

DROP TABLE IF EXISTS `offline_client_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offline_client_session` (
  `USER_SESSION_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OFFLINE_FLAG` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `DATA` longtext COLLATE utf8_unicode_ci,
  `CLIENT_STORAGE_PROVIDER` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'local',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_CSS_PRELOAD` (`CLIENT_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_client_session`
--

LOCK TABLES `offline_client_session` WRITE;
/*!40000 ALTER TABLE `offline_client_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_client_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_user_session`
--

DROP TABLE IF EXISTS `offline_user_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offline_user_session` (
  `USER_SESSION_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED_ON` int NOT NULL,
  `OFFLINE_FLAG` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `DATA` longtext COLLATE utf8_unicode_ci,
  `LAST_SESSION_REFRESH` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`),
  KEY `IDX_OFFLINE_USS_PRELOAD` (`OFFLINE_FLAG`,`CREATED_ON`,`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_USS_BY_USER` (`USER_ID`,`REALM_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_BY_USERSESS` (`REALM_ID`,`OFFLINE_FLAG`,`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_user_session`
--

LOCK TABLES `offline_user_session` WRITE;
/*!40000 ALTER TABLE `offline_user_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_user_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policy_config`
--

DROP TABLE IF EXISTS `policy_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `policy_config` (
  `POLICY_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy_config`
--

LOCK TABLES `policy_config` WRITE;
/*!40000 ALTER TABLE `policy_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `policy_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `protocol_mapper`
--

DROP TABLE IF EXISTS `protocol_mapper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `protocol_mapper` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PROTOCOL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
  CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `client_scope` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `protocol_mapper`
--

LOCK TABLES `protocol_mapper` WRITE;
/*!40000 ALTER TABLE `protocol_mapper` DISABLE KEYS */;
INSERT INTO `protocol_mapper` VALUES ('00a4197e-6909-4c4d-9e5d-04f04a80101d','email','openid-connect','oidc-usermodel-property-mapper',NULL,'d917b551-9990-4ea6-afe7-4fec8711e923'),('032e64b7-ae96-4de5-bd4d-d5e06f8a7b80','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'958e4eec-b00e-4963-9d93-f722bc6e5595'),('09c0a19a-cacd-4aa9-8d5a-c032e63522ab','full name','openid-connect','oidc-full-name-mapper',NULL,'64f01f75-4fbd-45d9-9fe5-f6608da26a08'),('0bdddf6f-8c01-40b3-8215-8697549ed363','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'64f01f75-4fbd-45d9-9fe5-f6608da26a08'),('0d4c704c-3059-4f01-8c69-e653455463c2','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'958e4eec-b00e-4963-9d93-f722bc6e5595'),('0df874a1-fa29-469b-afa7-ee2ad7d6fa41','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'5159dfd5-2a50-4bee-bcc7-a2b9acc7c2f8'),('130e102c-e110-413f-a684-da70fdc7f06e','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'2b87fc24-50ab-434e-b3ca-acf0c7891804'),('13a9f99d-2c9c-4a2e-a144-97b43024f413','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'64f01f75-4fbd-45d9-9fe5-f6608da26a08'),('157572c8-bd09-441b-bd54-489437a10068','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'8a01f0a0-74da-46b7-9183-d0d1017ccf52'),('1c0f51a3-a9eb-42be-a093-0c2fa791bcc6','address','openid-connect','oidc-address-mapper',NULL,'2ea621ac-e268-418b-a40d-813cd782ead6'),('1ce38639-156f-4838-be75-ddc0f95e3bda','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'64f01f75-4fbd-45d9-9fe5-f6608da26a08'),('21aca268-9f39-4b4e-896b-990477aa8473','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'958e4eec-b00e-4963-9d93-f722bc6e5595'),('21d5ae80-b83d-48ac-b29e-a76a2a34d30d','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2b87fc24-50ab-434e-b3ca-acf0c7891804'),('28254803-ffc6-4368-b779-09abe180999f','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'64f01f75-4fbd-45d9-9fe5-f6608da26a08'),('2ac76dc2-1415-4763-a976-198a8cd04651','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'64f01f75-4fbd-45d9-9fe5-f6608da26a08'),('2c9e6e4a-b791-404a-8af0-0718acd017c2','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'c7f2d128-f598-4b0f-8325-8d344555322f'),('2fb262a0-f1e6-4d74-b76b-063780e9b22f','email','openid-connect','oidc-usermodel-property-mapper',NULL,'c98eb9bd-76e3-4f2e-b27c-7a0d3526fcd0'),('3647ce85-9b5b-492f-b093-10c64c9a892e','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'7ae86941-ce2d-4ba0-ac86-5ad0983ef252'),('39bca739-fd00-404a-ac6c-9f99fbffe157','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'bb6813d4-0ac1-43e3-ad21-a7ef3c251e0c'),('3a97f869-81b7-46d9-bf2e-567952338a6b','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'7ae86941-ce2d-4ba0-ac86-5ad0983ef252'),('3ab88d97-775e-43c8-bd7a-dc68835bc64a','audience resolve','openid-connect','oidc-audience-resolve-mapper','45759025-c500-44f8-9792-05e9d08b5ba0',NULL),('492d0011-2ed4-4098-9632-1b81e16fb204','locale','openid-connect','oidc-usermodel-attribute-mapper','ee662877-97f9-4147-9631-b92ce80cc566',NULL),('4d65275b-98b9-4842-a3dc-c50a196baacf','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c9db35e1-d8cf-4de6-a005-e265abfd83af'),('50fd106e-d411-4382-aad8-d556c61f85d9','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'397fcd6a-6c3f-4dea-96e6-6eb13c2ea790'),('54c6b49e-126b-47d6-ac32-b7d19dde3935','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'958e4eec-b00e-4963-9d93-f722bc6e5595'),('551265d9-fa5b-42f1-8c07-fbd2e256668e','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'958e4eec-b00e-4963-9d93-f722bc6e5595'),('5888c769-02ab-4041-b4b1-4f27b791d5d6','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'5159dfd5-2a50-4bee-bcc7-a2b9acc7c2f8'),('59173930-a714-4081-8c1a-9e881eea9011','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'8a01f0a0-74da-46b7-9183-d0d1017ccf52'),('5b09c2f1-63d1-45ee-8163-5b10769d3030','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2b87fc24-50ab-434e-b3ca-acf0c7891804'),('61673b8f-8692-4302-82a6-4d0e7518f0d9','role list','saml','saml-role-list-mapper',NULL,'a60a01d1-4b76-4d12-915e-9e2fdeb55e09'),('650d17b0-a46a-401d-b050-4d9872a126fc','locale','openid-connect','oidc-usermodel-attribute-mapper','1552a7c5-a7fc-4aa9-ba43-1acafcbcb7a7',NULL),('6889863a-68ef-4574-9d2e-1231fc993ade','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2b87fc24-50ab-434e-b3ca-acf0c7891804'),('6be0e9d1-5356-411f-8fbc-04d7c2ea7a08','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c9db35e1-d8cf-4de6-a005-e265abfd83af'),('6df497b7-d351-4299-81a2-a72e09e3be44','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'397fcd6a-6c3f-4dea-96e6-6eb13c2ea790'),('6ec629ba-b9cd-4889-b1ad-d3ad8e2d3b36','username','openid-connect','oidc-usermodel-property-mapper',NULL,'2b87fc24-50ab-434e-b3ca-acf0c7891804'),('75138e77-d300-4b17-968c-28a22389b850','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'64f01f75-4fbd-45d9-9fe5-f6608da26a08'),('77dd4548-fb4a-427d-b1e2-cb89bd075ecd','full name','openid-connect','oidc-full-name-mapper',NULL,'2b87fc24-50ab-434e-b3ca-acf0c7891804'),('78d4f69c-f5d9-4495-af9f-56487418838d','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'958e4eec-b00e-4963-9d93-f722bc6e5595'),('7e065427-1d6a-46db-947a-c97e4e131a80','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'770a7a4d-438a-4f5f-90eb-063215b4df81'),('80240771-3219-492e-b19f-e34fc75300ee','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'64f01f75-4fbd-45d9-9fe5-f6608da26a08'),('831dd229-d39a-4d8a-8e16-fee19d6c5f5b','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2b87fc24-50ab-434e-b3ca-acf0c7891804'),('87481150-7540-4d61-82a1-1f3f6b112daf','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2b87fc24-50ab-434e-b3ca-acf0c7891804'),('8cbc1904-91b3-4ff2-b7d5-ddc5c2833135','audience resolve','openid-connect','oidc-audience-resolve-mapper','5a71649f-df11-4101-9a6b-ca68c5140314',NULL),('8e2d75a1-eace-4f8c-ba99-864ad4be73ae','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'545c9eca-624d-4da7-b66e-e8e4c0f58178'),('8e5909c8-3629-4333-8d85-8b20aedb1e9b','full name','openid-connect','oidc-full-name-mapper',NULL,'958e4eec-b00e-4963-9d93-f722bc6e5595'),('8f0ca3e9-cc41-40ff-9817-028c580bed2c','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'958e4eec-b00e-4963-9d93-f722bc6e5595'),('8fb9e927-4002-48f1-b397-610cb558841a','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'4d392da9-bb7f-4500-80cb-9fe7d09d7ecf'),('91ef3105-428f-4dfb-8960-3c591362e0e9','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'958e4eec-b00e-4963-9d93-f722bc6e5595'),('97bd56b7-9789-418d-a6db-06a09b2547af','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'64f01f75-4fbd-45d9-9fe5-f6608da26a08'),('98cf21c2-c110-4da7-9cb8-682528824bea','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'958e4eec-b00e-4963-9d93-f722bc6e5595'),('9b6c7f99-490e-4020-a775-53c0eccf69d2','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'770a7a4d-438a-4f5f-90eb-063215b4df81'),('9cf348b2-c2c9-45fe-bc27-afd5492f6bcd','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'64f01f75-4fbd-45d9-9fe5-f6608da26a08'),('9da7f10f-1981-441f-9182-406492b3121d','username','openid-connect','oidc-usermodel-property-mapper',NULL,'64f01f75-4fbd-45d9-9fe5-f6608da26a08'),('9e5f999e-7f87-4063-9d7b-6ff644669c21','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'958e4eec-b00e-4963-9d93-f722bc6e5595'),('9ebb5d2a-59ef-4481-a543-187acc51829d','audience resolve','openid-connect','oidc-audience-resolve-mapper','3ab1a78f-5cc4-4cf9-b523-a96f34c9565a',NULL),('ad96d012-00bb-4454-8110-98f82fae50e4','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'64f01f75-4fbd-45d9-9fe5-f6608da26a08'),('b129b920-cce4-4ece-be6b-02204d164200','role list','saml','saml-role-list-mapper',NULL,'0db8d451-717f-425a-bdd7-9123bf1b7c8b'),('b1c7cd92-2a75-4b53-a476-373167296817','role list','saml','saml-role-list-mapper',NULL,'d42e4740-91f0-441f-b70c-3adb96dfa6de'),('b47b6d19-5f98-4ed9-b95b-97d32e963750','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'4d392da9-bb7f-4500-80cb-9fe7d09d7ecf'),('b487d6b1-c77e-466a-b5ba-3121f3326c24','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'faab6469-8297-441f-9967-e779741d5079'),('b8efc5cd-023f-48c9-ad9c-adbbf12c78ef','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'958e4eec-b00e-4963-9d93-f722bc6e5595'),('bacad940-c90f-4dff-b33b-f4762a319fe9','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'d917b551-9990-4ea6-afe7-4fec8711e923'),('bbbab1f7-1288-4b6c-a9c4-85cb37617e6d','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'c98eb9bd-76e3-4f2e-b27c-7a0d3526fcd0'),('bc67ae1e-2bf3-46c6-a2b2-d0d40eae5a0b','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'84b7e072-0523-44e3-add4-ad5acf6b1c3a'),('bf52c9bd-6301-4b93-8656-d40879705d19','email','openid-connect','oidc-usermodel-property-mapper',NULL,'bb6813d4-0ac1-43e3-ad21-a7ef3c251e0c'),('c043131e-526e-46d2-9c38-07bf86f282d7','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2b87fc24-50ab-434e-b3ca-acf0c7891804'),('c2c71eff-5943-4853-af28-a9d5ffed85ff','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2b87fc24-50ab-434e-b3ca-acf0c7891804'),('c6a87046-5b65-43ee-b09c-48ecd0bd21b7','fornecedor','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'7ae86941-ce2d-4ba0-ac86-5ad0983ef252'),('cb0c83e1-0389-4d6f-8584-80bb5c3522f4','address','openid-connect','oidc-address-mapper',NULL,'77d2cbe1-ea69-4085-81c9-e61c33a3b7c8'),('cc1e9084-8b31-47ff-9c1a-bc067b4dab82','username','openid-connect','oidc-usermodel-property-mapper',NULL,'958e4eec-b00e-4963-9d93-f722bc6e5595'),('cea0c410-cbc6-4bbc-82cb-27163029cb3b','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'2b87fc24-50ab-434e-b3ca-acf0c7891804'),('cfaecbbd-e369-4f50-b59c-e09538251e60','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'84b7e072-0523-44e3-add4-ad5acf6b1c3a'),('d6e1a3da-c7d9-40b6-9c52-f138fea28c3d','address','openid-connect','oidc-address-mapper',NULL,'1f8afd59-9ffa-4983-b809-11e89bff3220'),('d8233f73-df26-4459-a4aa-e85078d85dd1','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2b87fc24-50ab-434e-b3ca-acf0c7891804'),('db3d9d5a-d410-4f2b-abbc-334d5c65da30','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'1cf9ab4e-b07c-4c1a-a7d9-305e43d25a03'),('dca332f6-7810-4e1a-8b1a-31f38dce11de','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2b87fc24-50ab-434e-b3ca-acf0c7891804'),('dddee531-8bde-43dc-b50b-231bf04c0770','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'7ae86941-ce2d-4ba0-ac86-5ad0983ef252'),('de065098-17f2-45d6-ae44-1b9319385569','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'c7f2d128-f598-4b0f-8325-8d344555322f'),('e38d40c2-fb6f-4578-9d2c-df7b7b3a2832','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'5159dfd5-2a50-4bee-bcc7-a2b9acc7c2f8'),('e50bd062-3460-4ed5-b62a-8591920e59de','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'64f01f75-4fbd-45d9-9fe5-f6608da26a08'),('f509c6c9-db3c-4d1b-af4c-d2a8bc5876a5','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'64f01f75-4fbd-45d9-9fe5-f6608da26a08'),('fa3526c0-622c-43b6-a35c-6c9e277b9407','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'958e4eec-b00e-4963-9d93-f722bc6e5595'),('fa574764-485b-48c0-a666-e1d5ac4ea286','locale','openid-connect','oidc-usermodel-attribute-mapper','2572573e-8bf0-499c-b556-af0edcd22ce3',NULL),('fbc63553-4aa9-4395-8584-1f334f6e550b','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'84b7e072-0523-44e3-add4-ad5acf6b1c3a'),('fe322671-681c-4460-89e9-fb2cce6589ea','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2b87fc24-50ab-434e-b3ca-acf0c7891804');
/*!40000 ALTER TABLE `protocol_mapper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `protocol_mapper_config`
--

DROP TABLE IF EXISTS `protocol_mapper_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `protocol_mapper_config` (
  `PROTOCOL_MAPPER_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` longtext COLLATE utf8_unicode_ci,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `protocol_mapper` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `protocol_mapper_config`
--

LOCK TABLES `protocol_mapper_config` WRITE;
/*!40000 ALTER TABLE `protocol_mapper_config` DISABLE KEYS */;
INSERT INTO `protocol_mapper_config` VALUES ('00a4197e-6909-4c4d-9e5d-04f04a80101d','true','access.token.claim'),('00a4197e-6909-4c4d-9e5d-04f04a80101d','email','claim.name'),('00a4197e-6909-4c4d-9e5d-04f04a80101d','true','id.token.claim'),('00a4197e-6909-4c4d-9e5d-04f04a80101d','String','jsonType.label'),('00a4197e-6909-4c4d-9e5d-04f04a80101d','email','user.attribute'),('00a4197e-6909-4c4d-9e5d-04f04a80101d','true','userinfo.token.claim'),('032e64b7-ae96-4de5-bd4d-d5e06f8a7b80','true','access.token.claim'),('032e64b7-ae96-4de5-bd4d-d5e06f8a7b80','zoneinfo','claim.name'),('032e64b7-ae96-4de5-bd4d-d5e06f8a7b80','true','id.token.claim'),('032e64b7-ae96-4de5-bd4d-d5e06f8a7b80','String','jsonType.label'),('032e64b7-ae96-4de5-bd4d-d5e06f8a7b80','zoneinfo','user.attribute'),('032e64b7-ae96-4de5-bd4d-d5e06f8a7b80','true','userinfo.token.claim'),('09c0a19a-cacd-4aa9-8d5a-c032e63522ab','true','access.token.claim'),('09c0a19a-cacd-4aa9-8d5a-c032e63522ab','true','id.token.claim'),('09c0a19a-cacd-4aa9-8d5a-c032e63522ab','true','userinfo.token.claim'),('0bdddf6f-8c01-40b3-8215-8697549ed363','true','access.token.claim'),('0bdddf6f-8c01-40b3-8215-8697549ed363','gender','claim.name'),('0bdddf6f-8c01-40b3-8215-8697549ed363','true','id.token.claim'),('0bdddf6f-8c01-40b3-8215-8697549ed363','String','jsonType.label'),('0bdddf6f-8c01-40b3-8215-8697549ed363','gender','user.attribute'),('0bdddf6f-8c01-40b3-8215-8697549ed363','true','userinfo.token.claim'),('0d4c704c-3059-4f01-8c69-e653455463c2','true','access.token.claim'),('0d4c704c-3059-4f01-8c69-e653455463c2','family_name','claim.name'),('0d4c704c-3059-4f01-8c69-e653455463c2','true','id.token.claim'),('0d4c704c-3059-4f01-8c69-e653455463c2','String','jsonType.label'),('0d4c704c-3059-4f01-8c69-e653455463c2','lastName','user.attribute'),('0d4c704c-3059-4f01-8c69-e653455463c2','true','userinfo.token.claim'),('0df874a1-fa29-469b-afa7-ee2ad7d6fa41','true','access.token.claim'),('0df874a1-fa29-469b-afa7-ee2ad7d6fa41','realm_access.roles','claim.name'),('0df874a1-fa29-469b-afa7-ee2ad7d6fa41','String','jsonType.label'),('0df874a1-fa29-469b-afa7-ee2ad7d6fa41','true','multivalued'),('0df874a1-fa29-469b-afa7-ee2ad7d6fa41','foo','user.attribute'),('130e102c-e110-413f-a684-da70fdc7f06e','true','access.token.claim'),('130e102c-e110-413f-a684-da70fdc7f06e','family_name','claim.name'),('130e102c-e110-413f-a684-da70fdc7f06e','true','id.token.claim'),('130e102c-e110-413f-a684-da70fdc7f06e','String','jsonType.label'),('130e102c-e110-413f-a684-da70fdc7f06e','lastName','user.attribute'),('130e102c-e110-413f-a684-da70fdc7f06e','true','userinfo.token.claim'),('13a9f99d-2c9c-4a2e-a144-97b43024f413','true','access.token.claim'),('13a9f99d-2c9c-4a2e-a144-97b43024f413','profile','claim.name'),('13a9f99d-2c9c-4a2e-a144-97b43024f413','true','id.token.claim'),('13a9f99d-2c9c-4a2e-a144-97b43024f413','String','jsonType.label'),('13a9f99d-2c9c-4a2e-a144-97b43024f413','profile','user.attribute'),('13a9f99d-2c9c-4a2e-a144-97b43024f413','true','userinfo.token.claim'),('157572c8-bd09-441b-bd54-489437a10068','true','access.token.claim'),('157572c8-bd09-441b-bd54-489437a10068','groups','claim.name'),('157572c8-bd09-441b-bd54-489437a10068','true','id.token.claim'),('157572c8-bd09-441b-bd54-489437a10068','String','jsonType.label'),('157572c8-bd09-441b-bd54-489437a10068','true','multivalued'),('157572c8-bd09-441b-bd54-489437a10068','foo','user.attribute'),('1c0f51a3-a9eb-42be-a093-0c2fa791bcc6','true','access.token.claim'),('1c0f51a3-a9eb-42be-a093-0c2fa791bcc6','true','id.token.claim'),('1c0f51a3-a9eb-42be-a093-0c2fa791bcc6','country','user.attribute.country'),('1c0f51a3-a9eb-42be-a093-0c2fa791bcc6','formatted','user.attribute.formatted'),('1c0f51a3-a9eb-42be-a093-0c2fa791bcc6','locality','user.attribute.locality'),('1c0f51a3-a9eb-42be-a093-0c2fa791bcc6','postal_code','user.attribute.postal_code'),('1c0f51a3-a9eb-42be-a093-0c2fa791bcc6','region','user.attribute.region'),('1c0f51a3-a9eb-42be-a093-0c2fa791bcc6','street','user.attribute.street'),('1c0f51a3-a9eb-42be-a093-0c2fa791bcc6','true','userinfo.token.claim'),('1ce38639-156f-4838-be75-ddc0f95e3bda','true','access.token.claim'),('1ce38639-156f-4838-be75-ddc0f95e3bda','updated_at','claim.name'),('1ce38639-156f-4838-be75-ddc0f95e3bda','true','id.token.claim'),('1ce38639-156f-4838-be75-ddc0f95e3bda','String','jsonType.label'),('1ce38639-156f-4838-be75-ddc0f95e3bda','updatedAt','user.attribute'),('1ce38639-156f-4838-be75-ddc0f95e3bda','true','userinfo.token.claim'),('21aca268-9f39-4b4e-896b-990477aa8473','true','access.token.claim'),('21aca268-9f39-4b4e-896b-990477aa8473','website','claim.name'),('21aca268-9f39-4b4e-896b-990477aa8473','true','id.token.claim'),('21aca268-9f39-4b4e-896b-990477aa8473','String','jsonType.label'),('21aca268-9f39-4b4e-896b-990477aa8473','website','user.attribute'),('21aca268-9f39-4b4e-896b-990477aa8473','true','userinfo.token.claim'),('21d5ae80-b83d-48ac-b29e-a76a2a34d30d','true','access.token.claim'),('21d5ae80-b83d-48ac-b29e-a76a2a34d30d','middle_name','claim.name'),('21d5ae80-b83d-48ac-b29e-a76a2a34d30d','true','id.token.claim'),('21d5ae80-b83d-48ac-b29e-a76a2a34d30d','String','jsonType.label'),('21d5ae80-b83d-48ac-b29e-a76a2a34d30d','middleName','user.attribute'),('21d5ae80-b83d-48ac-b29e-a76a2a34d30d','true','userinfo.token.claim'),('28254803-ffc6-4368-b779-09abe180999f','true','access.token.claim'),('28254803-ffc6-4368-b779-09abe180999f','nickname','claim.name'),('28254803-ffc6-4368-b779-09abe180999f','true','id.token.claim'),('28254803-ffc6-4368-b779-09abe180999f','String','jsonType.label'),('28254803-ffc6-4368-b779-09abe180999f','nickname','user.attribute'),('28254803-ffc6-4368-b779-09abe180999f','true','userinfo.token.claim'),('2ac76dc2-1415-4763-a976-198a8cd04651','true','access.token.claim'),('2ac76dc2-1415-4763-a976-198a8cd04651','given_name','claim.name'),('2ac76dc2-1415-4763-a976-198a8cd04651','true','id.token.claim'),('2ac76dc2-1415-4763-a976-198a8cd04651','String','jsonType.label'),('2ac76dc2-1415-4763-a976-198a8cd04651','firstName','user.attribute'),('2ac76dc2-1415-4763-a976-198a8cd04651','true','userinfo.token.claim'),('2c9e6e4a-b791-404a-8af0-0718acd017c2','true','access.token.claim'),('2c9e6e4a-b791-404a-8af0-0718acd017c2','groups','claim.name'),('2c9e6e4a-b791-404a-8af0-0718acd017c2','true','id.token.claim'),('2c9e6e4a-b791-404a-8af0-0718acd017c2','String','jsonType.label'),('2c9e6e4a-b791-404a-8af0-0718acd017c2','true','multivalued'),('2c9e6e4a-b791-404a-8af0-0718acd017c2','foo','user.attribute'),('2fb262a0-f1e6-4d74-b76b-063780e9b22f','true','access.token.claim'),('2fb262a0-f1e6-4d74-b76b-063780e9b22f','email','claim.name'),('2fb262a0-f1e6-4d74-b76b-063780e9b22f','true','id.token.claim'),('2fb262a0-f1e6-4d74-b76b-063780e9b22f','String','jsonType.label'),('2fb262a0-f1e6-4d74-b76b-063780e9b22f','email','user.attribute'),('2fb262a0-f1e6-4d74-b76b-063780e9b22f','true','userinfo.token.claim'),('3647ce85-9b5b-492f-b093-10c64c9a892e','true','access.token.claim'),('3647ce85-9b5b-492f-b093-10c64c9a892e','realm_access.roles','claim.name'),('3647ce85-9b5b-492f-b093-10c64c9a892e','String','jsonType.label'),('3647ce85-9b5b-492f-b093-10c64c9a892e','true','multivalued'),('3647ce85-9b5b-492f-b093-10c64c9a892e','foo','user.attribute'),('39bca739-fd00-404a-ac6c-9f99fbffe157','true','access.token.claim'),('39bca739-fd00-404a-ac6c-9f99fbffe157','email_verified','claim.name'),('39bca739-fd00-404a-ac6c-9f99fbffe157','true','id.token.claim'),('39bca739-fd00-404a-ac6c-9f99fbffe157','boolean','jsonType.label'),('39bca739-fd00-404a-ac6c-9f99fbffe157','emailVerified','user.attribute'),('39bca739-fd00-404a-ac6c-9f99fbffe157','true','userinfo.token.claim'),('492d0011-2ed4-4098-9632-1b81e16fb204','true','access.token.claim'),('492d0011-2ed4-4098-9632-1b81e16fb204','locale','claim.name'),('492d0011-2ed4-4098-9632-1b81e16fb204','true','id.token.claim'),('492d0011-2ed4-4098-9632-1b81e16fb204','String','jsonType.label'),('492d0011-2ed4-4098-9632-1b81e16fb204','locale','user.attribute'),('492d0011-2ed4-4098-9632-1b81e16fb204','true','userinfo.token.claim'),('4d65275b-98b9-4842-a3dc-c50a196baacf','true','access.token.claim'),('4d65275b-98b9-4842-a3dc-c50a196baacf','phone_number_verified','claim.name'),('4d65275b-98b9-4842-a3dc-c50a196baacf','true','id.token.claim'),('4d65275b-98b9-4842-a3dc-c50a196baacf','boolean','jsonType.label'),('4d65275b-98b9-4842-a3dc-c50a196baacf','phoneNumberVerified','user.attribute'),('4d65275b-98b9-4842-a3dc-c50a196baacf','true','userinfo.token.claim'),('50fd106e-d411-4382-aad8-d556c61f85d9','true','access.token.claim'),('50fd106e-d411-4382-aad8-d556c61f85d9','phone_number','claim.name'),('50fd106e-d411-4382-aad8-d556c61f85d9','true','id.token.claim'),('50fd106e-d411-4382-aad8-d556c61f85d9','String','jsonType.label'),('50fd106e-d411-4382-aad8-d556c61f85d9','phoneNumber','user.attribute'),('50fd106e-d411-4382-aad8-d556c61f85d9','true','userinfo.token.claim'),('54c6b49e-126b-47d6-ac32-b7d19dde3935','true','access.token.claim'),('54c6b49e-126b-47d6-ac32-b7d19dde3935','middle_name','claim.name'),('54c6b49e-126b-47d6-ac32-b7d19dde3935','true','id.token.claim'),('54c6b49e-126b-47d6-ac32-b7d19dde3935','String','jsonType.label'),('54c6b49e-126b-47d6-ac32-b7d19dde3935','middleName','user.attribute'),('54c6b49e-126b-47d6-ac32-b7d19dde3935','true','userinfo.token.claim'),('551265d9-fa5b-42f1-8c07-fbd2e256668e','true','access.token.claim'),('551265d9-fa5b-42f1-8c07-fbd2e256668e','gender','claim.name'),('551265d9-fa5b-42f1-8c07-fbd2e256668e','true','id.token.claim'),('551265d9-fa5b-42f1-8c07-fbd2e256668e','String','jsonType.label'),('551265d9-fa5b-42f1-8c07-fbd2e256668e','gender','user.attribute'),('551265d9-fa5b-42f1-8c07-fbd2e256668e','true','userinfo.token.claim'),('59173930-a714-4081-8c1a-9e881eea9011','true','access.token.claim'),('59173930-a714-4081-8c1a-9e881eea9011','upn','claim.name'),('59173930-a714-4081-8c1a-9e881eea9011','true','id.token.claim'),('59173930-a714-4081-8c1a-9e881eea9011','String','jsonType.label'),('59173930-a714-4081-8c1a-9e881eea9011','username','user.attribute'),('59173930-a714-4081-8c1a-9e881eea9011','true','userinfo.token.claim'),('5b09c2f1-63d1-45ee-8163-5b10769d3030','true','access.token.claim'),('5b09c2f1-63d1-45ee-8163-5b10769d3030','updated_at','claim.name'),('5b09c2f1-63d1-45ee-8163-5b10769d3030','true','id.token.claim'),('5b09c2f1-63d1-45ee-8163-5b10769d3030','String','jsonType.label'),('5b09c2f1-63d1-45ee-8163-5b10769d3030','updatedAt','user.attribute'),('5b09c2f1-63d1-45ee-8163-5b10769d3030','true','userinfo.token.claim'),('61673b8f-8692-4302-82a6-4d0e7518f0d9','Role','attribute.name'),('61673b8f-8692-4302-82a6-4d0e7518f0d9','Basic','attribute.nameformat'),('61673b8f-8692-4302-82a6-4d0e7518f0d9','false','single'),('650d17b0-a46a-401d-b050-4d9872a126fc','true','access.token.claim'),('650d17b0-a46a-401d-b050-4d9872a126fc','locale','claim.name'),('650d17b0-a46a-401d-b050-4d9872a126fc','true','id.token.claim'),('650d17b0-a46a-401d-b050-4d9872a126fc','String','jsonType.label'),('650d17b0-a46a-401d-b050-4d9872a126fc','locale','user.attribute'),('650d17b0-a46a-401d-b050-4d9872a126fc','true','userinfo.token.claim'),('6889863a-68ef-4574-9d2e-1231fc993ade','true','access.token.claim'),('6889863a-68ef-4574-9d2e-1231fc993ade','gender','claim.name'),('6889863a-68ef-4574-9d2e-1231fc993ade','true','id.token.claim'),('6889863a-68ef-4574-9d2e-1231fc993ade','String','jsonType.label'),('6889863a-68ef-4574-9d2e-1231fc993ade','gender','user.attribute'),('6889863a-68ef-4574-9d2e-1231fc993ade','true','userinfo.token.claim'),('6be0e9d1-5356-411f-8fbc-04d7c2ea7a08','true','access.token.claim'),('6be0e9d1-5356-411f-8fbc-04d7c2ea7a08','phone_number','claim.name'),('6be0e9d1-5356-411f-8fbc-04d7c2ea7a08','true','id.token.claim'),('6be0e9d1-5356-411f-8fbc-04d7c2ea7a08','String','jsonType.label'),('6be0e9d1-5356-411f-8fbc-04d7c2ea7a08','phoneNumber','user.attribute'),('6be0e9d1-5356-411f-8fbc-04d7c2ea7a08','true','userinfo.token.claim'),('6df497b7-d351-4299-81a2-a72e09e3be44','true','access.token.claim'),('6df497b7-d351-4299-81a2-a72e09e3be44','phone_number_verified','claim.name'),('6df497b7-d351-4299-81a2-a72e09e3be44','true','id.token.claim'),('6df497b7-d351-4299-81a2-a72e09e3be44','boolean','jsonType.label'),('6df497b7-d351-4299-81a2-a72e09e3be44','phoneNumberVerified','user.attribute'),('6df497b7-d351-4299-81a2-a72e09e3be44','true','userinfo.token.claim'),('6ec629ba-b9cd-4889-b1ad-d3ad8e2d3b36','true','access.token.claim'),('6ec629ba-b9cd-4889-b1ad-d3ad8e2d3b36','preferred_username','claim.name'),('6ec629ba-b9cd-4889-b1ad-d3ad8e2d3b36','true','id.token.claim'),('6ec629ba-b9cd-4889-b1ad-d3ad8e2d3b36','String','jsonType.label'),('6ec629ba-b9cd-4889-b1ad-d3ad8e2d3b36','username','user.attribute'),('6ec629ba-b9cd-4889-b1ad-d3ad8e2d3b36','true','userinfo.token.claim'),('75138e77-d300-4b17-968c-28a22389b850','true','access.token.claim'),('75138e77-d300-4b17-968c-28a22389b850','website','claim.name'),('75138e77-d300-4b17-968c-28a22389b850','true','id.token.claim'),('75138e77-d300-4b17-968c-28a22389b850','String','jsonType.label'),('75138e77-d300-4b17-968c-28a22389b850','website','user.attribute'),('75138e77-d300-4b17-968c-28a22389b850','true','userinfo.token.claim'),('77dd4548-fb4a-427d-b1e2-cb89bd075ecd','true','access.token.claim'),('77dd4548-fb4a-427d-b1e2-cb89bd075ecd','true','id.token.claim'),('77dd4548-fb4a-427d-b1e2-cb89bd075ecd','true','userinfo.token.claim'),('78d4f69c-f5d9-4495-af9f-56487418838d','true','access.token.claim'),('78d4f69c-f5d9-4495-af9f-56487418838d','given_name','claim.name'),('78d4f69c-f5d9-4495-af9f-56487418838d','true','id.token.claim'),('78d4f69c-f5d9-4495-af9f-56487418838d','String','jsonType.label'),('78d4f69c-f5d9-4495-af9f-56487418838d','firstName','user.attribute'),('78d4f69c-f5d9-4495-af9f-56487418838d','true','userinfo.token.claim'),('7e065427-1d6a-46db-947a-c97e4e131a80','true','access.token.claim'),('7e065427-1d6a-46db-947a-c97e4e131a80','groups','claim.name'),('7e065427-1d6a-46db-947a-c97e4e131a80','true','id.token.claim'),('7e065427-1d6a-46db-947a-c97e4e131a80','String','jsonType.label'),('7e065427-1d6a-46db-947a-c97e4e131a80','true','multivalued'),('7e065427-1d6a-46db-947a-c97e4e131a80','foo','user.attribute'),('80240771-3219-492e-b19f-e34fc75300ee','true','access.token.claim'),('80240771-3219-492e-b19f-e34fc75300ee','middle_name','claim.name'),('80240771-3219-492e-b19f-e34fc75300ee','true','id.token.claim'),('80240771-3219-492e-b19f-e34fc75300ee','String','jsonType.label'),('80240771-3219-492e-b19f-e34fc75300ee','middleName','user.attribute'),('80240771-3219-492e-b19f-e34fc75300ee','true','userinfo.token.claim'),('831dd229-d39a-4d8a-8e16-fee19d6c5f5b','true','access.token.claim'),('831dd229-d39a-4d8a-8e16-fee19d6c5f5b','birthdate','claim.name'),('831dd229-d39a-4d8a-8e16-fee19d6c5f5b','true','id.token.claim'),('831dd229-d39a-4d8a-8e16-fee19d6c5f5b','String','jsonType.label'),('831dd229-d39a-4d8a-8e16-fee19d6c5f5b','birthdate','user.attribute'),('831dd229-d39a-4d8a-8e16-fee19d6c5f5b','true','userinfo.token.claim'),('87481150-7540-4d61-82a1-1f3f6b112daf','true','access.token.claim'),('87481150-7540-4d61-82a1-1f3f6b112daf','nickname','claim.name'),('87481150-7540-4d61-82a1-1f3f6b112daf','true','id.token.claim'),('87481150-7540-4d61-82a1-1f3f6b112daf','String','jsonType.label'),('87481150-7540-4d61-82a1-1f3f6b112daf','nickname','user.attribute'),('87481150-7540-4d61-82a1-1f3f6b112daf','true','userinfo.token.claim'),('8e5909c8-3629-4333-8d85-8b20aedb1e9b','true','access.token.claim'),('8e5909c8-3629-4333-8d85-8b20aedb1e9b','true','id.token.claim'),('8e5909c8-3629-4333-8d85-8b20aedb1e9b','true','userinfo.token.claim'),('8f0ca3e9-cc41-40ff-9817-028c580bed2c','true','access.token.claim'),('8f0ca3e9-cc41-40ff-9817-028c580bed2c','profile','claim.name'),('8f0ca3e9-cc41-40ff-9817-028c580bed2c','true','id.token.claim'),('8f0ca3e9-cc41-40ff-9817-028c580bed2c','String','jsonType.label'),('8f0ca3e9-cc41-40ff-9817-028c580bed2c','profile','user.attribute'),('8f0ca3e9-cc41-40ff-9817-028c580bed2c','true','userinfo.token.claim'),('8fb9e927-4002-48f1-b397-610cb558841a','true','access.token.claim'),('8fb9e927-4002-48f1-b397-610cb558841a','phone_number','claim.name'),('8fb9e927-4002-48f1-b397-610cb558841a','true','id.token.claim'),('8fb9e927-4002-48f1-b397-610cb558841a','String','jsonType.label'),('8fb9e927-4002-48f1-b397-610cb558841a','phoneNumber','user.attribute'),('8fb9e927-4002-48f1-b397-610cb558841a','true','userinfo.token.claim'),('91ef3105-428f-4dfb-8960-3c591362e0e9','true','access.token.claim'),('91ef3105-428f-4dfb-8960-3c591362e0e9','updated_at','claim.name'),('91ef3105-428f-4dfb-8960-3c591362e0e9','true','id.token.claim'),('91ef3105-428f-4dfb-8960-3c591362e0e9','String','jsonType.label'),('91ef3105-428f-4dfb-8960-3c591362e0e9','updatedAt','user.attribute'),('91ef3105-428f-4dfb-8960-3c591362e0e9','true','userinfo.token.claim'),('97bd56b7-9789-418d-a6db-06a09b2547af','true','access.token.claim'),('97bd56b7-9789-418d-a6db-06a09b2547af','zoneinfo','claim.name'),('97bd56b7-9789-418d-a6db-06a09b2547af','true','id.token.claim'),('97bd56b7-9789-418d-a6db-06a09b2547af','String','jsonType.label'),('97bd56b7-9789-418d-a6db-06a09b2547af','zoneinfo','user.attribute'),('97bd56b7-9789-418d-a6db-06a09b2547af','true','userinfo.token.claim'),('98cf21c2-c110-4da7-9cb8-682528824bea','true','access.token.claim'),('98cf21c2-c110-4da7-9cb8-682528824bea','birthdate','claim.name'),('98cf21c2-c110-4da7-9cb8-682528824bea','true','id.token.claim'),('98cf21c2-c110-4da7-9cb8-682528824bea','String','jsonType.label'),('98cf21c2-c110-4da7-9cb8-682528824bea','birthdate','user.attribute'),('98cf21c2-c110-4da7-9cb8-682528824bea','true','userinfo.token.claim'),('9b6c7f99-490e-4020-a775-53c0eccf69d2','true','access.token.claim'),('9b6c7f99-490e-4020-a775-53c0eccf69d2','upn','claim.name'),('9b6c7f99-490e-4020-a775-53c0eccf69d2','true','id.token.claim'),('9b6c7f99-490e-4020-a775-53c0eccf69d2','String','jsonType.label'),('9b6c7f99-490e-4020-a775-53c0eccf69d2','username','user.attribute'),('9b6c7f99-490e-4020-a775-53c0eccf69d2','true','userinfo.token.claim'),('9cf348b2-c2c9-45fe-bc27-afd5492f6bcd','true','access.token.claim'),('9cf348b2-c2c9-45fe-bc27-afd5492f6bcd','family_name','claim.name'),('9cf348b2-c2c9-45fe-bc27-afd5492f6bcd','true','id.token.claim'),('9cf348b2-c2c9-45fe-bc27-afd5492f6bcd','String','jsonType.label'),('9cf348b2-c2c9-45fe-bc27-afd5492f6bcd','lastName','user.attribute'),('9cf348b2-c2c9-45fe-bc27-afd5492f6bcd','true','userinfo.token.claim'),('9da7f10f-1981-441f-9182-406492b3121d','true','access.token.claim'),('9da7f10f-1981-441f-9182-406492b3121d','preferred_username','claim.name'),('9da7f10f-1981-441f-9182-406492b3121d','true','id.token.claim'),('9da7f10f-1981-441f-9182-406492b3121d','String','jsonType.label'),('9da7f10f-1981-441f-9182-406492b3121d','username','user.attribute'),('9da7f10f-1981-441f-9182-406492b3121d','true','userinfo.token.claim'),('9e5f999e-7f87-4063-9d7b-6ff644669c21','true','access.token.claim'),('9e5f999e-7f87-4063-9d7b-6ff644669c21','nickname','claim.name'),('9e5f999e-7f87-4063-9d7b-6ff644669c21','true','id.token.claim'),('9e5f999e-7f87-4063-9d7b-6ff644669c21','String','jsonType.label'),('9e5f999e-7f87-4063-9d7b-6ff644669c21','nickname','user.attribute'),('9e5f999e-7f87-4063-9d7b-6ff644669c21','true','userinfo.token.claim'),('ad96d012-00bb-4454-8110-98f82fae50e4','true','access.token.claim'),('ad96d012-00bb-4454-8110-98f82fae50e4','locale','claim.name'),('ad96d012-00bb-4454-8110-98f82fae50e4','true','id.token.claim'),('ad96d012-00bb-4454-8110-98f82fae50e4','String','jsonType.label'),('ad96d012-00bb-4454-8110-98f82fae50e4','locale','user.attribute'),('ad96d012-00bb-4454-8110-98f82fae50e4','true','userinfo.token.claim'),('b129b920-cce4-4ece-be6b-02204d164200','Role','attribute.name'),('b129b920-cce4-4ece-be6b-02204d164200','Basic','attribute.nameformat'),('b129b920-cce4-4ece-be6b-02204d164200','false','single'),('b1c7cd92-2a75-4b53-a476-373167296817','Role','attribute.name'),('b1c7cd92-2a75-4b53-a476-373167296817','Basic','attribute.nameformat'),('b1c7cd92-2a75-4b53-a476-373167296817','false','single'),('b47b6d19-5f98-4ed9-b95b-97d32e963750','true','access.token.claim'),('b47b6d19-5f98-4ed9-b95b-97d32e963750','phone_number_verified','claim.name'),('b47b6d19-5f98-4ed9-b95b-97d32e963750','true','id.token.claim'),('b47b6d19-5f98-4ed9-b95b-97d32e963750','boolean','jsonType.label'),('b47b6d19-5f98-4ed9-b95b-97d32e963750','phoneNumberVerified','user.attribute'),('b47b6d19-5f98-4ed9-b95b-97d32e963750','true','userinfo.token.claim'),('b8efc5cd-023f-48c9-ad9c-adbbf12c78ef','true','access.token.claim'),('b8efc5cd-023f-48c9-ad9c-adbbf12c78ef','locale','claim.name'),('b8efc5cd-023f-48c9-ad9c-adbbf12c78ef','true','id.token.claim'),('b8efc5cd-023f-48c9-ad9c-adbbf12c78ef','String','jsonType.label'),('b8efc5cd-023f-48c9-ad9c-adbbf12c78ef','locale','user.attribute'),('b8efc5cd-023f-48c9-ad9c-adbbf12c78ef','true','userinfo.token.claim'),('bacad940-c90f-4dff-b33b-f4762a319fe9','true','access.token.claim'),('bacad940-c90f-4dff-b33b-f4762a319fe9','email_verified','claim.name'),('bacad940-c90f-4dff-b33b-f4762a319fe9','true','id.token.claim'),('bacad940-c90f-4dff-b33b-f4762a319fe9','boolean','jsonType.label'),('bacad940-c90f-4dff-b33b-f4762a319fe9','emailVerified','user.attribute'),('bacad940-c90f-4dff-b33b-f4762a319fe9','true','userinfo.token.claim'),('bbbab1f7-1288-4b6c-a9c4-85cb37617e6d','true','access.token.claim'),('bbbab1f7-1288-4b6c-a9c4-85cb37617e6d','email_verified','claim.name'),('bbbab1f7-1288-4b6c-a9c4-85cb37617e6d','true','id.token.claim'),('bbbab1f7-1288-4b6c-a9c4-85cb37617e6d','boolean','jsonType.label'),('bbbab1f7-1288-4b6c-a9c4-85cb37617e6d','emailVerified','user.attribute'),('bbbab1f7-1288-4b6c-a9c4-85cb37617e6d','true','userinfo.token.claim'),('bc67ae1e-2bf3-46c6-a2b2-d0d40eae5a0b','true','access.token.claim'),('bc67ae1e-2bf3-46c6-a2b2-d0d40eae5a0b','realm_access.roles','claim.name'),('bc67ae1e-2bf3-46c6-a2b2-d0d40eae5a0b','String','jsonType.label'),('bc67ae1e-2bf3-46c6-a2b2-d0d40eae5a0b','true','multivalued'),('bc67ae1e-2bf3-46c6-a2b2-d0d40eae5a0b','foo','user.attribute'),('bf52c9bd-6301-4b93-8656-d40879705d19','true','access.token.claim'),('bf52c9bd-6301-4b93-8656-d40879705d19','email','claim.name'),('bf52c9bd-6301-4b93-8656-d40879705d19','true','id.token.claim'),('bf52c9bd-6301-4b93-8656-d40879705d19','String','jsonType.label'),('bf52c9bd-6301-4b93-8656-d40879705d19','email','user.attribute'),('bf52c9bd-6301-4b93-8656-d40879705d19','true','userinfo.token.claim'),('c043131e-526e-46d2-9c38-07bf86f282d7','true','access.token.claim'),('c043131e-526e-46d2-9c38-07bf86f282d7','website','claim.name'),('c043131e-526e-46d2-9c38-07bf86f282d7','true','id.token.claim'),('c043131e-526e-46d2-9c38-07bf86f282d7','String','jsonType.label'),('c043131e-526e-46d2-9c38-07bf86f282d7','website','user.attribute'),('c043131e-526e-46d2-9c38-07bf86f282d7','true','userinfo.token.claim'),('c2c71eff-5943-4853-af28-a9d5ffed85ff','true','access.token.claim'),('c2c71eff-5943-4853-af28-a9d5ffed85ff','profile','claim.name'),('c2c71eff-5943-4853-af28-a9d5ffed85ff','true','id.token.claim'),('c2c71eff-5943-4853-af28-a9d5ffed85ff','String','jsonType.label'),('c2c71eff-5943-4853-af28-a9d5ffed85ff','profile','user.attribute'),('c2c71eff-5943-4853-af28-a9d5ffed85ff','true','userinfo.token.claim'),('c6a87046-5b65-43ee-b09c-48ecd0bd21b7','true','access.token.claim'),('c6a87046-5b65-43ee-b09c-48ecd0bd21b7','keycloak','claim.name'),('c6a87046-5b65-43ee-b09c-48ecd0bd21b7','true','id.token.claim'),('c6a87046-5b65-43ee-b09c-48ecd0bd21b7','true','multivalued'),('c6a87046-5b65-43ee-b09c-48ecd0bd21b7','true','userinfo.token.claim'),('c6a87046-5b65-43ee-b09c-48ecd0bd21b7','keycloak','usermodel.realmRoleMapping.rolePrefix'),('cb0c83e1-0389-4d6f-8584-80bb5c3522f4','true','access.token.claim'),('cb0c83e1-0389-4d6f-8584-80bb5c3522f4','true','id.token.claim'),('cb0c83e1-0389-4d6f-8584-80bb5c3522f4','country','user.attribute.country'),('cb0c83e1-0389-4d6f-8584-80bb5c3522f4','formatted','user.attribute.formatted'),('cb0c83e1-0389-4d6f-8584-80bb5c3522f4','locality','user.attribute.locality'),('cb0c83e1-0389-4d6f-8584-80bb5c3522f4','postal_code','user.attribute.postal_code'),('cb0c83e1-0389-4d6f-8584-80bb5c3522f4','region','user.attribute.region'),('cb0c83e1-0389-4d6f-8584-80bb5c3522f4','street','user.attribute.street'),('cb0c83e1-0389-4d6f-8584-80bb5c3522f4','true','userinfo.token.claim'),('cc1e9084-8b31-47ff-9c1a-bc067b4dab82','true','access.token.claim'),('cc1e9084-8b31-47ff-9c1a-bc067b4dab82','preferred_username','claim.name'),('cc1e9084-8b31-47ff-9c1a-bc067b4dab82','true','id.token.claim'),('cc1e9084-8b31-47ff-9c1a-bc067b4dab82','String','jsonType.label'),('cc1e9084-8b31-47ff-9c1a-bc067b4dab82','username','user.attribute'),('cc1e9084-8b31-47ff-9c1a-bc067b4dab82','true','userinfo.token.claim'),('cea0c410-cbc6-4bbc-82cb-27163029cb3b','true','access.token.claim'),('cea0c410-cbc6-4bbc-82cb-27163029cb3b','given_name','claim.name'),('cea0c410-cbc6-4bbc-82cb-27163029cb3b','true','id.token.claim'),('cea0c410-cbc6-4bbc-82cb-27163029cb3b','String','jsonType.label'),('cea0c410-cbc6-4bbc-82cb-27163029cb3b','firstName','user.attribute'),('cea0c410-cbc6-4bbc-82cb-27163029cb3b','true','userinfo.token.claim'),('cfaecbbd-e369-4f50-b59c-e09538251e60','true','access.token.claim'),('cfaecbbd-e369-4f50-b59c-e09538251e60','resource_access.${client_id}.roles','claim.name'),('cfaecbbd-e369-4f50-b59c-e09538251e60','String','jsonType.label'),('cfaecbbd-e369-4f50-b59c-e09538251e60','true','multivalued'),('cfaecbbd-e369-4f50-b59c-e09538251e60','foo','user.attribute'),('d6e1a3da-c7d9-40b6-9c52-f138fea28c3d','true','access.token.claim'),('d6e1a3da-c7d9-40b6-9c52-f138fea28c3d','true','id.token.claim'),('d6e1a3da-c7d9-40b6-9c52-f138fea28c3d','country','user.attribute.country'),('d6e1a3da-c7d9-40b6-9c52-f138fea28c3d','formatted','user.attribute.formatted'),('d6e1a3da-c7d9-40b6-9c52-f138fea28c3d','locality','user.attribute.locality'),('d6e1a3da-c7d9-40b6-9c52-f138fea28c3d','postal_code','user.attribute.postal_code'),('d6e1a3da-c7d9-40b6-9c52-f138fea28c3d','region','user.attribute.region'),('d6e1a3da-c7d9-40b6-9c52-f138fea28c3d','street','user.attribute.street'),('d6e1a3da-c7d9-40b6-9c52-f138fea28c3d','true','userinfo.token.claim'),('d8233f73-df26-4459-a4aa-e85078d85dd1','true','access.token.claim'),('d8233f73-df26-4459-a4aa-e85078d85dd1','zoneinfo','claim.name'),('d8233f73-df26-4459-a4aa-e85078d85dd1','true','id.token.claim'),('d8233f73-df26-4459-a4aa-e85078d85dd1','String','jsonType.label'),('d8233f73-df26-4459-a4aa-e85078d85dd1','zoneinfo','user.attribute'),('d8233f73-df26-4459-a4aa-e85078d85dd1','true','userinfo.token.claim'),('dca332f6-7810-4e1a-8b1a-31f38dce11de','true','access.token.claim'),('dca332f6-7810-4e1a-8b1a-31f38dce11de','locale','claim.name'),('dca332f6-7810-4e1a-8b1a-31f38dce11de','true','id.token.claim'),('dca332f6-7810-4e1a-8b1a-31f38dce11de','String','jsonType.label'),('dca332f6-7810-4e1a-8b1a-31f38dce11de','locale','user.attribute'),('dca332f6-7810-4e1a-8b1a-31f38dce11de','true','userinfo.token.claim'),('dddee531-8bde-43dc-b50b-231bf04c0770','true','access.token.claim'),('dddee531-8bde-43dc-b50b-231bf04c0770','resource_access.${client_id}.roles','claim.name'),('dddee531-8bde-43dc-b50b-231bf04c0770','String','jsonType.label'),('dddee531-8bde-43dc-b50b-231bf04c0770','true','multivalued'),('dddee531-8bde-43dc-b50b-231bf04c0770','foo','user.attribute'),('de065098-17f2-45d6-ae44-1b9319385569','true','access.token.claim'),('de065098-17f2-45d6-ae44-1b9319385569','upn','claim.name'),('de065098-17f2-45d6-ae44-1b9319385569','true','id.token.claim'),('de065098-17f2-45d6-ae44-1b9319385569','String','jsonType.label'),('de065098-17f2-45d6-ae44-1b9319385569','username','user.attribute'),('de065098-17f2-45d6-ae44-1b9319385569','true','userinfo.token.claim'),('e38d40c2-fb6f-4578-9d2c-df7b7b3a2832','true','access.token.claim'),('e38d40c2-fb6f-4578-9d2c-df7b7b3a2832','resource_access.${client_id}.roles','claim.name'),('e38d40c2-fb6f-4578-9d2c-df7b7b3a2832','String','jsonType.label'),('e38d40c2-fb6f-4578-9d2c-df7b7b3a2832','true','multivalued'),('e38d40c2-fb6f-4578-9d2c-df7b7b3a2832','foo','user.attribute'),('e50bd062-3460-4ed5-b62a-8591920e59de','true','access.token.claim'),('e50bd062-3460-4ed5-b62a-8591920e59de','birthdate','claim.name'),('e50bd062-3460-4ed5-b62a-8591920e59de','true','id.token.claim'),('e50bd062-3460-4ed5-b62a-8591920e59de','String','jsonType.label'),('e50bd062-3460-4ed5-b62a-8591920e59de','birthdate','user.attribute'),('e50bd062-3460-4ed5-b62a-8591920e59de','true','userinfo.token.claim'),('f509c6c9-db3c-4d1b-af4c-d2a8bc5876a5','true','access.token.claim'),('f509c6c9-db3c-4d1b-af4c-d2a8bc5876a5','picture','claim.name'),('f509c6c9-db3c-4d1b-af4c-d2a8bc5876a5','true','id.token.claim'),('f509c6c9-db3c-4d1b-af4c-d2a8bc5876a5','String','jsonType.label'),('f509c6c9-db3c-4d1b-af4c-d2a8bc5876a5','picture','user.attribute'),('f509c6c9-db3c-4d1b-af4c-d2a8bc5876a5','true','userinfo.token.claim'),('fa3526c0-622c-43b6-a35c-6c9e277b9407','true','access.token.claim'),('fa3526c0-622c-43b6-a35c-6c9e277b9407','picture','claim.name'),('fa3526c0-622c-43b6-a35c-6c9e277b9407','true','id.token.claim'),('fa3526c0-622c-43b6-a35c-6c9e277b9407','String','jsonType.label'),('fa3526c0-622c-43b6-a35c-6c9e277b9407','picture','user.attribute'),('fa3526c0-622c-43b6-a35c-6c9e277b9407','true','userinfo.token.claim'),('fa574764-485b-48c0-a666-e1d5ac4ea286','true','access.token.claim'),('fa574764-485b-48c0-a666-e1d5ac4ea286','locale','claim.name'),('fa574764-485b-48c0-a666-e1d5ac4ea286','true','id.token.claim'),('fa574764-485b-48c0-a666-e1d5ac4ea286','String','jsonType.label'),('fa574764-485b-48c0-a666-e1d5ac4ea286','locale','user.attribute'),('fa574764-485b-48c0-a666-e1d5ac4ea286','true','userinfo.token.claim'),('fe322671-681c-4460-89e9-fb2cce6589ea','true','access.token.claim'),('fe322671-681c-4460-89e9-fb2cce6589ea','picture','claim.name'),('fe322671-681c-4460-89e9-fb2cce6589ea','true','id.token.claim'),('fe322671-681c-4460-89e9-fb2cce6589ea','String','jsonType.label'),('fe322671-681c-4460-89e9-fb2cce6589ea','picture','user.attribute'),('fe322671-681c-4460-89e9-fb2cce6589ea','true','userinfo.token.claim');
/*!40000 ALTER TABLE `protocol_mapper_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realm`
--

DROP TABLE IF EXISTS `realm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realm` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `ACCESS_CODE_LIFESPAN` int DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADMIN_THEME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL_THEME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint DEFAULT NULL,
  `LOGIN_THEME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PASSWORD_POLICY` text COLLATE utf8_unicode_ci,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGIN_LIFESPAN` int DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int DEFAULT '0',
  `OTP_POLICY_WINDOW` int DEFAULT '1',
  `OTP_POLICY_PERIOD` int DEFAULT '30',
  `OTP_POLICY_DIGITS` int DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) COLLATE utf8_unicode_ci DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) COLLATE utf8_unicode_ci DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `DOCKER_AUTH_FLOW` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int DEFAULT '0',
  `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int NOT NULL,
  `DEFAULT_ROLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realm`
--

LOCK TABLES `realm` WRITE;
/*!40000 ALTER TABLE `realm` DISABLE KEYS */;
INSERT INTO `realm` VALUES ('ecommerce',300,300,180,'ecommerce','keycloak',NULL,_binary '',_binary '\0',0,'ecommerce','ecommerce',1643217440,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','5927e3ac-1c44-4cad-ba3f-7a257f4c4590',1800,_binary '\0','en',_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','ccac688b-2d66-4169-8282-08311862ec91','f87a631e-3e55-4f48-8b06-6c5ec9325caa','c4600205-6a60-406b-b96c-a596c430d752','2f9a76c3-e197-47a8-b9da-d76df25cb60e','b2866354-8297-4a9f-a16d-75d3effc1bdd',2592000,_binary '\0',900,_binary '',_binary '\0','87889594-e98a-4638-b03f-e0c43cd6a329',0,_binary '\0',0,0,'6ce5a60b-c48f-49c0-a81c-1242b5766cf9'),('master',60,300,60,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'master',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','5b5c1cc1-81f5-4f48-930d-76bd7a5153d9',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','bd8a3105-d529-47a4-9552-33cb0dc68176','0e781be3-41dd-47fc-9bbd-45de13a2722d','17080ecc-2717-49c5-9889-d26397832e45','f8fd5751-144a-4e37-b84c-da0385e97ed3','a4f63335-59c5-45a0-9ac6-9d8bd45e1175',2592000,_binary '\0',900,_binary '',_binary '\0','03354e26-4d9a-473f-afeb-3f29d8dcfaf9',0,_binary '\0',0,0,'125c2669-ad81-4b5b-a708-00c8655a648d'),('teste',60,300,300,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'teste',0,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','d9e5f172-c255-4f81-98c5-eae6c26a4b61',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','f5c2ea22-5cff-4e5b-bfbf-63c7d6286921','70c34686-1e57-4869-9b36-39e067c34e1a','a675a501-311d-42b6-9e0c-8375d35d4835','ee5b39e2-9680-4552-89e2-df3c77d2592b','09e09255-e7c5-4407-8dbc-ff6169645f38',2592000,_binary '\0',900,_binary '',_binary '\0','6080b261-724b-491e-be52-2f93fdacfbdb',0,_binary '\0',0,0,'418e8675-24f1-4b9c-b821-b67276586b31');
/*!40000 ALTER TABLE `realm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realm_attribute`
--

DROP TABLE IF EXISTS `realm_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realm_attribute` (
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realm_attribute`
--

LOCK TABLES `realm_attribute` WRITE;
/*!40000 ALTER TABLE `realm_attribute` DISABLE KEYS */;
INSERT INTO `realm_attribute` VALUES ('_browser_header.contentSecurityPolicy','ecommerce','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicy','master','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicy','teste','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicyReportOnly','ecommerce',''),('_browser_header.contentSecurityPolicyReportOnly','master',''),('_browser_header.contentSecurityPolicyReportOnly','teste',''),('_browser_header.strictTransportSecurity','ecommerce','max-age=31536000; includeSubDomains'),('_browser_header.strictTransportSecurity','master','max-age=31536000; includeSubDomains'),('_browser_header.strictTransportSecurity','teste','max-age=31536000; includeSubDomains'),('_browser_header.xContentTypeOptions','ecommerce','nosniff'),('_browser_header.xContentTypeOptions','master','nosniff'),('_browser_header.xContentTypeOptions','teste','nosniff'),('_browser_header.xFrameOptions','ecommerce','SAMEORIGIN'),('_browser_header.xFrameOptions','master','SAMEORIGIN'),('_browser_header.xFrameOptions','teste','SAMEORIGIN'),('_browser_header.xRobotsTag','ecommerce','none'),('_browser_header.xRobotsTag','master','none'),('_browser_header.xRobotsTag','teste','none'),('_browser_header.xXSSProtection','ecommerce','1; mode=block'),('_browser_header.xXSSProtection','master','1; mode=block'),('_browser_header.xXSSProtection','teste','1; mode=block'),('actionTokenGeneratedByAdminLifespan','ecommerce','43200'),('actionTokenGeneratedByAdminLifespan','master','43200'),('actionTokenGeneratedByAdminLifespan','teste','43200'),('actionTokenGeneratedByUserLifespan','ecommerce','300'),('actionTokenGeneratedByUserLifespan','master','300'),('actionTokenGeneratedByUserLifespan','teste','300'),('bruteForceProtected','ecommerce','false'),('bruteForceProtected','master','false'),('bruteForceProtected','teste','false'),('cibaAuthRequestedUserHint','ecommerce','login_hint'),('cibaAuthRequestedUserHint','master','login_hint'),('cibaAuthRequestedUserHint','teste','login_hint'),('cibaBackchannelTokenDeliveryMode','ecommerce','poll'),('cibaBackchannelTokenDeliveryMode','master','poll'),('cibaBackchannelTokenDeliveryMode','teste','poll'),('cibaExpiresIn','ecommerce','120'),('cibaExpiresIn','master','120'),('cibaExpiresIn','teste','120'),('cibaInterval','ecommerce','5'),('cibaInterval','master','5'),('cibaInterval','teste','5'),('client-policies.policies','ecommerce','{\"policies\":[]}'),('client-policies.policies','master','{\"policies\":[]}'),('client-policies.policies','teste','{\"policies\":[]}'),('client-policies.profiles','ecommerce','{\"profiles\":[]}'),('client-policies.profiles','master','{\"profiles\":[]}'),('client-policies.profiles','teste','{\"profiles\":[]}'),('clientOfflineSessionIdleTimeout','ecommerce','0'),('clientOfflineSessionIdleTimeout','master','0'),('clientOfflineSessionIdleTimeout','teste','0'),('clientOfflineSessionMaxLifespan','ecommerce','0'),('clientOfflineSessionMaxLifespan','master','0'),('clientOfflineSessionMaxLifespan','teste','0'),('clientSessionIdleTimeout','ecommerce','0'),('clientSessionIdleTimeout','master','0'),('clientSessionIdleTimeout','teste','0'),('clientSessionMaxLifespan','ecommerce','0'),('clientSessionMaxLifespan','master','0'),('clientSessionMaxLifespan','teste','0'),('defaultSignatureAlgorithm','ecommerce','RS256'),('defaultSignatureAlgorithm','master','RS256'),('defaultSignatureAlgorithm','teste','RS256'),('displayName','master','Keycloak'),('displayNameHtml','master','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),('failureFactor','ecommerce','30'),('failureFactor','master','30'),('failureFactor','teste','30'),('maxDeltaTimeSeconds','ecommerce','43200'),('maxDeltaTimeSeconds','master','43200'),('maxDeltaTimeSeconds','teste','43200'),('maxFailureWaitSeconds','ecommerce','900'),('maxFailureWaitSeconds','master','900'),('maxFailureWaitSeconds','teste','900'),('minimumQuickLoginWaitSeconds','ecommerce','60'),('minimumQuickLoginWaitSeconds','master','60'),('minimumQuickLoginWaitSeconds','teste','60'),('oauth2DeviceCodeLifespan','ecommerce','600'),('oauth2DeviceCodeLifespan','master','600'),('oauth2DeviceCodeLifespan','teste','600'),('oauth2DevicePollingInterval','ecommerce','5'),('oauth2DevicePollingInterval','master','600'),('oauth2DevicePollingInterval','teste','5'),('offlineSessionMaxLifespan','ecommerce','5184000'),('offlineSessionMaxLifespan','master','5184000'),('offlineSessionMaxLifespan','teste','5184000'),('offlineSessionMaxLifespanEnabled','ecommerce','false'),('offlineSessionMaxLifespanEnabled','master','false'),('offlineSessionMaxLifespanEnabled','teste','false'),('parRequestUriLifespan','ecommerce','60'),('parRequestUriLifespan','master','60'),('parRequestUriLifespan','teste','60'),('permanentLockout','ecommerce','false'),('permanentLockout','master','false'),('permanentLockout','teste','false'),('quickLoginCheckMilliSeconds','ecommerce','1000'),('quickLoginCheckMilliSeconds','master','1000'),('quickLoginCheckMilliSeconds','teste','1000'),('waitIncrementSeconds','ecommerce','60'),('waitIncrementSeconds','master','60'),('waitIncrementSeconds','teste','60'),('webAuthnPolicyAttestationConveyancePreference','ecommerce','not specified'),('webAuthnPolicyAttestationConveyancePreference','master','not specified'),('webAuthnPolicyAttestationConveyancePreference','teste','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','ecommerce','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','master','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','teste','not specified'),('webAuthnPolicyAuthenticatorAttachment','ecommerce','not specified'),('webAuthnPolicyAuthenticatorAttachment','master','not specified'),('webAuthnPolicyAuthenticatorAttachment','teste','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','ecommerce','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','master','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','teste','not specified'),('webAuthnPolicyAvoidSameAuthenticatorRegister','ecommerce','false'),('webAuthnPolicyAvoidSameAuthenticatorRegister','master','false'),('webAuthnPolicyAvoidSameAuthenticatorRegister','teste','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','ecommerce','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','master','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','teste','false'),('webAuthnPolicyCreateTimeout','ecommerce','0'),('webAuthnPolicyCreateTimeout','master','0'),('webAuthnPolicyCreateTimeout','teste','0'),('webAuthnPolicyCreateTimeoutPasswordless','ecommerce','0'),('webAuthnPolicyCreateTimeoutPasswordless','master','0'),('webAuthnPolicyCreateTimeoutPasswordless','teste','0'),('webAuthnPolicyRequireResidentKey','ecommerce','not specified'),('webAuthnPolicyRequireResidentKey','master','not specified'),('webAuthnPolicyRequireResidentKey','teste','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','ecommerce','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','master','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','teste','not specified'),('webAuthnPolicyRpEntityName','ecommerce','keycloak'),('webAuthnPolicyRpEntityName','master','keycloak'),('webAuthnPolicyRpEntityName','teste','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','ecommerce','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','master','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','teste','keycloak'),('webAuthnPolicyRpId','ecommerce',''),('webAuthnPolicyRpId','master',''),('webAuthnPolicyRpId','teste',''),('webAuthnPolicyRpIdPasswordless','ecommerce',''),('webAuthnPolicyRpIdPasswordless','master',''),('webAuthnPolicyRpIdPasswordless','teste',''),('webAuthnPolicySignatureAlgorithms','ecommerce','ES256'),('webAuthnPolicySignatureAlgorithms','master','ES256'),('webAuthnPolicySignatureAlgorithms','teste','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','ecommerce','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','master','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','teste','ES256'),('webAuthnPolicyUserVerificationRequirement','ecommerce','not specified'),('webAuthnPolicyUserVerificationRequirement','master','not specified'),('webAuthnPolicyUserVerificationRequirement','teste','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','ecommerce','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','master','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','teste','not specified');
/*!40000 ALTER TABLE `realm_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realm_default_groups`
--

DROP TABLE IF EXISTS `realm_default_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realm_default_groups` (
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realm_default_groups`
--

LOCK TABLES `realm_default_groups` WRITE;
/*!40000 ALTER TABLE `realm_default_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `realm_default_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realm_enabled_event_types`
--

DROP TABLE IF EXISTS `realm_enabled_event_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realm_enabled_event_types` (
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realm_enabled_event_types`
--

LOCK TABLES `realm_enabled_event_types` WRITE;
/*!40000 ALTER TABLE `realm_enabled_event_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `realm_enabled_event_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realm_events_listeners`
--

DROP TABLE IF EXISTS `realm_events_listeners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realm_events_listeners` (
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realm_events_listeners`
--

LOCK TABLES `realm_events_listeners` WRITE;
/*!40000 ALTER TABLE `realm_events_listeners` DISABLE KEYS */;
INSERT INTO `realm_events_listeners` VALUES ('ecommerce','jboss-logging'),('master','jboss-logging'),('teste','jboss-logging');
/*!40000 ALTER TABLE `realm_events_listeners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realm_localizations`
--

DROP TABLE IF EXISTS `realm_localizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realm_localizations` (
  `REALM_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LOCALE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TEXTS` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`LOCALE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realm_localizations`
--

LOCK TABLES `realm_localizations` WRITE;
/*!40000 ALTER TABLE `realm_localizations` DISABLE KEYS */;
/*!40000 ALTER TABLE `realm_localizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realm_required_credential`
--

DROP TABLE IF EXISTS `realm_required_credential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realm_required_credential` (
  `TYPE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FORM_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realm_required_credential`
--

LOCK TABLES `realm_required_credential` WRITE;
/*!40000 ALTER TABLE `realm_required_credential` DISABLE KEYS */;
INSERT INTO `realm_required_credential` VALUES ('password','password',_binary '',_binary '','ecommerce'),('password','password',_binary '',_binary '','master'),('password','password',_binary '',_binary '','teste');
/*!40000 ALTER TABLE `realm_required_credential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realm_smtp_config`
--

DROP TABLE IF EXISTS `realm_smtp_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realm_smtp_config` (
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realm_smtp_config`
--

LOCK TABLES `realm_smtp_config` WRITE;
/*!40000 ALTER TABLE `realm_smtp_config` DISABLE KEYS */;
INSERT INTO `realm_smtp_config` VALUES ('master','','auth'),('master','empresa@email.com','from'),('master','127.0.0.1','host'),('master','2525','port'),('master','','ssl'),('master','','starttls');
/*!40000 ALTER TABLE `realm_smtp_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realm_supported_locales`
--

DROP TABLE IF EXISTS `realm_supported_locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realm_supported_locales` (
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realm_supported_locales`
--

LOCK TABLES `realm_supported_locales` WRITE;
/*!40000 ALTER TABLE `realm_supported_locales` DISABLE KEYS */;
INSERT INTO `realm_supported_locales` VALUES ('ecommerce','ca'),('ecommerce','cs'),('ecommerce','da'),('ecommerce','de'),('ecommerce','en'),('ecommerce','es'),('ecommerce','fr'),('ecommerce','hu'),('ecommerce','it'),('ecommerce','ja'),('ecommerce','lt'),('ecommerce','nl'),('ecommerce','no'),('ecommerce','pl'),('ecommerce','pt-BR'),('ecommerce','ru'),('ecommerce','sk'),('ecommerce','sv'),('ecommerce','tr'),('ecommerce','zh-CN');
/*!40000 ALTER TABLE `realm_supported_locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redirect_uris`
--

DROP TABLE IF EXISTS `redirect_uris`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `redirect_uris` (
  `CLIENT_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redirect_uris`
--

LOCK TABLES `redirect_uris` WRITE;
/*!40000 ALTER TABLE `redirect_uris` DISABLE KEYS */;
INSERT INTO `redirect_uris` VALUES ('1552a7c5-a7fc-4aa9-ba43-1acafcbcb7a7','/admin/ecommerce/console/*'),('2572573e-8bf0-499c-b556-af0edcd22ce3','/admin/teste/console/*'),('289b03fd-53d1-432d-ad18-16d809920475','http://localhost:3000/*'),('3ab1a78f-5cc4-4cf9-b523-a96f34c9565a','/realms/ecommerce/account/*'),('3ee60457-8e9f-4165-89ee-781dd69c8eae','/realms/teste/account/*'),('4019a917-a2c0-411b-b786-1d7d39e78c0b','/realms/master/account/*'),('45759025-c500-44f8-9792-05e9d08b5ba0','/realms/teste/account/*'),('5a71649f-df11-4101-9a6b-ca68c5140314','/realms/master/account/*'),('d2b83dc4-9823-4e9b-95c0-c39c8b667eb4','/realms/ecommerce/account/*'),('ee662877-97f9-4147-9631-b92ce80cc566','/admin/master/console/*');
/*!40000 ALTER TABLE `redirect_uris` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `required_action_config`
--

DROP TABLE IF EXISTS `required_action_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `required_action_config` (
  `REQUIRED_ACTION_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` longtext COLLATE utf8_unicode_ci,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `required_action_config`
--

LOCK TABLES `required_action_config` WRITE;
/*!40000 ALTER TABLE `required_action_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `required_action_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `required_action_provider`
--

DROP TABLE IF EXISTS `required_action_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `required_action_provider` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `ALIAS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `required_action_provider`
--

LOCK TABLES `required_action_provider` WRITE;
/*!40000 ALTER TABLE `required_action_provider` DISABLE KEYS */;
INSERT INTO `required_action_provider` VALUES ('0c5fd078-dfc3-4637-a072-43dd1a2b3840','terms_and_conditions','Terms and Conditions','teste',_binary '\0',_binary '\0','terms_and_conditions',20),('15a6561a-12f6-4f97-9429-a6e4d22d0272','update_user_locale','Update User Locale','ecommerce',_binary '',_binary '\0','update_user_locale',1000),('3096eca2-6c2d-45d0-a2b7-958d380c7c57','delete_account','Delete Account','ecommerce',_binary '\0',_binary '\0','delete_account',60),('3404da8e-8187-4729-b956-78c44d6fb061','CONFIGURE_TOTP','Configure OTP','ecommerce',_binary '',_binary '\0','CONFIGURE_TOTP',10),('3781d26b-3c6a-459d-8882-65b1a626d9be','UPDATE_PASSWORD','Update Password','master',_binary '',_binary '\0','UPDATE_PASSWORD',30),('37a2cad3-dad9-4e9c-adea-6b1d84cb71b9','CONFIGURE_TOTP','Configure OTP','master',_binary '',_binary '\0','CONFIGURE_TOTP',10),('47570202-73bf-48d6-b683-088a4092e4ad','VERIFY_EMAIL','Verify Email','master',_binary '',_binary '\0','VERIFY_EMAIL',50),('4e3f7b49-43fe-4cd0-990a-c0019a9a5163','UPDATE_PROFILE','Update Profile','master',_binary '',_binary '\0','UPDATE_PROFILE',40),('61c1fca3-5ec9-40ed-add7-ff5a616e26d3','UPDATE_PASSWORD','Update Password','teste',_binary '',_binary '\0','UPDATE_PASSWORD',30),('68a00c78-cc77-4475-abbc-70f55c6467df','CONFIGURE_TOTP','Configure OTP','teste',_binary '',_binary '\0','CONFIGURE_TOTP',10),('690af15a-ea2c-4218-bf26-24f6e742531a','UPDATE_PROFILE','Update Profile','ecommerce',_binary '',_binary '\0','UPDATE_PROFILE',40),('83979dfa-5b84-4512-aa68-ada2ce218136','terms_and_conditions','Terms and Conditions','ecommerce',_binary '\0',_binary '\0','terms_and_conditions',20),('873e0a6a-7225-4b88-be8e-cc1e86af7944','terms_and_conditions','Terms and Conditions','master',_binary '\0',_binary '\0','terms_and_conditions',20),('aefb79e1-b251-4622-87e5-1e1135b04478','update_user_locale','Update User Locale','master',_binary '',_binary '\0','update_user_locale',1000),('b24435dd-064d-498b-9d6b-a5cb5669a01d','VERIFY_EMAIL','Verify Email','ecommerce',_binary '',_binary '\0','VERIFY_EMAIL',50),('baf83af5-d0ae-4507-940e-f371a56d9bce','update_user_locale','Update User Locale','teste',_binary '',_binary '\0','update_user_locale',1000),('cdade3cd-dcbb-4559-a811-8b971d5b54cb','UPDATE_PROFILE','Update Profile','teste',_binary '',_binary '\0','UPDATE_PROFILE',40),('e3a994b2-1a98-465d-bdf1-616a6f57164b','delete_account','Delete Account','teste',_binary '\0',_binary '\0','delete_account',60),('e8b17150-3a58-471a-9a69-3bc4c37cfd23','UPDATE_PASSWORD','Update Password','ecommerce',_binary '',_binary '\0','UPDATE_PASSWORD',30),('efe4a5cc-0e18-40f3-9868-7ada298da2a2','delete_account','Delete Account','master',_binary '\0',_binary '\0','delete_account',60),('fa9a6d0b-87fb-458e-9f58-0e58beace89d','VERIFY_EMAIL','Verify Email','teste',_binary '',_binary '\0','VERIFY_EMAIL',50);
/*!40000 ALTER TABLE `required_action_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_attribute`
--

DROP TABLE IF EXISTS `resource_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_attribute` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESOURCE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `resource_server_resource` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_attribute`
--

LOCK TABLES `resource_attribute` WRITE;
/*!40000 ALTER TABLE `resource_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_policy`
--

DROP TABLE IF EXISTS `resource_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_policy` (
  `RESOURCE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `POLICY_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `resource_server_resource` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_policy`
--

LOCK TABLES `resource_policy` WRITE;
/*!40000 ALTER TABLE `resource_policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_scope`
--

DROP TABLE IF EXISTS `resource_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_scope` (
  `RESOURCE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `resource_server_resource` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `resource_server_scope` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_scope`
--

LOCK TABLES `resource_scope` WRITE;
/*!40000 ALTER TABLE `resource_scope` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_server`
--

DROP TABLE IF EXISTS `resource_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_server` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `DECISION_STRATEGY` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_server`
--

LOCK TABLES `resource_server` WRITE;
/*!40000 ALTER TABLE `resource_server` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_server_perm_ticket`
--

DROP TABLE IF EXISTS `resource_server_perm_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_server_perm_ticket` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUESTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint NOT NULL,
  `GRANTED_TIMESTAMP` bigint DEFAULT NULL,
  `RESOURCE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `POLICY_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `resource_server` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `resource_server_resource` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `resource_server_scope` (`ID`),
  CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_server_perm_ticket`
--

LOCK TABLES `resource_server_perm_ticket` WRITE;
/*!40000 ALTER TABLE `resource_server_perm_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_server_perm_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_server_policy`
--

DROP TABLE IF EXISTS `resource_server_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_server_policy` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TYPE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DECISION_STRATEGY` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGIC` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OWNER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `resource_server` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_server_policy`
--

LOCK TABLES `resource_server_policy` WRITE;
/*!40000 ALTER TABLE `resource_server_policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_server_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_server_resource`
--

DROP TABLE IF EXISTS `resource_server_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_server_resource` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ICON_URI` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OWNER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `DISPLAY_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `resource_server` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_server_resource`
--

LOCK TABLES `resource_server_resource` WRITE;
/*!40000 ALTER TABLE `resource_server_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_server_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_server_scope`
--

DROP TABLE IF EXISTS `resource_server_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_server_scope` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ICON_URI` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `resource_server` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_server_scope`
--

LOCK TABLES `resource_server_scope` WRITE;
/*!40000 ALTER TABLE `resource_server_scope` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_server_scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_uris`
--

DROP TABLE IF EXISTS `resource_uris`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_uris` (
  `RESOURCE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
  CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `resource_server_resource` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_uris`
--

LOCK TABLES `resource_uris` WRITE;
/*!40000 ALTER TABLE `resource_uris` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_uris` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_attribute`
--

DROP TABLE IF EXISTS `role_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_attribute` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `ROLE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `keycloak_role` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_attribute`
--

LOCK TABLES `role_attribute` WRITE;
/*!40000 ALTER TABLE `role_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scope_mapping`
--

DROP TABLE IF EXISTS `scope_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scope_mapping` (
  `CLIENT_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `ROLE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scope_mapping`
--

LOCK TABLES `scope_mapping` WRITE;
/*!40000 ALTER TABLE `scope_mapping` DISABLE KEYS */;
INSERT INTO `scope_mapping` VALUES ('45759025-c500-44f8-9792-05e9d08b5ba0','2089ae83-f475-41df-a120-25d1baf194b3'),('5a71649f-df11-4101-9a6b-ca68c5140314','56401ce7-4a65-4c56-bc25-3020aed825a7'),('3ab1a78f-5cc4-4cf9-b523-a96f34c9565a','b5e6e2d8-9429-4c2f-8361-bc8da9ea93a0');
/*!40000 ALTER TABLE `scope_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scope_policy`
--

DROP TABLE IF EXISTS `scope_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scope_policy` (
  `SCOPE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `POLICY_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `resource_server_scope` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scope_policy`
--

LOCK TABLES `scope_policy` WRITE;
/*!40000 ALTER TABLE `scope_policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `scope_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_attribute`
--

DROP TABLE IF EXISTS `user_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_attribute` (
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `USER_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  KEY `IDX_USER_ATTRIBUTE_NAME` (`NAME`,`VALUE`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_attribute`
--

LOCK TABLES `user_attribute` WRITE;
/*!40000 ALTER TABLE `user_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_consent`
--

DROP TABLE IF EXISTS `user_consent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_consent` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_consent`
--

LOCK TABLES `user_consent` WRITE;
/*!40000 ALTER TABLE `user_consent` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_consent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_consent_client_scope`
--

DROP TABLE IF EXISTS `user_consent_client_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_consent_client_scope` (
  `USER_CONSENT_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `user_consent` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_consent_client_scope`
--

LOCK TABLES `user_consent_client_scope` WRITE;
/*!40000 ALTER TABLE `user_consent_client_scope` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_consent_client_scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_entity`
--

DROP TABLE IF EXISTS `user_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_entity` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NOT_BEFORE` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_entity`
--

LOCK TABLES `user_entity` WRITE;
/*!40000 ALTER TABLE `user_entity` DISABLE KEYS */;
INSERT INTO `user_entity` VALUES ('02e8ea00-9a18-478c-9d2b-48e84a353866','eltonlopesempresa@gmail.com','eltonlopesempresa@gmail.com',_binary '\0',_binary '',NULL,'elton','lopes','ecommerce','eltonlopesempresa@gmail.com',1643216775152,NULL,0),('96c2f765-8a74-4c34-b212-82483e9a9402','admin@email.com','admin@email.com',_binary '\0',_binary '',NULL,'Admin',NULL,'master','admin',1643113982780,NULL,0),('9beeed86-c753-4240-bca6-55a2bed9db7f','eltilopes@gmail.com','eltilopes@gmail.com',_binary '\0',_binary '',NULL,'elton','lopes','ecommerce','eltilopes',1643116243161,NULL,1643226878),('a23b4e56-1762-435d-bdb5-da891d9f5913','pedro@email.com','pedro@email.com',_binary '\0',_binary '',NULL,'Pedro','Pedra','master','pedro',1643138940019,NULL,0),('ac984c4b-a3ee-4209-8e6e-47e1636252d2','eltilopes@gmail.com','eltilopes@gmail.com',_binary '\0',_binary '',NULL,'elton','lopes','teste','eltilopes@gmail.com',1645041106165,NULL,0),('e65af92c-fd75-4776-be5c-abad5339accb','eltonlopesdeveloper@gmail.com','eltonlopesdeveloper@gmail.com',_binary '\0',_binary '',NULL,'Elton','Developer','ecommerce','eltonlopesdeveloper@gmail.com',1643216820912,NULL,0);
/*!40000 ALTER TABLE `user_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_federation_config`
--

DROP TABLE IF EXISTS `user_federation_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_federation_config` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `user_federation_provider` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_federation_config`
--

LOCK TABLES `user_federation_config` WRITE;
/*!40000 ALTER TABLE `user_federation_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_federation_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_federation_mapper`
--

DROP TABLE IF EXISTS `user_federation_mapper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_federation_mapper` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `user_federation_provider` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_federation_mapper`
--

LOCK TABLES `user_federation_mapper` WRITE;
/*!40000 ALTER TABLE `user_federation_mapper` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_federation_mapper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_federation_mapper_config`
--

DROP TABLE IF EXISTS `user_federation_mapper_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_federation_mapper_config` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `user_federation_mapper` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_federation_mapper_config`
--

LOCK TABLES `user_federation_mapper_config` WRITE;
/*!40000 ALTER TABLE `user_federation_mapper_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_federation_mapper_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_federation_provider`
--

DROP TABLE IF EXISTS `user_federation_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_federation_provider` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `CHANGED_SYNC_PERIOD` int DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FULL_SYNC_PERIOD` int DEFAULT NULL,
  `LAST_SYNC` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_federation_provider`
--

LOCK TABLES `user_federation_provider` WRITE;
/*!40000 ALTER TABLE `user_federation_provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_federation_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_membership`
--

DROP TABLE IF EXISTS `user_group_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group_membership` (
  `GROUP_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_membership`
--

LOCK TABLES `user_group_membership` WRITE;
/*!40000 ALTER TABLE `user_group_membership` DISABLE KEYS */;
INSERT INTO `user_group_membership` VALUES ('a49f0ad0-ceac-4d00-a90b-1f913c2a0fac','9beeed86-c753-4240-bca6-55a2bed9db7f');
/*!40000 ALTER TABLE `user_group_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_required_action`
--

DROP TABLE IF EXISTS `user_required_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_required_action` (
  `USER_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `REQUIRED_ACTION` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_required_action`
--

LOCK TABLES `user_required_action` WRITE;
/*!40000 ALTER TABLE `user_required_action` DISABLE KEYS */;
INSERT INTO `user_required_action` VALUES ('a23b4e56-1762-435d-bdb5-da891d9f5913','UPDATE_PASSWORD'),('a23b4e56-1762-435d-bdb5-da891d9f5913','VERIFY_EMAIL');
/*!40000 ALTER TABLE `user_required_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role_mapping`
--

DROP TABLE IF EXISTS `user_role_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role_mapping` (
  `ROLE_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role_mapping`
--

LOCK TABLES `user_role_mapping` WRITE;
/*!40000 ALTER TABLE `user_role_mapping` DISABLE KEYS */;
INSERT INTO `user_role_mapping` VALUES ('6ce5a60b-c48f-49c0-a81c-1242b5766cf9','02e8ea00-9a18-478c-9d2b-48e84a353866'),('86052d55-5148-4259-91a8-3803c28160d3','02e8ea00-9a18-478c-9d2b-48e84a353866'),('01d30d87-be33-4ecb-a2e5-d9c8dd798d25','96c2f765-8a74-4c34-b212-82483e9a9402'),('0773aab9-25f2-4022-aa91-15a74fa4f074','96c2f765-8a74-4c34-b212-82483e9a9402'),('0a188c77-8790-4aee-9a70-8b2346dcefcb','96c2f765-8a74-4c34-b212-82483e9a9402'),('0e5ee697-e621-4dfc-9d49-99f4c3613620','96c2f765-8a74-4c34-b212-82483e9a9402'),('125c2669-ad81-4b5b-a708-00c8655a648d','96c2f765-8a74-4c34-b212-82483e9a9402'),('168b9421-d70d-46ed-a360-f5e3b392c775','96c2f765-8a74-4c34-b212-82483e9a9402'),('172061eb-0304-49a3-81c8-7836e7efc552','96c2f765-8a74-4c34-b212-82483e9a9402'),('1949d0a4-6037-447c-90da-8b214f443439','96c2f765-8a74-4c34-b212-82483e9a9402'),('2eaec1e7-4c8f-48ce-9607-a3edbdfc5f97','96c2f765-8a74-4c34-b212-82483e9a9402'),('2f950a89-6cf9-449c-b09c-7869e0d383ce','96c2f765-8a74-4c34-b212-82483e9a9402'),('371de157-4833-4692-92b2-24eeedf98b33','96c2f765-8a74-4c34-b212-82483e9a9402'),('4d502640-ac17-49bf-8433-bc4a2c1887f7','96c2f765-8a74-4c34-b212-82483e9a9402'),('61fca772-7bf3-4acf-b38d-c2510ea31e07','96c2f765-8a74-4c34-b212-82483e9a9402'),('70eb9b15-d40d-4329-b3b6-2124321bdbf1','96c2f765-8a74-4c34-b212-82483e9a9402'),('7609d2c8-0152-42bd-9b0b-4a6c91cb57b8','96c2f765-8a74-4c34-b212-82483e9a9402'),('78d68b35-a500-47d9-b553-6b9f9ece9425','96c2f765-8a74-4c34-b212-82483e9a9402'),('8dd914fb-b4f5-4d30-a541-04dec99cc3fd','96c2f765-8a74-4c34-b212-82483e9a9402'),('9dda3b01-0197-4216-927a-a16e51e14867','96c2f765-8a74-4c34-b212-82483e9a9402'),('a2977db2-d308-427e-bc3a-65613c881c30','96c2f765-8a74-4c34-b212-82483e9a9402'),('a6bdeb9f-ec5e-49bc-8bad-81c07dad3450','96c2f765-8a74-4c34-b212-82483e9a9402'),('abb5cb4a-0129-4d9d-a249-207f01c9b8a4','96c2f765-8a74-4c34-b212-82483e9a9402'),('add40534-30c5-4018-a5b8-2c35a3bae63c','96c2f765-8a74-4c34-b212-82483e9a9402'),('c0b43cdf-64c5-40c1-9b41-40c18d06db4e','96c2f765-8a74-4c34-b212-82483e9a9402'),('c19c6dae-1b8b-42a8-b82b-6345686061cc','96c2f765-8a74-4c34-b212-82483e9a9402'),('c4c385ec-746b-4864-b0e0-0a56eeeb306f','96c2f765-8a74-4c34-b212-82483e9a9402'),('ced25b1c-5547-4603-998d-d869040e5566','96c2f765-8a74-4c34-b212-82483e9a9402'),('d452654b-3df5-4644-a6b1-2c15787a0134','96c2f765-8a74-4c34-b212-82483e9a9402'),('d9199d8b-858a-44a0-a746-ef870befefa8','96c2f765-8a74-4c34-b212-82483e9a9402'),('dfc6f745-d727-4ff7-8ccf-07baac6d0eb1','96c2f765-8a74-4c34-b212-82483e9a9402'),('e1e58d2b-a5b0-43b2-a825-b4048f0496c7','96c2f765-8a74-4c34-b212-82483e9a9402'),('e6580f5e-0000-41a9-b481-b1b195715659','96c2f765-8a74-4c34-b212-82483e9a9402'),('e6845123-e97f-4efc-be37-13e8d5b711e7','96c2f765-8a74-4c34-b212-82483e9a9402'),('ed092d71-d622-4f31-8e7f-8e88eb4a6055','96c2f765-8a74-4c34-b212-82483e9a9402'),('f3becc51-ff88-4ff9-936a-87731363a11c','96c2f765-8a74-4c34-b212-82483e9a9402'),('f4818633-e1b3-486e-aad0-cee4807049da','96c2f765-8a74-4c34-b212-82483e9a9402'),('fb83f87d-66d2-4101-a567-8a88e172f8a3','96c2f765-8a74-4c34-b212-82483e9a9402'),('5e888b45-0bbd-4dcd-b034-5a0715308aa8','9beeed86-c753-4240-bca6-55a2bed9db7f'),('6ce5a60b-c48f-49c0-a81c-1242b5766cf9','9beeed86-c753-4240-bca6-55a2bed9db7f'),('86052d55-5148-4259-91a8-3803c28160d3','9beeed86-c753-4240-bca6-55a2bed9db7f'),('e836cc08-2077-42f5-8dad-d5cd2b67e01b','9beeed86-c753-4240-bca6-55a2bed9db7f'),('125c2669-ad81-4b5b-a708-00c8655a648d','a23b4e56-1762-435d-bdb5-da891d9f5913'),('418e8675-24f1-4b9c-b821-b67276586b31','ac984c4b-a3ee-4209-8e6e-47e1636252d2'),('6ce5a60b-c48f-49c0-a81c-1242b5766cf9','e65af92c-fd75-4776-be5c-abad5339accb'),('86052d55-5148-4259-91a8-3803c28160d3','e65af92c-fd75-4776-be5c-abad5339accb');
/*!40000 ALTER TABLE `user_role_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_session`
--

DROP TABLE IF EXISTS `user_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_session` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `AUTH_METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IP_ADDRESS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_SESSION_REFRESH` int DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int DEFAULT NULL,
  `USER_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_SESSION_STATE` int DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_session`
--

LOCK TABLES `user_session` WRITE;
/*!40000 ALTER TABLE `user_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_session_note`
--

DROP TABLE IF EXISTS `user_session_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_session_note` (
  `USER_SESSION` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `user_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_session_note`
--

LOCK TABLES `user_session_note` WRITE;
/*!40000 ALTER TABLE `user_session_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_session_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `username_login_failure`
--

DROP TABLE IF EXISTS `username_login_failure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `username_login_failure` (
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int DEFAULT NULL,
  `LAST_FAILURE` bigint DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NUM_FAILURES` int DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `username_login_failure`
--

LOCK TABLES `username_login_failure` WRITE;
/*!40000 ALTER TABLE `username_login_failure` DISABLE KEYS */;
/*!40000 ALTER TABLE `username_login_failure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_origins`
--

DROP TABLE IF EXISTS `web_origins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `web_origins` (
  `CLIENT_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_origins`
--

LOCK TABLES `web_origins` WRITE;
/*!40000 ALTER TABLE `web_origins` DISABLE KEYS */;
INSERT INTO `web_origins` VALUES ('1552a7c5-a7fc-4aa9-ba43-1acafcbcb7a7','+'),('2572573e-8bf0-499c-b556-af0edcd22ce3','+'),('289b03fd-53d1-432d-ad18-16d809920475','http://localhost:3000'),('ee662877-97f9-4147-9631-b92ce80cc566','+');
/*!40000 ALTER TABLE `web_origins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'keyclock'
--

--
-- Dumping routines for database 'keyclock'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-15  8:43:06
