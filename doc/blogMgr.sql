--blog后台sql文件
DROP TABLE IF EXISTS mgr_menu;
CREATE TABLE mgr_menu (
  mu_Id varchar(64) NOT NULL DEFAULT '' COMMENT '键',
  mu_Name varchar(64) NOT NULL DEFAULT '' COMMENT '名称',
  mu_ParentId varchar(64) DEFAULT NULL COMMENT '父菜单',
  mu_Icon varchar(64) DEFAULT NULL COMMENT '图标',
  mu_Link varchar(200) DEFAULT NULL COMMENT '链接',
  mu_Order int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  mu_Descr varchar(200) DEFAULT NULL COMMENT '解释',
  mu_Glyph int(11) DEFAULT NULL COMMENT 'glyph表示的图标',
  mu_Expand int(11) NOT NULL DEFAULT '0' COMMENT '是否展开',
  PRIMARY KEY (mu_Id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单';

delete from mgr_menu
insert into mgr_menu values(
       'ec8552151da24cd8b6104cf2ac83236c',
       '博客管理',
        '','','',0,'博客前台管理',0,0 
);

insert into mgr_menu values(
       '78c11adacc484409b94c426612cd0eda',
       '系统管理',
        '','','',1,'',0,1 
);

insert into mgr_menu values(
       '637370f534714fb384456c9d53474624',
       '个人中心',
        '','','',2,'',0,0 
);

insert into mgr_menu values(
       'df7a19eed0d04fffa617f6bb8ff8af60',
       '开发者中心',
        '','','',3,'',0,0 
);
