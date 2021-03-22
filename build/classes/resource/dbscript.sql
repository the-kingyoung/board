CREATE TABLE board(
	NO NUMBER PRIMARY key,
	refno NUMBER,
	subject varchar2(200),
	content varchar2(2000),
	writer varchar2(100),
	readcnt NUMBER,
	regdte DATE,
	uptdte DATE
);
SELECT * FROM board;
DROP TABLE board;
DROP TABLE boardfile;
ALTER board RENAME TO board1;

CREATE TABLE boardfile(
	NO NUMBER,
	fname varchar2(100),
	pathname varchar2(1000),
	content varchar2(1000),
	credte date
);

CREATE SEQUENCE board_seq
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 9999999;

INSERT INTO board values(board_seq.nextval,0,'첫번째 글','내용','홍길동',0,sysdate,sysdate);
SELECT * FROM board;

	