/** 
表修改 alter table 
	a) 添加字段;
	b) 修改字段类型;
	c) 修改字段名称;
	d) 删除字段;
	e) 修改表名
*/
use py2607b;

alter table tb_student add column card varchar(18) comment '身份证号' after gender;

-- 添加字段 add column
alter table tb_student add column card2 varchar(20) comment '身份证2';

-- 修改字段类型 modify 、 comment 如果不设置, 会丢失注释信息
alter table tb_student modify card2 bigint comment '身份证';

-- 修改字段名 change , 将 card2 字段 更改为 card3 且类型为 varchar
alter table tb_student change card2 card3 varchar(18) comment '身份证';

-- 删除字段 drop column
alter table tb_student drop column card3;

-- 修改 表名 rename to
alter table tb_student rename to student ;
rename table student to tb_student ;

-- 查看表结构
desc tb_student ;

