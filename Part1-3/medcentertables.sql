


  CREATE DATABASE medcenter:

    \c medcenter


    
    CREATE TABLE DOCTORS (
        id SERIAL PRIMARY KEY,
        name TEXT NOT NULL,
        specialty TEXT NOT NULL
    );



    CREATE TABLE PATIENTS(
        id SERIAL PRIMARY KEY,
        name TEXT NOT NULL,
        insurance INTEGER,
        date_of_birth DATE
    );



    CREATE TABLE VISITS(
        id SERIAL PRIMARY KEY,
        doctor_id INTEGER references DOCTORS,
        patients_id INTEGER references PATIENTS,
        date DATE
    );


    CREATE TABLE DIAGNOSIS(
        id SERIAL PRIMARY KEY,
        visit_id INTEGER references VISITS,
        disease_id INTEGER references DISEASES,
        additional_information TEXT
    );



    CREATE TABLE DISEASES(
        id SERIAL PRIMARY KEY,
        name TEXT,
        description TEXT
    )