--blog后台sql文件
DROP TABLE IF EXISTS mgr_menu;
CREATE TABLE mgr_menu (
  mu_Id varchar(64) NOT NULL DEFAULT '' COMMENT '键',
  mu_Name varchar(64) NOT NULL DEFAULT '' COMMENT '名称',
  mu_ParentId varchar(64) DEFAULT '''''' COMMENT '父菜单',
  mu_Icon varchar(64) DEFAULT '''''' COMMENT '图标',
  mu_Link varchar(200) DEFAULT '''''' COMMENT '链接',
  mu_Order int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  mu_Descr varchar(200) DEFAULT '''''' COMMENT '解释',
  mu_Glyph int(11) DEFAULT '0' COMMENT 'glyph表示的图标',
  mu_Expand int(11) NOT NULL DEFAULT '0' COMMENT '是否展开',
  PRIMARY KEY (mu_Id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单';

INSERT INTO mgr_menu VALUES ('A001','博客管理','','fa-tencent-weibo','',1,'博客前台管理',61909,0),
('A0010001','博客用户','A001','fa-users','',1,'博客注册用户管理',61632,0),
('A0010002','文章管理','A001','fa-wpforms','',2,'博客用户文章管理',62104,0),
('B001','统计分析','','fa-area-chart ','',2,'博客统计分析',61950,0),
('B0010001','用户统计','B001','fa-bar-chart','',1,'',61568,0),
('C001','系统管理','','fa-cogs','',8,'系统管理',61573,1),
('C0010001','数据字典','C001','fa-university ','',1,'数据字典',61852,0),
('C0010003','系统用户','C001','fa-users',' ',3,'系统后台用户管理',61632,0),
('C0010005','权限配置','C001','fa-user-secret','',5,'后台系统权限配置',61979,0),
('C0010006','菜单配置','C001','fa-bars','',6,'系统菜单管理',61641,0),
('C0010007','登录日志','C001','fa-shield','',7,'前后台登录日志',61746,0),
('C0010010','系统配置','C001','fa-cog','',10,'后台系统参数配置',61459,0),
('D001','个人中心','','fa-user','',9,'当前用户管理',61447,0),
('D0010001','本人信息','D001','fa-info','',1,'当前用户',61737,0),
('Z001','开发者中心','','fa-bug','',10,'开发者调式工具',61832,0),
('Z0010008','异常日志','Z001','fa-exclamation-triangle','',8,'前后台异常日志',61553,0),
('Z0010009','jdbc日志','Z001','fa-database','',9,'数据库操作日志',61888,0);

--==================--------
DROP TABLE IF EXISTS mgr_userinfo;
CREATE TABLE mgr_userinfo (
  ui_Id varchar(64) NOT NULL DEFAULT '',
  ui_Name varchar(64) NOT NULL DEFAULT '' COMMENT '用户名',
  ui_Account varchar(20) NOT NULL DEFAULT '' COMMENT '登录账号',
  ui_Password varchar(20) NOT NULL DEFAULT '' COMMENT '密码',
  dic_Status varchar(64) NOT NULL DEFAULT '' COMMENT '用户状态',
  ui_PinYin varchar(200) NOT NULL DEFAULT '' COMMENT '拼音',
  ui_Descr varchar(200) DEFAULT NULL COMMENT '备注',
  ui_CreaterDate datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建日期',
  ui_Creater varchar(64) NOT NULL DEFAULT '' COMMENT '创建人',
  ui_Editor varchar(64) DEFAULT NULL COMMENT '修改人',
  ui_EditDate datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (ui_Id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台用户';


INSERT INTO mgr_userinfo VALUES ('3c498ad2a8c24e7887b6f85316b5e746','系统管理员','root','123456','enabel','root','后台超级管理员','2016-07-03 17:49:02','root','',NULL);










