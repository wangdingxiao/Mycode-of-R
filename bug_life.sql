create table mozilla_bug_status SELECT Bug_ID,FROM_UNIXTIME(`When`,'%Y-%m-%d') as time ,Removed,Added FROM `2011_mozilla_activity_level2` where what='Status';
create table bug_status_life SELECT Bug_ID, MIN(time) as start ,MAX(time) as end from mozilla_bug_status where Removed in ('NEW','REOPENED') or Added in ('VERIFIED','CLOSED') GROUP BY Bug_ID;
create table bug_last select Bug_ID ,DATEDIFF(`end`,`start`) as day from bug_status_life ORDER BY day desc;
CREATE TABLE `dayrange` (
`range`  varchar(20) NULL ,
`num`  int NULL 
)
;
insert into dayrange(`range`,num) select '1',COUNT(day) from bug_last where day<=1 ;
insert into dayrange(`range`,num) select '1-10',COUNT(day) from bug_last where day>1 and day<=10 ;
insert into dayrange(`range`,num) select '10-100',COUNT(day) from bug_last where day>10 and day<=100 ;
insert into dayrange(`range`,num) select '100-1000',COUNT(day) from bug_last where day>100 and day<=1000 ;
insert into dayrange(`range`,num) select '1001',COUNT(day) from bug_last where day>1000;
