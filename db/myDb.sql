DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

/******************************************************************************
* Author:
*  Justin Hurst
* Description:
*  Ponder04 Assignment. This file establishes some basic data for my incident 
*  management system database.
******************************************************************************/
CREATE TABLE public.sites (
   site_id SERIAL PRIMARY KEY,		
   site_label VARCHAR(100) NOT NULL,
   site_active BOOLEAN NOT NULL 
);

CREATE TABLE public.departments (
   department_id SERIAL PRIMARY KEY,		
   department_label VARCHAR(100) NOT NULL,
   department_active BOOLEAN NOT NULL 
);

CREATE TABLE public.consequence_types (
   consequence_type_id SERIAL PRIMARY KEY,		
   consequence_type_label VARCHAR(20) NOT NULL,
   consequence_type_active BOOLEAN NOT NULL 
);

CREATE TABLE public.event_types (
   event_type_id SERIAL PRIMARY KEY,		
   event_type_label VARCHAR(20) NOT NULL,
   event_type_active BOOLEAN NOT NULL 
);

CREATE TABLE public.severities (
   severity_id SERIAL PRIMARY KEY,		
   severity_label VARCHAR(20) NOT NULL,
   severity_active BOOLEAN NOT NULL 
);

CREATE TABLE public.statuses (
   status_id SERIAL PRIMARY KEY,		
   status_label VARCHAR(20) NOT NULL,
   status_active BOOLEAN NOT NULL 
);

CREATE TABLE public.temperature_uoms (
   temperature_uom_id SERIAL PRIMARY KEY,		
   temperature_uom_label VARCHAR(20) NOT NULL,
   temperature_uom_active BOOLEAN NOT NULL 
);

CREATE TABLE public.weathers (
   weather_id SERIAL PRIMARY KEY,		
   weather_label VARCHAR(20) NOT NULL,
   weather_active BOOLEAN NOT NULL 
);

CREATE TABLE public.lightings (
   lighting_id SERIAL PRIMARY KEY,		
   lighting_label VARCHAR(20) NOT NULL,
   lighting_active BOOLEAN NOT NULL 
);

CREATE TABLE public.operation_types (
   operation_type_id SERIAL PRIMARY KEY,		
   operation_type_label VARCHAR(50) NOT NULL,
   operation_type_active BOOLEAN NOT NULL 
);

CREATE TABLE public.activity_types (
   activity_type_id SERIAL PRIMARY KEY,		
   activity_type_label VARCHAR(50) NOT NULL,
   activity_type_active BOOLEAN NOT NULL 
);

CREATE TABLE public.medical_classifications (
   medical_classification_id SERIAL PRIMARY KEY,		
   medical_classification_label VARCHAR(50) NOT NULL,
   medical_classification_active BOOLEAN NOT NULL 
);

CREATE TABLE public.company_names (
   company_name_id SERIAL PRIMARY KEY,		
   company_name_label VARCHAR(50) NOT NULL,
   company_name_active BOOLEAN NOT NULL 
);

CREATE TABLE public.equipments (
   equipment_id SERIAL PRIMARY KEY,		
   equipment_label VARCHAR(100) NOT NULL,
   equipment_active BOOLEAN NOT NULL 
);

CREATE TABLE public.personnel_types (
   personnel_type_id SERIAL PRIMARY KEY,		
   personnel_type_label VARCHAR(50) NOT NULL,
   personnel_type_active BOOLEAN NOT NULL 
);

CREATE TABLE public.injury_natures (
   injury_nature_id SERIAL PRIMARY KEY,		
   injury_nature_label VARCHAR(50) NOT NULL,
   injury_nature_active BOOLEAN NOT NULL 
);

CREATE TABLE public.injury_primary_body_parts (
   injury_primary_body_part_id SERIAL PRIMARY KEY,		
   injury_primary_body_part_label VARCHAR(50) NOT NULL,
   injury_primary_body_part_active BOOLEAN NOT NULL 
);

