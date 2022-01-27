--Fonction pour requête avec inner join
CREATE OR REPLACE function cra_e.weekly_report_by_account(id_account_entry integer) 
returns table(
	name_task varchar,
	duration_weekly_report integer,
	duration_task integer,
	date_weekly_reports integer
	) 
as $$
begin
return query 
SELECT cra_e.tasks.name_task, cra_e.weekly_reports.duration_weekly_report, cra_e.weekly_reports.date_weekly_reports
FROM cra_e.weekly_reports 
INNER JOIN cra_e.tasks
ON tasks.id_task = weekly_reports.id_task 
WHERE weekly_reports.id_account = id_account_entry;
end;
$$
language plpgsql;