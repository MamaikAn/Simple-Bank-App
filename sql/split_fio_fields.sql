ALTER TABLE leaders
	ADD COLUMN `surname` VARCHAR(255) NOT NULL,
    ADD COLUMN `thirname` VARCHAR(255);

ALTER TABLE individuals
 	ADD COLUMN `surname` VARCHAR(255) NOT NULL,
    ADD COLUMN `thirname` VARCHAR(255)