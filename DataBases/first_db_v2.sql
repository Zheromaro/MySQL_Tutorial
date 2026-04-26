-- MySQL Workbench Synchronization
-- Generated: 2026-01-31 18:26
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: zahra

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER SCHEMA `school`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci ;

ALTER TABLE `school`.`courses` 
DROP FOREIGN KEY `fk_courses_instractors1`;

ALTER TABLE `school`.`enrollments` 
DROP FOREIGN KEY `fk_enrollments_courses`;

ALTER TABLE `school`.`course_tags` 
DROP FOREIGN KEY `fk_courses_has_tags_courses1`,
DROP FOREIGN KEY `fk_courses_has_tags_tags1`;

ALTER TABLE `school`.`students` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `school`.`courses` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `course_id` `course_id` INT(11) NOT NULL AUTO_INCREMENT ;

ALTER TABLE `school`.`enrollments` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
ADD COLUMN `coupon` VARCHAR(50) NULL DEFAULT NULL AFTER `price`,
CHANGE COLUMN `price` `price` DECIMAL(9,2) NOT NULL ,
DROP INDEX `fk_enrollments_students` ;
;

ALTER TABLE `school`.`tags` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `school`.`course_tags` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `school`.`instractors` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `school`.`courses` 
ADD CONSTRAINT `fk_courses_instractors1`
  FOREIGN KEY (`instractor_id`)
  REFERENCES `school`.`instractors` (`instractor_id`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;

ALTER TABLE `school`.`enrollments` 
DROP FOREIGN KEY `fk_enrollments_students`;

ALTER TABLE `school`.`enrollments` ADD CONSTRAINT `fk_enrollments_students`
  FOREIGN KEY (`student_id`)
  REFERENCES `school`.`students` (`student_id`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk_enrollments_courses`
  FOREIGN KEY (`course_id`)
  REFERENCES `school`.`courses` (`course_id`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;

ALTER TABLE `school`.`course_tags` 
ADD CONSTRAINT `fk_courses_has_tags_courses1`
  FOREIGN KEY (`course_id`)
  REFERENCES `school`.`courses` (`course_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_courses_has_tags_tags1`
  FOREIGN KEY (`tag_id`)
  REFERENCES `school`.`tags` (`tag_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
