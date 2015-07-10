drop table member;


create table member (
userid varchar2(10) primary key, 
pwd number(8) not null,
username varchar2(20) not null, 
sex varchar2(6) not null, 
birth number(6) not null,
call number(15) not null, 
email varchar2(30) not null
);


insert into member values('userid',12345678,'username','male',850615,01012345678,'naver@naver.com');


SQL> select * from member;

USERID                      PWD USERNAME                                        
-------------------- ---------- ----------------------------------------        
SEX               BIRTH       CALL                                              
------------ ---------- ----------                                              
EMAIL                                                                           
------------------------------------------------------------                    
userid                 12345678 username                                        
male             850615 1012345678                                              
naver@naver.com                                                                 
                                                                                

SQL> spool off;