CREATE TABLE public.users (
   user_id SERIAL PRIMARY KEY,		
   user_name VARCHAR(100) NOT NULL UNIQUE,
   user_password VARCHAR(100) NOT NULL,
   user_name_first VARCHAR(100) NOT NULL,
   user_name_last VARCHAR(100) NOT NULL,
   user_name_middle VARCHAR(100),
   user_active BOOLEAN NOT NULL  
);

CREATE TABLE public.events (
   event_id SERIAL PRIMARY KEY,		
   date_occurred DATE NOT NULL,
   date_reported DATE,
   date_entered DATE NOT NULL,
   description_short VARCHAR(500) NOT NULL,
   description_long VARCHAR(4000) NOT NULL,
   site_id INT NOT NULL REFERENCES public.sites(site_id),
   department_id INT NOT NULL REFERENCES public.departments(department_id),
   event_type_id INT NOT NULL REFERENCES public.event_types(event_type_id),
   severity_actual_id INT REFERENCES public.severities(severity_id),
   severity_probable_id INT REFERENCES public.severities(severity_id),
   event_status_id INT NOT NULL REFERENCES public.statuses(status_id),
   temperature INT,
   temperature_uom_id INT REFERENCES public.temperature_uoms(temperature_uom_id),
   weather_id INT REFERENCES public.weathers(weather_id),
   lighting_id INT REFERENCES public.lightings(lighting_id),
   operation_type_id INT REFERENCES public.operation_types(operation_type_id),
   activity_type_id INT REFERENCES public.activity_types(activity_type_id),
   reporting_boudnary BOOLEAN,
   entered_by_id INT NOT NULL REFERENCES public.users(user_id),
   reported_by_id INT REFERENCES public.users(user_id),
   qa_qc_by_id INT REFERENCES public.users(user_id),
   equipment_id INT REFERENCES public.users(user_id),  
   consequence_type_id INT REFERENCES public.consequence_types(consequence_type_id)
);

CREATE TABLE public.injuries (
   injury_id SERIAL PRIMARY KEY,
   event_id INT NOT NULL REFERENCES public.events(event_id),
   injured_ill_personnel_type_id INT REFERENCES public.personnel_types(personnel_type_id),
   work_related BOOLEAN,
   medical_classification_id INT REFERENCES public.medical_classifications(medical_classification_id),
   injury_description VARCHAR(2000),
   injury_nature_id INT REFERENCES public.injury_natures(injury_nature_id),
   injury_primary_body_part_id INT REFERENCES public.injury_primary_body_parts(injury_primary_body_part_id),
   injury_lost_days INT,
   injury_lost_days_start_date DATE,
   company_name_id INT REFERENCES public.company_names(company_name_id),
   injury_status_id INT NOT NULL REFERENCES public.statuses(status_id)
);

/*CREATE USER ims_user WITH PASSWORD 'ims_pass';*/
GRANT SELECT, INSERT, UPDATE ON all tables in schema public TO ims_user;

INSERT INTO sites (site_label, site_active) VALUES ('Budapest Office', true); 
INSERT INTO sites (site_label, site_active) VALUES ('Chicago Office', true); 
INSERT INTO sites (site_label, site_active) VALUES ('Cleavland Office', true); 
INSERT INTO sites (site_label, site_active) VALUES ('Dallas Office', true); 
INSERT INTO sites (site_label, site_active) VALUES ('Houston Office', true); 
INSERT INTO sites (site_label, site_active) VALUES ('Lagos Office', true); 
INSERT INTO sites (site_label, site_active) VALUES ('London Office', true); 
INSERT INTO sites (site_label, site_active) VALUES ('Los Angeles Office', true); 
INSERT INTO sites (site_label, site_active) VALUES ('Miami Office', true); 
INSERT INTO sites (site_label, site_active) VALUES ('Midland Office', true); 
INSERT INTO sites (site_label, site_active) VALUES ('New York Office', true); 
INSERT INTO sites (site_label, site_active) VALUES ('Oakland Office', true); 
INSERT INTO sites (site_label, site_active) VALUES ('Oklahoma City Office', true); 
INSERT INTO sites (site_label, site_active) VALUES ('Paris Office', true); 
INSERT INTO sites (site_label, site_active) VALUES ('Pheonix Office', true); 
INSERT INTO sites (site_label, site_active) VALUES ('San Ramon Office', true); 
INSERT INTO sites (site_label, site_active) VALUES ('Seoul Office', true); 
INSERT INTO sites (site_label, site_active) VALUES ('Singapore Office', true); 
INSERT INTO sites (site_label, site_active) VALUES ('St. Louis Office', true); 
INSERT INTO sites (site_label, site_active) VALUES ('Warsaw Office', true); 

