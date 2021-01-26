DROP TABLE IF EXISTS office_yk_bk CASCADE
;
CREATE TABLE organization_info  (
    id                      bigint not null primary key auto_increment,
	code                  	varchar(8) NULL,
	tenant_cd             	varchar(8) NULL,
	root_org_cd           	varchar(8) NULL,
	template_cd           	varchar(8) NULL,
	parent_cd             	varchar(8) NULL,
	no                    	varchar(50) NULL,
	type_cd               	varchar(8) NULL,
	name                  	varchar(100) NULL,
	short_name            	varchar(100) NULL,
	suc_no                	varchar(100) NULL,
	des                   	varchar(500) NULL,
	address               	varchar(500) NULL,
	province_cd           	varchar(20) NULL,
	city_cd               	varchar(20) NULL,
	district_cd           	varchar(20) NULL,
	subdistrict           	varchar(100) NULL,
	license_no            	varchar(50) NULL,
	ownership_cd          	varchar(8) NULL,
	leal_person_name      	varchar(50) NULL,
	leal_person_tel       	varchar(100) NULL,
	leal_person_id_card_no	varchar(20) NULL,
	contact_name          	varchar(50) NULL,
	contact_tel           	varchar(20) NULL,
	contact_email         	varchar(50) NULL,
	init_flag             	bool NULL,
	status_cd             	varchar(8) NULL,
	start_date            	date NULL,
	end_date              	date NULL,
	tree_level            	int(4) NULL,
	tree_path             	varchar(500) NULL,
	tree_leaf_flag        	bool NULL,
	created_by_cd         	varchar(8) NULL,
	created_time          	timestamp NULL,
	created_name          	varchar(50) NULL,
	last_updated_name     	varchar(50) NULL,
	last_updated_by_cd    	varchar(8) NULL,
	last_updated_time     	timestamp NULL,
	deleted_flag          	bool NULL,
	community_id          	varchar(20) NULL,
	sort_no               	int(4) NULL,
	old_org_cd            	varchar(36) NULL,
	business_type         	varchar(100) NULL,
	nick_name             	varchar(100) NULL
	);
INSERT INTO office_yk_bk(code, tenant_cd, root_org_cd, template_cd, parent_cd, no, type_cd, name, short_name, suc_no, des, address, province_cd, city_cd, district_cd, subdistrict, license_no, ownership_cd, leal_person_name, leal_person_tel, leal_person_id_card_no, contact_name, contact_tel, contact_email, init_flag, status_cd, start_date, end_date, tree_level, tree_path, tree_leaf_flag, created_by_cd, created_time, created_name, last_updated_name, last_updated_by_cd, last_updated_time, deleted_flag, community_id, sort_no, old_org_cd, business_type, nick_name)
  VALUES('00000002', '00000000', '00000002', '00000002', NULL, '000000', '1', '泰康之家', '泰康之家', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, '1', NULL, NULL, 1, '000002', false, NULL, NULL, NULL, '路吉猛', '00123456', '2020-06-22 17:30:50.398', false, 'TKZJ_GROUP', 20, '010201', '集团管理', NULL);

INSERT INTO office_yk_bk(code, tenant_cd, root_org_cd, template_cd, parent_cd, no, type_cd, name, short_name, suc_no, des, address, province_cd, city_cd, district_cd, subdistrict, license_no, ownership_cd, leal_person_name, leal_person_tel, leal_person_id_card_no, contact_name, contact_tel, contact_email, init_flag, status_cd, start_date, end_date, tree_level, tree_path, tree_leaf_flag, created_by_cd, created_time, created_name, last_updated_name, last_updated_by_cd, last_updated_time, deleted_flag, community_id, sort_no, old_org_cd, business_type, nick_name)
  VALUES('WBS1JG74', '00000000', '00000002', '00000003', '00000002', NULL, '1', '山西晋园', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '1', NULL, NULL, 2, '000002/WBS1JG74', true, '00123456', '2020-09-18 09:01:23.603', '路吉猛', '路吉猛', '00123456', NULL, false, 'SXJY', 100, NULL, '长寿社区', NULL);

