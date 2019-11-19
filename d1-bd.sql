CREATE DATABASE hospital_miracema;
USE hospital_miracema;


CREATE TABLE ambulatorios(
	andar int(3) NOT NULL, 
	numero int(5) NOT NULL, 
	capacidade int(3) NOT NULL
);
INSERT INTO `ambulatorios` (`andar`, `numero`, `capacidade`) VALUES (1, 101, 4), (1, 102, 5), (1, 103, 10), (2, 201, 3), (2, 202, 5), (2, 203, 6), (3, 301, 4), (3, 302, 8), (3, 303, 4), (4, 401, 30);


CREATE TABLE medicos(
	crm int(10) NOT NULL PRIMARY KEY, 
	nome varchar(100) NOT NULL, 
	idade int(3) NOT NULL, 
	especialidade varchar(50) NOT NULL,
	rg int(10) NOT NULL, 
	cidade varchar(50) NOT NULL
);
INSERT INTO `medicos` (`crm`, `nome`, `idade`, `especialidade`, `rg`, `cidade`) VALUES ('747393219', 'Rafael Lopes', '62', 'Acupuntura', '177647917', 'Cuiabá'), ('202360149', 'Davi Aparício', '19', 'Cirurgia Plástica', '260275906', 'Curitiba'), ('668305132', 'Alice Rodrigues', '70', 'Anestesiologia', '126288331', 'São Bento do Sul'), ('141426776', 'Otávio Peixoto', '56', 'Homeopatia', '394243195', 'Porto Velho'), ('703968039', 'Victor da Cruz', '69', 'Urologia', '238513038', 'Serra');


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
	data datetime,
	FOREIGN KEY (paciente) REFERENCES pacientes (id),
	FOREIGN KEY (medico) REFERENCES medicos (crm)
);
INSERT INTO `atendimentos` (`paciente`, `medico`, `data`) VALUES ('1', '5', '2019-11-29 11:41:00'), ('2', '4', '2019-11-27 09:22:00'), ('4', '5', '2019-11-23 12:24:00'), ('1', '3', '2019-11-26 15:29:00'), ('3', '2', '2019-11-26 15:34:00'), ('4', '1', '2019-11-29 14:36:00'), ('1', '4', '2019-11-24 13:28:00'), ('2', '5', '2019-11-19 13:35:00');
