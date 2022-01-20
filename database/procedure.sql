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