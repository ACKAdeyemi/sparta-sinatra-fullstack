DROP TABLE IF EXISTS meals;

CREATE TABLE meals (

  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  description TEXT

);

INSERT INTO meals (title , description) VALUES ('Meal 1' , 'Description text 1');
INSERT INTO meals (title , description) VALUES ('Meal 2' , 'Description text 2');

DROP TABLE IF EXISTS drinks;

CREATE TABLE drinks (

  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  description TEXT

);

INSERT INTO drinks (title , description) VALUES ('Drink 1' , 'Description text 1');
INSERT INTO drinks (title , description) VALUES ('Drink 2' , 'Description text 2');
