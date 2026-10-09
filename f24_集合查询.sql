/**
集合 主要包含 交集、并集、差集、补集 四个操作

MySQL 仅支持 并集查询

    union  : 合并 且 去重
    union all : 合并 但不去重

并集: 将 2 个 查询命令 得到的结果 进行合并 、形成 一个结果

并集 对 查询命令的要求 :
    a) 两个查询命令 查询的 字段个数 必须 保持相同
    b) 两个查询命令 查询的 字段代表 含义 必须保持相同
*/

# 查询 学生中 表 最高成绩
select max(score) from tb_student
union
# 查询 学生表 最低成绩
select min(score) from tb_student ;

select max(score) , min(score) from tb_student ;

-- 查询所有的 男生 对应的名字、生日、分数
select name, birth, score from tb_student where gender = 'm' ;

select sno, name, birth, score from tb_student where gender = 'm'
union all
-- 查询所有的 女生 对应的名字、生日、分数
select name , birth , score from tb_student where gender = 'f';
