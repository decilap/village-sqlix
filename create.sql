DROP DATABASE IF EXISTS sqlix;
CREATE SCHEMA `sqlix` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE sqlix;


-- TABLE QUALITE
CREATE TABLE IF NOT EXISTS qualite (
   num_qualite INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
   lib_qualite VARCHAR(30)
)
ENGINE InnoDB;

-- TABLE PROVINCE
CREATE TABLE IF NOT EXISTS province (
    num_province INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nom_province VARCHAR(30),
    nom_gouverneur VARCHAR(30)
)
ENGINE InnoDB;

-- TABLE VILLAGE
CREATE TABLE IF NOT EXISTS village (
num_village INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
   nom_village VARCHAR(30),
    nb_huttes INT,
    num_province INT,  
    CONSTRAINT FOREIGN KEY (num_province) REFERENCES province(num_province)
)
ENGINE InnoDB;


-- TABLE HABITANT
CREATE TABLE IF NOT EXISTS habitant (
num_habitant INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
   nom VARCHAR(30),
    age INT,
    num_qualite INT,  
    num_village INT,
    CONSTRAINT FOREIGN KEY (num_qualite) REFERENCES qualite(num_qualite),
    CONSTRAINT FOREIGN KEY (num_village) REFERENCES village(num_village)
)
ENGINE InnoDB;


-- TABLE RESSERRE
CREATE TABLE IF NOT EXISTS resserre (
num_resserre INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nom_resserre VARCHAR(30) ,
    superficie INT, 
    num_village INT,
    CONSTRAINT FOREIGN KEY (num_village) REFERENCES village(num_village)
)
ENGINE InnoDB;


-- TABLE CATEGORIE
CREATE TABLE IF NOT EXISTS categorie (
code_cat CHAR(3) PRIMARY KEY NOT NULL ,
    nom_categ VARCHAR(30) ,  
    superficie INT,
    nb_points INT
)
ENGINE InnoDB;


CREATE TABLE IF NOT EXISTS trophee (
	num_trophee INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    date_prise DATETIME ,  
    code_cat CHAR(3),
    num_preneur INT,
    num_resserre INT,
    CONSTRAINT FOREIGN KEY (code_cat) REFERENCES categorie(code_cat),
    CONSTRAINT FOREIGN KEY (num_resserre) REFERENCES resserre(num_resserre),
    CONSTRAINT FOREIGN KEY (num_preneur) REFERENCES habitant(num_habitant)
)
ENGINE InnoDB;


-- TABLE POTION
CREATE TABLE IF NOT EXISTS potion (
    num_potion INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    lib_potion VARCHAR(40),
    formule VARCHAR(30),
    constituant_principal VARCHAR(30)
)
ENGINE InnoDB;


-- TABLE FABRIQUER
CREATE TABLE IF NOT EXISTS fabriquer (
num_potion INT ,
    num_habitant INT ,  
    PRIMARY KEY (num_potion , num_habitant),
    CONSTRAINT FOREIGN KEY (num_habitant) REFERENCES habitant(num_habitant),
    CONSTRAINT FOREIGN KEY (num_potion) REFERENCES potion(num_potion)
)
ENGINE InnoDB;


-- TABLE ABSORBER
CREATE TABLE IF NOT EXISTS absorber (
    num_potion INT ,
    num_habitant INT ,  
    date_a DATETIME,
    quantite INT,
    PRIMARY KEY AUTO_INCREMENT(num_potion , num_habitant,date_a),
    CONSTRAINT FOREIGN KEY (num_habitant) REFERENCES habitant(num_habitant),
    CONSTRAINT FOREIGN KEY (num_potion) REFERENCES potion(num_potion)
)
ENGINE InnoDB;








