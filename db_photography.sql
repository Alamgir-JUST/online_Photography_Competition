-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 05, 2019 at 05:31 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_photography`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_competition`
--

CREATE TABLE `tbl_competition` (
  `competitionId` varchar(100) NOT NULL,
  `userId` varchar(100) DEFAULT NULL,
  `competitionType` varchar(255) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date NOT NULL,
  `prizes` varchar(100) NOT NULL,
  `comments` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_competition`
--

INSERT INTO `tbl_competition` (`competitionId`, `userId`, `competitionType`, `startDate`, `endDate`, `prizes`, `comments`) VALUES
('bangladesh', 'alamgir_just', 'dfgfgdfh', '2019-06-12', '2019-06-28', '1000/-', ''),
('dsfgdfgdfg', 'alamgir_just', 'gdfgdfg', '2019-06-12', '2019-06-06', '2433434', '345435345'),
('pakistan', 'alamgir_just', NULL, '2019-07-12', '2019-07-19', '1000, 20000/-', 'This is is very sensiive..'),
('tytdyutyutyuyt', 'abc', 'yyyyyyyyy', '2019-07-03', '2019-07-11', '234234', 'rds srtaeter');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_competitor`
--

CREATE TABLE `tbl_competitor` (
  `cId` int(11) NOT NULL,
  `competitorId` varchar(255) DEFAULT NULL,
  `competitionId` varchar(255) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `designation` varchar(200) DEFAULT NULL,
  `picture` varchar(500) DEFAULT NULL,
  `pictureId` varchar(255) DEFAULT NULL,
  `comments` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_competitor`
--

INSERT INTO `tbl_competitor` (`cId`, `competitorId`, `competitionId`, `mobile`, `designation`, `picture`, `pictureId`, `comments`) VALUES
(5, 'alamgir_just', 'bangladesh', '6786456', 'eeeeee', 'images\\dgdg.jpg', 'jfgfg', 'fdh ghfgdsdf fd'),
(6, 'xxx', 'bangladesh', '01768308100', 'tyertytry', 'images\\c950295.png', 'fjfghjg', 'dfv safdfa adf'),
(7, 'alamgir_just', 'bangladesh', '01767130845', 'cse', 'images\\newpic.jpg', 'ukkkkuuu', 'fg rs gfd gfg g');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `userId` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `address` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`userId`, `name`, `password`, `email`, `address`) VALUES
('abc', 'dfgdfgdfg', '123', 'xcgvdfb', 'xvbcb'),
('alamgir_cse', 'Alamgir', '12345', 'optimistic.alamgir@gmail.com', 'Dhormotola'),
('alamgir_just', 'Alamgir Hossain', '12345', 'alamgir.cse14.just@gmail.com', 'Magura'),
('gjh', 'et6uyjyjfyjhd', 'fhjfjfjhjf', 'dfdrf@gmail.com', 'drg sry rty rty'),
('xxx', 'sfd gdfgdfg', '123', 'dfdrf@gmail.com', 'gc fh hdh ');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vote`
--

CREATE TABLE `tbl_vote` (
  `id` int(11) NOT NULL,
  `cId` varchar(100) NOT NULL,
  `userId` varchar(255) DEFAULT NULL,
  `pictureId` varchar(255) DEFAULT NULL,
  `vName` varchar(255) DEFAULT NULL,
  `vMail` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_vote`
--

INSERT INTO `tbl_vote` (`id`, `cId`, `userId`, `pictureId`, `vName`, `vMail`, `time`) VALUES
(7, 'bangladesh', 'alamgir_just', 'jfgfg', 'adgdsg', 'dfgdfgdfg', '2019-07-02 12:21:23'),
(8, 'bangladesh', 'alamgir_just', 'fjfghjg', 'xfgh', 'optimistic.alamgir@gmail.com', '2019-07-04 12:40:44'),
(9, 'bangladesh', 'alamgir_just', 'ukkkkuuu', 'dfggf', 'gfhgj', '2019-07-04 12:40:54'),
(10, 'bangladesh', 'alamgir_just', 'jfgfg', 'fghfgh', 'fghfghfgh', '2019-07-04 12:41:07'),
(11, 'magura', 'alamgir_cse', 'xxxx', 'Alamgir Hossain', 'alamgir@gmail.com', '2019-07-19 00:00:00');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_competition`
--
CREATE TABLE `v_competition` (
`userId` varchar(100)
,`name` varchar(100)
,`email` varchar(200)
,`address` varchar(400)
,`competitionId` varchar(100)
,`startDate` date
,`endDate` date
,`prizes` varchar(100)
,`mobile` varchar(50)
,`designation` varchar(200)
,`pictureId` varchar(255)
,`picture` varchar(500)
,`comments` varchar(500)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_pcompetition`
--
CREATE TABLE `v_pcompetition` (
`userId` varchar(100)
,`name` varchar(100)
,`email` varchar(200)
,`address` varchar(400)
,`competitionId` varchar(100)
,`competitionType` varchar(255)
,`startDate` date
,`endDate` date
,`prizes` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_position`
--
CREATE TABLE `v_position` (
`userId` varchar(255)
,`cId` varchar(100)
,`pictureId` varchar(255)
,`t_vote` bigint(21)
);

-- --------------------------------------------------------

--
-- Structure for view `v_competition`
--
DROP TABLE IF EXISTS `v_competition`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_competition`  AS  select `u`.`userId` AS `userId`,`u`.`name` AS `name`,`u`.`email` AS `email`,`u`.`address` AS `address`,`c`.`competitionId` AS `competitionId`,`c`.`startDate` AS `startDate`,`c`.`endDate` AS `endDate`,`c`.`prizes` AS `prizes`,`ct`.`mobile` AS `mobile`,`ct`.`designation` AS `designation`,`ct`.`pictureId` AS `pictureId`,`ct`.`picture` AS `picture`,`ct`.`comments` AS `comments` from ((`tbl_user` `u` join `tbl_competition` `c`) join `tbl_competitor` `ct`) where ((`u`.`userId` = `c`.`userId`) and (`c`.`competitionId` = `ct`.`competitionId`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_pcompetition`
--
DROP TABLE IF EXISTS `v_pcompetition`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_pcompetition`  AS  select `u`.`userId` AS `userId`,`u`.`name` AS `name`,`u`.`email` AS `email`,`u`.`address` AS `address`,`c`.`competitionId` AS `competitionId`,`c`.`competitionType` AS `competitionType`,`c`.`startDate` AS `startDate`,`c`.`endDate` AS `endDate`,`c`.`prizes` AS `prizes` from (`tbl_user` `u` join `tbl_competition` `c`) where (`u`.`userId` = `c`.`userId`) ;

-- --------------------------------------------------------

--
-- Structure for view `v_position`
--
DROP TABLE IF EXISTS `v_position`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_position`  AS  select `tbl_vote`.`userId` AS `userId`,`tbl_vote`.`cId` AS `cId`,`tbl_vote`.`pictureId` AS `pictureId`,count(0) AS `t_vote` from `tbl_vote` group by `tbl_vote`.`cId`,`tbl_vote`.`pictureId`,`tbl_vote`.`userId` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_competition`
--
ALTER TABLE `tbl_competition`
  ADD PRIMARY KEY (`competitionId`);

--
-- Indexes for table `tbl_competitor`
--
ALTER TABLE `tbl_competitor`
  ADD PRIMARY KEY (`cId`),
  ADD UNIQUE KEY `pictureId` (`pictureId`),
  ADD KEY `competitorId` (`competitorId`),
  ADD KEY `competitionId` (`competitionId`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `tbl_vote`
--
ALTER TABLE `tbl_vote`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_competitor`
--
ALTER TABLE `tbl_competitor`
  MODIFY `cId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tbl_vote`
--
ALTER TABLE `tbl_vote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_competitor`
--
ALTER TABLE `tbl_competitor`
  ADD CONSTRAINT `tbl_competitor_ibfk_1` FOREIGN KEY (`competitorId`) REFERENCES `tbl_user` (`userId`),
  ADD CONSTRAINT `tbl_competitor_ibfk_2` FOREIGN KEY (`competitionId`) REFERENCES `tbl_competition` (`competitionId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
