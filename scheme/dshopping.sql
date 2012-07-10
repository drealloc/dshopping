--
-- Create TAGS structure
--
CREATE TABLE IF NOT EXISTS `tags` (
  `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20),
  PRIMARY KEY(`id`),
  UNIQUE INDEX tag_uniq_name(`name`)
);

--
-- Create USERS structure
--
CREATE TABLE IF NOT EXISTS `users` (
  `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(15) NOT NULL,
  `surnames` VARCHAR(20) NOT NULL,
  `email` VARCHAR(20) NOT NULL,
  `pwd` VARCHAR(15) NOT NULL,
  `address` VARCHAR(25),
  `cp` VARCHAR(5),
  `country` VARCHAR(15),
  `date_born` DATE NULL,
  `status` BOOL NOT NULL DEFAULT '1',
  PRIMARY KEY(`id`),
  UNIQUE INDEX user_uniq_email(`email`)
);

INSERT INTO `users` VALUES (1, 'Administrador', 'Admin', 'admin@dshopp.ing', 'admin', '', '', '', '', 1);
INSERT INTO `users` VALUES (2, 'Un', 'visitante', 'guest@dshopp.ing', '', '', '', '', '', 1);

--
-- Create CATEGORIES structure
--
CREATE TABLE IF NOT EXISTS `categories` (
  `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` INTEGER UNSIGNED NOT NULL,
  `name` VARCHAR(15) NOT NULL,
  `description` VARCHAR(255),
  PRIMARY KEY(`id`),
  UNIQUE INDEX category_uniq_name(`name`),
  INDEX category_fk_parent_id(`parent_id`),
  FOREIGN KEY(`parent_id`)
    REFERENCES categories(`id`)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

--
-- Create ORDERS structure
--
CREATE TABLE IF NOT EXISTS `orders` (
  `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INTEGER UNSIGNED NOT NULL,
  `date` DATE NOT NULL,
  `send_address` VARCHAR(25),
  `send_cp` VARCHAR(5),
  `send_country` VARCHAR(15),
  `postage` FLOAT NOT NULL,
  `cost` FLOAT NOT NULL,
  `notes` VARCHAR(255),
  `status` INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(`id`),
  INDEX order_fk_user(`user_id`),
  FOREIGN KEY(`user_id`)
    REFERENCES users(`id`)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

--
-- Create ITEMS structure
--
CREATE TABLE IF NOT EXISTS `items` (
  `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` INTEGER UNSIGNED,
  `name` VARCHAR(25) NOT NULL,
  `description` VARCHAR(255),
  `price` FLOAT NOT NULL,
  `img` VARCHAR(255),
  `date_available` DATE NULL,
  `stock` INTEGER UNSIGNED NULL DEFAULT '0',
  `status` BOOL NULL DEFAULT '1',
  PRIMARY KEY(`id`),
  UNIQUE INDEX item_uniq_name(`name`),
  INDEX item_fk_category(`category_id`),
  FOREIGN KEY(`category_id`)
    REFERENCES categories(`id`)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

--
-- Create ORDER_LINES structure
--
CREATE TABLE IF NOT EXISTS `order_lines` (
  `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` INTEGER UNSIGNED NOT NULL,
  `item_id` INTEGER UNSIGNED NOT NULL,
  `price` FLOAT NOT NULL,
  `quantity` INTEGER UNSIGNED NOT NULL DEFAULT '1',
  `tax` FLOAT NULL,
  `discount` FLOAT NULL DEFAULT '0',
  `cost` FLOAT NULL,
  PRIMARY KEY(`id`, `order_id`),
  INDEX order_line_fk_item(`item_id`),
  INDEX order_line_fk_order(`order_id`),
  FOREIGN KEY(`item_id`)
    REFERENCES items(`id`)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(`order_id`)
    REFERENCES orders(`id`)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

--
-- Create ITEM2TAG structure
--
CREATE TABLE IF NOT EXISTS `item2tag` (
  `tag_id` INTEGER UNSIGNED NOT NULL,
  `item_id` INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(`tag_id`, `item_id`),
  INDEX tag_has_item_fk_tag(`tag_id`),
  INDEX tag_has_item_fk_item(`item_id`),
  FOREIGN KEY(`tag_id`)
    REFERENCES tags(`id`)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(`item_id`)
    REFERENCES items(`id`)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

--
-- Create ITEM_COMMENTS structure
--
CREATE TABLE IF NOT EXISTS `item_comments` (
  `item_id` INTEGER UNSIGNED NOT NULL,
  `user_id` INTEGER UNSIGNED NOT NULL,
  `date` DATE NULL,
  `comment` VARCHAR(255),
  `status` BOOL NULL DEFAULT '1',
  PRIMARY KEY(`item_id`, `user_id`),
  INDEX user_has_item_fk_user(`user_id`),
  INDEX user_has_item_fk_item(`item_id`),
  FOREIGN KEY(`user_id`)
    REFERENCES users(`id`)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(`item_id`)
    REFERENCES items(`id`)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);
