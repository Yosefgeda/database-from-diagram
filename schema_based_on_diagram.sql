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

CREATE TABLE invoice_items(
    id INTEGER PRIMARY KEY, 
    unit_price DECIMAL, 
    quantity INTEGER, 
    total_price DECIMAL, 
    invoice_id INTEGER, 
    treatment_id INTEGER, 
    FOREIGN KEY(invoice_id) REFERENCES invoices(id), 
    FOREIGN KEY (treatment_id) REFERENCES treatment(id)
);

CREATE INDEX invoice_items_asc ON invoice_items (invoice_id ASC);
CREATE INDEX invoice_items_treatment_asc ON invoice_items (treatment_id ASC);

CREATE TABLE invoices(
    id INTEGER PRIMARY KEY, 
    total_amount DECIMAL, 
    generated_at TIMESTAMP, 
    payed_at TIMESTAMP, 
    medical_history_id INTEGER,
    FOREIGN KEY(medical_history_id) REFERENCES
    medical_histories(id)
);

CREATE INDEX invoices_medical_history ON invoices (medical_history_id ASC);

