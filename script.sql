create database flutter;
use flutter;
create user 'userappf'@'localhost' IDENTIFIED by 'password';
grant all privileges on flutter.* to 'userappf'@'localhost';
flush privileges;

create table userInf(
    userID int AUTO_INCREMENT not null,
    nombreUser VARCHAR(20),
    apellidoPatUser VARCHAR(20),
    apellidoMatUser VARCHAR(20),
    numeroTelefono VARCHAR(10),
    email VARCHAR(50),
    imageRoute VARCHAR(100),
    CONSTRAINT userInfPK PRIMARY KEY(userID)
);