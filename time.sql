create table time_MOZILLA SELECT FROM_UNIXTIME(`When`,'%Y-%m-%d') as time from 2011_mozilla_activity_level2 ;
create table time_num select time ,COUNT(time) as num from time_MOZILLA GROUP BY time;
create table bug_status_life SELECT Bug_ID,MIN(time) as start ,MAX(time) as end FROM `mozilla_bug_status` where Added in ('VERIFIED','CLOSED') or Removed in('NEW','REOPENED' )GROUP BY Bug_ID ;
SELECT Bug_ID, end-start as day FROM `bug_status_life`;
