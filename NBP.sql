select * from nbp_board;

create table nbp_board (
nid number(6) primary key,      -- �Խù� �ĺ���
nname varchar2(20) not null,    -- �ۼ��� �̸�
ntitle varchar2(100) not null,  -- �Խù� ����
ncontent varchar2(500),         -- �Խù� ����
ndate date default sysdate,     -- �Խù� �ۼ� ����
nhit number(4) default 0,       -- ��ȸ��
nselector number(1) not null --�Խñ۱��� 1:���� 2:qna 3:����
);