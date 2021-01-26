-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 10.130.220.18    Database: etoothcloud
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `VERSION` int(11) DEFAULT NULL COMMENT '乐观锁,版本号',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '创建人',
  `CREATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '创建人名称',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '更新人',
  `UPDATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '更新人名称',
  `IS_AVAILABILITY` int(11) DEFAULT NULL COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `PLATFORM` varchar(5) DEFAULT NULL COMMENT '平台 BB拜博 YK养康',
  `ID` int(11) NOT NULL COMMENT 'ID',
  `HIS_ID` int(11) DEFAULT NULL COMMENT 'HIS系统ID',
  `PATIENT_ID` int(11) DEFAULT NULL COMMENT '患者 Id',
  `START_TIME` datetime DEFAULT NULL COMMENT '开始时间',
  `END_TIME` datetime DEFAULT NULL COMMENT '结束时间',
  `OPERATORY_ID` int(11) DEFAULT NULL COMMENT '诊室 Id',
  `DOCTOR_ID` int(11) DEFAULT NULL COMMENT '医生 Id',
  `ASSISTANT_ID` int(11) DEFAULT NULL COMMENT '护士 Id',
  `CONSULTANT_ID` int(11) DEFAULT NULL COMMENT '咨询师 Id',
  `DEPARTMENT` varchar(60) DEFAULT NULL COMMENT '科室',
  `NOTES` varchar(3072) DEFAULT NULL COMMENT '备注',
  `IS_CANCELLED` int(11) DEFAULT NULL COMMENT '是否已取消',
  `IS_CONFIRMED` int(11) DEFAULT NULL COMMENT '是否已确认',
  `IS_CHECKED_IN` int(11) DEFAULT NULL COMMENT '是否已挂号',
  `IS_SEATED` int(11) DEFAULT NULL COMMENT '是否开始治疗',
  `IS_COMPLETED` int(11) DEFAULT NULL COMMENT '是否完成治疗',
  `IS_CHECKED_OUT` int(11) DEFAULT NULL COMMENT '是否已结账',
  `IS_FAILED` int(11) DEFAULT NULL COMMENT '是否失约',
  `IS_LEFT` int(11) DEFAULT NULL COMMENT '是否已离开',
  `IS_CONSULTING` int(11) DEFAULT NULL COMMENT '是否已咨询',
  `IS_REMIND_EXCLUED` int(11) DEFAULT NULL COMMENT '是否不需要提醒',
  `IS_REMINDED` int(11) DEFAULT NULL COMMENT '是否已提醒',
  `IS_FOLLOWUPED` int(11) DEFAULT NULL COMMENT '是否已随访',
  `IS_PENDING` int(11) DEFAULT NULL COMMENT '是否是待定预约',
  `STATE_LAST_UPDATED` datetime DEFAULT NULL COMMENT '状态上次更新时间',
  `IS_FIRST_VISIT` int(11) DEFAULT NULL COMMENT '是否初诊',
  `SOURCE_TYPE` varchar(30) DEFAULT NULL COMMENT '预约渠道',
  `CHECK_IN_TYPE` varchar(60) DEFAULT NULL COMMENT '挂号类型',
  `HAS_TRANSFERRED` int(11) DEFAULT NULL COMMENT '已否已转诊',
  `CHECK_IN_NO` int(11) DEFAULT NULL COMMENT '挂号流水号',
  `VISIT_SEQ_NO` int(11) DEFAULT NULL COMMENT '患者到店序号',
  `FROM_APP_ID` int(11) DEFAULT NULL COMMENT '转诊的来源预约 Id',
  `APPOINTMENT_TYPE` int(11) DEFAULT NULL COMMENT '预约类型',
  `CONFIRM_TYPE` int(11) DEFAULT NULL COMMENT '确认类型',
  `CONSULT_ITEM` varchar(256) DEFAULT NULL COMMENT '咨询项目',
  `OFFICE_ID` int(11) DEFAULT NULL COMMENT '组织机构ID',
  `TENANT_ID` varchar(40) DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预约表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charge_deduction_execution`
--

DROP TABLE IF EXISTS `charge_deduction_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charge_deduction_execution` (
  `VERSION` int(11) DEFAULT NULL COMMENT '乐观锁,版本号',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '创建人',
  `CREATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '创建人名称',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '更新人',
  `UPDATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '更新人名称',
  `IS_AVAILABILITY` int(11) DEFAULT NULL COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `PLATFORM` varchar(5) DEFAULT NULL COMMENT '平台 BB拜博 YK养康',
  `ID` int(11) NOT NULL COMMENT 'ID',
  `HIS_ID` int(11) DEFAULT NULL COMMENT 'HIS系统ID',
  `OFFICE_ID` int(11) DEFAULT NULL COMMENT '组织机构ID',
  `TENANT_ID` varchar(40) DEFAULT NULL COMMENT '租户ID',
  `CHARGE_ORDER_ID` int(11) DEFAULT NULL COMMENT '收费单 Id(HIS)',
  `TOTAL_PRICE` decimal(32,8) DEFAULT NULL COMMENT '划扣总金额',
  `DEDUCTED_PRICE` decimal(32,8) DEFAULT NULL COMMENT '划扣已执行金额',
  `PATIENT_ID` int(11) DEFAULT NULL COMMENT '所属病人 Id',
  `CREATOR_ID` int(11) DEFAULT NULL COMMENT '创建者 Id',
  `CREATOR_NAME` varchar(60) DEFAULT NULL COMMENT '创建者姓名',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='划扣执行表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charge_deduction_execution`
--

