select * from nbp_board;

create table nbp_board (
ntitle varchar2(100) not null,  -- 게시물 제목
ncontent varchar2(500)  -- 게시물 내용
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