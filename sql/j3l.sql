--===============================
-- 테이블 조회
--===============================
select * from member;
select * from authority;
select * from persistent_logins;
select * from reservation;
select * from location;
select * from cinema;
select * from theater;
select * from schedule;
select * from movie;
select * from movie_attachment;
select * from store;
select * from question;
select * from question_attachment;
select * from question_answer;
select * from notice;
select * from faq;
select * from seat;
select * from cart;
select * from event;
select * from event_attachment;
<<<<<<< HEAD
select * from cart;

=======
select * from store_order;
>>>>>>> branch 'master' of https://github.com/Jangcccci/final_project.git

--===============================
-- 관리자 계정 생성
--===============================

insert into member
values('admin', '1234', '어드민', default, default, '01012341234', 'admin@gmail.com', '19930803', 29, default);

update member set password='$2a$10$Tk1XefztVv5IGUVOY3KiA.yH4mSCQ8c/.ytxD.t/lF5.Z0BIDZrLu' where id='admin';

insert into authority
values('admin', 'ROLE_USER');

insert into authority
values('admin', 'ROLE_ADMIN');


--===============================
-- 지역 데이터
--===============================
insert into location values(seq_location_no.nextval, 'SEOUL');
insert into location values(seq_location_no.nextval, 'GYEONGGI');
insert into location values(seq_location_no.nextval, 'INCHEON');
insert into location values(seq_location_no.nextval, 'KANGWON');
insert into location values(seq_location_no.nextval, 'CHUNGCHEONG');
insert into location values(seq_location_no.nextval, 'DAEGU');
insert into location values(seq_location_no.nextval, 'BUSANULSAN');
insert into location values(seq_location_no.nextval, 'GYEONGSANG');
insert into location values(seq_location_no.nextval, 'JEONLLAJEJU');




--===============================
-- 상영관 데이터
--===============================
-- 강남점
insert into theater values(seq_theater_no.nextval, 1, '강남점');
insert into theater values(seq_theater_no.nextval, 2, '강남점');
insert into theater values(seq_theater_no.nextval, 3, '강남점');
insert into theater values(seq_theater_no.nextval, 4, '강남점');
insert into theater values(seq_theater_no.nextval, 5, '강남점');
insert into theater values(seq_theater_no.nextval, 6, '강남점');
insert into theater values(seq_theater_no.nextval, 7, '강남점');
insert into theater values(seq_theater_no.nextval, 8, '강남점');
insert into theater values(seq_theater_no.nextval, 9, '강남점');
insert into theater values(seq_theater_no.nextval, 10, '강남점');

-- 건대입구점
insert into theater values(seq_theater_no.nextval, 1, '건대입구점');
insert into theater values(seq_theater_no.nextval, 2, '건대입구점');
insert into theater values(seq_theater_no.nextval, 3, '건대입구점');
insert into theater values(seq_theater_no.nextval, 4, '건대입구점');
insert into theater values(seq_theater_no.nextval, 5, '건대입구점');
insert into theater values(seq_theater_no.nextval, 6, '건대입구점');
insert into theater values(seq_theater_no.nextval, 7, '건대입구점');
insert into theater values(seq_theater_no.nextval, 8, '건대입구점');
insert into theater values(seq_theater_no.nextval, 9, '건대입구점');
insert into theater values(seq_theater_no.nextval, 10, '건대입구점');

--광명역점
insert into theater values(seq_theater_no.nextval, 1, '광명역점');
insert into theater values(seq_theater_no.nextval, 2, '광명역점');
insert into theater values(seq_theater_no.nextval, 3, '광명역점');
insert into theater values(seq_theater_no.nextval, 4, '광명역점');
insert into theater values(seq_theater_no.nextval, 5, '광명역점');
insert into theater values(seq_theater_no.nextval, 6, '광명역점');
insert into theater values(seq_theater_no.nextval, 7, '광명역점');
insert into theater values(seq_theater_no.nextval, 8, '광명역점');
insert into theater values(seq_theater_no.nextval, 9, '광명역점');
insert into theater values(seq_theater_no.nextval, 10, '광명역점');

