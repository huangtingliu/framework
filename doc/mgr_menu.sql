# Host: localhost  (Version: 5.5.19)
# Date: 2016-08-26 11:55:10
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
  `mu_Usability` varchar(64) NOT NULL DEFAULT 'VISIBLE' COMMENT '可用性',
  PRIMARY KEY (`mu_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单';

#
# Data for table "mgr_menu"
#

INSERT INTO `mgr_menu` VALUES ('A001','博客管理','','fa-tencent-weibo','',1,'','NAVIGATOR','博客前台管理',61909,0,'ENABLE'),('A0010001','博客用户','A001','fa-users','',1,'','NAVIGATOR','博客注册用户管理',61632,0,'ENABLE'),('A0010002','文章管理','A001','fa-wpforms','',2,'','NAVIGATOR','博客用户文章管理',62104,0,'ENABLE'),('B001','统计分析','','fa-area-chart ','',2,'','NAVIGATOR','博客统计分析',61950,0,'ENABLE'),('B0010001','用户统计','B001','fa-bar-chart','',1,'','NAVIGATOR','',61568,0,'ENABLE'),('C001','系统管理','','fa-cogs','',8,'','NAVIGATOR','系统管理',61573,1,'ENABLE'),('C0010001','数据字典','C001','fa-university ','',1,'','NAVIGATOR','数据字典',61852,0,'ENABLE'),('C0010003','系统用户','C001','fa-users',' ',3,'BlogMgr.view.user.UserHome','NAVIGATOR','系统后台用户管理',61632,0,'ENABLE'),('C0010005','权限配置','C001','fa-user-secret','',5,'','NAVIGATOR','后台系统权限配置',61979,0,'ENABLE'),('C0010006','菜单配置','C001','fa-bars','',6,'BlogMgr.view.menu.MenuHome','NAVIGATOR','系统菜单管理',61641,0,'ENABLE'),('C0010007','登录日志','C001','fa-shield','',7,'','NAVIGATOR','前后台登录日志',61746,0,'ENABLE'),('C0010010','系统配置','C001','fa-cog','',10,'','NAVIGATOR','后台系统参数配置',61459,0,'ENABLE'),('D001','个人中心','','fa-user','',9,'','NAVIGATOR','当前用户管理',61447,0,'ENABLE'),('D0010001','本人信息','D001','fa-info','',1,'','NAVIGATOR','当前用户',61737,0,'ENABLE'),('Z001','开发者中心','','fa-bug','',10,'','NAVIGATOR','开发者调式工具',61832,0,'ENABLE'),('Z0010008','异常日志','Z001','fa-exclamation-triangle','',8,'','NAVIGATOR','前后台异常日志',61553,0,'ENABLE'),('Z0010009','jdbc日志','Z001','fa-database','',9,'','NAVIGATOR','数据库操作日志',61888,0,'ENABLE');
