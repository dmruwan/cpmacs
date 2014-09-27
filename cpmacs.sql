-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 27, 2014 at 06:24 PM
-- Server version: 5.5.27-log
-- PHP Version: 5.3.28

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cat_alert`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `app`
--

CREATE TABLE IF NOT EXISTS `app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(100) NOT NULL,
  `dev_id` int(11) NOT NULL,
  `public_url` varchar(512) DEFAULT NULL,
  `repo_url` varchar(512) DEFAULT NULL,
  `image_url` varchar(255) NOT NULL,
  `banner_img` varchar(255) NOT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT '0',
  `charge_user` int(11) NOT NULL DEFAULT '0',
  `payment_type` int(11) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `category` int(11) NOT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `rating` float NOT NULL DEFAULT '5',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `app`
--

INSERT INTO `app` (`id`, `app_name`, `dev_id`, `public_url`, `repo_url`, `image_url`, `banner_img`, `is_approved`, `charge_user`, `payment_type`, `description`, `category`, `price`, `rating`) VALUES
(1, 'Jackpot', 1, 'http://www.manitaz.com/Jackpot/index.html', NULL, 'http://itraveller.manitaz.com/thumb_img/coombo_national_musi.png', 'http://itraveller.manitaz.com/images/pigoun_island/image4.png', 1, 0, 1, 'This is sample jackpot application. dada dasndij ndasijnd nduasid nudasdj ncudsjof nsioad nduo nusda udaodjoiad jiofda ', 2, 0.00, 5);

-- --------------------------------------------------------

--
-- Table structure for table `appuser`
--

CREATE TABLE IF NOT EXISTS `appuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `date_joined` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `card_added` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `appuser`
--

INSERT INTO `appuser` (`id`, `full_name`, `email`, `password`, `date_joined`, `card_added`) VALUES
(1, 'Chandika Kamal', 'cksanjeewa@gmail.com', '202cb962ac59075b964b07152d234b70', '2014-09-26 09:43:52', 0),
(2, 'a', 'a', '0cc175b9c0f1b6a831c399e269772661', '2014-09-26 20:58:33', 0);

-- --------------------------------------------------------

--
-- Table structure for table `app_category`
--

CREATE TABLE IF NOT EXISTS `app_category` (
  `id` int(11) NOT NULL,
  `category` varchar(45) NOT NULL,
  `description` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_category`
--

INSERT INTO `app_category` (`id`, `category`, `description`) VALUES
(1, 'Entertainment', NULL),
(2, 'Sports', NULL),
(3, 'Education', NULL),
(4, 'Games', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_register`
--

CREATE TABLE IF NOT EXISTS `app_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT '0',
  `reg_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `app_register`
--

INSERT INTO `app_register` (`id`, `user_id`, `app_id`, `rating`, `reg_date`) VALUES
(1, 1, 1, 2, '2014-09-27');

-- --------------------------------------------------------

--
-- Table structure for table `creditcard_dev`
--

CREATE TABLE IF NOT EXISTS `creditcard_dev` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `card_number` varchar(256) NOT NULL,
  `exp_month` int(11) NOT NULL,
  `exp_year` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `creditcard_user`
--

CREATE TABLE IF NOT EXISTS `creditcard_user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `card_number` varchar(256) NOT NULL,
  `exp_month` int(11) NOT NULL,
  `exp_year` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `developer`
--

CREATE TABLE IF NOT EXISTS `developer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `date_joined` date NOT NULL,
  `card_added` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dev_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `payment_type` int(11) NOT NULL,
  `payment_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `payment_type`
--

CREATE TABLE IF NOT EXISTS `payment_type` (
  `id` int(11) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
