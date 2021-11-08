drop table supplementsUser;
drop table bbs;
drop table category;
drop table bbsComment;
create table category
(
    categoryId NUMBER(10) PRIMARY KEY,
    categoryName varchar(40) not null
);
create table bbs
(
    bbsID NUMBER(15) PRIMARY KEY,
    bbsTitle varchar(50) NOT NULL,
    userID varchar(40) NOT NULL,
    bbsDate varchar(40) NOT NULL,
    bbsContent varchar(2048) NOT NULL,
    bbsAvailable NUMBER(3) not null,
    bbsCategory NUMBER(10) NOT NULL,
    bbsView NUMBER(10) NOT NULL
);

create table bbs2
(
    bbsID NUMBER(15) PRIMARY KEY,
    bbsTitle varchar(50) NOT NULL,
    userID varchar(40) NOT NULL,
    bbsDate varchar(40) NOT NULL,
    bbsContent varchar(2048) NOT NULL,
    bbsAvailable NUMBER(3) not null,
    bbsCategory NUMBER(10) NOT NULL,
    bbsView NUMBER(10) NOT NULL
);

create table supplementsUser
(
    userID varchar(40) PRIMARY KEY,
    userPassword varchar(40) not null,
    userName varchar(40) not null,
    userGender varchar(10) not null,
    userEmail varchar(40) not null,
    userBirth varchar(30)
);
create table bbsComment
(
    commentID number(15) PRIMARY KEY,
    bbsID number(15) not null,
    userID varchar(40) not null,
    commentText varchar(1024) not null
);
SELECT * FROM BBS;
select * from supplementsuser;
SELECT * FROM BBS WHERE bbsTitle LIKE '%ㅎㅎ%' ORDER BY bbsID desc
SELECT * FROM (SELECT * FROM bbs WHERE BBSTITLE LIKE '%ㅅㅅ%' AND bbsID < 10 AND bbsAvailable = 1 ORDER BY BBSID DESC) WHERE ROWNUM<=10;
SELECT SYSDATE FROM DUAL;