--범계점
insert into theater values(seq_theater_no.nextval, 1, '범계점');
insert into theater values(seq_theater_no.nextval, 2, '범계점');
insert into theater values(seq_theater_no.nextval, 3, '범계점');
insert into theater values(seq_theater_no.nextval, 4, '범계점');
insert into theater values(seq_theater_no.nextval, 5, '범계점');
insert into theater values(seq_theater_no.nextval, 6, '범계점');
insert into theater values(seq_theater_no.nextval, 7, '범계점');
insert into theater values(seq_theater_no.nextval, 8, '범계점');
insert into theater values(seq_theater_no.nextval, 9, '범계점');
insert into theater values(seq_theater_no.nextval, 10, '범계점');

--송도타임스페이스점
insert into theater values(seq_theater_no.nextval, 1, '송도타임스페이스점');
insert into theater values(seq_theater_no.nextval, 2, '송도타임스페이스점');
insert into theater values(seq_theater_no.nextval, 3, '송도타임스페이스점');
insert into theater values(seq_theater_no.nextval, 4, '송도타임스페이스점');
insert into theater values(seq_theater_no.nextval, 5, '송도타임스페이스점');
insert into theater values(seq_theater_no.nextval, 6, '송도타임스페이스점');
insert into theater values(seq_theater_no.nextval, 7, '송도타임스페이스점');
insert into theater values(seq_theater_no.nextval, 8, '송도타임스페이스점');
insert into theater values(seq_theater_no.nextval, 9, '송도타임스페이스점');
insert into theater values(seq_theater_no.nextval, 10, '송도타임스페이스점');

-- 인천점
insert into theater values(seq_theater_no.nextval, 1, '인천점');
insert into theater values(seq_theater_no.nextval, 2, '인천점');
insert into theater values(seq_theater_no.nextval, 3, '인천점');
insert into theater values(seq_theater_no.nextval, 4, '인천점');
insert into theater values(seq_theater_no.nextval, 5, '인천점');
insert into theater values(seq_theater_no.nextval, 6, '인천점');
insert into theater values(seq_theater_no.nextval, 7, '인천점');
insert into theater values(seq_theater_no.nextval, 8, '인천점');
insert into theater values(seq_theater_no.nextval, 9, '인천점');
insert into theater values(seq_theater_no.nextval, 10, '인천점');

--강릉점
insert into theater values(seq_theater_no.nextval, 1, '강릉점');
insert into theater values(seq_theater_no.nextval, 2, '강릉점');
insert into theater values(seq_theater_no.nextval, 3, '강릉점');
insert into theater values(seq_theater_no.nextval, 4, '강릉점');
insert into theater values(seq_theater_no.nextval, 5, '강릉점');
insert into theater values(seq_theater_no.nextval, 6, '강릉점');
insert into theater values(seq_theater_no.nextval, 7, '강릉점');
insert into theater values(seq_theater_no.nextval, 8, '강릉점');
insert into theater values(seq_theater_no.nextval, 9, '강릉점');
insert into theater values(seq_theater_no.nextval, 10, '강릉점');

--춘천점
insert into theater values(seq_theater_no.nextval, 1, '춘천점');
insert into theater values(seq_theater_no.nextval, 2, '춘천점');
insert into theater values(seq_theater_no.nextval, 3, '춘천점');
insert into theater values(seq_theater_no.nextval, 4, '춘천점');
insert into theater values(seq_theater_no.nextval, 5, '춘천점');
insert into theater values(seq_theater_no.nextval, 6, '춘천점');
insert into theater values(seq_theater_no.nextval, 7, '춘천점');
insert into theater values(seq_theater_no.nextval, 8, '춘천점');
insert into theater values(seq_theater_no.nextval, 9, '춘천점');
insert into theater values(seq_theater_no.nextval, 10, '춘천점');

