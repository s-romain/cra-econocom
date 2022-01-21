CREATE SCHEMA cra_e;

CREATE TABLE cra_e.accounts (
  id_account INT GENERATED ALWAYS AS IDENTITY,
  first_name_account VARCHAR(30),
  last_name_account VARCHAR(30),
  login_account VARCHAR(30),
  password_account VARCHAR(30),
  role_account VARCHAR(30),
  PRIMARY KEY (id_account)
);

CREATE TABLE cra_e.project_informations (
    id_project INT GENERATED ALWAYS AS IDENTITY,
    name_project VARCHAR(30)
);

CREATE TABLE cra_e.tasks (
  id_task INT GENERATED ALWAYS AS IDENTITY,
  id_manager INT,
  id_us INT,
  id_parent_task INT,
  name_task VARCHAR(30),
  duration_task INT,
  type_task VARCHAR(30),
  PRIMARY KEY (id_task),
  CONSTRAINT fkAccount
      FOREIGN KEY(id_manager) 
	  REFERENCES cra_e.accounts(id_account)
);

CREATE TABLE cra_e.us_os (
    id_us_os INT GENERATED ALWAYS AS IDENTITY,
    id_project_information INT,
    us_name VARCHAR(30),
    os_name VARCHAR(30),
    date_of_work_made_work INT,
    CONSTRAINT fkPojectInformation
        FOREIGN KEY(id_project_information) 
        REFERENCES cra_e.project_informations(id_project)
);



CREATE TABLE cra_e.weekly_reports (
    id_weekly_report INT GENERATED ALWAYS AS IDENTITY,
    id_account INT,
    id_task INT,
    duration_weekly_report VARCHAR(30),
    state_weekly_report VARCHAR(30),
    CONSTRAINT fkAccount
        FOREIGN KEY(id_account) 
        REFERENCES cra_e.accounts(id_account),
    CONSTRAINT fkTask
        FOREIGN KEY(id_task) 
        REFERENCES cra_e.tasks(id_task)
);

CREATE TABLE cra_e.monthly_reports (
    id_monthly_report INT GENERATED ALWAYS AS IDENTITY,
    id_account INT,
    id_task INT,
    date_monthly_reports INT,
    CONSTRAINT fkAccount
        FOREIGN KEY(id_account) 
        REFERENCES cra_e.accounts(id_account),
    CONSTRAINT fkTask
        FOREIGN KEY(id_task) 
        REFERENCES cra_e.tasks(id_task)
);