/*
 Navicat Premium Dump SQL

 Source Server         : 本地数据库
 Source Server Type    : MySQL
 Source Server Version : 80042 (8.0.42)
 Source Host           : 127.0.0.1:3306
 Source Schema         : travel_db

 Target Server Type    : MySQL
 Target Server Version : 80042 (8.0.42)
 File Encoding         : 65001

 Date: 02/06/2026 22:59:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id` ASC, `codename` ASC) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add 管理员', 7, 'add_admin');
INSERT INTO `auth_permission` VALUES (26, 'Can change 管理员', 7, 'change_admin');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 管理员', 7, 'delete_admin');
INSERT INTO `auth_permission` VALUES (28, 'Can view 管理员', 7, 'view_admin');
INSERT INTO `auth_permission` VALUES (29, 'Can add 景点', 8, 'add_attraction');
INSERT INTO `auth_permission` VALUES (30, 'Can change 景点', 8, 'change_attraction');
INSERT INTO `auth_permission` VALUES (31, 'Can delete 景点', 8, 'delete_attraction');
INSERT INTO `auth_permission` VALUES (32, 'Can view 景点', 8, 'view_attraction');
INSERT INTO `auth_permission` VALUES (33, 'Can add 用户', 9, 'add_user');
INSERT INTO `auth_permission` VALUES (34, 'Can change 用户', 9, 'change_user');
INSERT INTO `auth_permission` VALUES (35, 'Can delete 用户', 9, 'delete_user');
INSERT INTO `auth_permission` VALUES (36, 'Can view 用户', 9, 'view_user');
INSERT INTO `auth_permission` VALUES (37, 'Can add 评论', 10, 'add_comment');
INSERT INTO `auth_permission` VALUES (38, 'Can change 评论', 10, 'change_comment');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 评论', 10, 'delete_comment');
INSERT INTO `auth_permission` VALUES (40, 'Can view 评论', 10, 'view_comment');
INSERT INTO `auth_permission` VALUES (41, 'Can add 收藏', 11, 'add_favorite');
INSERT INTO `auth_permission` VALUES (42, 'Can change 收藏', 11, 'change_favorite');
INSERT INTO `auth_permission` VALUES (43, 'Can delete 收藏', 11, 'delete_favorite');
INSERT INTO `auth_permission` VALUES (44, 'Can view 收藏', 11, 'view_favorite');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id` ASC, `group_id` ASC) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id` ASC) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_chk_1` CHECK (`action_flag` >= 0)
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label` ASC, `model` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (7, 'myapp', 'admin');
INSERT INTO `django_content_type` VALUES (8, 'myapp', 'attraction');
INSERT INTO `django_content_type` VALUES (10, 'myapp', 'comment');
INSERT INTO `django_content_type` VALUES (11, 'myapp', 'favorite');
INSERT INTO `django_content_type` VALUES (9, 'myapp', 'user');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2026-01-24 12:36:01.600063');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2026-01-24 12:36:02.013062');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2026-01-24 12:36:02.122236');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2026-01-24 12:36:02.128690');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2026-01-24 12:36:02.133928');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2026-01-24 12:36:02.207486');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2026-01-24 12:36:02.251606');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2026-01-24 12:36:02.275635');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2026-01-24 12:36:02.281514');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2026-01-24 12:36:02.321388');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2026-01-24 12:36:02.324368');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2026-01-24 12:36:02.330712');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2026-01-24 12:36:02.377914');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2026-01-24 12:36:02.425974');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2026-01-24 12:36:02.439267');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2026-01-24 12:36:02.444905');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2026-01-24 12:36:02.490841');
INSERT INTO `django_migrations` VALUES (18, 'myapp', '0001_initial', '2026-01-24 12:36:02.726720');
INSERT INTO `django_migrations` VALUES (19, 'sessions', '0001_initial', '2026-01-24 12:36:02.755277');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('1yi71kendokdkwtfc33g5a45m0i5toyi', 'eyJpbWFnZV9jb2RlIjoiNTc1MTQiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1vkMX9:SmyPtrrqbLs6JfHObcmOUswNFvqx9G533_8Brxbu2Ig', '2026-01-26 13:22:35.590752');
INSERT INTO `django_session` VALUES ('bbi83ek6td7alai42tc5r80ciwnrcaj3', '.eJwVi8EKgCAQBf_lnT3swVL8GYncYqE0XIIi_PeUOQ3DfJBz2TmuJTEC7OQ8wSAqq0rJkZ9L6oswk_VEBpK3gvBBEoIzuJVrXs6xHqKd_tZyDB8Jrf3hnh8J:1vkMfS:Z6zy7BUXMmL3p0tWaVGrAl6NlTboq5sY3yNB0qcusas', '2026-02-02 13:30:10.965098');
INSERT INTO `django_session` VALUES ('bqtwnki9fsmgt157mfhrgmkh2qr9ectx', '.eJxFy0EKgCAQBdC7_LULi7LyMiI5xUCOoQRFePdq1fIt3g2OfiU3p0CwmNp-MFBwhUrhJI7OnfMFa3Q3aq3AsiTYGxxgG4WjUBYfv-pDZHlrTtvPWh_dsx7O:1wUQUL:MXI3FUehKWIy4idyd5VCJDGH1PZKkfpSAAlR_J0IHRs', '2026-06-09 14:53:05.743065');
INSERT INTO `django_session` VALUES ('d7ya2swmeul8iwfzn2u1qq4vc9rv92lc', 'eyJpbWFnZV9jb2RlIjoiODY4NTAiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1w11QN:hVRiY0wZEw3kwwAfXdYNDAcJ5jW-F-dvEPXiPnyPRHs', '2026-03-13 12:16:27.938623');
INSERT INTO `django_session` VALUES ('dbcfcd7jwij434e5yffmd8mk21uqvprv', 'eyJpbWFnZV9jb2RlIjoiNTE1NDEiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1vkMaZ:1eNllwdf28BLGJf1h8yEn5-7Lh8PIlXE94UIgURM0J4', '2026-01-26 13:26:07.740910');
INSERT INTO `django_session` VALUES ('f1q4aewb9oehn5e1i3rxe2vcx33jr4tp', 'eyJpbWFnZV9jb2RlIjoiMjY4MTkiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1w11bb:Ob057G3uQ7x6N2yuw6DCKf6ksa2mW2utPHYe8_u8j_c', '2026-03-13 12:28:03.261017');
INSERT INTO `django_session` VALUES ('fcwpzskxfjevrzugagolnokesjr5vvoy', 'eyJpbWFnZV9jb2RlIjoiNjgyMzYiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1wUQHO:Co8G-zob-RhKPtNndIL-CUYs01zGZldPxV2jJVkotiA', '2026-06-02 14:40:42.569419');
INSERT INTO `django_session` VALUES ('q2in6h8beknkmgcbr15kaigg5tc4aq63', 'eyJpbWFnZV9jb2RlIjoiODcwOTIiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1w11T5:BcjmO8uTtM-xCD79Fw8kRqgclP191JTVsovnKzRKYxo', '2026-03-13 12:19:15.059775');
INSERT INTO `django_session` VALUES ('zxri3qk9bv0kzpb7xgc5lmpueuhmvaos', '.eJxFy0EKgCAQBdC7_LULhbLyMiI5xUA6oQSFdPdq1fItXgOnsJKfJRIcrJmGHgq-Uq0s2dO5c7ngrO5GrRU4LwLXwBHOKByVSg7pqyEmzm8tsv287wfdXh7N:1vjd2O:Z1-m2YtFRoum0ZDM4fzlnJmlZR392vELAaS8cjhn3eI', '2026-01-31 12:46:48.348858');

-- ----------------------------
-- Table structure for myapp_admin
-- ----------------------------
DROP TABLE IF EXISTS `myapp_admin`;
CREATE TABLE `myapp_admin`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of myapp_admin
-- ----------------------------
INSERT INTO `myapp_admin` VALUES (1, 'admin', 'ff206b8c0c2f77e1218e20b26f408704');
INSERT INTO `myapp_admin` VALUES (2, 'manager', 'ff206b8c0c2f77e1218e20b26f408704');

-- ----------------------------
-- Table structure for myapp_attraction
-- ----------------------------
DROP TABLE IF EXISTS `myapp_attraction`;
CREATE TABLE `myapp_attraction`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of myapp_attraction
-- ----------------------------
INSERT INTO `myapp_attraction` VALUES (1, '故宫博物院', '北京', 60.00, '故宫又名紫禁城，是中国明清两代的皇家宫殿，位于北京中轴线的中心。故宫以三大殿为中心，占地面积72万平方米，建筑面积约15万平方米，有大小宫殿七十多座，房屋九千余间。是世界上现存规模最大、保存最为完整的木质结构古建筑之一。', 'attractions/gugong_i60xma2.jpg', '2026-01-24 20:42:32.000000', '2026-01-24 12:50:29.261743');
INSERT INTO `myapp_attraction` VALUES (2, '长城（八达岭）', '北京', 40.00, '八达岭长城是中国古代伟大的防御工程万里长城的重要组成部分，是明长城的一个隘口。八达岭长城为居庸关的重要前哨，古称\"居庸之险不在关而在八达岭\"。', 'attractions/changcheng_VpI3oWh.jpg', '2026-01-24 20:42:32.000000', '2026-01-24 12:51:20.419968');
INSERT INTO `myapp_attraction` VALUES (3, '天坛公园', '北京', 15.00, '天坛是明清两代皇帝祭祀皇天、祈五谷丰登的场所。天坛是圜丘、祈谷两坛的总称，有坛墙两重，形成内外坛，坛墙南方北圆，象征天圆地方。', 'attractions/tiantan_Z0m1kqi.jpg', '2026-01-24 20:42:32.000000', '2026-01-24 12:56:37.872757');
INSERT INTO `myapp_attraction` VALUES (4, '颐和园', '北京', 30.00, '颐和园是中国清朝时期皇家园林，前身为清漪园，坐落在北京西郊，距城区15公里，占地约290公顷，与圆明园毗邻。它是以昆明湖、万寿山为基址，以杭州西湖为蓝本，汲取江南园林的设计手法而建成的一座大型山水园林。', 'attractions/yiheyuan_5eG6DRQ.jpg', '2026-01-24 20:42:32.000000', '2026-01-24 12:57:16.258834');
INSERT INTO `myapp_attraction` VALUES (5, '东方明珠', '上海', 180.00, '东方明珠广播电视塔是上海的标志性文化景观之一，位于浦东新区陆家嘴，塔高约468米。该建筑于1991年7月兴建，1995年5月投入使用，承担上海6套无线电视发射业务。', 'attractions/dongfangmingzhu_B1thwaC.jpeg', '2026-01-24 20:42:32.000000', '2026-01-24 12:57:55.496218');
INSERT INTO `myapp_attraction` VALUES (6, '外滩', '上海', 0.00, '外滩是上海的标志性景观，位于黄浦江畔，全长1.5公里，南起延安东路，北至苏州河上的外白渡桥。外滩矗立着52幢风格迥异的古典复兴大楼，素有外滩万国建筑博览群之称。', 'attractions/shanghaiwaitan_8wwnULn.jpg', '2026-01-24 20:42:32.000000', '2026-01-24 12:58:41.207055');
INSERT INTO `myapp_attraction` VALUES (7, '迪士尼乐园', '上海', 399.00, '上海迪士尼乐园是中国内地首座迪士尼主题乐园，位于上海市浦东新区川沙新镇。乐园拥有七大主题园区：米奇大街、奇想花园、探险岛、宝藏湾、明日世界、梦幻世界、玩具总动员。', 'attractions/dishini_FDyvLJt.jpeg', '2026-01-24 20:42:32.000000', '2026-01-24 12:59:09.604205');
INSERT INTO `myapp_attraction` VALUES (8, '西湖', '杭州', 0.00, '西湖位于浙江省杭州市西湖区龙井路1号，杭州市区西部，景区总面积49平方千米，汇水面积为21.22平方千米，湖面面积为6.38平方千米。西湖南、西、北三面环山，湖中白堤、苏堤、杨公堤、赵公堤将湖面分割成若干水面。', 'attractions/xihu_w6Z7MgJ.jpg', '2026-01-24 20:42:32.000000', '2026-01-24 12:59:38.249225');
INSERT INTO `myapp_attraction` VALUES (9, '灵隐寺', '杭州', 30.00, '灵隐寺，又名云林寺，位于浙江省杭州市西湖区灵隐路法云弄1号，背靠北高峰，面朝飞来峰。始建于东晋咸和元年（326年），占地面积约87000平方米，是杭州最早的名刹。', 'attractions/lingyinsi_KKdOnN3.jpg', '2026-01-24 20:42:32.000000', '2026-01-24 13:00:14.051330');
INSERT INTO `myapp_attraction` VALUES (10, '千岛湖', '杭州', 150.00, '千岛湖位于浙江省杭州市淳安县境内，是新安江大坝截流后形成的人工湖。千岛湖湖形呈树枝型，湖中大小岛屿1078个，千岛湖因此得名。', 'attractions/qianhudao_7F0frAB.jpeg', '2026-01-24 20:42:32.000000', '2026-01-24 13:00:48.789709');
INSERT INTO `myapp_attraction` VALUES (11, '兵马俑', '西安', 120.00, '秦始皇兵马俑博物馆位于陕西省西安市临潼区秦陵镇，是秦始皇陵的陪葬坑。兵马俑是古代墓葬雕塑的一个类别，兵马俑即制成兵马形状的殉葬品。', 'attractions/bingmayong_0yWAubu.jpeg', '2026-01-24 20:42:32.000000', '2026-01-24 13:01:27.581109');
INSERT INTO `myapp_attraction` VALUES (12, '华清宫', '西安', 120.00, '华清宫是唐代封建帝王游幸的别宫，位于陕西省西安市临潼区骊山北麓。华清宫背山面渭，倚骊峰山势而筑，规模宏大，建筑壮丽，楼台馆殿，遍布骊山上下。', 'attractions/huaqinggong_uk9NXRT.jpeg', '2026-01-24 20:42:32.000000', '2026-01-24 13:02:04.894259');
INSERT INTO `myapp_attraction` VALUES (13, '大雁塔', '西安', 50.00, '大雁塔位于唐长安城晋昌坊的大慈恩寺内，又名\"慈恩寺塔\"。唐永徽三年（652年），玄奘为保存由天竺经丝绸之路带回长安的经卷佛像主持修建了大雁塔。', 'attractions/dayanta_wh5U9fr.jpg', '2026-01-24 20:42:32.000000', '2026-01-24 13:02:40.466889');
INSERT INTO `myapp_attraction` VALUES (14, '大熊猫繁育研究基地', '成都', 55.00, '成都大熊猫繁育研究基地位于四川省成都市成华区外北熊猫大道1375号，是世界著名的大熊猫迁地保护基地、科研繁育基地、公众教育基地和教育旅游基地。', '', '2026-01-24 20:42:32.000000', '2026-01-24 20:42:32.000000');
INSERT INTO `myapp_attraction` VALUES (15, '宽窄巷子', '成都', 0.00, '宽窄巷子位于四川省成都市青羊区长顺街附近，由宽巷子、窄巷子、井巷子平行排列组成，全为青黛砖瓦的仿古四合院落，这里也是成都遗留下来的较成规模的清朝古街道。', '', '2026-01-24 20:42:32.000000', '2026-01-24 20:42:32.000000');
INSERT INTO `myapp_attraction` VALUES (16, '都江堰', '成都', 80.00, '都江堰是世界文化遗产、世界自然遗产、全国重点文物保护单位、国家级风景名胜区、国家AAAAA级旅游景区，位于四川省成都市都江堰市城西。', '', '2026-01-24 20:42:32.000000', '2026-01-24 20:42:32.000000');
INSERT INTO `myapp_attraction` VALUES (17, '广州塔', '广州', 150.00, '广州塔又称广州新电视塔，昵称小蛮腰。位于广州市海珠区阅江西路222号，与海心沙岛和珠江新城隔江相望。广州塔塔身主体高454米，天线桅杆高146米，总高度600米。', '', '2026-01-24 20:42:32.000000', '2026-01-24 20:42:32.000000');
INSERT INTO `myapp_attraction` VALUES (18, '长隆野生动物世界', '广州', 300.00, '长隆野生动物世界位于广州市番禺区大石街道，是集野生动物保护、研究、旅游观赏、科普教育为一体的综合性景区，被誉为\"中国最具国际水准的野生动物园\"。', '', '2026-01-24 20:42:32.000000', '2026-01-24 20:42:32.000000');
INSERT INTO `myapp_attraction` VALUES (19, '天涯海角', '三亚', 81.00, '天涯海角游览区位于海南省三亚市天涯区，距主城区23公里，陆地面积10.4平方公里，海域面积6平方公里。因景区两块巨石分别刻有\"天涯\"和\"海角\"而得名。', '', '2026-01-24 20:42:32.000000', '2026-01-24 20:42:32.000000');
INSERT INTO `myapp_attraction` VALUES (20, '亚龙湾', '三亚', 0.00, '亚龙湾是海南省三亚市东郊的一处优质热带海滨风景区，号称\"东方夏威夷\"。亚龙湾集中了现代旅游五大要素：海洋、沙滩、阳光、绿色、新鲜空气于一体。', '', '2026-01-24 20:42:32.000000', '2026-01-24 20:42:32.000000');
INSERT INTO `myapp_attraction` VALUES (21, '蜈支洲岛', '三亚', 144.00, '蜈支洲岛坐落在三亚市北部的海棠湾内，面积约1.48平方公里。岛四周海域清澈透明，海水能见度6-27米，是国内最佳潜水基地。', '', '2026-01-24 20:42:32.000000', '2026-01-24 20:42:32.000000');

-- ----------------------------
-- Table structure for myapp_comment
-- ----------------------------
DROP TABLE IF EXISTS `myapp_comment`;
CREATE TABLE `myapp_comment`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `attraction_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `myapp_comment_attraction_id_614420f2_fk_myapp_attraction_id`(`attraction_id` ASC) USING BTREE,
  INDEX `myapp_comment_user_id_792769d9_fk_myapp_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `myapp_comment_attraction_id_614420f2_fk_myapp_attraction_id` FOREIGN KEY (`attraction_id`) REFERENCES `myapp_attraction` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `myapp_comment_user_id_792769d9_fk_myapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `myapp_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of myapp_comment
-- ----------------------------
INSERT INTO `myapp_comment` VALUES (1, '故宫真的太壮观了，建筑精美，历史悠久，值得一去！', '2026-01-24 20:42:32.000000', 1, 1);
INSERT INTO `myapp_comment` VALUES (2, '带孩子去的，很有教育意义，就是人太多了。', '2026-01-24 20:42:32.000000', 1, 2);
INSERT INTO `myapp_comment` VALUES (3, '第二次来了，每次都有新的发现，推荐租个讲解器。', '2026-01-24 20:42:32.000000', 1, 3);
INSERT INTO `myapp_comment` VALUES (4, '东方明珠的夜景特别美，可以俯瞰整个上海！', '2026-01-24 20:42:32.000000', 5, 1);
INSERT INTO `myapp_comment` VALUES (5, '迪士尼太棒了！各种游乐设施都很有趣，烟花秀超美！', '2026-01-24 20:42:32.000000', 7, 4);
INSERT INTO `myapp_comment` VALUES (6, '西湖免费开放真的很良心，景色优美，适合散步。', '2026-01-24 20:42:32.000000', 8, 2);
INSERT INTO `myapp_comment` VALUES (7, '断桥残雪很浪漫，苏堤春晓也很美，杭州不愧是人间天堂。', '2026-01-24 20:42:32.000000', 8, 5);
INSERT INTO `myapp_comment` VALUES (8, '兵马俑震撼人心，古人的智慧太厉害了！', '2026-01-24 20:42:32.000000', 11, 3);
INSERT INTO `myapp_comment` VALUES (9, '大熊猫太可爱了！看到了很多小熊猫，萌化了！', '2026-01-24 20:42:32.000000', 14, 1);
INSERT INTO `myapp_comment` VALUES (10, '天涯海角，浪漫的地方，和爱人一起来很有意义。', '2026-01-24 20:42:32.000000', 19, 4);
INSERT INTO `myapp_comment` VALUES (11, '蜈支洲岛水质超级清澈，潜水看到了很多热带鱼！', '2026-01-24 20:42:32.000000', 21, 5);
INSERT INTO `myapp_comment` VALUES (12, '这个还不错', '2026-01-24 12:43:04.468630', 1, 1);

-- ----------------------------
-- Table structure for myapp_favorite
-- ----------------------------
DROP TABLE IF EXISTS `myapp_favorite`;
CREATE TABLE `myapp_favorite`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `attraction_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `myapp_favorite_user_id_attraction_id_46a93fbc_uniq`(`user_id` ASC, `attraction_id` ASC) USING BTREE,
  INDEX `myapp_favorite_attraction_id_b45bbc47_fk_myapp_attraction_id`(`attraction_id` ASC) USING BTREE,
  CONSTRAINT `myapp_favorite_attraction_id_b45bbc47_fk_myapp_attraction_id` FOREIGN KEY (`attraction_id`) REFERENCES `myapp_attraction` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `myapp_favorite_user_id_fc734346_fk_myapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `myapp_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of myapp_favorite
-- ----------------------------
INSERT INTO `myapp_favorite` VALUES (1, '2026-01-24 20:42:32.000000', 1, 1);
INSERT INTO `myapp_favorite` VALUES (2, '2026-01-24 20:42:32.000000', 5, 1);
INSERT INTO `myapp_favorite` VALUES (3, '2026-01-24 20:42:32.000000', 8, 1);
INSERT INTO `myapp_favorite` VALUES (4, '2026-01-24 20:42:32.000000', 1, 2);
INSERT INTO `myapp_favorite` VALUES (5, '2026-01-24 20:42:32.000000', 2, 2);
INSERT INTO `myapp_favorite` VALUES (6, '2026-01-24 20:42:32.000000', 11, 2);
INSERT INTO `myapp_favorite` VALUES (7, '2026-01-24 20:42:32.000000', 8, 3);
INSERT INTO `myapp_favorite` VALUES (8, '2026-01-24 20:42:32.000000', 14, 3);
INSERT INTO `myapp_favorite` VALUES (9, '2026-01-24 20:42:32.000000', 7, 4);
INSERT INTO `myapp_favorite` VALUES (10, '2026-01-24 20:42:32.000000', 19, 4);
INSERT INTO `myapp_favorite` VALUES (11, '2026-01-24 20:42:32.000000', 1, 5);
INSERT INTO `myapp_favorite` VALUES (12, '2026-01-24 20:42:32.000000', 8, 5);
INSERT INTO `myapp_favorite` VALUES (13, '2026-01-24 20:42:32.000000', 21, 5);
INSERT INTO `myapp_favorite` VALUES (14, '2026-01-24 12:43:32.390308', 4, 1);
INSERT INTO `myapp_favorite` VALUES (15, '2026-01-26 13:30:58.203931', 1, 7);
INSERT INTO `myapp_favorite` VALUES (16, '2026-01-26 13:31:00.161739', 5, 7);

-- ----------------------------
-- Table structure for myapp_user
-- ----------------------------
DROP TABLE IF EXISTS `myapp_user`;
CREATE TABLE `myapp_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of myapp_user
-- ----------------------------
INSERT INTO `myapp_user` VALUES (1, 'admin', 'e0989db8233fa1fd4cd8b09770b53d52', '张三', '2222222@qq.com', '2026-01-24 12:37:19.183761');
INSERT INTO `myapp_user` VALUES (2, 'zhangsan', 'b2c34efb6a22197d6b30cadbdf7e9c0c', '张三', 'zhangsan@example.com', '2026-01-24 20:42:32.000000');
INSERT INTO `myapp_user` VALUES (3, 'lisi', 'b2c34efb6a22197d6b30cadbdf7e9c0c', '李四', 'lisi@example.com', '2026-01-24 20:42:32.000000');
INSERT INTO `myapp_user` VALUES (4, 'wangwu', 'b2c34efb6a22197d6b30cadbdf7e9c0c', '王五', 'wangwu@example.com', '2026-01-24 20:42:32.000000');
INSERT INTO `myapp_user` VALUES (5, 'xiaoming', 'b2c34efb6a22197d6b30cadbdf7e9c0c', '小明', 'xiaoming@example.com', '2026-01-24 20:42:32.000000');
INSERT INTO `myapp_user` VALUES (6, 'xiaohong', 'b2c34efb6a22197d6b30cadbdf7e9c0c', '小红', 'xiaohong@example.com', '2026-01-24 20:42:32.000000');
INSERT INTO `myapp_user` VALUES (7, 'lisisi', 'e0989db8233fa1fd4cd8b09770b53d52', '李思思', '2222222@qq.com', '2026-01-26 13:29:54.158818');

SET FOREIGN_KEY_CHECKS = 1;
