/**
where 条件查询
a) 关系条件查询: > , >= , < , <= , = , <> !=
b) 逻辑条件查询: and, or
c) 区间条件查询: between ... and ...
d) 枚举条件查询: in
e) 模糊查询 : like
f) 空值查询 : is null, is not null
*/
# 查询 学号 小于 S25353 的所有学生信息
select * from tb_student where sno < 'S25353' ;
# 查询 学号 小于 S25353 且 姓 赵的 学生信息
# 查询 学号 小于 S25353 或者 姓 赵的 学生信息
select * from tb_student where sno < 'S25353' or name like '赵%';
# 查询学号 在 S25353 ~ S25480 之间所有学生信息
select * from tb_student where sno between 'S25353' and 'S25480' ;
# 查询学号 为 S25412 或者 S25418 的 学生信息
select * from tb_student where sno in ('S25412', 'S24435') ;
# 查询所有名字 只有 2个字的学生信息
select * from tb_student where name like '__' ;
# 查询 所有 手机号 为 空的 学生
select * from tb_student where tel is null ;
# 查询所有 手机号为空，且 身份证也为空的学生
select * from tb_student where tel is null and card is null ;
