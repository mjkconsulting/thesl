SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP DATABASE IF EXISTS `thesl`;

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
  PRIMARY KEY (`user_login_id`)
)
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
  PRIMARY KEY (`user_id`) 
)
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
  PRIMARY KEY (`sl_way_id`) )
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

CREATE TABLE IF NOT EXISTS `thesl`.`sl_oauth_session_scopes` (
  `session_id` int(11) NOT NULL,
  `access_token` text,
  `scope` varchar(64) NOT NULL default ''
) ENGINE = InnoDB;

SHOW WARNINGS;

CREATE TABLE IF NOT EXISTS `thesl`.`sl_oauth_sessions` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `client_id` varchar(32) NOT NULL default '',
  `redirect_uri` text NOT NULL,
  `user_id` varchar(64) default NULL,
  `code` text,
  `access_token` text,
  `stage` enum('request','granted') NOT NULL default 'request',
  `first_requested` int(10) unsigned NOT NULL,
  `last_updated` int(10) unsigned NOT NULL,
  `limited` tinyint(1) default '0',
  PRIMARY KEY  (`id`)
) ENGINE = InnoDB;

SHOW WARNINGS;

CREATE  TABLE IF NOT EXISTS `thesl`.`sl_applications` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(64) NOT NULL default '',
  `client_id` varchar(32) NOT NULL default '',
  `client_secret` varchar(32) NOT NULL default '',
  `redirect_uri` text NOT NULL,
  `developer_name` varchar(64) default NULL,
  `developer_url` text,
  `developer_email` text,
  `auto_approve` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `client_id` (`client_id`)
) ENGINE = InnoDB;

SHOW WARNINGS;

insert into sl_users (user_fname, user_lname, user_username, user_email, user_passwd, user_dob, user_tob, user_refid, user_created, user_updated, user_phone, user_mobile, user_status, user_icon) 
values ('Oren', 'Shepes', 'oren', 'oren@thesl.com', '286fd7bdfe53d209942f9b238b87eb4f', '1973-01-17', '00:00:00', 1, now(), now(), '818-988-8343', '818-883-3433', 1, 1009);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