INSERT INTO office_yk_bk(code, tenant_cd, root_org_cd, template_cd, parent_cd, no, type_cd, name, short_name, suc_no, des, address, province_cd, city_cd, district_cd, subdistrict, license_no, ownership_cd, leal_person_name, leal_person_tel, leal_person_id_card_no, contact_name, contact_tel, contact_email, init_flag, status_cd, start_date, end_date, tree_level, tree_path, tree_leaf_flag, created_by_cd, created_time, created_name, last_updated_name, last_updated_by_cd, last_updated_time, deleted_flag, community_id, sort_no, old_org_cd, business_type, nick_name)
  VALUES('PHH3M3DF', '00000000', '00000002', 'JSR339AG', '00000002', '0000', '1', '上海申园康复医院', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '1', NULL, NULL, 2, '000002/PHH3M3DF', true, '00123456', '2020-07-28 08:35:28.009', '路吉猛', '路吉猛', '00123456', NULL, false, 'SHSYKFYY', 120, NULL, '康复医院', NULL);

INSERT INTO office_yk_bk(code, tenant_cd, root_org_cd, template_cd, parent_cd, no, type_cd, name, short_name, suc_no, des, address, province_cd, city_cd, district_cd, subdistrict, license_no, ownership_cd, leal_person_name, leal_person_tel, leal_person_id_card_no, contact_name, contact_tel, contact_email, init_flag, status_cd, start_date, end_date, tree_level, tree_path, tree_leaf_flag, created_by_cd, created_time, created_name, last_updated_name, last_updated_by_cd, last_updated_time, deleted_flag, community_id, sort_no, old_org_cd, business_type, nick_name)
  VALUES('550W2WUF', '00000000', '00000002', 'JSR339AG', '00000002', '0000', '1', '广州泰康粤园医院', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '1', NULL, NULL, 2, '000002/550W2WUF', true, '00123456', '2020-07-28 08:37:02.349', '路吉猛', '路吉猛', '00123456', NULL, false, 'GZTKYYYY', 140, NULL, '康复医院', NULL);

