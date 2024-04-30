-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2024 at 06:25 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlineshop`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)   SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', '25f9e794323b453885f5181f1b624d0b');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'Dunhill'),
(2, 'D&G'),
(3, 'Tomford'),
(4, 'Creed'),
(5, 'Giorgio Armani'),
(6, 'Banana Republic'),
(7, 'Hugo Boss ');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(6, 2, '::1', 15, 1),
(9, 10, '::1', 21, 1),
(10, 11, '::1', 22, 1),
(11, 5, '::1', 16, 1),
(44, 5, '::1', 19, 1),
(46, 2, '::1', 12, 1),
(147, 3, '::1', -1, 2),
(148, 1, '::1', -1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Men'),
(2, 'Women'),
(3, 'Unisex');

-- --------------------------------------------------------

--
-- Table structure for table `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'jisan11@gmail.com'),
(4, 'puneethroy51@gmail.com'),
(5, 'nosin51@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `keywords`
--

CREATE TABLE `keywords` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `keyword` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `keywords`
--

INSERT INTO `keywords` (`id`, `keyword`) VALUES
(1, 'Fragrance'),
(2, 'Perfume'),
(3, 'Cologne'),
(4, 'Scent'),
(5, 'Designer'),
(6, 'Luxury'),
(7, 'Dunhill'),
(8, 'D&G'),
(9, 'Tom Ford'),
(10, 'Creed'),
(11, 'Emporio Armani'),
(12, 'Giorgio Armani'),
(13, 'Hugo Boss'),
(14, 'Banana Republic'),
(15, 'Dolce&Gabbana'),
(16, 'EDT'),
(17, 'EDP'),
(18, 'Perfume Spray'),
(19, 'Men\'s Fragrance'),
(20, 'Women\'s Fragrance'),
(21, 'Eau de Parfum'),
(22, 'Eau de Toilette'),
(23, 'Signature Scent');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(1, 12, 'Sonia', 'sonia11@gmail.com\r\n', 'Mymensingh', 'Mymensingh', 'Mymensingh', 2200, 'pokjhgfcxc', '4321 2345 6788 7654', '12/90', 1, 11500, 1234);

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(73, 1, 10, 1, 11500),
(74, 2, 4, 1, 5945);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 1, 5, 'Emporio Armani Stronger With You Intesely EDP', 12000, 'Emporio Armani Stronger With You Intesely EDP', 'product-1.jpg', 'Men\'s Perfume'),
(2, 1, 4, 'Creed Green Irish Tweed EDP', 22230, 'Creed Green Irish Tweed EDP', 'product-2.jpg', 'Men\'s perfume'),
(3, 1, 2, 'K by Dolce&Gabbana Eau de Parfum', 6700, 'K by Dolce&Gabbana Eau de Parfum', 'product-3.jpg', 'Men\'s perfume'),
(4, 1, 1, 'Dunhill Icon', 5945, 'Dunhill Icon EDP', 'product-4.jpg', 'Men\'s perfume'),
(6, 1, 1, 'Dunhill Icon Absolute Alfred', 5945, 'Dunhill Icon Absolute Alfred', 'product-6.jpg', 'Men\'s perfume'),
(8, 1, 2, 'The one for Men Dolce&Gabbana', 6500, 'The one for Men Dolce&Gabbana', 'product-8.jpg', 'Men\'s perfume'),
(9, 1, 7, 'Hugo Boss Bottled Night EDT', 4999, 'Hugo Boss Bottled Night EDT', 'product-9.jpg', 'Men\'s perfume'),
(10, 2, 1, 'Dunhill Desire', 11500, 'Dunhill Desire', 'product-11.jpg', 'Women\'s perfume'),
(11, 2, 4, 'Creed Carmina ', 19500, 'Creed Carmina ', 'product-12.jpg', 'Women\'s perfume'),
(12, 2, 7, 'Boss The Scent for Her Eau de Parfum ', 8190, 'Boss The Scent for Her Eau de Parfum ', 'product-13.jpg', 'Women\'s perfume'),
(13, 2, 5, 'Giorgio Armani Perfume Emporio Armani in Love With You ', 8200, 'Giorgio Armani Perfume Emporio Armani in Love With You ', 'product-14.jpg', 'Women\'s perfume'),
(14, 2, 6, 'Banana Republic W Eau de Parfum Spray ', 2290, 'Banana Republic W Eau de Parfum Spray ', 'product-15.jpg', 'Women\'s perfume '),
(15, 3, 2, 'Light Blue Summer Vibes Eau de Toilette', 11440, 'Light Blue Summer Vibes Eau de Toilette', 'product-16.jpg', 'Unisex perfume'),
(16, 3, 1, 'Dunhill Cologne ', 4600, 'Dunhill Cologne ', 'product-17.jpg', 'Unisex perfume'),
(17, 1, 3, 'Tom Ford Oud Wood EDP', 28000, 'Tom Ford Oud Wood EDP', 'product-10.jpg', 'Men\'s perfume'),
(18, 2, 7, 'FEMME BY BOSS EAU DE PARFUM', 5250, 'FEMME BY BOSS EAU DE PARFUM', 'product-18.jpg', 'Women\'s Perfume'),
(19, 2, 7, 'HUGO DEEP RED EAU DE PARFUM', 2400, 'HUGO DEEP RED EAU DE PARFUM', 'product-19.jpg', 'Women\'s perfume'),
(21, 3, 4, 'Creed Virgin Island water', 18900, 'Creed Virgin Island water', 'product-21.jpg', 'Unisex perfume'),
(22, 3, 4, 'Creed Himalaya Eau de Parfum', 27655, 'Creed Himalaya Eau de Parfum', 'product-22.jpg', 'Unisex perfume'),
(23, 3, 6, 'Banana Republic Classic Citrus', 4070, 'Banana Republic Classic Citrus', 'product-23.jpg', 'Unisex perfume'),
(24, 3, 6, 'Banana Republic Classic Acqua', 3520, 'Banana Republic Classic Acqua', 'product-24.jpg', 'Unisex perfume'),
(82, 2, 2, 'Perfume', 2222, 'Loreunnnnn', '1714407005_product-4.jpg', 'Dunhil'),
(83, 1, 2, 'Perfume', 22222, 'something', '1714407067_product-12.jpg', 'Dunhil'),
(84, 1, 6, 'Perfume1', 569, 'EEEE', '1714407606_product-13.jpg', 'Dunhil'),
(85, 2, 6, 'Perfume12', 569, 'EEEE', '1714407791_product-12.jpg', 'Dunhil');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'Sonia', 'Akhter', 'sonia11@gmail.com', 'sonia11', '01771189653', 'Mymensingh', 'Dhaka'),
(15, 'Nosin', 'Nabila', 'nosin51@gmail.com', 'nosin51', '01993422334', 'Sylhet', 'Dhaka'),
(16, 'Nishat', 'Tasnim', 'nishat07@gmail.com', '1234534', '01552277889', 'Rangpur', 'Dhaka'),
(19, 'Abhishek', 'Das', 'abhishekds@gmail.com', 'asdcsdcc', '01667895465', 'Mymensingh', 'Dhaka'),
(21, 'Abdul', 'Rahman', 'abdul99@gmail.com', '1234545662', '01667788990', 'Rajshahi', 'Mongla'),
(22, 'Jisan', 'Mahmud', 'jisan11@gmail.com', '1234534', '01739654653', 'Kustia', 'Dhaka'),
(23, 'Tanni', 'Rahman', 'tanni22@gmail.com', '999123', '01533445567', 'Bhaluka', 'Khulna');

