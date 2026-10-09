/**
基于表的子查询： 一个查询命令 它的结果本身也是一张表
  对这个结果 继续查询 就是 基于表的子查询

MySQL8 新增的， 支持使用 with 定义临时表 改造基于表的子查询

*/

# 查询所有学生的 学号、名字、出生年份、出生月份 、性别 和 手机号
select * from (
	select sno, name, year(birth) year, month(birth) month, gender,
			if(gender = 'm', '男', if(gender = 'f', '女', '保密')) as sex,
			tel from tb_student
) as x where sex = '男';


# MySQL8 新增的， 支持使用 with 定义临时表 改造基于表的子查询
with temp as (
	select sno, name, year(birth) year, month(birth) month, gender,
			if(gender = 'm', '男', if(gender = 'f', '女', '保密')) as sex,
			tel from tb_student
) select *from temp where sex = '男'；


with temp as (
select sno, name, year(birth)year, month(birth)month, gender, 
	if(gender = 'm', '男', if(gender = 'f', '女', '保密') ) as sex,
	tel from tb_student
)as x where sex = '男'