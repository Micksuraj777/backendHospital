CREATE TABLE patient (
  patient_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50),
  phone_no VARCHAR(10),
  address VARCHAR(100),
  blood_group CHAR(3),
  gender VARCHAR(20),
  room VARCHAR(30),
  status VARCHAR(15),
  refer_doc VARCHAR(20),
  date_of_join DATETIME DEFAULT CURRENT_TIMESTAMP,
  date_of_birth DATE,
  age INT
);

CREATE TABLE room (
  room_no INT NOT NULL PRIMARY KEY,
  patient_id INT,
  type VARCHAR(20),
  status VARCHAR(20),
  FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);

CREATE TABLE medicine (
  medicine_id INT NOT NULL PRIMARY KEY,
  name VARCHAR(20),
  dosage VARCHAR(20),
  manufacturer VARCHAR(20),
  price DECIMAL(10, 2),
  status VARCHAR(30)
);

CREATE TABLE doctor (
  doctor_id INT NOT NULL PRIMARY KEY,
  name VARCHAR(30),
  department VARCHAR(20),
  phone_no VARCHAR(15),
  status VARCHAR(15)
);