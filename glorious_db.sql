CREATE DATABASE IF NOT EXISTS glorious_db;
USE glorious_db;

CREATE TABLE IF NOT EXISTS catalog (
  id INT AUTO_INCREMENT PRIMARY KEY,
  game_name VARCHAR(100) NOT NULL,
  price INT NOT NULL,
  image VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  game_type VARCHAR(100) NOT NULL,
  user_id VARCHAR(50) NOT NULL,
  wa_number VARCHAR(20) NOT NULL,
  nickname VARCHAR(50) NOT NULL,
  payment_method VARCHAR(20) NOT NULL,
  payment_proof VARCHAR(255) NOT NULL,
  status ENUM('pending','success') DEFAULT 'pending'
);