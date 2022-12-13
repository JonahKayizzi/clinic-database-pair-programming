CREATE DATABASE clinic;
CREATE TABLE patients (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE
);
CREATE TABLE medical_histories(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    admitted_at TIMESTAMP,
    patient_id INT REFERENCES patients(id) ON DELETE CASCADE,
    status VARCHAR(100)
);
CREATE TABLE treatments (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    type VARCHAR(100),
    name VARCHAR(100)
);

CREATE TABLE invoices(
id BIGSERIAL NOT NULL PRIMARY KEY,
total_amount DECIMAL,
generated_at TIMESTAMP,
payed_at TIMESTAMP,
medical_history_id INT REFERENCES medical_histories(id) ON DELETE CASCADE
);

CREATE TABLE invoice_items(
id BIGSERIAL NOT NULL PRIMARY KEY,
unit_price DECIMAL,
quantity INT,
total_price DECIMAL,
invoice_id INT REFERENCES invoices(id) ON DELETE CASCADE,
treatment_id INT REFERENCES treatments(id) ON DELETE CASCADE
);

CREATE TABLE medical_histories_treatments (
medical_history_id INT REFERENCES medical_histories(id) ON DELETE CASCADE,
treatment_id INT REFERENCES treatments(id) ON DELETE CASCADE
);

CREATE INDEX medical_histories_patient_id ON medical_histories(patient_id);
CREATE INDEX invoices_medical_history_id ON invoices(medical_history_id);
CREATE INDEX invoices_item_invoice_id ON invoice_items(invoice_id);
CREATE INDEX invoices_item_treatment_id ON invoices(medical_history_id);
CREATE INDEX medical_histories_treament_history_id ON medical_histories_treatments(medical_history_id);
CREATE INDEX medical_histories_treament_treatments_id ON medical_histories_treatments(treatment_id);


