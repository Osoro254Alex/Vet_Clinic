CREATE TABLE patients (
 id SERIAL PRIMARY KEY,
 name VARCHAR(255) NOT NULL,
 date_of_birth DATE
);


CREATE TABLE medical_histories (
 id SERIAL PRIMARY KEY,
 admitted_at TIMESTAMP,
 patient_id INT REFERENCES patients(id),
status VARCHAR(255)
);

CREATE TABLE treatments (
 id SERIAL PRIMARY KEY,
 type VARCHAR(255),
 name VARCHAR(255)
);

CREATE TABLE invoices (
 id SERIAL PRIMARY KEY,
 total_amount DECIMAL,
 generated_at TIMESTAMP,
 payed_at TIMESTAMP,
 medical_history_id INT REFERENCES medical_histories(id),
);

CREATE TABLE invoice_items (
 id SERIAL PRIMARY KEY,
 unit_price DECIMAL,
 quantity INT,
 total_price DECIMAL,
 invoice_id INT REFERENCES invoices(id),
 treatment_id INT REFERENCES treatments(id),
);


CREATE TABLE medical_histories_treatments (
 id SERIAL PRIMARY KEY,
 treatment_id INT REFERENCES treatments(id),
 medical_history_id INT REFERENCES medical_histories(id)
);


-- indexing medical_histories on patient_id

CREATE INDEX patient_id_asc medical_histories(patient_id ASC);

-- indexing invoices table on medical_history_id

CREATE INDEX medical_history_id_asc invoices(medical_history_id ASC);

--indexing invoice_items table on invoice_id & treatment_id

CREATE INDEX invoice_id_asc invoice_items(invoice_id ASC);
CREATE INDEX treatment_id_asc invoice_items(treatment_id ASC);

--indexing medical_histories_treatments table on treatment_id & medical_history_id
CREATE INDEX treatment_id_asc medical_histories_treatments(treatment_id ASC);
CREATE INDEX medical_history_id_asc medical_histories_treatments(medical_history_id ASC);
