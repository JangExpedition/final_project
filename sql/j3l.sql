--===============================
-- 테이블 조회
--===============================
select * from member;
select * from authority;
select * from reservation;
select * from cinema;
select * from theater;
select * from scheduel;
select * from movie;
select * from movie_attachment;
select * from snack;
select * from question;
select * from question_attachment;
select * from question_comment;
select * from notice;
select * from faq;
select * from blackList;

--===============================
-- 관리자 계정 생성
--===============================
insert into member
values('admin', '1234', '어드민', '01012341234', 'admin@gmail.com', '1993-08-03', default, 31, default);

insert into authority
values('admin', 'ROLE_USER');

insert into authority
values('admin', 'ROLE_ADMIN');

--===============================
-- 영화관 데이터
--===============================
-- 서울
insert into cinema values('강남점', 'SEOUL', '서울특별시 강남구 강남대로 438 (역삼동, 스타플렉스)');
insert into cinema values('건대입구점', 'SEOUL', '서울특별시 광진구 아차산로30길 26');
-- 경기
insert into cinema values('광명역점', 'GYEONGGI', '경기도 광명시 일직동 514 GIDC B동 지하2층');
insert into cinema values('범계점', 'GYEONGGI', '경기도 안양시 동안구 동안로 119 (호계동, 뉴코아 아울렛 11층)');
-- 인천
insert into cinema values('송도타임스페이스', 'INCHEON', '인천광역시 연수구 하모니로 158 지하1층');
insert into cinema values('인천점', 'INCHEON', '인천광역시 남동구 예술로 198 (구월동, SEE"&"SEEE 4층)');
-- 강원
insert into cinema values('강릉점', 'KANGWON', '강원도 강릉시 경강로 2120 (옥천동, 씨네몰 6층)');
insert into cinema values('춘전점', 'KANGWON', '강원도 춘천시 지석로 80 (퇴계동, 투탑시티 3층)');
-- 대전/충청
insert into cinema values('대전점', 'CHUNGCHEONG', '대전광역시 중구 계백로 1700 (문화동, 세이2 6층)');
insert into cinema values('천안점', 'CHUNGCHEONG', '충청남도 천안시 동남구 명동길 47, 5층 (대흥동)');
-- 대구
insert into cinema values('대구점', 'DAEGU', '대구광역시 북구 칠성동2가 20-1 스펙트럼시티 4층');
-- 부산/울산
insert into cinema values('센텀시티점', 'BUSANULSAN', '부산광역시 해운대구 센텀남대로 35 (우동, 신세계센텀시티 7층)');
insert into cinema values('울산동구', 'BUSANULSAN', '울산광역시 동구 등대로50');
-- 경상
insert into cinema values('창원점', 'GYEONGSANG', '경상남도 창원시 의창구 창원대로397번길 6 (팔용동, 뉴코아아울렛 8층)');
insert into cinema values('마산점', 'GYEONGSANG', '경상남도 창원시 마산회원구 3·15대로 736 (합성동, 보보스존 8층)');
-- 광주/전라/제주
insert into cinema values('광주터미널', 'JEONLLAJEJU', '광주광역시 서구 무진대로 904 (광천동, 유스퀘어 2층)');
insert into cinema values('제주점', 'JEONLLAJEJU', '제주특별자치도 제주시 이도2동 메카플러스 3~7층');

--===============================
-- 테이블 및 시퀀스 생성
--===============================

-- 회원테이블
CREATE TABLE member (
	id varchar2(50)	NOT NULL,
	password varchar2(300) NOT NULL,
	name varchar2(30) NOT NULL,
	phone varchar2(20) NOT NULL,
	email varchar2(50) NOT NULL,
	birth Date NOT NULL,
	isBlackList char(1) default 'X' not null,
	age	number	NOT NULL,
    enroll_date Date default sysdate not null,
    CONSTRAINT PK_MEMBER_ID PRIMARY KEY(ID),
    constraint ck_member_isBlackList check(isBlackList in ('O', 'X'))
);

-- 회원권한 테이블
CREATE TABLE AUTHORITY(
    ID VARCHAR2(50),
    AUTH VARCHAR2(50),
    CONSTRAINT PK_AUTHORITY PRIMARY KEY(AUTH),
    CONSTRAINT FK_AUTHORITY_MEMBER_ID FOREIGN KEY(ID)
                            REFERENCES MEMBER
                            ON DELETE CASCADE
);

-- 예약 테이블
CREATE TABLE reservation (
    no VARCHAR(255)	NOT NULL,
	id varchar2(50) NOT NULL,
	schedule_no number NOT NULL,
    CONSTRAINT PK_RESERVATION_NO PRIMARY KEY(NO),
    CONSTRAINT FK_RESERVATION_MEMBER_ID FOREIGN KEY(ID)
                            REFERENCES MEMBER
                            ON DELETE SET NULL
);

-- 예약 테이블 시퀀스
create sequence seq_reservation_no;

-- 영화관 테이블
CREATE TABLE cinema (
	name varchar2(30) NOT NULL,
	location varchar2(30) NOT NULL,
	address varchar2(3000) NOT NULL,
    CONSTRAINT PK_CINEMA_NAME PRIMARY KEY(NAME)
);

-- 상영관 테이블
CREATE TABLE theater (
	no	number NOT NULL,
	theater_no number NOT NULL,
	cinema_name	varchar2(30) NOT NULL,
    CONSTRAINT PK_THEATER_NO PRIMARY KEY(NO),
    CONSTRAINT FK_THEATER_CINEMA_NAME FOREIGN KEY(CINEMA_NAME)
                        REFERENCES CINEMA
                        ON DELETE CASCADE
);

