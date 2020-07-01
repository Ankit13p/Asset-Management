-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 25, 2019 at 07:44 AM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbtrack`
--

-- --------------------------------------------------------

--
-- Table structure for table `assetcategories`
--

DROP TABLE IF EXISTS `assetcategories`;
CREATE TABLE IF NOT EXISTS `assetcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `color` varchar(7) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `assetcategories`
--

INSERT INTO `assetcategories` (`id`, `name`, `color`) VALUES
(1, 'Desktops', '#1e3fda'),
(2, 'Laptops', '#058e29'),
(3, 'Servers', '#ff0000'),
(4, 'Printers', '#99ac14'),
(5, 'Routers', '#0b7c36'),
(6, 'Mobile ', '#32d9ec');

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
CREATE TABLE IF NOT EXISTS `assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryid` int(11) NOT NULL,
  `adminid` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `manufacturerid` int(11) NOT NULL,
  `modelid` int(11) NOT NULL,
  `supplierid` int(11) NOT NULL,
  `statusid` int(11) NOT NULL,
  `purchase_date` date NOT NULL,
  `warranty_months` int(11) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `serial` varchar(255) NOT NULL,
  `notes` text NOT NULL,
  `locationid` int(11) NOT NULL,
  `purchase_order` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `condition` varchar(255) NOT NULL,
  `removal_date` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag` (`tag`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`id`, `categoryid`, `adminid`, `clientid`, `userid`, `manufacturerid`, `modelid`, `supplierid`, `statusid`, `purchase_date`, `warranty_months`, `tag`, `name`, `serial`, `notes`, `locationid`, `purchase_order`, `value`, `condition`, `removal_date`) VALUES
(1, 1, 5, 0, 0, 2, 4, 0, 7, '2016-02-01', 24, 'IT-1', 'dell desktop1', 'QWERT12345', '', 0, '', '', '', ''),
(2, 3, 0, 0, 0, 2, 3, 0, 8, '2016-02-01', 24, 'IT-2', 'DC Server', 'ASDFG12345', '', 0, '', '', '', ''),
(3, 2, 4, 0, 0, 1, 1, 0, 7, '2016-02-01', 24, 'IT-3', 'Laptop 1', 'BNMHJK98765', '', 0, '', '', '', ''),
(4, 4, 0, 1, 0, 4, 5, 1, 10, '2019-07-24', 12, 'IT-4', 'hp Printer', '45643512153125', '', 1, 'order 554322', '', '', ''),
(5, 6, 0, 1, 0, 12, 7, 2, 9, '0000-00-00', 0, 'IT-5', 'Huawei p30', '45643213564352', '', 3, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `asset_tag_prefix` varchar(255) NOT NULL,
  `license_tag_prefix` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `name`, `asset_tag_prefix`, `license_tag_prefix`) VALUES
(1, 'Spark Inc.', 'IT-', 'ITL-'),
(2, 'Yellow page Inc.', 'IT-', 'ITL-');

-- --------------------------------------------------------

--
-- Table structure for table `clients_admins`
--

DROP TABLE IF EXISTS `clients_admins`;
CREATE TABLE IF NOT EXISTS `clients_admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminid` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clients_admins`
--

INSERT INTO `clients_admins` (`id`, `adminid`, `clientid`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `peopleid` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `projectid` int(11) NOT NULL,
  `ticketid` int(11) NOT NULL,
  `comment` text NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `name` varchar(128) NOT NULL,
  `value` text NOT NULL,
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`name`, `value`) VALUES
('email_from_address', 'admin@example.com'),
('email_from_name', 'admin'),
('email_smtp_enable', 'false'),
('email_smtp_host', ''),
('email_smtp_port', ''),
('email_smtp_username', ''),
('email_smtp_password', ''),
('email_smtp_security', ''),
('email_smtp_domain', ''),
('email_smtp_auth', 'false'),
('week_start', '1'),
('log_retention', '365'),
('tickets_encrypton', ''),
('tickets_password', ''),
('tickets_username', ''),
('tickets_server', ''),
('license_tag_prefix', 'ITL-'),
('asset_tag_prefix', 'IT-'),
('company_details', 'Asset Management System'),
('company_name', 'Asset Management System'),
('tickets_notification', 'false'),
('sms_provider', 'clickatell'),
('sms_user', ''),
('sms_password', ''),
('sms_api_id', ''),
('sms_from', ''),
('app_name', 'Asset Management System'),
('app_url', '#'),
('table_records', '50'),
('db_version', '1.7'),
('project_tag_prefix', 'P-'),
('password_generator_length', '8'),
('default_lang', 'en'),
('auto_close_tickets', '0'),
('timezone', 'UTC'),
('auto_close_tickets_notify', 'false'),
('tickets_defaultdepartment', '0');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emaillog`
--

DROP TABLE IF EXISTS `emaillog`;
CREATE TABLE IF NOT EXISTS `emaillog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `peopleid` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `to` varchar(128) NOT NULL,
  `subject` varchar(256) NOT NULL,
  `message` text NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `emaillog`
--

