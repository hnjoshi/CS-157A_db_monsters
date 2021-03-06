-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
SHOW WARNINGS;
-- -----------------------------------------------------
-- Schema db_monsters_crs
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `db_monsters_crs` ;

-- -----------------------------------------------------
-- Schema db_monsters_crs
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_monsters_crs` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `db_monsters_crs` ;

-- -----------------------------------------------------
-- Table `db_monsters_crs`.`archenrollment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_monsters_crs`.`archenrollment` (
  `eID` INT(11) NOT NULL DEFAULT '0',
  `Grade` VARCHAR(2) NULL DEFAULT NULL,
  `sID` INT(11) NULL DEFAULT NULL,
  `cID` INT(11) NULL DEFAULT NULL,
  `updatedON` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`eID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `db_monsters_crs`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_monsters_crs`.`department` (
  `dID` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Budget` FLOAT NULL DEFAULT NULL,
  `StartDate` DATE NOT NULL,
  PRIMARY KEY (`dID`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `db_monsters_crs`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_monsters_crs`.`course` (
  `cID` INT(11) NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(255) NOT NULL,
  `Credits` INT(11) NOT NULL,
  `Status` VARCHAR(10) NOT NULL,
  `nSeats` INT(11) NULL DEFAULT NULL,
  `Term` VARCHAR(10) NULL DEFAULT NULL,
  `StartDate` DATE NOT NULL,
  `EndDate` DATE NOT NULL,
  `StartTime` TIME NOT NULL,
  `EndTime` TIME NOT NULL,
  `dID` INT(11) NOT NULL,
  PRIMARY KEY (`cID`),
  INDEX `fk_Course_department1_idx` (`dID` ASC),
  CONSTRAINT `fk_Course_department1`
    FOREIGN KEY (`dID`)
    REFERENCES `db_monsters_crs`.`department` (`dID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 54
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `db_monsters_crs`.`instructor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_monsters_crs`.`instructor` (
  `iID` INT(11) NOT NULL AUTO_INCREMENT,
  `UserName` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(256) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `HireDate` DATE NOT NULL,
  `dID` INT(11) NOT NULL,
  PRIMARY KEY (`iID`, `UserName`),
  INDEX `fk_instructor_department1_idx` (`dID` ASC),
  CONSTRAINT `fk_instructor_department1`
    FOREIGN KEY (`dID`)
    REFERENCES `db_monsters_crs`.`department` (`dID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `db_monsters_crs`.`courseassignment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_monsters_crs`.`courseassignment` (
  `aID` INT(11) NOT NULL AUTO_INCREMENT,
  `Location` VARCHAR(255) NOT NULL,
  `iID` INT(11) NOT NULL,
  `cID` INT(11) NOT NULL,
  `updatedON` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`aID`),
  INDEX `fk_OfficeAssignment_instructor1_idx` (`iID` ASC),
  INDEX `fk_officeassignment_course1_idx` (`cID` ASC),
  CONSTRAINT `fk_officeassignment_course1`
    FOREIGN KEY (`cID`)
    REFERENCES `db_monsters_crs`.`course` (`cID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OfficeAssignment_instructor1`
    FOREIGN KEY (`iID`)
    REFERENCES `db_monsters_crs`.`instructor` (`iID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 41
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `db_monsters_crs`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_monsters_crs`.`student` (
  `sID` INT(11) NOT NULL AUTO_INCREMENT,
  `UserName` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(256) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `AdmissionDate` DATE NOT NULL,
  `dID` INT(11) NOT NULL,
  PRIMARY KEY (`sID`, `UserName`),
  INDEX `fk_student_department1_idx` (`dID` ASC),
  CONSTRAINT `fk_student_department1`
    FOREIGN KEY (`dID`)
    REFERENCES `db_monsters_crs`.`department` (`dID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `db_monsters_crs`.`enrollment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_monsters_crs`.`enrollment` (
  `eID` INT(11) NOT NULL AUTO_INCREMENT,
  `Grade` VARCHAR(2) NULL DEFAULT NULL,
  `sID` INT(11) NOT NULL,
  `cID` INT(11) NOT NULL,
  `updatedON` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`eID`),
  INDEX `fk_Enrollment_student1_idx` (`sID` ASC),
  INDEX `fk_enrollment_course1_idx` (`cID` ASC),
  CONSTRAINT `fk_enrollment_course1`
    FOREIGN KEY (`cID`)
    REFERENCES `db_monsters_crs`.`course` (`cID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Enrollment_student1`
    FOREIGN KEY (`sID`)
    REFERENCES `db_monsters_crs`.`student` (`sID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 107
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;
USE `db_monsters_crs` ;

-- -----------------------------------------------------
-- procedure archiveEnrollmentsUntil
-- -----------------------------------------------------

DELIMITER $$
USE `db_monsters_crs`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `archiveEnrollmentsUntil`(IN d DATE)
BEGIN

insert into archenrollment
	select * from enrollment
		where updatedON <= d;

END$$

DELIMITER ;
SHOW WARNINGS;

-- -----------------------------------------------------
-- procedure deleteOlderAssignment
-- -----------------------------------------------------

DELIMITER $$
USE `db_monsters_crs`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOlderAssignment`(IN d DATE)
BEGIN 
delete from courseassignment
	where iID = any (select iID from instructor
						where instructor.iID = courseassignment.iID)
						and updatedON < d;
END$$

DELIMITER ;
SHOW WARNINGS;
USE `db_monsters_crs`;

DELIMITER $$
SHOW WARNINGS$$
USE `db_monsters_crs`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `db_monsters_crs`.`UpdateCourseStatus_toClose`
AFTER INSERT ON `db_monsters_crs`.`enrollment`
FOR EACH ROW
BEGIN
DECLARE totalSeats INT DEFAULT 0;
DECLARE currentEnrolled INT DEFAULT 0;

SET totalSeats = (select nSeats from course c where c.cID=new.cID);
SET currentEnrolled = (select count(*) from enrollment e where e.cID=new.cID);

 IF (totalSeats = currentEnrolled)
 THEN
  update course set course.status = 'close'
  where cID=new.cID;
 END IF;
END$$

SHOW WARNINGS$$
SHOW WARNINGS$$
USE `db_monsters_crs`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `db_monsters_crs`.`UpdateCourseStatus_toOpen`
AFTER DELETE ON `db_monsters_crs`.`enrollment`
FOR EACH ROW
BEGIN
DECLARE totalSeats INT DEFAULT 0;
DECLARE currentEnrolled INT DEFAULT 0;

SET totalSeats = (select nSeats from course c where c.cID=old.cID);
SET currentEnrolled = (select count(*) from enrollment e where e.cID=old.cID);

 IF (totalSeats > currentEnrolled)
 THEN
  update course set course.status = 'open'
  where cID=old.cID;
 END IF;
END$$

SHOW WARNINGS$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
