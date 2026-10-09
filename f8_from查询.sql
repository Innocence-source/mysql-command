/*
2.from 查询：基于表的查询
*/
use py2607b;

desc tb_student;

# 查询学生表的学生的所有信息
select
	s.sno,
	s.name,
	s.birth as birthday,
	s.tel,
	s.gender,
	s.card,
	s.create_time
from tb_student as s;

# 如果 要查询 一张表中所有的列、也可以使用 * 代替
# 在企业中 ，通常 不允许使用 select * (效率低)
select * from tb_student ;

select s.* from tb_student s;

# 查询指定的列
select s.sno, s.name from tb_student s;






