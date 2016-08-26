# Host: localhost  (Version: 5.5.19)
# Date: 2016-08-26 11:56:02
# Generator: MySQL-Front 5.3  (Build 4.205)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "sys_dictype"
#

DROP TABLE IF EXISTS `sys_dictype`;
CREATE TABLE `sys_dictype` (
  `dt_Id` varchar(64) NOT NULL DEFAULT '' COMMENT '标识',
  `dt_name` varchar(64) NOT NULL DEFAULT '' COMMENT '类型名',
  `dt_descr` varchar(200) NOT NULL DEFAULT '' COMMENT '描述',
  `dt_status` int(11) NOT NULL DEFAULT '0' COMMENT '状态{0：可用，1：不可用}',
  PRIMARY KEY (`dt_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表类型';

#
# Data for table "sys_dictype"
#

INSERT INTO `sys_dictype` VALUES ('Common','通用类型','',0),('Gender','性别','',0),('MenuType','菜单类型','',0),('UserStatus','用户状态','',0);