INSERT INTO departments (department_label, department_active) VALUES ('Drilling', true);
INSERT INTO departments (department_label, department_active) VALUES ('Environment', true);
INSERT INTO departments (department_label, department_active) VALUES ('Facilities Engineering', true); 
INSERT INTO departments (department_label, department_active) VALUES ('Finance', true);
INSERT INTO departments (department_label, department_active) VALUES ('Health', true);
INSERT INTO departments (department_label, department_active) VALUES ('HR', true);
INSERT INTO departments (department_label, department_active) VALUES ('IT', true);
INSERT INTO departments (department_label, department_active) VALUES ('Operations', true); 
INSERT INTO departments (department_label, department_active) VALUES ('Project Resources', true);
INSERT INTO departments (department_label, department_active) VALUES ('Public Affairs', true);
INSERT INTO departments (department_label, department_active) VALUES ('Safety', true);

INSERT INTO consequence_types (consequence_type_label, consequence_type_active) VALUES ('Injury', true);

INSERT INTO event_types (event_type_label, event_type_active) VALUES ('Incident', true); 
INSERT INTO event_types (event_type_label, event_type_active) VALUES ('Near Miss', true); 

INSERT INTO severities (severity_label, severity_active) VALUES ('Severity 1', true);
INSERT INTO severities (severity_label, severity_active) VALUES ('Severity 2', true);
INSERT INTO severities (severity_label, severity_active) VALUES ('Severity 3a', true);
INSERT INTO severities (severity_label, severity_active) VALUES ('Severity 3b', true);

INSERT INTO statuses (status_label, status_active) VALUES ('Draft', true); 
INSERT INTO statuses (status_label, status_active) VALUES ('Open', true); 
INSERT INTO statuses (status_label, status_active) VALUES ('QA/QC', true); 
INSERT INTO statuses (status_label, status_active) VALUES ('Closed', true); 
INSERT INTO statuses (status_label, status_active) VALUES ('Cancelled', true); 
INSERT INTO statuses (status_label, status_active) VALUES ('Deleted', true); 

INSERT INTO temperature_uoms (temperature_uom_label, temperature_uom_active) VALUES ('Fahrenheit', true); 
INSERT INTO temperature_uoms (temperature_uom_label, temperature_uom_active) VALUES ('Celsius', true); 

INSERT INTO weathers (weather_label, weather_active) VALUES ('Clear', true); 
INSERT INTO weathers (weather_label, weather_active) VALUES ('Cloudy', true); 
INSERT INTO weathers (weather_label, weather_active) VALUES ('Stormy', true); 
INSERT INTO weathers (weather_label, weather_active) VALUES ('Wet', true); 
INSERT INTO weathers (weather_label, weather_active) VALUES ('Dry', true); 

INSERT INTO lightings (lighting_label, lighting_active) VALUES ('Light', true); 
INSERT INTO lightings (lighting_label, lighting_active) VALUES ('Dark', true); 

