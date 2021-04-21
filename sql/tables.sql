USE testapp2;

-- DICTIONARY TABLES

CREATE TABLE payment_types (
	`id` INT NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE period_types (
	`id` INT NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE client_types(
	`id` INT NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

-- CLIENTS 

CREATE TABLE passports (
	`id` INT NOT NULL AUTO_INCREMENT,
    `serie` VARCHAR(40) NOT NULL,
    `number` VARCHAR(40) NOT NULL,
    `date` DATE NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `passport` (`serie`, `number`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE individuals (
	`id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `inn` VARCHAR(40) NOT NULL,
    `birthday` DATE NOT NULL,
    `passport_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `inn` (`inn`),
    UNIQUE KEY `passport_id` (`passport_id`),
    FOREIGN KEY `passport_id` (`passport_id`) REFERENCES passports(`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE leaders (
	`id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `inn` VARCHAR(40) NOT NULL,
	PRIMARY KEY (`id`),
    UNIQUE KEY `inn`(`inn`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE organizations (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    `ogrn` VARCHAR (40) NOT NULL,
    `inn` VARCHAR(40) NOT NULL,
    `kpp` VARCHAR(40) NOT NULL,
	PRIMARY KEY (`id`),
    UNIQUE KEY `organization`(`inn`, `ogrn`, `kpp`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE legals (
	`id` INT NOT NULL AUTO_INCREMENT,
	`leader_id` INT NOT NULL,
    `organization_id` INT NOT NULL,
	PRIMARY KEY (`id`),
    UNIQUE KEY `legal`(`leader_id`, `organization_id`),
    FOREIGN KEY `leader_id`(`leader_id`) REFERENCES leaders(`id`),
	FOREIGN KEY `organization_id`(`organization_id`) REFERENCES organizations(`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

-- PRODUCTS

CREATE TABLE credits (
	`id` INT NOT NULL AUTO_INCREMENT,
    `date_open` DATE NOT NULL,
    `date_close` DATE NOT NULL,
    `time` INT NOT NULL,
    `payment_type_id` INT NOT NULL,
    `summary` INT NOT NULL,
    `client_id` INT NOT NULL,
    `client_type_id` INT NOT NULL,
	PRIMARY KEY (`id`),
    FOREIGN KEY `payment_type_id`(`payment_type_id`) REFERENCES payment_types(`id`),
    FOREIGN KEY `client_type_id`(`client_type_id`) REFERENCES client_types(`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE deposits (
	`id` INT NOT NULL AUTO_INCREMENT,
	`date_open` DATE NOT NULL,
    `date_close` DATE NOT NULL,
	`time` INT NOT NULL,
    `bet` INT NOT NULL,
    `period_type_id` INT NOT NULL,
    `client_id` INT NOT NULL,
    `client_type_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY `period_type_id`(`period_type_id`) REFERENCES period_types(`id`),
    FOREIGN KEY `client_type_id`(`client_type_id`) REFERENCES client_types(`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;