--대전점
insert into theater values(seq_theater_no.nextval, 1, '대전점');
insert into theater values(seq_theater_no.nextval, 2, '대전점');
insert into theater values(seq_theater_no.nextval, 3, '대전점');
insert into theater values(seq_theater_no.nextval, 4, '대전점');
insert into theater values(seq_theater_no.nextval, 5, '대전점');
insert into theater values(seq_theater_no.nextval, 6, '대전점');
insert into theater values(seq_theater_no.nextval, 7, '대전점');
insert into theater values(seq_theater_no.nextval, 8, '대전점');
insert into theater values(seq_theater_no.nextval, 9, '대전점');
insert into theater values(seq_theater_no.nextval, 10, '대전점');

--천안점
insert into theater values(seq_theater_no.nextval, 1, '천안점');
insert into theater values(seq_theater_no.nextval, 2, '천안점');
insert into theater values(seq_theater_no.nextval, 3, '천안점');
insert into theater values(seq_theater_no.nextval, 4, '천안점');
insert into theater values(seq_theater_no.nextval, 5, '천안점');
insert into theater values(seq_theater_no.nextval, 6, '천안점');
insert into theater values(seq_theater_no.nextval, 7, '천안점');
insert into theater values(seq_theater_no.nextval, 8, '천안점');
insert into theater values(seq_theater_no.nextval, 9, '천안점');
insert into theater values(seq_theater_no.nextval, 10, '천안점');

--대구점
insert into theater values(seq_theater_no.nextval, 1, '대구점');
insert into theater values(seq_theater_no.nextval, 2, '대구점');
insert into theater values(seq_theater_no.nextval, 3, '대구점');
insert into theater values(seq_theater_no.nextval, 4, '대구점');
insert into theater values(seq_theater_no.nextval, 5, '대구점');
insert into theater values(seq_theater_no.nextval, 6, '대구점');
insert into theater values(seq_theater_no.nextval, 7, '대구점');
insert into theater values(seq_theater_no.nextval, 8, '대구점');
insert into theater values(seq_theater_no.nextval, 9, '대구점');
insert into theater values(seq_theater_no.nextval, 10, '대구점');

--센텀시티점
insert into theater values(seq_theater_no.nextval, 1, '센텀시티점');
insert into theater values(seq_theater_no.nextval, 2, '센텀시티점');
insert into theater values(seq_theater_no.nextval, 3, '센텀시티점');
insert into theater values(seq_theater_no.nextval, 4, '센텀시티점');
insert into theater values(seq_theater_no.nextval, 5, '센텀시티점');
insert into theater values(seq_theater_no.nextval, 6, '센텀시티점');
insert into theater values(seq_theater_no.nextval, 7, '센텀시티점');
insert into theater values(seq_theater_no.nextval, 8, '센텀시티점');
insert into theater values(seq_theater_no.nextval, 9, '센텀시티점');
insert into theater values(seq_theater_no.nextval, 10, '센텀시티점');

--울산동구점
insert into theater values(seq_theater_no.nextval, 1, '울산동구점');
insert into theater values(seq_theater_no.nextval, 2, '울산동구점');
insert into theater values(seq_theater_no.nextval, 3, '울산동구점');
insert into theater values(seq_theater_no.nextval, 4, '울산동구점');
insert into theater values(seq_theater_no.nextval, 5, '울산동구점');
insert into theater values(seq_theater_no.nextval, 6, '울산동구점');
insert into theater values(seq_theater_no.nextval, 7, '울산동구점');
insert into theater values(seq_theater_no.nextval, 8, '울산동구점');
insert into theater values(seq_theater_no.nextval, 9, '울산동구점');
insert into theater values(seq_theater_no.nextval, 10, '울산동구점');

