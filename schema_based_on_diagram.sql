CREATE DATABASE hospital;

CREATE TABLE patients (
  id INT PRIMARY IDENTITY,
  name VARCHAR (255),
  date_of_birth DATE
);

CREATE TABLE medical_histories (
  id INT PRIMARY IDENTITY,
  admitted_at TIMESTAMP,
  patient_id INT,
  status VARCHAR (50)
)