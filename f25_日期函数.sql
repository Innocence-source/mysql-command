select s.*, date_format(s.birth, '%Y/%m/%d') from tb_student s;

select date_add(now(), interval 7 year);

select now(), date_sub(now(), interval 1 month);

select * from tb_student where date_add(birth, interval 18 year) > current_date();