INSERT INTO operation_types (operation_type_label, operation_type_active) VALUES ('Administrative', true); 
INSERT INTO operation_types (operation_type_label, operation_type_active) VALUES ('Construction', true); 
INSERT INTO operation_types (operation_type_label, operation_type_active) VALUES ('Drilling', true);
INSERT INTO operation_types (operation_type_label, operation_type_active) VALUES ('Exploration', true); 
INSERT INTO operation_types (operation_type_label, operation_type_active) VALUES ('Logistics', true); 
INSERT INTO operation_types (operation_type_label, operation_type_active) VALUES ('Maintenance', true); 
INSERT INTO operation_types (operation_type_label, operation_type_active) VALUES ('Operations', true); 
INSERT INTO operation_types (operation_type_label, operation_type_active) VALUES ('Other', true); 

INSERT INTO activity_types (activity_type_label, activity_type_active) VALUES ('Drilling, Workover, Well Services', true); 
INSERT INTO activity_types (activity_type_label, activity_type_active) VALUES ('Construction, Commissioning, Decommissioning', true);
INSERT INTO activity_types (activity_type_label, activity_type_active) VALUES ('Maintenance, Inspection, Testing', true);
INSERT INTO activity_types (activity_type_label, activity_type_active) VALUES ('Production Operations', true);
INSERT INTO activity_types (activity_type_label, activity_type_active) VALUES ('Other', true);
INSERT INTO activity_types (activity_type_label, activity_type_active) VALUES ('Lifting, Crane, Rigging, Deck Operations', true);
INSERT INTO activity_types (activity_type_label, activity_type_active) VALUES ('Seismic/Survey Operations', true);
INSERT INTO activity_types (activity_type_label, activity_type_active) VALUES ('Diving Subsea, ROV', true);
INSERT INTO activity_types (activity_type_label, activity_type_active) VALUES ('Office, Warehouse, Accommodation, Catering', true);
INSERT INTO activity_types (activity_type_label, activity_type_active) VALUES ('Transport', true);

INSERT INTO medical_classifications (medical_classification_label, medical_classification_active) VALUES ('1 Not Work Related', true); 
INSERT INTO medical_classifications (medical_classification_label, medical_classification_active) VALUES ('2 First Aid', true);
INSERT INTO medical_classifications (medical_classification_label, medical_classification_active) VALUES ('3 Other Recordable', true);
INSERT INTO medical_classifications (medical_classification_label, medical_classification_active) VALUES ('4 Restricted Duty', true);
INSERT INTO medical_classifications (medical_classification_label, medical_classification_active) VALUES ('5 Days Away From Work', true);
INSERT INTO medical_classifications (medical_classification_label, medical_classification_active) VALUES ('6 Fatality', true);

INSERT INTO company_names (company_name_label, company_name_active) VALUES ('Company1', true); 
INSERT INTO company_names (company_name_label, company_name_active) VALUES ('Company2', true); 
INSERT INTO company_names (company_name_label, company_name_active) VALUES ('Company3', true); 
INSERT INTO company_names (company_name_label, company_name_active) VALUES ('Company4', true); 
INSERT INTO company_names (company_name_label, company_name_active) VALUES ('Company5', true); 
INSERT INTO company_names (company_name_label, company_name_active) VALUES ('Company6', true); 
INSERT INTO company_names (company_name_label, company_name_active) VALUES ('Company7', true); 
INSERT INTO company_names (company_name_label, company_name_active) VALUES ('Company8', true); 
INSERT INTO company_names (company_name_label, company_name_active) VALUES ('Company9', true); 

