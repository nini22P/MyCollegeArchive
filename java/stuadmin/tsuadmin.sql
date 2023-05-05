/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.20-log : Database - stuadmin
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`stuadmin` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `stuadmin`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `username` char(40) NOT NULL,
  `password` char(40) DEFAULT NULL,
  `name` char(40) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`username`,`password`,`name`) values ('123456','123456','233');

/*Table structure for table `classs` */

DROP TABLE IF EXISTS `classs`;

CREATE TABLE `classs` (
  `name` char(20) NOT NULL,
  `years` char(20) NOT NULL,
  `teacher` char(20) DEFAULT NULL,
  `classroom` char(20) DEFAULT NULL,
  `professional` char(20) DEFAULT NULL,
  `institute` char(20) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `teacher` (`teacher`),
  CONSTRAINT `classs_ibfk_1` FOREIGN KEY (`teacher`) REFERENCES `teacher` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `classs` */

insert  into `classs`(`name`,`years`,`teacher`,`classroom`,`professional`,`institute`) values ('1','18','123','123','软件','信息学院'),('2','18','234','234','设计','艺术学院');

/*Table structure for table `courses` */

DROP TABLE IF EXISTS `courses`;

CREATE TABLE `courses` (
  `courseid` int(11) NOT NULL,
  `course` char(20) DEFAULT NULL,
  `teacher` char(20) DEFAULT NULL,
  `classroom` char(20) DEFAULT NULL,
  `professional` char(20) DEFAULT NULL,
  `institute` char(20) DEFAULT NULL,
  PRIMARY KEY (`courseid`),
  KEY `teacher` (`teacher`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`teacher`) REFERENCES `teacher` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `courses` */

insert  into `courses`(`courseid`,`course`,`teacher`,`classroom`,`professional`,`institute`) values (0,'web','123','123','软件','信息学院'),(1,'design','234','234','设计','艺术学院');

/*Table structure for table `students` */

DROP TABLE IF EXISTS `students`;

CREATE TABLE `students` (
  `id` char(20) NOT NULL,
  `username` char(20) NOT NULL,
  `sex` char(10) NOT NULL,
  `classs` char(20) NOT NULL,
  `professional` char(40) NOT NULL,
  `institute` char(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `classs` (`classs`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`classs`) REFERENCES `classs` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `students` */

insert  into `students`(`id`,`username`,`sex`,`classs`,`professional`,`institute`) values ('007','007','男','2','设计','艺术学院'),('101','Alex','女','2','设计','艺术学院'),('102','Peter','男','1','软件','信息学院'),('105','33','女','1','软件','信息学院'),('106','222','男','1','网络','信息学院');

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `name` char(20) NOT NULL,
  `sex` char(20) DEFAULT NULL,
  `professional` char(20) DEFAULT NULL,
  `institute` char(20) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `teacher` */

insert  into `teacher`(`name`,`sex`,`professional`,`institute`) values ('123','男','软件','信息学院'),('234','女','设计','艺术学院');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
