/*
1.  创建一张 用户成绩表 tb_score, 包含(id,  user_id 用户ID,   subject(科目) ， score 成绩， create_time 录入时间)等字段
2.  插入 多条测试 数据
3.  将 用户ID 为 10 的 学生 语文成绩 更改 为 85 
4.  将 ID 为 1， 3， 4 的 成绩 在 原成绩的 基础上 降低 10% 
5.  删除  科目 为空的 或成绩为空的 数据 
6.  查询 成绩 及格 且 科目 为 语文 或 数学 的 所有数据 
7.  查询 成绩 在 60 ~ 80 之间的 所有 语文成绩 对应的数据信息
8.  查询 每一个 用户 选修 的 科目数量 
9.  查询 每个科目 的 最高成绩、 最低成绩 、平均成绩 
10. 查询 科目不同 但成绩 相同 的 数据 
11. 查询 所有的语文成绩、并按照成绩从高到低进行展示、每页显示10条数据、查询第一页的信息
12. 查询  语文的最高成绩  和  数学的 最高成绩 相差 多少分， 提示： 可以使用 abs 求 绝对值。
*/
use py2607b;

-- 1.
create table tb_score(
	id varchar(20) comment 'id',
	user_id int comment '用户id',
	subject varchar(20) comment '科目',
	score int comment '分数',
	create_time datetime comment '录入时间'
 
);

-- 2.
insert into tb_score(user_id, subject, score, create_time) values
('1', '语文', '100', now()),
('10', '语文', '69', now()),
('3', '英语', '56', now()),
('4', '数学', '30', now()),
('5', '语文', '90', now()),
('6', '数学', '90', now()),
('7', '语文', '60', now()),
('8', '英语', '78', now());

-- 3.  将 用户ID 为 10 的 学生 语文成绩 更改 为 85 
update tb_score set score = 85 where user_id = 10 and subject = '语文';

-- 4.  将 ID 为 1， 3， 4 的 成绩 在 原成绩的 基础上 降低 10% 
update tb_score set score = score * 0.9 where user_id in (1, 3, 4);

-- 5.  删除  科目 为空的 或成绩为空的 数据 
delete from tb_score where subject is null or score is null;

-- 6.  查询 成绩 及格 且 科目 为 语文 或 数学 的 所有数据 
select s.* from tb_score s where score >= 60 and subject in ('语文', '数学');

-- 7.  查询 成绩 在 60 ~ 80 之间的 所有 语文成绩 对应的数据信息
select s.* from tb_score s where subject = '语文' and score between 60 and 80;

SELECT user_id, COUNT(DISTINCT subject) AS subject_count
FROM tb_score
GROUP BY user_id;

SELECT
    subject,
    MAX(score) AS max_score,
    MIN(score) AS min_score,
    AVG(score) AS avg_score
FROM tb_score
GROUP BY subject;

SELECT DISTINCT s1.*
FROM tb_score s1
JOIN tb_score s2 ON s1.score = s2.score
WHERE s1.subject <> s2.subject;

SELECT * FROM tb_score
WHERE subject = '语文'
ORDER BY score DESC
LIMIT 0,10;

SELECT
    ABS(
        (SELECT MAX(score) FROM tb_score WHERE subject='语文')
        -
        (SELECT MAX(score) FROM tb_score WHERE subject='数学')
    ) AS score_diff;













