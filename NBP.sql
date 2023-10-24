select * from nbp_board;

create table nbp_board (
nkanji varchar2(100) not null,  -- 한자 title
nruby varchar2(500),  -- 요미가나
nsetsumei varchar2(500)  -- 설명
);

CREATE SEQUENCE nbp_board_seq
START WITH 1
INCREMENT BY 1;

create table nbp_user_board (
uid number(6) primary key,      -- 게시물 식별자
uname varchar2(20) not null,    -- 작성자 이름
utitle varchar2(100) not null,  -- 게시물 제목
ucontent varchar2(500),         -- 게시물 내용
udate date default sysdate,     -- 게시물 작성 일자
uhit number(4) default 0,       -- 조회수
uselector number(1) not null --1:공지 2:일반 게시판
);

CREATE SEQUENCE nbp_user_board_seq
START WITH 1
INCREMENT BY 1;

create table nbp_users(
   username varchar2(50) not null primary key,
   password varchar2(100) not null,
   enabled char(1) DEFAULT '1',
    cname VARCHAR2(50) NOT NULL,        -- 회원 이름
    cgrade NUMBER(1)                   -- 회원 등급
);

create table nbp_authorities (
   username varchar2(50) not null,
   authority varchar2(50) not null,
   constraint fk_nbp_authorities_nbp_users foreign key(username) references nbp_users(username)
);

create unique index ix_nbp_auth_nbp_username on nbp_authorities (username,authority);


select * from users;
select * from authorities;