create role postgrestRole nologin;

grant usage on schema cra_e to postgrestRole;
grant all on cra_e.accounts to postgrestRole;
grant all on cra_e.project_informations to postgrestRole;
grant all on cra_e.tasks to postgrestRole;
grant all on cra_e.us_os to postgrestRole;
grant all on cra_e.weekly_reports to postgrestRole;
grant all on cra_e.monthly_reports to postgrestRole;

create role authenticator noinherit login password 'root';
grant postgrestRole to authenticator;