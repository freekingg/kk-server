/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80033
Source Host           : localhost:3306
Source Database       : ark_admin

Target Server Type    : MYSQL
Target Server Version : 80033
File Encoding         : 65001

Date: 2023-08-04 10:55:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_demo
-- ----------------------------
DROP TABLE IF EXISTS `sys_demo`;
CREATE TABLE `sys_demo` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `create_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `update_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `nickname` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态:  0=禁用 1=开启	',
  `order_num` int unsigned NOT NULL DEFAULT '0' COMMENT '排序值',
  `remark` varchar(200) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sys_demo
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned NOT NULL COMMENT '父级id',
  `name` varchar(50) NOT NULL COMMENT '部门简称',
  `full_name` varchar(50) NOT NULL COMMENT '部门全称',
  `unique_key` varchar(50) NOT NULL COMMENT '唯一标识',
  `type` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '类型: 1=公司 2=子公司 3=部门	',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态:  0=禁用 1=开启	',
  `order_num` int unsigned NOT NULL DEFAULT '0' COMMENT '排序值',
  `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `update_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_766061e1ba3cf8d34141322f4c` (`unique_key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '0', '方舟', '方舟互联', 'arklnk', '1', '1', '0', '', '2022-08-17 06:09:17.000000', '2022-08-22 06:13:54.000000');
INSERT INTO `sys_dept` VALUES ('2', '0', '思忆', '思忆技术', 'siyee', '1', '1', '0', '', '2022-08-19 10:40:10.000000', '2022-08-26 07:34:40.000000');

-- ----------------------------
-- Table structure for sys_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned NOT NULL DEFAULT '0' COMMENT '0=配置集 !0=父级id',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `type` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '类型: 1文本 2数字 3数组 4单选 5多选 6下拉 7日期 8时间 9单图 10多图 11单文件 12多文件',
  `unique_key` varchar(50) NOT NULL COMMENT '唯一标识',
  `value` varchar(2048) NOT NULL DEFAULT '' COMMENT '配置值',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态:  0=禁用 1=开启',
  `order_num` int unsigned NOT NULL DEFAULT '0' COMMENT '排序值',
  `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `update_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_4fd6110c71022bcb06cd3f27c6` (`unique_key`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统参数';

-- ----------------------------
-- Records of sys_dictionary
-- ----------------------------
INSERT INTO `sys_dictionary` VALUES ('1', '0', '系统配置', '0', 'sys', '', '1', '0', '', '2022-08-22 14:03:58.000000', '2022-08-23 05:25:31.000000');
INSERT INTO `sys_dictionary` VALUES ('2', '1', '默认密码', '1', 'sys_pwd', '123456', '1', '0', '新建用户默认密码', '2022-08-22 14:03:58.000000', '2022-08-28 12:41:39.000000');
INSERT INTO `sys_dictionary` VALUES ('3', '1', '更新个人密码', '1', 'sys_ch_pwd', '', '0', '0', '', '2022-08-25 07:18:47.000000', '2022-08-25 12:28:25.000000');
INSERT INTO `sys_dictionary` VALUES ('4', '1', '更新个人资料', '1', 'sys_userinfo', '', '0', '0', '', '2022-08-25 07:28:36.000000', '2022-08-27 05:20:52.000000');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '岗位名称',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态:  0=禁用 1=开启	',
  `order_num` int unsigned NOT NULL DEFAULT '0' COMMENT '排序值',
  `create_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `update_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_b44c104e9c8f38dcb0678a6070` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='工作岗位';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', '前端', '1', '0', '2022-08-17 07:15:56.000000', '2022-08-17 09:27:26.000000');