INSERT INTO equipments (equipment_label, equipment_active) VALUES ('Drilling', true); 
INSERT INTO equipments (equipment_label, equipment_active) VALUES ('Drilling Subsea', true); 
INSERT INTO equipments (equipment_label, equipment_active) VALUES ('Electrical', true); 
INSERT INTO equipments (equipment_label, equipment_active) VALUES ('Fixed', true); 
INSERT INTO equipments (equipment_label, equipment_active) VALUES ('Floating', true); 
INSERT INTO equipments (equipment_label, equipment_active) VALUES ('Instrumentation/Automation', true); 
INSERT INTO equipments (equipment_label, equipment_active) VALUES ('Misc', true); 
INSERT INTO equipments (equipment_label, equipment_active) VALUES ('Rotating', true); 
INSERT INTO equipments (equipment_label, equipment_active) VALUES ('Safety', true); 
INSERT INTO equipments (equipment_label, equipment_active) VALUES ('Shipping', true); 
INSERT INTO equipments (equipment_label, equipment_active) VALUES ('Structures', true); 
INSERT INTO equipments (equipment_label, equipment_active) VALUES ('Subsea', true); 
INSERT INTO equipments (equipment_label, equipment_active) VALUES ('Transportation', true); 
INSERT INTO equipments (equipment_label, equipment_active) VALUES ('Wellhead', true); 

INSERT INTO personnel_types (personnel_type_label, personnel_type_active) VALUES ('Employee', true); 
INSERT INTO personnel_types (personnel_type_label, personnel_type_active) VALUES ('Contractor', true); 
INSERT INTO personnel_types (personnel_type_label, personnel_type_active) VALUES ('Third Party', true); 

INSERT INTO injury_natures (injury_nature_label, injury_nature_active) VALUES ('Abrasion', true); 
INSERT INTO injury_natures (injury_nature_label, injury_nature_active) VALUES ('Allergic Reaction', true); 
INSERT INTO injury_natures (injury_nature_label, injury_nature_active) VALUES ('Amputation', true);
INSERT INTO injury_natures (injury_nature_label, injury_nature_active) VALUES ('Asphyxiation', true); 
INSERT INTO injury_natures (injury_nature_label, injury_nature_active) VALUES ('Bruise', true); 
INSERT INTO injury_natures (injury_nature_label, injury_nature_active) VALUES ('Burn', true); 
INSERT INTO injury_natures (injury_nature_label, injury_nature_active) VALUES ('Cancer', true); 
INSERT INTO injury_natures (injury_nature_label, injury_nature_active) VALUES ('Chemical Irritation/Exposure', true); 
INSERT INTO injury_natures (injury_nature_label, injury_nature_active) VALUES ('Concussion', true); 
INSERT INTO injury_natures (injury_nature_label, injury_nature_active) VALUES ('Contagious/Infectious Disease', true); 
INSERT INTO injury_natures (injury_nature_label, injury_nature_active) VALUES ('Crushing', true); 
INSERT INTO injury_natures (injury_nature_label, injury_nature_active) VALUES ('Cut or Laceration', true); 
INSERT INTO injury_natures (injury_nature_label, injury_nature_active) VALUES ('Dislocation', true); 
INSERT INTO injury_natures (injury_nature_label, injury_nature_active) VALUES ('Electric Shock', true); 
INSERT INTO injury_natures (injury_nature_label, injury_nature_active) VALUES ('Fainting', true); 
INSERT INTO injury_natures (injury_nature_label, injury_nature_active) VALUES ('Food Borne Disease', true); 
INSERT INTO injury_natures (injury_nature_label, injury_nature_active) VALUES ('Fracture', true); 
INSERT INTO injury_natures (injury_nature_label, injury_nature_active) VALUES ('Freezing', true); 
INSERT INTO injury_natures (injury_nature_label, injury_nature_active) VALUES ('Hearing Loss', true); 
INSERT INTO injury_natures (injury_nature_label, injury_nature_active) VALUES ('Heart Attack', true); 
INSERT INTO injury_natures (injury_nature_label, injury_nature_active) VALUES ('Heart Disease', true); 
INSERT INTO injury_natures (injury_nature_label, injury_nature_active) VALUES ('Heat Cramps', true); 
INSERT INTO injury_natures (injury_nature_label, injury_nature_active) VALUES ('Heat Exhaustion', true); 
INSERT INTO injury_natures (injury_nature_label, injury_nature_active) VALUES ('Heat Stroke', true); 
INSERT INTO injury_natures (injury_nature_label, injury_nature_active) VALUES ('Hernia', true); 
INSERT INTO injury_natures (injury_nature_label, injury_nature_active) VALUES ('Infection', true); 
INSERT INTO injury_natures (injury_nature_label, injury_nature_active) VALUES ('Mental Disorder', true); 
INSERT INTO injury_natures (injury_nature_label, injury_nature_active) VALUES ('Mental Stress', true); 
INSERT INTO injury_natures (injury_nature_label, injury_nature_active) VALUES ('Poisoning', true); 
INSERT INTO injury_natures (injury_nature_label, injury_nature_active) VALUES ('Puncture', true); 
INSERT INTO injury_natures (injury_nature_label, injury_nature_active) VALUES ('Ratiation', true); 
INSERT INTO injury_natures (injury_nature_label, injury_nature_active) VALUES ('Repetative Stress Injury', true); 
INSERT INTO injury_natures (injury_nature_label, injury_nature_active) VALUES ('Sprain', true); 
INSERT INTO injury_natures (injury_nature_label, injury_nature_active) VALUES ('Strain', true); 
INSERT INTO injury_natures (injury_nature_label, injury_nature_active) VALUES ('Vision Loss', true); 

INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Abdomen', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Ankle', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Brain', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Buttocks', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Chest', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Circulatory System', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Clavicle', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Disc', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Ear', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Elbow', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Eye', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Face', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Finger', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Foot', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Groin', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Hand', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Head', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Heart', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Hip', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Jaw', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Knee', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Lower Arm', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Lower Back', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Lower Leg', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Lungs', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Mental Disorder', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Mouth', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Neck', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Nose', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Other Internal Organ', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Pelvis', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Sacrum and Coccyx', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Shoulder', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Skull', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Spinal Cord', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Throat', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Thumb', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Toe', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Tooth', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Upper Arm', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Upper Back', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Upper Leg', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Vertebrae', true); 
INSERT INTO injury_primary_body_parts (injury_primary_body_part_label, injury_primary_body_part_active) VALUES ('Wrist', true); 

INSERT INTO users (user_name, user_password, user_name_first, user_name_last, user_name_middle, user_active) VALUES ('user1', 'pass1', 'First1', 'Last1', 'M1', true);
INSERT INTO users (user_name, user_password, user_name_first, user_name_last, user_name_middle, user_active) VALUES ('user2', 'pass2', 'First2', 'Last2', 'M2', true);
INSERT INTO users (user_name, user_password, user_name_first, user_name_last, user_name_middle, user_active) VALUES ('user3', 'pass3', 'First3', 'Last3', 'M3', true);
INSERT INTO users (user_name, user_password, user_name_first, user_name_last, user_name_middle, user_active) VALUES ('user4', 'pass4', 'First4', 'Last4', 'M4', true);
INSERT INTO users (user_name, user_password, user_name_first, user_name_last, user_name_middle, user_active) VALUES ('user5', 'pass5', 'First5', 'Last5', 'M5', true);

INSERT INTO events (date_occurred, date_reported, date_entered, description_short, description_long, site_id, department_id, event_type_id, severity_actual_id, severity_probable_id, event_status_id, temperature, temperature_uom_id, weather_id, lighting_id, operation_type_id, activity_type_id, reporting_boudnary, entered_by_id, reported_by_id, qa_qc_by_id, equipment_id, consequence_type_id) 
   VALUES ('1/1/2019', '1/2/2019', '1/3/2019', 'Short Description1', 'Detailed Description1', 1, 1, 1, 1, 1, 1, 80, 1, 1, 1, 1, 1, true, 1, 1, 1, 1, 1);