INSERT INTO office_yk_bk(code, tenant_cd, root_org_cd, template_cd, parent_cd, no, type_cd, name, short_name, suc_no, des, address, province_cd, city_cd, district_cd, subdistrict, license_no, ownership_cd, leal_person_name, leal_person_tel, leal_person_id_card_no, contact_name, contact_tel, contact_email, init_flag, status_cd, start_date, end_date, tree_level, tree_path, tree_leaf_flag, created_by_cd, created_time, created_name, last_updated_name, last_updated_by_cd, last_updated_time, deleted_flag, community_id, sort_no, old_org_cd, business_type, nick_name)
  VALUES('LERHHDPF', '00000000', '00000002', 'JSR339AG', '00000002', '0000', '1', '北京泰康燕园康复医院', 'BJYYKFYY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '1', NULL, NULL, 2, '000002/LERHHDPF', true, '00123456', '2020-07-28 08:34:36.931', '路吉猛', '路吉猛', '00123456', NULL, false, 'SHSYKFYY', 110, NULL, '康复医院', NULL);

INSERT INTO office_yk_bk(code, tenant_cd, root_org_cd, template_cd, parent_cd, no, type_cd, name, short_name, suc_no, des, address, province_cd, city_cd, district_cd, subdistrict, license_no, ownership_cd, leal_person_name, leal_person_tel, leal_person_id_card_no, contact_name, contact_tel, contact_email, init_flag, status_cd, start_date, end_date, tree_level, tree_path, tree_leaf_flag, created_by_cd, created_time, created_name, last_updated_name, last_updated_by_cd, last_updated_time, deleted_flag, community_id, sort_no, old_org_cd, business_type, nick_name)
  VALUES('TTT3RP7F', '00000000', '00000002', 'JSR339AG', '00000002', '0000', '1', '成都泰康蜀园医院', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '1', NULL, NULL, 2, '000002/TTT3RP7F', true, '00123456', '2020-07-28 08:36:13.124', '路吉猛', '路吉猛', '00123456', NULL, false, 'CDSYYY', 130, NULL, '康复医院', NULL);

INSERT INTO office_yk_bk(code, tenant_cd, root_org_cd, template_cd, parent_cd, no, type_cd, name, short_name, suc_no, des, address, province_cd, city_cd, district_cd, subdistrict, license_no, ownership_cd, leal_person_name, leal_person_tel, leal_person_id_card_no, contact_name, contact_tel, contact_email, init_flag, status_cd, start_date, end_date, tree_level, tree_path, tree_leaf_flag, created_by_cd, created_time, created_name, last_updated_name, last_updated_by_cd, last_updated_time, deleted_flag, community_id, sort_no, old_org_cd, business_type, nick_name)
  VALUES('GE3ZF307', '00000000', '00000002', '00000003', '00000002', NULL, '2', '杭州大清谷', '杭州大清谷', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '1', NULL, NULL, 2, '000002/GE3ZF307', true, '00123456', '2020-07-28 10:45:47.311', '路吉猛', '路吉猛', '00123456', NULL, false, 'TKQG', 100, '6a680ab7a61145b1936975f81b743d74', '长寿社区', NULL);

INSERT INTO office_yk_bk(code, tenant_cd, root_org_cd, template_cd, parent_cd, no, type_cd, name, short_name, suc_no, des, address, province_cd, city_cd, district_cd, subdistrict, license_no, ownership_cd, leal_person_name, leal_person_tel, leal_person_id_card_no, contact_name, contact_tel, contact_email, init_flag, status_cd, start_date, end_date, tree_level, tree_path, tree_leaf_flag, created_by_cd, created_time, created_name, last_updated_name, last_updated_by_cd, last_updated_time, deleted_flag, community_id, sort_no, old_org_cd, business_type, nick_name)
  VALUES('WMAN1EEN', '00000000', '00000002', '00000003', '00000002', NULL, '1', '楚园养老社区', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '1', NULL, NULL, 2, '000002/WMAN1EEN', true, '00123456', '2020-07-17 10:54:22.159', '路吉猛', '路吉猛', '00123456', NULL, false, 'HBCY', 100, '64b69b7c23634bb8be1d06dd5763b739', '长寿社区', NULL);

INSERT INTO office_yk_bk(code, tenant_cd, root_org_cd, template_cd, parent_cd, no, type_cd, name, short_name, suc_no, des, address, province_cd, city_cd, district_cd, subdistrict, license_no, ownership_cd, leal_person_name, leal_person_tel, leal_person_id_card_no, contact_name, contact_tel, contact_email, init_flag, status_cd, start_date, end_date, tree_level, tree_path, tree_leaf_flag, created_by_cd, created_time, created_name, last_updated_name, last_updated_by_cd, last_updated_time, deleted_flag, community_id, sort_no, old_org_cd, business_type, nick_name)
  VALUES('00000007', '00000000', '00000002', '00000003', '00000002', '7', '1', '广州粤园', '广州粤园', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '1', NULL, NULL, 2, '000002/000007', false, NULL, '2020-06-05 15:54:11.987', NULL, '路吉猛', '00123456', NULL, false, 'GZYY', 50, '9eed725d6dee4a3686b30289368f1fd4', '长寿社区', NULL);

INSERT INTO office_yk_bk(code, tenant_cd, root_org_cd, template_cd, parent_cd, no, type_cd, name, short_name, suc_no, des, address, province_cd, city_cd, district_cd, subdistrict, license_no, ownership_cd, leal_person_name, leal_person_tel, leal_person_id_card_no, contact_name, contact_tel, contact_email, init_flag, status_cd, start_date, end_date, tree_level, tree_path, tree_leaf_flag, created_by_cd, created_time, created_name, last_updated_name, last_updated_by_cd, last_updated_time, deleted_flag, community_id, sort_no, old_org_cd, business_type, nick_name)
  VALUES('00000005', '00000000', '00000002', '00000003', '00000002', '5', '1', '四川蜀园', '四川蜀园', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '1', NULL, NULL, 2, '000002/000005', true, NULL, '2020-06-05 15:50:10.697', NULL, '路吉猛', '00123456', NULL, false, 'SCSY', 60, '0e9f95ce6c384b24a1862927f5aec53a', '长寿社区', NULL);

INSERT INTO office_yk_bk(code, tenant_cd, root_org_cd, template_cd, parent_cd, no, type_cd, name, short_name, suc_no, des, address, province_cd, city_cd, district_cd, subdistrict, license_no, ownership_cd, leal_person_name, leal_person_tel, leal_person_id_card_no, contact_name, contact_tel, contact_email, init_flag, status_cd, start_date, end_date, tree_level, tree_path, tree_leaf_flag, created_by_cd, created_time, created_name, last_updated_name, last_updated_by_cd, last_updated_time, deleted_flag, community_id, sort_no, old_org_cd, business_type, nick_name)
  VALUES('00000001', 'hTxubOMr', '00000001', '71DCX3W6', NULL, '0000000', '1', '平台', '平台', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '1', NULL, NULL, 1, '000001', false, NULL, '2020-05-21 16:00:38.079', NULL, '路吉猛', '00123456', NULL, false, 'PLATFORM', 10, NULL, '平台管理类', NULL);

INSERT INTO office_yk_bk(code, tenant_cd, root_org_cd, template_cd, parent_cd, no, type_cd, name, short_name, suc_no, des, address, province_cd, city_cd, district_cd, subdistrict, license_no, ownership_cd, leal_person_name, leal_person_tel, leal_person_id_card_no, contact_name, contact_tel, contact_email, init_flag, status_cd, start_date, end_date, tree_level, tree_path, tree_leaf_flag, created_by_cd, created_time, created_name, last_updated_name, last_updated_by_cd, last_updated_time, deleted_flag, community_id, sort_no, old_org_cd, business_type, nick_name)
  VALUES('00000004', '00000000', '00000002', '00000003', '00000002', '4', '1', '苏州吴园', '苏州吴园', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '1', NULL, NULL, 2, '000002/000004', false, NULL, '2020-06-05 15:48:52.64', NULL, '路吉猛', '00123456', NULL, false, 'SZWY', 70, '04d130aadbaa4d62b8e141775e8a5900', '长寿社区', NULL);

INSERT INTO office_yk_bk(code, tenant_cd, root_org_cd, template_cd, parent_cd, no, type_cd, name, short_name, suc_no, des, address, province_cd, city_cd, district_cd, subdistrict, license_no, ownership_cd, leal_person_name, leal_person_tel, leal_person_id_card_no, contact_name, contact_tel, contact_email, init_flag, status_cd, start_date, end_date, tree_level, tree_path, tree_leaf_flag, created_by_cd, created_time, created_name, last_updated_name, last_updated_by_cd, last_updated_time, deleted_flag, community_id, sort_no, old_org_cd, business_type, nick_name)
  VALUES('00000003', '00000000', '00000002', '00000003', '00000002', '0000', '1', '北京燕园', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '1', NULL, NULL, 2, '000002/000003', false, NULL, '2020-05-21 16:01:15.201', NULL, '路吉猛', '00123456', NULL, false, 'BJYY', 30, '357bb46edc5b4235843985b58e377d0b', '长寿社区', '燕园');

INSERT INTO office_yk_bk(code, tenant_cd, root_org_cd, template_cd, parent_cd, no, type_cd, name, short_name, suc_no, des, address, province_cd, city_cd, district_cd, subdistrict, license_no, ownership_cd, leal_person_name, leal_person_tel, leal_person_id_card_no, contact_name, contact_tel, contact_email, init_flag, status_cd, start_date, end_date, tree_level, tree_path, tree_leaf_flag, created_by_cd, created_time, created_name, last_updated_name, last_updated_by_cd, last_updated_time, deleted_flag, community_id, sort_no, old_org_cd, business_type, nick_name)
  VALUES('00000006', '00000000', '00000002', '00000003', '00000002', '6', '1', '上海申园', '上海申园', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '1', NULL, NULL, 2, '000002/000006', false, NULL, '2020-06-05 15:51:00.897', NULL, '路吉猛', '00123456', NULL, false, 'SHSY', 40, '232480683bfa4c20af31e33b09f80f61', '长寿社区', '申园');