--창원점
insert into theater values(seq_theater_no.nextval, 1, '창원점');
insert into theater values(seq_theater_no.nextval, 2, '창원점');
insert into theater values(seq_theater_no.nextval, 3, '창원점');
insert into theater values(seq_theater_no.nextval, 4, '창원점');
insert into theater values(seq_theater_no.nextval, 5, '창원점');
insert into theater values(seq_theater_no.nextval, 6, '창원점');
insert into theater values(seq_theater_no.nextval, 7, '창원점');
insert into theater values(seq_theater_no.nextval, 8, '창원점');
insert into theater values(seq_theater_no.nextval, 9, '창원점');
insert into theater values(seq_theater_no.nextval, 10, '창원점');

--마산점
insert into theater values(seq_theater_no.nextval, 1, '마산점');
insert into theater values(seq_theater_no.nextval, 2, '마산점');
insert into theater values(seq_theater_no.nextval, 3, '마산점');
insert into theater values(seq_theater_no.nextval, 4, '마산점');
insert into theater values(seq_theater_no.nextval, 5, '마산점');
insert into theater values(seq_theater_no.nextval, 6, '마산점');
insert into theater values(seq_theater_no.nextval, 7, '마산점');
insert into theater values(seq_theater_no.nextval, 8, '마산점');
insert into theater values(seq_theater_no.nextval, 9, '마산점');
insert into theater values(seq_theater_no.nextval, 10, '마산점');

--광주터미널점
insert into theater values(seq_theater_no.nextval, 1, '광주터미널점');
insert into theater values(seq_theater_no.nextval, 2, '광주터미널점');
insert into theater values(seq_theater_no.nextval, 3, '광주터미널점');
insert into theater values(seq_theater_no.nextval, 4, '광주터미널점');
insert into theater values(seq_theater_no.nextval, 5, '광주터미널점');
insert into theater values(seq_theater_no.nextval, 6, '광주터미널점');
insert into theater values(seq_theater_no.nextval, 7, '광주터미널점');
insert into theater values(seq_theater_no.nextval, 8, '광주터미널점');
insert into theater values(seq_theater_no.nextval, 9, '광주터미널점');
insert into theater values(seq_theater_no.nextval, 10, '광주터미널점');

--제주점
insert into theater values(seq_theater_no.nextval, 1, '제주점');
insert into theater values(seq_theater_no.nextval, 2, '제주점');
insert into theater values(seq_theater_no.nextval, 3, '제주점');
insert into theater values(seq_theater_no.nextval, 4, '제주점');
insert into theater values(seq_theater_no.nextval, 5, '제주점');
insert into theater values(seq_theater_no.nextval, 6, '제주점');
insert into theater values(seq_theater_no.nextval, 7, '제주점');
insert into theater values(seq_theater_no.nextval, 8, '제주점');
insert into theater values(seq_theater_no.nextval, 9, '제주점');
insert into theater values(seq_theater_no.nextval, 10, '제주점');


--===============================
-- 좌석 데이터 
--===============================
insert into seat values(1, 'A1', default);
insert into seat values(1, 'A2', default);
insert into seat values(1, 'A3', default);
insert into seat values(1, 'A4', default);
insert into seat values(1, 'A5', default);
insert into seat values(1, 'A6', default);
insert into seat values(1, 'A7', default);
insert into seat values(1, 'A8', default);
insert into seat values(1, 'A9', default);
insert into seat values(1, 'A10', default);
insert into seat values(1, 'A11', default);
insert into seat values(1, 'A12', default);
insert into seat values(1, 'A13', default);
insert into seat values(1, 'A14', default);
insert into seat values(1, 'A15', default);

