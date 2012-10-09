SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `thesl` ;
CREATE SCHEMA IF NOT EXISTS `thesl` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
SHOW WARNINGS;
USE `thesl` ;

-- -----------------------------------------------------
-- Table `thesl`.`sl_user_login`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `thesl`.`sl_user_login` (
  `user_login_id` INT NOT NULL AUTO_INCREMENT ,
  `sl_user_id` BIGINT NOT NULL ,
  `login_domain` VARCHAR(145) NOT NULL ,
  `login_name` VARCHAR(85) NOT NULL ,
  `login_passwd` VARCHAR(45) NOT NULL ,
  `login_status` TINYINT NOT NULL ,
  PRIMARY KEY (`user_login_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `thesl`.`sl_users`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `thesl`.`sl_users` (
  `user_id` INT NOT NULL AUTO_INCREMENT ,
  `user_fname` VARCHAR(45) NOT NULL ,
  `user_lname` VARCHAR(45) NOT NULL ,
  `user_username` VARCHAR(45) NOT NULL ,
  `user_email` VARCHAR(155) NOT NULL ,
  `user_passwd` VARCHAR(45) NOT NULL ,
  `user_dob` DATE NOT NULL ,
  `user_tob` TIME NOT NULL ,
  `user_refid` TINYINT(3) NULL DEFAULT NULL ,
  `user_created` DATETIME NOT NULL ,
  `user_updated` DATETIME NULL DEFAULT NULL ,
  `user_phone` VARCHAR(45) NULL DEFAULT NULL ,
  `user_mobile` VARCHAR(45) NULL DEFAULT NULL ,
  `user_status` TINYINT(1) NOT NULL ,
  `user_icon` INT NULL ,
  PRIMARY KEY (`user_id`) ,
  CONSTRAINT `fk_users_user_login`
    FOREIGN KEY (`user_icon` )
    REFERENCES `thesl`.`sl_user_login` (`user_login_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `user_email_UNIQUE` ON `thesl`.`sl_users` (`user_email` ASC) ;

SHOW WARNINGS;
CREATE INDEX `fk_users_user_login` ON `thesl`.`sl_users` (`user_icon` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `thesl`.`sl_user_relationships`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `thesl`.`sl_user_relationships` (
  `rel_id` INT NOT NULL AUTO_INCREMENT ,
  `rel_user_id` BIGINT NOT NULL ,
  `rel_sec_user_id` BIGINT NOT NULL ,
  `rel_name` VARCHAR(45) NOT NULL ,
  `rel_created` DATE NOT NULL ,
  `rel_status_id` TINYINT(1) NULL ,
  PRIMARY KEY (`rel_id`) )
ENGINE = InnoDB
COMMENT = 'A table to map relationships';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `thesl`.`sl_relationships`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `thesl`.`sl_relationships` (
  `rel_id` INT NOT NULL AUTO_INCREMENT ,
  `rel_name` VARCHAR(295) NOT NULL ,
  `rel_date` VARCHAR(45) NULL ,
  `rel_personality` LONGTEXT NOT NULL ,
  `rel_traits` LONGTEXT NOT NULL ,
  `rel_prognosis` LONGTEXT NOT NULL ,
  PRIMARY KEY (`rel_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `thesl`.`sl_relationship_traits`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `thesl`.`sl_relationship_traits` (
  `rel_trait_id` INT NOT NULL ,
  `rel_trait_name` VARCHAR(145) NOT NULL ,
  `re_trait_status` TINYINT NULL ,
  PRIMARY KEY (`rel_trait_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `thesl`.`sl_birthday_traits`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `thesl`.`sl_birthday_traits` (
  `bday_trait_id` INT NOT NULL AUTO_INCREMENT ,
  `bday_trait_name` VARCHAR(145) NOT NULL ,
  `bday_trait_status` TINYINT NOT NULL ,
  PRIMARY KEY (`bday_trait_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `thesl`.`sl_relationship_content`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `thesl`.`sl_relationship_content` (
  `rel_content_id` INT NOT NULL AUTO_INCREMENT ,
  `rel_period1` TINYINT(3) NOT NULL ,
  `rel_period2` TINYINT(3) NOT NULL ,
  `rel_icon` VARCHAR(45) NULL ,
  `rel_title` VARCHAR(255) NOT NULL ,
  `rel_s1` VARCHAR(50) NULL ,
  `rel_s2` VARCHAR(50) NULL ,
  `rel_s3` VARCHAR(50) NULL ,
  `rel_w1` VARCHAR(50) NULL ,
  `rel_w2` VARCHAR(50) NULL ,
  `rel_w3` VARCHAR(50) NULL ,
  `rel_advice` TEXT NOT NULL ,
  `rel_ideal` TEXT NOT NULL ,
  `rel_problems` TEXT NOT NULL ,
  `rel_person1` VARCHAR(255) NOT NULL ,
  `rel_person2` VARCHAR(255) NOT NULL ,
  `rel_dob1` DATE NOT NULL ,
  `rel_dob2` DATE NOT NULL ,
  `rel_details` TEXT NULL ,
  PRIMARY KEY (`rel_content_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `rel_dob1_UNIQUE` ON `thesl`.`sl_relationship_content` (`rel_dob1` ASC) ;

SHOW WARNINGS;
CREATE UNIQUE INDEX `rel_dob2_UNIQUE` ON `thesl`.`sl_relationship_content` (`rel_dob2` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `thesl`.`sl_ways`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `thesl`.`sl_ways` (
  `sl_way_id` INT NOT NULL ,
  `sl_way_of` VARCHAR(50) NOT NULL ,
  `sl_way_span_period` VARCHAR(50) NOT NULL ,
  `sl_way_span_name` VARCHAR(50) NOT NULL ,
  `sl_way_report` TEXT NOT NULL ,
  `sl_way_suggestion` TEXT NOT NULL ,
  `sl_way_core_lesson` TEXT NOT NULL ,
  `sl_way_goal` VARCHAR(255) NOT NULL ,
  `sl_way_gifts` VARCHAR(255) NOT NULL ,
  `sl_way_pitfalls` VARCHAR(255) NULL ,
  `sl_way_release` VARCHAR(255) NULL ,
  `sl_way_reward` VARCHAR(255) NULL ,
  `sl_way_balance_point` VARCHAR(255) NULL ,
  `sl_way_stones` VARCHAR(255) NULL ,
  `sl_way_notables` TEXT NULL ,
  `sl_way_noteables` TEXT NULL ,
  `sl_way_other_notables` TEXT NULL ,
  `sl_way_birthdays` TEXT NOT NULL ,
  PRIMARY KEY (`sl_way_id`, `sl_way_birthdays`) )
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `sl_way_id_UNIQUE` ON `thesl`.`sl_ways` (`sl_way_id` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `thesl`.`sl_users_relationships`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `thesl`.`sl_users_relationships` (
  `users_user_id` INT NOT NULL ,
  `user_relationships_rel_id` INT NOT NULL ,
  PRIMARY KEY (`users_user_id`, `user_relationships_rel_id`) ,
  CONSTRAINT `fk_users_has_user_relationships_users1`
    FOREIGN KEY (`users_user_id` )
    REFERENCES `thesl`.`sl_users` (`user_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_user_relationships_user_relationships1`
    FOREIGN KEY (`user_relationships_rel_id` )
    REFERENCES `thesl`.`sl_user_relationships` (`rel_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_users_has_user_relationships_user_relationships1` ON `thesl`.`sl_users_relationships` (`user_relationships_rel_id` ASC) ;

SHOW WARNINGS;
CREATE INDEX `fk_users_has_user_relationships_users1` ON `thesl`.`sl_users_relationships` (`users_user_id` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `thesl`.`sl_albums`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `thesl`.`sl_albums` (
  `sl_album_id` INT NOT NULL AUTO_INCREMENT ,
  `sl_album_title` VARCHAR(255) NOT NULL ,
  `sl_user_id` BIGINT NOT NULL ,
  `sl_album_created` DATETIME NOT NULL ,
  `sl_album_status` TINYINT NOT NULL ,
  `sl_album_updated` TINYINT NOT NULL ,
  `sl_album_location` VARCHAR(145) NULL ,
  PRIMARY KEY (`sl_album_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `thesl`.`sl_photos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `thesl`.`sl_photos` (
  `sl_photo_id` INT NOT NULL AUTO_INCREMENT ,
  `sl_album_id` INT NOT NULL ,
  `sl_photo_caption` VARCHAR(255) NULL ,
  `sl_photo_location` VARCHAR(255) NULL ,
  `sl_photo_uploaded` DATETIME NOT NULL ,
  `sl_photo_updated` DATETIME NULL ,
  `sl_photo_status` TINYINT NOT NULL ,
  `sl_photo_name` VARCHAR(255) NULL ,
  PRIMARY KEY (`sl_photo_id`) ,
  CONSTRAINT `fk_sl_photos_1`
    FOREIGN KEY (`sl_album_id` )
    REFERENCES `thesl`.`sl_albums` (`sl_album_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_sl_photos_1` ON `thesl`.`sl_photos` (`sl_album_id` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `thesl`.`sl_users_friends`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `thesl`.`sl_users_friends` (
  `sl_users_friends_id` INT NOT NULL AUTO_INCREMENT ,
  `sl_user_id` BIGINT NOT NULL ,
  `sl_friend_id` BIGINT NOT NULL ,
  `sl_status` TINYINT NOT NULL ,
  PRIMARY KEY (`sl_users_friends_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `thesl`.`sl_logins`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `thesl`.`sl_logins` (
  `sl_login_id` INT NOT NULL AUTO_INCREMENT ,
  `sl_user_id` BIGINT NOT NULL ,
  `sl_timestamp` TIMESTAMP NOT NULL ,
  `sl_ref_id` INT NULL ,
  PRIMARY KEY (`sl_login_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `thesl`.`sl_api_usage`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `thesl`.`sl_api_usage` (
  `sl_api_user_id` INT NOT NULL AUTO_INCREMENT ,
  `sl_api_key` VARCHAR(45) NOT NULL ,
  `sl_api_ref` VARCHAR(255) NOT NULL ,
  `sl_api_created` DATETIME NOT NULL ,
  `sl_api_status` TINYINT(1) NOT NULL ,
  PRIMARY KEY (`sl_api_user_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `thesl`.`sl_user_profile`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `thesl`.`sl_user_profile` (
  `sl_user_profile_id` INT NOT NULL AUTO_INCREMENT ,
  `sl_user_id` BIGINT NOT NULL ,
  `sl_user_gender` INT NOT NULL ,
  `sl_user_age` INT NULL ,
  `sl_user_bodytype` TINYINT(1) NULL ,
  `sl_user_height` INT NULL ,
  `sl_user_smoke` TINYINT(1) NULL ,
  `sl_user_kids` TINYINT(2) NULL ,
  `sl_user_drink` TINYINT(1) NULL ,
  `sl_user_drugs` TINYINT(1) NULL ,
  `sl_user_hair` TINYINT(1) NULL ,
  `sl_user_eyecolor` TINYINT(1) NULL ,
  `sl_user_education` TINYINT(1) NULL ,
  `sl_user_ethnicity` TINYINT(1) NULL ,
  `sl_user_religion` TINYINT(1) NULL ,
  `sl_user_want_kids` TINYINT(1) NULL ,
  `sl_user_marital` TINYINT(1) NULL ,
  `sl_user_job` INT NULL ,
  `sl_user_income` INT NULL ,
  `sl_user_sex_orientation` TINYINT(1) NULL ,
  PRIMARY KEY (`sl_user_profile_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `thesl`.`sl_eyecolor`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `thesl`.`sl_eyecolor` (
  `sl_eyecolor_id` INT NOT NULL AUTO_INCREMENT ,
  `sl_eyecolor_name` VARCHAR(45) NULL ,
  PRIMARY KEY (`sl_eyecolor_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `thesl`.`sl_gender`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `thesl`.`sl_gender` (
  `sl_gender_id` INT NOT NULL AUTO_INCREMENT ,
  `sl_gender_name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`sl_gender_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `thesl`.`sl_bodytype`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `thesl`.`sl_bodytype` (
  `sl_bodytype_id` INT NOT NULL AUTO_INCREMENT ,
  `sl_bodytype_name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`sl_bodytype_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `thesl`.`sl_religion`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `thesl`.`sl_religion` (
  `sl_religion_id` INT NOT NULL AUTO_INCREMENT ,
  `sl_religion_name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`sl_religion_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `thesl`.`sl_smoke`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `thesl`.`sl_smoke` (
  `sl_smoke_id` INT NOT NULL AUTO_INCREMENT ,
  `sl_smoke_name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`sl_smoke_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `thesl`.`sl_marital`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `thesl`.`sl_marital` (
  `sl_marital` INT NOT NULL AUTO_INCREMENT ,
  `sl_marital_name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`sl_marital`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `thesl`.`sl_income`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `thesl`.`sl_income` (
  `sl_income_id` INT NOT NULL AUTO_INCREMENT ,
  `sl_income_range` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`sl_income_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `thesl`.`sl_industry`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `thesl`.`sl_industry` (
  `sl_job_id` INT NOT NULL AUTO_INCREMENT ,
  `sl_job_name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`sl_job_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `thesl`.`sl_sex_orientation`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `thesl`.`sl_sex_orientation` (
  `sl_sex_orientation_id` INT ZEROFILL NOT NULL ,
  `sl_sex_orientation_name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`sl_sex_orientation_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `thesl`.`sl_haircolor`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `thesl`.`sl_haircolor` (
  `sl_haircolor_id` INT NOT NULL AUTO_INCREMENT ,
  `sl_haircolor_name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`sl_haircolor_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `thesl`.`sl_user_images`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `thesl`.`sl_user_images` (
  `sl_user_image_id` INT ZEROFILL NOT NULL ,
  `sl_user_id` BIGINT NOT NULL ,
  `sl_image_status` TINYINT(1) NULL DEFAULT 1 ,
  PRIMARY KEY (`sl_user_image_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `thesl`.`sl_eyecolor`
-- -----------------------------------------------------
START TRANSACTION;
USE `thesl`;
INSERT INTO `thesl`.`sl_eyecolor` (`sl_eyecolor_id`, `sl_eyecolor_name`) VALUES (1, 'brown');
INSERT INTO `thesl`.`sl_eyecolor` (`sl_eyecolor_id`, `sl_eyecolor_name`) VALUES (2, 'blue');
INSERT INTO `thesl`.`sl_eyecolor` (`sl_eyecolor_id`, `sl_eyecolor_name`) VALUES (3, 'green');
INSERT INTO `thesl`.`sl_eyecolor` (`sl_eyecolor_id`, `sl_eyecolor_name`) VALUES (4, 'grey');
INSERT INTO `thesl`.`sl_eyecolor` (`sl_eyecolor_id`, `sl_eyecolor_name`) VALUES (5, 'black');

COMMIT;

-- -----------------------------------------------------
-- Data for table `thesl`.`sl_gender`
-- -----------------------------------------------------
START TRANSACTION;
USE `thesl`;
INSERT INTO `thesl`.`sl_gender` (`sl_gender_id`, `sl_gender_name`) VALUES (1, 'male');
INSERT INTO `thesl`.`sl_gender` (`sl_gender_id`, `sl_gender_name`) VALUES (2, 'female');
INSERT INTO `thesl`.`sl_gender` (`sl_gender_id`, `sl_gender_name`) VALUES (3, 'trans_male');
INSERT INTO `thesl`.`sl_gender` (`sl_gender_id`, `sl_gender_name`) VALUES (4, 'trans_female');

COMMIT;

-- -----------------------------------------------------
-- Data for table `thesl`.`sl_bodytype`
-- -----------------------------------------------------
START TRANSACTION;
USE `thesl`;
INSERT INTO `thesl`.`sl_bodytype` (`sl_bodytype_id`, `sl_bodytype_name`) VALUES (1, 'thin');
INSERT INTO `thesl`.`sl_bodytype` (`sl_bodytype_id`, `sl_bodytype_name`) VALUES (2, 'athletic');
INSERT INTO `thesl`.`sl_bodytype` (`sl_bodytype_id`, `sl_bodytype_name`) VALUES (3, 'a few extra pounds');
INSERT INTO `thesl`.`sl_bodytype` (`sl_bodytype_id`, `sl_bodytype_name`) VALUES (4, 'heavy');

COMMIT;

-- -----------------------------------------------------
-- Data for table `thesl`.`sl_religion`
-- -----------------------------------------------------
START TRANSACTION;
USE `thesl`;
INSERT INTO `thesl`.`sl_religion` (`sl_religion_id`, `sl_religion_name`) VALUES (1, 'atheist');
INSERT INTO `thesl`.`sl_religion` (`sl_religion_id`, `sl_religion_name`) VALUES (2, 'jewish');
INSERT INTO `thesl`.`sl_religion` (`sl_religion_id`, `sl_religion_name`) VALUES (3, 'christian');
INSERT INTO `thesl`.`sl_religion` (`sl_religion_id`, `sl_religion_name`) VALUES (4, 'muslim');
INSERT INTO `thesl`.`sl_religion` (`sl_religion_id`, `sl_religion_name`) VALUES (5, 'bodahist');
INSERT INTO `thesl`.`sl_religion` (`sl_religion_id`, `sl_religion_name`) VALUES (6, 'hindo');
INSERT INTO `thesl`.`sl_religion` (`sl_religion_id`, `sl_religion_name`) VALUES (7, 'scientologist');

COMMIT;

-- -----------------------------------------------------
-- Data for table `thesl`.`sl_smoke`
-- -----------------------------------------------------
START TRANSACTION;
USE `thesl`;
INSERT INTO `thesl`.`sl_smoke` (`sl_smoke_id`, `sl_smoke_name`) VALUES (1, 'Smoking');
INSERT INTO `thesl`.`sl_smoke` (`sl_smoke_id`, `sl_smoke_name`) VALUES (2, 'Smoking but trying to quit');
INSERT INTO `thesl`.`sl_smoke` (`sl_smoke_id`, `sl_smoke_name`) VALUES (3, 'Not Smoking');
INSERT INTO `thesl`.`sl_smoke` (`sl_smoke_id`, `sl_smoke_name`) VALUES (4, 'Light Smoker');

COMMIT;

-- -----------------------------------------------------
-- Data for table `thesl`.`sl_marital`
-- -----------------------------------------------------
START TRANSACTION;
USE `thesl`;
INSERT INTO `thesl`.`sl_marital` (`sl_marital`, `sl_marital_name`) VALUES (1, 'Single');
INSERT INTO `thesl`.`sl_marital` (`sl_marital`, `sl_marital_name`) VALUES (2, 'Married');
INSERT INTO `thesl`.`sl_marital` (`sl_marital`, `sl_marital_name`) VALUES (3, 'Divorced');
INSERT INTO `thesl`.`sl_marital` (`sl_marital`, `sl_marital_name`) VALUES (4, 'Separeted');
INSERT INTO `thesl`.`sl_marital` (`sl_marital`, `sl_marital_name`) VALUES (5, 'Widowed');

COMMIT;

-- -----------------------------------------------------
-- Data for table `thesl`.`sl_income`
-- -----------------------------------------------------
START TRANSACTION;
USE `thesl`;
INSERT INTO `thesl`.`sl_income` (`sl_income_id`, `sl_income_range`) VALUES (1, 'less than 25,000');
INSERT INTO `thesl`.`sl_income` (`sl_income_id`, `sl_income_range`) VALUES (2, '25,001 to 35,000');
INSERT INTO `thesl`.`sl_income` (`sl_income_id`, `sl_income_range`) VALUES (3, '35,001 to 50,000');
INSERT INTO `thesl`.`sl_income` (`sl_income_id`, `sl_income_range`) VALUES (4, '50,001 to 75,000');
INSERT INTO `thesl`.`sl_income` (`sl_income_id`, `sl_income_range`) VALUES (5, '75,001 to 100,000');
INSERT INTO `thesl`.`sl_income` (`sl_income_id`, `sl_income_range`) VALUES (6, '100,001 to 150,000');
INSERT INTO `thesl`.`sl_income` (`sl_income_id`, `sl_income_range`) VALUES (7, 'over 150,000');

COMMIT;

-- -----------------------------------------------------
-- Data for table `thesl`.`sl_industry`
-- -----------------------------------------------------
START TRANSACTION;
USE `thesl`;
INSERT INTO `thesl`.`sl_industry` (`sl_job_id`, `sl_job_name`) VALUES (1, 'Administrative / Secretarial');
INSERT INTO `thesl`.`sl_industry` (`sl_job_id`, `sl_job_name`) VALUES (2, 'Architecture / Interior design');
INSERT INTO `thesl`.`sl_industry` (`sl_job_id`, `sl_job_name`) VALUES (3, 'Artistic / Creative / Performance');
INSERT INTO `thesl`.`sl_industry` (`sl_job_id`, `sl_job_name`) VALUES (4, 'Education / Teacher / Professor');
INSERT INTO `thesl`.`sl_industry` (`sl_job_id`, `sl_job_name`) VALUES (5, 'Executive / Management');
INSERT INTO `thesl`.`sl_industry` (`sl_job_id`, `sl_job_name`) VALUES (6, 'Fashion / Model / Beauty');
INSERT INTO `thesl`.`sl_industry` (`sl_job_id`, `sl_job_name`) VALUES (7, 'Financial / Accounting / Real Estate');
INSERT INTO `thesl`.`sl_industry` (`sl_job_id`, `sl_job_name`) VALUES (8, 'Labor / Construction');
INSERT INTO `thesl`.`sl_industry` (`sl_job_id`, `sl_job_name`) VALUES (9, 'Law enforcement / Security / Military');
INSERT INTO `thesl`.`sl_industry` (`sl_job_id`, `sl_job_name`) VALUES (10, 'Legal');
INSERT INTO `thesl`.`sl_industry` (`sl_job_id`, `sl_job_name`) VALUES (11, 'Medical / Dental / Veterinary / Fitness');
INSERT INTO `thesl`.`sl_industry` (`sl_job_id`, `sl_job_name`) VALUES (12, 'Nonprofit / Volunteer / Activist');
INSERT INTO `thesl`.`sl_industry` (`sl_job_id`, `sl_job_name`) VALUES (13, 'Political / Govt / Civil Service / Military');
INSERT INTO `thesl`.`sl_industry` (`sl_job_id`, `sl_job_name`) VALUES (14, 'Retail / Food services');
INSERT INTO `thesl`.`sl_industry` (`sl_job_id`, `sl_job_name`) VALUES (15, 'Retired');
INSERT INTO `thesl`.`sl_industry` (`sl_job_id`, `sl_job_name`) VALUES (16, 'Sales / Marketing');
INSERT INTO `thesl`.`sl_industry` (`sl_job_id`, `sl_job_name`) VALUES (17, 'Self-Employed / Entrepreneur');
INSERT INTO `thesl`.`sl_industry` (`sl_job_id`, `sl_job_name`) VALUES (18, 'Student');
INSERT INTO `thesl`.`sl_industry` (`sl_job_id`, `sl_job_name`) VALUES (19, 'Technical / Science / Computers / Engineering');
INSERT INTO `thesl`.`sl_industry` (`sl_job_id`, `sl_job_name`) VALUES (20, 'Travel / Hospitality / Transportation');
INSERT INTO `thesl`.`sl_industry` (`sl_job_id`, `sl_job_name`) VALUES (21, 'Other');

COMMIT;

-- -----------------------------------------------------
-- Data for table `thesl`.`sl_sex_orientation`
-- -----------------------------------------------------
START TRANSACTION;
USE `thesl`;
INSERT INTO `thesl`.`sl_sex_orientation` (`sl_sex_orientation_id`, `sl_sex_orientation_name`) VALUES (1, 'Straight');
INSERT INTO `thesl`.`sl_sex_orientation` (`sl_sex_orientation_id`, `sl_sex_orientation_name`) VALUES (2, 'Homosexual');
INSERT INTO `thesl`.`sl_sex_orientation` (`sl_sex_orientation_id`, `sl_sex_orientation_name`) VALUES (3, 'Lesbian');
INSERT INTO `thesl`.`sl_sex_orientation` (`sl_sex_orientation_id`, `sl_sex_orientation_name`) VALUES (4, 'Bi-Sexual');

COMMIT;

-- -----------------------------------------------------
-- Data for table `thesl`.`sl_haircolor`
-- -----------------------------------------------------
START TRANSACTION;
USE `thesl`;
INSERT INTO `thesl`.`sl_haircolor` (`sl_haircolor_id`, `sl_haircolor_name`) VALUES (1, 'bold');
INSERT INTO `thesl`.`sl_haircolor` (`sl_haircolor_id`, `sl_haircolor_name`) VALUES (2, 'black');
INSERT INTO `thesl`.`sl_haircolor` (`sl_haircolor_id`, `sl_haircolor_name`) VALUES (3, 'blond');
INSERT INTO `thesl`.`sl_haircolor` (`sl_haircolor_id`, `sl_haircolor_name`) VALUES (4, 'red');
INSERT INTO `thesl`.`sl_haircolor` (`sl_haircolor_id`, `sl_haircolor_name`) VALUES (5, 'brown');

COMMIT;
