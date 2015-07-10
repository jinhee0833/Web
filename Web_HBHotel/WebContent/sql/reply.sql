
create  table  reply(
   num        number references guest(num),
   r_name       varchar2(10)  ,
   reg_date   date  not null ,
   r_content   varchar2(30) not null  ,
   ref         number(3)   not null , 
   re_step     number(3)   not null ,
   re_level    number(3)   not null 
);

alter table reply drop column ref;
alter table reply drop column re_step;
alter table reply drop column re_level;


commit ;
set pagesize 900
set linesize 900
select  * from reply ;
select  num, writer, ref  from board2 ;
commit ;