INSERT INTO events (date_occurred, date_reported, date_entered, description_short, description_long, site_id, department_id, event_type_id, severity_actual_id, severity_probable_id, event_status_id, temperature, temperature_uom_id, weather_id, lighting_id, operation_type_id, activity_type_id, reporting_boudnary, entered_by_id, reported_by_id, qa_qc_by_id, equipment_id, consequence_type_id) 
   VALUES ('2/1/2019', '2/2/2019', '2/3/2019', 'Short Description2', 'Detailed Description2', 2, 2, 2, 2, 2, 2, 20, 2, 2, 2, 2, 2, true, 2, 2, 2, 2, 1);
INSERT INTO events (date_occurred, date_reported, date_entered, description_short, description_long, site_id, department_id, event_type_id, severity_actual_id, severity_probable_id, event_status_id, temperature, temperature_uom_id, weather_id, lighting_id, operation_type_id, activity_type_id, reporting_boudnary, entered_by_id, reported_by_id, qa_qc_by_id, equipment_id, consequence_type_id) 
   VALUES ('3/1/2019', '3/2/2019', '3/3/2019', 'Short Description3', 'Detailed Description3', 3, 3, 1, 3, 3, 3, 80, 1, 3, 1, 3, 3, true, 3, 3, 3, 3, 1);
INSERT INTO events (date_occurred, date_reported, date_entered, description_short, description_long, site_id, department_id, event_type_id, severity_actual_id, severity_probable_id, event_status_id, temperature, temperature_uom_id, weather_id, lighting_id, operation_type_id, activity_type_id, reporting_boudnary, entered_by_id, reported_by_id, qa_qc_by_id, equipment_id, consequence_type_id) 
   VALUES ('4/1/2019', '4/2/2019', '4/3/2019', 'Short Description4', 'Detailed Description4', 4, 4, 1, 4, 4, 4, 80, 1, 4, 2, 4, 4, true, 4, 4, 4, 4, 1);
INSERT INTO events (date_occurred, date_reported, date_entered, description_short, description_long, site_id, department_id, event_type_id, severity_actual_id, severity_probable_id, event_status_id, temperature, temperature_uom_id, weather_id, lighting_id, operation_type_id, activity_type_id, reporting_boudnary, entered_by_id, reported_by_id, qa_qc_by_id, equipment_id, consequence_type_id) 
   VALUES ('5/1/2019', '5/2/2019', '5/3/2019', 'Short Description5', 'Detailed Description5', 5, 5, 1, 1, 1, 1, 80, 1, 5, 1, 5, 5, true, 5, 5, 5, 5, 1);
INSERT INTO events (date_occurred, date_reported, date_entered, description_short, description_long, site_id, department_id, event_type_id, severity_actual_id, severity_probable_id, event_status_id, temperature, temperature_uom_id, weather_id, lighting_id, operation_type_id, activity_type_id, reporting_boudnary, entered_by_id, reported_by_id, qa_qc_by_id, equipment_id, consequence_type_id) 
   VALUES ('6/1/2019', '6/2/2019', '6/3/2019', 'Short Description6', 'Detailed Description6', 6, 6, 1, 2, 2, 2, 80, 1, 1, 2, 6, 6, true, 1, 1, 1, 1, 1);
INSERT INTO events (date_occurred, date_reported, date_entered, description_short, description_long, site_id, department_id, event_type_id, severity_actual_id, severity_probable_id, event_status_id, temperature, temperature_uom_id, weather_id, lighting_id, operation_type_id, activity_type_id, reporting_boudnary, entered_by_id, reported_by_id, qa_qc_by_id, equipment_id, consequence_type_id) 
   VALUES ('7/1/2019', '7/2/2019', '7/3/2019', 'Short Description7', 'Detailed Description7', 7, 7, 1, 3, 3, 3, 80, 1, 2, 1, 7, 7, true, 1, 1, 1, 1, 1);
