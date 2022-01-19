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

CREATE TABLE cra_e.tasks (
  id_task INT GENERATED ALWAYS AS IDENTITY,
  id_manager INT,
  id_parent_task INT,
  name_task VARCHAR(30),
  duration_task INT,
  type_task VARCHAR(30),
  project_name_task VARCHAR(30),
  PRIMARY KEY (id_task),
  CONSTRAINT fkAccount
      FOREIGN KEY(id_manager) 
	  REFERENCES cra_e.accounts(id_account)
);

CREATE TABLE cra_e.made_works (
    id_made_work INT GENERATED ALWAYS AS IDENTITY,
    id_account_made_work INT,
    id_task_made_work INT,
    duration_made_work INT,
    date_of_work_made_work INT,
    PRIMARY KEY (id_made_work),
    CONSTRAINT fkAccount
        FOREIGN KEY(id_account_made_work) 
        REFERENCES cra_e.accounts(id_account),
    CONSTRAINT fkTask
        FOREIGN KEY(id_task_made_work) 
        REFERENCES cra_e.tasks(id_task)
);

create role postgrestRole nologin;

grant usage on schema cra_e to postgrestRole;
grant all on cra_e.accounts to postgrestRole;
grant all on cra_e.made_works to postgrestRole;
grant all on cra_e.tasks to postgrestRole;

create role authenticator noinherit login password 'root';
grant postgrestRole to authenticator;


--Fonction pour requêtea avec inner join
CREATE OR REPLACE function cra_e.made_work_by_account(idAccount integer) 
returns table(
	name_task varchar,
	duration_made_work integer,
	duration_task integer,
	date_of_work_made_work integer
	) 
as $$
begin
  return query SELECT 
  	tasks.name_task, 
  	made_works.duration_made_work, 
  	tasks.duration_task, 
  	made_works.date_of_work_made_work
  FROM cra_e.made_works
  INNER JOIN cra_e.tasks 
    ON tasks.id_task = made_works.id_task_made_work
  WHERE made_works.id_account_made_work = idAccount;
end;
$$
language plpgsql;