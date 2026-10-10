# MySQL 命令学习笔记

一套从零开始的 MySQL 语法练习笔记，按「数据库 → 表 → 增删改查 → 高级查询 → 表关系设计」的顺序整理，全部代码均以 `.sql` 文件存放，可直接导入 MySQL 8 客户端执行。

- **数据库**：MySQL 8（用到 `with` 临时表、`caching_sha2_password` 等 8.x 特性）
- **练习库**：`py2607b`
- **组织方式**：`f` 开头为语法知识点（按学习顺序编号），`s` 开头为综合练习，`w` 开头为随手练习

---

## 目录

| 阶段 | 文件 | 内容 |
| --- | --- | --- |
| 库与表 | [f1_db操作.sql](f1_db操作.sql) | 数据库的查看 / 创建 / 删除 / 切换 |
| | [f2_tb的基本操作.sql](f2_tb的基本操作.sql) | 建表、查看表、查看表结构、删表 |
| | [f3_修改表结构.sql](f3_修改表结构.sql) | `alter table` 增删改字段、改表名 |
| 数据操作 | [f5_更新命令insert into.sql](f5_更新命令insert%20into.sql) | `update` 与 `where` 的各类条件 |
| | [f6_删除数据命令.sql](f6_删除数据命令.sql) | `delete` / `truncate` / `drop` 的区别 |
| | [f7_简单查询.sql](f7_简单查询.sql) | `select` 常量、函数、多列查询 |
| 基础查询 | [f8_from查询.sql](f8_from查询.sql) | 基于表的查询、别名、`select *` 的取舍 |
| | [f9_where条件查询.sql](f9_where条件查询.sql) | 关系 / 逻辑 / 区间 / 枚举 / 模糊 / 空值条件 |
| | [f10_聚合函数和分组查询.sql](f10_聚合函数和分组查询.sql) | `count/sum/avg/max/min`、`group by` |
| | [f11_分组后查询.sql](f11_分组后查询.sql) | `having` 与 `where` 的区别 |
| | [f12_排序查询.sql](f12_排序查询.sql) | `order by` 升降序、多字段排序 |
| | [f13_分页查询.sql](f13_分页查询.sql) | `limit ... offset` 两种写法 |
| | [f14_SQL查询命令完整结构.sql](f14_SQL查询命令完整结构.sql) | 书写顺序与底层执行顺序 |
| 子查询 | [f15_子查询.sql](f15_子查询.sql) | 基于列的子查询 |
| | [f16_基于表的子查询.sql](f16_基于表的子查询.sql) | 结果集当表用、`with` 临时表 |
| | [f17_基于条件的子查询.sql](f17_基于条件的子查询.sql) | 关系 / `in` / `exists` 条件子查询 |
| 表设计 | [f18_数据库约束类型.sql](f18_数据库约束类型.sql) | 主键 / 唯一 / 非空 / 默认 / 外键 / 自增 |
| | [f19_范式数据库设计表原则.sql](f19_范式数据库设计表原则.sql) | 三范式与反范式 |
| | [f20_一对一.sql](f20_一对一.sql) | 一对一建表与外键 |
| | [f21_表一对多.sql](f21_表一对多.sql) | 一对多建表与外键 |
| | [f22_表多对多.sql](f22_表多对多.sql) | 中间表、联合主键 |
| | [f23_关联查询.sql](f23_关联查询.sql) | 内连接、左 / 右外连接 |
| | [f24_集合查询.sql](f24_集合查询.sql) | `union` / `union all` |
| 常用函数 | [f25_日期函数.sql](f25_日期函数.sql) | `date_format`、`date_add`、`date_sub` |
| | [f26_判断函数.sql](f26_判断函数.sql) | `if` / `case when` 行列转换 |
| | [f27_视图.sql](f27_视图.sql) | 视图的创建、查询、删除 |
| | [f28_内置uesr表常见的字段.sql](f28_内置uesr表常见的字段.sql) | `mysql.user` 表字段、改密码 |
| 练习脚本 | [s1.sql](s1.sql) | `tb_score` 成绩表：建表 + 测试数据 + 12 道增删改查题 |
| | [s2.sql](s2.sql) | `tb_student_task` 任务表：7 道分组统计题 |
| | [w1练习.sql](w1练习.sql) | 建库建表、聚合、行列转换随手练 |

