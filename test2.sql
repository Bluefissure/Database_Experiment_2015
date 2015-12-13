create table test2_01 as 
	select sid,name from pub.student where sid not in ( select sid from pub.STUDENT_COURSE )

create table test2_02 as 
	select sid,name from pub.student where sid in ( select sid from pub.STUDENT_COURSE where 
cid=300020 or cid=300021 )

create table test2_03 as 
	select sid,name 
	from pub.student 
	where sid in 
		( select sid 
		from pub.STUDENT_COURSE 
		where cid in (select cid 
				from pub.course
				where fcid=300002
				)
		)

create table test2_04 as 
	select sid,name 
	from pub.student 
	where sid in 
		( select sid 
		from pub.STUDENT_COURSE 
		where cid=300002 and sid in(
				select sid 
				from pub.STUDENT_COURSE 
				where cid=300005
			)
		)

create table test2_05 as
	select sid, name, round(avg(score),0) avg_score, sum(score) sum_score
	from pub.student_course natural join pub.student
	where age=20
	group by sid,name
	
create table test2_06 as
	select cid, max(score) max_score
	from pub.student_course 
	group by cid
	
create table test2_07 as
	select sid,name
	from pub.student
	where SUBSTR(name,1,1)<>'张' and SUBSTR(name,1,1)<>'王' and SUBSTR(name,1,1)<>'李'
	
create table test2_08 as
	select SUBSTR(name,1,1) second_name,count(*) p_count
	from pub.student
	group by SUBSTR(name,1,1)
	
create table test2_09 as
	select sid, name, score
	from pub.student natual natural join pub.student_course
	where cid=300003
	
create table test2_10 as
	select sid, name
	from pub.student
	where sid in (
		select sid
		from (
			select sid,count(*) c_cnt
			from pub.student_course
			where score<60
			group by sid,cid
		)
		where c_cnt>=2
	)
	
	
update dbtest set test=2
select * from dbscore