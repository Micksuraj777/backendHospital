INSERT INTO patient (name, phone_no, address, blood_group, gender, room, status, refer_doc, date_of_birth, age)
VALUES
('John Doe', '9876543210', '123 Main St', 'O+', 'Male', '101', 'Admitted', 'Dr. Smith', '1990-01-15', 34),
('Jane Smith', '9876543211', '456 Elm St', 'A-', 'Female', '102', 'Admitted', 'Dr. Adams', '1985-06-22', 39),
('Alice Brown', '9876543212', '789 Pine St', 'B+', 'Female', '103', 'Discharged', 'Dr. Johnson', '1992-03-12', 32),
('Bob Green', '9876543213', '321 Oak St', 'AB+', 'Male', '104', 'Admitted', 'Dr. Lee', '1987-11-30', 36),
('Charlie Black', '9876543214', '654 Maple St', 'O-', 'Male', '105', 'Admitted', 'Dr. Smith', '1995-02-18', 29),
('Daisy White', '9876543215', '987 Cedar St', 'A+', 'Female', '106', 'Admitted', 'Dr. Brown', '1989-07-14', 35),
('Eve Grey', '9876543216', '147 Birch St', 'B-', 'Female', '107', 'Admitted', 'Dr. Adams', '1993-05-20', 31),
('Frank Blue', '9876543217', '258 Poplar St', 'O+', 'Male', '108', 'Admitted', 'Dr. Johnson', '1982-12-05', 41),
('Grace Yellow', '9876543218', '369 Fir St', 'AB-', 'Female', '109', 'Discharged', 'Dr. Lee', '1991-08-29', 33),
('Henry Orange', '9876543219', '753 Ash St', 'A+', 'Male', '110', 'Admitted', 'Dr. Brown', '1983-10-10', 40);


INSERT INTO room (room_no, patient_id, type, status)
VALUES
(101, 1, 'Single', 'Occupied'),
(102, 2, 'Single', 'Occupied'),
(103, 3, 'Single', 'Vacant'),
(104, 4, 'Double', 'Occupied'),
(105, 5, 'Double', 'Occupied'),
(106, 6, 'Single', 'Occupied'),
(107, 7, 'Single', 'Occupied'),
(108, 8, 'Double', 'Occupied'),
(109, 9, 'Single', 'Vacant'),
(110, 10, 'Double', 'Occupied');


INSERT INTO medicine (medicine_id, name, dosage, manufacturer, price, status)
VALUES
(1, 'Paracetamol', '500mg', 'MedPharma', 20.50, 'Available'),
(2, 'Ibuprofen', '200mg', 'PharmaPlus', 35.00, 'Available'),
(3, 'Amoxicillin', '250mg', 'HealthCorp', 120.00, 'Out of Stock'),
(4, 'Cetirizine', '10mg', 'MediCure', 15.00, 'Available'),
(5, 'Metformin', '500mg', 'WellLife', 85.50, 'Available'),
(6, 'Atorvastatin', '40mg', 'PharmaWell', 95.75, 'Available'),
(7, 'Aspirin', '100mg', 'HealthCare', 10.50, 'Out of Stock'),
(8, 'Losartan', '50mg', 'GoodMed', 60.00, 'Available'),
(9, 'Omeprazole', '20mg', 'MediLife', 75.20, 'Available'),
(10, 'Azithromycin', '500mg', 'PharmaCare', 150.00, 'Available');


INSERT INTO doctor (doctor_id, name, department, phone_no, status)
VALUES
(1, 'Dr. Smith', 'Cardiology', '9123456789', 'Active'),
(2, 'Dr. Adams', 'Neurology', '9123456790', 'Active'),
(3, 'Dr. Johnson', 'Pediatrics', '9123456791', 'Active'),
(4, 'Dr. Lee', 'Orthopedics', '9123456792', 'On Leave'),
(5, 'Dr. Brown', 'Dermatology', '9123456793', 'Active'),
(6, 'Dr. Clark', 'General Medicine', '9123456794', 'Active'),
(7, 'Dr. Martinez', 'Cardiology', '9123456795', 'Active'),
(8, 'Dr. Thompson', 'Surgery', '9123456796', 'Active'),
(9, 'Dr. Wright', 'Oncology', '9123456797', 'Active'),
(10, 'Dr. Taylor', 'ENT', '9123456798', 'Active');