insert into seat values(1, 'B1', default);
insert into seat values(1, 'B2', default);
insert into seat values(1, 'B3', default);
insert into seat values(1, 'B4', default);
insert into seat values(1, 'B5', default);
insert into seat values(1, 'B6', default);
insert into seat values(1, 'B7', default);
insert into seat values(1, 'B8', default);
insert into seat values(1, 'B9', default);
insert into seat values(1, 'B10', default);
insert into seat values(1, 'B11', default);
insert into seat values(1, 'B12', default);
insert into seat values(1, 'B13', default);
insert into seat values(1, 'B14', default);
insert into seat values(1, 'B15', default);

insert into seat values(1, 'C1', default);
insert into seat values(1, 'C2', default);
insert into seat values(1, 'C3', default);
insert into seat values(1, 'C4', default);
insert into seat values(1, 'C5', default);
insert into seat values(1, 'C6', default);
insert into seat values(1, 'C7', default);
insert into seat values(1, 'C8', default);
insert into seat values(1, 'C9', default);
insert into seat values(1, 'C10', default);
insert into seat values(1, 'C11', default);
insert into seat values(1, 'C12', default);
insert into seat values(1, 'C13', default);
insert into seat values(1, 'C14', default);
insert into seat values(1, 'C15', default);

insert into seat values(1, 'D1', default);
insert into seat values(1, 'D2', default);
insert into seat values(1, 'D3', default);
insert into seat values(1, 'D4', default);
insert into seat values(1, 'D5', default);
insert into seat values(1, 'D6', default);
insert into seat values(1, 'D7', default);
insert into seat values(1, 'D8', default);
insert into seat values(1, 'D9', default);
insert into seat values(1, 'D10', default);
insert into seat values(1, 'D11', default);
insert into seat values(1, 'D12', default);
insert into seat values(1, 'D13', default);
insert into seat values(1, 'D14', default);
insert into seat values(1, 'D15', default);

insert into seat values(1, 'E1', default);
insert into seat values(1, 'E2', default);
insert into seat values(1, 'E3', default);
insert into seat values(1, 'E4', default);
insert into seat values(1, 'E5', default);
insert into seat values(1, 'E6', default);
insert into seat values(1, 'E7', default);
insert into seat values(1, 'E8', default);
insert into seat values(1, 'E9', default);
insert into seat values(1, 'E10', default);
insert into seat values(1, 'E11', default);
insert into seat values(1, 'E12', default);
insert into seat values(1, 'E13', default);
insert into seat values(1, 'E14', default);
insert into seat values(1, 'E15', default);

insert into seat values(1, 'F1', default);
insert into seat values(1, 'F2', default);
insert into seat values(1, 'F3', default);
insert into seat values(1, 'F4', default);
insert into seat values(1, 'F5', default);
insert into seat values(1, 'F6', default);
insert into seat values(1, 'F7', default);
insert into seat values(1, 'F8', default);
insert into seat values(1, 'F9', default);
insert into seat values(1, 'F10', default);
insert into seat values(1, 'F11', default);
insert into seat values(1, 'F12', default);
insert into seat values(1, 'F13', default);
insert into seat values(1, 'F14', default);
insert into seat values(1, 'F15', default);

insert into seat values(1, 'G1', default);
insert into seat values(1, 'G2', default);
insert into seat values(1, 'G3', default);
insert into seat values(1, 'G4', default);
insert into seat values(1, 'G5', default);
insert into seat values(1, 'G6', default);
insert into seat values(1, 'G7', default);
insert into seat values(1, 'G8', default);
insert into seat values(1, 'G9', default);
insert into seat values(1, 'G10', default);
insert into seat values(1, 'G11', default);
insert into seat values(1, 'G12', default);
insert into seat values(1, 'G13', default);
insert into seat values(1, 'G14', default);
insert into seat values(1, 'G15', default);

insert into seat values(1, 'H1', default);
insert into seat values(1, 'H2', default);
insert into seat values(1, 'H3', default);
insert into seat values(1, 'H4', default);
insert into seat values(1, 'H5', default);
insert into seat values(1, 'H6', default);
insert into seat values(1, 'H7', default);
insert into seat values(1, 'H8', default);
insert into seat values(1, 'H9', default);
insert into seat values(1, 'H10', default);
insert into seat values(1, 'H11', default);
insert into seat values(1, 'H12', default);
insert into seat values(1, 'H13', default);
insert into seat values(1, 'H14', default);
insert into seat values(1, 'H15', default);

