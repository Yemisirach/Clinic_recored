CREATE DATABASE clinic;

CREATE TABLE patients (
id int GENERATED ALWAYS AS IDENTITY,
name VARCHAR(256),
date_of_birth DATE,
primary key (id) );


CREATE TABLE treatments (
id int GENERATED ALWAYS AS IDENTITY,
type VARCHAR(256),
name VARCHAR(256),
primary key (id) );


CREATE TABLE medical_histories (
	id int GENERATED ALWAYS AS IDENTITY,
	admitted_at TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
	patient_id int,
	status VARCHAR(256),
    primary key (id),
	foreign key (patient_id) REFERENCES patients (id)
);

CREATE TABLE medical_histories_treatments(
	treatment_id int REFERENCES treatments (id),
	medical_histories_id int REFERENCES medical_histories (id)	
); 

CREATE TABLE invoices (
	id int GENERATED ALWAYS AS IDENTITY,
	total_amount decimal,
	generated_at TIMESTAMP NOT NULL DEFAULT NOW(),
	payed_at TIMESTAMP,
	medical_histories_id int UNIQUE REFERENCES medical_histories (id),
	primary key (id)
);

CREATE TABLE invoice_items (
	id int GENERATED ALWAYS AS IDENTITY,
	unit_price decimal,
	quantity int,
	total_price decimal,
	invoice_id int REFERENCES invoices (id),
	treatment_id int REFERENCES treatments (id),
	PRIMARY KEY (id)
);