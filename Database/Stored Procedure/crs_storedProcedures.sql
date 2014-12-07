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
						where instructor.iID = courseassignment.iID
								and HireDate < d);
END$$

DELIMITER ;
SHOW WARNINGS;