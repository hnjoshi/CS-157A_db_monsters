LOAD DATA LOCAL INFILE 'C:/Users/HNJoshi/Desktop/newassignments.txt'
INTO TABLE db_monsters_crs.courseassignment
FIELDS TERMINATED BY '||' LINES TERMINATED BY '\n'
(Location, iID, cID)
SET updatedON = CURRENT_TIMESTAMP;