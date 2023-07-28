create table mvc_board2(
    bid NUMBER(4) PRIMARY KEY,
    bname VARCHAR2(20),
    btitle VARCHAR2(100),
    bcontent VARCHAR2(300),
    bdate DATE DEFAULT SYSDATE,
    bhit NUMBER(4) DEFAULT 0,
    bgroup NUMBER(4),
    bstep NUMBER(4),
    bindent NUMBER(4)
);

commit;

--sequence »ý¼º
create sequence mvc_board_seq;