insert into seat values(1, 'I1', default);
insert into seat values(1, 'I2', default);
insert into seat values(1, 'I3', default);
insert into seat values(1, 'I4', default);
insert into seat values(1, 'I5', default);
insert into seat values(1, 'I6', default);
insert into seat values(1, 'I7', default);
insert into seat values(1, 'I8', default);
insert into seat values(1, 'I9', default);
insert into seat values(1, 'I10', default);
insert into seat values(1, 'I11', default);
insert into seat values(1, 'I12', default);
insert into seat values(1, 'I13', default);
insert into seat values(1, 'I14', default);
insert into seat values(1, 'I15', default);

insert into seat values(1, 'J1', default);
insert into seat values(1, 'J2', default);
insert into seat values(1, 'J3', default);
insert into seat values(1, 'J4', default);
insert into seat values(1, 'J5', default);
insert into seat values(1, 'J6', default);
insert into seat values(1, 'J7', default);
insert into seat values(1, 'J8', default);
insert into seat values(1, 'J9', default);
insert into seat values(1, 'J10', default);
insert into seat values(1, 'J11', default);
insert into seat values(1, 'J12', default);
insert into seat values(1, 'J13', default);
insert into seat values(1, 'J14', default);
insert into seat values(1, 'J15', default);

insert into seat values(1, 'K1', default);
insert into seat values(1, 'K2', default);
insert into seat values(1, 'K3', default);
insert into seat values(1, 'K4', default);
insert into seat values(1, 'K5', default);
insert into seat values(1, 'K6', default);
insert into seat values(1, 'K7', default);
insert into seat values(1, 'K8', default);
insert into seat values(1, 'K9', default);
insert into seat values(1, 'K10', default);
insert into seat values(1, 'K11', default);
insert into seat values(1, 'K12', default);
insert into seat values(1, 'K13', default);
insert into seat values(1, 'K14', default);
insert into seat values(1, 'K15', default);

insert into seat values(1, 'L1', default);
insert into seat values(1, 'L2', default);
insert into seat values(1, 'L3', default);
insert into seat values(1, 'L4', default);
insert into seat values(1, 'L5', default);
insert into seat values(1, 'L6', default);
insert into seat values(1, 'L7', default);
insert into seat values(1, 'L8', default);
insert into seat values(1, 'L9', default);
insert into seat values(1, 'L10', default);
insert into seat values(1, 'L11', default);
insert into seat values(1, 'L12', default);
insert into seat values(1, 'L13', default);
insert into seat values(1, 'L14', default);
insert into seat values(1, 'L15', default);

insert into seat values(1, 'M1', default);
insert into seat values(1, 'M2', default);
insert into seat values(1, 'M3', default);
insert into seat values(1, 'M4', default);
insert into seat values(1, 'M5', default);
insert into seat values(1, 'M6', default);
insert into seat values(1, 'M7', default);
insert into seat values(1, 'M8', default);
insert into seat values(1, 'M9', default);
insert into seat values(1, 'M10', default);
insert into seat values(1, 'M11', default);
insert into seat values(1, 'M12', default);
insert into seat values(1, 'M13', default);
insert into seat values(1, 'M14', default);
insert into seat values(1, 'M15', default);

--===============================
-- 테이블 및 시퀀스 생성
--===============================

-- 로그인 테이블
create table persistent_logins (
    username varchar2(64) not null,
    series varchar2(64) primary key,
    token varchar2(64) not null, -- username, password, expiry time 등을 hashing한 값
    last_used timestamp not null
);

select * from persistent_logins;

