DROP DATABASE IF EXISTS todo_app;
DROP USER IF EXISTS michael;
CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

CREATE DATABASE todo_app WITH OWNER michael;

\c todo_app

CREATE TABLE tasks (
  id SERIAL NOT NULL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  created_at timestamp without time zone NOT NULL DEFAULT NOW(),
  updated_at timestamp,
  completed BOOLEAN NOT NULL DEFAULT FALSE
);

ALTER TABLE tasks DROP COLUMN completed;

ALTER TABLE tasks ADD COLUMN completed_at timestamp without time zone DEFAULT NULL;

ALTER TABLE tasks ALTER COLUMN updated_at SET DEFAULT NOW();

ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL;


INSERT INTO tasks VALUES ( DEFAULT, 'Study SQL', 'Complete this exercise', NOW(), NOW(), NULL );

INSERT INTO tasks ( title, description )
VALUES ('Study PostgreSQL', 'Read all the documentation');

-- select all the titles of tasks that are not yet completed

SELECT title FROM tasks WHERE completed_at IS NULL;

-- update the task with a title of 'Study SQL' to be completed as of now

UPDATE tasks SET completed_at = NOW() WHERE title = 'Study SQL';

-- select all fields of every task sorted by creation date in descending order

SELECT * FROM tasks ORDER BY created_at DESC;


INSERT INTO tasks (title, description)
VALUES ('mistake 1', 'a test entry');

INSERT INTO tasks (title, description)
VALUES ('mistake 2', 'another test entry');

INSERT INTO tasks (title, description)
VALUES ('third mistake', 'another test entry');

-- select title fields of all tasks with a title that includes the word 'mistake'

SELECT title FROM tasks WHERE title LIKE '%mistake%';

-- delete the task that has a title of mistake 1

DELETE FROM tasks WHERE title = 'mistake 1';

-- select title and description fields of all tasks with a title that includes the word 'mistake'

SELECT title, description FROM tasks WHERE title LIKE '%mistake%';



-- delete all tasks that includes the word 'mistake' in the title

DELETE FROM tasks WHERE title LIKE '%mistake%';

-- select all fields of all tasks sorted by title in ascending order

SELECT * FROM tasks ORDER BY title ASC;
















