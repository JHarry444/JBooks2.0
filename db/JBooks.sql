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
  `ISBN` CHAR(13) NOT NULL,
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

INSERT INTO `jbooks`.`book`
(`ISBN`,
`Title`,
`Author`,
`Synopsis`,
`Release Date`,
`EBook`,
`Quantity`,
`Price`,
`Genre`,
`Edition`,
`Fiction/Non-fiction`)
VALUES
('9780451463173', 'Changes', 'Jim Butcher', 'Meet Harry Dresden, Chicago\'s first (and only) Wizard P.I. Turns out the \'everyday\' world is full of strange and magical things - and most of them don\'t play well with humans. That\'s where Harry comes in.', '2011-03-03', '0', '44', '10.24', 'SCI_FI', 'Paperback', 'FICTION');
INSERT INTO `jbooks`.`book`
(`ISBN`,
`Title`,
`Author`,
`Synopsis`,
`Release Date`,
`EBook`,
`Quantity`,
`Price`,
`Genre`,
`Edition`,
`Fiction/Non-fiction`)
VALUES
('9780451457813',
'Storm Front',
'Jim Butcher',
'Harry\'s business as a private investigator has been quiet lately - so when the police bring him in to consult on a grisly double murder committed with black magic, he\'s seeing dollar signs. But where there\'s black magic, there\'s a black mage behind it. And now that mage knows Harry\'s name. Magic - it can get a guy killed.',
'2011/05/05',
false,
33,
9.99,
'SCI_FI',
'Paperback',
'FICTION');
INSERT INTO `jbooks`.`book`
(`ISBN`,
`Title`,
`Author`,
`Synopsis`,
`Release Date`,
`EBook`,
`Quantity`,
`Price`,
`Genre`,
`Edition`,
`Fiction/Non-fiction`)
VALUES
('0451458125',
'Fool Moon',
'Jim Butcher',
"Business has been slow lately for Harry Dresden. Okay, business has been dead. Not undead - just dead. You would think Chicago would have a little more action for the only professional wizard in the phone book. But lately, Harry hasn't been able to dredge up any kind of work - magical or mundane. But just when it looks like he can't afford his next meal, a murder comes along that requires his particular brand of supernatural expertise. A brutally mutilated corpse. Strange-looking paw prints. A full moon. Take three guesses. And the first two don't count . . . ",
'2011/05/05',
false,
25,
9.99,
'SCI_FI',
'Paperback',
'FICTION');

INSERT INTO `jbooks`.`book`
(`ISBN`,
`Title`,
`Author`,
`Synopsis`,
`Release Date`,
`EBook`,
`Quantity`,
`Price`,
`Genre`,
`Edition`,
`Fiction/Non-fiction`)
VALUES
('9780451462756',
'Summer Knight',
'Jim Butcher',
"Since his girlfriend left town to deal with her newly acquired taste for blood, Harry's been down and out. He can't pay his rent. He's alienating his friends. He can't recall his last shower. Then when things are at their worst, the Winter Queen of Faerie saunters in with an offer Harry can't refuse. All he has to do is find out who murdered the Summer Knight, the Summer Queen's right-hand man, and clear the Winter Queen's name. It seems simple, but Faerie politics seldom work out that way. Then Harry discovers the fate of the entire world rests on this case. So no pressure . . .",
'2011/05/05',
false,
14,
9.99,
'SCI_FI',
'Paperback',
'FICTION');

INSERT INTO `jbooks`.`book`
(`ISBN`,
`Title`,
`Author`,
`Synopsis`,
`Release Date`,
`EBook`,
`Quantity`,
`Price`,
`Genre`,
`Edition`,
`Fiction/Non-fiction`)
VALUES
('9781841494005',
'Grave Peril',
'Jim Butcher',
"All over town, ghosts are causing trouble - and not the door-slamming, boo-shouting variety. These ghosts are tormented, violent, and deadly. Someone is stirring them up to wreak havoc. But why? And why do so many of the victims have ties to Harry? If Harry doesn't figure it out soon, he might just wind up a ghost himself.",
'2011/05/05',
false,
29,
9.99,
'SCI_FI',
'Paperback',
'FICTION');

