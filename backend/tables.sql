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

DELIMITER $$

CREATE PROCEDURE ManagePatient(
    IN action_type VARCHAR(10),
    IN p_patient_id INT,
    IN p_name VARCHAR(50),
    IN p_phone_no VARCHAR(10),
    IN p_address VARCHAR(100),
    IN p_blood_group CHAR(3),
    IN p_gender VARCHAR(20),
    IN p_room VARCHAR(30),
    IN p_status VARCHAR(15),
    IN p_refer_doc VARCHAR(20),
    IN p_date_of_birth DATE,
    IN p_age INT
)
BEGIN
    IF action_type = 'ADD' THEN
        INSERT INTO patient (name, phone_no, address, blood_group, gender, room, status, refer_doc, date_of_birth, age)
        VALUES (p_name, p_phone_no, p_address, p_blood_group, p_gender, p_room, p_status, p_refer_doc, p_date_of_birth, p_age);
    
    ELSEIF action_type = 'UPDATE' THEN
        UPDATE patient
        SET name = p_name,
            phone_no = p_phone_no,
            address = p_address,
            blood_group = p_blood_group,
            gender = p_gender,
            room = p_room,
            status = p_status,
            refer_doc = p_refer_doc,
            date_of_birth = p_date_of_birth,
            age = p_age
        WHERE patient_id = p_patient_id;

    ELSEIF action_type = 'DELETE' THEN
        DELETE FROM patient WHERE patient_id = p_patient_id;
    
    END IF;
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE ManageDoctor(
    IN action_type VARCHAR(10),
    IN p_doctor_id INT,
    IN p_name VARCHAR(30),
    IN p_department VARCHAR(20),
    IN p_phone_no VARCHAR(15),
    IN p_status VARCHAR(15)
)
BEGIN
    IF action_type = 'ADD' THEN
        INSERT INTO doctor (doctor_id, name, department, phone_no, status)
        VALUES (p_doctor_id, p_name, p_department, p_phone_no, p_status);

    ELSEIF action_type = 'UPDATE' THEN
        UPDATE doctor
        SET name = p_name,
            department = p_department,
            phone_no = p_phone_no,
            status = p_status
        WHERE doctor_id = p_doctor_id;

    ELSEIF action_type = 'DELETE' THEN
        DELETE FROM doctor WHERE doctor_id = p_doctor_id;

    END IF;
END $$

DELIMITER ;
