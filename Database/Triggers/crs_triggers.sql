-- ----------------------------------------------
-- Change Course status to close when enrolment
-- reaches total number of seats of a course.
-- ----------------------------------------------
DROP TRIGGER IF EXISTS CourseStatus_toClose;
delimiter //
CREATE TRIGGER UpdateCourseStatus_toClose
AFTER INSERT ON enrollment
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
END;
//
delimiter ;

-- ------------------------------------------------
-- Change Course status to open when enrolment
-- is less than total number of seats of a course.
-- ------------------------------------------------
DROP TRIGGER IF EXISTS CourseStatus_toOpen;
delimiter //
CREATE TRIGGER UpdateCourseStatus_toOpen
AFTER DELETE ON enrollment
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
END;
//
delimiter ;