CREATE TABLE `users` (
    `id` INTEGER,
    `first_name` VARCHAR(32) NOT NULL,
    `last_name` VARCHAR(32) NOT NULL,
    `user_name` VARCHAR(32) NOT NULL,
    `password` VARCHAR(32) NOT NULL,
    PRIMARY KEY(`user_name`, `id`)
);
CREATE TABLE `school` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `type` ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `location` VARCHAR(32) NOT NULL,
    `year` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `company` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `industry` ENUM('Technology', 'Education', 'Business') NOT NULL,
    `location` VARCHAR(32) NOT NULL,
     PRIMARY KEY(`id`)
);
CREATE TABLE `connect_with_people` (
    `id` INT AUTO_INCREMENT,
    `user1` VARCHAR(32),
    `user2` VARCHAR(32),
    PRIMARY KEY(`id`),
    FOREIGN KEY (`user1`) REFERENCES `users` (`user_name`),
    FOREIGN KEY (`user2`) REFERENCES `users` (`user_name`)
);
CREATE TABLE `connect_with_schools` (
    `id` INT AUTO_INCREMENT,
    `user_id` INT,
    `school_id` INT,
    `start_date` DATE,
    `end_date` DATE,
    `type` VARCHAR(8),
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
    FOREIGN KEY (`school_id`) REFERENCES `school` (`id`)
);
CREATE TABLE `connect_with_company` (
    `id` INT AUTO_INCREMENT,
    `user_id` INT,
    `company_id` INT,
    `start_date` DATE,
    `end_date` DATE,
    `title` VARCHAR(32),
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
    FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
);
