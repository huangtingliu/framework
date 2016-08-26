# Host: localhost  (Version: 5.5.19)
# Date: 2016-08-26 14:26:43
# Generator: MySQL-Front 5.3  (Build 4.205)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "mgr_menu"
#

DROP TABLE IF EXISTS `mgr_menu`;
CREATE TABLE `mgr_menu` (
  `mu_Id` varchar(64) NOT NULL DEFAULT '' COMMENT '键',
  `mu_Name` varchar(64) NOT NULL DEFAULT '' COMMENT '名称',
  `mu_ParentId` varchar(64) DEFAULT '' COMMENT '父菜单',
  `mu_Icon` varchar(64) DEFAULT '' COMMENT '图标',
  `mu_Url` varchar(200) DEFAULT '' COMMENT '链接',
  `mu_Order` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `mu_ViewClass` varchar(64) NOT NULL DEFAULT '' COMMENT '视图类',
  `dic_Type` varchar(64) NOT NULL DEFAULT '' COMMENT '类型',
  `mu_Descr` varchar(200) DEFAULT '' COMMENT '解释',
  `mu_Glyph` int(11) DEFAULT '0' COMMENT 'glyph表示的图标',
  `mu_Expand` int(11) NOT NULL DEFAULT '0' COMMENT '是否展开',
  `dic_Usability` varchar(64) NOT NULL DEFAULT 'VISIBLE' COMMENT '可用性',
  PRIMARY KEY (`mu_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单';

#
# Data for table "mgr_menu"
#

INSERT INTO `mgr_menu` VALUES ('A001','博客管理','','','',1,'','NAVIGATOR','博客前台管理',58917,0,'ENABLE'),('A0010001','博客用户','A001','','',1,'','NAVIGATOR','博客注册用户管理',58901,0,'ENABLE'),('A0010002','文章管理','A001','','',2,'','NAVIGATOR','博客用户文章管理',59000,0,'ENABLE'),('B001','统计分析','','','',2,'','NAVIGATOR','博客统计分析',59012,0,'ENABLE'),('B0010001','用户统计','B001','','',1,'','NAVIGATOR','',59012,0,'ENABLE'),('C001','系统管理','','','',8,'','NAVIGATOR','系统管理',59019,1,'ENABLE'),('C0010001','数据字典','C001','','',1,'','NAVIGATOR','数据字典',58912,0,'ENABLE'),('C0010003','系统用户','C001','',' ',3,'BlogMgr.view.user.UserHome','NAVIGATOR','系统后台用户管理',58905,0,'ENABLE'),('C0010005','权限配置','C001','','',5,'','NAVIGATOR','后台系统权限配置',59060,0,'ENABLE'),('C0010006','菜单配置','C001','','',6,'BlogMgr.view.menu.MenuHome','NAVIGATOR','系统菜单管理',58974,0,'ENABLE'),('C0010007','登录日志','C001','','',7,'','NAVIGATOR','前后台登录日志',59002,0,'ENABLE'),('C0010010','系统配置','C001','','',10,'','NAVIGATOR','后台系统参数配置',58977,0,'ENABLE'),('D001','个人中心','','','',9,'','NAVIGATOR','当前用户管理',58902,0,'ENABLE'),('D0010001','本人信息','D001','','',1,'','NAVIGATOR','当前用户',58919,0,'ENABLE'),('Z001','开发者中心','','','',10,'','NAVIGATOR','开发者调式工具',58974,0,'ENABLE'),('Z0010008','异常日志','Z001','','',8,'','NAVIGATOR','前后台异常日志',58926,0,'ENABLE'),('Z0010009','jdbc日志','Z001','','',9,'','NAVIGATOR','数据库操作日志',58881,0,'ENABLE');
