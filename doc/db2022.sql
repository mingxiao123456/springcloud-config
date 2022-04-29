{\rtf1\ansi\ansicpg936\cocoartf2580
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;\f1\fnil\fcharset134 PingFangSC-Regular;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww15100\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 CREATE DATABASE seata_order; \
USE seata_order;\
CREATE TABLE `t_order`  (\
  `int` bigint(11) NOT NULL AUTO_INCREMENT,\
  `user_id` bigint(20) DEFAULT NULL COMMENT '
\f1 \'d3\'c3\'bb\'a7
\f0 id',\
  `product_id` bigint(11) DEFAULT NULL COMMENT '
\f1 \'b2\'fa\'c6\'b7
\f0 id',\
  `count` int(11) DEFAULT NULL COMMENT '
\f1 \'ca\'fd\'c1\'bf
\f0 ',\
  `money` decimal(11, 0) DEFAULT NULL COMMENT '
\f1 \'bd\'f0\'b6\'ee
\f0 ',\
  `status` int(1) DEFAULT NULL COMMENT '
\f1 \'b6\'a9\'b5\'a5\'d7\'b4\'cc\'ac
\f0 :  0:
\f1 \'b4\'b4\'bd\'a8\'d6\'d0
\f0  1:
\f1 \'d2\'d1\'cd\'ea\'bd\'e1
\f0 ',\
  PRIMARY KEY (`int`) USING BTREE\
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '
\f1 \'b6\'a9\'b5\'a5\'b1\'ed
\f0 ' ROW_FORMAT = Dynamic;\
\
CREATE TABLE `undo_log` (\
  `id` bigint(20) NOT NULL AUTO_INCREMENT,\
  `branch_id` bigint(20) NOT NULL,\
  `xid` varchar(100) NOT NULL,\
  `context` varchar(128) NOT NULL,\
  `rollback_info` longblob NOT NULL,\
  `log_status` int(11) NOT NULL,\
  `log_created` datetime NOT NULL,\
  `log_modified` datetime NOT NULL,\
  `ext` varchar(100) DEFAULT NULL,\
  PRIMARY KEY (`id`),\
  UNIQUE KEY `ux_undo_log` (`xid`,`branch_id`)\
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;\
\
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf0 CREATE DATABASE seata_storage;\
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf0 USE seata_storage;\
DROP TABLE IF EXISTS `t_storage`;\
CREATE TABLE `t_storage`  (\
  `int` bigint(11) NOT NULL AUTO_INCREMENT,\
  `product_id` bigint(11) DEFAULT NULL COMMENT '
\f1 \'b2\'fa\'c6\'b7
\f0 id',\
  `total` int(11) DEFAULT NULL COMMENT '
\f1 \'d7\'dc\'bf\'e2\'b4\'e6
\f0 ',\
  `used` int(11) DEFAULT NULL COMMENT '
\f1 \'d2\'d1\'d3\'c3\'bf\'e2\'b4\'e6
\f0 ',\
  `residue` int(11) DEFAULT NULL COMMENT '
\f1 \'ca\'a3\'d3\'e0\'bf\'e2\'b4\'e6
\f0 ',\
  PRIMARY KEY (`int`) USING BTREE\
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '
\f1 \'bf\'e2\'b4\'e6
\f0 ' ROW_FORMAT = Dynamic;\
\
CREATE TABLE `undo_log` (\
  `id` bigint(20) NOT NULL AUTO_INCREMENT,\
  `branch_id` bigint(20) NOT NULL,\
  `xid` varchar(100) NOT NULL,\
  `context` varchar(128) NOT NULL,\
  `rollback_info` longblob NOT NULL,\
  `log_status` int(11) NOT NULL,\
  `log_created` datetime NOT NULL,\
  `log_modified` datetime NOT NULL,\
  `ext` varchar(100) DEFAULT NULL,\
  PRIMARY KEY (`id`),\
  UNIQUE KEY `ux_undo_log` (`xid`,`branch_id`)\
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;\
INSERT INTO `t_storage` VALUES (1, 1, 100, 0, 100);\
\
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf0 CREATE DATABASE seata_account;\
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf0 USE seata_account;\
DROP TABLE IF EXISTS `t_account`;\
CREATE TABLE `t_account`  (\
  `id` bigint(11) NOT NULL COMMENT 'id',\
  `user_id` bigint(11) DEFAULT NULL COMMENT '
\f1 \'d3\'c3\'bb\'a7
\f0 id',\
  `total` decimal(10, 0) DEFAULT NULL COMMENT '
\f1 \'d7\'dc\'b6\'ee\'b6\'c8
\f0 ',\
  `used` decimal(10, 0) DEFAULT NULL COMMENT '
\f1 \'d2\'d1\'d3\'c3\'d3\'e0\'b6\'ee
\f0 ',\
  `residue` decimal(10, 0) DEFAULT NULL COMMENT '
\f1 \'ca\'a3\'d3\'e0\'bf\'c9\'d3\'c3\'b6\'ee\'b6\'c8
\f0 ',\
  PRIMARY KEY (`id`) USING BTREE\
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '
\f1 \'d5\'cb\'bb\'a7\'b1\'ed
\f0 ' ROW_FORMAT = Dynamic;\
INSERT INTO `t_account` VALUES (1, 1, 1000, 0, 1000);\
\
CREATE TABLE `undo_log` (\
  `id` bigint(20) NOT NULL AUTO_INCREMENT,\
  `branch_id` bigint(20) NOT NULL,\
  `xid` varchar(100) NOT NULL,\
  `context` varchar(128) NOT NULL,\
  `rollback_info` longblob NOT NULL,\
  `log_status` int(11) NOT NULL,\
  `log_created` datetime NOT NULL,\
  `log_modified` datetime NOT NULL,\
  `ext` varchar(100) DEFAULT NULL,\
  PRIMARY KEY (`id`),\
  UNIQUE KEY `ux_undo_log` (`xid`,`branch_id`)\
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;\
}