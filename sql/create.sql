CREATE TABLE `Users` (
	`Id` BINARY NOT NULL AUTO_INCREMENT,
	`Login` varchar(128) NOT NULL,
	`Email` varchar(255) NOT NULL UNIQUE,
	`Phone` varchar(12) NOT NULL UNIQUE,
	`Birthday` DATE(12),
	`Image` blob,
	`Rating` INT NOT NULL DEFAULT '0',
	`Register_Date` DATETIME NOT NULL,
	PRIMARY KEY (`Id`)
);

CREATE TABLE `Posts` (
	`Id` BINARY NOT NULL AUTO_INCREMENT,
	`Title` varchar(255) NOT NULL,
	`Text` TEXT NOT NULL,
	`Tags_Id` BINARY,
	`Timestamp` DATETIME NOT NULL,
	`Votes` INT NOT NULL DEFAULT '0',
	`Author_Id` BINARY NOT NULL,
	`Is_Reposting` BOOLEAN NOT NULL DEFAULT true,
	`Is_Nsfw` BOOLEAN NOT NULL DEFAULT false,
	`Is_Private` BOOLEAN NOT NULL DEFAULT false,
	PRIMARY KEY (`Id`)
);

CREATE TABLE `Tags` (
	`Id` BINARY NOT NULL AUTO_INCREMENT,
	`Title` varchar(32) UNIQUE,
	`Description` BINARY,
	PRIMARY KEY (`Id`)
);

CREATE TABLE `Comments` (
	`Id` BINARY NOT NULL AUTO_INCREMENT,
	`Author_Id` BINARY NOT NULL,
	`Timestamp` DATETIME NOT NULL,
	`Text` TEXT NOT NULL,
	`Votes` INT NOT NULL DEFAULT '0',
	PRIMARY KEY (`Id`)
);

CREATE TABLE `PostsComments` (
	`Comment_Id` BINARY NOT NULL,
	`Post_Id` BINARY NOT NULL
);

CREATE TABLE `PostsTags` (
	`Tags_Id` BINARY NOT NULL,
	`Post_Id` BINARY NOT NULL
);

CREATE TABLE `Reposts` (
	`Post_Id` BINARY NOT NULL,
	`Reposter_Id` BINARY NOT NULL,
	`Timestamp` DATETIME NOT NULL
);

CREATE TABLE `BanLists` (
	`Banner_Id` BINARY NOT NULL,
	`Banned_Id` BINARY NOT NULL,
	`Start_Timestamp` DATETIME NOT NULL,
	`End_Timestamp` DATETIME NOT NULL
);

ALTER TABLE `Posts` ADD CONSTRAINT `Posts_fk0` FOREIGN KEY (`Tags_Id`) REFERENCES `Tags`(`Id`);

ALTER TABLE `Posts` ADD CONSTRAINT `Posts_fk1` FOREIGN KEY (`Author_Id`) REFERENCES `Users`(`Id`);

ALTER TABLE `Comments` ADD CONSTRAINT `Comments_fk0` FOREIGN KEY (`Author_Id`) REFERENCES `Users`(`Id`);

ALTER TABLE `PostsComments` ADD CONSTRAINT `PostsComments_fk0` FOREIGN KEY (`Comment_Id`) REFERENCES `Comments`(`Id`);

ALTER TABLE `PostsComments` ADD CONSTRAINT `PostsComments_fk1` FOREIGN KEY (`Post_Id`) REFERENCES `Posts`(`Id`);

ALTER TABLE `PostsTags` ADD CONSTRAINT `PostsTags_fk0` FOREIGN KEY (`Tags_Id`) REFERENCES `Tags`(`Id`);

ALTER TABLE `PostsTags` ADD CONSTRAINT `PostsTags_fk1` FOREIGN KEY (`Post_Id`) REFERENCES `Posts`(`Id`);

ALTER TABLE `Reposts` ADD CONSTRAINT `Reposts_fk0` FOREIGN KEY (`Post_Id`) REFERENCES `Posts`(`Id`);

ALTER TABLE `Reposts` ADD CONSTRAINT `Reposts_fk1` FOREIGN KEY (`Reposter_Id`) REFERENCES `Users`(`Id`);

ALTER TABLE `BanLists` ADD CONSTRAINT `BanLists_fk0` FOREIGN KEY (`Banner_Id`) REFERENCES `Users`(`Id`);

ALTER TABLE `BanLists` ADD CONSTRAINT `BanLists_fk1` FOREIGN KEY (`Banned_Id`) REFERENCES `Users`(`Id`);