-- 회원테이블
CREATE TABLE member (
	id varchar2(50)	NOT NULL,
	password varchar2(300) NOT NULL,
	name varchar2(30) NOT NULL,
    grade varchar2(10) default 'FAMILY' not null,
    point number default 1000 not null,
	phone char(11) NOT NULL,
	email varchar2(50) NOT NULL,
	birth char(8) NOT NULL,
	age	number	NOT NULL,
    enroll_date Date default sysdate not null,
    CONSTRAINT PK_MEMBER_ID PRIMARY KEY(ID),
    constraint uq_member_email unique(email)
);


-- 회원권한 테이블
CREATE TABLE AUTHORITY(
    ID VARCHAR2(50),
    AUTH VARCHAR2(50),
    CONSTRAINT PK_AUTHORITY PRIMARY KEY(ID, AUTH),
    CONSTRAINT FK_AUTHORITY_MEMBER_ID FOREIGN KEY(ID)
                            REFERENCES MEMBER(ID)
                            ON DELETE CASCADE
);

-- 예약 테이블
CREATE TABLE reservation (
    no VARCHAR(255)	NOT NULL,
	id varchar2(50) NOT NULL,
	schedule_no number NOT NULL,
    seat_no varchar2(3) not null,
    CONSTRAINT PK_RESERVATION_NO PRIMARY KEY(NO),
    CONSTRAINT FK_RESERVATION_MEMBER_ID FOREIGN KEY(ID)
                            REFERENCES MEMBER
                            ON DELETE SET NULL
);

-- 예약 테이블 시퀀스
create sequence seq_reservation_no;

-- 지역 테이블
create table location(
    no number not null,
    location_name varchar2(30) not null,
    constraint pk_location_name primary key(location_name),
    constraint uq_location unique(no)
    
);


-- 지역 테이블 시퀀스
create sequence seq_location_no;


-- 영화관 테이블
CREATE TABLE cinema (
	name varchar2(30) NOT NULL,
	location_name varchar2(30) NOT NULL,
	address varchar2(3000) NOT NULL,
    CONSTRAINT PK_CINEMA_NAME PRIMARY KEY(NAME),
    constraint fk_location_name foreign key(location_name) references location on delete cascade
);

-- 상영관 테이블
CREATE TABLE theater (
	no	number NOT NULL,
	theater_no number NOT NULL,
	cinema_name	varchar2(30) NOT NULL,
    CONSTRAINT PK_THEATER_NO PRIMARY KEY(NO),
    CONSTRAINT FK_THEATER_CINEMA_NAME FOREIGN KEY(CINEMA_NAME)
                        REFERENCES CINEMA
                        ON DELETE CASCADE,
    CONSTRAINT CK_THEATER_NO CHECK (theater_no >= 1 AND theater_no <= 10),
    constraint uq_theater unique (theater_no, cinema_name)
);

-- 상영관 테이블 시퀀스
create sequence seq_theater_no;

create table seat (
    schedule_no number not null,
    seat_no varchar2(3) not null,
    constraint pk_seat primary key(schedule_no, seat_no),
    constraint fk_seat_schedule_no foreign key(schedule_no)
                            references schedule
                            on delete cascade,
    constraint ck_seat_no check(seat_no >= 'A1' and 'M9' >= seat_no)
);

-- 상영시간표 테이블
CREATE TABLE schedule (
	no number NOT NULL,
	movie_no number	NOT NULL,
	theater_no number NOT NULL,
    start_time char(16)	NOT NULL,
	end_time char(16) NOT NULL,
    constraint pk_scheduel_no primary key(no)
);

-- 상영시간표 테이블 시퀀스
create sequence seq_schedule_no;


-- 영화나 상영관이 삭제되도 상영 시간표(기록)은 남아야될 것 같아서 외래키 안 씀