LOCK TABLES `charge_deduction_execution` WRITE;
/*!40000 ALTER TABLE `charge_deduction_execution` DISABLE KEYS */;
/*!40000 ALTER TABLE `charge_deduction_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charge_deduction_execution_step`
--

DROP TABLE IF EXISTS `charge_deduction_execution_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charge_deduction_execution_step` (
  `VERSION` int(11) DEFAULT NULL COMMENT '乐观锁,版本号',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '创建人',
  `CREATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '创建人名称',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '更新人',
  `UPDATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '更新人名称',
  `IS_AVAILABILITY` int(11) DEFAULT NULL COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `PLATFORM` varchar(5) DEFAULT NULL COMMENT '平台 BB拜博 YK养康',
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `HIS_ID` int(11) DEFAULT NULL COMMENT '划扣执行步骤ID，HIS系统ID',
  `OFFICE_ID` int(11) DEFAULT NULL COMMENT '组织机构ID',
  `TENANT_ID` varchar(40) DEFAULT NULL COMMENT '租户ID',
  `CHARGE_ORDER_ID` int(11) DEFAULT NULL COMMENT '收费单 Id(HIS)',
  `CHARGE_ORDER_DETAILID` int(11) DEFAULT NULL COMMENT '关联的收费明细项 Id',
  `EXECUTION_ID` int(11) DEFAULT NULL COMMENT '关联的划扣执行 Id',
  `CHARGE_ITEM_NAME` varchar(256) DEFAULT NULL COMMENT '收费项目名称',
  `PLAN_NAME` varchar(60) DEFAULT NULL COMMENT '划扣方案名称',
  `STEP_NAME` varchar(60) DEFAULT NULL COMMENT '划扣步骤名称',
  `ITEM_STEP_CODE` varchar(60) DEFAULT NULL COMMENT '项目划扣步骤编码',
  `STEP_RATIO` decimal(10,2) DEFAULT NULL COMMENT '划扣步骤在其所属方案中所占的比 例',
  `STEP_PRICE` decimal(32,8) DEFAULT NULL COMMENT '划扣步骤的金额',
  `STATE` int(11) DEFAULT NULL COMMENT '划扣步骤执行状态 0:Pending \n未执行\n1:Executed \n已执行\n2:Aborted \n划扣步骤提\n前结束，剩\n下的步骤状\n态为已终止\n3:Skipped \n已跳过',
  `WORKFLOW_STATUS` int(11) DEFAULT NULL COMMENT '划扣步骤审批状态',
  `EXECUTION_TIME` datetime DEFAULT NULL COMMENT '划扣步骤的执行时间',
  `EXECUTION_OFFICE_ID` int(11) DEFAULT NULL COMMENT '该步骤执行的诊所 Id',
  `PLAN_STEP_ID` int(11) DEFAULT NULL COMMENT '来源的划扣方案步骤 Id',
  `STEP_INDEX` int(11) DEFAULT NULL COMMENT '划扣步骤执行顺序',
  `MAN_HOUR_COUNT` int(11) DEFAULT NULL COMMENT '划扣步骤花费工时',
  `IS_REPEATABLE` int(11) DEFAULT NULL COMMENT '是否是重复执行步骤',
  `REPEAT_INDEX` int(11) DEFAULT NULL COMMENT '重复执行的 Index',
  `IS_DEFAULT_REPEAT_STEP` int(11) DEFAULT NULL COMMENT '是否是默认生成的重复执行步骤',
  `IS_ALLOW_SKIP` int(11) DEFAULT NULL COMMENT '是否可以跳过此步骤',
  `IS_NEED_APPROVE` int(11) DEFAULT NULL COMMENT '是否参与审批',
  `IS_AUTO_EXECUTE` int(11) DEFAULT NULL COMMENT '是否自动执行',
  `ORIGIN_STEP_RATIO` decimal(10,2) DEFAULT NULL COMMENT '划扣步骤占所属方案比例',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='划扣执行步骤表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charge_deduction_execution_step`
--

LOCK TABLES `charge_deduction_execution_step` WRITE;
/*!40000 ALTER TABLE `charge_deduction_execution_step` DISABLE KEYS */;
/*!40000 ALTER TABLE `charge_deduction_execution_step` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charge_deduction_execution_step_product`
--

DROP TABLE IF EXISTS `charge_deduction_execution_step_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charge_deduction_execution_step_product` (
  `VERSION` int(11) DEFAULT NULL COMMENT '乐观锁,版本号',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '创建人',
  `CREATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '创建人名称',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '更新人',
  `UPDATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '更新人名称',
  `IS_AVAILABILITY` int(11) DEFAULT NULL COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `PLATFORM` varchar(5) DEFAULT NULL COMMENT '平台 BB拜博 YK养康',
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `HIS_ID` int(11) DEFAULT NULL COMMENT '划扣执行步骤ID，HIS系统ID',
  `OFFICE_ID` int(11) DEFAULT NULL COMMENT '组织机构ID',
  `TENANT_ID` varchar(40) DEFAULT NULL COMMENT '租户ID',
  `EXECUTION_ID` int(11) DEFAULT NULL COMMENT '划扣执行 Id(HIS)',
  `EXECUTION_STEP_ID` int(11) DEFAULT NULL COMMENT '划扣执行步骤 Id(HIS)',
  `PRODUCT_ID` int(11) DEFAULT NULL COMMENT '关联的物品 ID',
  `COUNT` int(11) DEFAULT NULL COMMENT '本次划扣执行消耗的物品数量',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='划扣执行步骤关联出库的物品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charge_deduction_execution_step_product`
--

LOCK TABLES `charge_deduction_execution_step_product` WRITE;
/*!40000 ALTER TABLE `charge_deduction_execution_step_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `charge_deduction_execution_step_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charge_item`
--

DROP TABLE IF EXISTS `charge_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charge_item` (
  `VERSION` int(11) DEFAULT NULL COMMENT '乐观锁,版本号',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '创建人',
  `CREATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '创建人名称',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '更新人',
  `UPDATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '更新人名称',
  `IS_AVAILABILITY` int(11) DEFAULT NULL COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `PLATFORM` varchar(5) DEFAULT NULL COMMENT '平台 BB拜博 YK养康',
  `ID` int(11) NOT NULL COMMENT 'ID',
  `HIS_ID` int(11) DEFAULT NULL COMMENT 'HIS系统ID',
  `ITEM_NAME` varchar(512) DEFAULT NULL COMMENT '项目名称',
  `ITEM_CODE` varchar(32) DEFAULT NULL COMMENT '编码',
  `ITEM_ENGLISH_NAME` varchar(512) DEFAULT NULL COMMENT '项目英文名称',
  `PINYIN` varchar(512) DEFAULT NULL COMMENT '拼音',
  `UNIT` varchar(20) DEFAULT NULL COMMENT '单位',
  `PRICE` decimal(32,8) DEFAULT NULL COMMENT '单价',
  `ITEM_CATAGORY_ID` int(11) DEFAULT NULL COMMENT '所属小类 Id',
  `ITEM_CATAGORY_NAME` varchar(256) DEFAULT NULL COMMENT '所属小类名称',
  `ITEM_SUPER_CATEGORY_ID` int(11) DEFAULT NULL COMMENT '所属大类 Id',
  `ITEM_SUPER_CATEGORY_NAME` varchar(256) DEFAULT NULL COMMENT '所属大类名称',
  `OFFICE_ID` int(11) DEFAULT NULL COMMENT '组织ID',
  `TENANTID` varchar(40) DEFAULT NULL COMMENT '租户ID',
  `RECORD_CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `RECORD_UPDATED_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `ISINACTIVE` varchar(5) DEFAULT NULL COMMENT '是否有效 0有效1失效',
  `ALLOW_DISCOUNT` int(11) DEFAULT NULL COMMENT '是否允许单项打折',
  `ALLOW_ORDER_DISCOUNT` int(11) DEFAULT NULL COMMENT '是否允许整单打折',
  `DISPLAY_ORDER` int(11) DEFAULT NULL COMMENT '显示顺序',
  `PROCEDURE_CODE` varchar(60) DEFAULT NULL COMMENT '项目编码（误用的）',
  `ITEM_SUB_CATEGORY` varchar(30) DEFAULT NULL COMMENT '项目相关的费用类型',
  `IS_DEDUCTION_ENABLED` int(11) DEFAULT NULL COMMENT '是否启用划扣',
  `IS_AUTO_DEDUCT` int(11) DEFAULT NULL COMMENT '是否自动划扣',
  `IS_DISABLED` int(11) DEFAULT NULL COMMENT '是否禁用',
  `SCENARIO` int(11) DEFAULT NULL COMMENT '收费场景 0:Default 普通收费\n1:WechatMall 微商城收费\n2:AdvancePayment 预付款（储值\n卡）收费\n3:GiftCertificate_Discount \n折扣卡券售卖\n4:GiftCertificate_Combo 套餐\n卡券售卖\n5:GiftCertificate_CashCoupon 现金卡券售卖\n6:DentalLab 技加工收费',
  `CHARGE_DEDUCTION_PLAN_ID` int(11) DEFAULT NULL COMMENT '关联的划扣方案 Id',
  `SYNC_SOURCE_ID` int(11) DEFAULT NULL COMMENT '上级原记录 Id 从上级 office 中 copy 过来的原记录 Id， 默认为 0，表示本诊所的数据',
  `CHARGE_ITEM_TYPE` int(11) DEFAULT NULL COMMENT '项目类型 0:Service 服务类收费项目\n1:Product 物品类收费项目\n2:DentalLab 技加工类收费项目',
  `PRODUCT_ID` int(11) DEFAULT NULL COMMENT '关联的物品 Id',
  `IS_IN_DEAL` varchar(5) DEFAULT '1' COMMENT '是否属于成交类收费项目',
  `MAX_PRICE` decimal(32,8) DEFAULT NULL COMMENT '最大单价',
  `MIN_PRICE` decimal(32,8) DEFAULT NULL COMMENT '最小单价',
  `MIN_DISCOUNT` varchar(32) DEFAULT NULL COMMENT '最小折扣',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='处置项明细收费项目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charge_item`
--

LOCK TABLES `charge_item` WRITE;
/*!40000 ALTER TABLE `charge_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `charge_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charge_item_category`
--

DROP TABLE IF EXISTS `charge_item_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charge_item_category` (
  `VERSION` int(11) DEFAULT NULL COMMENT '乐观锁,版本号',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '创建人',
  `CREATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '创建人名称',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '更新人',
  `UPDATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '更新人名称',
  `IS_AVAILABILITY` int(11) DEFAULT NULL COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `PLATFORM` varchar(5) DEFAULT NULL COMMENT '平台 BB拜博 YK养康',
  `ID` int(11) NOT NULL COMMENT 'ID',
  `HIS_ID` int(11) DEFAULT NULL COMMENT 'HIS系统ID',
  `ITEM_NAME` varchar(512) DEFAULT NULL COMMENT '项目名称',
  `ITEM_CODE` varchar(30) DEFAULT NULL COMMENT '编码',
  `PINYIN` varchar(512) DEFAULT NULL COMMENT '拼音',
  `DISPLAY_ORDER` int(11) DEFAULT NULL COMMENT '显示顺序',
  `ITEM_SUPER_CATEGORY_ID` int(11) DEFAULT NULL COMMENT '所属大类 Id',
  `ITEM_SUPER_CATEGORY_NAME` varchar(256) DEFAULT NULL COMMENT '所属大类名称',
  `OFFICE_ID` int(11) DEFAULT NULL COMMENT '组织机构ID',
  `TENANT_ID` varchar(40) DEFAULT NULL COMMENT '租户ID',
  `RECORD_CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `RECORD_UPDATED_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `ISINACTIVE` varchar(5) DEFAULT NULL COMMENT '是否有效 0有效1失效',
  `ITEM_ENGLISH_NAME` varchar(512) DEFAULT NULL COMMENT '项目英文名称',
  `SYNC_SOURCE_ID` int(11) DEFAULT NULL COMMENT '上级原记录 Id 从上级 office 中 copy 过来的原记录 Id，默认为 0， 表示本诊所的数据',
  `IS_IN_DEAL` varchar(5) DEFAULT '1' COMMENT '是否属于成交类收费项目',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='处置项收费小类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charge_item_category`
--

LOCK TABLES `charge_item_category` WRITE;
/*!40000 ALTER TABLE `charge_item_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `charge_item_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charge_item_super_category`
--

DROP TABLE IF EXISTS `charge_item_super_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charge_item_super_category` (
  `VERSION` int(11) DEFAULT NULL COMMENT '乐观锁,版本号',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '创建人',
  `CREATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '创建人名称',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '更新人',
  `UPDATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '更新人名称',
  `IS_AVAILABILITY` int(11) DEFAULT NULL COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `PLATFORM` varchar(5) DEFAULT NULL COMMENT '平台 BB拜博 YK养康',
  `ID` int(11) NOT NULL COMMENT 'ID',
  `HIS_ID` int(11) DEFAULT NULL COMMENT 'HIS系统ID',
  `ITEM_NAME` varchar(512) DEFAULT NULL COMMENT '项目名称',
  `ITEM_ENGLISH_NAME` varchar(512) DEFAULT NULL COMMENT '项目英文名称',
  `ITEM_CODE` varchar(30) DEFAULT NULL COMMENT '编码',
  `PINYIN` varchar(512) DEFAULT NULL COMMENT '拼音',
  `DISPLAY_ORDER` int(11) DEFAULT NULL COMMENT '显示顺序',
  `OFFICE_ID` int(11) DEFAULT NULL COMMENT '组织ID',
  `TENANTID` varchar(40) DEFAULT NULL COMMENT '租户ID',
  `RECORD_CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `RECORD_UPDATED_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `ISINACTIVE` varchar(5) DEFAULT NULL COMMENT '是否有效 0有效1失效',
  `CATEGORY_TYPE` varchar(5) DEFAULT NULL COMMENT '收费大类类型 0:Default\n1:Shangbao\n2:Yibao\n3:DentalLab',
  `SYNC_SOURCE_ID` int(11) DEFAULT NULL COMMENT '上级原记录 Id 从上级 office 中 copy 过来的原记录 Id， 默认为 0，表示本诊所的数据',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='处置项收费大类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charge_item_super_category`
--

LOCK TABLES `charge_item_super_category` WRITE;
/*!40000 ALTER TABLE `charge_item_super_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `charge_item_super_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charge_order`
--

DROP TABLE IF EXISTS `charge_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charge_order` (
  `VERSION` int(11) DEFAULT NULL COMMENT '乐观锁,版本号',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '创建人',
  `CREATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '创建人名称',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '更新人',
  `UPDATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '更新人名称',
  `IS_AVAILABILITY` int(11) DEFAULT NULL COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `PLATFORM` varchar(5) DEFAULT NULL COMMENT '平台 BB拜博 YK养康',
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `HIS_ID` int(11) DEFAULT NULL COMMENT '收费单ID，HIS系统ID',
  `OFFICE_ID` int(11) DEFAULT NULL COMMENT '组织机构ID',
  `TENANT_ID` varchar(40) DEFAULT NULL COMMENT '租户ID',
  `APPOINTMENT_ID` int(11) DEFAULT NULL COMMENT '预约 Id',
  `PATIENT_ID` int(11) DEFAULT NULL COMMENT '患者 Id',
  `STATUS` varchar(20) DEFAULT NULL COMMENT '状态 已收费，未 收费，已作废，退 费，部分退费',
  `TOTAL_PRICE` decimal(32,8) DEFAULT NULL COMMENT '应用单项折扣之 后的本次折前费 用',
  `PLAN_PRICE` decimal(32,8) DEFAULT NULL COMMENT '应用单项折扣之 后的本单折前应 收(目前含义与 TotalPrice 相 同)',
  `ACTUAL_PRICE` decimal(32,8) DEFAULT NULL COMMENT '总实收费用',
  `OVERDUE` decimal(32,8) DEFAULT NULL COMMENT '本次欠费',
  `DISCOUNT` decimal(10,2) DEFAULT NULL COMMENT '折扣率',
  `DISCOUNT_PRICE` decimal(32,8) DEFAULT NULL COMMENT '整单折扣掉的价 格',
  `PAY_TYPE` varchar(50) DEFAULT NULL COMMENT '付款方式 1',
  `ACTUAL_PRICE1` decimal(32,8) DEFAULT NULL COMMENT '付款方式 1 的实 收',
  `PAY_TYPE2` varchar(50) DEFAULT NULL COMMENT '付款方式 2',
  `ACTUAL_PRICE2` decimal(32,8) DEFAULT NULL COMMENT '付款方式 2 的实 收',
  `PAY_TYPE3` varchar(50) DEFAULT NULL COMMENT '付款方式 3',
  `ACTUAL_PRICE3` decimal(32,8) DEFAULT NULL COMMENT '付款方式 3 的实 收',
  `PAYEE_ID` int(11) DEFAULT NULL COMMENT '收款人 Id',
  `PAYEE` varchar(30) DEFAULT NULL COMMENT '收款人名字',
  `PAY_DATETIME` datetime DEFAULT NULL COMMENT '收款时间',
  `COMMENTS` varchar(256) DEFAULT NULL COMMENT '备注',
  `ORDER_TYPE` varchar(60) DEFAULT NULL COMMENT '收费单类型',
  `BILL_NO` varchar(50) DEFAULT NULL COMMENT '账单流水号',
  `PAY_OFFICE_ID` int(11) DEFAULT NULL COMMENT '收费诊所 Id',
  `SOURCE_CHARGE_ORDER_ID` int(11) DEFAULT NULL COMMENT '收费原单 ID',
  `FEE_TYPE` int(11) DEFAULT NULL COMMENT '收费类型 0:Charge 收费\n1:Refund 退费\n2:Overdue 还欠费\n3:PartRefund 部分退费\n4:Abort 作废\n5:BatchOverdue 合并还欠款\n6:AbortAndRevert 作废并撤回\n7:TransferIn 转入\n8:TransferOut 转出',
  `FEE_SUB_TYPE` int(11) DEFAULT NULL COMMENT '收费子类型 0:Unknown 未知\n1:RefundItem 退项目\n2:RefundPrice 退金额\n3:RefundOrder 退整单\n4:RefundYibao 退医保\n5:RefundStep 退步骤\n6:RefundYitizhifu 一体支付退\n费',
  `CHANNEL` int(11) DEFAULT NULL COMMENT '销售渠道 0:Unknown 未知\n1:Web 网站前端\n2:App 手机 App\n3:WechatMall 微商城',
  `SCENARIO` int(11) DEFAULT NULL COMMENT '收费场景 0:Default 普通收费\n1:WechatMall 微商城收费\n2:AdvancePayment 预付款（储值\n卡）收费\n3:GiftCertificate_Discount \n折扣卡券售卖\n4:GiftCertificate_Combo 套餐\n卡券售卖\n5:GiftCertificate_CashCoupon \n现金卡券售卖\n6:DentalLab 技加工收费',
  `IS_HANDLE` int(11) DEFAULT NULL COMMENT '是否是处置',
  `IS_ALIPAY_ORDER` int(11) DEFAULT NULL COMMENT '是否为支付宝收费',
  `IS_PAY_OVERDUE` int(11) DEFAULT NULL COMMENT '是否为还欠款模 式',
  `IS_ARCHIVED` int(11) DEFAULT NULL COMMENT '是否是补录收费',
  `NOT_USE_MEMBERSHIP_DISCOUNT` int(11) DEFAULT NULL COMMENT '是否归档',
  `FROM_CHARGE_ORDER_ID` int(11) DEFAULT NULL COMMENT '关联收费单 Id',
  `IS_SELF_CANCELLED` int(11) DEFAULT NULL COMMENT '是否是本单作废',
  `REASON` varchar(512) DEFAULT NULL COMMENT '原因',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收费单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charge_order`
--

LOCK TABLES `charge_order` WRITE;
/*!40000 ALTER TABLE `charge_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `charge_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charge_order_detail`
--

DROP TABLE IF EXISTS `charge_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charge_order_detail` (
  `VERSION` int(11) DEFAULT NULL COMMENT '乐观锁,版本号',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '创建人',
  `CREATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '创建人名称',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '更新人',
  `UPDATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '更新人名称',
  `IS_AVAILABILITY` int(11) DEFAULT NULL COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `PLATFORM` varchar(5) DEFAULT NULL COMMENT '平台 BB拜博 YK养康',
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `HIS_ID` int(11) DEFAULT NULL COMMENT '收费单明细ID，HIS系统ID',
  `OFFICE_ID` int(11) DEFAULT NULL COMMENT '组织机构ID',
  `TENANT_ID` varchar(40) DEFAULT NULL COMMENT '租户ID',
  `HIS_CHARGE_ORDER_ID` int(11) DEFAULT NULL COMMENT '收费单 Id(HIS)',
  `CHARGE_ITEM_ID` int(11) DEFAULT NULL COMMENT '收费项目 Id',
  `ITEM_NAME` varchar(512) DEFAULT NULL COMMENT '项目名称',
  `ITEM_TYPE` varchar(256) DEFAULT NULL COMMENT '小类名称',
  `ITEM_SUPER_TYPE` varchar(256) DEFAULT NULL COMMENT '大类名称',
  `COUNT` decimal(10,2) DEFAULT NULL COMMENT '项目数量',
  `UNIT` varchar(20) DEFAULT NULL COMMENT '项目单位',
  `PRICE` decimal(32,8) DEFAULT NULL COMMENT '项目单价',
  `TOTAL_PRICE` decimal(32,8) DEFAULT NULL COMMENT '单项折扣后总应收',
  `PLAN_PRICE` decimal(32,8) DEFAULT NULL COMMENT '应用单项和整单折扣后的总应收',
  `ACTUAL_PRICE` decimal(32,8) DEFAULT NULL COMMENT '项目实收',
  `OVERDUE` decimal(32,8) DEFAULT NULL COMMENT '项目欠费',
  `ALLOW_DISCOUNT` int(11) DEFAULT NULL COMMENT '是否参与单项折扣并允许手工修改折扣',
  `ALLOW_ORDER_DISCOUNT` int(11) DEFAULT NULL COMMENT '是否参与整单折扣',
  `DISCOUNT` decimal(10,2) DEFAULT NULL COMMENT '项目折扣率',
  `DISCOUNT_PRICE` decimal(32,8) DEFAULT NULL COMMENT '项目折扣掉的总金额',
  `DEPARTMENT` varchar(60) DEFAULT NULL COMMENT '科室',
  `FDITOOTH_CODES` varchar(256) DEFAULT NULL COMMENT '牙位',
  `NOTES` varchar(512) DEFAULT NULL COMMENT '备注',
  `IS_GIFT` int(11) DEFAULT NULL COMMENT '是否是会员馈赠项目',
  `IS_REIMBURSE` int(11) DEFAULT NULL COMMENT '该项目是否全部退掉',
  `DOCTOR_ID` int(11) DEFAULT NULL COMMENT '绩效医生 Id',
  `DOCTOR_NAME` varchar(512) DEFAULT NULL COMMENT '绩效医生姓名',
  `NURSE_ID` int(11) DEFAULT NULL COMMENT '绩效护士 Id',
  `NURSE_NAME` varchar(512) DEFAULT NULL COMMENT '绩效护士姓名',
  `CONSULTANT_ID` int(11) DEFAULT NULL COMMENT '绩效咨询师 Id',
  `CONSULTANT_NAME` varchar(512) DEFAULT NULL COMMENT '绩效咨询师姓名',
  `EXTRA_PROVIDER_ID` int(11) DEFAULT NULL COMMENT '附加员工 Id',
  `SELLER_ID` int(11) DEFAULT NULL COMMENT '销售员工 Id',
  `STEP_NAME` varchar(60) DEFAULT NULL COMMENT '收费项分步骤执行是的步骤名称',
  `DEDUCTION_CODE` varchar(20) DEFAULT NULL COMMENT '划扣项目编码',
  `PRODUCT_ID` int(11) DEFAULT NULL COMMENT '关联的物品 Id',
  `IS_DEALT` int(11) DEFAULT NULL COMMENT '是否成交',
  `SOURCE_DETAIL_ID` int(11) DEFAULT NULL COMMENT '源明细 Id',
  `CHARGE_ORDER_ID` int(11) DEFAULT NULL COMMENT '收费单ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收费单明细项目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charge_order_detail`
--

LOCK TABLES `charge_order_detail` WRITE;
/*!40000 ALTER TABLE `charge_order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `charge_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cost_center`
--

DROP TABLE IF EXISTS `cost_center`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cost_center` (
  `VERSION` int(11) DEFAULT NULL COMMENT '乐观锁,版本号',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '创建人',
  `CREATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '创建人名称',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '更新人',
  `UPDATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '更新人名称',
  `IS_AVAILABILITY` int(11) DEFAULT NULL COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `PLATFORM` varchar(5) DEFAULT NULL COMMENT '平台 BB拜博 YK养康',
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `COMPANY_CODE` varchar(5) DEFAULT NULL COMMENT '公司代码 IF_BUKRS',
  `COST_CENTER_CODE` varchar(10) DEFAULT NULL COMMENT '成本中心 IF_KOSTL',
  `COST_CENTER_DESC` varchar(20) DEFAULT NULL COMMENT '成本中心描述 IF_KTEXT',
  `MANAGER` varchar(20) DEFAULT NULL COMMENT '负责人 IF_VERAK',
  `FUNCTION_SCOPE` varchar(20) DEFAULT NULL COMMENT '功能范围 IF_FKBER，',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成本中心SAP';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cost_center`
--

LOCK TABLES `cost_center` WRITE;
/*!40000 ALTER TABLE `cost_center` DISABLE KEYS */;
/*!40000 ALTER TABLE `cost_center` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material` (
  `VERSION` int(11) DEFAULT NULL COMMENT '乐观锁,版本号',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '创建人',
  `CREATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '创建人名称',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '更新人',
  `UPDATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '更新人名称',
  `IS_AVAILABILITY` int(11) DEFAULT NULL COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `PLATFORM` varchar(5) DEFAULT NULL COMMENT '平台 BB拜博 YK养康',
  `ID` int(11) NOT NULL COMMENT '主键ID',
  `MATERIAL_CODE` varchar(40) DEFAULT NULL COMMENT '物料编码 IF_MATNR',
  `MATERIAL_DESC` varchar(40) DEFAULT NULL COMMENT '物料描述 IF_MAKTX',
  `MATERIAL_TYPE` varchar(5) DEFAULT NULL COMMENT '物料类型 IF_MTART',
  `MATERIAL_TYPE_DESC` varchar(25) DEFAULT NULL COMMENT '物料类型描述 IF_MTBEZ',
  `MATERIAL_GROUP` varchar(10) DEFAULT NULL COMMENT '物料组 IF_MATKL  40600护理品物料组',
  `MATERIAL_GROUP_DESC` varchar(20) DEFAULT NULL COMMENT '物料组描述 IF_WGBEZ',
  `MATERIAL_GROUP_DESC2` varchar(20) DEFAULT NULL COMMENT '物料组描述2 IF_WGBEZ60',
  `UNIT_CODE` varchar(5) DEFAULT NULL COMMENT '基本计量单位代码 IF_MEINS',
  `UNIT_DESC` varchar(30) DEFAULT NULL COMMENT '基本计量单位描述 IF_MSEHL',
  `ORDER_UNIT_CODE` varchar(5) DEFAULT NULL COMMENT '订单单位代码 IF_BSTME',
  `ORDER_UNIT_DESC` varchar(30) DEFAULT NULL COMMENT '订单单位描述 IF_ZMSEHL',
  `NUMERATOR` varchar(5) DEFAULT NULL COMMENT '基本计量单位转换分子 IF_UMREZ   MARM-MEINH=MARA-BSTME',
  `DENOMINATOR` varchar(5) DEFAULT NULL COMMENT '转换为基本计量单位的分母 IF_UMREN',
  `GOODS_NAME` varchar(50) DEFAULT NULL COMMENT '商品名称 IF_SPM',
  `BRAND` varchar(20) DEFAULT NULL COMMENT '品牌 IF_ZPINP',
  `SPECS` varchar(50) DEFAULT NULL COMMENT '规格 IF_GG',
  `GOODS_MODEL` varchar(30) DEFAULT NULL COMMENT '型号 IF_XH',
  `IS_BARGAIN` char(1) DEFAULT NULL COMMENT '是否划扣耗材 IF_ZHKBS    X或空，X为划扣',
  `IS_HIGH_VALUE` char(1) DEFAULT NULL COMMENT '高低值 IF_ZGZBZ   X或空，X为高值',
  `CONTROL_TYPE` varchar(5) DEFAULT NULL COMMENT '管控类型 IF_LABOR  \nA1-管控-一般物资\nA2-管控-固定资产\nA3-管控-费用\nB1-非管控-一般物资\nB2-非管控-固定资产\nB3-非管控-费用',
  `CONTROL_TYPE_DESC` varchar(30) DEFAULT NULL COMMENT '管控类型描述 IF_LBTXT',
  `BATCH_SWITCH` char(1) DEFAULT NULL COMMENT '批次管理 IF_XCHPF  X或空，X为启用批次管理',
  `IS_DEL` char(1) DEFAULT NULL COMMENT '删除标志 IF_LOVRM  X或空，X为已删除',
  `STEP_FACTORY_STATUS` varchar(5) DEFAULT NULL COMMENT '跨工厂物料状态 IF_MSTAE  \n01 因采购/仓库而被冻结\n02 因任务清单/BOM而被冻结\n04 采购冻结\n81 MPN:BOM抬头冻结\nZ1 因仓库而被冻结',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物料表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_dhr`
--

DROP TABLE IF EXISTS `organization_dhr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organization_dhr` (
  `VERSION` int(11) DEFAULT NULL COMMENT '乐观锁,版本号',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '创建人',
  `CREATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '创建人名称',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '更新人',
  `UPDATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '更新人名称',
  `IS_AVAILABILITY` int(11) DEFAULT NULL COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `PLATFORM` varchar(5) DEFAULT NULL COMMENT '平台 BB拜博 YK养康',
  `OBJID` varchar(20) NOT NULL COMMENT '组织代码',
  `ORGTX` varchar(40) DEFAULT NULL COMMENT '对象简称',
  `STEXT` varchar(256) DEFAULT NULL COMMENT '对象全称',
  `ZHROBJIDUP` varchar(20) DEFAULT NULL COMMENT '上级组织代码',
  `ZHRRESPONSIBLE` varchar(20) DEFAULT NULL COMMENT '组织负责人工号',
  `PZHRFULLNAME` varchar(30) DEFAULT NULL COMMENT '姓名',
  `PZHROAID` varchar(30) DEFAULT NULL COMMENT '组织负责人OA',
  `BEGDA` date DEFAULT NULL COMMENT '组织开始时间',
  `ENDDA` date DEFAULT NULL COMMENT '组织结束时间',
  PRIMARY KEY (`OBJID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='DHR组织机构表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_dhr`
--

LOCK TABLES `organization_dhr` WRITE;
/*!40000 ALTER TABLE `organization_dhr` DISABLE KEYS */;
/*!40000 ALTER TABLE `organization_dhr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_his`
--

DROP TABLE IF EXISTS `organization_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organization_his` (
  `VERSION` int(11) DEFAULT NULL COMMENT '乐观锁,版本号',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '创建人',
  `CREATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '创建人名称',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '更新人',
  `UPDATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '更新人名称',
  `IS_AVAILABILITY` int(11) DEFAULT NULL COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `PLATFORM` varchar(5) DEFAULT NULL COMMENT '平台 BB拜博 YK养康',
  `ID` int(11) NOT NULL COMMENT 'ID',
  `HIS_ID` int(11) DEFAULT NULL COMMENT 'HIS_ID HIS系统ID，E看牙ID',
  `TENANT_ID` varchar(40) DEFAULT NULL COMMENT '租户ID',
  `NAME` varchar(60) DEFAULT NULL COMMENT '名字',
  `PHONE_NUMBER` varchar(40) DEFAULT NULL COMMENT '电话',
  `PROVINCE` varchar(60) DEFAULT NULL COMMENT '省份',
  `CITY` varchar(60) DEFAULT NULL COMMENT '城市',
  `DISTRICT` varchar(60) DEFAULT NULL COMMENT '区/县',
  `ADDRESS` varchar(256) DEFAULT NULL COMMENT '地址',
  `CONTRACT_NAME` varchar(60) DEFAULT NULL COMMENT '联系人',
  `CONTRACT_PHONE_NUMBER` varchar(60) DEFAULT NULL COMMENT '联系人电话',
  `ABBREVIATION` varchar(20) DEFAULT NULL COMMENT '缩写',
  `CUSTOMER` varchar(60) DEFAULT NULL COMMENT '领健统一账户 Id',
  `PARENT_ID` int(11) DEFAULT NULL COMMENT '父节点 Id',
  `OFFICE_TYPE` int(11) DEFAULT NULL COMMENT '类型，群组或诊所',
  `SEQ_NUM` int(11) DEFAULT NULL COMMENT '排序字段',
  `BIZ_TYPE` int(11) DEFAULT NULL COMMENT '加盟类型',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='HIS组织机构表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_his`
--

LOCK TABLES `organization_his` WRITE;
/*!40000 ALTER TABLE `organization_his` DISABLE KEYS */;
/*!40000 ALTER TABLE `organization_his` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_relation`
--

DROP TABLE IF EXISTS `organization_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organization_relation` (
  `VERSION` int(11) DEFAULT NULL COMMENT '乐观锁,版本号',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '创建人',
  `CREATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '创建人名称',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '更新人',
  `UPDATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '更新人名称',
  `IS_AVAILABILITY` int(11) DEFAULT NULL COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `PLATFORM` varchar(5) DEFAULT NULL COMMENT '平台 BB拜博 YK养康',
  `ID` int(11) NOT NULL COMMENT 'ID',
  `OBJID` varchar(20) DEFAULT NULL COMMENT '组织代码 DHR组织代码',
  `ORGANIZATION_HIS_ID` int(11) DEFAULT NULL COMMENT 'ID_HIS HIS组织机构表ID(E看牙)',
  `FACTORY` varchar(5) DEFAULT NULL COMMENT 'ID_SAP SAP公司代码',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织机构关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_relation`
--

LOCK TABLES `organization_relation` WRITE;
/*!40000 ALTER TABLE `organization_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `organization_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_sap`
--

DROP TABLE IF EXISTS `organization_sap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organization_sap` (
  `VERSION` int(11) DEFAULT NULL COMMENT '乐观锁,版本号',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '创建人',
  `CREATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '创建人名称',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '更新人',
  `UPDATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '更新人名称',
  `IS_AVAILABILITY` int(11) DEFAULT NULL COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `PLATFORM` varchar(5) DEFAULT NULL COMMENT '平台 BB拜博 YK养康',
  `FACTORY` varchar(5) NOT NULL COMMENT '工厂 IF_WERKS',
  `FACTORY_DESC` varchar(30) DEFAULT NULL COMMENT '工厂描述 IF_NAME1',
  `COMPANY_CODE` varchar(5) DEFAULT NULL COMMENT '公司代码 IF_BUKRS',
  `COMPANY_NAME` varchar(25) DEFAULT NULL COMMENT '公司名称 IF_BUTXT',
  `PURCHASE_ORG` varchar(5) DEFAULT NULL COMMENT '采购组织 IF_EKORG，采购组织、公司代码、工厂、库存地点',
  `PURCHASE_ORG_NAME` varchar(20) DEFAULT NULL COMMENT '采购组织名称 IF_EKOTX',
  `PURCHASE_GROUP` varchar(5) DEFAULT NULL COMMENT '采购组 IF_EKGRP',
  `PURCHASE_GROUP_DESC` varchar(20) DEFAULT NULL COMMENT '采购组描述 IF_EKNAM',
  `STOCK_POSITION` varchar(5) DEFAULT NULL COMMENT '库存地点 IF_LGORT',
  `STOCK_POSITION_DESC` varchar(20) DEFAULT NULL COMMENT '库存地点描述 IF_LGOBE',
  `STOCK_POSITION_ADDRESS` varchar(256) DEFAULT NULL COMMENT '库存地点地址 if_street',
  `STOCK_TYPE` varchar(5) DEFAULT NULL COMMENT '库位类型 IF_ZLGORTT，\n1 门店自有库\n2 门店中心库\n3 门店医生库\n4 中心医生库\n5 事业部中心库\n9 其他',
  `STOCK_TYPE_DESC` varchar(60) DEFAULT NULL COMMENT '库位类型描述 IF_ZLGORTX',
  PRIMARY KEY (`FACTORY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SAP组织机构表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_sap`
--

LOCK TABLES `organization_sap` WRITE;
/*!40000 ALTER TABLE `organization_sap` DISABLE KEYS */;
/*!40000 ALTER TABLE `organization_sap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `VERSION` int(11) DEFAULT NULL COMMENT '乐观锁,版本号',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '创建人',
  `CREATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '创建人名称',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '更新人',
  `UPDATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '更新人名称',
  `IS_AVAILABILITY` int(11) DEFAULT NULL COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `PLATFORM` varchar(5) DEFAULT NULL COMMENT '平台 BB拜博 YK养康',
  `ID` int(11) NOT NULL COMMENT 'ID',
  `PATIENT_ID` int(11) DEFAULT NULL COMMENT 'HIS患者ID',
  `NAME` varchar(40) DEFAULT NULL COMMENT '姓名',
  `NAME_CODE` varchar(40) DEFAULT NULL COMMENT '首拼码',
  `NICK_NAME` varchar(50) DEFAULT NULL COMMENT '昵称',
  `PRIVATE_ID` varchar(20) DEFAULT NULL COMMENT '病历号',
  `OTHER_PRIVATE_ID` varchar(20) DEFAULT NULL COMMENT '其它病历号',
  `SEX` varchar(5) DEFAULT NULL COMMENT '性别 0:Unknow 1:Male 2:Female',
  `BIRTH_TYPE` int(11) DEFAULT NULL COMMENT '生日类型',
  `BIRTH` date DEFAULT NULL COMMENT '生日',
  `MOBILE` varchar(40) DEFAULT NULL COMMENT '手机号',
  `PHONE_MOBILE` varchar(40) DEFAULT NULL COMMENT '电话号码',
  `EMAIL` varchar(40) DEFAULT NULL COMMENT '邮箱',
  `OCCUPATION` varchar(20) DEFAULT NULL COMMENT '职业',
  `QQ` varchar(20) DEFAULT NULL COMMENT 'QQ 号',
  `WEIXIN` varchar(20) DEFAULT NULL COMMENT '微信号',
  `NATIONALITY` varchar(40) DEFAULT NULL COMMENT '国籍',
  `IDENTITY_CARD` varchar(40) DEFAULT NULL COMMENT '身份证',
  `HOME_ADDRESS` varchar(256) DEFAULT NULL COMMENT '地址',
  `SOURCE_TYPE_LEVEL1` varchar(20) DEFAULT NULL COMMENT '患者一级来源',
  `SOURCE_TYPE` varchar(20) DEFAULT NULL COMMENT '患者二级来源',
  `REFEREE_NAME` varchar(40) DEFAULT NULL COMMENT '患者三级来源名称',
  `REFEREE_MOBILE_OR_CODE` varchar(40) DEFAULT NULL COMMENT '患者三级来源手机号或代码',
  `REFEREE_ID` int(11) DEFAULT NULL COMMENT '患者三级来源 Id',
  `MEDICAL_ALTER` varchar(256) DEFAULT NULL COMMENT '过敏信息',
  `FIRST_VISIT` datetime DEFAULT NULL COMMENT '初诊时间',
  `NOTES` varchar(3072) DEFAULT NULL COMMENT '备注',
  `OVERDUE` decimal(32,8) DEFAULT NULL COMMENT '欠费金额',
  `PICTURE_ID` int(11) DEFAULT NULL COMMENT '头像图片 Id',
  `PATIENT_TYPE` varchar(40) DEFAULT NULL COMMENT '患者类型',
  `IS_ARCHIVED` char(1) DEFAULT NULL COMMENT '是否归档',
  `ARCHIVED_TIME` datetime DEFAULT NULL COMMENT '归档时间',
  `ARCHIVED_USER_NAME` varchar(60) DEFAULT NULL COMMENT '归档操作用户名',
  `MARKET_CENTER_ACCOUNT` varchar(128) DEFAULT NULL COMMENT '微信平台 ID',
  `ALI_MARKET_CENTER_ACCOUNT` varchar(128) DEFAULT NULL COMMENT '支付宝服务窗',
  `MEMBERSHIP_ID` int(11) DEFAULT NULL COMMENT '会员 Id',
  `TAG` varchar(512) DEFAULT NULL COMMENT '标签',
  `DUTY_DOCTOR_ID` int(11) DEFAULT NULL COMMENT '责任医生 Id',
  `DOCTOR_ID` int(11) DEFAULT NULL COMMENT '初诊医生 Id',
  `LAST_VISIT` datetime DEFAULT NULL COMMENT '上次就诊时间',
  `LAST_DOCTOR_ID` int(11) DEFAULT NULL COMMENT '上次就诊医生 Id',
  `POINT` int(11) DEFAULT NULL COMMENT '积分',
  `CONSULTANT_ID` int(11) DEFAULT NULL COMMENT '咨询师 Id',
  `ATTENDANT_ID` int(11) DEFAULT NULL COMMENT '专属客服 Id',
  `ADVISOR_ID` int(11) DEFAULT NULL COMMENT '专属顾问 Id',
  `OFFICE_ID` int(11) DEFAULT NULL COMMENT '组织机构ID',
  `TENANT_ID` varchar(40) DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='患者信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pdman_db_version`
--

DROP TABLE IF EXISTS `pdman_db_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pdman_db_version` (
  `DB_VERSION` varchar(256) DEFAULT NULL,
  `VERSION_DESC` varchar(1024) DEFAULT NULL,
  `CREATED_TIME` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pdman_db_version`
--

LOCK TABLES `pdman_db_version` WRITE;
/*!40000 ALTER TABLE `pdman_db_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `pdman_db_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_info`
--

DROP TABLE IF EXISTS `person_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person_info` (
  `VERSION` int(11) DEFAULT NULL COMMENT '乐观锁,版本号',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '创建人',
  `CREATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '创建人名称',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '更新人',
  `UPDATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '更新人名称',
  `IS_AVAILABILITY` int(11) DEFAULT NULL COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `PLATFORM` varchar(5) DEFAULT NULL COMMENT '平台 BB拜博 YK养康',
  `PERNR` varchar(20) NOT NULL COMMENT '员工工号',
  `ZHRFULLNAME` varchar(30) DEFAULT NULL COMMENT '员工姓名',
  `ZHROAID` varchar(30) DEFAULT NULL COMMENT 'oa系统账户名',
  `GBDAT` date DEFAULT NULL COMMENT '出生日期',
  `ZHREMPESTAT` varchar(20) DEFAULT NULL COMMENT '员工状态',
  `ZHREMPESTATT` varchar(20) DEFAULT NULL COMMENT '员工状态',
  `STAT2` varchar(20) DEFAULT NULL COMMENT '员工状态（在职 离职）',
  `STAT2T` varchar(20) DEFAULT NULL COMMENT '员工状态（在职 离职）',
  `PERSG` varchar(50) DEFAULT NULL COMMENT '员工组编码',
  `PERSGT` varchar(50) DEFAULT NULL COMMENT '员工组描述',
  `PERSK` varchar(50) DEFAULT NULL COMMENT '员工子组编码',
  `PERSKT` varchar(50) DEFAULT NULL COMMENT '员工子组描述',
  `ZHROBJID` varchar(50) DEFAULT NULL COMMENT '所属组织编号',
  `PLANS` varchar(50) DEFAULT NULL COMMENT '岗位ID',
  `PLANST` varchar(50) DEFAULT NULL COMMENT '岗位描述',
  `ZHRTKRQ` varchar(50) DEFAULT NULL COMMENT '最近一次的入职时间',
  `ZHRLZRQ` date DEFAULT NULL COMMENT '离职时间',
  `ZHRSYQENDDA` date DEFAULT NULL COMMENT '试用期预计结束日期',
  `ZZ_BEGDA` date DEFAULT NULL COMMENT '转正日期',
  `ZHRJOBFMLY` varchar(50) DEFAULT NULL COMMENT '职族（主序列）',
  `ZHRJOBFMLYT` varchar(60) DEFAULT NULL COMMENT '职族（主序列）',
  `ZHRSEQ` varchar(50) DEFAULT NULL COMMENT '序列',
  `ZHRSEQT` varchar(50) DEFAULT NULL COMMENT '序列',
  `ZHRSUBSEQ` varchar(50) DEFAULT NULL COMMENT '子序列',
  `ZHRSUBSEQT` varchar(50) DEFAULT NULL COMMENT '子序列',
  `ZHRSECSUBSEQ` varchar(50) DEFAULT NULL COMMENT '二级子序列',
  `ZHRSECSUBSEQT` varchar(50) DEFAULT NULL COMMENT '二级子序列',
  `ZHRPOSNRNK` varchar(50) DEFAULT NULL COMMENT '职衔',
  `ZHRPOSNRNKT` varchar(50) DEFAULT NULL COMMENT '职衔',
  `ZHRPOSNCLS` varchar(50) DEFAULT NULL COMMENT '职级',
  `ZHRPOSNCLST` varchar(50) DEFAULT NULL COMMENT '职级',
  `ZHRDOCFLD` varchar(256) DEFAULT NULL COMMENT '医生专业',
  `ZHRDOCFLDT` varchar(256) DEFAULT NULL COMMENT '医生专业',
  `UPDATETIME_DHR` date DEFAULT NULL COMMENT 'DHR更新时间',
  PRIMARY KEY (`PERNR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='人员信息表（DHR）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_info`
--

LOCK TABLES `person_info` WRITE;
/*!40000 ALTER TABLE `person_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_info_his`
--

DROP TABLE IF EXISTS `person_info_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person_info_his` (
  `VERSION` int(11) DEFAULT NULL COMMENT '乐观锁,版本号',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '创建人',
  `CREATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '创建人名称',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '更新人',
  `UPDATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '更新人名称',
  `IS_AVAILABILITY` int(11) DEFAULT NULL COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `PLATFORM` varchar(5) DEFAULT NULL COMMENT '平台 BB拜博 YK养康',
  `ID` int(11) NOT NULL COMMENT 'ID',
  `HIS_ID` int(11) DEFAULT NULL COMMENT 'HIS人员信息ID',
  `NAME` varchar(20) DEFAULT NULL COMMENT '姓名',
  `NAME_CODE` varchar(20) DEFAULT NULL COMMENT '首拼码',
  `BIRTH` datetime DEFAULT NULL COMMENT '生日',
  `SEX` varchar(5) DEFAULT NULL COMMENT '性别 0:Unknow 1:Male 2:Female',
  `JOB` varchar(20) DEFAULT NULL COMMENT '岗位',
  `TITLE` varchar(20) DEFAULT NULL COMMENT '职称',
  `EMAIL` varchar(40) DEFAULT NULL COMMENT '邮箱',
  `MOBILE` varchar(20) DEFAULT NULL COMMENT '手机',
  `IS_MOBILE_VERIFIED` char(1) DEFAULT NULL COMMENT '手机号是否已验证',
  `HOME_ADDRESS` varchar(256) DEFAULT NULL COMMENT '家庭住址',
  `USER_ID` int(11) DEFAULT NULL COMMENT '登录用户 Id',
  `IS_SHOW` char(1) DEFAULT NULL COMMENT '是否在职 SHOW',
  `DEPARTMENT` varchar(60) DEFAULT NULL COMMENT '科室',
  `EMPLOYEE_NO` varchar(32) DEFAULT NULL COMMENT '员工号',
  `IS_INTERN` char(1) DEFAULT NULL COMMENT '是否是实习生',
  `RELATED_PROVIDER_ID` int(11) DEFAULT NULL COMMENT '关联员工 Id',
  `CERTIFICATE_NO` varchar(60) DEFAULT NULL COMMENT '证书编号 (如医生的执业证书编号)',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='HIS人员信息表（E看牙人员信息表）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_info_his`
--

LOCK TABLES `person_info_his` WRITE;
/*!40000 ALTER TABLE `person_info_his` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_info_his` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_care_product_consume`
--

DROP TABLE IF EXISTS `stock_care_product_consume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_care_product_consume` (
  `VERSION` int(11) DEFAULT NULL COMMENT '乐观锁,版本号',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '创建人',
  `CREATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '创建人名称',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '更新人',
  `UPDATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '更新人名称',
  `IS_AVAILABILITY` int(11) DEFAULT NULL COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `PLATFORM` varchar(5) DEFAULT NULL COMMENT '平台 BB拜博 YK养康',
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `STOCK_CONSUME_CODE` bigint(20) DEFAULT NULL COMMENT '出库单号',
  `PERSON_INFO_ID` int(11) DEFAULT NULL COMMENT '医生ID',
  `PERSON_INFO_NAME` varchar(32) DEFAULT NULL COMMENT '医生姓名',
  `PERNR` varchar(20) DEFAULT NULL COMMENT '员工工号',
  `ORGANIZATION_CODE` varchar(20) DEFAULT NULL COMMENT '组织机构代码 ORGTX',
  `ORGANIZATION_NAME` varchar(256) DEFAULT NULL COMMENT '组织机构对象全称 STEXT',
  `COST_CENTER_CODE` varchar(10) DEFAULT NULL COMMENT '成本中心编码 IF_KOSTL',
  `PRODUCT_TYPE` varchar(20) DEFAULT NULL COMMENT '产品大类',
  `USE_TYPE` varchar(20) DEFAULT NULL COMMENT '使用类型 业务招待领用:  Z29\n市场营销活动：Z31\n治疗处置领用：201\n销售领用出库：Z33\nSAP的出库用途字段，IF_BWART',
  `CHARGE_ORDER_ID` int(11) DEFAULT NULL COMMENT '收费单',
  `STATUS` int(11) DEFAULT NULL COMMENT '状态 1成功2失败3已冲销4冲销失败',
  `PATIENT_NAME` varchar(40) DEFAULT NULL COMMENT '患者姓名',
  `REMARK` varchar(256) DEFAULT NULL COMMENT '备注',
  `IF_REMBLNR` varchar(10) DEFAULT NULL COMMENT '冲销凭证',
  `IF_MBLNR` varchar(10) DEFAULT NULL COMMENT '自有库出库单',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='库存护理品出库单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_care_product_consume`
--

LOCK TABLES `stock_care_product_consume` WRITE;
/*!40000 ALTER TABLE `stock_care_product_consume` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_care_product_consume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_care_product_consume_detail`
--

DROP TABLE IF EXISTS `stock_care_product_consume_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_care_product_consume_detail` (
  `VERSION` int(11) DEFAULT NULL COMMENT '乐观锁,版本号',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '创建人',
  `CREATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '创建人名称',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '更新人',
  `UPDATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '更新人名称',
  `IS_AVAILABILITY` int(11) DEFAULT NULL COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `PLATFORM` varchar(5) DEFAULT NULL COMMENT '平台 BB拜博 YK养康',
  `ID` int(11) NOT NULL COMMENT 'ID',
  `STOCK_CARE_PRODUCT_CONSUME_ID` int(11) DEFAULT NULL COMMENT '护理品出库单ID',
  `SUPPLIER_BATCH_NUMBER` varchar(20) DEFAULT NULL COMMENT '供应商批号',
  `SUPPLIER_CODE` varchar(10) DEFAULT NULL COMMENT '供应商编码 IF_LIFNR',
  `SUPPLIER_NAME` varchar(35) DEFAULT NULL COMMENT '供应商名称 IF_NAME1',
  `AMOUNT` decimal(10,2) DEFAULT NULL COMMENT '数量',
  `UNIT` varchar(5) DEFAULT NULL COMMENT '单位',
  `BATCH_NUMBER` varchar(10) DEFAULT NULL COMMENT 'SAP批次',
  `CHARGE_ITEM_CODE` varchar(32) DEFAULT NULL COMMENT '处置项编码',
  `CHARGE_ITEM_NAME` varchar(60) DEFAULT NULL COMMENT '处置项名称',
  `DEDUCTION_EXECUTION_STEP_ID` varchar(60) DEFAULT NULL COMMENT '划扣执行步骤 账单流水号--处置项编码--划扣执行步骤ID',
  `STOCK_ADDRESS` varchar(5) DEFAULT NULL COMMENT '库存地点 中心库及自有库，如同出库单，包含两种1&2两种类型库位，则入参需拆分发送',
  `STOCK_ADDRESS_DESC` varchar(20) DEFAULT NULL COMMENT '库存地点描述 IF_LGOBE',
  `FACTORY` varchar(10) DEFAULT NULL COMMENT '工厂 IF_WERKS',
  `FACTORY_DESC` varchar(32) DEFAULT NULL COMMENT '工厂描述 IF_WTEXT',
  `MATERIAL_CODE` varchar(40) DEFAULT NULL COMMENT '物料编码 IF_MATNR',
  `MATERIAL_DESC` varchar(40) DEFAULT NULL COMMENT '物料描述 IF_MAKTX',
  `MATERIAL_GROUP` varchar(10) DEFAULT NULL COMMENT '物料组 IF_MATKL',
  `LOCATION_TYPE` varchar(5) DEFAULT NULL COMMENT '库位类型 IF_ZLGORTT',
  `LOCATION_TYPE_DESC` varchar(60) DEFAULT NULL COMMENT '库位类型描述 IF_ZLGORTX',
  `STATUS` int(11) DEFAULT NULL COMMENT '状态 1未发放\n2部分发放\n3发放失败\n4全部发放',
  `UNIT_DESC` varchar(30) DEFAULT NULL COMMENT '单位描述 IF_MSEHL',
  `MANUFACTORE_DATE` date DEFAULT NULL COMMENT '生产日期 IF_HSDAT',
  `EFFECTIVE_DATE` date DEFAULT NULL COMMENT '有效日期 IF_VFDAT',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='库存护理品出库单明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_care_product_consume_detail`
--

LOCK TABLES `stock_care_product_consume_detail` WRITE;
/*!40000 ALTER TABLE `stock_care_product_consume_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_care_product_consume_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_doctor_stockreturn`
--

DROP TABLE IF EXISTS `stock_doctor_stockreturn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_doctor_stockreturn` (
  `VERSION` int(11) DEFAULT NULL COMMENT '乐观锁,版本号',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '创建人',
  `CREATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '创建人名称',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '更新人',
  `UPDATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '更新人名称',
  `IS_AVAILABILITY` int(11) DEFAULT NULL COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `PLATFORM` varchar(5) DEFAULT NULL COMMENT '平台 BB拜博 YK养康',
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `DOCTOR_STOCKRETURN_CODE` bigint(20) DEFAULT NULL COMMENT '医生库退库单号',
  `SAP_CODE` varchar(10) DEFAULT NULL COMMENT 'SAP单据编号 物料凭证号',
  `STATUS` int(11) DEFAULT NULL COMMENT '状态 1未发放\n2部分发放\n3发放失败\n4全部发放',
  `PERSION_INFO_ID` int(11) DEFAULT NULL COMMENT '医生ID',
  `PERSION_INFO_NAME` varchar(32) DEFAULT NULL COMMENT '医生姓名',
  `PERNR` varchar(20) DEFAULT NULL COMMENT '员工工号',
  `ORGANIZATION_CODE` varchar(20) DEFAULT NULL COMMENT '组织机构代码 ORGTX',
  `ORGANIZATION_NAME` varchar(256) DEFAULT NULL COMMENT '组织机构对象全称 STEXT',
  `IF_MBLNR311` varchar(10) DEFAULT NULL COMMENT '物料凭证号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医生库退库单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_doctor_stockreturn`
--

LOCK TABLES `stock_doctor_stockreturn` WRITE;
/*!40000 ALTER TABLE `stock_doctor_stockreturn` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_doctor_stockreturn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_doctor_stockreturn_detail`
--

DROP TABLE IF EXISTS `stock_doctor_stockreturn_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_doctor_stockreturn_detail` (
  `VERSION` int(11) DEFAULT NULL COMMENT '乐观锁,版本号',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '创建人',
  `CREATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '创建人名称',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '更新人',
  `UPDATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '更新人名称',
  `IS_AVAILABILITY` int(11) DEFAULT NULL COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `PLATFORM` varchar(5) DEFAULT NULL COMMENT '平台 BB拜博 YK养康',
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `DOCTOR_STOCKRETURN_ID` int(11) DEFAULT NULL COMMENT '医生库退库单ID',
  `MATERIAL_CODE` varchar(40) DEFAULT NULL COMMENT '物料编码 IF_MATNR',
  `MATERIAL_DESC` varchar(40) DEFAULT NULL COMMENT '物料描述 IF_MAKTX',
  `DELIVER_GOODS_ADDRESS` varchar(5) DEFAULT NULL COMMENT '发货库存地点',
  `RECEIVE_GOODS_ADDRESS` varchar(5) DEFAULT NULL COMMENT '收货库存地点',
  `KMEIN` varchar(5) DEFAULT NULL COMMENT '特殊库存标识',
  `AMOUNT` decimal(10,2) DEFAULT NULL COMMENT '数量',
  `UNIT` varchar(5) DEFAULT NULL COMMENT '单位',
  `BATCH` varchar(10) DEFAULT NULL COMMENT 'SAP批次',
  `SUPPLIER_BATCH_NUMBER` varchar(20) DEFAULT NULL COMMENT '供应商批号',
  `STATUS` int(11) DEFAULT NULL COMMENT '状态 1未同步2已同步完成3同步失败',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医生库退库单明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_doctor_stockreturn_detail`
--

LOCK TABLES `stock_doctor_stockreturn_detail` WRITE;
/*!40000 ALTER TABLE `stock_doctor_stockreturn_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_doctor_stockreturn_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_low_sap_bill_no`
--

DROP TABLE IF EXISTS `stock_low_sap_bill_no`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_low_sap_bill_no` (
  `VERSION` int(11) DEFAULT NULL COMMENT '乐观锁,版本号',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '创建人',
  `CREATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '创建人名称',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '更新人',
  `UPDATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '更新人名称',
  `IS_AVAILABILITY` int(11) DEFAULT NULL COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `PLATFORM` varchar(5) DEFAULT NULL COMMENT '平台 BB拜博 YK养康',
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `STOCK_LOWMATERIAL_CONSUME_ID` int(11) DEFAULT NULL COMMENT '低值耗材出库单ID',
  `CODE` varchar(32) DEFAULT NULL COMMENT '单据编码',
  `BILL_NO_VALUE` varchar(32) DEFAULT NULL COMMENT '单据内容值',
  `NAME` varchar(32) DEFAULT NULL COMMENT '单据名称',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='低值耗材出库单SAP单据关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_low_sap_bill_no`
--

LOCK TABLES `stock_low_sap_bill_no` WRITE;
/*!40000 ALTER TABLE `stock_low_sap_bill_no` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_low_sap_bill_no` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_lowmaterial_consume`
--

DROP TABLE IF EXISTS `stock_lowmaterial_consume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_lowmaterial_consume` (
  `VERSION` int(11) DEFAULT NULL COMMENT '乐观锁,版本号',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '创建人',
  `CREATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '创建人名称',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '更新人',
  `UPDATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '更新人名称',
  `IS_AVAILABILITY` int(11) DEFAULT NULL COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `PLATFORM` varchar(5) DEFAULT NULL COMMENT '平台 BB拜博 YK养康',
  `ID` int(11) DEFAULT NULL COMMENT 'ID',
  `STOCK_LOWMATERIAL_CONSUME_CODE` bigint(20) DEFAULT NULL COMMENT '出库单号',
  `STATUS` int(11) DEFAULT NULL COMMENT '状态 1未出库2部分出库3出库失败4全部出库5已冲销6冲销出错7部分冲销出错',
  `PERSION_INFO_ID` int(11) DEFAULT NULL COMMENT '医生ID',
  `PERSION_INFO_NAME` varchar(32) DEFAULT NULL COMMENT '医生姓名',
  `PERNR` varchar(20) NOT NULL COMMENT '员工工号',
  `ORGANIZATION_CODE` varchar(20) DEFAULT NULL COMMENT '组织机构代码 ORGTX',
  `ORGANIZATION_NAME` varchar(256) DEFAULT NULL COMMENT '组织机构对象全称 STEXT',
  `COST_CENTER_CODE` varchar(10) DEFAULT NULL COMMENT '成本中心编码 IF_KOSTL',
  `PRODUCT_TYPE` varchar(20) DEFAULT NULL COMMENT '产品大类',
  `USE_TYPE` int(11) DEFAULT NULL COMMENT '使用类型 1公出2非公出',
  PRIMARY KEY (`PERNR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='低值耗材出库单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_lowmaterial_consume`
--

LOCK TABLES `stock_lowmaterial_consume` WRITE;
/*!40000 ALTER TABLE `stock_lowmaterial_consume` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_lowmaterial_consume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_lowmaterial_consume_detail`
--

DROP TABLE IF EXISTS `stock_lowmaterial_consume_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_lowmaterial_consume_detail` (
  `VERSION` int(11) DEFAULT NULL COMMENT '乐观锁,版本号',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '创建人',
  `CREATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '创建人名称',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '更新人',
  `UPDATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '更新人名称',
  `IS_AVAILABILITY` int(11) DEFAULT NULL COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `PLATFORM` varchar(5) DEFAULT NULL COMMENT '平台 BB拜博 YK养康',
  `ID` int(11) DEFAULT NULL COMMENT 'ID',
  `STOCK_LOWMATERIAL_CONSUME_ID` int(11) DEFAULT NULL COMMENT '低值耗材出库单ID',
  `STOCK_ADDRESS` varchar(5) DEFAULT NULL COMMENT '库存地点 中心库及自有库，如同出库单，包含两种1&2两种类型库位，则入参需拆分发送IF_LGORT',
  `STOCK_ADDRESS_DESC` varchar(20) DEFAULT NULL COMMENT '库存地点描述 IF_LGOBE',
  `FACTORY` varchar(10) DEFAULT NULL COMMENT '工厂 IF_WERKS',
  `FACTORY_DESC` varchar(32) DEFAULT NULL COMMENT '工厂描述 IF_WTEXT',
  `MATERIAL_CODE` varchar(40) DEFAULT NULL COMMENT '物料编码 IF_MATNR',
  `MATERIAL_DESC` varchar(40) DEFAULT NULL COMMENT '物料描述 IF_MAKTX',
  `MATERIAL_GROUP` varchar(10) DEFAULT NULL COMMENT '物料组 IF_MATKL',
  `LOCATION_TYPE` varchar(5) DEFAULT NULL COMMENT '库位类型 IF_ZLGORTT',
  `LOCATION_TYPE_DESC` varchar(60) DEFAULT NULL COMMENT '库位类型描述 IF_ZLGORTX',
  `SUPPLIER_CODE` varchar(10) DEFAULT NULL COMMENT '供应商编码 IF_LIFNR',
  `SUPPLIER_NAME` varchar(35) DEFAULT NULL COMMENT '供应商名称 IF_NAME1',
  `SUPPLIER_BATCH_NUMBER` varchar(20) DEFAULT NULL COMMENT '供应商批号 IF_LICHA',
  `UNIT` varchar(5) DEFAULT NULL COMMENT '单位 IF_MSEHL',
  `BATCH_NUMBER` varchar(10) DEFAULT NULL COMMENT 'SAP批次 IF_CHARG',
  `AMOUNT` decimal(10,2) DEFAULT NULL COMMENT '数量 IF_MENGE',
  `STATUS` int(11) DEFAULT NULL COMMENT '状态 1未发放\n2部分发放\n3发放失败\n4全部发放',
  `UNIT_DESC` varchar(30) DEFAULT NULL COMMENT '单位描述 IF_MSEHL',
  `MANUFACTORE_DATE` date DEFAULT NULL COMMENT '生产日期 IF_HSDAT',
  `EFFECTIVE_DATE` date DEFAULT NULL COMMENT '有效日期 IF_VFDAT'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='低值耗材出库单明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_lowmaterial_consume_detail`
--

LOCK TABLES `stock_lowmaterial_consume_detail` WRITE;
/*!40000 ALTER TABLE `stock_lowmaterial_consume_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_lowmaterial_consume_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_material_consume`
--

DROP TABLE IF EXISTS `stock_material_consume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_material_consume` (
  `VERSION` int(11) DEFAULT NULL COMMENT '乐观锁,版本号',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '创建人',
  `CREATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '创建人名称',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '更新人',
  `UPDATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '更新人名称',
  `IS_AVAILABILITY` int(11) DEFAULT NULL COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `PLATFORM` varchar(5) DEFAULT NULL COMMENT '平台 BB拜博 YK养康',
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `STOCK_MATERIAL_CONSUME_CODE` bigint(20) DEFAULT NULL COMMENT '出库单号',
  `STATUS` int(11) DEFAULT NULL COMMENT '状态 1未出库2部分出库3出库失败4全部出库5已冲销6冲销出错7部分冲销出错',
  `PERSION_INFO_ID` int(11) DEFAULT NULL COMMENT '医生ID',
  `PERSION_INFO_NAME` varchar(32) DEFAULT NULL COMMENT '医生姓名',
  `PERNR` varchar(20) DEFAULT NULL COMMENT '员工工号',
  `ORGANIZATION_CODE` varchar(20) DEFAULT NULL COMMENT '组织机构代码 ORGTX',
  `ORGANIZATION_NAME` varchar(256) DEFAULT NULL COMMENT '组织机构对象全称 STEXT',
  `COST_CENTER_CODE` varchar(10) DEFAULT NULL COMMENT '成本中心编码 IF_KOSTL',
  `PRODUCT_TYPE` varchar(20) DEFAULT NULL COMMENT '产品大类',
  `PATIENT_NAME` varchar(40) DEFAULT NULL COMMENT '患者姓名',
  `CHARGE_ITEM_CODE` varchar(32) DEFAULT NULL COMMENT '处置项编码',
  `CHARGE_ITEM_NAME` varchar(60) DEFAULT NULL COMMENT '处置项名称',
  `DEDUCTION_EXECUTION_STEP_CODE` varchar(60) DEFAULT NULL COMMENT '划扣执行步骤编码 账单流水号--处置项编码--划扣执行步骤ID',
  `DEDUCTION_EXECUTION_STEP_ID` int(11) DEFAULT NULL COMMENT '划扣执行步骤ID',
  `CHARGE_ORDER_ID` int(11) DEFAULT NULL COMMENT '收费单ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='划扣类高值耗材出库单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_material_consume`
--

LOCK TABLES `stock_material_consume` WRITE;
/*!40000 ALTER TABLE `stock_material_consume` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_material_consume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_material_consume_detail`
--

DROP TABLE IF EXISTS `stock_material_consume_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_material_consume_detail` (
  `VERSION` int(11) DEFAULT NULL COMMENT '乐观锁,版本号',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '创建人',
  `CREATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '创建人名称',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '更新人',
  `UPDATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '更新人名称',
  `IS_AVAILABILITY` int(11) DEFAULT NULL COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `PLATFORM` varchar(5) DEFAULT NULL COMMENT '平台 BB拜博 YK养康',
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `STOCK_MATERIAL_CONSUME_ID` int(11) DEFAULT NULL COMMENT '耗材出库单ID',
  `STOCK_ADDRESS` varchar(5) DEFAULT NULL COMMENT '库存地点 中心库及自有库，如同出库单，包含两种1&2两种类型库位，则入参需拆分发送IF_LGORT',
  `STOCK_ADDRESS_DESC` varchar(20) DEFAULT NULL COMMENT '库存地点描述 IF_LGOBE',
  `FACTORY` varchar(10) DEFAULT NULL COMMENT '工厂 IF_WERKS',
  `FACTORY_DESC` varchar(32) DEFAULT NULL COMMENT '工厂描述 IF_WTEXT',
  `MATERIAL_CODE` varchar(40) DEFAULT NULL COMMENT '物料编码 IF_MATNR',
  `MATERIAL_DESC` varchar(40) DEFAULT NULL COMMENT '物料描述 IF_MAKTX',
  `MATERIAL_GROUP` varchar(10) DEFAULT NULL COMMENT '物料组 IF_MATKL',
  `LOCATION_TYPE` varchar(5) DEFAULT NULL COMMENT '库位类型 IF_ZLGORTT',
  `LOCATION_TYPE_DESC` varchar(60) DEFAULT NULL COMMENT '库位类型描述 IF_ZLGORTX',
  `SUPPLIER_CODE` varchar(10) DEFAULT NULL COMMENT '供应商编码 IF_LIFNR',
  `SUPPLIER_NAME` varchar(35) DEFAULT NULL COMMENT '供应商名称 IF_NAME1',
  `SUPPLIER_BATCH_NUMBER` varchar(20) DEFAULT NULL COMMENT '供应商批号 IF_LICHA',
  `UNIT` varchar(5) DEFAULT NULL COMMENT '单位 IF_MSEHL',
  `BATCH_NUMBER` varchar(10) DEFAULT NULL COMMENT 'SAP批次 IF_CHARG',
  `AMOUNT` decimal(10,2) DEFAULT NULL COMMENT '数量 IF_MENGE',
  `STATUS` int(11) DEFAULT NULL COMMENT '状态 1未发放\n2部分发放\n3发放失败\n4全部发放',
  `FAIL_AMOUNT` decimal(10,2) DEFAULT NULL COMMENT '失败数量 失败种植体数量。接口领用标识字段0=失败种植体，1=实际领用。',
  `UNIT_DESC` varchar(30) DEFAULT NULL COMMENT '单位描述 IF_MSEHL',
  `MANUFACTORE_DATE` date DEFAULT NULL COMMENT '生产日期 IF_HSDAT',
  `EFFECTIVE_DATE` date DEFAULT NULL COMMENT '有效日期 IF_VFDAT',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='划扣类高值耗材出库单明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_material_consume_detail`
--

LOCK TABLES `stock_material_consume_detail` WRITE;
/*!40000 ALTER TABLE `stock_material_consume_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_material_consume_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_receive`
--

DROP TABLE IF EXISTS `stock_receive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_receive` (
  `VERSION` int(11) DEFAULT NULL COMMENT '乐观锁,版本号',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '创建人',
  `CREATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '创建人名称',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '更新人',
  `UPDATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '更新人名称',
  `IS_AVAILABILITY` int(11) DEFAULT NULL COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `PLATFORM` varchar(5) DEFAULT NULL COMMENT '平台 BB拜博 YK养康',
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `STOCK_RECEIVE_CODE` bigint(20) DEFAULT NULL COMMENT '领用单号',
  `SAP_CODE` varchar(10) DEFAULT NULL COMMENT 'SAP单据编号',
  `STATUS` int(11) DEFAULT NULL COMMENT '状态 1未发放\n2部分发放\n3发放失败\n4全部发放',
  `PERSION_INFO_ID` int(11) DEFAULT NULL COMMENT '医生ID',
  `PERSION_INFO_NAME` varchar(32) DEFAULT NULL COMMENT '医生姓名',
  `PERNR` varchar(20) DEFAULT NULL COMMENT '员工工号',
  `ORGANIZATION_CODE` varchar(20) DEFAULT NULL COMMENT '组织机构代码 ORGTX',
  `ORGANIZATION_NAME` varchar(256) DEFAULT NULL COMMENT '组织机构对象全称 STEXT',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='库存划扣类耗材领用单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_receive`
--

LOCK TABLES `stock_receive` WRITE;
/*!40000 ALTER TABLE `stock_receive` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_receive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_receive_apply_detail`
--

DROP TABLE IF EXISTS `stock_receive_apply_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_receive_apply_detail` (
  `VERSION` int(11) DEFAULT NULL COMMENT '乐观锁,版本号',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '创建人',
  `CREATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '创建人名称',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '更新人',
  `UPDATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '更新人名称',
  `IS_AVAILABILITY` int(11) DEFAULT NULL COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `PLATFORM` varchar(5) DEFAULT NULL COMMENT '平台 BB拜博 YK养康',
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `STOCK_RECEIVE_ID` int(11) DEFAULT NULL COMMENT '领用单ID',
  `ORGANIZATION_CODE` varchar(20) DEFAULT NULL COMMENT '组织机构代码 ORGTX',
  `ORGANIZATION_NAME` varchar(256) DEFAULT NULL COMMENT '组织机构对象全称 STEXT',
  `MATERIAL_CODE` varchar(40) DEFAULT NULL COMMENT '物料编码 IF_MATNR',
  `MATERIAL_DESC` varchar(40) DEFAULT NULL COMMENT '物料描述 IF_MAKTX',
  `UNIT` varchar(5) DEFAULT NULL COMMENT '单位',
  `APPLY_NUM` decimal(10,2) DEFAULT NULL COMMENT '申请数量',
  `UNIT_DESC` varchar(30) DEFAULT NULL COMMENT '基本计量单位描述 IF_MSEHL',
  `CONTROL_TYPE_DESC` varchar(30) DEFAULT NULL COMMENT '管控类型描述 IF_LBTXT',
  `BRAND` varchar(20) DEFAULT NULL COMMENT '品牌 IF_ZPINP',
  `SPECS` varchar(50) DEFAULT NULL COMMENT '规格 IF_GG',
  `GOODS_MODEL` varchar(30) DEFAULT NULL COMMENT '型号 IF_XH',
  `IS_BARGAIN` char(1) DEFAULT NULL COMMENT '是否划扣耗材 IF_ZHKBS    X或空，X为划扣',
  `IS_HIGH_VALUE` char(1) DEFAULT NULL COMMENT '高低值 IF_ZGZBZ   X或空，X为高值',
  `BATCH_SWITCH` char(1) DEFAULT NULL COMMENT '批次管理 IF_XCHPF  X或空，X为启用批次管理',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='库存划扣类耗材领用申请单明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_receive_apply_detail`
--

LOCK TABLES `stock_receive_apply_detail` WRITE;
/*!40000 ALTER TABLE `stock_receive_apply_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_receive_apply_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_receive_detail`
--

DROP TABLE IF EXISTS `stock_receive_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_receive_detail` (
  `VERSION` int(11) DEFAULT NULL COMMENT '乐观锁,版本号',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '创建人',
  `CREATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '创建人名称',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '更新人',
  `UPDATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '更新人名称',
  `IS_AVAILABILITY` int(11) DEFAULT NULL COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `PLATFORM` varchar(5) DEFAULT NULL COMMENT '平台 BB拜博 YK养康',
  `ID` int(11) DEFAULT NULL COMMENT 'ID',
  `STOCK_RECEIVE_ID` int(11) DEFAULT NULL COMMENT '领用单ID',
  `STOCK_RECEIVE_APPLY_ID` int(11) DEFAULT NULL COMMENT '领用申请单ID',
  `MATERIAL_CODE` varchar(40) DEFAULT NULL COMMENT '物料编码 IF_MATNR',
  `MATERIAL_DESC` varchar(40) DEFAULT NULL COMMENT '物料描述 IF_MAKTX',
  `DELIVER_GOODS_ADDRESS` varchar(5) DEFAULT NULL COMMENT '发货库存地点 IF_LGORT库存地点',
  `STOCK_ADDRESS_DESC` varchar(20) DEFAULT NULL COMMENT '库存地点描述 IF_LGOBE',
  `RECEIVE_GOODS_ADDRESS` varchar(5) DEFAULT NULL COMMENT '收货库存地点 IF_LGORT1',
  `KMEIN` varchar(5) DEFAULT NULL COMMENT '特殊库存标识 SAP中当库位类型=2时，仅抓取特殊库存标识=K的库存数量',
  `AMOUNT` decimal(10,2) DEFAULT NULL COMMENT '数量',
  `UNIT` varchar(5) DEFAULT NULL COMMENT '单位',
  `BATCH` varchar(10) DEFAULT NULL COMMENT 'SAP批次',
  `SUPPLIER_BATCH_NUMBER` varchar(20) DEFAULT NULL COMMENT '供应商批号',
  `STATUS` int(11) DEFAULT NULL COMMENT '状态 1未同步2已同步完成3同步失败',
  `MATERIAL_GROUP` varchar(10) DEFAULT NULL COMMENT '物料组 IF_MATKL',
  `LOCATION_TYPE` varchar(5) DEFAULT NULL COMMENT '库位类型 IF_ZLGORTT',
  `LOCATION_TYPE_DESC` varchar(60) DEFAULT NULL COMMENT '库位类型描述 IF_ZLGORTX',
  `SUPPLIER_CODE` varchar(10) DEFAULT NULL COMMENT '供应商编码 IF_LIFNR',
  `SUPPLIER_NAME` varchar(35) DEFAULT NULL COMMENT '供应商名称 IF_NAME1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='库存划扣类耗材领用单明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_receive_detail`
--

LOCK TABLES `stock_receive_detail` WRITE;
/*!40000 ALTER TABLE `stock_receive_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_receive_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_sap_bill_no`
--

DROP TABLE IF EXISTS `stock_sap_bill_no`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_sap_bill_no` (
  `VERSION` int(11) DEFAULT NULL COMMENT '乐观锁,版本号',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '创建人',
  `CREATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '创建人名称',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '更新人',
  `UPDATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '更新人名称',
  `IS_AVAILABILITY` int(11) DEFAULT NULL COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `PLATFORM` varchar(5) DEFAULT NULL COMMENT '平台 BB拜博 YK养康',
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `STOCK_MATERIAL_CONSUME_ID` int(11) DEFAULT NULL COMMENT '耗材出库单ID',
  `CODE` varchar(32) DEFAULT NULL COMMENT '单据编码',
  `BILL_NO_VALUE` varchar(32) DEFAULT NULL COMMENT '单据内容值',
  `NAME` varchar(32) DEFAULT NULL COMMENT '单据名称',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='划扣类高值耗材出库单SAP单据关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_sap_bill_no`
--

LOCK TABLES `stock_sap_bill_no` WRITE;
/*!40000 ALTER TABLE `stock_sap_bill_no` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_sap_bill_no` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict`
--

DROP TABLE IF EXISTS `sys_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict` (
  `VERSION` int(11) DEFAULT NULL COMMENT '乐观锁,版本号',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '创建人',
  `CREATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '创建人名称',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '更新人',
  `UPDATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '更新人名称',
  `IS_AVAILABILITY` int(11) DEFAULT NULL COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `PLATFORM` varchar(5) DEFAULT NULL COMMENT '平台 BB拜博 YK养康',
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `DICT_CODE` varchar(32) DEFAULT NULL COMMENT '字典编码',
  `DICT_VALUE` varchar(32) DEFAULT NULL COMMENT '字典值',
  `DICT_DESC` varchar(32) DEFAULT NULL COMMENT '字典描述',
  `TYPE_CODE` varchar(20) DEFAULT NULL COMMENT '字典类型编码',
  `REMARK` varchar(60) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict`
--

LOCK TABLES `sys_dict` WRITE;
/*!40000 ALTER TABLE `sys_dict` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_operate_log`
--

DROP TABLE IF EXISTS `sys_operate_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_operate_log` (
  `VERSION` int(11) DEFAULT NULL COMMENT '乐观锁,版本号',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '创建人',
  `CREATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '创建人名称',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '更新人',
  `UPDATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '更新人名称',
  `IS_AVAILABILITY` int(11) DEFAULT NULL COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `PLATFORM` varchar(5) DEFAULT NULL COMMENT '平台 BB拜博 YK养康',
  `ID` int(11) NOT NULL COMMENT 'ID',
  `TYPE_DESC` varchar(20) DEFAULT NULL COMMENT '操作类型',
  `CONTENT` varchar(512) DEFAULT NULL COMMENT '操作内容',
  `PERNR` varchar(20) NOT NULL COMMENT '操作人员工工号',
  `ORGANIZATION_CODE` varchar(20) DEFAULT NULL COMMENT '组织机构代码 ORGTX',
  `ORGANIZATION_NAME` varchar(256) DEFAULT NULL COMMENT '组织机构对象全称 STEXT',
  PRIMARY KEY (`ID`,`PERNR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_operate_log`
--

LOCK TABLES `sys_operate_log` WRITE;
/*!40000 ALTER TABLE `sys_operate_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_operate_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_task_info`
--

DROP TABLE IF EXISTS `sys_task_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_task_info` (
  `VERSION` int(11) DEFAULT NULL COMMENT '乐观锁,版本号',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '创建人',
  `CREATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '创建人名称',
  `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY_ID` bigint(20) DEFAULT NULL COMMENT '更新人',
  `UPDATED_BY_NAME` varchar(256) DEFAULT NULL COMMENT '更新人名称',
  `IS_AVAILABILITY` int(11) DEFAULT NULL COMMENT '是否有效 是否有效：0、无效；1、有效；',
  `PLATFORM` varchar(5) DEFAULT NULL COMMENT '平台 BB拜博 YK养康',
  `ID` int(11) NOT NULL COMMENT 'ID',
  `ENTITY_ID` int(11) DEFAULT NULL COMMENT '关联实体ID',
  `STATUS` int(11) DEFAULT NULL COMMENT '状态 1待处理\n2已处理\n3已关闭',
  `TYPE` int(11) DEFAULT NULL COMMENT '类型 1划扣耗材出库\n2非划扣耗材出库\n3收费单划扣记录变化\n4护理表',
  `ORGANIZATION_CODE` varchar(20) DEFAULT NULL COMMENT '组织机构代码 ORGTX',
  `ORGANIZATION_NAME` varchar(256) DEFAULT NULL COMMENT '组织机构对象全称 STEXT',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='待办任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_task_info`
--

LOCK TABLES `sys_task_info` WRITE;
/*!40000 ALTER TABLE `sys_task_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_task_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-14 16:45:41
