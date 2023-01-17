


  CREATE DATABASE CRAIGSLIST:

    \c CRAIGSLIST



    CREATE TABLE REGION(
        id SERIAL PRIMARY KEY,
        name TEXT
    );

    CREATE TABLE CATEGORY(
        id SERIAL PRIMARY KEY,
        name TEXT
    );

    CREATE TABLE USERS(
        id SERIAL PRIMARY KEY,
        user_name TEXT,
        password TEXT,
        preferred_region TEXT references REGION 
    );


    CREATE TABLE POST(
        id SERIAL PRIMARY KEY,
        location TEXT,
        title TEXT,
        text TEXT,
        user_id INTEGER references USERS,
        region_id INTEGER references REGION,
        category_id INTEGER references CATEGORY
    );