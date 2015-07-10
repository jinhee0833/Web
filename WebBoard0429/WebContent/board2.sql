



select  *  from  user_sequences ; 
drop  sequence  board2_seq;
create  sequence  board2_seq; 

drop  table  board2 ;
create  table  board2(
   num        number(4) primary key,
   writer     varchar2(10) not null  ,
   email      varchar2(20) not null  ,
   subject    varchar2(20) not null  ,
   passwd     varchar2(16) not null  ,
   reg_date   date  not null ,
   readcount   number(3)   ,
   content     varchar2(30) not null  ,
   ip          varchar2(20) not null , 
   ref         number(3)   not null ,
   re_step     number(3)   not null ,
   re_level    number(3)   not null ,
   filename     varchar2(30) not null  
);

commit ;
set pagesize 1200
set linesize 1200
select  * from board2 ;
select  num, writer, ref  from board2 ;
commit ;
