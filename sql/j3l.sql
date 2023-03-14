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
values('admin', '1234', '어드민', '01012341234', 'admin@gmail.com', '19930803', 29, default);

update member set password='$2a$10$Tk1XefztVv5IGUVOY3KiA.yH4mSCQ8c/.ytxD.t/lF5.Z0BIDZrLu' where id='admin';

insert into authority
values('admin', 'ROLE_USER');

insert into authority
values('admin', 'ROLE_ADMIN');


--===============================
-- 영화관 데이터
--===============================
-- 서울
insert into cinema values('강남점', '서울', '서울특별시 강남구 강남대로 438 (역삼동, 스타플렉스)');
insert into cinema values('건대입구점', '서울', '서울특별시 광진구 아차산로30길 26');
-- 경기
insert into cinema values('광명역점', '경기', '경기도 광명시 일직동 514 GIDC B동 지하2층');
insert into cinema values('범계점', '경기', '경기도 안양시 동안구 동안로 119 (호계동, 뉴코아 아울렛 11층)');
-- 인천
insert into cinema values('송도타임스페이스', '인천', '인천광역시 연수구 하모니로 158 지하1층');
insert into cinema values('인천점', '인천', '인천광역시 남동구 예술로 198 (구월동, SEE"&"SEEE 4층)');
-- 강원
insert into cinema values('강릉점', '강원', '강원도 강릉시 경강로 2120 (옥천동, 씨네몰 6층)');
insert into cinema values('춘전점', '강원', '강원도 춘천시 지석로 80 (퇴계동, 투탑시티 3층)');
-- 대전/충청
insert into cinema values('대전점', '대전/충청', '대전광역시 중구 계백로 1700 (문화동, 세이2 6층)');
insert into cinema values('천안점', '대전/충청', '충청남도 천안시 동남구 명동길 47, 5층 (대흥동)');
-- 대구
insert into cinema values('대구점', '대구', '대구광역시 북구 칠성동2가 20-1 스펙트럼시티 4층');
-- 부산/울산
insert into cinema values('센텀시티점', '부산/울산', '부산광역시 해운대구 센텀남대로 35 (우동, 신세계센텀시티 7층)');
insert into cinema values('울산동구', '부산/울산', '울산광역시 동구 등대로50');
-- 경상
insert into cinema values('창원점', '경상', '경상남도 창원시 의창구 창원대로397번길 6 (팔용동, 뉴코아아울렛 8층)');
insert into cinema values('마산점', '경상', '경상남도 창원시 마산회원구 3·15대로 736 (합성동, 보보스존 8층)');
-- 광주/전라/제주
insert into cinema values('광주터미널', '광주/전라/제주', '광주광역시 서구 무진대로 904 (광천동, 유스퀘어 2층)');
insert into cinema values('제주점', '광주/전라/제주', '제주특별자치도 제주시 이도2동 메카플러스 3~7층');



--===============================
-- 영화 데이터 
--===============================

