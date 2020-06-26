/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50173
 Source Host           : localhost:3306
 Source Schema         : 12380

 Target Server Type    : MySQL
 Target Server Version : 50173
 File Encoding         : 65001

 Date: 26/06/2020 18:22:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_advise
-- ----------------------------
DROP TABLE IF EXISTS `t_advise`;
CREATE TABLE `t_advise`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createtime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_advise
-- ----------------------------
INSERT INTO `t_advise` VALUES (1, 'adfadfa', '123123', 'asdfadsf', '2020-06-26 17:22:30');

-- ----------------------------
-- Table structure for t_report
-- ----------------------------
DROP TABLE IF EXISTS `t_report`;
CREATE TABLE `t_report`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(255) NULL DEFAULT NULL COMMENT '1个人；2单位',
  `jbrname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `jbrsex` tinyint(2) NULL DEFAULT NULL,
  `jbrunit` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `jbrid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `jbrarea` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `jbraddr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `jbrphone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bjbname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bjbsex` tinyint(2) NULL DEFAULT NULL,
  `bjbduty` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bjbarea` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bjbunit` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bjblevel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bjbtype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bjbmemo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_report
-- ----------------------------
INSERT INTO `t_report` VALUES (1, 1, 'aaa', 1, '2', '3', '4', '5', '6', '7', 8, '9', '10', '11', '12', '13', '14', '2020-06-25 17:41:11');
INSERT INTO `t_report` VALUES (2, 2, 'bbbb', 1, '2', '3', '4', '5', '6', '7', 8, '9', '10', '11', '12', '13', '14', '2020-06-26 17:41:14');

-- ----------------------------
-- Table structure for t_sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_dept`;
CREATE TABLE `t_sys_dept`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentId` int(11) NULL DEFAULT NULL COMMENT '上级部门',
  `deptLevel` int(11) NOT NULL COMMENT '部门级别',
  `memo` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creatTime` datetime NULL DEFAULT NULL,
  `editor` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editTime` datetime NULL DEFAULT NULL,
  `delete_flag` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_sys_dept
-- ----------------------------
INSERT INTO `t_sys_dept` VALUES (1, '12380', 0, 0, NULL, 'admin', '2017-11-15 08:49:11', 'admin', '2019-06-01 08:08:32', 0);

-- ----------------------------
-- Table structure for t_sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_dict`;
CREATE TABLE `t_sys_dict`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `value` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `memo` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `editor` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编辑人 username',
  `editTime` datetime NULL DEFAULT NULL COMMENT '编辑时间',
  `delete_flag` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否可用：0-可用；1-不可用；',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据字典表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_menu`;
