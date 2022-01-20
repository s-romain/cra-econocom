create role postgrestRole nologin;

grant usage on schema cra_e to postgrestRole;
grant all on cra_e.accounts to postgrestRole;
grant all on cra_e.made_works to postgrestRole;
grant all on cra_e.tasks to postgrestRole;

create role authenticator noinherit login password 'root';
grant postgrestRole to authenticator;