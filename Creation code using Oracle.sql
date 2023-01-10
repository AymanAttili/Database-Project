-- tables
-- Table: Bill
CREATE TABLE Bill (
    bill_id varchar(10)  NOT NULL,
    patient_id varchar(10)  NOT NULL,
    prescription_id varchar(10)  NULL,
    treatment_id varchar(10) NOT NULL,
    total_cost integer  NOT NULL,
    CONSTRAINT Bill_pk PRIMARY KEY (bill_id)
) ;

-- Table: Doctor
CREATE TABLE Doctor (
    doctor_id varchar(10)  NOT NULL,
    name varchar(50)  NOT NULL,
    birth_date date  NOT NULL,
    gender varchar(6)  NOT NULL,
    city varchar(50)  NOT NULL,
    specialty varchar(50)  NOT NULL,
    phone Varchar(15)  NOT NULL,
    CONSTRAINT Doctor_pk PRIMARY KEY (doctor_id)
) ;

-- Table: Medi_Pres
CREATE TABLE Medi_Pres (
    medicine_id varchar(20)  NOT NULL,
    prescription_id varchar(10)  NOT NULL,
    details varchar(50)  NOT NULL,
    quantity int  NOT NULL,
    CONSTRAINT Medi_Pres_pk PRIMARY KEY (medicine_id,prescription_id)
) ;

-- Table: Medicine
CREATE TABLE Medicine (
    medicine_id varchar(20)  NOT NULL,
    name varchar(50)  NOT NULL,
    cost int  NOT NULL,
    company varchar(50)  NOT NULL,
    CONSTRAINT Medicine_pk PRIMARY KEY (medicine_id)
) ;

-- Table: Patient
CREATE TABLE Patient (
    patient_id varchar(10)  NOT NULL,
    name varchar(50)  NOT NULL,
    birth_date date  NULL,
    gender varchar(6)  NOT NULL,
    city varchar(50)  NULL,
    phone varchar(15)  NULL,
    CONSTRAINT Patient_pk PRIMARY KEY (patient_id)
) ;

-- Table: Prescription
CREATE TABLE Prescription (
    prescription_id varchar(10)  NOT NULL,
    patient_id varchar(10)  NOT NULL,
    presreption_date date  NOT NULL,
    CONSTRAINT Prescription_pk PRIMARY KEY (prescription_id)
) ;

-- Table: Room
CREATE TABLE Room (
    room_id varchar(10)  NOT NULL,
    room_type varchar(50)  NOT NULL,
    status char(1)  NOT NULL,
    CONSTRAINT Room_pk PRIMARY KEY (room_id)
) ;

-- Table: Treatment
CREATE TABLE Treatment (
    treatment_id varchar(10)  NOT NULL,
    patient_id varchar(10)  NOT NULL,
    doctor_id varchar(10)  NOT NULL,
    room_id varchar(10)  NOT NULL,
    survey_date date  NOT NULL,
    type varchar(50)  NOT NULL,
    cost int  NOT NULL,
    CONSTRAINT Treatment_pk PRIMARY KEY (treatment_id)
) ;

-- foreign keys
-- Reference: Bill_Patient (table: Bill)
ALTER TABLE Bill ADD CONSTRAINT Bill_Patient
    FOREIGN KEY (patient_id)
    REFERENCES Patient (patient_id);

-- Reference: Bill_Prescription (table: Bill)
ALTER TABLE Bill ADD CONSTRAINT Bill_Prescription
    FOREIGN KEY (prescription_id)
    REFERENCES Prescription (prescription_id);

-- Reference: Bill_Treatment (table: Bill)
ALTER TABLE Bill ADD CONSTRAINT Bill_Treatment
    FOREIGN KEY (treatment_id)
    REFERENCES Treatment (treatment_id);

-- Reference: Medi_Pres_Medicine (table: Medi_Pres)
ALTER TABLE Medi_Pres ADD CONSTRAINT Medi_Pres_Medicine
    FOREIGN KEY (medicine_id)
    REFERENCES Medicine (medicine_id);

-- Reference: Medi_Pres_Prescription (table: Medi_Pres)
ALTER TABLE Medi_Pres ADD CONSTRAINT Medi_Pres_Prescription
    FOREIGN KEY (prescription_id)
    REFERENCES Prescription (prescription_id);

-- Reference: Prescription_Patient (table: Prescription)
ALTER TABLE Prescription ADD CONSTRAINT Prescription_Patient
    FOREIGN KEY (patient_id)
    REFERENCES Patient (patient_id);

-- Reference: Survey_Doctor (table: Treatment)
ALTER TABLE Treatment ADD CONSTRAINT Survey_Doctor
    FOREIGN KEY (doctor_id)
    REFERENCES Doctor (doctor_id);

-- Reference: Survey_Patient (table: Treatment)
ALTER TABLE Treatment ADD CONSTRAINT Survey_Patient
    FOREIGN KEY (patient_id)
    REFERENCES Patient (patient_id);

-- Reference: Survey_Room (table: Treatment)
ALTER TABLE Treatment ADD CONSTRAINT Survey_Room
    FOREIGN KEY (room_id)
    REFERENCES Room (room_id);