-- 영화 테이블
CREATE TABLE movie (
    no number NOT NULL,
	title varchar2(100)	NOT NULL,
	genre varchar2(30) NOT NULL,
	director varchar2(50) NOT NULL,
	actors varchar2(3000),
	synopsis varchar2(4000)	NOT NULL,
    running_time number not null,
	limit_age number NOT NULL,
    open_dt char(10) not null,
    reservation_count number default 0 not null,
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

-- 문의게시판 테이블
CREATE TABLE question (
	no number	NOT NULL,
    name varchar2(50) NOT NULL,
	id varchar2(50)	NOT NULL,
    phone char(11),
    email varchar2(50) NOT NULL,
	title varchar2(1000)	NOT NULL,
	content varchar2(4000)	NOT NULL,
	reg_date Date DEFAULT sysdate NOT NULL,
    type varchar2(50) NOT NULL,
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

-- 문의게시판 답변 테이블
CREATE TABLE question_answer (
	no number NOT NULL,
	q_no number	NOT NULL,
	content varchar2(4000) NOT NULL,
	reg_date date DEFAULT sysdate NOT NULL,
	id varchar2(50) NOT NULL,
    constraint pk_answer_no primary key(no),
    constraint fk_answer_q_no foreign key(q_no)
                        references question
                        on delete cascade,
    constraint fk_answer_member_id foreign key(id)
                        references member
                        on delete cascade
);


-- 문의게시판 댓글 테이블 시퀀스
create sequence seq_question_answer_no;

-- 공지사항 테이블
CREATE TABLE notice (
	no number NOT NULL,
	title varchar2(3000) NOT NULL,
    classifyy varchar2(50),
    read_count number default 0,
    created_at date default sysdate,
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
    classify varchar2(50),
    read_count number default 0,
    created_at date default sysdate,
    constraint pk_faq_no primary key(no)
);

-- 자주묻는 질문 시퀀스
create sequence seq_faq_no;

-- 이벤트 게시판 테이블
CREATE TABLE event (
    no number NOT NULL,
    title varchar2(3000) NOT NULL,
    content varchar2(4000) NOT NULL,
    category varchar2(50) NOT NULL,
    created_at date default sysdate,
    constraint pk_event_no primary key(no)
);

-- 이벤트 테이블 시퀀스
create sequence seq_event_no;


-- 이벤트 첨부파일 테이블
CREATE TABLE event_attachment (
	no number NOT NULL,
	event_no number NOT NULL,
	original_filename varchar2(2000) NULL,
	renamed_filename varchar2(2000) NULL,
    constraint pk_event_attachment_no primary key(no),
    constraint fk_event_attachment_event_no foreign key(event_no)
                                    references event
                                    on delete cascade
);
-- 영화 첨부파일 시퀀스
create sequence seq_event_attach_no;

-- 매점 테이블
create table store (
    name varchar2(100) not null,
    price number not null,
    original_filename varchar2(2000) NULL,
    renamed_filename varchar2(2000) NULL,
    snack_category varchar2(50) not null,
    constraint pk_store primary key(name)
);

-- 장바구니 테이블 생성
create table cart(
    no number not null,
    id varchar2(50) not null,
    store_name varchar2(100) not null,
    store_price number not null,
    store_count number default 1 not null,
    constraint pk_cart_no primary key(no),
    constraint fk_cart_member_id foreign key (id)
                            references member
                            on delete cascade,
    constraint fk_cart_store_name foreign key (store_name)
                            references store
                            on delete cascade
);

-- 장바구니 시퀀스 생성  
create sequence seq_cart_no;

create table store_order(
    no number not null,
    id varchar2(50) not null,
    pickup_zone varchar2(30),
    store_name varchar2(100) not null,
    store_price number not null,
    store_count number default 1 not null,
    order_date date default sysdate not null,
    constraint fk_store_order_member_id foreign key (id)
                            references member
                            on delete cascade,
    constraint fk_store_order_pickup_zone foreign key (pickup_zone)
                            references cinema
                            on delete cascade
);

create sequence seq_store_order_no;