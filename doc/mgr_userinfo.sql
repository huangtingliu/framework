# Host: localhost  (Version: 5.5.19)
# Date: 2016-08-26 11:55:41
# Generator: MySQL-Front 5.3  (Build 4.205)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "mgr_userinfo"
#

DROP TABLE IF EXISTS `mgr_userinfo`;
CREATE TABLE `mgr_userinfo` (
  `ui_Id` varchar(64) NOT NULL DEFAULT '',
  `ui_Name` varchar(64) NOT NULL DEFAULT '' COMMENT '用户名',
  `ui_Account` varchar(100) NOT NULL DEFAULT '' COMMENT '登录账号',
  `ui_Password` varchar(64) NOT NULL DEFAULT '' COMMENT '密码',
  `dic_Status` varchar(64) NOT NULL DEFAULT 'ENABLE' COMMENT '用户状态',
  `dic_Gender` varchar(64) NOT NULL DEFAULT 'UNKNOW' COMMENT '性别',
  `ui_PinYin` varchar(200) NOT NULL DEFAULT '' COMMENT '拼音',
  `ui_Descr` varchar(200) NOT NULL DEFAULT '' COMMENT '备注',
  `ui_Email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮箱',
  `ui_Phone` varchar(15) NOT NULL DEFAULT '' COMMENT '电话',
  `ui_Creater` varchar(64) NOT NULL DEFAULT '' COMMENT '创建人',
  `ui_CreateDate` datetime DEFAULT NULL COMMENT '创建日期',
  `ui_Editor` varchar(64) NOT NULL DEFAULT '' COMMENT '修改人',
  `ui_EditDate` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`ui_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台用户';

#
# Data for table "mgr_userinfo"
#

INSERT INTO `mgr_userinfo` VALUES ('3c498ad2a8c24e7887b6f85316b5e746','系统管理员','root','123456','enabel','','root','后台超级管理员','','','root','2016-07-03 17:49:02','',NULL),('c985a2266ec34e75b306f97b109d54dd','明厅','a4544564','fa246d0262c3925617b0c72bb20eeb1d','ENABLE','MALE','mingting','','','','root','2016-08-26 11:50:05','',NULL);
