drop table inforeservation;

create table inforeservation (
code number(38) not null,
userId varchar2(15) not null,
chkin date not null,
chkout date not null,
price number(38)
);

drop table product;
create table product(
code number(38) primary key,
roomPackage number(10) not null,
price number(38)
);

drop table roomid;
create table roomid(
roomno number(10) primary key,
code number(38) not null,
roomPackage number(10) not null
);