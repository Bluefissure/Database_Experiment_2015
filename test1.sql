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

insert into test1_student values(200800020101,'����','Ů',19,date'1994-2-2','�����ѧԺ',2010)
insert into test1_student values(200800020102,'�','Ů',20,date'1995-3-3','���ѧԺ',2009)
insert into test1_student values(200800020103,'����','��',21,date'1996-4-4','���ѧԺ',2009)

insert into test1_teacher values(100101,'����ʦ','��',44,'�����ѧԺ')
insert into test1_teacher values(100102,'����ʦ','Ů',45,'���ѧԺ')
insert into test1_teacher values(100103,'����ʦ','��',46,'�����ѧԺ')


insert into test1_course values(300001,'���ݽṹ',null,2)
insert into test1_course values(300002,'���ݿ�',300001,2.5)
insert into test1_course values(300003,'����ϵͳ',300001,4)

insert into test1_student_course values(200800020101,300001,91.5,100101)
insert into test1_student_course values(200800020101,300002,92.6,100102)
insert into test1_student_course values(200800020101,300003,93.7,100103)

insert into test1_teacher_course values(100101,300001)
insert into test1_teacher_course values(100102,300002)
insert into test1_teacher_course values(100103,300003)


update dbtest set test=1

select * from dbscore