-- 액션
insert into movie values(1, '범죄도시1', 'ACTION', '강윤성', '마동석, 윤계상', '한국의 불법 주정물 거래와 마약 카르텔 간의 대치를 그린 범죄 액션 영화', 15);
insert into movie values(2, '범죄도시2', 'ACTION', '이상용', '마동석, 손석구', '한국의 대형 조직들이 서로 쟁탈하고 있는 대한민국 최대 광역단체인 신성파의 본거지를 둘러싸고 벌어지는 무력 충돌을 그리는 범죄 액션 영화', 15);
-- 코미디
insert into movie values(3, '극한직업', 'COMEDY', '강윤성', '류승룡, 이하나', '대한민국 최고의 마약반 요원들이 범죄조직을 잡기 위해 위장 치킨집을 만들어 일어나는 일들을 보여주는 영화', 15);
insert into movie values(4, '행오버', 'COMEDY', '토드 필립스', '브래들리 쿠퍼, 켄 정', '라스베이거스에서 벌어지는 4명의 친구들의 파티 이야기를 그린 코미디 영화', 15);
-- 로맨스
insert into movie values(5, '노트북', 'ROMANCE', '닉 카사베티스', '라이언 고슬링, 레이첼 맥아담스', '니콜라스 스파크스의 소설을 원작으로 한 이 영화는, 두 사람의 첫사랑과 그 후 재회를 그리는 감동적인 이야기의 영화', 15);
insert into movie values(6, '어바웃 타임', 'ROMANCE', '리처드 커티스', '돔놀 글리슨, 레이첼 맥아담스', '시간을 되돌릴 수 있는 능력을 가진 남자와 그의 연인 사이의 로맨스를 그린 영화', 12);
-- 애니메이션;
insert into movie values(7, '슬램덩크', 'ANIMATION', '이노우에 다케히코', '키무라 스바루', '전국 제패를 꿈꾸는 북산고 농구부 5인방의 꿈과 열정, 멈추지 않는 도전을 그린 영화', 12);
insert into movie values(8, '너의 이름은', '애ANIMATION니', '신카이 마코토', '카미키 류노스케', '하나의 소년과 소녀가 미스터리한 방법으로 서로의 몸과 삶을 교환하게 되면서 시작되는 내용을 그린 영화', 12);
-- 호러
insert into movie values(9, '곡성', 'HORROR', '나홍진', '황정민, 곽도원', '곡성의 한 마을에서 갑작스럽게 이상 사건이 연이어 일어나게 되면서 벌어지는 공포스러운 이야기를 그린 영화', 15);
insert into movie values(10, '겟 아웃', 'HORROR', '조던 필', '다니엘 칼루야', '흑인 청년 크리스가 백인 여자친구 로즈의 가족을 만나러 갔을 때 벌어지는 일을 그린 영화', 18);
-- 다큐멘터리
insert into movie values(11, '멘 온 와이어', 'DOCUMENTARY', '제임스 마쉬', '필립 프티', '1974년 8월 7일, 프랑스의 노트르담 대성당과 에펠탑 사이의 거리 200피트(61m) 높이에서 와이어를 건너는 것을 목표로 한 프랑스 출신 와이어 워커 필립 페티의 이야기를 다룬 다큐멘터리 영화', 12);
insert into movie values(12, '워낭소리', 'DOCUMENTARY', '이충렬', '최원균', '소로 농사를 짓는 시골 할아버지와 소의 이야기를 그리는 다큐멘터리 독립 영화', 12);
-- 드라마
insert into movie values(13, '행복을 찾아서', 'DRAMA', '가브리엘 무치노', '윌 스미스, 제이든 스미스', '실존 인물인 크리스 가드너의 삶의 여정을 따라가며, 그의 어려움과 자존심 상실, 가족과의 갈등 등을 그린 영화', 12);
insert into movie values(14, '블라인드 사이드', 'DRAMA', '존 리 핸콕', '산드라 블록', '대학 입시에 실패한 마이클 오어가, 좌절과 무기력함 속에서 우연히 만난 부유한 백인 가정의 가장인 리얼리에게 입양되며 벌어지게 된 이야기를 다룬 영화', 12);

select * from movie;


commit;


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
	phone char(11) NOT NULL,
	email varchar2(50) NOT NULL,
	birth char(8) NOT NULL,
	age	number	NOT NULL,
    enroll_date Date default sysdate not null,
    CONSTRAINT PK_MEMBER_ID PRIMARY KEY(ID)
);

--drop table member cascade constraints;

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
    running_time number not null,
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
	title varchar2(50) NOT NULL,
    classifyy varchar2(50),
    read_count number default 0,
    created_at date default sysdate,
	content varchar2(4000) NOT NULL,
    constraint pk_notice_no primary key(no)
);




select * from notice;


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

select * from faq;

-- 자주묻는 질문 시퀀스
create sequence seq_faq_no;