INSERT INTO events (date_occurred, date_reported, date_entered, description_short, description_long, site_id, department_id, event_type_id, severity_actual_id, severity_probable_id, event_status_id, temperature, temperature_uom_id, weather_id, lighting_id, operation_type_id, activity_type_id, reporting_boudnary, entered_by_id, reported_by_id, qa_qc_by_id, equipment_id, consequence_type_id) 
   VALUES ('8/1/2019', '8/2/2019', '8/3/2019', 'Short Description8', 'Detailed Description8', 8, 8, 1, 4, 4, 4, 80, 1, 3, 2, 8, 8, true, 1, 1, 1, 1, 1);
INSERT INTO events (date_occurred, date_reported, date_entered, description_short, description_long, site_id, department_id, event_type_id, severity_actual_id, severity_probable_id, event_status_id, temperature, temperature_uom_id, weather_id, lighting_id, operation_type_id, activity_type_id, reporting_boudnary, entered_by_id, reported_by_id, qa_qc_by_id, equipment_id, consequence_type_id) 
   VALUES ('9/1/2019', '9/2/2019', '9/3/2019', 'Short Description9', 'Detailed Description9', 9, 9, 1, 1, 1, 5, 80, 1, 4, 1, 1, 9, false, 1, 1, 1, 1, 1);
   
INSERT INTO injuries (event_id, injured_ill_personnel_type_id, work_related, medical_classification_id, injury_description, injury_nature_id, injury_primary_body_part_id, injury_lost_days, injury_lost_days_start_date, company_name_id, injury_status_id) VALUES (1, 1, true, 1, 'Injury description1', 1, 1, null, null, 1, 1);
INSERT INTO injuries (event_id, injured_ill_personnel_type_id, work_related, medical_classification_id, injury_description, injury_nature_id, injury_primary_body_part_id, injury_lost_days, injury_lost_days_start_date, company_name_id, injury_status_id) VALUES (2, 1, true, 2, 'Injury description2', 2, 2, null, null, 2, 2);
INSERT INTO injuries (event_id, injured_ill_personnel_type_id, work_related, medical_classification_id, injury_description, injury_nature_id, injury_primary_body_part_id, injury_lost_days, injury_lost_days_start_date, company_name_id, injury_status_id) VALUES (3, 1, false, 3, 'Injury description3', 2, 2, null, null, 3, 3);
INSERT INTO injuries (event_id, injured_ill_personnel_type_id, work_related, medical_classification_id, injury_description, injury_nature_id, injury_primary_body_part_id, injury_lost_days, injury_lost_days_start_date, company_name_id, injury_status_id) VALUES (4, 2, true, 4, 'Injury description4', 2, 2, 5, '2/1/2019', 4, 4);
INSERT INTO injuries (event_id, injured_ill_personnel_type_id, work_related, medical_classification_id, injury_description, injury_nature_id, injury_primary_body_part_id, injury_lost_days, injury_lost_days_start_date, company_name_id, injury_status_id) VALUES (5, 2, true, 5, 'Injury description5', 2, 2, 10, '3/1/2019', 5, 4);
INSERT INTO injuries (event_id, injured_ill_personnel_type_id, work_related, medical_classification_id, injury_description, injury_nature_id, injury_primary_body_part_id, injury_lost_days, injury_lost_days_start_date, company_name_id, injury_status_id) VALUES (6, 2, true, 6, 'Injury description6', 2, 2, null, null, 6, 4);
INSERT INTO injuries (event_id, injured_ill_personnel_type_id, work_related, medical_classification_id, injury_description, injury_nature_id, injury_primary_body_part_id, injury_lost_days, injury_lost_days_start_date, company_name_id, injury_status_id) VALUES (6, 2, true, 6, 'Injury description6', 2, 2, null, null, 6, 5);
INSERT INTO injuries (event_id, injured_ill_personnel_type_id, work_related, medical_classification_id, injury_description, injury_nature_id, injury_primary_body_part_id, injury_lost_days, injury_lost_days_start_date, company_name_id, injury_status_id) VALUES (6, 2, true, 6, 'Injury description6', 2, 2, null, null, 6, 6);