/**
聚合函数： 可以将 多条数据 合并成 一条数据 (空值不参与统计)

count :  统计个数

sum :  统计求和

avg :  统计 求 平均值

max :  求最大值

min :  求最小值

count 统计的本质：统计不为 NULL 的值
写法					统计规则									是否忽略字段 NULL
count(*)			统计所有行								不忽略
count(1)			统计所有行								不忽略
count(sno)		统计 sno 不为 null 的行		忽略 sno 为 NULL 的行
*/

# 查询学生表中 共有多少学生
select count(1) from tb_student ;
select count(*) from tb_student ;
select count(sno) from tb_student ;
select count(tel) from tb_student ;

# 查询所有学生的成绩总和
select sum(score) from tb_student;

select sum(score), avg(score) from tb_student;

# 查询所有学生的最高成绩和最低成绩
select max(score), min(score) from tb_student;




/**
分组查询 group by : 可以指定要分组的字段、多个字段使用 逗号分割

SQL 命令一旦 出现分组查询 、那么 查询的列 有 严格的要求
    查询 的 列 要么出现在 group by 的后面、要么出现在 聚合函数中
*/

# 1. 查询 学生表 中 不同性别 对应的 学生人数
select count(1), gender from tb_student group by gender ;

# 2. 查询 学生表中 性别相同、且 名字也相同的 学生 对应的 性别、名字 和 人数
select name, gender, count(1) from tb_student group by name, gender ;

# 3. 统计学生表中 名字相同、且出生 年份 year 相同的 个数
select name, year(birth) , count(1) from tb_student group by name, year(birth);

select name, year(birth) as bear , count(1) from tb_student group by name, bear;


-- truncate table tb_student;

