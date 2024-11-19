DROP DATABASE IF EXISTS EnergyConsumption_dw;

CREATE DATABASE EnergyConsumption_dw;

USE EnergyConsumption_dw;

CREATE TABLE dim_location (
    LOCATION_ID INT,
    REGION VARCHAR(255),
    MUNICIPALITY VARCHAR(255),
    PARISH VARCHAR(255),
    PRIMARY KEY (LOCATION_ID)
);

CREATE TABLE dim_time (
    TIME_ID INT,
    YEAR_ID INT,
    SEASON ENUM('Winter', 'Spring', 'Summer', 'Autumn'),
    SEASON_ID INT,
    MONTH_ID INT,
    PRIMARY KEY (TIME_ID)
);

CREATE TABLE fact_energy_consumption (
    TIME_ID INT,
    LOCATION_ID INT,
    ENERGY_CONSUMPTION DECIMAL(10,2),
    PRIMARY KEY (TIME_ID, LOCATION_ID),
    FOREIGN KEY (TIME_ID) REFERENCES dim_time (TIME_ID),
    FOREIGN KEY (LOCATION_ID) REFERENCES dim_location (LOCATION_ID)
);

