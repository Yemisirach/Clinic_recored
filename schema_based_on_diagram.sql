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