-- 상영관 테이블 시퀀스
create sequence seq_theater_no;

-- 상영시간표 테이블
CREATE TABLE scheduel (
	no number NOT NULL,
	movie_no number	NOT NULL,
	theater_no number NOT NULL,
    start_time Date	NOT NULL,
	end_time Date NOT NULL,
    constraint pk_scheduel_no primary key(no)
);

-- 상영시간표 테이블 시퀀스
create sequence seq_scheduel_no;

-- 영화나 상영관이 삭제되도 상영 시간표(기록)은 남아야될 것 같아서 외래키 안 씀

-- 영화 테이블
CREATE TABLE movie (
    no number NOT NULL,
	title varchar2(100)	NOT NULL,
	genre varchar2(30) NOT NULL,
	director varchar2(50) NOT NULL,
	actors varchar2(3000) NOT NULL,
	synopsis varchar2(4000)	NOT NULL,
	limit_age number NOT NULL,
    constraint pk_movie_no primary key(no)
);

-- 영화 테이블 시퀀스
create sequence seq_movie_no;

-- 영화 첨부파일 테이블
CREATE TABLE movie_attachment (
	no number NOT NULL,
	movie_no number NOT NULL,
	original_filename varchar2(2000) NULL,
	renamed_filename varchar2(2000) NULL,
    constraint pk_movie_attachment_no primary key(no),
    constraint fk_movie_attachment_movie_no foreign key(movie_no)
                                    references movie
                                    on delete cascade
);

-- 영화 첨부파일 시퀀스
create sequence seq_movie_attach_no;

-- 간식 테이블
CREATE TABLE snack (
	no number NOT NULL,
    cinema_name varchar2(30) not null,
	name varchar2(50) NOT NULL,
	price number NOT NULL,
	information varchar2(1000) NOT NULL,
	category varchar2(50) NOT NULL,
	original_filename varchar2(2000) NULL,
	renamed_filename varchar2(2000) NULL,
    constraint pk_snack_no primary key(no),
    constraint fk_snack_cinema_no foreign key(cinema_name)
                            references cinema
                            on delete cascade
);

-- 간식 테이블 시퀀스
create sequence seq_snack_no;

-- 문의게시판 테이블
CREATE TABLE question (
	no number	NOT NULL,
	id varchar2(50)	NOT NULL,
	title varchar2(1000)	NOT NULL,
	content varchar2(4000)	NOT NULL,
	reg_date Date DEFAULT sysdate NOT NULL,
    constraint pk_question_no primary key(no),
    constraint fk_question_member_id foreign key(id)
                                references member
                                on delete cascade
);

-- 문의게시판 테이블 시퀀스
create sequence seq_question_no;

-- 문의게시판 첨부파일 테이블
CREATE TABLE question_attachment (
	no number NOT NULL,
	q_no number NOT NULL,
	original_filename varchar2(2000) NULL,
	renamed_filename varchar2(2000) NULL,
    constraint pk_question_attach_no primary key(no),
    constraint fk_question_q_no foreign key(q_no)
                        references question
                        on delete cascade
);

-- 문의게시판 첨부파일 테이블 시퀀스
create sequence seq_question_attach_no;

-- 문의게시판 댓글 테이블
CREATE TABLE question_comment (
	no number NOT NULL,
	q_no number	NOT NULL,
	content varchar2(4000) NOT NULL,
	reg_date date DEFAULT sysdate NOT NULL,
	id varchar2(50) NOT NULL,
    constraint pk_comment_no primary key(no),
    constraint fk_comment_q_no foreign key(q_no)
                        references question
                        on delete cascade,
    constraint fk_comment_member_id foreign key(id)
                        references member
                        on delete cascade
);

-- 문의게시판 댓글 테이블 시퀀스
create sequence seq_question_comment_no;

-- 공지사항 테이블
CREATE TABLE notice (
	no number NOT NULL,
	id varchar2(50)	NOT NULL,
	title varchar2(50) NOT NULL,
	content varchar2(4000) NOT NULL,
    constraint pk_notice_no primary key(no)
);

-- 공지사항 테이블 시퀀스
create sequence seq_notice_no;

-- 관리자 계정이 없어져도 공지사항은 남아야 된다고 생각해서 외래키 안 걸음

-- 자주묻는 질문 테이블
CREATE TABLE FAQ (
	no number	NOT NULL,
	title varchar2(200)	NOT NULL,
	content varchar2(4000) NOT NULL,
    constraint pk_faq_no primary key(no)
);

-- 자주묻는 질문 시퀀스
create sequence seq_faq_no;

-- 블랙리스트 테이블
create table blackList
as
(select 1 no, m.*, sysdate black_date from member m where 1 = 0);

alter table blackList
    add constraint pk_blackList_no primary key (no)
    modify black_date default sysdate;

create sequence seq_blackList_no;

-- 멤버 테이블에서 isBlackList 'O'로 변경시 트리거 발생
--create or replace trigger trig_member_blackList
--    after update of isBlackList on member
--    for each row
--begin
--    if inserting then
--        insert into
--            blackList
--        values(
--            seq_blackList_no,
--            :old.id,
--            :old.password,
--            :old.name,
--            :old.phone,
--            :old.phone,
--            :old.email,
--            :old.birth,
--            :old.isBlackList,
--            :old.age,
--            :old.enroll_date,
--            sysdate
--        );
--    end if;
--end;



