1.
create table test4_01 as
	select * 
	from pub.student_41
	
alter table test4_01
add sum_score int

update test4_01 
set sum_score=(
	select sum(score)
	from pub.student_course
	where pub.student_course.sid=test4_01.sid
	group by pub.student_course.sid
	)
	
2.
create table test4_02 as
	select * 
	from pub.student_41
	
alter table test4_02
add avg_score numeric(4,1)

update test4_02 
set avg_score=(
	select avg(score)
	from pub.student_course
	where pub.student_course.sid=test4_02.sid
	group by pub.student_course.sid
	)
	
3.
create table test4_03 as
	select * 
	from pub.student_41
	
alter table test4_03
add sum_credit int

update test4_03
set sum_credit=(
	select sum(credit)
	from pub.student_course natural join pub.course
	where pub.student_course.sid=test4_03.sid and score>=60
	group by pub.student_course.sid
	)

4.
create table test4_04 as
	select * 
	from pub.student_41
	
update test4_04
set dname=(
	select did
	from pub.department
	where test4_04.dname=pub.department.dname
)where dname in (
	select dname
	from pub.department
)

5.
create table test4_05 as
	select * 
	from pub.student_41
	
alter table test4_05
add sum_score int
add avg_score numeric(4,1)
add sum_credit int
add did varchar(2)

update test4_05 
set sum_score=(
	select sum(score)
	from pub.student_course
	where pub.student_course.sid=test4_05.sid
	group by pub.student_course.sid
	)

update test4_05
set avg_score=(
	select avg(score)
	from pub.student_course
	where pub.student_course.sid=test4_05.sid
	group by pub.student_course.sid
	)
	
update test4_05
set sum_credit=(
	select sum(credit)
	from pub.student_course natural join pub.course
	where pub.student_course.sid=test4_05.sid and score>=60
	group by pub.student_course.sid
	)
	
	

update test4_05
set did=(
	select did
	from (
		select * from pub.department 
		union 
		select * from pub.department_41
	)
	where test4_05.dname=dname
	)
	
update test4_05
set did='00'
where did is null

6.
create table test4_06 as
	select * 
	from pub.student_42
	
update test4_06
set name=replace(name,' ','')
	
7.
create table test4_07 as
	select * 
	from pub.student_42
	
update test4_07
set sex=replace(replace(sex,' ',''),'性','')

8.
create table test4_08 as
	select * 
	from pub.student_42
	
update test4_08
set class=replace(class,'级','')

9.
create table test4_09 as
	select * 
	from pub.student_42
	
update test4_09
set age=2012-to_char(birthday,'yyyy')
where age is null

10.
create table test4_10 as
	select * 
	from pub.student_42
	
update test4_10
set name=replace(name,' ','')

update test4_10
set dname=replace(dname,' ','')

update test4_10
set sex=replace(replace(sex,' ',''),'性','')

update test4_10
set class=replace(class,'级','')

update test4_10
set age=2012-to_char(birthday,'yyyy')
where age is null

	

	
update dbtest set test=4
select * from dbscore where instr(实验号_题号,'4 -')<>0