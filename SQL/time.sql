SELECT CURRENT_DATE(); -- Returns 'YYYY-MM-DD' format, e.g., '2023-08-05'
SELECT CURRENT_TIME(); -- Returns 'HH:MM:SS' format, e.g., '14:30:45'
INSERT INTO events (event_name, event_date, event_time)
VALUES ('Conference', CURRENT_DATE(), CURRENT_TIME());
