select * from nbp_board;

create table nbp_board (
nid number(6) primary key,      -- 게시물 식별자
nname varchar2(20) not null,    -- 작성자 이름
ntitle varchar2(100) not null,  -- 게시물 제목
ncontent varchar2(500),         -- 게시물 내용
ndate date default sysdate,     -- 게시물 작성 일자
nhit number(4) default 0,       -- 조회수
nselector number(1) not null --게시글구분 1:공지 2:qna 3:리뷰
);