CREATE TABLE `t_sys_menu`  (
  `menuId` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单Id',
  `menuName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名字',
  `iconUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标地址',
  `menuUrl` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `parentId` int(11) NULL DEFAULT NULL COMMENT '上一级id',
  `menuLevel` tinyint(2) NULL DEFAULT NULL COMMENT '菜单级别',
  `isLeaf` tinyint(2) NULL DEFAULT 1 COMMENT '是否是叶子节点：0-不是；1-是',
  `menuType` tinyint(2) NULL DEFAULT NULL COMMENT '菜单类型',
  `menuOrder` tinyint(2) NULL DEFAULT NULL COMMENT '菜单排序',
  `delete_flag` tinyint(2) NULL DEFAULT NULL COMMENT '是否可用',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人 username',
  `createTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `editor` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编辑人 username',
  `editTime` datetime NULL DEFAULT NULL COMMENT '编辑时间',
  PRIMARY KEY (`menuId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 478 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_sys_menu
-- ----------------------------
INSERT INTO `t_sys_menu` VALUES (1, '系统管理', 'layui-icon-set', '', 0, 1, 0, 1, 1, 0, 'admin', '2016-03-01 09:33:15', 'admin', '2019-05-31 18:49:19');
INSERT INTO `t_sys_menu` VALUES (5, '权限管理', NULL, 'role/index', 1, 2, 0, 1, 95, 0, 'admin', '2016-03-01 09:33:19', 'admin', '2017-03-27 13:24:02');
INSERT INTO `t_sys_menu` VALUES (6, '菜单管理', NULL, 'menu/index', 1, 2, 0, 1, 90, 0, 'admin', '2016-03-01 09:33:20', 'admin', '2017-03-27 13:24:44');
INSERT INTO `t_sys_menu` VALUES (7, '数据字典', NULL, 'dict/index', 1, 2, 0, 1, 1, 0, 'admin', '2018-02-03 14:15:50', NULL, NULL);
INSERT INTO `t_sys_menu` VALUES (10, '用户管理', NULL, 'user/index', 1, 2, 0, 1, 100, 0, 'admin', '2016-03-01 09:33:24', 'admin', '2018-08-23 17:25:24');
INSERT INTO `t_sys_menu` VALUES (31, '角色添加', NULL, 'role/role_add', 5, 3, 1, 2, 1, 0, 'admin', '2016-03-01 09:33:43', NULL, NULL);
INSERT INTO `t_sys_menu` VALUES (32, '角色编辑', NULL, 'role/role_edit', 5, 3, 1, 2, 1, 0, 'admin', '2016-03-01 09:33:44', NULL, NULL);
INSERT INTO `t_sys_menu` VALUES (33, '角色授权', NULL, 'role/updateRoleRight', 5, 3, 1, 2, 1, 0, 'admin', '2016-03-01 09:33:45', NULL, NULL);
INSERT INTO `t_sys_menu` VALUES (34, '菜单添加', NULL, 'menu/add', 6, 3, 1, 2, 1, 0, 'admin', '2016-03-01 09:33:46', NULL, NULL);
INSERT INTO `t_sys_menu` VALUES (35, '菜单编辑', NULL, 'menu/edit', 6, 3, 1, 2, 1, 0, 'admin', '2016-03-01 09:33:47', NULL, NULL);
INSERT INTO `t_sys_menu` VALUES (36, '菜单删除', NULL, 'menu/del', 6, 3, 1, 2, 1, 0, 'admin', '2016-03-01 09:33:48', NULL, NULL);
INSERT INTO `t_sys_menu` VALUES (37, '数据字典添加', NULL, 'dict/add', 7, 3, 1, 2, 1, 0, 'admin', '2016-03-01 09:33:49', NULL, NULL);
INSERT INTO `t_sys_menu` VALUES (38, '数据字典编辑', NULL, 'dict/edit', 7, 3, 1, 2, 1, 0, 'admin', '2016-03-01 09:33:50', NULL, NULL);
INSERT INTO `t_sys_menu` VALUES (39, '数据字典删除', NULL, 'dict/del', 7, 3, 1, 2, 1, 0, 'admin', '2016-03-01 09:33:51', NULL, NULL);
INSERT INTO `t_sys_menu` VALUES (47, '用户添加', '', 'user/insert', 10, 3, 1, 2, 1, 0, 'admin', '2016-03-01 09:33:58', 'admin', '2018-02-02 15:24:25');
INSERT INTO `t_sys_menu` VALUES (69, '用户编辑', NULL, 'user/update', 10, 3, 1, 2, 1, 0, 'admin', '2016-03-01 09:52:15', NULL, NULL);
INSERT INTO `t_sys_menu` VALUES (156, '部门管理', NULL, 'dept/index', 1, 2, 0, 1, 85, 0, 'admin', '2016-11-24 16:18:27', 'admin', '2018-08-21 10:26:40');
INSERT INTO `t_sys_menu` VALUES (157, '部门新增', '', 'dept/add', 156, 3, 1, 2, 1, 0, 'admin', '2016-11-24 16:19:02', 'admin', '2018-08-21 10:27:13');
INSERT INTO `t_sys_menu` VALUES (158, '部门编辑', '', 'dept/edit', 156, 3, 1, 2, 2, 0, 'admin', '2016-11-24 16:19:38', 'admin', '2018-08-21 10:26:52');

-- ----------------------------
-- Table structure for t_sys_rights
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_rights`;
CREATE TABLE `t_sys_rights`  (
  `menuId` int(11) NOT NULL DEFAULT 0 COMMENT '菜单Id',
  `roleId` int(11) NOT NULL DEFAULT 0 COMMENT '角色Id',
  `delete_flag` int(11) NULL DEFAULT 0 COMMENT '是否可用',
  PRIMARY KEY (`roleId`, `menuId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_sys_rights
-- ----------------------------
INSERT INTO `t_sys_rights` VALUES (1, 1, 0);
INSERT INTO `t_sys_rights` VALUES (5, 1, 0);
INSERT INTO `t_sys_rights` VALUES (6, 1, 0);
INSERT INTO `t_sys_rights` VALUES (7, 1, 0);
INSERT INTO `t_sys_rights` VALUES (10, 1, 0);
INSERT INTO `t_sys_rights` VALUES (31, 1, 0);
INSERT INTO `t_sys_rights` VALUES (32, 1, 0);
INSERT INTO `t_sys_rights` VALUES (33, 1, 0);
INSERT INTO `t_sys_rights` VALUES (34, 1, 0);
INSERT INTO `t_sys_rights` VALUES (35, 1, 0);
INSERT INTO `t_sys_rights` VALUES (36, 1, 0);
INSERT INTO `t_sys_rights` VALUES (37, 1, 0);
INSERT INTO `t_sys_rights` VALUES (38, 1, 0);
INSERT INTO `t_sys_rights` VALUES (39, 1, 0);
INSERT INTO `t_sys_rights` VALUES (47, 1, 0);
INSERT INTO `t_sys_rights` VALUES (69, 1, 0);
INSERT INTO `t_sys_rights` VALUES (156, 1, 0);
INSERT INTO `t_sys_rights` VALUES (157, 1, 0);
INSERT INTO `t_sys_rights` VALUES (158, 1, 0);
INSERT INTO `t_sys_rights` VALUES (282, 1, 0);
INSERT INTO `t_sys_rights` VALUES (299, 1, 0);
INSERT INTO `t_sys_rights` VALUES (316, 1, 0);
INSERT INTO `t_sys_rights` VALUES (317, 1, 0);
INSERT INTO `t_sys_rights` VALUES (318, 1, 0);
INSERT INTO `t_sys_rights` VALUES (357, 1, 0);
INSERT INTO `t_sys_rights` VALUES (369, 1, 0);
INSERT INTO `t_sys_rights` VALUES (370, 1, 0);
INSERT INTO `t_sys_rights` VALUES (371, 1, 0);
INSERT INTO `t_sys_rights` VALUES (375, 1, 0);
INSERT INTO `t_sys_rights` VALUES (376, 1, 0);
INSERT INTO `t_sys_rights` VALUES (377, 1, 0);
INSERT INTO `t_sys_rights` VALUES (378, 1, 0);
INSERT INTO `t_sys_rights` VALUES (379, 1, 0);
INSERT INTO `t_sys_rights` VALUES (380, 1, 0);
INSERT INTO `t_sys_rights` VALUES (390, 1, 0);
INSERT INTO `t_sys_rights` VALUES (391, 1, 0);
INSERT INTO `t_sys_rights` VALUES (392, 1, 0);
INSERT INTO `t_sys_rights` VALUES (395, 1, 0);
INSERT INTO `t_sys_rights` VALUES (396, 1, 0);
INSERT INTO `t_sys_rights` VALUES (397, 1, 0);
INSERT INTO `t_sys_rights` VALUES (398, 1, 0);
INSERT INTO `t_sys_rights` VALUES (399, 1, 0);
INSERT INTO `t_sys_rights` VALUES (400, 1, 0);
INSERT INTO `t_sys_rights` VALUES (401, 1, 0);
INSERT INTO `t_sys_rights` VALUES (402, 1, 0);
INSERT INTO `t_sys_rights` VALUES (403, 1, 0);
INSERT INTO `t_sys_rights` VALUES (404, 1, 0);
INSERT INTO `t_sys_rights` VALUES (405, 1, 0);
INSERT INTO `t_sys_rights` VALUES (406, 1, 0);
INSERT INTO `t_sys_rights` VALUES (407, 1, 0);
INSERT INTO `t_sys_rights` VALUES (411, 1, 0);
INSERT INTO `t_sys_rights` VALUES (412, 1, 0);
INSERT INTO `t_sys_rights` VALUES (413, 1, 0);
INSERT INTO `t_sys_rights` VALUES (414, 1, 0);
INSERT INTO `t_sys_rights` VALUES (415, 1, 0);
INSERT INTO `t_sys_rights` VALUES (416, 1, 0);
INSERT INTO `t_sys_rights` VALUES (418, 1, 0);
INSERT INTO `t_sys_rights` VALUES (424, 1, 0);
INSERT INTO `t_sys_rights` VALUES (425, 1, 0);
INSERT INTO `t_sys_rights` VALUES (426, 1, 0);
INSERT INTO `t_sys_rights` VALUES (427, 1, 0);
INSERT INTO `t_sys_rights` VALUES (432, 1, 0);
INSERT INTO `t_sys_rights` VALUES (434, 1, 0);
INSERT INTO `t_sys_rights` VALUES (435, 1, 0);
INSERT INTO `t_sys_rights` VALUES (436, 1, 0);
INSERT INTO `t_sys_rights` VALUES (438, 1, 0);
INSERT INTO `t_sys_rights` VALUES (439, 1, 0);
INSERT INTO `t_sys_rights` VALUES (440, 1, 0);
INSERT INTO `t_sys_rights` VALUES (441, 1, 0);
INSERT INTO `t_sys_rights` VALUES (442, 1, 0);
INSERT INTO `t_sys_rights` VALUES (448, 1, 0);
INSERT INTO `t_sys_rights` VALUES (449, 1, 0);
INSERT INTO `t_sys_rights` VALUES (450, 1, 0);
INSERT INTO `t_sys_rights` VALUES (451, 1, 0);
INSERT INTO `t_sys_rights` VALUES (452, 1, 0);
INSERT INTO `t_sys_rights` VALUES (453, 1, 0);
INSERT INTO `t_sys_rights` VALUES (454, 1, 0);
INSERT INTO `t_sys_rights` VALUES (455, 1, 0);
INSERT INTO `t_sys_rights` VALUES (456, 1, 0);
INSERT INTO `t_sys_rights` VALUES (457, 1, 0);
INSERT INTO `t_sys_rights` VALUES (458, 1, 0);
INSERT INTO `t_sys_rights` VALUES (459, 1, 0);
INSERT INTO `t_sys_rights` VALUES (460, 1, 0);
INSERT INTO `t_sys_rights` VALUES (461, 1, 0);
INSERT INTO `t_sys_rights` VALUES (463, 1, 0);
INSERT INTO `t_sys_rights` VALUES (464, 1, 0);
INSERT INTO `t_sys_rights` VALUES (465, 1, 0);
INSERT INTO `t_sys_rights` VALUES (466, 1, 0);
INSERT INTO `t_sys_rights` VALUES (467, 1, 0);
INSERT INTO `t_sys_rights` VALUES (468, 1, 0);
INSERT INTO `t_sys_rights` VALUES (469, 1, 0);
INSERT INTO `t_sys_rights` VALUES (470, 1, 0);
INSERT INTO `t_sys_rights` VALUES (471, 1, 0);
INSERT INTO `t_sys_rights` VALUES (472, 1, 0);
INSERT INTO `t_sys_rights` VALUES (473, 1, 0);
INSERT INTO `t_sys_rights` VALUES (474, 1, 0);
INSERT INTO `t_sys_rights` VALUES (475, 1, 0);
INSERT INTO `t_sys_rights` VALUES (476, 1, 0);
INSERT INTO `t_sys_rights` VALUES (477, 1, 0);

-- ----------------------------
-- Table structure for t_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role`;
CREATE TABLE `t_sys_role`  (
  `roleId` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色Id',
  `roleName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名字',
  `roleType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `delete_flag` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否可用：0-可用；1-已删除',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人 username',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `editor` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编辑人 username',
  `editTime` datetime NULL DEFAULT NULL COMMENT '编辑时间',
  PRIMARY KEY (`roleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_sys_role
-- ----------------------------
INSERT INTO `t_sys_role` VALUES (1, '超级管理员', 'admin', 0, 'admin', '2016-03-01 09:33:15', NULL, NULL);

-- ----------------------------
-- Table structure for t_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user`;
CREATE TABLE `t_sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录密码',
  `realname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `sex` tinyint(2) NULL DEFAULT NULL COMMENT '性别',
  `age` int(3) NULL DEFAULT NULL COMMENT '年龄: 0 男， 1女',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `dept` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门ID',
  `deptName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `role` int(11) NULL DEFAULT NULL COMMENT '角色ID',
  `roleName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `status` tinyint(4) NULL DEFAULT 0 COMMENT '帐号状态（0未激活；1已激活）',
  `delete_flag` tinyint(2) NULL DEFAULT 0 COMMENT '是否可用：0-可用；1-不可用；',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人 username',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `editor` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编辑人 username',
  `editTime` datetime NULL DEFAULT NULL COMMENT '编辑时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------
INSERT INTO `t_sys_user` VALUES (1, 'admin', '4QrcOUm6Wau+VuBX8g+IPg==', '系统管理员', 1, 22, '15615676670', '1', '', 1, '超级管理员', NULL, 0, 'admin', '2016-03-01 09:33:15', 'admin', '2019-06-01 09:43:04');
INSERT INTO `t_sys_user` VALUES (38, 'test', '4QrcOUm6Wau+VuBX8g+IPg==', '测试用户', 1, NULL, '15615676670', '1', '', 1, '超级管理员', NULL, 0, 'admin', '2018-07-05 15:12:53', 'admin', '2019-06-01 09:43:14');

SET FOREIGN_KEY_CHECKS = 1;