INSERT INTO `emaillog` (`id`, `peopleid`, `clientid`, `to`, `subject`, `message`, `timestamp`) VALUES
(1, 0, 1, 'Gopal@leadingedge.co.nz', 'Ticket #144977 created', 'Could not instantiate mail function.', '2019-07-23 09:08:13'),
(2, 2, 0, 'admin@example.com', 'New Support Ticket #144977', 'Could not instantiate mail function.', '2019-07-23 09:08:14'),
(3, 0, 2, 'Dhinal@leadingedge.co.nz', 'Ticket #421380 created', 'Could not instantiate mail function.', '2019-07-23 09:13:32'),
(4, 2, 0, 'admin@example.com', 'New Support Ticket #421380', 'Could not instantiate mail function.', '2019-07-23 09:13:33'),
(5, 0, 2, 'Dhinal@leadingedge.co.nz', '#421380 New Reply', 'Could not instantiate mail function.', '2019-07-23 09:14:59'),
(6, 0, 2, 'Kunj@leadingedge.co.nz', 'Ticket #128695 created', 'Could not instantiate mail function.', '2019-07-23 09:16:37'),
(7, 2, 0, 'admin@example.com', 'New Support Ticket #128695', 'Could not instantiate mail function.', '2019-07-23 09:16:38'),
(8, 0, 2, 'Kunj@leadingedge.co.nz', '#128695 New Reply', 'Could not instantiate mail function.', '2019-07-23 09:17:33'),
(9, 0, 2, 'Kunj@leadingedge.co.nz', '#128695 New Reply', 'Could not instantiate mail function.', '2019-07-23 09:18:18'),
(10, 0, 1, 'Gopal@leadingedge.co.nz', '#144977 New Reply', 'Could not instantiate mail function.', '2019-07-24 05:16:26'),
(11, 0, 1, 'Gopal@leadingedge.co.nz', '#144977 New Reply', 'Could not instantiate mail function.', '2019-07-24 05:16:34'),
(12, 0, 1, 'Gopal@leadingedge.co.nz', '#144977 New Reply', 'Could not instantiate mail function.', '2019-07-24 05:16:43'),
(13, 0, 1, 'Gopal@leadingedge.co.nz', '#144977 New Reply', 'Could not instantiate mail function.', '2019-07-24 05:16:49'),
(14, 0, 1, 'Gopal@leadingedge.co.nz', '#144977 New Reply', 'Could not instantiate mail function.', '2019-07-24 05:16:56'),
(15, 0, 1, 'Shreyas@Leadingedge.co.nz', 'Ticket #337179 created', 'Could not instantiate mail function.', '2019-07-25 03:44:59'),
(16, 2, 0, 'admin@example.com', 'New Support Ticket #337179', 'Could not instantiate mail function.', '2019-07-25 03:45:00'),
(17, 3, 1, 'gopal@leadingedge.co.nz', 'New User', 'Could not instantiate mail function.', '2019-07-25 03:49:43'),
(18, 4, 0, 'deep@leadingedge.co.nz', 'New User', 'Could not instantiate mail function.', '2019-07-25 03:52:03'),
(19, 5, 0, 'sagar@leadingedge.co.nz', 'New User', 'Could not instantiate mail function.', '2019-07-25 03:53:23'),
(20, 3, 2, 'Dhinal@leadingedge.co.nz', '#421380 New Reply', 'Could not instantiate mail function.', '2019-07-25 04:07:27'),
(21, 3, 1, 'Gopal@leadingedge.co.nz', '#144977 New Reply', 'Could not instantiate mail function.', '2019-07-25 04:08:47');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
CREATE TABLE IF NOT EXISTS `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientid` int(11) NOT NULL,
  `projectid` int(11) NOT NULL,
  `assetid` int(11) NOT NULL,
  `ticketreplyid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hosts_checks`
--

DROP TABLE IF EXISTS `hosts_checks`;
CREATE TABLE IF NOT EXISTS `hosts_checks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(60) NOT NULL,
  `port` varchar(60) NOT NULL,
  `monitoring` int(1) NOT NULL,
  `email` int(1) NOT NULL,
  `sms` int(1) NOT NULL,
  `status` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hosts_checks`
--

