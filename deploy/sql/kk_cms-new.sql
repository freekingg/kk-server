/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : kk_cms

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 08/09/2023 14:10:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_demo
-- ----------------------------
DROP TABLE IF EXISTS `sys_demo`;
CREATE TABLE `sys_demo` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `create_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `update_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态:  0=禁用 1=开启	',
  `order_num` int unsigned NOT NULL DEFAULT '0' COMMENT '排序值',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
BEGIN;
INSERT INTO `sys_dept` VALUES (2, 0, '一部', '一部技术', 'siyee', 1, 1, 0, '', '2022-08-19 10:40:10.000000', '2023-08-10 19:00:29.000000');
COMMIT;

-- ----------------------------
-- Table structure for sys_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned NOT NULL DEFAULT '0' COMMENT '0=配置集 !0=父级id',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `type` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '类型: 1=一级 2=二级',
  `unique_key` varchar(50) NOT NULL DEFAULT '' COMMENT '标识',
  `value` varchar(2048) NOT NULL DEFAULT '' COMMENT '配置值',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态:  0=禁用 1=开启',
  `order_num` int unsigned NOT NULL DEFAULT '0' COMMENT '排序值',
  `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `update_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统参数';

-- ----------------------------
-- Records of sys_dictionary
-- ----------------------------
BEGIN;
INSERT INTO `sys_dictionary` VALUES (1, 0, '系统配置', 1, 'sys', '', 1, 0, 'dfd', '2022-08-22 14:03:58.000000', '2023-08-08 15:41:25.000000');
INSERT INTO `sys_dictionary` VALUES (2, 1, '默认密码', 2, 'sys_pwd', '123456', 1, 0, '新建用户默认密码', '2022-08-22 14:03:58.000000', '2023-08-08 16:19:16.000000');
INSERT INTO `sys_dictionary` VALUES (3, 1, '更新个人密码', 2, 'sys_ch_pwd', '1', 1, 0, '', '2022-08-25 07:18:47.000000', '2023-08-08 16:19:06.000000');
INSERT INTO `sys_dictionary` VALUES (4, 1, '更新个人资料', 2, 'sys_userinfo', '1', 1, 0, '', '2022-08-25 07:28:36.000000', '2023-08-08 16:19:00.000000');
INSERT INTO `sys_dictionary` VALUES (6, 0, 'test1', 1, 'test', '', 1, 0, '', '2023-08-08 15:54:58.473360', '2023-08-08 15:55:08.000000');
INSERT INTO `sys_dictionary` VALUES (8, 0, '岗位状态', 1, 'job_status', '', 1, 0, '', '2023-08-08 19:18:50.418009', '2023-08-08 19:26:02.000000');
INSERT INTO `sys_dictionary` VALUES (9, 8, '禁用', 2, '8-0', '0', 1, 0, '', '2023-08-08 19:19:16.641804', '2023-09-08 14:10:06.503180');
INSERT INTO `sys_dictionary` VALUES (10, 8, '开启', 2, '8-1', '1', 1, 0, '', '2023-08-08 19:19:27.618391', '2023-09-08 14:10:10.767274');
INSERT INTO `sys_dictionary` VALUES (11, 0, '性别', 1, 'gender', '', 1, 0, '', '2023-09-06 15:36:29.313821', '2023-09-06 15:36:29.313821');
INSERT INTO `sys_dictionary` VALUES (12, 11, '男性', 2, '11-0', '0', 1, 0, '', '2023-09-06 15:36:51.258962', '2023-09-08 14:10:18.655701');
COMMIT;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='工作岗位';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
BEGIN;
INSERT INTO `sys_job` VALUES (1, '技术', 1, 1, '2022-08-17 07:15:56.000000', '2023-09-06 14:56:59.000000');
COMMIT;

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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_log` VALUES (1, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"arklnk\",\"verifyCode\":\"4609\",\"captchaId\":\"wKRY8sLlfF\"}', 1, '2023-08-07 10:24:04.175275', '2023-08-07 10:24:04.175275');
INSERT INTO `sys_log` VALUES (2, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"arklnk\",\"verifyCode\":\"6513\",\"captchaId\":\"OP6_QxgcJQ\"}', 1, '2023-08-07 10:34:12.994329', '2023-08-07 10:34:12.994329');
INSERT INTO `sys_log` VALUES (3, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"arklnk\",\"verifyCode\":\"4999\",\"captchaId\":\"3a_NHDDScy\"}', 1, '2023-08-07 10:34:39.705440', '2023-08-07 10:34:39.705440');
INSERT INTO `sys_log` VALUES (4, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"arklnk\",\"verifyCode\":\"8218\",\"captchaId\":\"Gl0k41Na34\"}', 1, '2023-08-07 10:37:00.505069', '2023-08-07 10:37:00.505069');
INSERT INTO `sys_log` VALUES (5, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"arklnk\",\"verifyCode\":\"4863\",\"captchaId\":\"VHex70V_DT\"}', 1, '2023-08-07 11:04:43.451836', '2023-08-07 11:04:43.451836');
INSERT INTO `sys_log` VALUES (6, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"arklnk\",\"verifyCode\":\"4479\",\"captchaId\":\"hvQ01bjG0q\"}', 1, '2023-08-07 11:06:55.627627', '2023-08-07 11:06:55.627627');
INSERT INTO `sys_log` VALUES (7, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"arklnk\",\"verifyCode\":\"9359\",\"captchaId\":\"Lks-3G7wCv\"}', 1, '2023-08-07 11:39:35.388330', '2023-08-07 11:39:35.388330');
INSERT INTO `sys_log` VALUES (8, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"arklnk\",\"verifyCode\":\"8028\",\"captchaId\":\"oDPducbo2R\"}', 1, '2023-08-07 11:53:11.401009', '2023-08-07 11:53:11.401009');
INSERT INTO `sys_log` VALUES (9, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"arklnk\",\"verifyCode\":\"6063\",\"captchaId\":\"TTjaW-PwB6\"}', 1, '2023-08-07 11:54:10.265639', '2023-08-07 11:54:10.265639');
INSERT INTO `sys_log` VALUES (10, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"arklnk\",\"verifyCode\":\"5436\",\"captchaId\":\"n-4KzmIfP4\"}', 1, '2023-08-07 11:56:07.622416', '2023-08-07 11:56:07.622416');
INSERT INTO `sys_log` VALUES (11, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"arklnk\",\"verifyCode\":\"3784\",\"captchaId\":\"fDTBT7miXJ\"}', 1, '2023-08-07 11:59:47.074607', '2023-08-07 11:59:47.074607');
INSERT INTO `sys_log` VALUES (12, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"arklnk\",\"verifyCode\":\"9953\",\"captchaId\":\"6_YAiwfJ4J\"}', 1, '2023-08-07 14:34:03.321653', '2023-08-07 14:34:03.321653');
INSERT INTO `sys_log` VALUES (13, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"arklnk\",\"verifyCode\":\"1449\",\"captchaId\":\"K7q_d6BKyk\"}', 1, '2023-08-07 14:41:52.206203', '2023-08-07 14:41:52.206203');
INSERT INTO `sys_log` VALUES (14, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"arklnk\",\"verifyCode\":\"7576\",\"captchaId\":\"w06T_3Hf4X\"}', 1, '2023-08-07 17:22:50.238863', '2023-08-07 17:22:50.238863');
INSERT INTO `sys_log` VALUES (15, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"arklnk\",\"verifyCode\":\"6924\",\"captchaId\":\"BK2fqjRslF\"}', 1, '2023-08-07 17:33:35.893009', '2023-08-07 17:33:35.893009');
INSERT INTO `sys_log` VALUES (16, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"arklnk\",\"verifyCode\":\"4078\",\"captchaId\":\"28aK72i7FU\"}', 1, '2023-08-07 19:03:24.450236', '2023-08-07 19:03:24.450236');
INSERT INTO `sys_log` VALUES (17, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"arklnk\",\"verifyCode\":\"8769\",\"captchaId\":\"UF5z8krJYg\"}', 1, '2023-08-07 19:21:04.670553', '2023-08-07 19:21:04.670553');
INSERT INTO `sys_log` VALUES (18, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"arklnk\",\"verifyCode\":\"2867\",\"captchaId\":\"xm4vDQXkmf\"}', 1, '2023-08-07 19:24:18.178094', '2023-08-07 19:24:18.178094');
INSERT INTO `sys_log` VALUES (19, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"arklnk\",\"verifyCode\":\"9085\",\"captchaId\":\"7FjQOeHaU4\"}', 1, '2023-08-07 19:28:15.636630', '2023-08-07 19:28:15.636630');
INSERT INTO `sys_log` VALUES (20, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"arklnk\",\"verifyCode\":\"9495\",\"captchaId\":\"PRD-9gFSfA\"}', 1, '2023-08-07 19:55:15.329379', '2023-08-07 19:55:15.329379');
INSERT INTO `sys_log` VALUES (21, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"arklnk\",\"verifyCode\":\"7697\",\"captchaId\":\"4BarGRhAL4\"}', 1, '2023-08-07 19:58:43.733716', '2023-08-07 19:58:43.733716');
INSERT INTO `sys_log` VALUES (22, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"arklnk\",\"verifyCode\":\"2639\",\"captchaId\":\"W3VtOyDHg3\"}', 1, '2023-08-07 20:02:25.216707', '2023-08-07 20:02:25.216707');
INSERT INTO `sys_log` VALUES (23, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"arklnk\",\"verifyCode\":\"3984\",\"captchaId\":\"Jd6Q39qeOj\"}', 1, '2023-08-07 20:02:34.380411', '2023-08-07 20:02:34.380411');
INSERT INTO `sys_log` VALUES (24, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"arklnk\",\"verifyCode\":\"8357\",\"captchaId\":\"D43i8pK-hx\"}', 1, '2023-08-07 20:07:12.587652', '2023-08-07 20:07:12.587652');
INSERT INTO `sys_log` VALUES (25, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"arklnk\",\"verifyCode\":\"4396\",\"captchaId\":\"Ps0mn0KC12\"}', 1, '2023-08-07 20:09:00.836084', '2023-08-07 20:09:00.836084');
INSERT INTO `sys_log` VALUES (26, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"arklnk\",\"verifyCode\":\"2695\",\"captchaId\":\"nJjQ0EL6bx\"}', 1, '2023-08-07 20:12:17.220971', '2023-08-07 20:12:17.220971');
INSERT INTO `sys_log` VALUES (27, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"arklnk\",\"verifyCode\":\"6858\",\"captchaId\":\"008_F_9TMn\"}', 1, '2023-08-08 11:10:33.553050', '2023-08-08 11:10:33.553050');
INSERT INTO `sys_log` VALUES (28, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"arklnk\",\"verifyCode\":\"9935\",\"captchaId\":\"XkjCDtmvnH\"}', 1, '2023-08-08 11:44:35.635514', '2023-08-08 11:44:35.635514');
INSERT INTO `sys_log` VALUES (29, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"arklnk\",\"verifyCode\":\"4264\",\"captchaId\":\"Go6-W_wrb8\"}', 1, '2023-08-08 11:45:59.159655', '2023-08-08 11:45:59.159655');
INSERT INTO `sys_log` VALUES (30, 2, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"demo\",\"verifyCode\":\"7798\",\"captchaId\":\"4JAgaAM1Fm\"}', 1, '2023-08-08 11:46:54.523984', '2023-08-08 11:46:54.523984');
INSERT INTO `sys_log` VALUES (31, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"arklnk\",\"verifyCode\":\"0500\",\"captchaId\":\"U5hTbBtC9H\"}', 1, '2023-08-08 12:39:46.512858', '2023-08-08 12:39:46.512858');
INSERT INTO `sys_log` VALUES (32, 2, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"demo\",\"verifyCode\":\"0480\",\"captchaId\":\"UOPyD17Hin\"}', 1, '2023-08-08 13:07:41.589465', '2023-08-08 13:07:41.589465');
INSERT INTO `sys_log` VALUES (33, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"arklnk\",\"verifyCode\":\"6707\",\"captchaId\":\"u0HEiptemY\"}', 1, '2023-08-08 13:08:21.341524', '2023-08-08 13:08:21.341524');
INSERT INTO `sys_log` VALUES (34, 2, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"demo\",\"verifyCode\":\"2124\",\"captchaId\":\"VkdOfddl4F\"}', 1, '2023-08-08 13:08:49.481971', '2023-08-08 13:08:49.481971');
INSERT INTO `sys_log` VALUES (35, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"arklnk\",\"verifyCode\":\"8679\",\"captchaId\":\"v5kPDStpAc\"}', 1, '2023-08-08 13:11:58.200424', '2023-08-08 13:11:58.200424');
INSERT INTO `sys_log` VALUES (36, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"admin\",\"verifyCode\":\"8432\",\"captchaId\":\"b2UgEjV_iI\"}', 1, '2023-08-09 12:53:10.762825', '2023-08-09 12:53:10.762825');
INSERT INTO `sys_log` VALUES (37, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"admin\",\"verifyCode\":\"0952\",\"captchaId\":\"uvXY5drSPV\"}', 1, '2023-08-10 18:58:11.109786', '2023-08-10 18:58:11.109786');
INSERT INTO `sys_log` VALUES (38, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"admin\",\"verifyCode\":\"3595\",\"captchaId\":\"KKHMv1BZIg\"}', 1, '2023-08-10 19:07:06.845093', '2023-08-10 19:07:06.845093');
INSERT INTO `sys_log` VALUES (39, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"admin\",\"verifyCode\":\"4979\",\"captchaId\":\"qyQCO_HVpZ\"}', 1, '2023-08-10 19:07:23.272181', '2023-08-10 19:07:23.272181');
INSERT INTO `sys_log` VALUES (40, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"admin\",\"verifyCode\":\"4665\",\"captchaId\":\"ZkG6E24g2t\"}', 1, '2023-09-06 11:56:17.487775', '2023-09-06 11:56:17.487775');
INSERT INTO `sys_log` VALUES (41, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"admin\",\"verifyCode\":\"4443\",\"captchaId\":\"VgHbN_q9n0\"}', 1, '2023-09-06 17:04:50.660420', '2023-09-06 17:04:50.660420');
INSERT INTO `sys_log` VALUES (42, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"admin\",\"verifyCode\":\"9960\",\"captchaId\":\"PDAe6QKKgE\"}', 1, '2023-09-06 18:15:33.406849', '2023-09-06 18:15:33.406849');
INSERT INTO `sys_log` VALUES (43, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"admin\",\"verifyCode\":\"3724\",\"captchaId\":\"92lWgXVwkm\"}', 1, '2023-09-06 18:15:55.810574', '2023-09-06 18:15:55.810574');
INSERT INTO `sys_log` VALUES (44, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"admin\",\"verifyCode\":\"1881\",\"captchaId\":\"oqSlVl04nU\"}', 1, '2023-09-06 19:07:08.264838', '2023-09-06 19:07:08.264838');
INSERT INTO `sys_log` VALUES (45, 1, '127.0.0.1', '/admin/user/login', 1, '{\"account\":\"admin\",\"verifyCode\":\"6375\",\"captchaId\":\"wJdsv0Vxlb\"}', 1, '2023-09-08 13:54:56.345190', '2023-09-08 13:54:56.345190');
COMMIT;

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
  `openStyle` tinyint(1) NOT NULL DEFAULT '0' COMMENT '打开类型: 0=内部 1=外部',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='权限&菜单';

-- ----------------------------
-- Records of sys_perm_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_perm_menu` VALUES (1, 0, '系统管理', '/sys', '[]', 0, 'icon-setting', 0, '', 1, '', '2022-08-12 06:14:20.000000', '2023-08-08 14:35:50.748212', 0);
INSERT INTO `sys_perm_menu` VALUES (2, 1, '菜单管理', '/sys/menu', '[]', 1, '', 0, 'sys/menu', 1, '', '2022-08-12 06:14:20.000000', '2023-08-07 17:33:50.214544', 0);
INSERT INTO `sys_perm_menu` VALUES (3, 2, '查询', '', '[\"sys/perm/menu/list\"]', 2, '', 0, '', 1, '', '2022-08-12 06:14:20.000000', '2022-08-23 13:35:53.000000', 0);
INSERT INTO `sys_perm_menu` VALUES (4, 2, '新增', '', '[\"sys/perm/menu/add\"]', 2, '', 0, '', 1, '', '2022-08-12 06:14:20.000000', '2022-08-23 13:37:07.000000', 0);
INSERT INTO `sys_perm_menu` VALUES (5, 2, '删除', '', '[\"sys/perm/menu/delete\"]', 2, '', 0, '', 1, '', '2022-08-12 06:14:20.000000', '2022-08-23 13:37:20.000000', 0);
INSERT INTO `sys_perm_menu` VALUES (6, 2, '更新', '', '[\"sys/perm/menu/update\"]', 2, '', 0, '', 1, '', '2022-08-12 06:14:20.000000', '2022-08-23 13:37:34.000000', 0);
INSERT INTO `sys_perm_menu` VALUES (7, 1, '角色管理', '/sys/role', '[]', 1, '', 0, 'sys/role', 1, '', '2022-08-12 06:14:20.000000', '2023-08-08 13:09:54.779370', 0);
INSERT INTO `sys_perm_menu` VALUES (8, 7, '查询', '', '[\"sys/role/list\",\"sys/perm/menu/list\"]', 2, '', 0, '', 1, '', '2022-08-12 06:14:20.000000', '2022-08-23 13:35:53.000000', 0);
INSERT INTO `sys_perm_menu` VALUES (9, 7, '新增', '', '[\"sys/role/add\"]', 2, '', 0, '', 1, '', '2022-08-12 06:14:20.000000', '2022-08-23 13:37:07.000000', 0);
INSERT INTO `sys_perm_menu` VALUES (10, 7, '删除', '', '[\"sys/role/delete\"]', 2, '', 0, '', 1, '', '2022-08-12 06:14:20.000000', '2022-08-23 13:37:20.000000', 0);
INSERT INTO `sys_perm_menu` VALUES (11, 7, '更新', '', '[\"sys/role/update\"]', 2, '', 0, '', 1, '', '2022-08-12 06:14:20.000000', '2022-08-23 13:37:34.000000', 0);
INSERT INTO `sys_perm_menu` VALUES (13, 1, '部门管理', '/sys/dept', '[]', 1, '', 0, 'sys/dept', 1, '', '2022-08-12 06:14:20.000000', '2023-08-08 11:11:05.126035', 0);
INSERT INTO `sys_perm_menu` VALUES (14, 13, '查询', '', '[\"sys/dept/list\"]', 2, '', 0, '', 1, '', '2022-08-12 06:14:20.000000', '2022-08-23 13:35:53.000000', 0);
INSERT INTO `sys_perm_menu` VALUES (15, 13, '新增', '', '[\"sys/dept/add\"]', 2, '', 0, '', 1, '', '2022-08-12 06:14:20.000000', '2022-08-23 13:37:07.000000', 0);
INSERT INTO `sys_perm_menu` VALUES (16, 13, '删除', '', '[\"sys/dept/delete\"]', 2, '', 0, '', 1, '', '2022-08-12 06:14:20.000000', '2022-08-23 13:37:20.000000', 0);
INSERT INTO `sys_perm_menu` VALUES (17, 13, '更新', '', '[\"sys/dept/update\"]', 2, '', 0, '', 1, '', '2022-08-12 06:14:20.000000', '2022-08-23 13:37:34.000000', 0);
INSERT INTO `sys_perm_menu` VALUES (18, 1, '岗位管理', '/sys/job', '[]', 1, '', 0, 'sys/post', 1, '', '2022-08-12 06:14:20.000000', '2023-08-08 12:38:48.349124', 0);
INSERT INTO `sys_perm_menu` VALUES (19, 18, '查询', '', '[\"sys/job/page\"]', 2, '', 0, '', 1, '', '2022-08-12 06:14:20.000000', '2022-08-23 13:35:53.000000', 0);
INSERT INTO `sys_perm_menu` VALUES (20, 18, '新增', '', '[\"sys/job/add\"]', 2, '', 0, '', 1, '', '2022-08-12 06:14:20.000000', '2022-08-23 13:37:07.000000', 0);
INSERT INTO `sys_perm_menu` VALUES (21, 18, '删除', '', '[\"sys/job/delete\"]', 2, '', 0, '', 1, '', '2022-08-12 06:14:20.000000', '2022-08-23 13:37:20.000000', 0);
INSERT INTO `sys_perm_menu` VALUES (22, 18, '更新', '', '[\"sys/job/update\"]', 2, '', 0, '', 1, '', '2022-08-12 06:14:20.000000', '2022-08-23 13:37:34.000000', 0);
INSERT INTO `sys_perm_menu` VALUES (29, 1, '用户管理', '/sys/user', '[]', 1, '', 0, 'sys/user', 1, '', '2022-08-12 06:14:20.000000', '2023-08-08 13:10:00.494547', 0);
INSERT INTO `sys_perm_menu` VALUES (30, 29, '查询', '', '[\"sys/user/page\",\"sys/dept/list\"]', 2, '', 0, '', 1, '', '2022-08-12 06:14:20.000000', '2022-08-24 07:46:56.000000', 0);
INSERT INTO `sys_perm_menu` VALUES (31, 29, '新增', '', '[\"sys/user/add\",\"sys/user/rdpj/info\"]', 2, '', 0, '', 1, '', '2022-08-12 06:14:20.000000', '2022-08-24 07:17:19.000000', 0);
INSERT INTO `sys_perm_menu` VALUES (32, 29, '删除', '', '[\"sys/user/delete\"]', 2, '', 0, '', 1, '', '2022-08-12 06:14:20.000000', '2022-08-23 13:37:20.000000', 0);
INSERT INTO `sys_perm_menu` VALUES (33, 29, '更新', '', '[\"sys/user/update\",\"sys/user/rdpj/info\"]', 2, '', 0, '', 1, '', '2022-08-12 06:14:20.000000', '2022-08-24 07:08:07.000000', 0);
INSERT INTO `sys_perm_menu` VALUES (34, 29, '改密', '', '[\"sys/user/password/update\"]', 2, '', 0, '', 1, '', '2022-08-12 06:14:20.000000', '2022-08-25 08:51:46.000000', 0);
INSERT INTO `sys_perm_menu` VALUES (36, 0, '配置管理', '/config', '[]', 0, 'icon-insertrowbelow', 0, '', 1, '', '2022-08-22 07:33:42.000000', '2023-08-08 14:37:03.411893', 0);
INSERT INTO `sys_perm_menu` VALUES (37, 36, '字典管理', '/config/dict', '[]', 1, '', 0, 'sys/dict-type', 1, '', '2022-08-22 07:39:21.000000', '2023-08-08 14:59:14.497396', 0);
INSERT INTO `sys_perm_menu` VALUES (38, 37, '查询', '', '[\"config/dict/page\",\"config/dict/data/page\",\"config/dict/all\"]', 2, '', 0, '', 1, '', '2022-08-22 07:42:07.000000', '2023-08-08 14:57:49.552927', 0);
INSERT INTO `sys_perm_menu` VALUES (39, 37, '新增', '', '[\"config/dict/add\"]', 2, '', 0, '', 1, '', '2022-08-22 07:42:07.000000', '2022-08-23 13:37:07.000000', 0);
INSERT INTO `sys_perm_menu` VALUES (40, 37, '删除', '', '[\"config/dict/delete\"]', 2, '', 0, '', 1, '', '2022-08-22 07:42:07.000000', '2022-08-23 13:37:20.000000', 0);
INSERT INTO `sys_perm_menu` VALUES (41, 37, '更新', '', '[\"config/dict/update\"]', 2, '', 0, '', 1, '', '2022-08-22 07:42:07.000000', '2022-08-23 13:37:34.000000', 0);
INSERT INTO `sys_perm_menu` VALUES (42, 0, '日志管理', '/log', '[]', 0, 'icon-detail', 0, '', 1, '', '2022-08-23 08:47:23.000000', '2023-08-08 14:38:03.090574', 0);
INSERT INTO `sys_perm_menu` VALUES (43, 42, '登录日志', '/log/login', '[]', 1, '', 0, 'sys/log-login', 1, '', '2022-08-23 08:47:51.000000', '2023-08-08 17:25:17.809864', 0);
INSERT INTO `sys_perm_menu` VALUES (44, 43, '查询', '', '[\"log/login/page\"]', 2, '', 0, '', 1, '', '2022-08-22 07:42:07.000000', '2022-08-23 13:35:53.000000', 0);
INSERT INTO `sys_perm_menu` VALUES (45, 0, '开源文档', '/document', '[]', 0, 'icon-rich-text', 0, '', 1, '', '2022-08-29 13:22:32.000000', '2023-08-08 14:38:24.379372', 0);
INSERT INTO `sys_perm_menu` VALUES (46, 45, '使用文档(内链)', '/document/arkdoc', '[]', 1, '', 0, 'https://www.bing.com/', 1, '', '2022-08-29 13:29:49.000000', '2023-08-08 14:09:29.962996', 0);
INSERT INTO `sys_perm_menu` VALUES (47, 45, '使用文档(外链)', 'https://docs.arklnk.com/admin/', '[]', 1, '', 0, 'https://www.bing.com/', 1, '', '2022-08-29 13:23:52.000000', '2023-08-08 14:24:00.149296', 1);
INSERT INTO `sys_perm_menu` VALUES (54, 0, '功能示例', 'demo', '[\"\"]', 0, 'icon-appstore', 0, '', 1, '', '2023-09-06 19:08:47.845595', '2023-09-06 19:08:47.845595', 0);
INSERT INTO `sys_perm_menu` VALUES (55, 54, '配置页面-1', 'app/base-setting/index', '[\"\"]', 1, '', 0, 'app/base-setting/index', 1, '', '2023-09-06 19:10:17.714635', '2023-09-06 19:10:17.714635', 0);
INSERT INTO `sys_perm_menu` VALUES (56, 54, '消息通知', 'app/message-push/index', '[\"\"]', 1, '', 0, 'app/message-push/index', 1, '', '2023-09-06 19:11:48.736901', '2023-09-06 19:11:48.736901', 0);
INSERT INTO `sys_perm_menu` VALUES (57, 54, '页面演示-2', 'app/red-package/index', '[\"\"]', 1, '', 0, 'app/red-package/index', 1, '', '2023-09-06 19:12:50.138199', '2023-09-06 19:12:50.138199', 0);
INSERT INTO `sys_perm_menu` VALUES (58, 54, '页面演示-3', 'app/sell-setting/index', '[\"\"]', 1, '', 0, 'app/sell-setting/index', 1, '', '2023-09-06 19:14:58.498892', '2023-09-06 19:14:58.498892', 0);
INSERT INTO `sys_perm_menu` VALUES (59, 54, '页面演示4', 'app/websitepromo/index', '[\"\"]', 1, '', 0, 'app/websitepromo/index', 1, '', '2023-09-06 19:16:44.199693', '2023-09-06 19:16:44.199693', 0);
COMMIT;

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
BEGIN;
INSERT INTO `sys_profession` VALUES (1, 'CEO', 1, 0, '2022-08-17 09:09:26.000000', '2022-08-17 09:09:26.000000');
INSERT INTO `sys_profession` VALUES (2, 'CTO', 1, 0, '2022-08-17 09:09:26.000000', '2022-08-17 09:09:26.000000');
COMMIT;

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
  `perm_menu_ids` text NOT NULL COMMENT '权限集',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态: 0=禁用 1=开启',
  `order_num` int unsigned NOT NULL DEFAULT '0' COMMENT '排序值',
  `create_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `update_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_1e86ea91bf298553df1073c5fa` (`unique_key`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, 0, '超级管理员', 'root', '超级管理员', '[1,2,3,4,5,6,7,8,9,10,11,13,14,15,16,17,18,19,20,21,22,29,30,31,32,33,34,36,37,38,39,40,41,42,43,44,45,46,47]', 1, 0, '2022-08-19 06:38:19.000000', '2023-08-10 18:58:48.000000');
INSERT INTO `sys_role` VALUES (2, 0, '演示', 'demo', '演示', '[1,2,7,13,18,29,36,37,3,8,14,19,30,38,42,43,44]', 1, 0, '2022-08-23 17:13:05.000000', '2023-08-10 18:59:30.000000');
COMMIT;

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
  `job_id` int unsigned NOT NULL COMMENT '岗位',
  `dept_id` int unsigned NOT NULL COMMENT '部门',
  `role_ids` text NOT NULL COMMENT '角色集',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态: 0=禁用 1=开启',
  `order_num` int unsigned NOT NULL DEFAULT '0' COMMENT '排序值',
  `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `update_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 'admin', '596bfe4bb02db60c2a25965598529e7e', 'arklnk', 'arklnk', 'https://avataaars.io/?avatarStyle=Circle&topType=Hat&accessoriesType=Prescription02&facialHairType=BeardLight&facialHairColor=BrownDark&clotheType=Hoodie&clotheColor=Heather&eyeType=Default&eyebrowType=Default&mouthType=Default&skinColor=Light', 0, 'arklnk@163.com', '', 0, 0, '[1]', 1, 0, 'arklnk', '2022-08-11 10:19:45.000000', '2023-08-08 19:30:02.940171');
INSERT INTO `sys_user` VALUES (2, 'demo', '596bfe4bb02db60c2a25965598529e7e', 'demo', 'fasdf', 'https://avataaars.io/?avatarStyle=Circle&topType=Hat&accessoriesType=Sunglasses&facialHairType=Blank&clotheType=Hoodie&clotheColor=Heather&eyeType=Hearts&eyebrowType=UpDown&mouthType=Tongue&skinColor=DarkBrown', 0, 'fasdfa@qq.com', '', 1, 2, '[2]', 1, 0, '', '2022-08-23 18:04:24.000000', '2023-08-10 18:58:37.000000');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
