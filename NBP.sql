select * from nbp_board;

create table nbp_board (
ntitle varchar2(100) not null,  -- �Խù� ����
ncontent varchar2(500)  -- �Խù� ����
);

CREATE SEQUENCE nbp_board_seq
START WITH 1
INCREMENT BY 1;


create table nbp_user_board (
uid number(6) primary key,      -- �Խù� �ĺ���
uname varchar2(20) not null,    -- �ۼ��� �̸�
utitle varchar2(100) not null,  -- �Խù� ����
ucontent varchar2(500),         -- �Խù� ����
udate date default sysdate,     -- �Խù� �ۼ� ����
uhit number(4) default 0,       -- ��ȸ��
uselector number(1) not null --1:���� 2:�Ϲ� �Խ���
);

CREATE SEQUENCE nbp_user_board_seq
START WITH 1
INCREMENT BY 1;