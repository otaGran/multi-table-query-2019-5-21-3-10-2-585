# 1.查询同时存在1课程和2课程的情况


# 2.查询同时存在1课程和2课程的情况

# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩

mysql> select s.id,s.name,avg(sc.score) from student s,student_course sc where s.id=sc.studentId group by s.id having avg(sc.score)>=60;

# 4.查询在student_course表中不存在成绩的学生信息的SQL语句

select * from student where id not in (select studentID from student_course);

# 5.查询所有有成绩的SQL

select * from student where id in (select studentID from student_course)

# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息

select s.* from student s,student_course sc1,student_course sc2 where s.id=sc1.studentId and sc1.studentId=sc2.studentId and sc1.courseId=1 and sc2.courseId=2;

# 7.检索1课程分数小于60，按分数降序排列的学生信息

select s.*,sc.score from student s,student_course sc where s.id=sc.studentId&&sc.courseId=1&&sc.score<60 order by score desc;

# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列

select sc.courseId,avg(sc.score) from student_course sc group by sc.courseId order by avg(sc.score) desc,sc.courseId;

# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数

select s.name,sc.score from student s,course c,student_course sc where s.id=sc.studentId&&sc.courseId=c.id&&c.name="数学"&&sc.score<60;
