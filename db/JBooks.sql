-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema JBooks
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema JBooks
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `JBooks` DEFAULT CHARACTER SET utf8 ;
USE `JBooks` ;

-- -----------------------------------------------------
-- Table `JBooks`.`Postcode`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `JBooks`.`Postcode` (
  `Postcode` VARCHAR(45) NOT NULL,
  `Street` VARCHAR(45) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Postcode`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `JBooks`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `JBooks`.`Address` (
  `House_Name/Number` VARCHAR(45) NOT NULL,
  `Postcode` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`House_Name/Number`, `Postcode`),
  INDEX `fk_house_no_idx` (`Postcode` ASC),
  CONSTRAINT `fk_postcode`
    FOREIGN KEY (`Postcode`)
    REFERENCES `JBooks`.`Postcode` (`Postcode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `JBooks`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `JBooks`.`User` (
  `Username` VARCHAR(20) NOT NULL,
  `Password` VARCHAR(29) NOT NULL,
  `House Name/Number` VARCHAR(15) NOT NULL,
  `Postcode` VARCHAR(15) NOT NULL,
  `Email_Address` VARCHAR(45) NOT NULL,
  `Contact_Number` INT NULL,
  `First_Name` VARCHAR(45) NULL,
  `Last_Name` VARCHAR(45) NULL,
  `Date_Of_Birth` DATE NULL,
  PRIMARY KEY (`Username`),
  INDEX `fk_user_lives_at_number_idx` (`House Name/Number` ASC),
  INDEX `fk_user_lives_at_postcode_idx` (`Postcode` ASC),
  CONSTRAINT `fk_user_lives_at_number`
    FOREIGN KEY (`House Name/Number`)
    REFERENCES `JBooks`.`Address` (`House_Name/Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_lives_at_postcode`
    FOREIGN KEY (`Postcode`)
    REFERENCES `JBooks`.`Address` (`Postcode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `JBooks`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `JBooks`.`Order` (
  `Order_ID` INT NOT NULL,
  `User_ID` VARCHAR(20) NOT NULL,
  `Price` DOUBLE NOT NULL,
  `Date` TIMESTAMP NOT NULL,
  `Order_Status` VARCHAR(15) NULL,
  PRIMARY KEY (`Order_ID`),
  INDEX `fk_user_has_order_idx` (`User_ID` ASC),
  CONSTRAINT `fk_user_has_order`
    FOREIGN KEY (`User_ID`)
    REFERENCES `JBooks`.`User` (`Username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `JBooks`.`Book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `JBooks`.`Book` (
  `ISBN` BIGINT(13) NOT NULL,
  `Title` VARCHAR(45) NOT NULL,
  `Author` VARCHAR(45) NOT NULL,
  `Synopsis` TEXT NOT NULL,
  `Release Date` DATE NOT NULL,
  `EBook` TINYINT(1) NOT NULL,
  `Quantity` INT NULL,
  `Price` DOUBLE NOT NULL,
  `Genre` VARCHAR(45) NOT NULL,
  `Edition` VARCHAR(45) NOT NULL,
  `Fiction/Non-fiction` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`ISBN`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `JBooks`.`Order_Item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `JBooks`.`Order_Item` (
  `Order_ID` INT NOT NULL,
  `Item` BIGINT(13) NOT NULL,
  INDEX `fk_oder_has_item_idx` (`Order_ID` ASC),
  INDEX `fk_item_is_book_idx` (`Item` ASC),
  CONSTRAINT `fk_order_has_item`
    FOREIGN KEY (`Order_ID`)
    REFERENCES `JBooks`.`Order` (`Order_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_is_book`
    FOREIGN KEY (`Item`)
    REFERENCES `JBooks`.`Book` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `JBooks`.`Basket_Item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `JBooks`.`Basket_Item` (
  `Username` VARCHAR(20) NOT NULL,
  `ISBN` BIGINT(13) NOT NULL,
  INDEX `fk_user_has_basket_idx` (`Username` ASC),
  INDEX `fk_book_is_in_basket_idx` (`ISBN` ASC),
  CONSTRAINT `fk_user_has_basket`
    FOREIGN KEY (`Username`)
    REFERENCES `JBooks`.`User` (`Username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_is_in_basket`
    FOREIGN KEY (`ISBN`)
    REFERENCES `JBooks`.`Book` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `JBooks`.`Book_Review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `JBooks`.`Book_Review` (
  `Review_ID` INT NOT NULL,
  `ISBN` BIGINT(13) NOT NULL,
  `Username` VARCHAR(20) NULL,
  `Review` TEXT NOT NULL,
  `Rating` INT NOT NULL,
  `Time` TIMESTAMP NOT NULL,
  PRIMARY KEY (`Review_ID`),
  INDEX `fk_review_is_for_idx` (`ISBN` ASC),
  INDEX `fk_review_is_left_by_idx` (`Username` ASC),
  CONSTRAINT `fk_review_is_for`
    FOREIGN KEY (`ISBN`)
    REFERENCES `JBooks`.`Book` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_is_left_by`
    FOREIGN KEY (`Username`)
    REFERENCES `JBooks`.`User` (`Username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO `JBooks`.`Postcode` (`Postcode`, `Street`, `City`, `Country`) VALUES ("ws23 3rg", "Main Street", "London", "England");
INSERT INTO `JBooks`.`Postcode` (`Postcode`, `Street`, `City`, `Country`) VALUES ("gd23 6gd", "First Street", "Manchester", "England");
INSERT INTO `JBooks`.`Postcode` (`Postcode`, `Street`, `City`, `Country`) VALUES ("ht25 7sd", "Second Street", "Birmingham", "England");
INSERT INTO `JBooks`.`Postcode` (`Postcode`, `Street`, `City`, `Country`) VALUES ("hf63 5hd", "Third Street", "Glasgow", "Scotland");
INSERT INTO `JBooks`.`Postcode` (`Postcode`, `Street`, `City`, `Country`) VALUES ("jd46 6hf", "Fourth Street", "Cardiff", "Wales");

INSERT INTO `JBooks`.`Address` (`House_Name/Number`, `Postcode`) VALUES (5453, "ws23 3rg");
INSERT INTO `JBooks`.`Address` (`House_Name/Number`, `Postcode`) VALUES (24, "gd23 6gd");
INSERT INTO `JBooks`.`Address` (`House_Name/Number`, `Postcode`) VALUES (525, "ht25 7sd");
INSERT INTO `JBooks`.`Address` (`House_Name/Number`, `Postcode`) VALUES (1453, "hf63 5hd");
INSERT INTO `JBooks`.`Address` (`House_Name/Number`, `Postcode`) VALUES (6535, "jd46 6hf");

INSERT INTO `JBooks`.`User` (`Username`, `Password`, `House Name/Number`, `Postcode`, `Email_Address`, `Contact_Number`, `First_Name`, `Last_Name`, `Date_Of_Birth`) 
VALUES ("UserOne", "PassOne", 5453, "ws23 3rg", "One@test.com", 11111111, "FirstOne", "LastOne", '2001/01/01');
INSERT INTO `JBooks`.`User` (`Username`, `Password`, `House Name/Number`, `Postcode`, `Email_Address`, `Contact_Number`, `First_Name`, `Last_Name`, `Date_Of_Birth`) 
VALUES ("UserTwo", "PassTwo", 24, "gd23 6gd", "Two@test.com", 22222222, "FirstTwo", "LastTwo", '2002/02/02');
INSERT INTO `JBooks`.`User` (`Username`, `Password`, `House Name/Number`, `Postcode`, `Email_Address`, `Contact_Number`, `First_Name`, `Last_Name`, `Date_Of_Birth`) 
VALUES ("UserThree", "PassThree", 525, "ht25 7sd", "Three@test.com", 33333333, "FirstThree", "LastThree", '2003/03/03');
INSERT INTO `JBooks`.`User` (`Username`, `Password`, `House Name/Number`, `Postcode`, `Email_Address`, `Contact_Number`, `First_Name`, `Last_Name`, `Date_Of_Birth`) 
VALUES ("UserFour", "PassFour", 1453, "hf63 5hd", "Four@test.com", 44444444, "FirstFour", "LastFour", '2004/04/04');
INSERT INTO `JBooks`.`User` (`Username`, `Password`, `House Name/Number`, `Postcode`, `Email_Address`, `Contact_Number`, `First_Name`, `Last_Name`, `Date_Of_Birth`) 
VALUES ("UserFive", "PassFive", 6535, "jd46 6hf", "Five@test.com", 55555555, "FirstFive", "LastFive", '2005/05/05');

INSERT INTO `JBooks`.`Order` (`Order_ID`, `User_ID`, `Price`, `Date`, `Order_Status`) VALUES (1, "UserOne", 99.99, '2018/07/12', "In Progress");
INSERT INTO `JBooks`.`Order` (`Order_ID`, `User_ID`, `Price`, `Date`, `Order_Status`) VALUES (2, "UserTwo", 99.99, '2018/03/23', "Complete");
INSERT INTO `JBooks`.`Order` (`Order_ID`, `User_ID`, `Price`, `Date`, `Order_Status`) VALUES (3, "UserThree", 99.99, '2018/06/25', "Complete");
INSERT INTO `JBooks`.`Order` (`Order_ID`, `User_ID`, `Price`, `Date`, `Order_Status`) VALUES (4, "UserFour", 99.99, '2018/03/17', "Complete");
INSERT INTO `JBooks`.`Order` (`Order_ID`, `User_ID`, `Price`, `Date`, `Order_Status`) VALUES (5, "UserFive", 99.99, '2018/01/24', "Complete");

INSERT INTO `JBooks`.`Book` (`ISBN`, `Title`, `Author`, `Synopsis`, `Release Date`, `EBook`, `Quantity`, `Price`, `Genre`, `Edition`, `Fiction/Non-fiction`) 
VALUES (1, "TitleOne", "AuthorOne", "SynopsisOne", '2001/01/01', FALSE, 1, 11.11,  "Murder_Mystery", "Hardback", "FICTION");
INSERT INTO `JBooks`.`Book` (`ISBN`, `Title`, `Author`, `Synopsis`, `Release Date`, `EBook`, `Quantity`, `Price`, `Genre`, `Edition`, `Fiction/Non-fiction`) 
VALUES (2, "TitleTwo", "AuthorTwo", "SynopsisTwo", '2002/02/02', FALSE, 2, 22.22, "Fantasy", "Paperback", "FICTION");
INSERT INTO `JBooks`.`Book` (`ISBN`, `Title`, `Author`, `Synopsis`, `Release Date`, `EBook`, `Quantity`, `Price`, `Genre`, `Edition`, `Fiction/Non-fiction`) 
VALUES (3, "TitleThree", "AuthorThree", "SynopsisThree", '2003/03/03', FALSE, 3, 33.33, "Atlas", "Hardback", "NON-FICTION");
INSERT INTO `JBooks`.`Book` (`ISBN`, `Title`, `Author`, `Synopsis`, `Release Date`, `EBook`, `Quantity`, `Price`, `Genre`, `Edition`, `Fiction/Non-fiction`) 
VALUES (4, "TitleFour", "AuthorFour", "SynopsisFour", '2004/04/04', FALSE, 4, 44.44, "Sci-fi", "Hardback", "FICTION");
INSERT INTO `JBooks`.`Book` (`ISBN`, `Title`, `Author`, `Synopsis`, `Release Date`, `EBook`, `Quantity`, `Price`, `Genre`, `Edition`, `Fiction/Non-fiction`) 
VALUES (5, "TitleFive", "AuthorFive", "SynopsisFive", '2005/05/05', FALSE, 5, 55.55, "Textbook", "Hardback", "NON-FICTION");

INSERT INTO `JBooks`.`Basket_Item` (`Username`, `ISBN`) VALUES ("UserOne", 1);
INSERT INTO `JBooks`.`Basket_Item` (`Username`, `ISBN`) VALUES ("UserTwo", 2);
INSERT INTO `JBooks`.`Basket_Item` (`Username`, `ISBN`) VALUES ("UserThree", 3);
INSERT INTO `JBooks`.`Basket_Item` (`Username`, `ISBN`) VALUES ("UserFour", 4);
INSERT INTO `JBooks`.`Basket_Item` (`Username`, `ISBN`) VALUES ("UserFive", 5);

INSERT INTO `JBooks`.`Order_Item` (`Order_ID`, `Item`) VALUES (1, 1);
INSERT INTO `JBooks`.`Order_Item` (`Order_ID`, `Item`) VALUES (2, 2);
INSERT INTO `JBooks`.`Order_Item` (`Order_ID`, `Item`) VALUES (3, 3);
INSERT INTO `JBooks`.`Order_Item` (`Order_ID`, `Item`) VALUES (4, 4);
INSERT INTO `JBooks`.`Order_Item` (`Order_ID`, `Item`) VALUES (5, 5);

INSERT INTO `JBooks`.`Book_Review` (`Review_ID`, `ISBN`, `Username`, `Review`, `Rating`, `Time`) VALUES (1, 1, "UserOne", "OneOneOneOne", 1, '2018/07/12');
INSERT INTO `JBooks`.`Book_Review` (`Review_ID`, `ISBN`, `Username`, `Review`, `Rating`, `Time`) VALUES (2, 2, "UserTwo", "TwoTwoTwoTwo", 1, '2018/03/23');
INSERT INTO `JBooks`.`Book_Review` (`Review_ID`, `ISBN`, `Username`, `Review`, `Rating`, `Time`) VALUES (3, 3, "UserThree", "ThreeThreeThreeThree", 1, '2018/06/25');
INSERT INTO `JBooks`.`Book_Review` (`Review_ID`, `ISBN`, `Username`, `Review`, `Rating`, `Time`) VALUES (4, 4, "UserFour", "FourFourFourFour", 1, '2018/03/17');
INSERT INTO `JBooks`.`Book_Review` (`Review_ID`, `ISBN`, `Username`, `Review`, `Rating`, `Time`) VALUES (5, 5, "UserFive", "FiveFiveFiveFive", 1, '2018/01/24');