INSERT INTO `sys_job` VALUES ('2', '后端', '1', '0', '2022-08-17 07:15:56.000000', '2022-08-17 09:32:50.000000');
INSERT INTO `sys_job` VALUES ('3', '设计', '1', '0', '2022-08-17 07:15:56.000000', '2022-08-17 09:32:55.000000');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL COMMENT '操作账号',
  `ip` varchar(100) NOT NULL COMMENT 'ip',
  `uri` varchar(200) NOT NULL COMMENT '请求路径',
  `type` tinyint unsigned NOT NULL COMMENT '类型: 1=登录日志 2=操作日志',
  `request` varchar(2048) NOT NULL DEFAULT '' COMMENT '请求数据',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态: 0=失败 1=成功',
  `create_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `update_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_perm_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_perm_menu`;
CREATE TABLE `sys_perm_menu` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `router` varchar(1024) NOT NULL DEFAULT '' COMMENT '路由',
  `perms` varchar(1024) NOT NULL DEFAULT '' COMMENT '权限',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型: 0=目录 1=菜单 2=权限',
  `icon` varchar(200) NOT NULL DEFAULT '' COMMENT '图标',
  `order_num` int unsigned NOT NULL DEFAULT '0' COMMENT '排序值',
  `view_path` varchar(1024) NOT NULL DEFAULT '' COMMENT '页面路径',
  `is_show` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否显示: 0=隐藏 1=显示',
  `active_router` varchar(1024) NOT NULL DEFAULT '' COMMENT '当前激活的菜单',
  `create_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `update_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='权限&菜单';

-- ----------------------------
-- Records of sys_perm_menu
-- ----------------------------
INSERT INTO `sys_perm_menu` VALUES ('1', '0', '系统管理', '/sys', '[]', '0', 'carbon:settings', '0', '', '1', '', '2022-08-12 06:14:20.000000', '2022-08-29 06:33:04.000000');
INSERT INTO `sys_perm_menu` VALUES ('2', '1', '菜单管理', '/sys/menu', '[]', '1', '', '0', 'views/system/menu', '1', '', '2022-08-12 06:14:20.000000', '2022-08-23 13:32:44.000000');
INSERT INTO `sys_perm_menu` VALUES ('3', '2', '查询', '', '[\"sys/perm/menu/list\"]', '2', '', '0', '', '1', '', '2022-08-12 06:14:20.000000', '2022-08-23 13:35:53.000000');
INSERT INTO `sys_perm_menu` VALUES ('4', '2', '新增', '', '[\"sys/perm/menu/add\"]', '2', '', '0', '', '1', '', '2022-08-12 06:14:20.000000', '2022-08-23 13:37:07.000000');
INSERT INTO `sys_perm_menu` VALUES ('5', '2', '删除', '', '[\"sys/perm/menu/delete\"]', '2', '', '0', '', '1', '', '2022-08-12 06:14:20.000000', '2022-08-23 13:37:20.000000');
INSERT INTO `sys_perm_menu` VALUES ('6', '2', '更新', '', '[\"sys/perm/menu/update\"]', '2', '', '0', '', '1', '', '2022-08-12 06:14:20.000000', '2022-08-23 13:37:34.000000');
INSERT INTO `sys_perm_menu` VALUES ('7', '1', '角色管理', '/sys/role', '[]', '1', '', '0', 'views/system/role', '1', '', '2022-08-12 06:14:20.000000', '2022-08-23 13:33:26.000000');
INSERT INTO `sys_perm_menu` VALUES ('8', '7', '查询', '', '[\"sys/role/list\",\"sys/perm/menu/list\"]', '2', '', '0', '', '1', '', '2022-08-12 06:14:20.000000', '2022-08-23 13:35:53.000000');
INSERT INTO `sys_perm_menu` VALUES ('9', '7', '新增', '', '[\"sys/role/add\"]', '2', '', '0', '', '1', '', '2022-08-12 06:14:20.000000', '2022-08-23 13:37:07.000000');
INSERT INTO `sys_perm_menu` VALUES ('10', '7', '删除', '', '[\"sys/role/delete\"]', '2', '', '0', '', '1', '', '2022-08-12 06:14:20.000000', '2022-08-23 13:37:20.000000');
INSERT INTO `sys_perm_menu` VALUES ('11', '7', '更新', '', '[\"sys/role/update\"]', '2', '', '0', '', '1', '', '2022-08-12 06:14:20.000000', '2022-08-23 13:37:34.000000');
INSERT INTO `sys_perm_menu` VALUES ('13', '1', '部门管理', '/sys/dept', '[]', '1', '', '0', 'views/system/dept', '1', '', '2022-08-12 06:14:20.000000', '2022-08-23 13:33:40.000000');
INSERT INTO `sys_perm_menu` VALUES ('14', '13', '查询', '', '[\"sys/dept/list\"]', '2', '', '0', '', '1', '', '2022-08-12 06:14:20.000000', '2022-08-23 13:35:53.000000');
INSERT INTO `sys_perm_menu` VALUES ('15', '13', '新增', '', '[\"sys/dept/add\"]', '2', '', '0', '', '1', '', '2022-08-12 06:14:20.000000', '2022-08-23 13:37:07.000000');
INSERT INTO `sys_perm_menu` VALUES ('16', '13', '删除', '', '[\"sys/dept/delete\"]', '2', '', '0', '', '1', '', '2022-08-12 06:14:20.000000', '2022-08-23 13:37:20.000000');
INSERT INTO `sys_perm_menu` VALUES ('17', '13', '更新', '', '[\"sys/dept/update\"]', '2', '', '0', '', '1', '', '2022-08-12 06:14:20.000000', '2022-08-23 13:37:34.000000');
INSERT INTO `sys_perm_menu` VALUES ('18', '1', '岗位管理', '/sys/job', '[]', '1', '', '0', 'views/system/job', '1', '', '2022-08-12 06:14:20.000000', '2022-08-23 13:33:55.000000');
INSERT INTO `sys_perm_menu` VALUES ('19', '18', '查询', '', '[\"sys/job/page\"]', '2', '', '0', '', '1', '', '2022-08-12 06:14:20.000000', '2022-08-23 13:35:53.000000');
INSERT INTO `sys_perm_menu` VALUES ('20', '18', '新增', '', '[\"sys/job/add\"]', '2', '', '0', '', '1', '', '2022-08-12 06:14:20.000000', '2022-08-23 13:37:07.000000');
INSERT INTO `sys_perm_menu` VALUES ('21', '18', '删除', '', '[\"sys/job/delete\"]', '2', '', '0', '', '1', '', '2022-08-12 06:14:20.000000', '2022-08-23 13:37:20.000000');
INSERT INTO `sys_perm_menu` VALUES ('22', '18', '更新', '', '[\"sys/job/update\"]', '2', '', '0', '', '1', '', '2022-08-12 06:14:20.000000', '2022-08-23 13:37:34.000000');
INSERT INTO `sys_perm_menu` VALUES ('24', '1', '职称管理', '/sys/profession', '[]', '1', '', '0', 'views/system/profession', '1', '', '2022-08-12 06:14:20.000000', '2022-08-23 13:34:09.000000');
INSERT INTO `sys_perm_menu` VALUES ('25', '24', '查询', '', '[\"sys/profession/page\"]', '2', '', '0', '', '1', '', '2022-08-12 06:14:20.000000', '2022-08-23 13:35:53.000000');
INSERT INTO `sys_perm_menu` VALUES ('26', '24', '新增', '', '[\"sys/profession/add\"]', '2', '', '0', '', '1', '', '2022-08-12 06:14:20.000000', '2022-08-23 13:37:07.000000');
INSERT INTO `sys_perm_menu` VALUES ('27', '24', '删除', '', '[\"sys/profession/delete\"]', '2', '', '0', '', '1', '', '2022-08-12 06:14:20.000000', '2022-08-23 13:37:20.000000');
INSERT INTO `sys_perm_menu` VALUES ('28', '24', '更新', '', '[\"sys/profession/update\"]', '2', '', '0', '', '1', '', '2022-08-12 06:14:20.000000', '2022-08-23 13:37:34.000000');
INSERT INTO `sys_perm_menu` VALUES ('29', '1', '用户管理', '/sys/user', '[]', '1', '', '0', 'views/system/user', '1', '', '2022-08-12 06:14:20.000000', '2022-08-23 13:34:20.000000');
INSERT INTO `sys_perm_menu` VALUES ('30', '29', '查询', '', '[\"sys/user/page\",\"sys/dept/list\"]', '2', '', '0', '', '1', '', '2022-08-12 06:14:20.000000', '2022-08-24 07:46:56.000000');
INSERT INTO `sys_perm_menu` VALUES ('31', '29', '新增', '', '[\"sys/user/add\",\"sys/user/rdpj/info\"]', '2', '', '0', '', '1', '', '2022-08-12 06:14:20.000000', '2022-08-24 07:17:19.000000');
INSERT INTO `sys_perm_menu` VALUES ('32', '29', '删除', '', '[\"sys/user/delete\"]', '2', '', '0', '', '1', '', '2022-08-12 06:14:20.000000', '2022-08-23 13:37:20.000000');
INSERT INTO `sys_perm_menu` VALUES ('33', '29', '更新', '', '[\"sys/user/update\",\"sys/user/rdpj/info\"]', '2', '', '0', '', '1', '', '2022-08-12 06:14:20.000000', '2022-08-24 07:08:07.000000');
INSERT INTO `sys_perm_menu` VALUES ('34', '29', '改密', '', '[\"sys/user/password/update\"]', '2', '', '0', '', '1', '', '2022-08-12 06:14:20.000000', '2022-08-25 08:51:46.000000');
INSERT INTO `sys_perm_menu` VALUES ('36', '0', '配置管理', '/config', '[]', '0', 'icon-park-outline:setting-config', '0', '', '1', '', '2022-08-22 07:33:42.000000', '2022-08-29 06:33:20.000000');
INSERT INTO `sys_perm_menu` VALUES ('37', '36', '字典管理', '/config/dict', '[]', '1', '', '0', 'views/config/dict', '1', '', '2022-08-22 07:39:21.000000', '2022-08-23 13:33:47.000000');
INSERT INTO `sys_perm_menu` VALUES ('38', '37', '查询', '', '[\"config/dict/list\",\"config/dict/data/page\"]', '2', '', '0', '', '1', '', '2022-08-22 07:42:07.000000', '2022-08-23 13:35:53.000000');
INSERT INTO `sys_perm_menu` VALUES ('39', '37', '新增', '', '[\"config/dict/add\"]', '2', '', '0', '', '1', '', '2022-08-22 07:42:07.000000', '2022-08-23 13:37:07.000000');
INSERT INTO `sys_perm_menu` VALUES ('40', '37', '删除', '', '[\"config/dict/delete\"]', '2', '', '0', '', '1', '', '2022-08-22 07:42:07.000000', '2022-08-23 13:37:20.000000');
INSERT INTO `sys_perm_menu` VALUES ('41', '37', '更新', '', '[\"config/dict/update\"]', '2', '', '0', '', '1', '', '2022-08-22 07:42:07.000000', '2022-08-23 13:37:34.000000');
INSERT INTO `sys_perm_menu` VALUES ('42', '0', '日志管理', '/log', '[]', '0', 'ic:baseline-history', '0', '', '1', '', '2022-08-23 08:47:23.000000', '2022-08-29 06:37:21.000000');
INSERT INTO `sys_perm_menu` VALUES ('43', '42', '登录日志', '/log/login', '[]', '1', '', '0', 'views/log/login', '1', '', '2022-08-23 08:47:51.000000', '2022-08-23 13:42:43.000000');
INSERT INTO `sys_perm_menu` VALUES ('44', '43', '查询', '', '[\"log/login/page\"]', '2', '', '0', '', '1', '', '2022-08-22 07:42:07.000000', '2022-08-23 13:35:53.000000');
INSERT INTO `sys_perm_menu` VALUES ('45', '0', '开源文档', '/document', '[]', '0', 'material-symbols:chrome-reader-mode-outline-rounded', '0', '', '1', '', '2022-08-29 13:22:32.000000', '2022-08-29 13:30:37.000000');
INSERT INTO `sys_perm_menu` VALUES ('46', '45', '使用文档(内链)', '/document/arkdoc', '[]', '1', '', '0', 'https://docs.arklnk.com/admin/', '1', '', '2022-08-29 13:29:49.000000', '2022-08-29 13:31:22.000000');
INSERT INTO `sys_perm_menu` VALUES ('47', '45', '使用文档(外链)', 'https://docs.arklnk.com/admin/', '[]', '1', '', '0', '', '1', '', '2022-08-29 13:23:52.000000', '2022-08-29 13:32:13.000000');
INSERT INTO `sys_perm_menu` VALUES ('48', '45', '前端仓库', 'https://github.com/arklnk/ark-admin-vuenext', '[]', '1', '', '0', '', '1', '', '2022-08-29 13:25:53.000000', '2022-08-29 13:30:44.000000');
INSERT INTO `sys_perm_menu` VALUES ('49', '45', '后端仓库', 'https://github.com/arklnk/ark-admin-zero', '[]', '1', '', '0', '', '1', '', '2022-08-29 13:26:24.000000', '2022-08-29 13:30:47.000000');

-- ----------------------------
-- Table structure for sys_profession
-- ----------------------------
DROP TABLE IF EXISTS `sys_profession`;
CREATE TABLE `sys_profession` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '职称',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态: 0=禁用 1=开启',
  `order_num` int unsigned NOT NULL DEFAULT '0' COMMENT '排序值',
  `create_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `update_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_0d67db101327aaf3a7968cde1c` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='职称';

