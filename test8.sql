create table student_course_unique as
	select * from pub.student_course minus(
		select T.sid,T.cid,T.score,T.tid
		from pub.student_course T,pub.student_course  S
		where T.sid=S.sid
			and T.cid=S.cid
			and T.score<S.score
	)
	
1.
create table test8_01(
	Dname varchar(30),
	Avg_ds_score int,
	Avg_os_score int
	)
	
insert into test8_01
	select dname,round(avg(score),0),0
	from pub.student,pub.course,student_course_unique 
	where pub.student.sid=student_course_unique.sid 
		and student_course_unique.cid= pub.course.cid 
		and dname is not null 
		and pub.course.name='数据结构' 
	group by dname
	
update test8_01 
	set Avg_os_score=(
		select round(avg(score),0) 
		from pub.student,pub.course,student_course_unique 
		where pub.student.sid=student_course_unique.sid 
			and student_course_unique.cid= pub.course.cid 
			and dname is not null 
			and test8_01.dname=pub.student.dname 
			and pub.course.name='操作系统' 
		group by dname
	)
	
2.
create table test8_02(
	sid char(12),
	name varchar(10),
	Dname varchar(30),
	ds_score int,
	os_score int
	)
create table student_ds_os as
	select distinct S.sid
	from pub.student_course T,pub.student_course  S
	where T.sid=S.sid
		and T.cid=( select cid from pub.course where name='数据结构' )
		and S.cid=( select cid from pub.course where name='操作系统' )
	
	
insert into test8_02 
	select S.sid,S.name,S.Dname,SC.score,0
	from pub.student S,pub.course C,student_course_unique SC
	where S.sid=SC.sid
		and SC.cid= C.cid 
		and S.dname ='计算机科学与技术学院'
		and C.name='数据结构'
		and S.sid in ( select * from student_ds_os )


update test8_02
	set os_score=(
		select SC.score
		from pub.student S,pub.course C,student_course_unique SC
		where S.sid=SC.sid
			and SC.cid= C.cid 
			and dname ='计算机科学与技术学院'
			and C.name='操作系统'
			and test8_02.sid=S.sid
	)

3.
create table test8_03(
	sid char(12),
	name varchar(10),
	Dname varchar(30),
	ds_score int,
	os_score int
	)
	
create table student_ds_os_or as
	select distinct T.sid
	from pub.student_course T
	where 	T.cid=( select cid from pub.course where name='数据结构' )
			or T.cid=( select cid from pub.course where name='操作系统' )
	
		
insert into test8_03
	select S.sid,S.name,S.Dname,0,0
	from pub.student S
	where S.sid in ( select * from student_ds_os_or )
		and S.Dname='计算机科学与技术学院'

update test8_03
	set ds_score=(
		select SC.score
		from pub.student S,pub.course C,student_course_unique SC
		where S.sid=SC.sid
			and SC.cid= C.cid 
			and dname ='计算机科学与技术学院'
			and C.name='数据结构'
			and test8_03.sid=S.sid
	)
		
update test8_03
	set os_score=(
		select SC.score
		from pub.student S,pub.course C,student_course_unique SC
		where S.sid=SC.sid
			and SC.cid= C.cid 
			and dname ='计算机科学与技术学院'
			and C.name='操作系统'
			and test8_03.sid=S.sid
	)

3.
create table test8_04(
	sid char(12),
	name varchar(10),
	Dname varchar(30),
	ds_score int,
	os_score int
	)
	
insert into test8_04
	select S.sid,S.name,S.Dname,0,0
	from pub.student S
	where S.Dname='计算机科学与技术学院'

update test8_04
	set ds_score=(
		select SC.score
		from pub.student S,pub.course C,student_course_unique SC
		where S.sid=SC.sid
			and SC.cid= C.cid 
			and dname ='计算机科学与技术学院'
			and C.name='数据结构'
			and test8_04.sid=S.sid
	)
		
update test8_04
	set os_score=(
		select SC.score
		from pub.student S,pub.course C,student_course_unique SC
		where S.sid=SC.sid
			and SC.cid= C.cid 
			and dname ='计算机科学与技术学院'
			and C.name='操作系统'
			and test8_04.sid=S.sid
	)
	


update dbtest set test=8

select * from dbscore where instr(实验号_题号,'8 ')<>0