INSERT INTO `jbooks`.`book`
(`ISBN`,
`Title`,
`Author`,
`Synopsis`,
`Release Date`,
`EBook`,
`Quantity`,
`Price`,
`Genre`,
`Edition`,
`Fiction/Non-fiction`)
VALUES
('9780451463357',
'Blood Rites',
'Jim Butcher',
"Harry's had worse assignments than going undercover on the set of an adult film. Dodging flaming monkey poo, for instance. Or going toe-to-leaf with a plant monster. Still, there's something troubling about this case. The Producer believes he's afflicted by an entropy curse - but it's the women around him who are dying. And Harry only got involved as a favour to Thomas, his flirtatious self-absorbed vampire acquaintance. Thomas has a personal stake in the case Harry can't work out, until his investigation leads him straight to Thomas's oversexed relatives. Harry's about to discover the skeleton in Thomas's family closet: a revelation that will change Harry's life for ever.",
'2011/05/05',
false,
14,
9.99,
'SCI_FI',
'Paperback',
'FICTION');
INSERT INTO `jbooks`.`book`
(`ISBN`,
`Title`,
`Author`,
`Synopsis`,
`Release Date`,
`EBook`,
`Quantity`,
`Price`,
`Genre`,
`Edition`,
`Fiction/Non-fiction`)
VALUES
('9781429514897',
'Dead Beat',
'Jim Butcher',
"Although most people don't believe in magic, the Chicago P.D. has a Special Investigations department, headed by his good friend Karrin Murphy. They deal with the . . . stranger cases. It's down to Karrin that Harry sneaks into Graceland Cemetery to meet a vampire named Mavra. Mavra has evidence that would destroy Karrin's career, and her demands are simple. She wants the Word of Kemmler - and all the power that comes with it. But first, Harry's keen to know what he'd be handing over. Before long he's racing against time, and six necromancers, to get the Word. And to prevent a Halloween that would truly wake the dead.",
'2011/05/05',
false,
8,
9.99,
'SCI_FI',
'Paperback',
'FICTION');
INSERT INTO `jbooks`.`book`
(`ISBN`,
`Title`,
`Author`,
`Synopsis`,
`Release Date`,
`EBook`,
`Quantity`,
`Price`,
`Genre`,
`Edition`,
`Fiction/Non-fiction`)
VALUES
('0451460855',
'Proven Guilty',
'Jim Butcher',
"Harry has no friends on the White Council of Wizards, who find him brash and undisciplined (and they may have a point). However, now vampire wars have thinned out the wizards a little, they need him. So before he can blink, he's assigned to investigate rumours of black magic. Harry's other problem is an old friend's daughter - all grown-up and in trouble already. Her boyfriend insists he's innocent of something resembling a crime straight out of a horror film. This first impression turns out to be . . . well, pretty accurate, as Harry discovers malevolent entities feeding on fear. All in a day's work for a wizard, his dog, and a talking skull named Bob.",
'2011/05/05',
false,
8,
9.99,
'SCI_FI',
'Paperback',
'FICTION');
INSERT INTO `jbooks`.`book`
(`ISBN`,
`Title`,
`Author`,
`Synopsis`,
`Release Date`,
`EBook`,
`Quantity`,
`Price`,
`Genre`,
`Edition`,
`Fiction/Non-fiction`)
VALUES
('9780451462565',
'Turn Coat',
'Jim Butcher',
"Harry has always tried to keep his nose clean where the White Council of Wizards is concerned, but past misdeeds haven't gone down well. Which places him in an awkward position. Morgan, formerly his chief persecutor on the Council, has been wrongly accused of treason. Facing the ultimate punishment, Morgan needs someone with a knack for backing the underdog, however much that someone isn't interested. Soon, Harry is working to clear the less-than-agreeable Morgan's name, hiding from the Council and bounty hunters alike and seeking the true turncoat. A single mistake may mean that heads - quite literally - could roll. And one of them might be his.",
'2011/05/05',
false,
88,
9.99,
'SCI_FI',
'Paperback',
'FICTION');