/*
子查询： 查询命令中 嵌套查询 、被嵌套的查询 被称为 子查询。

按照 子查询 出现的位置 、可以 把 子查询 分为 三大类
a) 基于列的子查询
b) 基于表的子查询
c) 基于条件的子查询
*/


# 查询所有的学生信息 和他出生对应的年份信息
select t.*, year(t.birth) year from tb_student as t;

select t.*,
    (select year(s.birth) from tb_student s where s.sno = t.sno)
from tb_student t ;

# 查询所有的学生信息 和 他 跟平均成绩 的差距
select t.*,
    t.score - (select avg(score) from tb_student) as diff
from tb_student t ;

# 查询 男生 平均成绩 和 女生 平均成绩 的差距
select
(select avg(score) from tb_student where gender = 'm')
-
(select avg(score) from tb_student where gender = 'f') as diff;
