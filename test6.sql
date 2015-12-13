1.
create view test6_01 as
	select sid, name, dname
	from pub.student
	where age<20 and dname='物理学院'
	order by sid
	
2.
create view test6_02 as
	select sid, name, sum(score) sum_score
	from pub.student natural join pub.student_course
	where dname='软件学院' and class='2009'
	group by sid,name
	
3.
create view test6_03 as
	select sid, name, score
	from pub.student natural join pub.student_course 
	where dname='计算机科学与技术学院' and class='2010' and cid=(
		select cid from pub.course where name='操作系统'
	)

4.
create view test6_04 as
	select sid, name
	from pub.student natural join pub.student_course 
	where score>90 and cid=(
		select cid from pub.course where name='数据库系统'
	)
	
5.
create view test6_05 as
	select pub.student.sid, pub.course.cid, pub.course.name, pub.student_course.score
	from pub.student, pub.student_course ,pub.course 
	where pub.course.cid=pub.student_course.cid  and  pub.student_course.sid=pub.student.sid and pub.student.name='李龙' 
	
6.
create view test6_06 as
	select sid,name 
	from pub.student 
	where sid in(
		select sid 
		from pub.student_course 
		group by sid 
		having count(*) >=(
			select count(*) 
			from pub.course 
		)
	)
	
7.
create view test6_07 as
	select sid,name 
	from pub.student 
	where sid in(
		select sid 
		from pub.student_course 
		where score>=60
		group by sid 
		having count(*) >=(
			select count(*) 
			from pub.course 
		)
	)
	
8.
create view test6_08 as
	select cid,name
	from pub.course
	where fcid in(
		select cid
		from pub.course
		where credit=2
	)
	
9.
create view test6_09 as
	select sid,name, sum(credit) sum_credit
	from pub.student natural join pub.student_course natural join(
		select cid,credit
		from pub.course
	)
	where class='2010' and dname='化学与化工学院' and score>=60
	group by sid,name
	
10.
create view test6_10 as
	select cid,name
	from pub.course
	where fcid is not null and fcid in(
		select cid
		from pub.course
		where fcid is not null
	)
	
	
update dbtest set test=6
select * from dbscore where instr(实验号_题号,'6 -')<>0