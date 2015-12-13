create table test3_01 as
	select *
	from pub.student_31

delete from test3_01
where LENGTH(sid) <> LENGTH(REGEXP_REPLACE(sid, '[^0-9]'))
	
create table test3_02 as
	select *
	from pub.student_31
	
delete 
	from test3_02
	where 2012 - extract(year from birthday) <> age

create table test3_03 as
	select *
	from pub.student_31

delete 
	from test3_03
	where sid not in(
		select sid
		from test3_03
		where sex='男' or sex='女' or sex is NULL
	)
	
create table test3_04 as
	select *
	from pub.student_31
	
delete 
	from test3_04
	where length(dname)<>length(replace(dname,' ')) or dname is null or length(dname)<3
	
create table test3_05 as
	select *
	from pub.student_31

delete 
	from test3_05
	where length(class)<>4
	
create table test3_06 as
	select *
	from pub.student_31
	
delete 
	from test3_06
	where LENGTH(sid) <> LENGTH(REGEXP_REPLACE(sid, '[^0-9]'))
	or 2012 - extract(year from birthday) <> age
	or length(name)<>length(replace(name,' ')) or length(name)<2
	or (
		sid not in(
		select sid
		from test3_03
		where sex='男' or sex='女' or sex is NULL
		)
	)
	or length(dname)<>length(replace(dname,' ')) or dname is null
	or length(dname)<3
	or length(class)<>4
	
create table test3_07 as
	select *
	from pub.student_course_32
	
delete from test3_07
	where sid not in (
		select sid
		from pub.student
	)
	
create table test3_08 as
	select *
	from pub.student_course_32

delete from test3_08 
	where (cid,tid) not in(
		select cid,tid
		from test3_08 natural join pub.teacher_course 
	)
	
create table test3_09 as
	select *
	from pub.student_course_32
	
delete from test3_09
	where score<0 or score>100
	
create table test3_10 as
	select *
	from pub.student_course_32
	
delete from test3_10
	where sid not in ( select sid from pub.student )
	or cid not in ( select cid from pub.course )
	or tid not in ( select tid from pub.teacher )
	or (cid,tid) not in(
		select cid,tid
		from test3_08 natural join pub.teacher_course 
	)
	or score<0 or score>100
	
	
update dbtest set test=3
select * from dbscore