--
-- Triggers `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'Sonia', 'Akhter', 'sonia11@gmail.com', 'sonia11', '01771189653', 'Mymensingh', 'Dhaka'),
(14, 'Nosin', 'Nabila', 'nosin51@gmail.com', 'nosin51', '01993422334', 'Sylhet', 'Dhakar'),
(15, 'Nishat', 'Tasnim', 'nishat07@gmail.com', '346778', '01552277889', 'Rangpur', 'Dhaka'),
(16, 'Abhishek', 'Das', 'abhishekds@gmail.com', '1234534', '01667895465', 'Mymensingh ', 'Dhaka'),
(19, 'Abdul', 'Rahman', 'abdul99@gmail.com', 'asdcsdcc', '01667788990', 'Rajshahi', 'Mongla'),
(20, 'Jisan', 'Mahmud', 'jisan11@gmail.com', '124335353', '01739654653', 'Kustia', 'Dhaka'),
(21, 'Tanni', 'Rahman', 'tanni22@gmail.com', '1234545662', '01533445567', 'Bhaluka', 'Khulna'),
(22, 'Puneeth', 'Dey', 'pudey@gmail.com', '1234534', '01987765433', 'Khulna', 'Barishal'),
(23, 'Hemanth', 'Roy', 'hemanth@gmail.com', 'hemanth@123', '01987654323', 'Bagherhat', 'Sylhet');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `keywords`
--
ALTER TABLE `keywords`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `keywords`
--
ALTER TABLE `keywords`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
