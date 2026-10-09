/**
基于条件的子查询
  a) 基于 关系条件的 子查询  >, >=, <, <=, =, !=
  b) 基于 in 的条件 子查询
  c) 基于 exists 的条件 子查询
*/
-- 1.
# 查询 成绩 大于 平均成绩的 所有学生信息

# 查询 同性别 下 成绩 大于 该性别 对应的平均成绩 的所有学生信息
select * from tb_student x
where score > (
    select avg(score) from tb_student t where t.gender = x.gender
);

# 查询 成绩 等于 平均成绩的 学生信息
select t.* from tb_student t
	where  t.score = (select avg(score) from tb_student);


-- 2.
# 基于 in 的条件子查询
#     子查询 返回 单列 多值

# 查询 姓名相同 所有学生信息
select * from tb_student where name in
(select name from tb_student group by name having count(1) > 1 );

# 查询 所有名字 不重复的 所有学生信息
select * from tb_student where name not in
(select name from tb_student group by name having count(1) > 1 );




-- 3.
/**
基于 exists（存在）的条件 子查询
*/

# 查询姓名相同的所有学生信息
select * from tb_student where name in (
  select name from tb_student group by name having count(1) > 1
);

select t.* from tb_student t where exists(
  select name from tb_student x where x.name = t.name
  group by name having count(1) > 1
);

-- 查询 男生中 最高成绩 和 最低成绩 对应的 学生信息
select t.* from tb_student t where gender = 'm' and exists (
    select 1 from (
        select max(x.score) max, min(x.score) min from tb_student x
        where x.gender = t.gender
    ) y where t.score in (y.max, y.min)
);


-- 查询 姓名相同、且 性别相同的 学生信息
select t.* from tb_student t where exists(
    select g.name, g.gender from tb_student g
    where t.name = g.name and t.gender = g.gender
    group by g.name, g.gender having count(1) > 1
);

select t.* from tb_student t where exists(
    select 1 from
    (
        select g.name, g.gender from tb_student g
        group by g.name, g.gender having count(1) > 1
    ) y where y.name = t.name and y.gender = t.gender
);





















