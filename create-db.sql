CREATE TABLE users (
	id INTEGER PRIMARY KEY,
	member_id TEXT UNIQUE,
	name TEXT,

	email TEXT,
	phone_number TEXT,
	
	encoded_password TEXT
);

CREATE TABLE user_logins (
	id INTEGER PRIMARY KEY,
	
	user_id INTEGER,
	encoded_auth_token TEXT,
	
	FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE projects (
	id INTEGER PRIMARY KEY,
	name TEXT,
	report_frequency INTEGER,
	
	start_date INTEGER,
	end_date INTEGER,
	
	sent_notifications_count INTEGER DEFAULT 0
);

CREATE TABLE project_report_dates (
	id INTEGER PRIMARY KEY,
	_date INTEGER,
	
	project_id INTEGER,
	
	FOREIGN KEY (project_id) REFERENCES projects(id),
	
	UNIQUE (_date, project_id)
);

CREATE TABLE project_member_bindings (
	id INTEGER PRIMARY KEY,
	user_id INTEGER,
	project_id INTEGER,
	
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (project_id) REFERENCES projects(id),
	
	UNIQUE (user_id, project_id)
);

CREATE TABLE admins (
	name TEXT PRIMARY KEY,
	
	encoded_password TEXT,
	encoded_auth_token TEXT
);

CREATE TABLE reports (
	id INTEGER PRIMARY KEY,
	
	user_id INTEGER,
	project_id INTEGER,
	period INTEGER,
	
	time INT,
	content TEXT,
	
	marked_read BOOL DEFAULT 0,
	
	UNIQUE(user_id, project_id, period),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (project_id) REFERENCES projects(id)
);

CREATE TABLE report_comments (
	id INTEGER PRIMARY KEY,
	
	report_id INTEGER,
	
	time INT,
	content TEXT,
	
	FOREIGN KEY (report_id) REFERENCES reports(id)
);

CREATE TABLE email_queue ( -- SHOULD ONLY BE USED TO STORE NON-CONFIDENTIAL EMAILS, LIKE REMINDERS AND NOTIFICATIONS
	id INTEGER PRIMARY KEY,
	
	to_name TEXT NOT NULL,
	to_email TEXT,
	subject TEXT NOT NULL,
	content TEXT NOT NULL
);
