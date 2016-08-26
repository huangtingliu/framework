# Host: localhost  (Version: 5.5.19)
# Date: 2016-08-26 11:55:55
# Generator: MySQL-Front 5.3  (Build 4.205)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "sys_dictionary"
#

DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary` (
  `dic_id` varchar(64) NOT NULL DEFAULT '' COMMENT '健',
  `dt_Type` varchar(255) NOT NULL DEFAULT '' COMMENT '类型',
  `dic_Name` varchar(64) NOT NULL DEFAULT '' COMMENT '名称',
  `dic_Code` int(5) NOT NULL DEFAULT '0' COMMENT '值',
  `dic_Descr` varchar(200) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`dic_id`,`dt_Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通用数据字典';

#
# Data for table "sys_dictionary"
#

INSERT INTO `sys_dictionary` VALUES ('DISABLE','Common','不可用',1,''),('DISABLE','UserStatus','不可用',1,''),('ENABLE','Common','可用',0,'可用'),('ENABLE','UserStatus','可用',0,''),('FEMALE','Gender','女',2,''),('INVISIBLE','Common','不可见',1,''),('MALE','Gender','男',1,''),('NAVIGATOR','MenuType','导航菜单',0,''),('TOOLBAR','MenuType','工具栏',1,''),('UNKNOW','Gender','未知',0,''),('VISIBLE','Common','可见',0,'');
