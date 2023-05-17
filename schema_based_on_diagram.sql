CREATE TABLE patients (
    id INTEGER, 
    name VARCHAR, 
    date_of_birth DATE, 
    PRIMARY KEY (id)
);

CREATE TABLE medical_histories(
    id INTEGER, admitted_at TIMESTAMP, 
    patient_id INTEGER, 
    status VARCHAR, 
    FOREIGN KEY (patient_id) REFERENCES patients(id)
);

CREATE INDEX medical_histories_asc ON medical_histories (patient_id ASC);

CREATE TABLE treatments(
    id INTEGER, 
    type VARCHAR, 
    name VARCHAR, 
    medical_histories_id INTEGER, PRIMARY KEY(id), 
    FOREIGN KEY(medical_histories_id) REFERENCES medical_histories(id)
);

