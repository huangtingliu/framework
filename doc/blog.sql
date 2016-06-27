/*
Navicat MySQL Data Transfer

Source Server         : 本机
Source Server Version : 50024
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50024
File Encoding         : 65001

Date: 2016-06-27 09:29:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_blog
-- ----------------------------
DROP TABLE IF EXISTS `t_blog`;
CREATE TABLE `t_blog` (
  `blog_id` varchar(50) NOT NULL COMMENT '博文id',
  `title` varchar(100) default NULL COMMENT '标题',
  `html` text COMMENT '博文直接显示的html内容',
  `markdown` text COMMENT 'markdown编辑的内容',
  `preview_html` text COMMENT '预览窗口html',
  `type` varchar(20) default NULL COMMENT '类型',
  `author` varchar(50) default NULL COMMENT '作者(用户表的UUID）',
  `create_time` varchar(50) default NULL COMMENT '创建时间',
  PRIMARY KEY  (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` varchar(50) NOT NULL COMMENT '唯一标识UUID',
  `user_code` varchar(20) default NULL COMMENT '登录账号',
  `user_password` varchar(20) default NULL COMMENT '登录密码',
  `user_name` varchar(20) default NULL COMMENT '昵称',
  `sex` char(1) default NULL COMMENT '性别（0：男  1：女）',
  `email` varchar(20) default NULL COMMENT '邮箱',
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
