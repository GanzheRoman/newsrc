CREATE DATABASE IF NOT EXISTS delivery;

USE delivery;

CREATE TABLE Users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  pass_hash VARCHAR(255) NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  UNIQUE (username), UNIQUE (email)
);

CREATE TABLE Items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  data TEXT NOT NULL,
  owner_id INT,
  FOREIGN KEY (owner_id) REFERENCES Users(id)
);

CREATE TABLE Deliveries (
  id INT AUTO_INCREMENT PRIMARY KEY,
  from_user_id INT,
  from_addr TEXT NOT NULL,
  to_user_id INT,
  to_addr TEXT NOT NULL,
  status INT NOT NULL, 
  creation_date TIMESTAMP NOT NULL,
  FOREIGN KEY (from_user_id) REFERENCES Users(id),
  FOREIGN KEY (to_user_id) REFERENCES Users(id)
);

CREATE TABLE ItemsDeliveries (
  id INT AUTO_INCREMENT PRIMARY KEY,
  item_id INT,
  delivery_id INT,
  FOREIGN KEY (item_id) REFERENCES Items(id),
  FOREIGN KEY (delivery_id) REFERENCES Deliveries(id),
  UNIQUE KEY (item_id, delivery_id)
);


INSERT INTO Users (id, username, pass_hash, first_name, last_name, email)
VALUES
  (1, 'ivan_ivanov', '123', 'Ivan', 'Ivanov', 'ivanivanov@mail.ru'),
  (2, 'petr_petrov', 'qwerty', 'Petr', 'Petrov', 'petrpetrov@mail.ru'),
  (3, 'pavel_pavlov', 'password', 'Pavel', 'Pavlov', 'pavelpavlov@mail.ru');

INSERT INTO Items (id, data, owner_id)
VALUES
  (1, 'Телевизор', 1),
  (2, 'Клавиатура', 2),
  (3, 'Калькулятор', 3);

INSERT INTO Deliveries (id, from_user_id, from_addr, to_user_id, to_addr, status, creation_date)
VALUES
  (1, 1, 'Санкт-Петербург, Невский проспект, 12', 2, 'Москва, ул. Ленина, 10', 0, NOW()),
  (2, 2, 'Москва, ул. Ленина, 10', 1, 'Санкт-Петербург, Невский проспект, 12', 0, NOW());

INSERT INTO ItemsDeliveries (id, item_id, delivery_id)
VALUES
  (1, 1, 1),
  (2, 2, 1),
  (3, 3, 2);