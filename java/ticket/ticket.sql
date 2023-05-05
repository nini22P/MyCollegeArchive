/*
SQLyog Community v12.4.1 (64 bit)
MySQL - 5.7.20-log : Database - ticket
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ticket` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ticket`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `Id` char(20) NOT NULL COMMENT '管理员id',
  `Name` char(20) NOT NULL COMMENT '管理员姓名',
  `Password` char(20) NOT NULL COMMENT '管理员密码',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `Orderid` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `Userid` char(20) NOT NULL COMMENT '用户id',
  `Trainid` char(20) NOT NULL COMMENT '车次id',
  `Number` int(11) NOT NULL COMMENT '座号',
  PRIMARY KEY (`Orderid`),
  KEY `userid` (`Userid`),
  KEY `Trainid` (`Trainid`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`Userid`) REFERENCES `user` (`Phone`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`Trainid`) REFERENCES `train` (`Trainid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `train` */

DROP TABLE IF EXISTS `train`;

CREATE TABLE `train` (
  `Trainid` char(20) NOT NULL COMMENT '车次',
  `Startcity` char(20) NOT NULL COMMENT '起点城市',
  `Start` char(20) NOT NULL COMMENT '起点站',
  `Endcity` char(20) NOT NULL COMMENT '终点城市',
  `End` char(20) NOT NULL COMMENT '终点站',
  `Starttime` datetime NOT NULL COMMENT '出发时间',
  `Endtime` datetime NOT NULL COMMENT '到达时间',
  `Seatmode` int(11) NOT NULL COMMENT '座位类型：0无座1硬座2软座',
  `Number` int(11) NOT NULL COMMENT '票数量',
  `Carriage` int(11) NOT NULL COMMENT '车厢号',
  PRIMARY KEY (`Trainid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `Phone` char(20) NOT NULL COMMENT '电话号码',
  `Id` char(20) NOT NULL COMMENT '身份证号',
  `Name` char(20) NOT NULL COMMENT '姓名',
  `Password` char(20) NOT NULL COMMENT '密码',
  PRIMARY KEY (`Phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
