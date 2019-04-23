CREATE TABLE ADMIN(
	full_name varchar(50) NOT NULL,
	phone_numbr varchar(30) NOT NULL,
	email varchar(50) UNIQUE NOT NULL,
	username varchar(20) PRIMARY KEY, 
	password varchar(30) NOT NULL,
	role varchar(20) NOT NULL
)

CREATE TABLE CUSTOMER(
	full_name varchar(50) NOT NULL,
	phone_numbr varchar(50) UNIQUE NOT NULL,
	email varchar(50) UNIQUE NOT NULL,
	username varchar(20) PRIMARY KEY, 
	password varchar(50) NOT NULL,
	is_student bit NOT NULL,
)

CREATE TABLE STUDENTS(
	student_id int PRIMARY KEY,
	username varchar(20) FOREIGN KEY
	REFERENCES CUSTOMER(username),
	college_name varchar(60) FOREIGN KEY (college_name) 
	REFERENCES UNIVERSITY (uni_name),
	st_miles int NOT NULL,
)

INSERT INTO ADMIN VALUES ('Joseph Rodríguez Vargas', '13243546', 'j.rv@gmail.com', 'Josephda8', True)
INSERT INTO ADMIN VALUES ('Marck Castro Ramírez', '14253647', 'm.cr@gmail.com', 'Joseda8', True)
INSERT INTO ADMIN VALUES ('José Daniel Montoya Salazar', '88888888', 'jd.m@gmail.com', 'Joseda8', True)

INSERT INTO CUSTOMER VALUES ('José Daniel Montoya Salazar', '88888888', 'jd.m@gmail.com', 'Joseda8', True)
INSERT INTO CUSTOMER VALUES ('José Núñez Valverde', '12345678', 'jc.n@gmail.com', 'Joselml', True)
INSERT INTO CUSTOMER VALUES ('Sebastián Mora', '87654321', 's.m@gmail.com', 'ElectroTECBoy', True)
INSERT INTO CUSTOMER VALUES ('Marcelo Sánchez Solano', '66666666', 'm.ss@gmail.com', 'AzucarAmargo', True)

INSERT INTO CUSTOMER VALUES ('Kurt D', '12121515', 'smells_like_a_reference@gmail.com', 'Nevermind', False)
INSERT INTO CUSTOMER VALUES ('Billie Joe A', '87909090', 'one_dollar_bill@gmail.com', 'Dookie', False)
INSERT INTO CUSTOMER VALUES ('Jane Doe', '00000000', 'jane.d@gmail.com', 'SomeGirl', False)
INSERT INTO CUSTOMER VALUES ('John Doe', '00000001', 'john.d@gmail.com', 'SomeMen', False)

INSERT INTO STUDENTS VALUES (1, 'Joseda8', 'UNED', 0)
INSERT INTO STUDENTS VALUES (2, 'Joselml', 'ITCR', 0)
INSERT INTO STUDENTS VALUES (3, 'ElectroTECBoy', 'UCR', 0)
INSERT INTO STUDENTS VALUES (4, 'AzucarAmargo', 'UNA', 0)
