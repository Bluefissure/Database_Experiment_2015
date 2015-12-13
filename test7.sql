1.
create table test7_01 as 
	with a as (
		select (substr(name,2)) first_name 
		from pub.student 
	)
	select first_name,(count(*)) frequency 
	from a 
	group by first_name
	
2.
create table test7_02 as 
	with a as (
		select (substr(name,2,1)) letter 
		from pub.student 
		union all 
		select (substr(name,3,1)) letter 
		from pub.student
	)
	select letter,(count(*)) frequency 
	from a 
	where letter is not null 
	group by letter
	
3.
create table test7_03 (dname varchar(30),class varchar(10),p_count1 int,p_count2 int, p_count int) 

insert into test7_03 
	select dname,class,0,0,count(sid) 
	from pub.student 
	where dname is not null 
	group by dname,class  

update test7_03 set p_count1=(
	with a as (
	select pub.student.sid,dname,class,sum(credit)sum_credit 
	from pub.student,pub.course,pub.student_course  
	where  pub.student.sid=pub.student_course.sid 
		and  pub.student_course.cid=pub.course.cid 
		and score>=60 
		and dname is not null 
	group by dname,class,pub.student.sid  
	)
	select count(sid)
	from a
	where sum_credit>=10 and test7_03.dname =a.dname and test7_03.class=a.class 
	group by dname,class
)   

update test7_03 set p_count1=0 where p_count1 is null 

update test7_03 set p_count2=p_count-p_count1

4.
create table test7_04 (dname varchar(30),class varchar(10),p_count1 int,p_count2 int, p_count int) 

insert into test7_04 
	select dname,class,0,0,count(sid) 
	from pub.student 
	where dname is not null 
	group by dname,class  

update test7_04 set p_count1=(
	with a as (
	select pub.student.sid,dname,class,sum(credit)sum_credit 
	from pub.student,pub.course,pub.student_course  
	where  pub.student.sid=pub.student_course.sid 
		and  pub.student_course.cid=pub.course.cid 
		and score>=60 
		and dname is not null 
	group by dname,class,pub.student.sid  
	)
	select count(sid)
	from a
	where ((sum_credit>=8 and a.class<='2008')or(sum_credit>=10 and a.class>'2008'))
		and test7_04.dname =a.dname 
		and test7_04.class=a.class 
	group by dname,class
)   

update test7_04 set p_count1=0 where p_count1 is null 

update test7_04 set p_count2=p_count-p_count1






update dbtest set test=7
select * from dbscore where instr(实验号_题号,'7 ')<>0