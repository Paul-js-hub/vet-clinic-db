-- create database -- clinic
CREATE DATABASE clinic;

-- create a patients table
CREATE TABLE patients (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    date_of_birth DATE,
    PRIMARY KEY(id)
);

-- create medical_histories table
CREATE TABLE medical_histories (
    id INT GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP,
    status VARCHAR(50),
    CONSTRAINT fk_patients FOREIGN KEY(patient_id) REFERENCES patients(id),
    PRIMARY KEY (id)
);

-- create invoices table
CREATE TABLE invoices (
    id INT GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    CONSTRAINT fk_medical_history FOREIGN KEY(medical_history_id) REFERENCES medical_histories (id), 
    PRIMARY KEY (id)
);

-- create invoice_items table
CREATE TABLE invoice_items (
    id INT GENERATED ALWAYS AS IDENTITY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    CONSTRAINT fk_invoices FOREIGN KEY(invoice_id) REFERENCES invoices (id),
    CONSTRAINT fk_treatment FOREIGN KEY(treatment_id) REFERENCES treatments (id)
    PRIMARY KEY (id)
);

-- create treatments table
CREATE TABLE treatments (
    id INT GENERATED ALWAYS AS IDENTITY,
    type VARCHAR(50),
    name VARCHAR(50),
    PRIMARY KEY (id)
);