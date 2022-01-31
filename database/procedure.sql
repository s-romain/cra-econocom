--Fonction pour requête avec inner join
CREATE OR REPLACE function cra_e.weekly_report_by_account(id_account_entry integer) 
returns table(
	name_task varchar,
	duration_weekly_report numeric,
	date_weekly_reports timestamp
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

--Fonction pour requête avec inner join
CREATE OR REPLACE function cra_e.monthly_report_by_account(id_account_entry integer) 
returns table(
	name_project VARCHAR,
	date_monthly_reports timestamp
	) 
as $$
begin
return query 
SELECT cra_e.project_informations.name_project, cra_e.monthly_reports.date_monthly_reports
FROM cra_e.monthly_reports 
INNER JOIN cra_e.project_informations
ON project_informations.id_project = monthly_reports.id_project 
WHERE monthly_reports.id_account = id_account_entry;
end;
$$
language plpgsql;