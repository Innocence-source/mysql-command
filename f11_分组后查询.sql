/**
分组后的筛选  having

面试题：

where ： 是对表中的数据 进行过滤和筛选 、性能更高、条件中不支持使用 聚合函数

having ： 是对分组后的结果进行过滤和筛选、性能较低、条件中 支持 聚合函数的使用

having 必须出现在 group by 的后面 、不能单独使用。
*/

user py2607b;

# 筛选班级中所有 同名 同性别 的 名字 和 性别
select name, gender, count(1) from tb_student

# 1. 查询 学生表 中 不同性别 对应的 学生人数
select count(1), gender from tb_student group by gender ;

# 2. 查询 学生表中 性别相同、且 名字也相同的 学生 对应的 性别、名字 和 人数
select name, gender, count(1) from tb_student group by name, gender ;

# 3. 统计学生表中 名字相同、且出生 年份 year 相同的 对应个数
select name, year(birth) , count(1) from tb_student group by name, year(birth);

select name, year(birth) as bear , count(1) from tb_student group by name, bear;
