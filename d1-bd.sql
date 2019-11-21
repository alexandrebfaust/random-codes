/*POPULAR O BANCO*/
CREATE DATABASE hospital_miracema;
USE hospital_miracema;


CREATE TABLE ambulatorios(
	cod_ambulatorio int(3) AUTO_INCREMENT PRIMARY KEY,
	andar int(3) NOT NULL, 
	numero int(5) NOT NULL, 
	capacidade int(3) NOT NULL
);
INSERT INTO `ambulatorios` (`andar`, `numero`, `capacidade`) VALUES (1, 101, 4), (1, 102, 5), (1, 103, 10), (2, 201, 3), (2, 202, 5), (2, 203, 6), (3, 301, 4), (3, 302, 8), (3, 303, 4), (4, 401, 30);


CREATE TABLE medicos(
	crm int(10) NOT NULL PRIMARY KEY, 
	cod_ambulatorio int(3) NOT NULL,
	nome varchar(100) NOT NULL, 
	idade int(3) NOT NULL, 
	especialidade varchar(50) NOT NULL,
	rg int(10) NOT NULL, 
	cidade varchar(50) NOT NULL,
	FOREIGN KEY (cod_ambulatorio) REFERENCES ambulatorios (cod_ambulatorio)
);
INSERT INTO `medicos` (`crm`, `cod_ambulatorio`, `nome`, `idade`, `especialidade`, `rg`, `cidade`) VALUES (747393219, 1, 'Rafael Lopes', 62, 'Acupuntura', 177647917, 'Cuiabá'), (202360149, 2, 'Davi Aparício', 19, 'Cirurgia Plástica', 260275906, 'Curitiba'), (668305132, 3, 'Alice Rodrigues', 70, 'Anestesiologia', 126288331, 'São Bento do Sul'), (141426776, 4, 'Otávio Peixoto', 56, 'Homeopatia', 394243195, 'Porto Velho'), (703968039, 5, 'Victor da Cruz', 69, 'Urologia', 238513038, 'Serra');


CREATE TABLE pacientes(
	id int(10) AUTO_INCREMENT PRIMARY KEY, 
	nome varchar(100) NOT NULL, 
	idade int(3) NOT NULL, 
	rg int(10) NOT NULL, 
	cidade varchar(50) NOT NULL,
	problema varchar(50) NOT NULL
);
INSERT INTO `pacientes` (`id`, `nome`, `idade`, `rg`, `cidade`, `problema`) VALUES (NULL, 'Antônia Fernandes', '60', '417075042', 'Natal', 'Cirurgia Plástica'), (NULL, 'Hadassa Dias', '29', '287618675', 'Planaltina', 'Dor Orofacial'), (NULL, 'Victor Rocha', '40', '405606977', 'Magé', 'Infectologia'), (NULL, 'Renato Aragão', '78', '427429705', 'Linhares', 'Longevidade'), (NULL, 'Anthony Corte Real', '19', '499344339', 'Rio Branco', 'Oftalmologia');


CREATE TABLE atendimentos(
	paciente int(10) NOT NULL, 
	medico int(10) NOT NULL,
	data DATE NOT NULL,
	hora TIME NOT NULL,
	FOREIGN KEY (paciente) REFERENCES pacientes (id),
	FOREIGN KEY (medico) REFERENCES medicos (crm)
);
INSERT INTO `atendimentos` (`paciente`, `medico`, `data`, `hora`) VALUES (1, 141426776, '2019-11-29', '00:00:00'), (2, 202360149, '2019-11-27', '00:00:00'), (4, 392318149, '2019-11-23', '00:00:00'), (1, 668305132, '2019-11-26', '00:00:00'), (3, 703968039, '2019-11-26', '00:00:00'), (4, 747393219, '2019-11-29', '00:00:00'), (1, 703968039, '2019-11-24', '00:00:00'), (2, 747393219, '2019-11-19', '00:00:00');




/*RESPOSTAS*/
--1
SELECT medicos.*, ambulatorios.* FROM medicos INNER JOIN ambulatorios ON medicos.cod_ambulatorio = ambulatorios.cod_ambulatorio WHERE ambulatorios.capacidade <= "50";

--2
SELECT data, count(*) AS qntd FROM atendimentos GROUP BY data;

--3


--4
DELETE FROM pacientes WHERE id NOT IN (SELECT paciente FROM atendimentos);


--5



--6
SELECT atendimentos.hora, atendimentos.data, medicos.nome AS medico, pacientes.nome AS paciente FROM medicos INNER JOIN atendimentos ON atendimentos.medico = medicos.crm INNER JOIN pacientes ON atendimentos.paciente = pacientes.id;

--7
SELECT medicos.nome, ambulatorios.andar FROM medicos INNER JOIN ambulatorios ON medicos.cod_ambulatorio = ambulatorios.cod_ambulatorio WHERE medicos.nome = "José Bolivar Amarildo";

--8
SELECT atendimentos.hora, atendimentos.data, medicos.nome AS medico, pacientes.nome AS paciente FROM medicos INNER JOIN atendimentos ON atendimentos.medico = medicos.crm INNER JOIN pacientes ON atendimentos.paciente = pacientes.id WHERE pacientes.nome = "Junior" AND medicos.nome = "José Bolivar Amarildo";

--9
SELECT * FROM medicos WHERE crm <= "300000000";

--10
SELECT medicos.nome, ambulatorios.capacidade FROM medicos INNER JOIN ambulatorios ON medicos.cod_ambulatorio = ambulatorios.cod_ambulatorio WHERE ambulatorios.capacidade >= "30";
