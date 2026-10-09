-- 【MySQL单表查询】tb_student_task 学生任务表
-- 表字段：id , user_id, task_id, code, status, ai_result, create_time, start_time, update_time, check_time
-- status：0未开始、1进行中、2不会做、3已提交、4已检查、5已完成

-- 1. 查询每个用户 未开始任务数量、进行中任务数量、不会做任务数量、已提交任务数量、已检查任务数量、已完成任务数量
SELECT
    user_id,
    COUNT(CASE WHEN status = 0 THEN 1 END) AS cnt_not_start,
    COUNT(CASE WHEN status = 1 THEN 1 END) AS cnt_doing,
    COUNT(CASE WHEN status = 2 THEN 1 END) AS cnt_cannot_do,
    COUNT(CASE WHEN status = 3 THEN 1 END) AS cnt_submit,
    COUNT(CASE WHEN status = 4 THEN 1 END) AS cnt_checked,
    COUNT(CASE WHEN status = 5 THEN 1 END) AS cnt_finish
FROM tb_student_task
GROUP BY user_id;

-- 2. 查询每一个任务下有多少个已提交（状态为 3， 4， 5）的学生
SELECT
    task_id,
    COUNT(DISTINCT user_id) AS student_count
FROM tb_student_task
WHERE status IN (3,4,5)
GROUP BY task_id;

-- 3. 查询任务ID, 任务状态相同的任务 ID 和 任务状态有哪些
SELECT task_id, status
FROM tb_student_task
GROUP BY task_id, status
HAVING COUNT(*) > 1;

-- 4. 查询今日提交的任务信息
SELECT *
FROM tb_student_task
WHERE DATE_FORMAT(update_time, '%Y-%m-%d') = DATE_FORMAT(NOW(), '%Y-%m-%d');

-- 5. 查询昨日检查的任务，按检查时间升序排列
SELECT *
FROM tb_student_task
WHERE DATE_FORMAT(check_time, '%Y-%m-%d') = DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 1 DAY),'%Y-%m-%d')
ORDER BY check_time ASC;

-- 6. 查询每天检查的任务数量
SELECT
    DATE_FORMAT(check_time,'%Y-%m-%d') AS check_date,
    COUNT(*) AS task_count
FROM tb_student_task
WHERE check_time IS NOT NULL
GROUP BY check_date;

-- 7. 查询每天检查任务数量大于30道题的日期，每页5条，查询第二页
SELECT
    DATE_FORMAT(check_time,'%Y-%m-%d') AS check_date,
    COUNT(*) AS task_count
FROM tb_student_task
WHERE check_time IS NOT NULL
GROUP BY check_date
HAVING COUNT(*) > 30
LIMIT 5,5;
