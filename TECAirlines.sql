CREATE TABLE UNIVERSITY(
	uni_name varchar(60) PRIMARY KEY
)

CREATE TABLE AIRPORT(
	ap_name varchar(60) PRIMARY KEY,
	ap_short_name varchar(10) NOT NULL UNIQUE,
	iata_code char(3) NOT NULL,
	country_name varchar(30) NOT NULL
)

CREATE TABLE AIRPLANES(
	model varchar(20) NOT NULL,
	capacity int NOT NULL,
	fc_capacity int NOT NULL,
	plane_id int PRIMARY KEY
)

CREATE TABLE ADMIN(
	full_name varchar(50) NOT NULL,
	phone_numbr varchar(30) UNIQUE NOT NULL,
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

CREATE TABLE FLIGHT(
	flight_id varchar(10) PRIMARY KEY,
	depart_ap varchar(60) FOREIGN KEY
	REFERENCES AIRPORT(ap_name) NOT NULL,
	arrival_ap varchar(60) FOREIGN KEY
	REFERENCES AIRPORT(ap_name) NOT NULL,
	depart_date datetime NOT NULL,
	plane_id int FOREIGN KEY
	REFERENCES AIRPLANES(plane_id) NOT NULL,
	capacity int NOT NULL,
	status varchar(20) NOT NULL,
	normal_price int NOT NULL, 
	fc_price int NOT NULL, 
	seats_left int NOT NULL, 
	fc_seats_left int NOT NULL, 
	miles_price int NOT NULL
)

CREATE TABLE PAYMENT_METHOD(
	payment_id int PRIMARY KEY,
	username varchar(20) FOREIGN KEY
	REFERENCES CUSTOMER(username),
	card_number varchar(50) NOT NULL,
	security_code varchar(25) NOT NULL,
	exp_date date NOT NULL
)

CREATE TABLE RESERVATION(
	username varchar(20) FOREIGN KEY
	REFERENCES CUSTOMER(username),
	flight_id varchar(10) FOREIGN KEY
	REFERENCES FLIGHT(flight_id),
	type varchar(20) NOT NULL,
	is_first_class bit NOT NULL,
	people_flying int NOT NULL,
	total_cost int NOT NULL
	PRIMARY KEY(username, flight_id)
)

CREATE TABLE SALE(
	sale_id int identity(1,1) PRIMARY KEY,
	flight_id varchar(10) FOREIGN KEY 
	REFERENCES FLIGHT(flight_id),
	discount int NOT NULL,
	start_date date NOT NULL,
	exp_date date NOT NULL,
	img image NOT NULL
)

CREATE TABLE PRE_CHECKING(
	id_prechecking int identity(1,1) PRIMARY KEY,
	flight_id varchar(10) FOREIGN KEY 
	REFERENCES FLIGHT(flight_id),
	username varchar(20) FOREIGN KEY
	REFERENCES CUSTOMER(username),
)

CREATE TABLE PRE_CHECKING_SEATS(
		id_prechecking_seats int identity(1,1) PRIMARY KEY,
		id_prechecking int FOREIGN KEY
		REFERENCES PRE_CHECKING(id_prechecking),
		seat varchar(10) UNIQUE NOT NULL
)
