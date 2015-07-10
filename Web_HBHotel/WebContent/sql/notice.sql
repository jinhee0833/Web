create table board5( 
num number(38) primary key,
writer varchar2(20) not null,
title varchar2(100) not null,
content varchar2(4000) not null,
filename varchar2(100) not null,
nalja date not null);