---

## 快速开始

```sql
-- 1. 建库并切换
create database if not exists py2607b;
use py2607b;

-- 2. 建一张学生表
create table tb_student(
    sno varchar(20) comment '学号',
    name varchar(4) comment '名字',
    birth date comment '出生日期',
    tel varchar(11) comment '手机号码',
    gender enum('m','f','s') comment '性别',
    create_time datetime comment '入学时间'
);

-- 3. 查询
select * from tb_student where gender = 'm' order by birth desc limit 10;
```

按文件编号顺序阅读即可；每个文件顶部都有该知识点的说明注释。

---

## 核心知识点

### 1. 查询命令的完整结构

```sql
select 列... from 表 where 条件 group by 分组 having 筛选 order by 排序 limit 分页
```

**书写顺序**与**执行顺序**不同，底层执行顺序为：

```
from -> where -> group by -> having -> select -> order by -> limit
```

### 2. `where` 与 `having`

| | `where` | `having` |
| --- | --- | --- |
| 作用对象 | 表中的原始数据 | 分组后的结果 |
| 能否用聚合函数 | 不能 | 能 |
| 位置 | `group by` 之前 | `group by` 之后，不能单独使用 |
| 性能 | 更高 | 较低 |

### 3. `count` 的统计规则

| 写法 | 统计规则 | 是否忽略 NULL |
| --- | --- | --- |
| `count(*)` | 所有行 | 不忽略 |
| `count(1)` | 所有行 | 不忽略 |
| `count(字段)` | 该字段非 NULL 的行 | 忽略 |

聚合函数整体上都会忽略 NULL 值。

### 4. `delete` / `truncate` / `drop`

| | `delete` | `truncate` | `drop` |
| --- | --- | --- | --- |
| 类型 | DML | DDL | DDL |
| 删除范围 | 可带 `where` 删部分 | 只能清空全部 | 表结构 + 数据 |
| 表结构 | 保留 | 保留 | 删除 |
| 事务 | 支持 | 不支持 | 不支持 |
| 自增计数器 | 不重置 | 重置 | — |
| 速度 | 逐行删除，慢 | 销毁重建，快 | 快 |

### 5. 表与表的关系

| 关系 | 关系维护者 | 示例 |
| --- | --- | --- |
| 一对一 | 子表放外键（或共享主键） | 用户 ↔ 用户基本信息 |
| 一对多 | **多**方是子表，存放外键 | 用户 → 收货地址 |
| 多对多 | **中间表**，两个业务表都是父表 | 用户 ↔ 角色 |

**记忆口诀：增：先父后子；删：先子后父。**

### 6. 三种关联查询

```sql
select * from tb_user u left  join tb_address d on u.id = d.user_id;  -- 左外连接
select * from tb_user u right join tb_address d on u.id = d.user_id;  -- 右外连接
select * from tb_user u inner join tb_address d on u.id = d.user_id;  -- 内连接
```

`outer` / `inner` 关键字均可省略。

### 7. 子查询分类

- **基于列**：子查询出现在 `select` 的列中，逐行求值
- **基于表**：子查询结果本身是一张表，外层继续查询；MySQL 8 可用 `with` 定义临时表改写
- **基于条件**：出现在 `where` 中，分为关系条件（`> = <`）、`in`、`exists` 三类

### 8. 约束类型

`primary key`（唯一且非空，一张表最多一个）、`unique`（唯一可为空）、`not null`、`default`、`check`（MySQL 仅保留关键字，不生效）、`foreign key`、`auto_increment`。

---

## 备注

- 部分文件是课堂随手记录，存在少量笔误（如 `f11` 的 `user py2607b`、`s1.sql` 中建表与插入的列数不一致、`f16` 末尾语句不完整），属于学习过程痕迹，未做修改。
- 需要先执行 `f2` / `s1` 等文件建表并插入测试数据，后续查询语句才有数据可查。