INSERT INTO `hosts_checks` (`id`, `hostid`, `name`, `type`, `port`, `monitoring`, `email`, `sms`, `status`) VALUES
(1, 1, 'HTTP', 'Service', '80', 1, 1, 1, ''),
(2, 3, 'HTTP admin', 'Service', '80', 1, 1, 0, ''),
(3, 2, 'MySQL Database', 'Service', '3306', 1, 1, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
CREATE TABLE IF NOT EXISTS `issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientid` int(11) NOT NULL,
  `assetid` int(11) NOT NULL,
  `projectid` int(11) NOT NULL,
  `adminid` int(11) NOT NULL,
  `issuetype` varchar(15) NOT NULL,
  `priority` varchar(60) NOT NULL,
  `status` varchar(60) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `duedate` varchar(20) NOT NULL,
  `timespent` int(10) NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `issues`
--

INSERT INTO `issues` (`id`, `clientid`, `assetid`, `projectid`, `adminid`, `issuetype`, `priority`, `status`, `name`, `description`, `duedate`, `timespent`, `dateadded`) VALUES
(1, 2, 2, 0, 0, 'Task', 'High', 'To Do', 'Configure Active Directory', '', '', 180, '2016-02-03 00:00:00'),
(2, 2, 2, 0, 0, 'Task', 'Low', 'In Progress', 'Reconfigure DNS server', '', '2016-03-27', 25, '2016-02-01 00:00:00'),
(3, 1, 1, 0, 0, 'Task', 'Normal', 'Done', 'Install Office Suite', '', '2016-08-03', 45, '2016-02-03 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `kb_articles`
--

DROP TABLE IF EXISTS `kb_articles`;
CREATE TABLE IF NOT EXISTS `kb_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryid` int(11) NOT NULL,
  `clients` text NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `content` text CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kb_articles`
--

INSERT INTO `kb_articles` (`id`, `categoryid`, `clients`, `name`, `content`) VALUES
(1, 1, 'a:1:{i:0;s:1:\"0\";}', 'Test Article', '<p>Article body.<br></p>');

-- --------------------------------------------------------

--
-- Table structure for table `kb_categories`
--

DROP TABLE IF EXISTS `kb_categories`;
CREATE TABLE IF NOT EXISTS `kb_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clients` text NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kb_categories`
--

INSERT INTO `kb_categories` (`id`, `clients`, `name`) VALUES
(1, 'a:1:{i:0;s:1:\"0\";}', 'Test Category');

-- --------------------------------------------------------

--
-- Table structure for table `labels`
--

DROP TABLE IF EXISTS `labels`;
CREATE TABLE IF NOT EXISTS `labels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `color` varchar(7) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `labels`
--

INSERT INTO `labels` (`id`, `name`, `color`) VALUES
(5, 'In Repair ', '#da2727'),
(7, 'Faulty', '#c01515'),
(8, 'In Stock', '#272525'),
(9, 'Assign', '#1d1507'),
(10, 'On Loan', '#c84e4e');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
CREATE TABLE IF NOT EXISTS `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(4) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `code`, `name`) VALUES
(1, 'en', 'English (System)');

-- --------------------------------------------------------

--
-- Table structure for table `licensecategories`
--

DROP TABLE IF EXISTS `licensecategories`;
CREATE TABLE IF NOT EXISTS `licensecategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `color` varchar(7) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `licensecategories`
--

INSERT INTO `licensecategories` (`id`, `name`, `color`) VALUES
(1, 'Operating Systems', '#355ea7'),
(2, 'Office Suite', '#e4d811'),
(3, 'Graphics Editor', '#c62121'),
(5, 'Anti-virus ', '#ec8d8d');

-- --------------------------------------------------------

--
-- Table structure for table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
CREATE TABLE IF NOT EXISTS `licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientid` int(11) NOT NULL,
  `statusid` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `supplierid` int(11) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `serial` text NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag` (`tag`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `licenses`
--

INSERT INTO `licenses` (`id`, `clientid`, `statusid`, `categoryid`, `supplierid`, `tag`, `name`, `serial`, `notes`) VALUES
(1, 1, 8, 1, 1, 'ITL-1', 'Windows 10 Pro', '', ''),
(2, 1, 9, 1, 1, 'ITL-2', 'Office Home & Business 2016', '', ''),
(3, 1, 8, 1, 1, 'ITL-3', 'Windows Server 2012 R2 Essentials', '', ''),
(4, 1, 10, 3, 1, 'ITL-4', 'Corel Draw x5', '', ''),
(5, 1, 8, 5, 1, 'ITL-5', 'Avast pro', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `licenses_assets`
--

DROP TABLE IF EXISTS `licenses_assets`;
CREATE TABLE IF NOT EXISTS `licenses_assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `licenseid` int(11) NOT NULL,
  `assetid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `licenses_assets`
--

INSERT INTO `licenses_assets` (`id`, `licenseid`, `assetid`) VALUES
(1, 3, 1),
(2, 2, 1),
(3, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
CREATE TABLE IF NOT EXISTS `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `clientid`, `name`) VALUES
(1, 1, 'Auckland Spark'),
(2, 2, 'Auckland Yellow Pages'),
(3, 1, 'Auckland Yellow Pages');

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
CREATE TABLE IF NOT EXISTS `manufacturers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `manufacturers`
--

INSERT INTO `manufacturers` (`id`, `name`) VALUES
(1, 'Apple'),
(2, 'Dell'),
(3, 'Microsoft'),
(4, 'HP'),
(5, 'Samsung'),
(6, 'ASUS'),
(7, 'Canon'),
(8, 'Cisco'),
(9, 'Lenovo'),
(10, 'Acer'),
(12, 'Huawei ');

-- --------------------------------------------------------

--
-- Table structure for table `models`
--

DROP TABLE IF EXISTS `models`;
CREATE TABLE IF NOT EXISTS `models` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `models`
--

INSERT INTO `models` (`id`, `name`) VALUES
(1, 'MacBook Pro'),
(2, 'MacBook Air'),
(3, 'PowerEdge R220'),
(4, 'Optiplex 3020 MT'),
(5, 'Deskjet 2630'),
(6, 'hp pavilion series'),
(7, 'p30');

-- --------------------------------------------------------

--
-- Table structure for table `notificationtemplates`
--

DROP TABLE IF EXISTS `notificationtemplates`;
CREATE TABLE IF NOT EXISTS `notificationtemplates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `info` text NOT NULL,
  `sms` varchar(254) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notificationtemplates`
--

INSERT INTO `notificationtemplates` (`id`, `name`, `subject`, `message`, `info`, `sms`) VALUES
(1, 'New Ticket', 'Ticket #{ticketid} created', '<p>Hello {contact},<br><br>A new ticket has been created for your request.<br>Ticket ID:<b> #{ticketid}</b><br><br>{message}<br><br>You can reply to this email to add additional information.<br>Please do not remove the ticket number from the subject line.<br><br>Best regards,<br>{company}</p>', '', ''),
(2, 'New Ticket Reply', '#{ticketid} New Reply', '<p>Hello {contact},<br><br>A new reply has been added to your ticket.<br><br>Ticket ID: #{ticketid}<br><br>{message}<br><br>You can reply to this email to add additional information.<br>Please do not remove the ticket number from the subject line.<br><br>Best regards,<br>{company}<br></p>', '', ''),
(3, 'New User', 'New User', '<p>Hello {contact},<br><br>Your account has been successfully created.</p><p><br>Email Address: {email}<br>Password: {password}<br>{appurl}<br><br>Best regards,<br>{company}<br></p>', '', ''),
(5, 'Password Reset', 'Password Reset', '<p>Hello {contact},<br><br>Please follow the link below to reset your password.<br>{resetlink}<br><br>Best regards,<br>{company}<br></p>', '', ''),
(6, 'Monitoring Notification', '{hostinfo} is now {status}', '<p>{hostinfo} status has changed to {status}.<br><br>Best regards,<br>{company}<br></p>', '', '{hostinfo} is now {status}'),
(7, 'New Ticket (Admin)', 'New Support Ticket #{ticketid}', '<p>A new support ticket has been opened.</p>\r\n<p>Ticket ID:<b> #{ticketid}</b><br>Subject: {subject}</p>\r\n<p><br>{message}</p><br>\r\n<p>Best regards,<br>{company}</p>', '', ''),
(8, 'New Ticket Reply (Admin)', 'New Reply to Ticket #{ticketid}', '<p>A new reply has been added to ticket #{ticketid}.<br>Subject: {subject}<br></p><p><br>{message}<br></p><p><br>Best regards,<br>{company}<br></p><p><br></p><p></p>', '', ''),
(9, 'Ticket Escalation (Admin)', 'Escalation Rule Processed #{ticketid}', '<p>Escalation rule processed for ticket #{ticketid}.<br>Subject: {subject}<br></p><p><br>{message}<br></p><p><br>Best regards,<br>{company}<br></p><p><br></p><p></p>', '', ''),
(10, 'Ticket Auto Close (User)', 'Support Ticket #{ticketid} Auto Closed', '<p>This is a notification to let you know that we are changing the status of your ticket #{ticketid}  to Closed as we have not received a response from you lately.<br></p><p><br>Ticket Subject: {subject}<br></p><p><br>Best regards,<br>{company}<br></p><p><br></p><p></p>', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
CREATE TABLE IF NOT EXISTS `people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL,
  `roleid` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `title` varchar(128) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `password` varchar(128) NOT NULL,
  `theme` varchar(64) NOT NULL,
  `sidebar` varchar(64) NOT NULL,
  `layout` varchar(64) NOT NULL,
  `notes` text NOT NULL,
  `signature` text NOT NULL,
  `sessionid` varchar(255) NOT NULL,
  `resetkey` varchar(255) NOT NULL,
  `autorefresh` int(11) NOT NULL,
  `lang` varchar(2) NOT NULL,
  `ticketsnotification` int(1) NOT NULL,
  `avatar` mediumblob NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`id`, `type`, `roleid`, `clientid`, `name`, `email`, `title`, `mobile`, `password`, `theme`, `sidebar`, `layout`, `notes`, `signature`, `sessionid`, `resetkey`, `autorefresh`, `lang`, `ticketsnotification`, `avatar`) VALUES
(2, 'admin', 1, 0, 'admin', 'admin@example.com', '', '', 'ecb97aafa3d2b5f076926ac5976fc03f376be7f3', 'skin-blue', 'opened', '', '', '', 'n68a97s8gojo8gvuj7fh6v0k1o', '', 0, 'en', 1, ''),
(3, 'user', 2, 1, 'Gopal Gabani', 'gopal@leadingedge.co.nz', 'sales men', '0224556743', '6ddd63bed041f807a9929495a8d985682af591b1', 'skin-blue', 'opened', '', '', '', '', '', 0, 'en', 0, ''),
(4, 'admin', 4, 0, 'deep patel', 'deep@leadingedge.co.nz', 'technician', '0224556742', '6be3424071f42e73484bd997afa55d2dcb1a9878', 'skin-blue', 'opened', '', '', '', '', '', 0, 'en', 1, ''),
(5, 'admin', 3, 0, 'Sagar Trivedi', 'sagar@leadingedge.co.nz', 'manager', '0224556741', '23c064c56bba6d5130211f3ad945dda05d777f6b', 'skin-blue', 'opened', '', '', '', '', '', 0, 'en', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
CREATE TABLE IF NOT EXISTS `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientid` int(11) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text NOT NULL,
  `description` text NOT NULL,
  `startdate` varchar(20) NOT NULL,
  `deadline` varchar(20) NOT NULL,
  `progress` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `clientid`, `tag`, `name`, `notes`, `description`, `startdate`, `deadline`, `progress`) VALUES
(1, 1, 'P-1', 'Test Project', '<p></p>', '', '', '', 70);

-- --------------------------------------------------------

--
-- Table structure for table `projects_admins`
--

DROP TABLE IF EXISTS `projects_admins`;
CREATE TABLE IF NOT EXISTS `projects_admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectid` int(11) NOT NULL,
  `adminid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projects_admins`
--

INSERT INTO `projects_admins` (`id`, `projectid`, `adminid`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `perms` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `type`, `name`, `perms`) VALUES
(1, 'admin', 'Super Administrator', 'a:90:{i:0;s:9:\"addClient\";i:1;s:10:\"editClient\";i:2;s:12:\"deleteClient\";i:3;s:12:\"manageClient\";i:4;s:12:\"adminsClient\";i:5;s:11:\"viewClients\";i:6;s:8:\"addAsset\";i:7;s:9:\"editAsset\";i:8;s:11:\"deleteAsset\";i:9;s:11:\"manageAsset\";i:10;s:12:\"licenseAsset\";i:11;s:10:\"viewAssets\";i:12;s:10:\"addLicense\";i:13;s:11:\"editLicense\";i:14;s:13:\"deleteLicense\";i:15;s:13:\"manageLicense\";i:16;s:12:\"assetLicense\";i:17;s:12:\"viewLicenses\";i:18;s:10:\"addProject\";i:19;s:11:\"editProject\";i:20;s:13:\"deleteProject\";i:21;s:13:\"manageProject\";i:22;s:18:\"manageProjectNotes\";i:23;s:13:\"adminsProject\";i:24;s:12:\"viewProjects\";i:25;s:9:\"addTicket\";i:26;s:10:\"editTicket\";i:27;s:12:\"deleteTicket\";i:28;s:12:\"manageTicket\";i:29;s:17:\"manageTicketRules\";i:30;s:17:\"manageTicketNotes\";i:31;s:22:\"manageTicketAssignment\";i:32;s:11:\"viewTickets\";i:33;s:8:\"addIssue\";i:34;s:9:\"editIssue\";i:35;s:11:\"deleteIssue\";i:36;s:11:\"manageIssue\";i:37;s:10:\"viewIssues\";i:38;s:10:\"addComment\";i:39;s:11:\"editComment\";i:40;s:13:\"deleteComment\";i:41;s:13:\"assignComment\";i:42;s:12:\"viewComments\";i:43;s:13:\"addCredential\";i:44;s:14:\"editCredential\";i:45;s:16:\"deleteCredential\";i:46;s:14:\"viewCredential\";i:47;s:15:\"viewCredentials\";i:48;s:5:\"addKB\";i:49;s:6:\"editKB\";i:50;s:8:\"deleteKB\";i:51;s:6:\"viewKB\";i:52;s:9:\"addPReply\";i:53;s:10:\"editPReply\";i:54;s:12:\"deletePReply\";i:55;s:12:\"viewPReplies\";i:56;s:10:\"uploadFile\";i:57;s:12:\"downloadFile\";i:58;s:10:\"deleteFile\";i:59;s:9:\"viewFiles\";i:60;s:7:\"addHost\";i:61;s:8:\"editHost\";i:62;s:10:\"deleteHost\";i:63;s:10:\"manageHost\";i:64;s:14:\"viewMonitoring\";i:65;s:7:\"addUser\";i:66;s:8:\"editUser\";i:67;s:10:\"deleteUser\";i:68;s:9:\"viewUsers\";i:69;s:8:\"addStaff\";i:70;s:9:\"editStaff\";i:71;s:11:\"deleteStaff\";i:72;s:9:\"viewStaff\";i:73;s:7:\"addRole\";i:74;s:8:\"editRole\";i:75;s:10:\"deleteRole\";i:76;s:9:\"viewRoles\";i:77;s:10:\"addContact\";i:78;s:11:\"editContact\";i:79;s:13:\"deleteContact\";i:80;s:12:\"viewContacts\";i:81;s:10:\"manageData\";i:82;s:14:\"manageSettings\";i:83;s:8:\"viewLogs\";i:84;s:10:\"viewSystem\";i:85;s:10:\"viewPeople\";i:86;s:11:\"viewReports\";i:87;s:11:\"autorefresh\";i:88;s:6:\"search\";i:89;s:4:\"Null\";}'),
(2, 'user', 'Standard User', 'a:19:{i:0;s:11:\"manageAsset\";i:1;s:10:\"viewAssets\";i:2;s:13:\"manageLicense\";i:3;s:12:\"viewLicenses\";i:4;s:12:\"viewProjects\";i:5;s:9:\"addTicket\";i:6;s:10:\"editTicket\";i:7;s:12:\"manageTicket\";i:8;s:11:\"viewTickets\";i:9;s:8:\"addIssue\";i:10;s:10:\"viewIssues\";i:11;s:10:\"addComment\";i:12;s:12:\"viewComments\";i:13;s:6:\"viewKB\";i:14;s:14:\"viewMonitoring\";i:15;s:9:\"viewUsers\";i:16;s:10:\"viewPeople\";i:17;s:11:\"viewReports\";i:18;s:4:\"Null\";}'),
(3, 'admin', 'Administrator', 'a:70:{i:0;s:9:\"addClient\";i:1;s:10:\"editClient\";i:2;s:12:\"manageClient\";i:3;s:12:\"adminsClient\";i:4;s:11:\"viewClients\";i:5;s:8:\"addAsset\";i:6;s:9:\"editAsset\";i:7;s:11:\"manageAsset\";i:8;s:12:\"licenseAsset\";i:9;s:10:\"viewAssets\";i:10;s:10:\"addLicense\";i:11;s:11:\"editLicense\";i:12;s:13:\"manageLicense\";i:13;s:12:\"assetLicense\";i:14;s:12:\"viewLicenses\";i:15;s:10:\"addProject\";i:16;s:11:\"editProject\";i:17;s:13:\"manageProject\";i:18;s:18:\"manageProjectNotes\";i:19;s:13:\"adminsProject\";i:20;s:12:\"viewProjects\";i:21;s:9:\"addTicket\";i:22;s:10:\"editTicket\";i:23;s:12:\"manageTicket\";i:24;s:17:\"manageTicketRules\";i:25;s:17:\"manageTicketNotes\";i:26;s:11:\"viewTickets\";i:27;s:8:\"addIssue\";i:28;s:9:\"editIssue\";i:29;s:11:\"manageIssue\";i:30;s:10:\"viewIssues\";i:31;s:10:\"addComment\";i:32;s:11:\"editComment\";i:33;s:13:\"assignComment\";i:34;s:12:\"viewComments\";i:35;s:13:\"addCredential\";i:36;s:14:\"editCredential\";i:37;s:14:\"viewCredential\";i:38;s:15:\"viewCredentials\";i:39;s:5:\"addKB\";i:40;s:6:\"viewKB\";i:41;s:9:\"addPReply\";i:42;s:12:\"viewPReplies\";i:43;s:10:\"uploadFile\";i:44;s:12:\"downloadFile\";i:45;s:9:\"viewFiles\";i:46;s:7:\"addHost\";i:47;s:8:\"editHost\";i:48;s:10:\"manageHost\";i:49;s:14:\"viewMonitoring\";i:50;s:7:\"addUser\";i:51;s:8:\"editUser\";i:52;s:9:\"viewUsers\";i:53;s:8:\"addStaff\";i:54;s:9:\"editStaff\";i:55;s:9:\"viewStaff\";i:56;s:7:\"addRole\";i:57;s:8:\"editRole\";i:58;s:9:\"viewRoles\";i:59;s:10:\"addContact\";i:60;s:11:\"editContact\";i:61;s:12:\"viewContacts\";i:62;s:10:\"manageData\";i:63;s:8:\"viewLogs\";i:64;s:10:\"viewSystem\";i:65;s:10:\"viewPeople\";i:66;s:11:\"viewReports\";i:67;s:11:\"autorefresh\";i:68;s:6:\"search\";i:69;s:4:\"Null\";}'),
(4, 'admin', 'Technician', 'a:48:{i:0;s:9:\"addClient\";i:1;s:12:\"manageClient\";i:2;s:11:\"viewClients\";i:3;s:8:\"addAsset\";i:4;s:11:\"manageAsset\";i:5;s:10:\"viewAssets\";i:6;s:10:\"addLicense\";i:7;s:13:\"manageLicense\";i:8;s:12:\"viewLicenses\";i:9;s:10:\"addProject\";i:10;s:13:\"manageProject\";i:11;s:18:\"manageProjectNotes\";i:12;s:12:\"viewProjects\";i:13;s:9:\"addTicket\";i:14;s:12:\"manageTicket\";i:15;s:17:\"manageTicketRules\";i:16;s:17:\"manageTicketNotes\";i:17;s:11:\"viewTickets\";i:18;s:8:\"addIssue\";i:19;s:11:\"manageIssue\";i:20;s:10:\"viewIssues\";i:21;s:10:\"addComment\";i:22;s:12:\"viewComments\";i:23;s:13:\"addCredential\";i:24;s:14:\"viewCredential\";i:25;s:15:\"viewCredentials\";i:26;s:5:\"addKB\";i:27;s:6:\"viewKB\";i:28;s:9:\"addPReply\";i:29;s:12:\"viewPReplies\";i:30;s:10:\"uploadFile\";i:31;s:12:\"downloadFile\";i:32;s:9:\"viewFiles\";i:33;s:7:\"addHost\";i:34;s:10:\"manageHost\";i:35;s:14:\"viewMonitoring\";i:36;s:7:\"addUser\";i:37;s:9:\"viewUsers\";i:38;s:10:\"addContact\";i:39;s:11:\"editContact\";i:40;s:12:\"viewContacts\";i:41;s:10:\"manageData\";i:42;s:10:\"viewSystem\";i:43;s:10:\"viewPeople\";i:44;s:11:\"viewReports\";i:45;s:11:\"autorefresh\";i:46;s:6:\"search\";i:47;s:4:\"Null\";}');

-- --------------------------------------------------------

--
-- Table structure for table `statuscodes`
--

DROP TABLE IF EXISTS `statuscodes`;
CREATE TABLE IF NOT EXISTS `statuscodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `statuscodes`
--

INSERT INTO `statuscodes` (`id`, `code`, `type`, `message`) VALUES
(48, 11, 'danger', 'Error! Cannot add item.'),
(49, 21, 'danger', 'Error! Cannot save item.'),
(50, 31, 'danger', 'Error! Cannot delete item.'),
(47, 30, 'success', 'Item has been deleted successfully!'),
(46, 20, 'success', 'Item has been saved successfully!'),
(45, 10, 'success', 'Item has been added successfully!'),
(51, 40, 'success', 'Settings updated successfully!'),
(52, 1200, 'danger', 'Authentication Failed!'),
(53, 1300, 'success', 'Please check your email for a password reset link.'),
(54, 1400, 'danger', 'Email address was not found.'),
(55, 1500, 'danger', 'Invalid reset key!'),
(56, 1600, 'success', 'Success. Please log in with your new password! '),
(57, 1, 'danger', 'Unauthorized Access');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE IF NOT EXISTS `suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `contactname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `web` varchar(255) NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `address`, `contactname`, `phone`, `email`, `web`, `notes`) VALUES
(1, 'Amazon', '', '', '', '', '', ''),
(2, 'Best Buy', '', '', '', '', '', ''),
(3, 'Newegg', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `systemlog`
--

DROP TABLE IF EXISTS `systemlog`;
CREATE TABLE IF NOT EXISTS `systemlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `peopleid` int(11) NOT NULL,
  `ipaddress` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `systemlog`
--

INSERT INTO `systemlog` (`id`, `peopleid`, `ipaddress`, `description`, `timestamp`) VALUES
(31, 2, '::1', 'Ticket Status Update - ID: 1', '2019-07-24 05:16:25'),
(30, 2, '::1', 'Location Added - ID: 2', '2019-07-24 04:52:11'),
(29, 2, '::1', 'Location Edited - ID: 1', '2019-07-24 04:52:00'),
(28, 2, '::1', 'Ticket Edited - ID: 1', '2019-07-24 04:34:17'),
(27, 2, '::1', 'Ticket Edited - ID: 2', '2019-07-24 04:33:52'),
(26, 2, '::1', 'Ticket Edited - ID: 3', '2019-07-24 04:33:41'),
(25, 2, '::1', 'Ticket Edited - ID: 1', '2019-07-24 04:33:06'),
(24, 2, '::1', 'Ticket Edited - ID: 1', '2019-07-24 04:32:41'),
(9, -1, '::1', 'User/Admin Logged In - ID: 2', '2019-07-19 02:56:30'),
(10, -1, '::1', 'User/Admin Logged In - ID: 2', '2019-07-19 02:59:16'),
(11, -1, '::1', 'User/Admin Logged In - ID: 2', '2019-07-19 03:24:45'),
(12, -1, '::1', 'User/Admin Logged In - ID: 2', '2019-07-23 08:03:20'),
(13, 2, '::1', 'Ticket Added - ID: 1', '2019-07-23 09:08:14'),
(14, 2, '::1', 'Ticket Added - ID: 2', '2019-07-23 09:13:33'),
(15, 2, '::1', 'Ticket Status Update - ID: 2', '2019-07-23 09:14:58'),
(16, 2, '::1', 'Ticket Reply Added - ID: 3', '2019-07-23 09:14:59'),
(17, 2, '::1', 'Ticket Added - ID: 3', '2019-07-23 09:16:38'),
(18, 2, '::1', 'Ticket Status Update - ID: 3', '2019-07-23 09:17:32'),
(19, 2, '::1', 'Ticket Reply Added - ID: 5', '2019-07-23 09:17:33'),
(20, 2, '::1', 'Ticket Status Update - ID: 3', '2019-07-23 09:18:17'),
(21, 2, '::1', 'Ticket Reply Added - ID: 6', '2019-07-23 09:18:18'),
(22, -1, '::1', 'User/Admin Logged In - ID: 2', '2019-07-24 03:22:15'),
(23, -1, '::1', 'User/Admin Logged In - ID: 2', '2019-07-24 03:37:06'),
(32, 2, '::1', 'Ticket Reply Added - ID: 7', '2019-07-24 05:16:26'),
(33, 2, '::1', 'Ticket Status Update - ID: 1', '2019-07-24 05:16:33'),
(34, 2, '::1', 'Ticket Reply Added - ID: 8', '2019-07-24 05:16:34'),
(35, 2, '::1', 'Ticket Status Update - ID: 1', '2019-07-24 05:16:42'),
(36, 2, '::1', 'Ticket Reply Added - ID: 9', '2019-07-24 05:16:43'),
(37, 2, '::1', 'Ticket Status Update - ID: 1', '2019-07-24 05:16:48'),
(38, 2, '::1', 'Ticket Reply Added - ID: 10', '2019-07-24 05:16:49'),
(39, 2, '::1', 'Ticket Status Update - ID: 1', '2019-07-24 05:16:55'),
(40, 2, '::1', 'Ticket Reply Added - ID: 11', '2019-07-24 05:16:56'),
(41, -1, '::1', 'User/Admin Logged In - ID: 2', '2019-07-25 01:17:05'),
(42, 2, '::1', 'Ticket Edited - ID: 2', '2019-07-25 02:51:44'),
(43, 2, '::1', 'User/Staff Logged Out - ID: 2', '2019-07-25 03:03:16'),
(44, -1, '::1', 'User/Admin Logged In - ID: 2', '2019-07-25 03:05:08'),
(45, 2, '::1', 'Label Added - ID: 7', '2019-07-25 03:12:28'),
(46, 2, '::1', 'Label Added - ID: 8', '2019-07-25 03:12:43'),
(47, 2, '::1', 'Label Added - ID: 9', '2019-07-25 03:12:58'),
(48, 2, '::1', 'Label Added - ID: 10', '2019-07-25 03:16:21'),
(49, 2, '::1', 'Label Deleted - ID: 1', '2019-07-25 03:17:33'),
(50, 2, '::1', 'Label Deleted - ID: 2', '2019-07-25 03:17:37'),
(51, 2, '::1', 'Label Deleted - ID: 3', '2019-07-25 03:17:44'),
(52, 2, '::1', 'Label Deleted - ID: 4', '2019-07-25 03:17:48'),
(53, 2, '::1', 'Label Deleted - ID: 6', '2019-07-25 03:17:52'),
(54, 2, '::1', 'Asset Added - ID: 4', '2019-07-25 03:27:36'),
(55, 2, '::1', 'Asset Edited - ID: 1', '2019-07-25 03:29:12'),
(56, 2, '::1', 'Asset Edited - ID: 1', '2019-07-25 03:29:34'),
(57, 2, '::1', 'Asset Edited - ID: 2', '2019-07-25 03:32:20'),
(58, 2, '::1', 'AssetCategory Added - ID: 6', '2019-07-25 03:36:58'),
(59, 2, '::1', 'AssetCategory Edited - ID: 6', '2019-07-25 03:37:11'),
(60, 2, '::1', 'LicenseCategory Added - ID: 5', '2019-07-25 03:37:33'),
(61, 2, '::1', 'LicenseCategory Edited - ID: 5', '2019-07-25 03:37:42'),
(62, 2, '::1', 'Label Edited - ID: 5', '2019-07-25 03:37:54'),
(63, 2, '::1', 'Manufacturer Deleted - ID: 11', '2019-07-25 03:38:05'),
(64, 2, '::1', 'Manufacturer Added - ID: 12', '2019-07-25 03:38:18'),
(65, 2, '::1', 'Manufacturer Edited - ID: 12', '2019-07-25 03:38:37'),
(66, 2, '::1', 'Model Added - ID: 6', '2019-07-25 03:39:21'),
(67, 2, '::1', 'Model Edited - ID: 6', '2019-07-25 03:39:45'),
(68, 2, '::1', 'Location Edited - ID: 1', '2019-07-25 03:40:08'),
(69, 2, '::1', 'Location Edited - ID: 2', '2019-07-25 03:40:22'),
(70, 2, '::1', 'Asset Added - ID: 5', '2019-07-25 03:43:39'),
(71, 2, '::1', 'Manufacturer Edited - ID: 12', '2019-07-25 03:44:05'),
(72, 2, '::1', 'Ticket Added - ID: 4', '2019-07-25 03:45:00'),
(73, 2, '::1', 'Ticket Edited - ID: 4', '2019-07-25 03:45:28'),
(74, 2, '::1', 'User Added - ID: 3', '2019-07-25 03:49:43'),
(75, 2, '::1', 'Staff Account Added - ID: 4', '2019-07-25 03:52:03'),
(76, 2, '::1', 'Staff Account Added - ID: 5', '2019-07-25 03:53:23'),
(77, 2, '::1', 'Ticket Edited - ID: 2', '2019-07-25 04:05:02'),
(78, 2, '::1', 'Ticket Edited - ID: 1', '2019-07-25 04:05:20'),
(79, 2, '::1', 'User/Staff Logged Out - ID: 2', '2019-07-25 04:05:30'),
(80, -1, '::1', 'User/Admin Logged In - ID: 4', '2019-07-25 04:05:50'),
(81, 4, '::1', 'Ticket Status Update - ID: 2', '2019-07-25 04:07:26'),
(82, 4, '::1', 'Ticket Reply Added - ID: 13', '2019-07-25 04:07:27'),
(83, 4, '::1', 'User/Staff Logged Out - ID: 4', '2019-07-25 04:08:04'),
(84, -1, '::1', 'User/Admin Logged In - ID: 5', '2019-07-25 04:08:27'),
(85, 5, '::1', 'Ticket Status Update - ID: 1', '2019-07-25 04:08:46'),
(86, 5, '::1', 'Ticket Reply Added - ID: 14', '2019-07-25 04:08:47'),
(87, 5, '::1', 'User/Staff Logged Out - ID: 5', '2019-07-25 04:09:17'),
(88, -1, '::1', 'User/Admin Login Failure - EMAIL: shreyas@leadingedge.co.nz', '2019-07-25 04:09:35'),
(89, -1, '::1', 'User/Admin Logged In - ID: 3', '2019-07-25 04:10:19'),
(90, 3, '::1', 'User/Staff Logged Out - ID: 3', '2019-07-25 04:11:20'),
(91, -1, '::1', 'User/Admin Logged In - ID: 5', '2019-07-25 04:11:29'),
(92, 5, '::1', 'User/Staff Logged Out - ID: 5', '2019-07-25 04:11:34'),
(93, -1, '::1', 'User/Admin Logged In - ID: 4', '2019-07-25 04:11:43'),
(94, 4, '::1', 'User/Staff Logged Out - ID: 4', '2019-07-25 04:11:51'),
(95, -1, '::1', 'User/Admin Logged In - ID: 2', '2019-07-25 04:11:59'),
(96, 2, '::1', 'User/Staff Logged Out - ID: 2', '2019-07-25 07:07:08'),
(97, -1, '::1', 'User/Admin Logged In - ID: 2', '2019-07-25 07:08:37'),
(98, 2, '::1', 'License Edited - ID: 1', '2019-07-25 07:08:51'),
(99, 2, '::1', 'License Added - ID: 5', '2019-07-25 07:09:18'),
(100, 2, '::1', 'Asset Edited - ID: 1', '2019-07-25 07:10:04'),
(101, 2, '::1', 'License Edited - ID: 5', '2019-07-25 07:12:22'),
(102, 2, '::1', 'Asset Edited - ID: 3', '2019-07-25 07:17:18'),
(103, 2, '::1', 'Asset Edited - ID: 1', '2019-07-25 07:17:58'),
(104, 2, '::1', 'User/Staff Logged Out - ID: 2', '2019-07-25 07:23:57'),
(105, -1, '::1', 'User/Admin Logged In - ID: 2', '2019-07-25 07:24:13'),
(106, 2, '::1', 'License Edited - ID: 3', '2019-07-25 07:25:00'),
(107, 2, '::1', 'License Edited - ID: 2', '2019-07-25 07:25:46'),
(108, 2, '::1', 'License Edited - ID: 4', '2019-07-25 07:26:00'),
(109, -1, '::1', 'User/Admin Logged In - ID: 2', '2019-07-25 07:37:16'),
(110, 2, '::1', 'Asset Edited - ID: 3', '2019-07-25 07:37:35'),
(111, -1, '::1', 'User/Admin Logged In - ID: 2', '2019-07-25 07:42:52'),
(112, 2, '::1', 'Asset Edited - ID: 1', '2019-07-25 07:43:08');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE IF NOT EXISTS `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket` int(11) NOT NULL,
  `departmentid` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `adminid` int(11) NOT NULL,
  `assetid` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `subject` varchar(500) NOT NULL,
  `status` varchar(50) NOT NULL,
  `priority` varchar(50) NOT NULL,
  `timestamp` datetime NOT NULL,
  `notes` text NOT NULL,
  `ccs` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `ticket`, `departmentid`, `clientid`, `userid`, `adminid`, `assetid`, `email`, `subject`, `status`, `priority`, `timestamp`, `notes`, `ccs`) VALUES
(1, 144977, 1, 1, 3, 5, 1, 'Gopal@leadingedge.co.nz', 'Printer is not working', 'In Progress', 'Normal', '2019-07-23 09:08:12', '', ''),
(2, 421380, 1, 2, 3, 4, 3, 'Dhinal@leadingedge.co.nz', 'laptop screen is not working', 'Answered', 'High', '2019-07-23 09:13:31', '', ''),
(3, 128695, 2, 2, 0, 2, 2, 'Kunj@leadingedge.co.nz', 'Not getting connected to server', 'Closed', 'High', '2019-07-23 09:16:36', '', ''),
(4, 337179, 1, 1, 0, 2, 5, 'Shreyas@Leadingedge.co.nz', 'mobile display not working ', 'Open', 'Normal', '2019-07-25 03:44:58', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tickets_departments`
--

DROP TABLE IF EXISTS `tickets_departments`;
CREATE TABLE IF NOT EXISTS `tickets_departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tickets_departments`
--

INSERT INTO `tickets_departments` (`id`, `name`) VALUES
(1, 'Sales Department'),
(2, 'Marketing Department');

-- --------------------------------------------------------

--
-- Table structure for table `tickets_pr`
--

DROP TABLE IF EXISTS `tickets_pr`;
CREATE TABLE IF NOT EXISTS `tickets_pr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `content` text CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tickets_pr`
--

INSERT INTO `tickets_pr` (`id`, `name`, `content`) VALUES
(1, 'Demo Predefined Reply', '<div><p>Predefined reply body.<br></p></div>');

-- --------------------------------------------------------

--
-- Table structure for table `tickets_replies`
--

DROP TABLE IF EXISTS `tickets_replies`;
CREATE TABLE IF NOT EXISTS `tickets_replies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticketid` int(11) NOT NULL,
  `peopleid` int(11) NOT NULL,
  `message` text NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tickets_replies`
--

INSERT INTO `tickets_replies` (`id`, `ticketid`, `peopleid`, `message`, `timestamp`) VALUES
(1, 1, 2, '<p>when I was trying to print it will show in my print option but printing is not happening.</p>', '2019-07-23 09:08:12'),
(2, 2, 2, '<p>when I turn on my laptop after a break I don\'t know what happen screen suddenly glow and stop displaying.</p>', '2019-07-23 09:13:31'),
(3, 2, 2, '<p><br></p><div><p>The new display is order and waiting for delivery.</p></div><p><br></p>', '2019-07-23 09:14:58'),
(4, 3, 2, '<p>please fix this issue as soon as possible.</p>', '2019-07-23 09:16:36'),
(5, 3, 2, '<p><br></p><div><p>The server will start responding within the next 10 minutes.<br></p></div><p><br></p>', '2019-07-23 09:17:32'),
(6, 3, 2, '<p>your problem is fix. thank you for co-operate.</p>', '2019-07-23 09:18:17'),
(7, 1, 2, '', '2019-07-24 05:16:25'),
(8, 1, 2, '', '2019-07-24 05:16:33'),
(9, 1, 2, '', '2019-07-24 05:16:42'),
(10, 1, 2, '', '2019-07-24 05:16:48'),
(11, 1, 2, '', '2019-07-24 05:16:55'),
(12, 4, 2, '', '2019-07-25 03:44:58'),
(13, 2, 4, '', '2019-07-25 04:07:26'),
(14, 1, 5, '', '2019-07-25 04:08:46');

-- --------------------------------------------------------

--
-- Table structure for table `tickets_rules`
--

DROP TABLE IF EXISTS `tickets_rules`;
CREATE TABLE IF NOT EXISTS `tickets_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticketid` int(11) NOT NULL,
  `executed` int(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cond_status` varchar(255) NOT NULL,
  `cond_priority` varchar(255) NOT NULL,
  `cond_timeelapsed` varchar(20) NOT NULL,
  `cond_datetime` datetime NOT NULL,
  `act_status` varchar(255) NOT NULL,
  `act_priority` varchar(255) NOT NULL,
  `act_assignto` int(11) NOT NULL,
  `act_notifyadmins` int(1) NOT NULL,
  `act_addreply` int(1) NOT NULL,
  `reply` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
