-- <문제> 이미 존재하는 EMP01 테이블에 입사일 칼럼(CREDATE)을 날짜형으로 추가하라.
desc emp01;
alter table emp01 add credate date;
--<실습> 고객 테이블 생성을 위한 필드(속성을 부여한 데이터) 설정
CREATE TABLE TB_CUSTOMER (
    CUSTOMER_CD CHAR(7) PRIMARY KEY, -- 고객코드
    CUSTOMER_NM VARCHAR2(10) NOT NULL, -- 고객명
    MW_FLG CHAR(1) NOT NULL, -- 성별구분
    BIRTH_DAY CHAR(8) NOT NULL, -- 생일
    PHONE_NUMBER VARCHAR2(16), -- 전화번호
    EMAIL VARCHAR2(30), -- EMAIL
    TOTAL_POINT NUMBER(10), -- 누적포인트
    REG_DTTM CHAR(14 BYTE) -- 등록일
);

-- <실습> 학생 성적 테이블을 만들어 봅시다.
/*
1.학번의 (숫자)데이터는 중복되거나 null값을 허용하면 안 되고
2.이름은 문자데이터며 null값을 허용하지 않고 
국어, 영어, 수학 컬럼을 number 타입으로 가지고 모두 다 null값을 허용하지 않습니다.,
단, 국어,영어,수학 컬럼에 데이터를 넣지 않으면 기본값으로 0을 갖습니다.,
총점과 평균 컬럼은 기본값을 0을 갖습니다.,
학과코드는 학과 테이블에 학과 코드를 참조한다.(학과테이블 학과코드 PK -> FK),
학번/이름/국어/영어/수학/총점/평균/학과코드 이게 컬럼명이다.,
학과테이블을 참조해서 (2 레코드) 입력한다.,

학과테이블을 만들어 봅시다.
학과 테이블명이 된다.,
학과코드 데이터는 중복되거나 null값을 허락하지 않는다.,
학과명은 가변문자열로 설정하고 , null값을 허락하지 않는다.,
학과코드/학과명 샘플데이터를 만들어서 입력한다.(3 ROW),
*/

create table major(
    majorcode varchar2(10) not null,
    majorname varchar2(100) not null
);

alter table major add constraint major_PK primary key (majorcode);

create table stuscore (
    stu_num number,
    stu_name varchar2(20) not null,
    kor number default 0 not null,
    eng number default 0 not null,
    math number default 0 not null,
    total number default 0 not null,
    avg number(5,2) default 0 not null ,
    majorcode varchar2(10),
    CONSTRAINT STUSCORE_PK PRIMARY KEY (STU_NUM),
    constraint major_FK foreign key (majorcode)
    references major (majorcode)
);

DROP TABLE STUSCORE;


INSERT INTO MAJOR VALUES ('COM01','컴퓨터공학');
INSERT INTO MAJOR VALUES ('DEG01','디자인');
INSERT INTO MAJOR VALUES ('ERC01','전자공학');

INSERT INTO STUSCORE(stu_num, stu_name, majorcode) VALUES (1,'홍길동','COM01');
INSERT INTO STUSCORE(stu_num, stu_name, majorcode) VALUES (2,'고길동','DEG01');

-- select 한 결과를 보여주면 된다.
desc major;
select * from user_constraints where table_name = 'STUSCORE';

SELECT * FROM MAJOR;

SELECT * FROM STUSCORE;




