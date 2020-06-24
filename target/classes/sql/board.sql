

-- oracle

--value.properties
--db.driverClass=oracle.jdbc.OracleDriver
--db.url=jdbc:oracle:thin:@127.0.0.1:1521:xe
--db.username=example
--db.password=5766

CREATE USER demo_spring IDENTIFIED BY 5766;
grant connect,resource,dba to demo_spring;

-- EXAMPLE.TB_BOARD definition
DROP TABLE "TB_BOARD";
CREATE TABLE "TB_BOARD" 
   (	
    "IDX" NUMBER NOT NULL, 
	"TITLE" VARCHAR2(100) NOT NULL, 
	"CONTENTS" CLOB NOT NULL, 
	"USER_ID" VARCHAR2(20), 
	"USER_NAME" VARCHAR2(50) DEFAULT '' NOT NULL, 
	"CNT" NUMBER DEFAULT 0 NOT NULL, 
	"REG_DATE" DATE DEFAULT sysdate NOT NULL, 
	"MOD_DATE" DATE DEFAULT sysdate NOT NULL, 
	 PRIMARY KEY ("IDX")
   );

-- EXAMPLE.TB_USERS definition
CREATE TABLE "TB_USERS" 
   (	
    "USER_ID" VARCHAR2(20) NOT NULL, 
	"PASSWORD" VARCHAR2(20) NOT NULL, 
	"USER_NAME" VARCHAR2(100) NOT NULL, 
	"EMAIL" VARCHAR2(150) NOT NULL, 
	"GENDER" VARCHAR2(10), 
	"CITY" VARCHAR2(30), 
	"USE_YN" VARCHAR2(1) DEFAULT 'Y' NOT NULL,
	"REG_DATE" DATE DEFAULT sysdate NOT NULL, 
	"MOD_DATE" DATE DEFAULT sysdate NOT NULL, 
	 PRIMARY KEY ("USER_ID")
   );

INSERT INTO TB_USERS 
(USER_ID,PASSWORD,USER_NAME,EMAIL,GENDER,CITY,USE_YN,REG_DATE,MOD_DATE) 
VALUES 
('admin','5766','조우성','albumbang@naver.com','남','서울','Y',sysdate,sysdate);

INSERT INTO TB_USERS 
(USER_ID,PASSWORD,USER_NAME,EMAIL,GENDER,CITY,USE_YN,REG_DATE,MOD_DATE) 
VALUES 
('webmaster','5766','조우성','albumbang@naver.com','여','부산','Y',sysdate,sysdate);

INSERT INTO TB_USERS 
(USER_ID,PASSWORD,USER_NAME,EMAIL,GENDER,CITY,USE_YN,REG_DATE,MOD_DATE) 
VALUES 
('woosung','5766','조우성','albumbang@naver.com','남','부산','Y',sysdate,sysdate);

INSERT INTO TB_USERS 
(USER_ID,PASSWORD,USER_NAME,EMAIL,GENDER,CITY,USE_YN,REG_DATE,MOD_DATE) 
VALUES 
('oracle','5766','오라클','albumbang@naver.com','남','부산','Y',sysdate,sysdate);

commit;





 -- mariadb

create database demo_spring;

create user 'maria'@'localhost' identified by '5766';

grant all privileges on demo_spring.* to maria@localhost; 

flush privileges;

drop table tb_board;
create table tb_board(
	idx int not null auto_increment,
	title varchar(200) not null,
	contents text not null,
	user_id varchar(20),
	user_name varchar(50) not null,
	cnt int not null default 0,
	reg_date timestamp not null default now(),
	mod_date timestamp not null default now(),
	primary key(idx)
);

create table tb_users(
	user_id varchar(20) not null,
	password varchar(20) not null,
	user_name varchar(100) not null,
	email varchar(150) not null,
	gender varchar(10) not null,
	city varchar(30) not null,
	use_yn varchar(2) not null default 'Y',
	reg_date timestamp not null default now(),
	mod_date timestamp not null default now(),
	primary key(user_id)
);

INSERT INTO TB_USERS 
(USER_ID,PASSWORD,USER_NAME,EMAIL,GENDER,CITY,USE_YN,REG_DATE,MOD_DATE) 
VALUES 
('admin','5766','조우성','albumbang@naver.com','남','서울','Y',now(),now());

INSERT INTO TB_USERS 
(USER_ID,PASSWORD,USER_NAME,EMAIL,GENDER,CITY,USE_YN,REG_DATE,MOD_DATE) 
VALUES 
('webmaster','5766','조우성','albumbang@naver.com','여','부산','Y',now(),now());

INSERT INTO TB_USERS 
(USER_ID,PASSWORD,USER_NAME,EMAIL,GENDER,CITY,USE_YN,REG_DATE,MOD_DATE) 
VALUES 
('woosung','5766','조우성','albumbang@naver.com','남','부산','Y',now(),now());






--PostgreSQL
--spring.datasource.driver-class-name=org.postgresql.Driver
--spring.datasource.url=jdbc:postgresql://localhost:5432/demo_spring
--spring.datasource.username=postgres
--spring.datasource.password=postgres

   
-- public.tb_users definition
-- Drop table
-- DROP TABLE tb_users;

CREATE TABLE tb_users (
	user_id varchar(20) not null,
	password varchar(20) not null,
	user_name varchar(100) not null,
	email varchar(150) not null,
	gender varchar(10) not null,
	city varchar(30) not null,
	use_yn varchar(2) not null default 'Y',
	reg_date timestamp not null default now(),
	mod_date timestamp not null default now(),
	CONSTRAINT tb_users_pkey PRIMARY KEY (user_id)
);
INSERT INTO TB_USERS 
(USER_ID,PASSWORD,USER_NAME,EMAIL,GENDER,CITY,USE_YN,REG_DATE,MOD_DATE) 
VALUES 
('admin','5766','조우성','albumbang@naver.com','남','서울','Y',now(),now());

INSERT INTO TB_USERS 
(USER_ID,PASSWORD,USER_NAME,EMAIL,GENDER,CITY,USE_YN,REG_DATE,MOD_DATE) 
VALUES 
('webmaster','5766','조우성','albumbang@naver.com','여','부산','Y',now(),now());

INSERT INTO TB_USERS 
(USER_ID,PASSWORD,USER_NAME,EMAIL,GENDER,CITY,USE_YN,REG_DATE,MOD_DATE) 
VALUES 
('woosung','5766','조우성','albumbang@naver.com','남','부산','Y',now(),now());


-- public.tb_board definition
-- Drop table
-- DROP TABLE public.tb_board;

CREATE TABLE tb_board (
	idx serial NOT NULL,
	title varchar(200) NOT NULL,
	contents text NULL,
	user_id varchar(20) NULL,
	user_name varchar(50) NULL,
	cnt int not null default 0,
	reg_date timestamp not null default now(),
	mod_date timestamp not null default now(),
	CONSTRAINT tb_board_pkey PRIMARY KEY (idx)
);


 
