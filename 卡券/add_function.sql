
DELIMITER $$
DROP FUNCTION IF EXISTS json_arrayagg$$
CREATE FUNCTION json_arrayagg(name varchar(20)) RETURNS json_array
BEGIN
  DECLARE str VARCHAR(50) DEFAULT '';
  SET @tableName=name;
  SET str=CONCAT('create table ', @tableName,'(id int, name varchar(20));');
  return str;
END $$
DELIMITER ;

DROP FUNCTION IF EXISTS json_arrayagg
CREATE FUNCTION json_arrayagg(name varchar(20)) RETURNS json_array(varchar)
BEGIN
  DECLARE str VARCHAR(50) DEFAULT '';
  SET @tableName=name;
  SET str=CONCAT('create table ', @tableName,'(id int, name varchar(20));');
  return str;
END $$