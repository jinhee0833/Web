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

drop  sequence  boardre_seq;
create  sequence  boardre_seq
start with 1
increment by 1;

drop  table  boardre ;
create  table  boardre(
   num    number(4) not null    ,
   renum        number(4) primary key,
   rewriter     varchar2(10) not null,
   repasswd     varchar2(16) not null,
   rereg_date   date          ,
   reexcel   number(3)             ,
   rebad     number(3)             ,
   reprison  number(3)             ,
   recontent     varchar2(100)  ,
   reip          varchar2(20)  , 
   reref         number(3)   ,
   rere_step     number(3)    ,
   rere_level    number(3)  
);

commit ;