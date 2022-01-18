CREATE TABLE patients (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR (255),
  date_of_birth DATE,
	PRIMARY KEY(id)
);

CREATE TABLE medical_histories (
  id INT GENERATED ALWAYS AS IDENTITY,
  admitted_at TIMESTAMP,
  patient_id INT,
  status VARCHAR (50),
  FOREIGN KEY (patient_id) REFERENCES patients(id),
	PRIMARY KEY(id)

);

CREATE TABLE treatments (
 id INT GENERATED ALWAYS AS IDENTITY,
  type VARCHAR (50),
  name VARCHAR (100),
	PRIMARY KEY(id)
);

CREATE TABLE invoices (
  id INT GENERATED ALWAYS AS IDENTITY,
  total_amount decimal,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT,
  FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id),
	PRIMARY KEY(id)
);

CREATE TABLE invoice_items (
  id INT GENERATED ALWAYS AS IDENTITY,
  unit_price decimal,
  quantity INT,
  total_price decimal,
  invoce_id int,
  treatment_id int,
  FOREIGN KEY (invoce_id) REFERENCES invoices(id),
  FOREIGN KEY (treatment_id) REFERENCES treatments(id),
	PRIMARY KEY(id)
);

CREATE TABLE medical_historie_treatments (
  medical_history_id int,
  treatment_id int,
  PRIMARY KEY( medical_history_id, treatment_id),
  FOREIGN KEY (treatment_id) REFERENCES treatments(id),
  FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id)
);

CREATE INDEX ON medical_histories(patient_id);
CREATE INDEX ON invoice_items(treatment_id);
CREATE INDEX ON invoices(medical_history_id);
CREATE INDEX ON invoice_items (invoice_id);
CREATE INDEX ON medical_historie_treatments (medical_history_id);
CREATE INDEX ON medical_historie_treatments (treatment_id);