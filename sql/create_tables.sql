CREATE TABLE MembershipPlans (
    membership_plan_id INT PRIMARY KEY,
    plan_type VARCHAR(20) NOT NULL,
    agreement_name VARCHAR(150),
    discount_percentage DECIMAL(5,2) DEFAULT 0.00
);

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    national_id VARCHAR(20) NOT NULL UNIQUE,
    full_name VARCHAR(150) NOT NULL,
    medical_history TEXT,
    membership_plan_id INT,
    FOREIGN KEY (membership_plan_id) REFERENCES MembershipPlans(membership_plan_id)
);

CREATE TABLE PatientPhones (
    phone_id INT PRIMARY KEY,
    patient_id INT,
    phone_number VARCHAR(20),
    phone_type VARCHAR(30),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

CREATE TABLE CurrentAccounts (
    account_id INT PRIMARY KEY,
    patient_id INT UNIQUE,
    total_balance DECIMAL(12,2),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

CREATE TABLE Locations (
    location_id INT PRIMARY KEY,
    location_name VARCHAR(100),
    city VARCHAR(100),
    street VARCHAR(100),
    street_number VARCHAR(20)
);

CREATE TABLE Offices (
    office_id INT PRIMARY KEY,
    location_id INT,
    office_number VARCHAR(20),
    FOREIGN KEY (location_id) REFERENCES Locations(location_id)
);

CREATE TABLE Equipment (
    equipment_id INT PRIMARY KEY,
    office_id INT,
    serial_number VARCHAR(100),
    equipment_type VARCHAR(100),
    last_maintenance_date DATE,
    FOREIGN KEY (office_id) REFERENCES Offices(office_id)
);

CREATE TABLE Dentists (
    dentist_id INT PRIMARY KEY,
    full_name VARCHAR(150),
    main_specialty VARCHAR(100)
);

CREATE TABLE Treatments (
    treatment_id INT PRIMARY KEY,
    treatment_name VARCHAR(150),
    cost DECIMAL(10,2)
);

CREATE TABLE DentistTreatmentCapabilities (
    dentist_id INT,
    treatment_id INT,
    PRIMARY KEY (dentist_id, treatment_id),
    FOREIGN KEY (dentist_id) REFERENCES Dentists(dentist_id),
    FOREIGN KEY (treatment_id) REFERENCES Treatments(treatment_id)
);

CREATE TABLE DentistSchedules (
    schedule_id INT PRIMARY KEY,
    dentist_id INT,
    location_id INT,
    day_of_week VARCHAR(15),
    start_time TIME,
    end_time TIME,
    FOREIGN KEY (dentist_id) REFERENCES Dentists(dentist_id),
    FOREIGN KEY (location_id) REFERENCES Locations(location_id)
);

CREATE TABLE ClinicalHistories (
    clinical_history_id INT PRIMARY KEY,
    patient_id INT UNIQUE,
    created_at DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    clinical_history_id INT,
    patient_id INT,
    dentist_id INT,
    location_id INT,
    appointment_date DATE,
    FOREIGN KEY (clinical_history_id) REFERENCES ClinicalHistories(clinical_history_id),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (dentist_id) REFERENCES Dentists(dentist_id),
    FOREIGN KEY (location_id) REFERENCES Locations(location_id)
);

CREATE TABLE TreatmentRecords (
    treatment_record_id INT PRIMARY KEY,
    clinical_history_id INT,
    appointment_id INT,
    patient_id INT,
    dentist_id INT,
    treatment_id INT,
    start_date DATE,
    is_completed BOOLEAN,
    FOREIGN KEY (clinical_history_id) REFERENCES ClinicalHistories(clinical_history_id),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (dentist_id) REFERENCES Dentists(dentist_id),
    FOREIGN KEY (treatment_id) REFERENCES Treatments(treatment_id)
);
