/*
MySQL - 5.7.9-log : Database - capstone
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP DATABASE /*!32312 IF EXISTS*/`capstone`;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`capstone` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `capstone`;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `account_id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `user_type` varchar(20) DEFAULT NULL,
  `lock_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `ACCOUNT_username_uk` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `account` */

insert  into `account`(`username`,`password`,`user_type`,`lock_status`) values ('admin','353188743','admin',0);
insert  into `account`(`username`,`password`,`user_type`,`lock_status`) values ('patient','353188743','patient',0);
insert  into `account`(`username`,`password`,`user_type`,`lock_status`) values ('nutritionist','353188743','nutritionist',0);
insert  into `account`(`username`,`password`,`user_type`,`lock_status`) values ('staff','353188743','staff',0);

/*Table structure for table `activity_log` */

DROP TABLE IF EXISTS `activity_log`;

CREATE TABLE `activity_log` (
  `record_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `activity_type` varchar(30) DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `activity_log` */

/*Table structure for table `patient` */

DROP TABLE IF EXISTS `patient`;

CREATE TABLE `patient` (
  `patient_id` int(10) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `home_phone` varchar(11) DEFAULT NULL,
  `cell_phone` varchar(11) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `contract_period` varchar(30) DEFAULT NULL,
  `user_type` varchar(20) DEFAULT NULL,
  `package_id` int(10) DEFAULT NULL,
  `account_status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`patient_id`),
  UNIQUE KEY `PATIENT_email_uk` (`email`),
  KEY `PATIENT_patient_id_fk` (`patient_id`),
  CONSTRAINT `PATIENT_patient_id_fk` FOREIGN KEY (`patient_id`) REFERENCES `account` (`account_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  KEY `PATIENT_package_id_fk` (`package_id`),
  CONSTRAINT `PATIENT_package_id_fk` FOREIGN KEY (`package_id`) REFERENCES `payment_plan` (`package_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `patient` */

insert into `patient`(`patient_id`, `firstname`, `lastname`, `email`, `user_type`) values (2, 'linh', 'Truong', 'a@b.com', 'patient');

/*Table structure for table `staff` */

DROP TABLE IF EXISTS `staff`;

CREATE TABLE `staff` (
  `staff_id` int(10) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `home_phone` varchar(11) DEFAULT NULL,
  `cell_phone` varchar(11) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `date_of_hire` date NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `job_status` varchar(50) DEFAULT NULL,
  `user_type` varchar(20) DEFAULT NULL,
  `account_status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `STAFF_email_uk` (`email`),
  KEY `STAFF_staff_id_fk` (`staff_id`),
  CONSTRAINT `STAFF_staff_id_fk` FOREIGN KEY (`staff_id`) REFERENCES `account` (`account_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `staff` */

/*Table structure for table `advert` */

DROP TABLE IF EXISTS `advert`;

CREATE TABLE `advert` (
  `advert_id` int(10) NOT NULL AUTO_INCREMENT,
  `offer` varchar(100) DEFAULT NULL,
  `start_offer` datetime DEFAULT NULL,
  `end_offer` datetime DEFAULT NULL,
  `details` text DEFAULT NULL,
  PRIMARY KEY (`advert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `advert` */

/*Table structure for table `promo` */

DROP TABLE IF EXISTS `promo`;

CREATE TABLE `promo` (
  `promo_id` int(10) NOT NULL AUTO_INCREMENT,
  `date_post` date DEFAULT NULL,
  `date_expire` date DEFAULT NULL,
  `content` TEXT DEFAULT NULL,
  PRIMARY KEY (`promo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `promo` */

/*Table structure for table `appointment` */

DROP TABLE IF EXISTS `appointment`;

CREATE TABLE `appointment` (
  `appointment_id` int(10) NOT NULL AUTO_INCREMENT,
  `patient_id` int(10) NOT NULL,
  `nutrition_id` int(10) NOT NULL,
  `start_time` timestamp,
  `end_time` timestamp,
  `type` varchar(20) DEFAULT NULL,
  `purpose` TEXT DEFAULT NULL,
  PRIMARY KEY (`appointment_id`),
  KEY `APPOINTMENT_nutrition_id_fk` (`nutrition_id`),
  KEY `APPOINTMENT_patient_id_fk` (`patient_id`),
  CONSTRAINT `APPOINTMENT_nutrition_id_fk` FOREIGN KEY (`nutrition_id`) REFERENCES `account` (`account_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `APPOINTMENT_patient_id_fk` FOREIGN KEY (`patient_id`) REFERENCES `account` (`account_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `appointment` */
insert  into `appointment`(`appointment_id`,`patient_id`,`nutrition_id`,`start_time`,`end_time`,`type`,`purpose`) values 

(1,2,3,'2017-04-20 10:00:00','2017-04-20 11:00:00','regular','Please issue me another prescription'),

(2,2,3,'2017-04-20 17:00:00','2017-04-20 18:00:00','regular','Where is my medication'),

(3,2,3,'2017-04-21 15:00:00','2017-04-21 16:00:00','regular','first consultation'),

(4,2,3,'2017-04-21 19:00:00','2017-04-21 20:00:00','regular','second consultation'),

(5,2,3,'2017-04-22 13:00:00','2017-04-22 14:00:00','regular','third consultation'),

(6,2,3,'2017-04-22 08:00:00','2017-04-22 09:00:00','regular','fifth consultation'),

(7,2,3,'2017-04-22 19:00:00','2017-04-22 20:00:00','regular','sixth consultation'),

(8,2,3,'2017-04-24 19:00:00','2017-04-24 20:00:00','regular','seventh consultation');
/*Table structure for table `bidder` */

DROP TABLE IF EXISTS `bidder`;

CREATE TABLE `bidder` (
  `bidder_number` int(10) NOT NULL AUTO_INCREMENT,
  `promo_id` int(10) DEFAULT NULL,
  `advert_id` int(10) DEFAULT NULL,
  `firstname` varchar(30) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `qualification` varchar(20) DEFAULT NULL,
  `if_approve` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bidder_number`),
  KEY `BIDDER_advert_id_fk` (`advert_id`),
  CONSTRAINT `BIDDER_advert_id_fk` FOREIGN KEY (`advert_id`) REFERENCES `advert` (`advert_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  KEY `BIDDER_promo_id_fk` (`promo_id`),
  CONSTRAINT `BIDDER_promo_id_fk` FOREIGN KEY (`promo_id`) REFERENCES `promo` (`promo_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `bidder` */

/*Table structure for table `credit_card` */

DROP TABLE IF EXISTS `credit_card`;

CREATE TABLE `credit_card` (
  `id` int(10) DEFAULT NULL,
  `card_number` int(16) NOT NULL,
  `card_type` varchar(10) DEFAULT NULL,
  `name_on_card` varchar(50) DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `cvv` int(5) DEFAULT NULL,
  PRIMARY KEY (`card_number`),
  KEY `CREDIT_CARD_id_fk` (`id`),
  CONSTRAINT `CREDIT_CARD_id_fk` FOREIGN KEY (`id`) REFERENCES `account` (`account_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `credit_card` */

/*Table structure for table `diet_plan` */

DROP TABLE IF EXISTS `diet_plan`;

CREATE TABLE `diet_plan` (
  `diet_plan_number` int(10) NOT NULL AUTO_INCREMENT,
  `date_create` datetime DEFAULT NULL,
  `purpose` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`diet_plan_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `diet_plan` */

insert into `diet_plan`(`date_create`, `purpose`) values( SYSDATE(), 'diet');

/*Table structure for table `diet_plan_detail` */

DROP TABLE IF EXISTS `diet_plan_detail`;

CREATE TABLE `diet_plan_detail` (
  `plan_detail_number` int(10) NOT NULL AUTO_INCREMENT,
  `diet_plan_number` int(10) DEFAULT NULL,
  `day` varchar(10) DEFAULT NULL,
  `breakfast` TEXT DEFAULT NULL,
  `lunch` TEXT DEFAULT NULL,
  `dinner` TEXT DEFAULT NULL,
  `morning_snack` TEXT DEFAULT NULL,
  `afternoon_snack` TEXT DEFAULT NULL,
  PRIMARY KEY (`plan_detail_number`),
  KEY `DIET_PLAN_DETAIL_number_fk` (`diet_plan_number`),
  CONSTRAINT `DIET_PLAN_DETAIL_number_fk` FOREIGN KEY (`diet_plan_number`) REFERENCES `diet_plan` (`diet_plan_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `diet_plan_detail` */

insert into `diet_plan_detail`(`diet_plan_number`, `day`, `breakfast`, `lunch`, `dinner`) values(1, 'monday', 'apple', 'burger', 'rice');
insert into `diet_plan_detail`(`diet_plan_number`, `day`, `breakfast`, `lunch`, `dinner`) values(1, 'tuesday', 'banana', 'hotdog', 'steak');
insert into `diet_plan_detail`(`diet_plan_number`, `day`, `breakfast`, `lunch`, `dinner`) values(1, 'thursday', 'orange', 'fries', 'pork');

/*Table structure for table `faq` */

DROP TABLE IF EXISTS `faq`;

CREATE TABLE `faq` (
  `faq_number` int(10) NOT NULL AUTO_INCREMENT,
  `question` varchar(50) DEFAULT NULL,
  `anwser` TEXT DEFAULT NULL,
  PRIMARY KEY (`faq_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `faq` */

/*Table structure for table `invoice` */

DROP TABLE IF EXISTS `invoice`;

CREATE TABLE `invoice` (
  `invoice_number` int(10) NOT NULL AUTO_INCREMENT,
  `patient_id` int(10) DEFAULT NULL,
  `date_invoice` date DEFAULT NULL,
  `sub_total` decimal(10,2) DEFAULT NULL,
  `tax_rate` decimal(10,2) DEFAULT NULL,
  `taxable_amount` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `bill_address` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `status` varchar(10) DEFAULT 'Not Pay',
  PRIMARY KEY (`invoice_number`),
  KEY `INVOICE_patient_id_fk` (`patient_id`),
  CONSTRAINT `INVOICE_patient_id_fk` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `invoice` */
insert into `invoice` (`patient_id`,`date_invoice`,`sub_total`,`tax_rate`,`taxable_amount`,`total`,`bill_address`,`description`,`due_date`) values (2,SYSDATE(),2,0,0,2,'calgary','pay for service',SYSDATE());
insert into `invoice` (`patient_id`,`date_invoice`,`sub_total`,`tax_rate`,`taxable_amount`,`total`,`bill_address`,`description`,`due_date`,`status`) values (2,SYSDATE(),100,5,5,105,'calgary','pay for service',SYSDATE(),'Paid');
/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `message_id` int(10) NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) DEFAULT NULL,
  `recipient_id` int(10) DEFAULT NULL,
  `from_email` varchar(50) DEFAULT NULL,
  `to_email` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` TEXT DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `achieved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`message_id`),
  KEY `MESSAGE_sender_id_fk` (`sender_id`),
  KEY `MESSAGE_recipient_id` (`recipient_id`),
  CONSTRAINT `MESSAGE_recipient_id` FOREIGN KEY (`recipient_id`) REFERENCES `account` (`account_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `MESSAGE_sender_id_fk` FOREIGN KEY (`sender_id`) REFERENCES `account` (`account_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `message` */

/*Table structure for table `nutrition_library` */

DROP TABLE IF EXISTS `nutrition_library`;

CREATE TABLE `nutrition_library` (
  `food_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `calories_recommend` decimal(5,2) DEFAULT NULL,
  `calories_in_gram` decimal(5,2) DEFAULT NULL,
  `protein_in_gram` decimal(5,2) DEFAULT NULL,
  `fat_in_gram` decimal(5,2) DEFAULT NULL,
  `carbs_in_gram` decimal(5,2) DEFAULT NULL,
  `fiber_in_gram` decimal(5,2) DEFAULT NULL,
  UNIQUE KEY `nutrition_name_uk` (`name`),
  PRIMARY KEY (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `nutrition_library` */
insert  into `nutrition_library`(`food_id`,`name`,`calories_recommend`,`calories_in_gram`,`protein_in_gram`,`fat_in_gram`,`carbs_in_gram`,`fiber_in_gram`) values 

(1,'Pecans',0.00,69.00,9.00,72.00,14.00,10.00),

(2,'Walnuts',0.00,65.00,15.00,65.00,14.00,7.00),

(3,'Hazelnuts',0.00,62.00,15.00,61.00,17.00,10.00),

(4,'Sunflower Seeds',0.00,58.00,21.00,51.00,20.00,9.00),

(5,'Almonds',0.00,57.00,21.00,49.00,22.00,12.00),

(6,'Sesame Seeds',0.00,57.00,18.00,50.00,23.00,12.00),

(7,'Soybeans',0.00,44.00,36.00,20.00,30.00,9.00),

(8,'Quinoa',0.00,36.00,14.00,6.00,64.00,7.00),

(9,'Beans,Pinto',0.00,34.00,21.00,1.00,63.00,15.00),

(10,'Black Beans',0.00,34.00,22.00,1.00,62.00,15.00),

(11,'Beans, Kidney',0.00,33.00,23.00,1.00,61.00,15.00),

(12,'Beans, Navy',0.00,33.00,22.00,1.00,61.00,24.00),

(13,'Cranberry Beans',0.00,33.00,23.00,1.00,63.00,25.00),

(14,'Mushrooms, Shiitake',0.00,29.00,10.00,1.00,75.00,11.00),

(15,'Avocado',0.00,16.00,2.00,15.00,9.00,7.00),

(16,'Garlic',0.00,14.00,6.00,0.00,33.00,2.00),

(17,'Yams',0.00,11.00,2.00,0.00,28.00,4.00),

(18,'Bananas',0.00,8.00,1.00,0.00,23.00,3.00),

(19,'Corn',0.00,8.00,3.00,1.00,19.00,3.00),

(20,'Sweet Potato',0.00,8.00,2.00,0.00,20.00,3.00),

(21,'Pomegranates',0.00,8.00,2.00,1.00,19.00,4.00),

(22,'Peas',0.00,8.00,5.00,0.00,14.00,5.00),

(23,'Potatoes, Russet',0.00,7.00,5.00,0.00,14.00,5.00),

(24,'Parsnips',0.00,7.00,1.00,0.00,18.00,5.00),

(25,'Figs',0.00,7.00,1.00,0.00,19.00,3.00),

(26,'Shallots',0.00,7.00,3.00,0.00,17.00,0.00),

(27,'Kumquats',0.00,7.00,2.00,1.00,16.00,6.00),

(28,'Potatoes, Red',0.00,7.00,2.00,0.00,16.00,2.00),

(29,'Guava',0.00,6.00,3.00,1.00,14.00,5.00),

(30,'Grapes',0.00,6.00,1.00,0.00,17.00,1.00),

(31,'Cherries',0.00,6.00,1.00,0.00,16.00,2.00),

(32,'Leeks',0.00,6.00,1.00,0.00,14.00,2.00),

(33,'Pears',0.00,5.00,0.00,0.00,15.00,3.00),

(34,'Blueberries',0.00,5.00,1.00,0.00,14.00,2.00),

(35,'Tangerines',0.00,5.00,1.00,0.00,13.00,2.00),

(36,'Apples',0.00,5.00,0.00,0.00,14.00,2.00),

(37,'Raspberries',0.00,5.00,1.00,1.00,12.00,6.00),

(38,'Kale',0.00,5.00,3.00,1.00,10.00,2.00),

(39,'Pineapple',0.00,5.00,1.00,0.00,13.00,1.00),

(40,'Apricots',0.00,4.00,1.00,0.00,11.00,2.00),

(41,'Oranges',0.00,4.00,1.00,0.00,12.00,2.00),

(42,'Cranberries',0.00,4.00,0.00,0.00,12.00,5.00),

(43,'Beets',0.00,4.00,2.00,0.00,10.00,3.00),

(44,'Blackberries',0.00,4.00,1.00,0.00,10.00,5.00),

(45,'Celeriac',0.00,4.00,1.00,0.00,9.00,2.00),

(46,'Grapefruit',0.00,4.00,1.00,0.00,11.00,2.00),

(47,'Sugar Snap Peas',0.00,4.00,3.00,0.00,8.00,3.00),

(48,'Carrots',0.00,4.00,1.00,0.00,10.00,3.00),

(49,'Acorn Squash',0.00,4.00,1.00,0.00,10.00,1.00),

(50,'Onion',0.00,4.00,1.00,0.00,9.00,2.00),

(51,'Papaya',0.00,3.00,1.00,0.00,10.00,2.00),

(52,'Peaches',0.00,3.00,1.00,0.00,10.00,1.00),

(53,'Mushrooms, Maitake',0.00,3.00,2.00,0.00,7.00,3.00),

(54,'HoneyDew',0.00,3.00,1.00,0.00,9.00,1.00),

(55,'Rutabagas',0.00,3.00,1.00,0.00,8.00,3.00),

(56,'Broccoli',0.00,3.00,3.00,0.00,7.00,3.00),

(57,'Cantaloupe',0.00,3.00,1.00,0.00,9.00,1.00),

(58,'Serrano Pepper',0.00,3.00,2.00,0.00,8.00,4.00),

(59,'Strawberries',0.00,3.00,1.00,0.00,8.00,2.00),

(60,'Green Beans',0.00,3.00,2.00,0.00,7.00,3.00),

(61,'Okra',0.00,3.00,2.00,0.00,7.00,3.00),

(62,'Spaghetti Squash',0.00,3.00,1.00,1.00,7.00,0.00),

(63,'Sweet Red Peppers',0.00,3.00,1.00,0.00,6.00,2.00),

(64,'Collards',0.00,3.00,2.00,0.00,6.00,4.00),

(65,'Limes',0.00,3.00,1.00,0.00,11.00,3.00),

(66,'Watermelon',0.00,3.00,1.00,0.00,8.00,0.00),

(67,'Lemons',0.00,2.00,1.00,0.00,9.00,3.00),

(68,'Turnips',0.00,2.00,1.00,0.00,6.00,2.00),

(69,'Banana Peppers',0.00,2.00,2.00,0.00,5.00,3.00),

(70,'Sweet Yellow Peppers',0.00,2.00,1.00,0.00,6.00,1.00),

(71,'Mustard Greens',0.00,2.00,3.00,0.00,5.00,3.00),

(72,'Cabbage',0.00,2.00,1.00,0.00,6.00,3.00),

(73,'Cauliflower',0.00,2.00,2.00,0.00,5.00,3.00),

(74,'Eggplant',0.00,2.00,1.00,0.00,6.00,0.00),

(75,'Spinach',0.00,2.00,3.00,0.00,4.00,2.00),

(76,'Rhubarb',0.00,2.00,1.00,0.00,5.00,2.00),

(77,'Asparagus',0.00,2.00,2.00,0.00,4.00,2.00),

(78,'Sweet Green Pepper',0.00,2.00,1.00,0.00,5.00,2.00),

(79,'Swiss Chard',0.00,1.00,2.00,0.00,4.00,2.00),

(80,'Tomatoes',0.00,1.00,1.00,0.00,4.00,1.00),

(81,'Celery',0.00,1.00,1.00,0.00,3.00,2.00),

(82,'Radish',0.00,1.00,1.00,0.00,3.00,2.00),

(83,'Summer Squash',0.00,1.00,1.00,0.00,3.00,1.00),

(84,'Cucumbers',0.00,1.00,1.00,0.00,4.00,0.00),

(85,'Lettuce',0.00,1.00,1.00,0.00,3.00,1.00);
/*Table structure for table `payment_plan` */

DROP TABLE IF EXISTS `payment_plan`;

CREATE TABLE `payment_plan` (
  `package_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `payment_plan` */

insert  into `payment_plan`(`name`) values ('meal planning');
insert  into `payment_plan`(`name`) values ('sport nutrition');
insert  into `payment_plan`(`name`) values ('eating disorder');
insert  into `payment_plan`(`name`) values ('celiac meal planning');
insert  into `payment_plan`(`name`) values ('weight loss meal planning');
insert  into `payment_plan`(`name`) values ('weight gain meal planning');

/*Table structure for table `patient_record` */

DROP TABLE IF EXISTS `patient_record`;

CREATE TABLE `patient_record` (
  `record_number` int(10) NOT NULL AUTO_INCREMENT,
  `patient_id` int(10) DEFAULT NULL,
  `date_of_measurement` datetime DEFAULT NULL,
  `patient_current_weight` decimal(5,2) DEFAULT NULL,
  `patient_goal_weight` decimal(5,2) DEFAULT NULL,
  `patient_start_weight` decimal(5,2) DEFAULT NULL,
  `patient_lowest_weight` decimal(5,2) DEFAULT NULL,
  `patient_half_way_weight` decimal(5,2) DEFAULT NULL,
  `patient_weight_lost` decimal(5,2) DEFAULT NULL,
  `patient_calories_level` decimal(10,0) DEFAULT NULL,
  `patient_chest_measure` decimal(5,2) DEFAULT NULL,
  `patient_waist_measure` decimal(5,2) DEFAULT NULL,
  `patient_abdomen_measure` decimal(5,2) DEFAULT NULL,
  `patient_hip_measure` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`record_number`),
  KEY `PATIENT_RECORD_patient_id_fk` (`patient_id`),
  CONSTRAINT `PATIENT_RECORD_patient_id_fk` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `patient_record` */

insert into `patient_record`(`patient_id`, `date_of_measurement`, `patient_current_weight`) values (2, SYSDATE(), 3.32);

/*Table structure for table `patient_journal` */

DROP TABLE IF EXISTS `patient_journal`;

CREATE TABLE `patient_journal` (
  `journal_number` int(10) NOT NULL AUTO_INCREMENT,
  `patient_id` int(10) DEFAULT NULL,
  `record_number` int(10) DEFAULT NULL,
  `date_record` date DEFAULT NULL,
  `diet_plan_number` int(10) DEFAULT NULL,
  `motivation` varchar(100) DEFAULT NULL,
  `activity_completed` varchar(30) DEFAULT 'Not Complete',
  `date_completed` date DEFAULT NULL,
  `start_weight` decimal(5,2) DEFAULT NULL,
  `end_weight` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`journal_number`),
  KEY `JOURNAL_patient_id_fk` (`patient_id`),
  KEY `JOURNAL_record_number_fk` (`record_number`),
  KEY `JOURNAL_diet_plan_number_fk` (`diet_plan_number`),
  CONSTRAINT `JOURNAL_diet_plan_number_fk` FOREIGN KEY (`diet_plan_number`) REFERENCES `diet_plan` (`diet_plan_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `JOURNAL_patient_id_fk` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `JOURNAL_record_number_fk` FOREIGN KEY (`record_number`) REFERENCES `patient_record` (`record_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `patient_journal` */

insert into `patient_journal`(`patient_id`, `record_number`, `date_record`, `diet_plan_number`, `start_weight`, `end_weight`) values (2, 1, SYSDATE(), 1, 40.5, 45.5);
insert into `patient_journal`(`patient_id`, `record_number`, `date_record`, `diet_plan_number`, `start_weight`, `end_weight`) values (2, 1, SYSDATE(), 1, 30.5, 45.5);

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `transaction_number` int(10) NOT NULL AUTO_INCREMENT,
  `invoice_number` int(10) DEFAULT NULL,
  `patient_id` int(10) DEFAULT NULL,
  `type_of_payment` varchar(20) DEFAULT NULL,
  `payment_amount` decimal(10,2) DEFAULT NULL,
  `payment_due_date` datetime DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`transaction_number`),
  KEY `PAYMENT_invoice_number_fk` (`invoice_number`),
  KEY `PAYMENT_patient_id_fk` (`patient_id`),
  CONSTRAINT `PAYMENT_invoice_number_fk` FOREIGN KEY (`invoice_number`) REFERENCES `invoice` (`invoice_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PAYMENT_patient_id_fk` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `payment` */

/*Table structure for table `question_list` */

DROP TABLE IF EXISTS `question_list`;

CREATE TABLE `question_list` (
  `question_id` int(2) NOT NULL,
  `question` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `question_list` */

insert  into `question_list`(`question_id`,`question`) values (1,'What is your mother\'s middle name?');
insert  into `question_list`(`question_id`,`question`) values (2,'What city did you grow up in?');
insert  into `question_list`(`question_id`,`question`) values (3,'What is your favorite book?');
insert  into `question_list`(`question_id`,`question`) values (4,'what is your first car?');
insert  into `question_list`(`question_id`,`question`) values (5,'What is your father\'s first name?');
insert  into `question_list`(`question_id`,`question`) values (6,'What is your favorite vacation destination?');
insert  into `question_list`(`question_id`,`question`) values (7,'What was your favorite sport in high school?');
insert  into `question_list`(`question_id`,`question`) values (8,'What school did you attend for sixth grade?');

/*Table structure for table `security_question` */

DROP TABLE IF EXISTS `security_question`;

CREATE TABLE `security_question` (
  `account_id` int(10) DEFAULT NULL,
  `question_number` int(10) NOT NULL AUTO_INCREMENT,
  `question_id` int(2) DEFAULT NULL,
  `anwser` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`question_number`),
  KEY `SECURITY_account_id_fk` (`account_id`),
  KEY `SECURITY_question_id_fk` (`question_id`),
  CONSTRAINT `SECURITY_account_id_fk` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SECURITY_question_id_fk` FOREIGN KEY (`question_id`) REFERENCES `question_list` (`question_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `security_question` */

/*Table structure for table `tip` */

DROP TABLE IF EXISTS `tip`;

CREATE TABLE `tip` (
  `tip_number` int(10) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `link` TEXT DEFAULT NULL,
  `link_text` varchar(50) DEFAULT NULL,
  `content` TEXT DEFAULT NULL,
  PRIMARY KEY (`tip_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tip` */

/*Table structure for table `inactive_account` */

DROP TABLE IF EXISTS `inactive_account`;

CREATE TABLE `inactive_account` (
  `account_id` int(10) NOT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  KEY `INACTIVE_ACCOUNT_fk` (`account_id`),
  CONSTRAINT `INACTIVE_ACCOUNT_fk` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tip` */

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `news_id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) DEFAULT NULL,
  `date_post` date DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  `href_lable` varchar(50) DEFAULT NULL,
  `content` TEXT DEFAULT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `news` */

/*Table structure for table `career` */

DROP TABLE IF EXISTS `career`;

CREATE TABLE `career` (
  `career_id` int(10) NOT NULL AUTO_INCREMENT,
  `position_title` varchar(30) DEFAULT NULL,
  `position_category` varchar(30) DEFAULT NULL,
  `emploment_type` varchar(30) DEFAULT NULL,
  `date_post` date DEFAULT NULL,
  `date_close` date DEFAULT NULL,
  `requirement` TEXT,
  PRIMARY KEY (`career_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `career` */

/*Table structure for table `intern` */

DROP TABLE IF EXISTS `intern`;

CREATE TABLE `intern` (
  `intern_id` int(10) NOT NULL AUTO_INCREMENT,
  `position_title` varchar(30) DEFAULT NULL,
  `position_category` varchar(30) DEFAULT NULL,
  `emploment_type` varchar(30) DEFAULT NULL,
  `date_post` date DEFAULT NULL,
  `date_close` date DEFAULT NULL,
  `requirement` TEXT,
  PRIMARY KEY (`intern_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `intern` */

/*Table structure for table `volunteer` */

DROP TABLE IF EXISTS `volunteer`;

CREATE TABLE `volunteer` (
  `volunteer_id` int(10) NOT NULL AUTO_INCREMENT,
  `position_title` varchar(30) DEFAULT NULL,
  `position_category` varchar(30) DEFAULT NULL,
  `emploment_type` varchar(30) DEFAULT NULL,
  `date_post` date DEFAULT NULL,
  `date_close` date DEFAULT NULL,
  `requirement` TEXT,
  PRIMARY KEY (`volunteer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `volunteer` */

/*Table structure for table `application` */

DROP TABLE IF EXISTS `application`;

CREATE TABLE `application` (
  `application_id` int(10) NOT NULL AUTO_INCREMENT,
  `career_id` int(10) DEFAULT NULL,
  `intern_id` int(10) DEFAULT NULL,
  `volunteer_id` int(10) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `contact_number` varchar(11) DEFAULT NULL,
  `cover_leter` TEXT DEFAULT NULL,
  `resume_path` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`application_id`),
  KEY `APPLICATION_career_id` (`career_id`),
  KEY `APPLICATION_intern_id` (`intern_id`),
  KEY `APPLICATION_volunteer_id` (`volunteer_id`),
  CONSTRAINT `APPLICATION_career_id` FOREIGN KEY (`career_id`) REFERENCES `career` (`career_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `APPLICATION_intern_id` FOREIGN KEY (`intern_id`) REFERENCES `intern` (intern_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `APPLICATION_volunteer_id` FOREIGN KEY (`volunteer_id`) REFERENCES `volunteer` (`volunteer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `application` */

/*Table structure for table `Crypto_key` */

DROP TABLE IF EXISTS `Crypto_key`;

CREATE TABLE `Crypto_key` (
  `key` varchar(20) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `application` */

/* Function structure for function `getUserId` */

/*!50003 DROP FUNCTION IF EXISTS  `getUserId` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `getUserId`(theUsername VARCHAR(50)) RETURNS INT(10)
BEGIN
	DECLARE id INT(10);
	SELECT account_id INTO id FROM account WHERE username=theUsername;
	return id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `userValidate` */

/*!50003 DROP PROCEDURE IF EXISTS  `userValidate` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `userValidate`(theUsername VARCHAR(50), thePassword VARCHAR(50))
BEGIN
	SELECT COUNT(*) FROM account WHERE username=theUsername AND PASSWORD=thePassword;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `userGetType` */

/*!50003 DROP PROCEDURE IF EXISTS  `userGetType` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `userGetType`(theUsername VARCHAR(50))
BEGIN

	SELECT user_type FROM account WHERE username=theUsername;

    END */$$
DELIMITER ;

/* Procedure structure for procedure `userForgetPassword` */

/*!50003 DROP PROCEDURE IF EXISTS  `userForgetPassword` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `userForgetPassword`(theUsername varchar(50))
BEGIN
	select count(*) from account where username=theUsername;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `resetPasswordByUserAndAdmin` */

/*!50003 DROP PROCEDURE IF EXISTS  `resetPasswordByUserAndAdmin` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `resetPasswordByUserAndAdmin`(activityUser varchar(50), resetUsername varchar(50), resetPassword varchar(50))
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUser);
	update account set password=resetPassword where username=resetUsername;
	insert into activity_log set user_id=userId, activity_type='Reset Password', note=CONCAT('Reset Password for ',resetUsername), date_time=SYSDATE;
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `resetPasswordById` */

/*!50003 DROP PROCEDURE IF EXISTS  `resetPasswordById` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `resetPasswordById`(activityUser varchar(50), theId INT(10), resetPassword varchar(50))
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUser);
	update account set password=resetPassword where account_id=theId;
	insert into activity_log set user_id=userId, activity_type='Reset Password', note=CONCAT('Reset Password for: ',theId), date_time=SYSDATE;
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `userExists` */

/*!50003 DROP PROCEDURE IF EXISTS  `userExists` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `userExists`(theUsername varchar(50))
BEGIN
	select count(*) from account where username=theUsername;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `userGetLockedStatus` */

/*!50003 DROP PROCEDURE IF EXISTS  `userGetLockedStatus` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `userGetLockedStatus`(theUsername varchar(50))
BEGIN
	select lock_status from account where username=theUsername;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `userAdd` */

/*!50003 DROP PROCEDURE IF EXISTS  `userAdd` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `userAdd`(activityUser varchar(50), newUsername varchar(50), newPassword varchar(50), newType varchar(20), newLocked boolean)
BEGIN
	DECLARE userId int(10);
	insert into account set username=newUsername, password=newPassword, user_type=newType, lock_status=newLocked;
	SET userId = getUserId(activityUser);
	insert into activity_log set user_id=userId, activity_type='User Add', note=CONCAT('add user ',newUsername), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `createStaffAccount` */

/*!50003 DROP PROCEDURE IF EXISTS  `createStaffAccount` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `createStaffAccount`(activityUser varchar(50), newUsername varchar(50), newPassword varchar(50), newUserType varchar(20), newLocked boolean, newFirstName varchar(30), newLastName varchar(30), newEmail varchar(50), newAddress varchar(50), newHomePhone varchar(11), newCellPhone varchar(11), dateOfBirth date, dateOfHire date, newGender char, jobStatus varchar(50), accountStatus varchar(20))
BEGIN
	DECLARE staffId INT;
	DECLARE userId int(10);
	SET userId = getUserId(activityUser);
	insert into account set username=newUsername, password=newPassword, user_type=newUserType, lock_status=newLocked;
	select account_id into staffId from account where username=newUsername;
	insert into staff set staff_id=staffId, firstname=newFirstName, lastname=newLastName, email=newEmail, address=newAddress, home_phone=newHomePhone, cell_phone=newCellPhone, date_of_birth=dateOfBirth, date_of_hire=dateOfHire, gender=newGender, job_status=jobStatus, user_type=newUserType, account_status=accountStatus;
	insert into activity_log set user_id=userId, activity_type='Create Account', note=CONCAT('Create Staff Account: ',newUsername), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `editStaffAccountByAdminOrNutritionist` */

/*!50003 DROP PROCEDURE IF EXISTS  `editStaffAccountByAdminOrNutritionist` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `editStaffAccountByAdminOrNutritionist`(activityUser varchar(50), staffId int, newFirstName varchar(30), newLastName varchar(30), newEmail varchar(50), newAddress varchar(50), newHomePhone varchar(11), newCellPhone varchar(11), dateOfBirth date, newGender char, jobStatus varchar(50), accountStatus varchar(20))
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUser);
	update staff set firstname=newFirstName, lastname=newLastName, email=newEmail, address=newAddress, home_phone=newHomePhone, cell_phone=newCellPhone, date_of_birth=dateOfBirth, gender=newGender, job_status=jobStatus, account_status=accountStatus
	where staff_id=staffId;
	insert into activity_log set user_id=userId, activity_type='Edit Account', note=CONCAT('Edit Staff Account: ',staffId), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `editStaffAccountByStaff` */

/*!50003 DROP PROCEDURE IF EXISTS  `editStaffAccountByStaff` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `editStaffAccountByStaff`(activityUser varchar(50), newUsername varchar(50), newFirstName varchar(30), newLastName varchar(30), newEmail varchar(50), newAddress varchar(50), newHomePhone varchar(11), newCellPhone varchar(11), dateOfBirth date, newGender char)
BEGIN
DECLARE staffId INT;
DECLARE userId int(10);
	SET userId = getUserId(activityUser);
	select account_id into staffId from account where username = newUsername;
	update staff set firstname=newFirstName, lastname=newLastName, email=newEmail, address=newAddress, home_phone=newHomePhone, cell_phone=newCellPhone, date_of_birth=dateOfBirth, gender=newGender
	where staff_id=staffId;
	insert into activity_log set user_id=userId, activity_type='Edit Account', note=CONCAT('Edit Staff Account: ',newUsername), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deactivateStaffAccount` */

/*!50003 DROP PROCEDURE IF EXISTS  `deactivateStaffAccount` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deactivateStaffAccount`(activityUser varchar(50), accountUsername varchar(50))
BEGIN
	DECLARE userId int(10);
	DECLARE usernameId int(10);
	SET userId = getUserId(activityUser);
	SET usernameId = getUserId(accountUsername);
	update account set lock_status=1 where username=accountUsername;
	update staff set account_status='inactive' where staff_id=usernameId;
	insert into inactive_account set account_id=usernameId, date=SYSDATE();
	insert into activity_log set user_id=userId, activity_type='Deactivate Account', note=CONCAT('Deactivate Account: ',accountUsername), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deactivateStaffAccountById` */

/*!50003 DROP PROCEDURE IF EXISTS  `deactivateStaffAccountById` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deactivateStaffAccountById`(activityUser varchar(50), accountId INT(10))
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUser);
	update account set lock_status=1 where account_id=accountId;
	update staff set account_status='inactive' where staff_id=accountId;
	insert into inactive_account set account_id=accountId, date=SYSDATE();
	insert into activity_log set user_id=userId, activity_type='Deactivate Account', note=CONCAT('Deactivate Account: ',accountId), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deactivatePatientAccountById` */

/*!50003 DROP PROCEDURE IF EXISTS  `deactivatePatientAccountById` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deactivatePatientAccountById`(activityUser varchar(50), accountId INT(10))
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUser);
	update account set lock_status=1 where account_id=accountId;
	update patient set account_status='inactive' where patient_id=accountId;
	insert into inactive_account set account_id=accountId, date=SYSDATE();
	insert into activity_log set user_id=userId, activity_type='Deactivate Account', note=CONCAT('Deactivate Account: ',accountId), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `accountSetUserType` */

/*!50003 DROP PROCEDURE IF EXISTS  `accountSetUserType` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `accountSetUserType`(activityUser varchar(50), accountUsername varchar(50), accountUserType varchar(20))
BEGIN
DECLARE userId int(10);
	SET userId = getUserId(activityUser);
	update account set user_type=accountUserType where username=accountUsername;
	insert into activity_log set user_id=userId, activity_type='Edit Account', note=CONCAT('Edit user type for account: ',accountUsername), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `reactivateStaffAccount` */

/*!50003 DROP PROCEDURE IF EXISTS  `reactivateStaffAccount` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `reactivateStaffAccount`(activityUser varchar(50), accountUsername varchar(50))
BEGIN
DECLARE userId int(10);
DECLARE usernameId int(10);
	SET userId = getUserId(activityUser);
	SET usernameId = getUserId(accountUsername);
	update account set lock_status=0 where username=accountUsername;
	update staff set account_status='active' where staff_id=usernameId;
	delete from inactive_account where account_id-usernameId;
	insert into activity_log set user_id=userId, activity_type='Reactivate Account', note=CONCAT('Reactivate Account: ',accountUsername), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `reactivateStaffAccountById` */

/*!50003 DROP PROCEDURE IF EXISTS  `reactivateStaffAccountById` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `reactivateStaffAccountById`(activityUser varchar(50), accountId INT(10))
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUser);
	update account set lock_status=0 where account_id=accountId;
	update staff set account_status='active' where staff_id=accountId;
	delete from inactive_account where account_id=accountId;
	insert into activity_log set user_id=userId, activity_type='Reactivate Account', note=CONCAT('Reactivate Account: ',accountId), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `reactivatePatientAccountById` */

/*!50003 DROP PROCEDURE IF EXISTS  `reactivatePatientAccountById` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `reactivatePatientAccountById`(activityUser varchar(50), accountId INT(10))
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUser);
	update account set lock_status=0 where account_id=accountId;
	update patient set account_status='active' where patient_id=accountId;
	delete from inactive_account where account_id=accountId;
	insert into activity_log set user_id=userId, activity_type='Reactivate Account', note=CONCAT('Reactivate Account: ',accountId), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `createPatientAccountByPatient` */

/*!50003 DROP PROCEDURE IF EXISTS  `createPatientAccountByPatient` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `createPatientAccountByPatient`(newUsername varchar(50), newUserType varchar(20), newFirstName varchar(30), newLastName varchar(30), newEmail varchar(50), newAddress varchar(50), newHomePhone varchar(11), newCellPhone varchar(11), dateOfBirth date, newGender char(1), contractPeriod varchar(30))
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(newUsername);
	insert into patient set patient_id=userId, firstname=newFirstName, lastname=newLastName, email=newEmail, address=newAddress, home_phone=newHomePhone, cell_phone=newCellPhone, date_of_birth=dateOfBirth, gender=newGender, contract_period=contractPeriod, user_type=newUserType, account_status='active';
	insert into activity_log set user_id=userId, activity_type='Edit Patient Info', note=CONCAT('Edit Patient Info: ',newUsername), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `createPatientAccountByOthers` */

/*!50003 DROP PROCEDURE IF EXISTS  `createPatientAccountByOthers` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `createPatientAccountByOthers`(activityUser varchar(50), newUsername varchar(50), newUserType varchar(20), newLocked boolean, newFirstName varchar(30), newLastName varchar(30), newEmail varchar(50), newAddress varchar(50), newHomePhone varchar(11), newCellPhone varchar(11), dateOfBirth date, newGender char(1), contractPeriod varchar(30), accountStatus varchar(20))
BEGIN
	DECLARE patientId INT;
	DECLARE userId int(10);
	SET userId = getUserId(activityUser);
	update account set lock_status=newLocked where username=newUsername;
	select account_id into patientId from account where username=newUsername;
	insert into patient set patient_id=patientId, firstname=newFirstName, lastname=newLastName, email=newEmail, address=newAddress, home_phone=newHomePhone, cell_phone=newCellPhone, date_of_birth=dateOfBirth, gender=newGender, contract_period=contractPeriod, user_type=newUserType, account_status=accountStatus;
	insert into activity_log set user_id=userId, activity_type='Create Account', note=CONCAT('Create Patient Account: ',newUsername), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `editPatientAccount` */

/*!50003 DROP PROCEDURE IF EXISTS  `editPatientAccount` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `editPatientAccount`(activityUser varchar(50), newUsername varchar(50), newFirstName varchar(30), newLastName varchar(30), newEmail varchar(50), newAddress varchar(50), newHomePhone varchar(11), newCellPhone varchar(11), dateOfBirth date, newGender char, contractPeriod varchar(30))
BEGIN
DECLARE patientId INT;
DECLARE userId int(10);
	SET userId = getUserId(activityUser);
	select account_id into patientId from account where username = newUsername;
	update patient set firstname=newFirstName, lastname=newLastName, email=newEmail, address=newAddress, home_phone=newHomePhone, cell_phone=newCellPhone, date_of_birth=dateOfBirth, gender=newGender, contract_period=contractPeriod
	where patient_id=patientId;
	insert into activity_log set user_id=userId, activity_type='Edit Account', note=CONCAT('Edit Patient Account: ',newUsername), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `editPatientAccountByOther` */

/*!50003 DROP PROCEDURE IF EXISTS  `editPatientAccountByOther` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `editPatientAccountByOther`(activityUser varchar(50), patientId int, newFirstName varchar(30), newLastName varchar(30), newEmail varchar(50), newAddress varchar(50), newHomePhone varchar(11), newCellPhone varchar(11), dateOfBirth date, newGender char, contractPeriod varchar(30))
BEGIN
DECLARE userId int(10);
	SET userId = getUserId(activityUser);
	update patient set firstname=newFirstName, lastname=newLastName, email=newEmail, address=newAddress, home_phone=newHomePhone, cell_phone=newCellPhone, date_of_birth=dateOfBirth, gender=newGender, contract_period=contractPeriod
	where patient_id=patientId;
	insert into activity_log set user_id=userId, activity_type='Edit Account', note=CONCAT('Edit Patient Account: ',patientId), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `addSecurityQuestion` */

/*!50003 DROP PROCEDURE IF EXISTS  `addSecurityQuestion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `addSecurityQuestion`(activityUser varchar(50), theUsername varchar(50), questionNumberOne int, anwserNumberOne varchar(50), questionNumberTwo int, anwserNumberTwo varchar(50))
BEGIN
DECLARE userId INT(10);
DECLARE activityUserId INT(10);
	SET userId = getUserId(theUsername);
	SET activityUserId = getUserId(activityUser);
	insert into security_question set account_id=userId, question_id=questionNumberOne, anwser=anwserNumberOne;
	insert into security_question set account_id=userId, question_id=questionNumberTwo, anwser=anwserNumberTwo;
	insert into activity_log set user_id=activityUserId, activity_type='Add Security Question', note=CONCAT('Add Security Question For Account: ',theUsername), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getSecurityQuestion` */

/*!50003 DROP PROCEDURE IF EXISTS  `getSecurityQuestion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getSecurityQuestion`(theUsername varchar(50))
BEGIN
	DECLARE userId INT(10);
	SET userId = getUserId(theUsername);
	select question, anwser from security_question sq join question_list ql on sq.question_id=ql.question_id
	where sq.account_id=userId;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `editSecurityQuestion` */

/*!50003 DROP PROCEDURE IF EXISTS  `editSecurityQuestion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `editSecurityQuestion`(activityUser varchar(50), theUsername varchar(50), questionNumberOne int, anwserNumberOne varchar(50), questionNumberTwo int, anwserNumberTwo varchar(50))
BEGIN
DECLARE userId INT(10);
DECLARE activityUserId INT(10);
	SET userId = getUserId(theUsername);
	SET activityUserId = getUserId(activityUser);
	delete from security_question where account_id=userId;
	insert into security_question set account_id=userId, question_id=questionNumberOne, anwser=anwserNumberOne;
	insert into security_question set account_id=userId, question_id=questionNumberTwo, anwser=anwserNumberTwo;
	insert into activity_log set user_id=activityUserId, activity_type='Edit Security Question', note=CONCAT('Edit Security Question For Account: ',theUsername), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetPatientInfo` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetPatientInfo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPatientInfo`(theUsername varchar(50))
BEGIN
	DECLARE userId INT(10);
	SET userId = getUserId(theUsername);
	select * from patient where patient_id=userId;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getEmailByUser` */

/*!50003 DROP PROCEDURE IF EXISTS  `getEmailByUser` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getEmailByUser`(theUsername varchar(50))
BEGIN
	DECLARE userId INT(10);
	DECLARE userType VARCHAR(20);
	SET userId = getUserId(theUsername);
	select user_type into userType from account where username=theUsername;
	IF userType='patient' THEN
		select email from patient where patient_id=userId;
	ELSE
		select email from staf  where staff_id=userId;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getUsernameByEmail` */

/*!50003 DROP PROCEDURE IF EXISTS  `getUsernameByEmail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getUsernameByEmail`(theEmail VARCHAR(50))
BEGIN
	SELECT username FROM account a left join staff s on a.account_id=s.staff_id left join patient p on a.account_id=p.patient_id
	where s.email=theEmail or p.email=theEmail;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchStaffInfo` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchStaffInfo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchStaffInfo`(theFirstname varchar(30), theLastname varchar(30), thePhone varchar(11))
BEGIN
	IF theFirstname != "" and theLastname = "" and thePhone = "" THEN
		select * from staff where firstname LIKE CONCAT('%',theFirstname,'%');
	ELSEIF theFirstname = "" and theLastname != "" and thePhone = "" THEN
		select * from staff where lastname LIKE CONCAT('%',theLastname,'%');
	ELSEIF theFirstname = "" and theLastname = "" and thePhone != "" THEN
		select * from staff where home_phone LIKE CONCAT('%',thePhone,'%') OR cell_phone LIKE CONCAT('%',thePhone,'%');
	ELSEIF theFirstname != "" and theLastname != "" and thePhone = "" THEN
		select * from staff where firstname LIKE CONCAT('%',theFirstname,'%') AND lastname LIKE CONCAT('%',theLastname,'%');
	ELSEIF theFirstname != "" and theLastname = "" and thePhone != "" THEN
		select * from staff where firstname LIKE CONCAT('%',theFirstname,'%') AND (home_phone LIKE CONCAT('%',thePhone,'%') OR cell_phone LIKE CONCAT('%',thePhone,'%'));
	ELSEIF theFirstname = "" and theLastname != "" and thePhone != "" THEN
		select * from staff where lastname LIKE CONCAT('%',theLastname,'%') AND (home_phone LIKE CONCAT('%',thePhone,'%') OR cell_phone LIKE CONCAT('%',thePhone,'%'));
	ELSEIF theFirstname != "" and theLastname != "" and thePhone != "" THEN
		select * from staff where firstname LIKE CONCAT('%',theFirstname,'%') AND lastname LIKE CONCAT('%',theLastname,'%') AND (home_phone LIKE CONCAT('%',thePhone,'%') OR cell_phone LIKE CONCAT('%',thePhone,'%'));
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `searchPatientInfo` */

/*!50003 DROP PROCEDURE IF EXISTS  `searchPatientInfo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `searchPatientInfo`(theFirstname varchar(30), theLastname varchar(30), thePhone varchar(11))
BEGIN
	IF theFirstname != "" and theLastname = "" and thePhone = "" THEN
		select * from patient where firstname LIKE CONCAT('%',theFirstname,'%');
	ELSEIF theFirstname = "" and theLastname != "" and thePhone = "" THEN
		select * from patient where lastname LIKE CONCAT('%',theLastname,'%');
	ELSEIF theFirstname = "" and theLastname = "" and thePhone != "" THEN
		select * from patient where home_phone LIKE CONCAT('%',thePhone,'%') OR cell_phone LIKE CONCAT('%',thePhone,'%');
	ELSEIF theFirstname != "" and theLastname != "" and thePhone = "" THEN
		select * from patient where firstname LIKE CONCAT('%',theFirstname,'%') AND lastname LIKE CONCAT('%',theLastname,'%');
	ELSEIF theFirstname != "" and theLastname = "" and thePhone != "" THEN
		select * from patient where firstname LIKE CONCAT('%',theFirstname,'%') AND (home_phone LIKE CONCAT('%',thePhone,'%') OR cell_phone LIKE CONCAT('%',thePhone,'%'));
	ELSEIF theFirstname = "" and theLastname != "" and thePhone != "" THEN
		select * from patient where lastname LIKE CONCAT('%',theLastname,'%') AND (home_phone LIKE CONCAT('%',thePhone,'%') OR cell_phone LIKE CONCAT('%',thePhone,'%'));
	ELSEIF theFirstname != "" and theLastname != "" and thePhone != "" THEN
		select * from patient where firstname LIKE CONCAT('%',theFirstname,'%') AND lastname LIKE CONCAT('%',theLastname,'%') AND (home_phone LIKE CONCAT('%',thePhone,'%') OR cell_phone LIKE CONCAT('%',thePhone,'%'));
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getInactiveDateForUser` */

/*!50003 DROP PROCEDURE IF EXISTS  `getInactiveDateForUser` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getInactiveDateForUser`(theUsername varchar(50))
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(theUsername);
	SELECT date from inactive_account where account_id=userId;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getStaffInfo` */

/*!50003 DROP PROCEDURE IF EXISTS  `getStaffInfo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getStaffInfo`(theUsername varchar(50))
BEGIN
	DECLARE userId INT(10);
	SET userId = getUserId(theUsername);
	select * from staff where staff_id=userId;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getStaffInfoById` */

/*!50003 DROP PROCEDURE IF EXISTS  `getStaffInfoById` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getStaffInfoById`(theId INT(10))
BEGIN
	select * from staff where staff_id=theId;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getPatientInfoById` */

/*!50003 DROP PROCEDURE IF EXISTS  `getPatientInfoById` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getPatientInfoById`(theId INT(10))
BEGIN
	select * from patient where patient_id=theId;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `lockAccount` */

/*!50003 DROP PROCEDURE IF EXISTS  `lockAccount` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `lockAccount`(activityUser varchar(50), accountUsername varchar(50))
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUser);
	update account set lock_status=1 where username=accountUsername;
	insert into activity_log set user_id=userId, activity_type='Lock Account', note=CONCAT('Lock Account: ',accountUsername), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `lockAccountById` */

/*!50003 DROP PROCEDURE IF EXISTS  `lockAccountById` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `lockAccountById`(activityUser varchar(50), accountId INT(10))
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUser);
	update account set lock_status=1 where account_id=accountId;
	insert into activity_log set user_id=userId, activity_type='Lock Account', note=CONCAT('Lock Account: ',accountId), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `unlockAccount` */

/*!50003 DROP PROCEDURE IF EXISTS  `unlockAccount` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `unlockAccount`(activityUser varchar(50), accountUsername varchar(50))
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUser);
	update account set lock_status=0 where username=accountUsername;
	insert into activity_log set user_id=userId, activity_type='Unlock Account', note=CONCAT('Unlock Account: ',accountUsername), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `unlockAccountById` */

/*!50003 DROP PROCEDURE IF EXISTS  `unlockAccountById` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `unlockAccountById`(activityUser varchar(50), accountId INT(10))
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUser);
	update account set lock_status=0 where account_id=accountId;
	insert into activity_log set user_id=userId, activity_type='Unlock Account', note=CONCAT('Unlock Account: ',accountId), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteAccountById` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteAccountById` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteAccountById`(activityUser varchar(50), accountId INT(10))
BEGIN
	DECLARE userId int(10);
	DECLARE userType varchar(20);
	SET userId = getUserId(activityUser);
	select user_type into userType from account where account_id=accountId;
	IF userType="staff" THEN
		delete from staff where staff_id=accountId;
	ELSEIF userType="nutritionist" THEN
		delete from staff where staff_id=accountId;
	ELSEIF userType="patient" THEN
		delete from patient where patient_id=accountId;
	END IF;
	delete from account where account_id=accountId;
	insert into activity_log set user_id=userId, activity_type='Delete Account', note=CONCAT('Delete Account: ',accountId), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getNutritionLibrary` */

/*!50003 DROP PROCEDURE IF EXISTS  `getNutritionLibrary` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getNutritionLibrary`()
BEGIN
	select * from nutrition_library;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getNutritionLibraryByFoodId` */

/*!50003 DROP PROCEDURE IF EXISTS  `getNutritionLibraryByFoodId` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getNutritionLibraryByFoodId`( theFoodId INT(10))
BEGIN
	select * from nutrition_library where food_id=theFoodId;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `editNutritionLibrary` */

/*!50003 DROP PROCEDURE IF EXISTS  `editNutritionLibrary` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `editNutritionLibrary`( activityUsername varchar(50), theFoodId INT(10), theName varchar(50), caloriesRecommend DECIMAL, caloriesGram DECIMAl, proteinGram DECIMAL, fatGram DECIMAL, carbsGram DECIMAL, fiberGram DECIMAL)
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUsername);
	update nutrition_library set name=theName, calories_recommend=caloriesRecommend, calories_in_gram=caloriesGram, protein_in_gram=proteinGram, fat_in_gram=fatGram, carbs_in_gram=carbsGram, fiber_in_gram=fiberGram
	where food_id=theFoodId;
	insert into activity_log set user_id=userId, activity_type='Edit Nutrition Library', note=CONCAT('Edit food_id: ',theFoodId), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `addNutritionLibrary` */

/*!50003 DROP PROCEDURE IF EXISTS  `addNutritionLibrary` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `addNutritionLibrary`( activityUsername varchar(50), theName varchar(50), caloriesRecommend DECIMAL, caloriesGram DECIMAl, proteinGram DECIMAL, fatGram DECIMAL, carbsGram DECIMAL, fiberGram DECIMAL)
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUsername);
	insert into nutrition_library set name=theName, calories_recommend=caloriesRecommend, calories_in_gram=caloriesGram, protein_in_gram=proteinGram, fat_in_gram=fatGram, carbs_in_gram=carbsGram, fiber_in_gram=fiberGram;
	insert into activity_log set user_id=userId, activity_type='Add Nutrition Library', note=CONCAT('Add Food: ', theName), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `removeFoodFromNutritionLibrary` */

/*!50003 DROP PROCEDURE IF EXISTS  `removeFoodFromNutritionLibrary` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `removeFoodFromNutritionLibrary`(activityUsername varchar(50), theFoodId INT(10))
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUsername);
	delete from nutrition_library where food_id=theFoodId;
	insert into activity_log set user_id=userId, activity_type='Delete Food', note=CONCAT('Delete food id from library: ',theFoodId), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getFaq` */

/*!50003 DROP PROCEDURE IF EXISTS  `getFaq` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getFaq`()
BEGIN
	select * from faq;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getFaqById` */

/*!50003 DROP PROCEDURE IF EXISTS  `getFaqById` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getFaqById`( theFaqId INT(10))
BEGIN
	select * from faq where faq_number=theFaqId;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `editFaq` */

/*!50003 DROP PROCEDURE IF EXISTS  `editFaq` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `editFaq`( activityUsername varchar(50), theFaqId int(10), theQuestion varchar(50), theAnwser varchar(255))
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUsername);
	update faq set question=theQuestion, anwser=theAnwser
	where faq_number=theFaqId;
	insert into activity_log set user_id=userId, activity_type='Edit FAQ', note=CONCAT('Edit FAQ ID: ',theFaqId), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `addFaq` */

/*!50003 DROP PROCEDURE IF EXISTS  `addFaq` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `addFaq`( activityUsername varchar(50), theQuestion varchar(50), theAnwser varchar(255))
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUsername);
	insert into faq set question=theQuestion, anwser=theAnwser;
	insert into activity_log set user_id=userId, activity_type='Add FAQ', note=CONCAT('Add FAQ: ',theQuestion), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `removeFaq` */

/*!50003 DROP PROCEDURE IF EXISTS  `removeFaq` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `removeFaq`(activityUsername varchar(50), theFaqId INT(10))
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUsername);
	delete from faq where faq_number=theFaqId;
	insert into activity_log set user_id=userId, activity_type='Delete FAQ', note=CONCAT('Delete Faq ID: ',theFaqId), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getTip` */

/*!50003 DROP PROCEDURE IF EXISTS  `getTip` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getTip`()
BEGIN
	select * from tip;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getTipById` */

/*!50003 DROP PROCEDURE IF EXISTS  `getTipById` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getTipById`( theTipId INT(10))
BEGIN
	select * from faq where tip_number=theTipId;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `editTip` */

/*!50003 DROP PROCEDURE IF EXISTS  `editTip` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `editTip`( activityUsername varchar(50), theTipId int(10), theDate DATE, theTitle varchar(50), theLink varchar(255), linkText varchar(50), theContent TEXT)
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUsername);
	update tip set date=SYSDATE(), title=theTitle, link=theLink, link_text=linkText, content=theContent
	where tip_number=theTipId;
	insert into activity_log set user_id=userId, activity_type='Edit Tip', note=CONCAT('Edit Tip ID: ',theTipId), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `addTip` */

/*!50003 DROP PROCEDURE IF EXISTS  `addTip` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `addTip`( activityUsername varchar(50), theDate DATE, theTitle varchar(50), theLink varchar(255), linkText varchar(50), theContent TEXT)
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUsername);
	insert into tip set date=SYSDATE(), title=theTitle, link=theLink, link_text=linkText, content=theContent;
	insert into activity_log set user_id=userId, activity_type='Add Tip', note=CONCAT('Add Tip: ',theTitle), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `removeTip` */

/*!50003 DROP PROCEDURE IF EXISTS  `removeTip` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `removeTip`(activityUsername varchar(50), theTipId INT(10))
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUsername);
	delete from tip where tip_number=theTipId;
	insert into activity_log set user_id=userId, activity_type='Delete Tip', note=CONCAT('Delete Tip ID: ',theTipId), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `addEditPlanForPatient` */

/*!50003 DROP PROCEDURE IF EXISTS  `addEditPlanForPatient` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `addEditPlanForPatient`( activityUsername varchar(50), patientUsername varchar(50), planId INT(10))
BEGIN
	DECLARE userId int(10);
	DECLARE patientId int(10);
	SET userId = getUserId(activityUsername);
	SET patientId = getUserId(patientUsername);
	update patient set package_id=planId where patient_id=patientId;
	insert into activity_log set user_id=userId, activity_type='Edit Payment Plan', note=CONCAT('Edit Payment Plan for: ',patientUsername), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `deletePlanForPatient` */

/*!50003 DROP PROCEDURE IF EXISTS  `deletePlanForPatient` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deletePlanForPatient`( activityUsername varchar(50), patientUsername varchar(50))
BEGIN
	DECLARE userId int(10);
	DECLARE patientId int(10);
	SET userId = getUserId(activityUsername);
	SET patientId = getUserId(patientUsername);
	update patient set package_id=null where patient_id=patientId;
	insert into activity_log set user_id=userId, activity_type='Delete Payment Plan', note=CONCAT('Delete Payment Plan for: ',patientUsername), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getPatientRecord` */

/*!50003 DROP PROCEDURE IF EXISTS  `getPatientRecord` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getPatientRecord`( username varchar(50))
BEGIN
	DECLARE patientId int(10);
	SET patientId = getUserId(username);
	select * from patient_record where patient_id=patientId;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `addNewRecord` */

/*!50003 DROP PROCEDURE IF EXISTS  `addNewRecord` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `addNewRecord`(activityUser varchar(50), username varchar(50), current decimal, goal decimal, start decimal, lowest decimal, halfway decimal, lost decimal, calories decimal, chest decimal, waist decimal, abdomen decimal, hip decimal)
BEGIN
	DECLARE userId int(10);
	DECLARE patientId int(10);
	SET userId = getUserId(activityUser);
	SET patientId = getUserId(username);
	insert into patient_record set patient_id=patientId, date_of_measurement=SYSDATE(), patient_current_weight=current, patient_goal_weight=goal, patient_start_weight=start, patient_lowest_weight=lowest, patient_half_way_weight=halfway, patient_weight_lost=lost, patient_calories_level=calories, patient_chest_measure=chest, patient_waist_measure=waist, patient_abdomen_measure=abdomen, patient_hip_measure=hip;
	insert into activity_log set user_id=userId, activity_type='Add New Record', note=CONCAT('Add New Record For: ',username), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getJournal` */

/*!50003 DROP PROCEDURE IF EXISTS  `getJournal` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getJournal`( username varchar(50))
BEGIN
	DECLARE patientId int(10);
	SET patientId = getUserId(username);
	select * from patient_journal where patient_id=patientId;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getDietPlanDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `getDietPlanDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getDietPlanDetail`( dietID int)
BEGIN
	select * from diet_plan_detail where diet_plan_number=dietID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getNews` */

/*!50003 DROP PROCEDURE IF EXISTS  `getNews` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getNews`()
BEGIN
	select * from news;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getPromo` */

/*!50003 DROP PROCEDURE IF EXISTS  `getPromo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getPromo`()
BEGIN
	select * from promo;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getCareer` */

/*!50003 DROP PROCEDURE IF EXISTS  `getCareer` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getCareer`()
BEGIN
	select * from career;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getIntern` */

/*!50003 DROP PROCEDURE IF EXISTS  `getIntern` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getIntern`()
BEGIN
	select * from intern;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getVolunteer` */

/*!50003 DROP PROCEDURE IF EXISTS  `getVolunteer` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getVolunteer`()
BEGIN
	select * from volunteer;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getApplication` */

/*!50003 DROP PROCEDURE IF EXISTS  `getApplication` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getApplication`()
BEGIN
	select * from application;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getNewsById` */

/*!50003 DROP PROCEDURE IF EXISTS  `getNewsById` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getNewsById`( theNewsId INT(10))
BEGIN
	select * from news where news_id=theNewsId;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getPromoById` */

/*!50003 DROP PROCEDURE IF EXISTS  `getPromoById` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getPromoById`( thePromoId INT(10))
BEGIN
	select * from promo where promo_id=thePromoId;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getCareerById` */

/*!50003 DROP PROCEDURE IF EXISTS  `getCareerById` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getCareerById`( theCareerId INT(10))
BEGIN
	select * from career where career_id=theCareerId;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getInternById` */

/*!50003 DROP PROCEDURE IF EXISTS  `getInternById` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getInternById`( theInternId INT(10))
BEGIN
	select * from intern where intern_id=theInternId;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getVolunteerById` */

/*!50003 DROP PROCEDURE IF EXISTS  `getVolunteerById` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getVolunteerById`( theVolunteerId INT(10))
BEGIN
	select * from volunteer where volunteer_id=theVolunteerId;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getApplicationById` */

/*!50003 DROP PROCEDURE IF EXISTS  `getApplicationById` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getApplicationById`( theApplicationId INT(10))
BEGIN
	select * from application where application_id=theApplicationId;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `editCareer` */

/*!50003 DROP PROCEDURE IF EXISTS  `editCareer` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `editCareer`( activityUsername varchar(50), theCareerId int(10), positionTitle varchar(30), positionCategory varchar(30), emplomentType varchar(30), datePost date, dateClose date, positionRequirement TEXT)
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUsername);
	update career set position_title=positionTitle, position_category=positionCategory, emploment_type=emplomentType, date_post=datePost, date_close=dateClose, requirement=positionRequirement
	where career_id=theCareerId;
	insert into activity_log set user_id=userId, activity_type='Edit Career', note=CONCAT('Edit Career ID: ',theCareerId), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `addCareer` */

/*!50003 DROP PROCEDURE IF EXISTS  `addCareer` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `addCareer`( activityUsername varchar(50), positionTitle varchar(30), positionCategory varchar(30), emplomentType varchar(30), dateClose date, positionRequirement TEXT)
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUsername);
	insert into career set position_title=positionTitle, position_category=positionCategory, emploment_type=emplomentType, date_post=SYSDATE(), date_close=dateClose, requirement=positionRequirement;
	insert into activity_log set user_id=userId, activity_type='Add Career', note=CONCAT('Add Career: ',positionTitle), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `removeCareer` */

/*!50003 DROP PROCEDURE IF EXISTS  `removeCareer` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `removeCareer`(activityUsername varchar(50), theCareerId INT(10))
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUsername);
	delete from career where career_id=theCareerId;
	insert into activity_log set user_id=userId, activity_type='Delete Career', note=CONCAT('Delete Career ID: ',theCareerId), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `editIntern` */

/*!50003 DROP PROCEDURE IF EXISTS  `editIntern` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `editIntern`( activityUsername varchar(50), theInternId int(10), positionTitle varchar(30), positionCategory varchar(30), emplomentType varchar(30), datePost date, dateClose date, positionRequirement TEXT)
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUsername);
	update intern set position_title=positionTitle, position_category=positionCategory, emploment_type=emplomentType, date_post=datePost, date_close=dateClose, requirement=positionRequirement
	where intern_id=theInternId;
	insert into activity_log set user_id=userId, activity_type='Edit Intern', note=CONCAT('Edit Intern ID: ',theInternId), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `addIntern` */

/*!50003 DROP PROCEDURE IF EXISTS  `addIntern` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `addIntern`( activityUsername varchar(50), positionTitle varchar(30), positionCategory varchar(30), emplomentType varchar(30), dateClose date, positionRequirement TEXT)
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUsername);
	insert into intern set position_title=positionTitle, position_category=positionCategory, emploment_type=emplomentType, date_post=SYSDATE(), date_close=dateClose, requirement=positionRequirement;
	insert into activity_log set user_id=userId, activity_type='Add Intern', note=CONCAT('Add Intern: ',positionTitle), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `removeIntern` */

/*!50003 DROP PROCEDURE IF EXISTS  `removeIntern` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `removeIntern`(activityUsername varchar(50), theInternId INT(10))
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUsername);
	delete from intern where intern_id=theInternId;
	insert into activity_log set user_id=userId, activity_type='Delete Intern', note=CONCAT('Delete Intern ID: ',theInternId), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `editVolunteer` */

/*!50003 DROP PROCEDURE IF EXISTS  `editVolunteer` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `editVolunteer`( activityUsername varchar(50), theVolunteerId int(10), positionTitle varchar(30), positionCategory varchar(30), emplomentType varchar(30), datePost date, dateClose date, positionRequirement TEXT)
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUsername);
	update volunteer set position_title=positionTitle, position_category=positionCategory, emploment_type=emplomentType, date_post=datePost, date_close=dateClose, requirement=positionRequirement
	where volunteer_id=theVolunteerId;
	insert into activity_log set user_id=userId, activity_type='Edit Volunteer', note=CONCAT('Edit Volunteer ID: ',theVolunteerId), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `addVolunteer` */

/*!50003 DROP PROCEDURE IF EXISTS  `addVolunteer` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `addVolunteer`( activityUsername varchar(50), positionTitle varchar(30), positionCategory varchar(30), emplomentType varchar(30), dateClose date, positionRequirement TEXT)
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUsername);
	insert into volunteer set position_title=positionTitle, position_category=positionCategory, emploment_type=emplomentType, date_post=SYSDATE(), date_close=dateClose, requirement=positionRequirement;
	insert into activity_log set user_id=userId, activity_type='Add Volunteer', note=CONCAT('Add Volunteer: ',positionTitle), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `removeVolunteer` */

/*!50003 DROP PROCEDURE IF EXISTS  `removeVolunteer` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `removeVolunteer`(activityUsername varchar(50), theVolunteerId INT(10))
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUsername);
	delete from Volunteer where volunteer_id=theVolunteerId;
	insert into activity_log set user_id=userId, activity_type='Delete Volunteer', note=CONCAT('Delete Volunteer ID: ',theVolunteerId), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `editNews` */

/*!50003 DROP PROCEDURE IF EXISTS  `editNews` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `editNews`( activityUsername varchar(50), newsId int(10), newsTitle varchar(30), datePost date, newsHref varchar(255), hrefLable varchar(50), newsContent TEXT)
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUsername);
	update news set title=newsTitle, date_post=datePost, href=newsHref, href_lable=hrefLable, content=newsContent
	where news_id=newsId;
	insert into activity_log set user_id=userId, activity_type='Edit News', note=CONCAT('Edit News ID: ',newsId), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `addNews` */

/*!50003 DROP PROCEDURE IF EXISTS  `addNews` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `addNews`( activityUsername varchar(50), newsTitle varchar(30), newsHref varchar(255), hrefLable varchar(50), newsContent TEXT)
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUsername);
	insert into news set title=newsTitle, date_post=SYSDATE(), href=newsHref, href_lable=hrefLable, content=newsContent;
	insert into activity_log set user_id=userId, activity_type='Add News', note=CONCAT('Add News: ',newsTitle), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `removeNews` */

/*!50003 DROP PROCEDURE IF EXISTS  `removeNews` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `removeNews`(activityUsername varchar(50), newsId INT(10))
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUsername);
	delete from news where news_id=newsId;
	insert into activity_log set user_id=userId, activity_type='Delete News', note=CONCAT('Delete News ID: ',newsId), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `editPromo` */

/*!50003 DROP PROCEDURE IF EXISTS  `editPromo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `editPromo`( activityUsername varchar(50), promoId int(10), datePost date, dateExpire date, promoContent TEXT)
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUsername);
	update promo set date_post=datePost, date_expire=dateExpire, content=promoContent
	where promo_id=promoId;
	insert into activity_log set user_id=userId, activity_type='Edit Promo', note=CONCAT('Edit Promo ID: ',promoId), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `addPromo` */

/*!50003 DROP PROCEDURE IF EXISTS  `addPromo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `addPromo`( activityUsername varchar(50), dateExpire date, promoContent TEXT)
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUsername);
	insert into promo set date_post=SYSDATE(), date_expire=dateExpire, content=promoContent;
	insert into activity_log set user_id=userId, activity_type='Add Promo', note=CONCAT('Add Promo: ',newsTitle), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `removePromo` */

/*!50003 DROP PROCEDURE IF EXISTS  `removePromo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `removePromo`(activityUsername varchar(50), promoId INT(10))
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUsername);
	delete from promo where promo_id=promoId;
	insert into activity_log set user_id=userId, activity_type='Delete Promo', note=CONCAT('Delete Promo ID: ',promoId), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `editApplication` */

/*!50003 DROP PROCEDURE IF EXISTS  `editApplication` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `editApplication`( activityUsername varchar(50), applicationId int(10), careerId int(10), internId int(10), volunteerId int(10), TheName varchar(30), theEmail varchar(50), contactNumber varchar(11), coverLeter TEXT, resumePath varchar(100))
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUsername);
	update application set career_id=careerId, intern_id=internId, volunteer_id=volunteerId, name=theName, email=theEmail, contact_number=contactNumber, cover_leter=coverLeter, resume_path=resumePath
	where application_id=applicationId;
	insert into activity_log set user_id=userId, activity_type='Edit Application', note=CONCAT('Edit Application ID: ',applicationId), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `addApplication` */

/*!50003 DROP PROCEDURE IF EXISTS  `addApplication` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `addApplication`( activityUsername varchar(50), careerId int(10), internId int(10), volunteerId int(10), TheName varchar(30), theEmail varchar(50), contactNumber varchar(11), coverLeter TEXT, resumePath varchar(100))
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUsername);
	insert into application set career_id=careerId, intern_id=internId, volunteer_id=volunteerId, name=theName, email=theEmail, contact_number=contactNumber, cover_leter=coverLeter, resume_path=resumePath;
	insert into activity_log set user_id=userId, activity_type='Add Application', note=CONCAT('Add Application Name: ',TheName), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `removeApplication` */

/*!50003 DROP PROCEDURE IF EXISTS  `removeApplication` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `removeApplication`(activityUsername varchar(50), applicationId INT(10))
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUsername);
	delete from application where application_id=applicationId;
	insert into activity_log set user_id=userId, activity_type='Delete application', note=CONCAT('Delete Applacation ID: ',applicationId), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getRecord` */

/*!50003 DROP PROCEDURE IF EXISTS  `getRecord` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getRecord`( recordId INT(10))
BEGIN
	select * from patient_record where record_number=recordId;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `addNewJournal` */

/*!50003 DROP PROCEDURE IF EXISTS  `addNewJournal` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `addNewJournalByPatient`(activityUser varchar(50), username varchar(50), purpose varchar(100), current decimal, goal decimal, start decimal, lowest decimal, halfway decimal, lost decimal, calories decimal, chest decimal, waist decimal, abdomen decimal, hip decimal)
BEGIN
	DECLARE userId int(10);
	DECLARE patientId int(10);
	DECLARE recordNumber int(10);
	SET userId = getUserId(activityUser);
	SET patientId = getUserId(username);
	insert into patient_record set patient_id=patientId, date_of_measurement=SYSDATE(), patient_current_weight=current, patient_goal_weight=goal, patient_start_weight=start, patient_lowest_weight=lowest, patient_half_way_weight=halfway, patient_weight_lost=lost, patient_calories_level=calories, patient_chest_measure=chest, patient_waist_measure=waist, patient_abdomen_measure=abdomen, patient_hip_measure=hip;
	select record_number into recordNumber from patient_record
	where patient_id=patientId and patient_current_weight=current and patient_goal_weight=goal and patient_start_weight=start and patient_lowest_weight=lowest and patient_half_way_weight=halfway and patient_weight_lost=lost and patient_calories_level=calories and patient_chest_measure=chest and patient_waist_measure=waist and patient_abdomen_measure=abdomen and patient_hip_measure=hip;
	insert into patient_journal set patient_id=patientId, record_number=recordNumber, date_record=SYSDATE(), motivation=purpose, start_weight=current, end_weight=goal;
	insert into activity_log set user_id=userId, activity_type='Add New Journal', note=CONCAT('Add New Journal For: ',username), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `chechJournalComplete` */

/*!50003 DROP PROCEDURE IF EXISTS  `chechJournalComplete` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `chechJournalComplete`(activityUser varchar(50), username varchar(50), journalId int)
BEGIN
	DECLARE userId int(10);
	DECLARE patientId int(10);
	SET userId = getUserId(activityUser);
	SET patientId = getUserId(username);
	update patient_journal set activity_completed='Completed', date_completed=SYSDATE() where journal_number=journalId;
	insert into activity_log set user_id=userId, activity_type='Update Patient Journal', note=CONCAT('Change Activity Completed For: ',username), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getInvoiceForUser` */

/*!50003 DROP PROCEDURE IF EXISTS  `getInvoiceForUser` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getInvoiceForUser`( theUsername varchar(50))
BEGIN
	DECLARE userId INT(10);
	SET userId = getUserId(theUsername);
	select * from invoice where patient_id=userId;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getAllAppointment` */

/*!50003 DROP PROCEDURE IF EXISTS  `getAllAppointment` */;

DELIMITER $$
/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllAppointment`()
BEGIN
	select * from appointment;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getAppointmentById` */

/*!50003 DROP PROCEDURE IF EXISTS  `getAppointmentById` */;

DELIMITER $$
/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getAppointmentById`(theId INT(10))
BEGIN
	select * from appointment where appointment_id=theId;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `editAppointmentById` */

/*!50003 DROP PROCEDURE IF EXISTS  `editAppointmentById` */;

DELIMITER $$
/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `editAppointmentById`(activityUser varchar(50), theId INT(10), patientId int(10), nutritionId int(10), startTime timestamp, endTime timestamp, appointmentType varchar(20), thePurpose TEXT)
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUser);
	update appointment set patient_id=patientId, nutrition_id=nutritionId, start_time=startTime, end_time=endTime, type=appointmentType, purpose=thePurpose
	where appointment_id=theId;
	insert into activity_log set user_id=userId, activity_type='Edit Appointment', note=CONCAT('Edit Appointment For: ',patientId), date_time=SYSDATE();
    END */$$
DELIMITER ;

/* Procedure structure for procedure `removeAppointmentById` */

/*!50003 DROP PROCEDURE IF EXISTS  `removeAppointmentById` */;

DELIMITER $$
/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `removeAppointmentById`(activityUser varchar(50), theId INT(10))
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUser);
	delete from appointment where appointment_id=theId;
	insert into activity_log set user_id=userId, activity_type='Delete Appointment', note=CONCAT('Delete Appointment For: ',theId), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `addAppointment` */

/*!50003 DROP PROCEDURE IF EXISTS  `addAppointment` */;

DELIMITER $$
/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `addAppointment`(activityUser varchar(50), patientId int(10), nutritionId int(10), startTime timestamp, endTime timestamp, appointmentType varchar(20), thePurpose TEXT)
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUser);
	insert into appointment set patient_id=patientId, nutrition_id=nutritionId, start_time=startTime, end_time=endTime, type=appointmentType, purpose=thePurpose;
	insert into activity_log set user_id=userId, activity_type='Add Appointment', note=CONCAT('Add Appointment For: ',patientId), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getInvoice` */

/*!50003 DROP PROCEDURE IF EXISTS  `getInvoice` */;

DELIMITER $$
/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getInvoice`()
BEGIN
	select * from invoice;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `addInvoice` */

/*!50003 DROP PROCEDURE IF EXISTS  `addInvoice` */;

DELIMITER $$
/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `addInvoice`(activityUser varchar(50), patientId INT(10), subTotal decimal, taxRate decimal, taxableAmount decimal, theTotal decimal, billAddress varchar(50), theDescription varchar(100))
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUser);
	insert into invoice set patient_id=patientId, date_invoice=SYSDATE(), sub_total=subTotal, tax_rate=taxRate, taxable_amount=taxableAmount, total=theTotal, bill_address=billAddress, description=theDescription, due_date=DATE_ADD(SYSDATE(),INTERVAL 30 DAY);
	insert into activity_log set user_id=userId, activity_type='Add Invoice', note=CONCAT('Add Invoice For: ',patientId), date_time=SYSDATE();
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getPatientList` */

/*!50003 DROP PROCEDURE IF EXISTS  `getPatientList` */;

DELIMITER $$
/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getPatientList`()
BEGIN
	select * from patient;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getJournalById` */

/*!50003 DROP PROCEDURE IF EXISTS  `getJournalById` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getJournalById`( id INT(10))
BEGIN
	select * from patient_journal where patient_id=id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getTheUserId` */

/*!50003 DROP PROCEDURE IF EXISTS  `getTheUserId` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getTheUserId`(theUsername VARCHAR(50))
BEGIN
	SELECT account_id FROM account WHERE username=theUsername;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `changeInvoiceStatus` */

/*!50003 DROP PROCEDURE IF EXISTS  `changeInvoiceStatus` */;

DELIMITER $$
/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `changeInvoiceStatus`(activityUser varchar(50), theId INT(10))
BEGIN
	DECLARE userId int(10);
	SET userId = getUserId(activityUser);
	update invoice set status='Paid' where invoice_number=theId;
	insert into activity_log set user_id=userId, activity_type='Delete Appointment', note=CONCAT('Delete Appointment For: ',theId), date_time=SYSDATE();
	commit;
    END */$$
DELIMITER ;

DROP USER IF EXISTS 'htgNutrition'@`localhost`;

CREATE USER 'htgNutrition'@`localhost` IDENTIFIED BY 'password';

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE on capstone.* to 'htgNutrition'@`localhost`;

GRANT CREATE ROUTINE ON capstone.* TO 'htgNutrition'@`localhost`;

GRANT EXECUTE ON capstone.* TO 'htgNutrition'@`localhost`;

insert  into `career`(`career_id`,`position_title`,`position_category`,`emploment_type`,`date_post`,`date_close`,`requirement`) values 

(2,'Programmer','MTS','Permanent','2017-04-12','2017-04-26','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas euismod porttitor sodales. Pellentesque volutpat nisl libero, eget vestibulum purus mollis vitae. Praesent libero nisl, placerat at tincidunt at, lacinia sed metus. Nam eget mi id lorem condimentum suscipit. Vivamus iaculis urna purus, a rhoncus mauris mollis in. Duis vestibulum suscipit massa eget sollicitudin. Ut vulputate, libero non pulvinar elementum, metus orci venenatis risus, ut interdum metus justo sit amet est. Donec egestas elit ex, vulputate convallis dolor consequat vel. Morbi nisl ex, consectetur vel faucibus ac, volutpat vitae diam. Ut turpis lectus, pretium quis congue id, semper quis enim. Morbi vel dictum metus. Nulla quis semper tellus, aliquam dapibus neque. Vestibulum bibendum libero sapien. Etiam feugiat blandit lectus rutrum tristique. Nulla sapien turpis, malesuada nec tempus congue, pulvinar non mauris. Maecenas ac fermentum neque, vel ornare tortor.\r\n\r\nAenean in tristique est. Etiam fringilla, nisi sit amet sollicitudin gravida, risus dolor lacinia lorem, in accumsan orci orci non lorem. Maecenas tellus sem, ultrices non nibh ut, tempus ultricies ligula. Ut sollicitudin elit ac purus laoreet, sit amet ornare urna imperdiet. In eget mollis eros. Praesent consectetur tincidunt magna non faucibus. Integer posuere nulla non risus scelerisque, eget fermentum est cursus. Vestibulum condimentum a nunc nec tincidunt. Quisque at neque porta, euismod leo finibus, pellentesque magna. Nullam nulla leo, cursus ac libero et, porta tempor sem. Ut gravida ipsum quis risus dapibus, vel convallis odio congue. Donec efficitur congue ligula vel commodo. Duis vitae malesuada risus, vel tincidunt libero. Sed nec tristique lectus, vitae interdum ipsum.\r\n\r\nQuisque neque justo, tincidunt vitae tortor non, iaculis ornare lorem. Praesent aliquam ornare leo in pharetra. Fusce ultrices nisl eu enim scelerisque faucibus. Nam convallis justo ac congue suscipit. Mauris quis erat eget metus posuere imperdiet. Vivamus fringilla pretium enim, id mattis risus cursus non. In hac habitasse platea dictumst. Quisque malesuada suscipit ligula, non tempus neque euismod eget. In luctus lectus quis dolor dictum, quis porta turpis vulputate.\r\n\r\nSed ac tristique diam. Etiam tristique, orci eget gravida feugiat, odio elit congue mauris, hendrerit elementum enim odio et est. Sed iaculis tincidunt nunc a tincidunt. Praesent auctor venenatis ultricies. Nulla pharetra, dui tincidunt auctor bibendum, magna mauris malesuada ex, vitae faucibus justo elit vitae ipsum. Maecenas accumsan augue lectus, non blandit ipsum dignissim non. Etiam laoreet varius libero nec aliquet.\r\n\r\nDonec in lacinia nisi. Duis in turpis dolor. Maecenas in lorem quam. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec nec leo sit amet orci convallis gravida et nec ligula. Mauris semper turpis ac sodales molestie. Maecenas porta, lorem a volutpat congue, sapien nibh consectetur eros, in dictum eros erat ut est.'),

(4,'Janitor','Maintenance','Casual','2017-04-19','2017-04-30','Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit amet consectetur adipisci[ng] velit, sed quia non numquam [do] eius modi tempora inci[di]dunt, ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit, qui in ea voluptate velit esse, quam nihil molestiae consequatur, vel illum, qui dolorem eum fugiat, quo voluptas nulla pariatur?');

/*Data for the table `intern` */

insert  into `intern`(`intern_id`,`position_title`,`position_category`,`emploment_type`,`date_post`,`date_close`,`requirement`) values 

(1,'Programmer Intern','Intern','Temporary','2017-04-12','2017-04-26','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas euismod porttitor sodales. Pellentesque volutpat nisl libero, eget vestibulum purus mollis vitae. Praesent libero nisl, placerat at tincidunt at, lacinia sed metus. Nam eget mi id lorem condimentum suscipit. Vivamus iaculis urna purus, a rhoncus mauris mollis in. Duis vestibulum suscipit massa eget sollicitudin. Ut vulputate, libero non pulvinar elementum, metus orci venenatis risus, ut interdum metus justo sit amet est. Donec egestas elit ex, vulputate convallis dolor consequat vel. Morbi nisl ex, consectetur vel faucibus ac, volutpat vitae diam. Ut turpis lectus, pretium quis congue id, semper quis enim. Morbi vel dictum metus. Nulla quis semper tellus, aliquam dapibus neque. Vestibulum bibendum libero sapien. Etiam feugiat blandit lectus rutrum tristique. Nulla sapien turpis, malesuada nec tempus congue, pulvinar non mauris. Maecenas ac fermentum neque, vel ornare tortor.\r\n\r\nAenean in tristique est. Etiam fringilla, nisi sit amet sollicitudin gravida, risus dolor lacinia lorem, in accumsan orci orci non lorem. Maecenas tellus sem, ultrices non nibh ut, tempus ultricies ligula. Ut sollicitudin elit ac purus laoreet, sit amet ornare urna imperdiet. In eget mollis eros. Praesent consectetur tincidunt magna non faucibus. Integer posuere nulla non risus scelerisque, eget fermentum est cursus. Vestibulum condimentum a nunc nec tincidunt. Quisque at neque porta, euismod leo finibus, pellentesque magna. Nullam nulla leo, cursus ac libero et, porta tempor sem. Ut gravida ipsum quis risus dapibus, vel convallis odio congue. Donec efficitur congue ligula vel commodo. Duis vitae malesuada risus, vel tincidunt libero. Sed nec tristique lectus, vitae interdum ipsum.\r\n\r\nQuisque neque justo, tincidunt vitae tortor non, iaculis ornare lorem. Praesent aliquam ornare leo in pharetra. Fusce ultrices nisl eu enim scelerisque faucibus. Nam convallis justo ac congue suscipit. Mauris quis erat eget metus posuere imperdiet. Vivamus fringilla pretium enim, id mattis risus cursus non. In hac habitasse platea dictumst. Quisque malesuada suscipit ligula, non tempus neque euismod eget. In luctus lectus quis dolor dictum, quis porta turpis vulputate.\r\n\r\nSed ac tristique diam. Etiam tristique, orci eget gravida feugiat, odio elit congue mauris, hendrerit elementum enim odio et est. Sed iaculis tincidunt nunc a tincidunt. Praesent auctor venenatis ultricies. Nulla pharetra, dui tincidunt auctor bibendum, magna mauris malesuada ex, vitae faucibus justo elit vitae ipsum. Maecenas accumsan augue lectus, non blandit ipsum dignissim non. Etiam laoreet varius libero nec aliquet.\r\n\r\nDonec in lacinia nisi. Duis in turpis dolor. Maecenas in lorem quam. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec nec leo sit amet orci convallis gravida et nec ligula. Mauris semper turpis ac sodales molestie. Maecenas porta, lorem a volutpat congue, sapien nibh consectetur eros, in dictum eros erat ut est.');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;