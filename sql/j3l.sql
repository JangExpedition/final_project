-- 회원테이블
CREATE TABLE member (
	id varchar2(50)	NOT NULL,
	password varchar2(300) NOT NULL,
	name varchar2(30) NOT NULL,
	phone varchar2(20) NOT NULL,
	email varchar2(50) NOT NULL,
	birth Date NOT NULL,
	member_role	char(1) DEFAULT 'U' NOT NULL,
	age	number	NOT NULL
);

ALTER TABLE `member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`id`
);

-- 예약 테이블
CREATE TABLE reservation (
    no VARCHAR(255)	NOT NULL,
	id varchar2(50) NOT NULL,
	schedule_no number NOT NULL
);

ALTER TABLE `reservation` ADD CONSTRAINT `PK_RESERVATION` PRIMARY KEY (
	`no`
);

-- 영화관 테이블
CREATE TABLE cinema (
	name varchar2(300) NOT NULL,
	location varchar2(30) NOT NULL,
	address varchar2(3000) NOT NULL
);

ALTER TABLE `cinema` ADD CONSTRAINT `PK_CINEMA` PRIMARY KEY (
	`name`
);

-- 상영관 테이블
CREATE TABLE theater (
	no	number NOT NULL,
	theater_no number NOT NULL,
	cinema_name	varchar2(300) NOT NULL
);

ALTER TABLE `theater` ADD CONSTRAINT `PK_THEATER` PRIMARY KEY (
	`no`
);

-- 상영시간표 테이블
CREATE TABLE scheduel (
	no number NOT NULL,
	movie_no number	NOT NULL,
	theater_no number NOT NULL,
    start_time Date	NOT NULL,
	end_time Date NOT NULL
);

ALTER TABLE `scheduel` ADD CONSTRAINT `PK_SCHEDUEL` PRIMARY KEY (
	`no`
);

-- 영화 테이블
CREATE TABLE movie (
    no number NOT NULL,
	title varchar2(100)	NOT NULL,
	genre varchar2(30) NOT NULL,
	director varchar2(50) NOT NULL,
	actors varchar2(3000) NOT NULL,
	synopsis varchar2(4000)	NOT NULL,
	limit_age number NOT NULL
);

ALTER TABLE `movie` ADD CONSTRAINT `PK_MOVIE` PRIMARY KEY (
	`no`
);

-- 영화 첨부파일 테이블
CREATE TABLE movie_attachment (
	no number NOT NULL,
	movie_no number NOT NULL,
	original_filename varchar2(2000) NULL,
	renamed_filename varchar2(2000) NULL
);

ALTER TABLE `movie_attachment` ADD CONSTRAINT `PK_MOVIE_ATTACHMENT` PRIMARY KEY (
	`no`
);

-- 간식 테이블
CREATE TABLE snack (
	no number NOT NULL,
	name varchar2(50) NOT NULL,
	price number NOT NULL,
	information varchar2(1000) NOT NULL,
	category varchar2(50) NOT NULL,
	original_filename varchar2(2000) NULL,
	renamed_filename varchar2(2000) NULL
);

ALTER TABLE `snack` ADD CONSTRAINT `PK_SNACK` PRIMARY KEY (
	`no`
);

-- 문의게시판 테이블
CREATE TABLE question (
	no number	NOT NULL,
	id varchar2(50)	NOT NULL,
	title varchar2(1000)	NOT NULL,
	content varchar2(4000)	NOT NULL,
	reg_date Date DEFAULT sysdate NOT NULL
);

ALTER TABLE `question` ADD CONSTRAINT `PK_QUESTION` PRIMARY KEY (
	`no`
);

-- 문의게시판 첨부파일 테이블
CREATE TABLE question_attachment (
	no number NOT NULL,
	q_no number NOT NULL,
	original_filename varchar2(2000) NULL,
	renamed_filename varchar2(2000) NULL
);

ALTER TABLE `question_attachment` ADD CONSTRAINT `PK_QUESTION_ATTACHMENT` PRIMARY KEY (
	`no`
);

-- 문의게시판 댓글 테이블
CREATE TABLE comment (
	no number NOT NULL,
	q_no number	NOT NULL,
	comment varchar2(4000) NOT NULL,
	reg_date Date DEFAULT sysdate NOT NULL,
	id varchar2(50) NOT NULL
);

ALTER TABLE `comment` ADD CONSTRAINT `PK_COMMENT` PRIMARY KEY (
	`no`
);

-- 공지사항 테이블
CREATE TABLE notice (
	no number NOT NULL,
	id varchar2(50)	NOT NULL,
	title varchar2(50) NOT NULL,
	content varchar2(4000) NOT NULL
);

ALTER TABLE `notice` ADD CONSTRAINT `PK_NOTICE` PRIMARY KEY (
	`no`
);

-- 자주묻는 게시판 테이블
CREATE TABLE FAQ (
	no number	NOT NULL,
	title varchar2(200)	NOT NULL,
	content varchar2(4000) NOT NULL
);

ALTER TABLE `FAQ` ADD CONSTRAINT `PK_FAQ` PRIMARY KEY (
	`no`
);

-- 블랙리스트 테이블
CREATE TABLE blackList (
	id varchar2(50)	NOT NULL,
	password varchar2(300)	NOT NULL,
	name varchar2(30) NOT NULL,
	phone varchar2(20) NOT NULL,
	email varchar2(50) NOT NULL,
	birth Date	NOT NULL,
	member_role char(1) DEFAULT U NOT NULL,
	age number	NOT NULL
);

ALTER TABLE `blackList` ADD CONSTRAINT `PK_BLACKLIST` PRIMARY KEY (
	`id`
);

