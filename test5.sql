6.
create table test5_00 as
	select * 
	from pub.teacher
	
grant all on test5_00 to USERID
......

8.
create table test5_10 (test varchar(20), age numeric(3))
insert into test5_10 values('结果1',88)
insert into test5_10 values('结果2',90)
insert into test5_10 values('结果3',90)
insert into test5_10 values('结果4',86)
insert into test5_10 values('结果5',90)
insert into test5_10 values('结果6',90)
insert into test5_10 values('结果7',86)
insert into test5_10 values('结果8',86)
insert into test5_10 values('结果9',76)
insert into test5_10 values('结果10',86)









update dbtest set test=5
select * from dbscore where instr(实验号_题号,'5 -')<>0