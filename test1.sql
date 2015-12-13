create table test1_student 
	( sid char(12) not null,
	name varchar(10) not null,
	sex char(2),
	age int,
	birthday date,
	dname varchar(30),
	class varchar(10)
	)
create table test1_teacher 
	( tid char(6) not null,
	name varchar(10) not null,
	sex char(2),
	age int,
	dname varchar(30)
	)
create table test1_student_course
	( sid char(12) not null,
	cid char (6) not null,
	score numeric(5,1),
	tid char(6)
	)
create table test1_teacher_course
	( tid char(6) not null,
	cid char(6) not null
	)

insert into test1_student values(200800020101,'王欣','女',19,date'1994-2-2','计算机学院',2010)
insert into test1_student values(200800020102,'李华','女',20,date'1995-3-3','软件学院',2009)
insert into test1_student values(200800020103,'赵岩','男',21,date'1996-4-4','软件学院',2009)

insert into test1_teacher values(100101,'张老师','男',44,'计算机学院')
insert into test1_teacher values(100102,'李老师','女',45,'软件学院')
insert into test1_teacher values(100103,'马老师','男',46,'计算机学院')


insert into test1_course values(300001,'数据结构',null,2)
insert into test1_course values(300002,'数据库',300001,2.5)
insert into test1_course values(300003,'操作系统',300001,4)

insert into test1_student_course values(200800020101,300001,91.5,100101)
insert into test1_student_course values(200800020101,300002,92.6,100102)
insert into test1_student_course values(200800020101,300003,93.7,100103)

insert into test1_teacher_course values(100101,300001)
insert into test1_teacher_course values(100102,300002)
insert into test1_teacher_course values(100103,300003)


update dbtest set test=1

select * from dbscore