/*
SQLyog Ultimate - MySQL GUI v8.2 
MySQL - 5.7.17-log : Database - cardata
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cardata` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `cardata`;

/*Table structure for table `sos_sys_log` */

DROP TABLE IF EXISTS `sos_sys_log`;

CREATE TABLE `sos_sys_log` (
  `login_id` varchar(50) DEFAULT NULL,
  `login_ip` varchar(100) DEFAULT NULL,
  `login_mac` varchar(100) DEFAULT NULL,
  `op_num` varchar(50) DEFAULT NULL,
  `op_func` varchar(100) DEFAULT NULL,
  `op_date` date DEFAULT NULL,
  `op_note` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sos_sys_log` */

insert  into `sos_sys_log`(`login_id`,`login_ip`,`login_mac`,`op_num`,`op_func`,`op_date`,`op_note`) values ('admin','127.0.0.1','00-00-00-00-00-00','','admin登录成功','2018-03-02',''),('admin','127.0.0.1','00-00-00-00-00-00','','admin登录成功','2018-03-02',''),('admin','127.0.0.1','00-00-00-00-00-00','','admin登录成功','2018-03-02',''),('admin','127.0.0.1','00-00-00-00-00-00','','admin登录成功','2018-03-02',''),('admin','127.0.0.1','00-00-00-00-00-00','','admin登录成功','2018-03-02',''),('admin','127.0.0.1','00-00-00-00-00-00','','admin登录成功','2018-03-02',''),('admin','127.0.0.1','00-00-00-00-00-00','','admin登录成功','2018-03-02',''),('admin','127.0.0.1','00-00-00-00-00-00','','admin登录成功','2018-03-02',''),('','127.0.0.1','00-00-00-00-00-00','','null登录失败','2018-03-02',''),('admin','127.0.0.1','00-00-00-00-00-00','','admin登录成功','2018-03-02',''),('admin','127.0.0.1','00-00-00-00-00-00','','admin登录成功','2018-03-02','');

/*Table structure for table `sos_sys_menu_info` */

DROP TABLE IF EXISTS `sos_sys_menu_info`;

CREATE TABLE `sos_sys_menu_info` (
  `id` varchar(10) DEFAULT NULL,
  `menuname` varchar(60) DEFAULT NULL,
  `menudesc` varchar(200) DEFAULT NULL,
  `zt` varchar(1) DEFAULT NULL,
  `menutype` varchar(1) DEFAULT NULL,
  `url` varchar(60) DEFAULT NULL,
  `target` varchar(20) DEFAULT NULL,
  `parentid` varchar(10) DEFAULT NULL,
  `creator` varchar(10) DEFAULT NULL,
  `creatdate` date DEFAULT NULL,
  `nm` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sos_sys_menu_info` */

insert  into `sos_sys_menu_info`(`id`,`menuname`,`menudesc`,`zt`,`menutype`,`url`,`target`,`parentid`,`creator`,`creatdate`,`nm`) values ('000001','权限管理','权限管理','1','0','0',NULL,'000000','000001',NULL,'z01'),('000000','系统菜单','系统菜单','1','0','0',NULL,NULL,NULL,NULL,'z'),('000002','工号管理','工号管理','1','1','../../user/userManage.do','main','000001','000001',NULL,'z0101'),('000003','角色管理','角色管理','1','1','../sm/role/roleQuery.do','main','000001','000001',NULL,'z0102'),('000004','菜单管理','菜单管理','1','1','../sm/menu/menuQuery.do','main','000001','000001',NULL,'z0103'),('000005','修改密码','修改密码','1','1','../web/user/modifyPassWd.jsp','main','000001','000001',NULL,'z0104'),('000006','查询统计','查询统计','1','0','0',NULL,'000000','admin',NULL,'z02'),('000007','操作日志','操作日志','1','1','../sm/cxtj/czrz/czrz.jsp','main','000006','000001',NULL,'z0201'),('000008','个性查询','个性查询','1','1','../sm/cxtj/gxcx/gxcx.jsp','main','000006','000001',NULL,'z0202');

/*Table structure for table `sos_sys_role_info` */

DROP TABLE IF EXISTS `sos_sys_role_info`;

CREATE TABLE `sos_sys_role_info` (
  `id` varchar(10) DEFAULT NULL,
  `rolename` varchar(40) DEFAULT NULL,
  `roledesc` varchar(100) DEFAULT NULL,
  `zt` varchar(1) DEFAULT NULL,
  `creator` varchar(10) DEFAULT NULL,
  `createdate` date DEFAULT NULL,
  `updater` varchar(6) DEFAULT NULL,
  `updatedate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sos_sys_role_info` */

insert  into `sos_sys_role_info`(`id`,`rolename`,`roledesc`,`zt`,`creator`,`createdate`,`updater`,`updatedate`) values ('000001','系统管理员\r\n','系统管理员\r\n','1','admin',NULL,NULL,NULL);

/*Table structure for table `sos_sys_role_menu` */

DROP TABLE IF EXISTS `sos_sys_role_menu`;

CREATE TABLE `sos_sys_role_menu` (
  `id` varchar(10) NOT NULL,
  `menuid` varchar(10) NOT NULL,
  `roleid` varchar(10) NOT NULL,
  `descr` varchar(100) DEFAULT NULL,
  `zt` varchar(1) DEFAULT NULL,
  `creator` varchar(10) DEFAULT NULL,
  `createdate` date DEFAULT NULL,
  `updater` varchar(6) DEFAULT NULL,
  `updatedate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sos_sys_role_menu` */

insert  into `sos_sys_role_menu`(`id`,`menuid`,`roleid`,`descr`,`zt`,`creator`,`createdate`,`updater`,`updatedate`) values ('000001','000001','000001','000001','1','000001',NULL,NULL,NULL),('000002','000002','000001','000001','1','000001',NULL,NULL,NULL),('000003','000003','000001','000001','1','000001',NULL,NULL,NULL),('000004','000004','000001','000001','1','000001',NULL,NULL,NULL),('000005','000005','000001','000001','1','000001',NULL,NULL,NULL),('000006','000006','000001','000001','1','000001',NULL,NULL,NULL),('000007','000007','000001','000001','1','000001',NULL,NULL,NULL),('000008','000000','000001','000001','1','000001',NULL,NULL,NULL),('000009','000008','000001','000001','1','000001',NULL,NULL,NULL);

/*Table structure for table `sos_sys_user_role` */

DROP TABLE IF EXISTS `sos_sys_user_role`;

CREATE TABLE `sos_sys_user_role` (
  `id` varchar(6) DEFAULT NULL,
  `userid` varchar(50) DEFAULT NULL,
  `roleid` varchar(50) DEFAULT NULL,
  `descr` varchar(50) DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `creatdate` date DEFAULT NULL,
  `zt` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sos_sys_user_role` */

insert  into `sos_sys_user_role`(`id`,`userid`,`roleid`,`descr`,`creator`,`creatdate`,`zt`) values ('000001','000001','000001',NULL,'000001',NULL,'1');

/*Table structure for table `sos_user` */

DROP TABLE IF EXISTS `sos_user`;

CREATE TABLE `sos_user` (
  `id` varchar(10) DEFAULT NULL,
  `loginid` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `usertype` varchar(2) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `adminid` varchar(20) DEFAULT NULL,
  `contactno` varchar(50) DEFAULT NULL,
  `cityid` varchar(8) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `adminflag` char(1) DEFAULT NULL,
  `status` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sos_user` */

insert  into `sos_user`(`id`,`loginid`,`password`,`usertype`,`username`,`adminid`,`contactno`,`cityid`,`company`,`remark`,`adminflag`,`status`) values ('000001','admin','admin','1','管理员','123','18666666666','0531','管理员','test','0','0');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