-- ----------------------------
-- Records of sys_profession
-- ----------------------------
INSERT INTO `sys_profession` VALUES ('1', 'CEO', '1', '0', '2022-08-17 09:09:26.000000', '2022-08-17 09:09:26.000000');
INSERT INTO `sys_profession` VALUES ('2', 'CTO', '1', '0', '2022-08-17 09:09:26.000000', '2022-08-17 09:09:26.000000');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `unique_key` varchar(50) NOT NULL COMMENT '唯一标识',
  `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '备注',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态: 0=禁用 1=开启',
  `order_num` int unsigned NOT NULL DEFAULT '0' COMMENT '排序值',
  `create_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `update_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `perm_menu_ids` text COMMENT '权限集',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_1e86ea91bf298553df1073c5fa` (`unique_key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '0', '超级管理员', 'root', '超级管理员', '1', '0', '2022-08-19 06:38:19.000000', '2022-08-26 07:35:54.000000', null);
INSERT INTO `sys_role` VALUES ('2', '0', '演示', 'demo', '', '1', '0', '2022-08-23 17:13:05.000000', '2022-08-28 12:42:47.000000', null);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(50) NOT NULL COMMENT '账号',
  `password` char(32) NOT NULL COMMENT '密码',
  `username` varchar(50) NOT NULL COMMENT '姓名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `avatar` varchar(400) NOT NULL DEFAULT '' COMMENT '头像',
  `gender` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '性别: 0=保密 1=女 2=男',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮件',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `profession_id` int unsigned NOT NULL COMMENT '职称',
  `job_id` int unsigned NOT NULL COMMENT '岗位',
  `dept_id` int unsigned NOT NULL COMMENT '部门',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态: 0=禁用 1=开启',
  `order_num` int unsigned NOT NULL DEFAULT '0' COMMENT '排序值',
  `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `update_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `role_ids` text COMMENT '角色集',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'arklnk', '596bfe4bb02db60c2a25965598529e7e', 'arklnk', 'arklnk', 'https://avataaars.io/?avatarStyle=Circle&topType=Hat&accessoriesType=Prescription02&facialHairType=BeardLight&facialHairColor=BrownDark&clotheType=Hoodie&clotheColor=Heather&eyeType=Default&eyebrowType=Default&mouthType=Default&skinColor=Light', '0', 'arklnk@163.com', '', '0', '0', '0', '1', '0', 'arklnk', '2022-08-11 10:19:45.000000', '2022-08-27 05:41:43.000000', null);
INSERT INTO `sys_user` VALUES ('2', 'demo', '596bfe4bb02db60c2a25965598529e7e', 'demo', '', 'https://avataaars.io/?avatarStyle=Circle&topType=Hat&accessoriesType=Sunglasses&facialHairType=Blank&clotheType=Hoodie&clotheColor=Heather&eyeType=Hearts&eyebrowType=UpDown&mouthType=Tongue&skinColor=DarkBrown', '0', '', '', '2', '2', '1', '1', '0', '', '2022-08-23 18:04:24.000000', '2022-08-28 12:44:01.000000', null);
