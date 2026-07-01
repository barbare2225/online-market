-- MySQL Workbench Forward Engineering

SET
@OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET
@OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET
@OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8;
USE
`mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`contact_infos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`contact_infos`
(
    `id`
    BIGINT
    UNSIGNED
    NOT
    NULL
    AUTO_INCREMENT,
    `email`
    VARCHAR
(
    45
) NOT NULL,
    `phone_number` VARCHAR
(
    45
) NOT NULL,
    PRIMARY KEY
(
    `id`
),
    UNIQUE INDEX `id_UNIQUE`
(
    `id`
    ASC
) VISIBLE)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`online_markets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`online_markets`
(
    `id`
    BIGINT
    UNSIGNED
    NOT
    NULL
    AUTO_INCREMENT,
    `name`
    VARCHAR
(
    45
) NOT NULL,
    `founded_at_date` DATETIME NOT NULL,
    `contact_info_id` BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY
(
    `id`
),
    UNIQUE INDEX `id_UNIQUE`
(
    `id`
    ASC
) VISIBLE,
    INDEX `fk_online_markets_contact_infos1_idx`
(
    `contact_info_id`
    ASC
) VISIBLE,
    CONSTRAINT `fk_online_markets_contact_infos1`
    FOREIGN KEY
(
    `contact_info_id`
)
    REFERENCES `mydb`.`contact_infos`
(
    `id`
)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`addresses`
(
    `id`
    BIGINT
    UNSIGNED
    NOT
    NULL
    AUTO_INCREMENT,
    `country`
    VARCHAR
(
    45
) NOT NULL,
    `city` VARCHAR
(
    45
) NOT NULL,
    `street` VARCHAR
(
    45
) NOT NULL,
    `zipCode` VARCHAR
(
    45
) NOT NULL,
    PRIMARY KEY
(
    `id`
),
    UNIQUE INDEX `idaddresses_UNIQUE`
(
    `id`
    ASC
) VISIBLE)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`passports`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`passports`
(
    `id`
    BIGINT
    UNSIGNED
    NOT
    NULL
    AUTO_INCREMENT,
    `expiration_date`
    DATE
    NOT
    NULL,
    PRIMARY
    KEY
(
    `id`
),
    UNIQUE INDEX `id_UNIQUE`
(
    `id`
    ASC
) VISIBLE)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customers`
(
    `id`
    BIGINT
    UNSIGNED
    NOT
    NULL
    AUTO_INCREMENT,
    `name`
    VARCHAR
(
    45
) NOT NULL,
    `surname` VARCHAR
(
    45
) NOT NULL,
    `verified` TINYINT
(
    1
) NOT NULL,
    `online_market_id` BIGINT UNSIGNED NOT NULL,
    `contact_info_id` BIGINT UNSIGNED NOT NULL,
    `address_id` BIGINT UNSIGNED NOT NULL,
    `passport_id` BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY
(
    `id`
),
    UNIQUE INDEX `id_UNIQUE`
(
    `id`
    ASC
) VISIBLE,
    INDEX `fk_customers_online_markets1_idx`
(
    `online_market_id`
    ASC
) VISIBLE,
    INDEX `fk_customers_contact_infos1_idx`
(
    `contact_info_id`
    ASC
) VISIBLE,
    INDEX `fk_customers_addresses1_idx`
(
    `address_id`
    ASC
) VISIBLE,
    INDEX `fk_customers_passports1_idx`
(
    `passport_id`
    ASC
) VISIBLE,
    CONSTRAINT `fk_customers_online_markets1`
    FOREIGN KEY
(
    `online_market_id`
)
    REFERENCES `mydb`.`online_markets`
(
    `id`
)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_customers_contact_infos1`
    FOREIGN KEY
(
    `contact_info_id`
)
    REFERENCES `mydb`.`contact_infos`
(
    `id`
)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_customers_addresses1`
    FOREIGN KEY
(
    `address_id`
)
    REFERENCES `mydb`.`addresses`
(
    `id`
)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_customers_passports1`
    FOREIGN KEY
(
    `passport_id`
)
    REFERENCES `mydb`.`passports`
(
    `id`
)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`orders`
(
    `id`
    BIGINT
    UNSIGNED
    NOT
    NULL
    AUTO_INCREMENT,
    `total_price`
    DECIMAL
(
    10,
    2
) NOT NULL,
    `paid` TINYINT
(
    1
) NOT NULL,
    `created_at_date` DATETIME NOT NULL,
    `customer_id` BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY
(
    `id`
),
    UNIQUE INDEX `id_UNIQUE`
(
    `id`
    ASC
) VISIBLE,
    INDEX `fk_orders_customers1_idx`
(
    `customer_id`
    ASC
) VISIBLE,
    CONSTRAINT `fk_orders_customers1`
    FOREIGN KEY
(
    `customer_id`
)
    REFERENCES `mydb`.`customers`
(
    `id`
)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`problems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`problems`
(
    `id`
    BIGINT
    UNSIGNED
    NOT
    NULL
    AUTO_INCREMENT,
    `title`
    VARCHAR
(
    45
) NOT NULL,
    `description` VARCHAR
(
    45
) NOT NULL,
    `resolved` TINYINT
(
    1
) NOT NULL,
    `online_market_id` BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY
(
    `id`
),
    UNIQUE INDEX `id_UNIQUE`
(
    `id`
    ASC
) VISIBLE,
    INDEX `fk_problems_online_markets1_idx`
(
    `online_market_id`
    ASC
) VISIBLE,
    CONSTRAINT `fk_problems_online_markets1`
    FOREIGN KEY
(
    `online_market_id`
)
    REFERENCES `mydb`.`online_markets`
(
    `id`
)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`sellers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`sellers`
(
    `id`
    BIGINT
    UNSIGNED
    NOT
    NULL
    AUTO_INCREMENT,
    `name`
    VARCHAR
(
    45
) NOT NULL,
    `Surname` VARCHAR
(
    45
) NOT NULL,
    `online_market_id` BIGINT UNSIGNED NOT NULL,
    `contact_info_id` BIGINT UNSIGNED NOT NULL,
    `passport_id` BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY
(
    `id`
),
    UNIQUE INDEX `id_UNIQUE`
(
    `id`
    ASC
) VISIBLE,
    INDEX `fk_sellers_online_markets1_idx`
(
    `online_market_id`
    ASC
) VISIBLE,
    INDEX `fk_sellers_contact_infos1_idx`
(
    `contact_info_id`
    ASC
) VISIBLE,
    INDEX `fk_sellers_passports1_idx`
(
    `passport_id`
    ASC
) VISIBLE,
    CONSTRAINT `fk_sellers_online_markets1`
    FOREIGN KEY
(
    `online_market_id`
)
    REFERENCES `mydb`.`online_markets`
(
    `id`
)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_sellers_contact_infos1`
    FOREIGN KEY
(
    `contact_info_id`
)
    REFERENCES `mydb`.`contact_infos`
(
    `id`
)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_sellers_passports1`
    FOREIGN KEY
(
    `passport_id`
)
    REFERENCES `mydb`.`passports`
(
    `id`
)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`products`
(
    `id`
    BIGINT
    UNSIGNED
    NOT
    NULL
    AUTO_INCREMENT,
    `name`
    VARCHAR
(
    45
) NOT NULL,
    `price` DECIMAL
(
    10,
    2
) NOT NULL,
    `stock` INT NOT NULL,
    `seller_id` BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY
(
    `id`
),
    UNIQUE INDEX `id_UNIQUE`
(
    `id`
    ASC
) VISIBLE,
    INDEX `fk_products_sellers1_idx`
(
    `seller_id`
    ASC
) VISIBLE,
    CONSTRAINT `fk_products_sellers1`
    FOREIGN KEY
(
    `seller_id`
)
    REFERENCES `mydb`.`sellers`
(
    `id`
)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`employees`
(
    `id`
    BIGINT
    UNSIGNED
    NOT
    NULL
    AUTO_INCREMENT,
    `name`
    VARCHAR
(
    45
) NOT NULL,
    `surname` VARCHAR
(
    45
) NOT NULL,
    `online_market_id` BIGINT UNSIGNED NOT NULL,
    `contact_info_id` BIGINT UNSIGNED NOT NULL,
    `address_id` BIGINT UNSIGNED NOT NULL,
    `passport_id` BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY
(
    `id`
),
    UNIQUE INDEX `id_UNIQUE`
(
    `id`
    ASC
) VISIBLE,
    INDEX `fk_employees_online_markets1_idx`
(
    `online_market_id`
    ASC
) VISIBLE,
    INDEX `fk_employees_contact_infos1_idx`
(
    `contact_info_id`
    ASC
) VISIBLE,
    INDEX `fk_employees_addresses1_idx`
(
    `address_id`
    ASC
) VISIBLE,
    INDEX `fk_employees_passports1_idx`
(
    `passport_id`
    ASC
) VISIBLE,
    CONSTRAINT `fk_employees_online_markets1`
    FOREIGN KEY
(
    `online_market_id`
)
    REFERENCES `mydb`.`online_markets`
(
    `id`
)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_employees_contact_infos1`
    FOREIGN KEY
(
    `contact_info_id`
)
    REFERENCES `mydb`.`contact_infos`
(
    `id`
)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_employees_addresses1`
    FOREIGN KEY
(
    `address_id`
)
    REFERENCES `mydb`.`addresses`
(
    `id`
)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_employees_passports1`
    FOREIGN KEY
(
    `passport_id`
)
    REFERENCES `mydb`.`passports`
(
    `id`
)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`reviews`
(
    `id`
    BIGINT
    UNSIGNED
    NOT
    NULL
    AUTO_INCREMENT,
    `score`
    INT
    NOT
    NULL,
    `comment`
    VARCHAR
(
    45
) NOT NULL,
    `rated_at_date` DATETIME NOT NULL,
    `product_id` BIGINT UNSIGNED NOT NULL,
    `customer_id` BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY
(
    `id`
),
    UNIQUE INDEX `id_UNIQUE`
(
    `id`
    ASC
) VISIBLE,
    INDEX `fk_reviews_products1_idx`
(
    `product_id`
    ASC
) VISIBLE,
    INDEX `fk_reviews_customers1_idx`
(
    `customer_id`
    ASC
) VISIBLE,
    CONSTRAINT `fk_reviews_products1`
    FOREIGN KEY
(
    `product_id`
)
    REFERENCES `mydb`.`products`
(
    `id`
)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_reviews_customers1`
    FOREIGN KEY
(
    `customer_id`
)
    REFERENCES `mydb`.`customers`
(
    `id`
)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`orders_has_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`orders_has_products`
(
    `order_id`
    BIGINT
    UNSIGNED
    NOT
    NULL,
    `product_id`
    BIGINT
    UNSIGNED
    NOT
    NULL,
    PRIMARY
    KEY
(
    `order_id`,
    `product_id`
),
    INDEX `fk_orders_has_products_products1_idx`
(
    `product_id`
    ASC
) VISIBLE,
    INDEX `fk_orders_has_products_orders1_idx`
(
    `order_id`
    ASC
) VISIBLE,
    CONSTRAINT `fk_orders_has_products_orders1`
    FOREIGN KEY
(
    `order_id`
)
    REFERENCES `mydb`.`orders`
(
    `id`
)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_orders_has_products_products1`
    FOREIGN KEY
(
    `product_id`
)
    REFERENCES `mydb`.`products`
(
    `id`
)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


SET
SQL_MODE=@OLD_SQL_MODE;
SET
FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET
UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
