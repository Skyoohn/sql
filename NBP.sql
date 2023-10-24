select * from nbp_board;

create table nbp_board (
nkanji varchar2(100) not null,  -- ���� title
nruby varchar2(500),  -- ��̰���
nsetsumei varchar2(500)  -- ����
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

create table nbp_users(
   username varchar2(50) not null primary key,
   password varchar2(100) not null,
   enabled char(1) DEFAULT '1',
    cname VARCHAR2(50) NOT NULL,        -- ȸ�� �̸�
    cgrade NUMBER(1)                   -- ȸ�� ���
);

create table nbp_authorities (
   username varchar2(50) not null,
   authority varchar2(50) not null,
   constraint fk_nbp_authorities_nbp_users foreign key(username) references nbp_users(username)
);

create unique index ix_nbp_auth_nbp_username on nbp_authorities (username,authority);


select * from users;
select * from authorities;