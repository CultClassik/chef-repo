CREATE TABLE customers(
  id CHAR (32) NOT NULL,
  PRIMARY KEY(id),
  first_name VARCHAR(64),
  last_name VARCHAR(64),
  email VARCHAR(64)
);

INSERT INTO customers ( id, first_name, last_name, email ) VALUES ( uuid(), 'Donald', 'Trump', 'boss@yourefired.gov' );
INSERT INTO customers ( id, first_name, last_name, email ) VALUES ( uuid(), 'Hillary', 'Clinton', 'hackme@topsecret.clintonfoundation.org' );
INSERT INTO customers ( id, first_name, last_name, email ) VALUES ( uuid(), 'Vladimir', 'Putin', 'president@again.ru' );
