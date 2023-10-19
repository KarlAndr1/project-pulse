INSERT INTO projects (name, report_frequency, start_date, end_date)
VALUES
	('project-d1', 60 * 60 * 24, 1000, 1000 + 60 * 60 * 24 * 10),
	('project-d2', 60 * 60 * 24, 3000, 3000 + 60 * 60 * 24 * 5),
	
	('project-w1', 60 * 60 * 24 * 7, 2000, 2000 + 60 * 60 * 24 * 14),	
	('project-w2', 60 * 60 * 24 * 7, 1000, 1000 + 60 * 60 * 24 * 7),
	
	('project-m1', NULL, 1000, 150000)
;

INSERT INTO project_report_dates (_date, project_id)
VALUES
	(2000, 5),
	(4000, 5),
	(12000, 5),
	(14500, 5)
;
