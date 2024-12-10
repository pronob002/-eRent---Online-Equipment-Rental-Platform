-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 02, 2023 at 01:33 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `erentdatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(250) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_image` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_email`, `admin_image`, `admin_password`) VALUES
(1, 'Admin_pronob', 'u1904027@student.cuet.ac.bd', 'Admin_pronob.jpeg', '123');

-- --------------------------------------------------------

--
-- Table structure for table `cart_details`
--

CREATE TABLE `cart_details` (
  `product_id` int(11) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `quantity` int(100) NOT NULL DEFAULT 1,
  `days` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `catagory`
--

CREATE TABLE `catagory` (
  `cat_id` int(11) NOT NULL,
  `parent_cat` varchar(100) NOT NULL,
  `child_cat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `catagory`
--

INSERT INTO `catagory` (`cat_id`, `parent_cat`, `child_cat`) VALUES
(9, 'Vehicle', 'Private Car'),
(10, 'Vehicle', 'Truck'),
(11, 'Power Tools', 'Drill mechine'),
(12, 'Vehicle', 'Cargo'),
(13, 'To-let', 'Apartment'),
(14, 'Vehicle', 'Motor-cycle'),
(15, 'Electronic equipment', 'Camera'),
(16, 'Pet', 'Dog');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `loc_id` int(11) NOT NULL,
  `parent_loc` varchar(100) NOT NULL,
  `child_loc` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`loc_id`, `parent_loc`, `child_loc`) VALUES
(7, 'Chottogram', 'Cumilla'),
(8, 'Dhaka', 'Gazipur'),
(9, 'Rangpur', 'Nilphamari'),
(10, 'Rajshahi', 'Bogra'),
(11, 'Khulna', 'Bagerhat'),
(12, 'Khulna', 'Chuadanga'),
(13, 'Chottogram', 'Feni'),
(14, 'Dhaka', 'Narayangonj'),
(15, 'Rangpur', 'Dinajpur'),
(16, 'Dhaka', 'Gopalganj');

-- --------------------------------------------------------

--
-- Table structure for table `orders_pending`
--

CREATE TABLE `orders_pending` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `invoice_number` int(250) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(250) NOT NULL,
  `days` int(100) NOT NULL,
  `order_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders_pending`
--

INSERT INTO `orders_pending` (`order_id`, `user_id`, `invoice_number`, `product_id`, `quantity`, `days`, `order_status`) VALUES
(1, 1, 1790292585, 3, 2, 2, 'pending'),
(2, 1, 1790292585, 5, 1, 3, 'pending'),
(3, 1, 1136158574, 5, 2, 2, 'pending'),
(4, 1, 912939776, 4, 2, 2, 'pending'),
(5, 1, 1775745452, 4, 2, 2, 'pending'),
(6, 1, 1775745452, 11, 2, 5, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `prod_id` int(11) NOT NULL,
  `provider_name` varchar(255) NOT NULL,
  `prod_title` varchar(100) NOT NULL,
  `prod_description` varchar(255) NOT NULL,
  `prod_keywords` varchar(255) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `loc_id` int(11) NOT NULL,
  `prod_img1` varchar(255) NOT NULL,
  `prod_img2` varchar(255) NOT NULL,
  `prod_img3` varchar(255) NOT NULL,
  `prod_price` int(11) NOT NULL,
  `mob_no` varchar(30) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`prod_id`, `provider_name`, `prod_title`, `prod_description`, `prod_keywords`, `cat_id`, `loc_id`, `prod_img1`, `prod_img2`, `prod_img3`, `prod_price`, `mob_no`, `date`, `status`) VALUES
(1, 'pro123', 'Spacious Family Car', 'Most popular choice since 2017 with less budget', 'cumilla,private car,ctg,small car', 9, 7, 'privatecar3.jpg', 'privatecar1.png', 'privatecar2.jpg', 600, '0123456780', '2023-07-29 14:02:03', 'false'),
(3, 'pro123', 'Spacious Truck', 'Useable for all types of heavy transportation', 'truck,dhaka,gazipur', 10, 8, 'Truck4.jpg', 'Truck1.jpg', 'Truck2.jpg', 700, '12333333334', '2023-07-29 14:04:15', 'false'),
(4, 'pro123', 'Powerful Drill Machine for All Your Drilling Needs', 'Powerful and versatile drill machine for efficient drilling in various materials, ideal for DIY projects and professional use', 'rangpur,drill', 11, 9, 'drill2.jpg', 'drill1.jpeg', 'drill3.png', 200, '12333333334', '2023-08-01 17:00:41', 'true'),
(5, 'sha123', 'Sturdy Cargo Shorts with Multiple Pockets - Ideal for Outdoor Adventures', 'Spacious and durable cargo bag, perfect for storing and transporting belongings on your travels', 'rajshahi,cargo', 12, 10, 'cargo1.jpg', 'cargo2.jpg', 'cargo3.jpg', 1800, '0191928288', '2023-08-01 17:08:35', 'true'),
(6, 'sha123', 'Urban Oasis: Luxury 2-Bedroom Apartment with Spectacular City Views', 'Stylish and modern apartment featuring panoramic city views, upscale amenities, and a prime location for urban living', 'khulna,bagerhat,apartment', 13, 11, 'francesca-tosolini-tHkJAMcO3QE-unsplash.jpg', 'isaac-benhesed-1SbJCq-vHpI-unsplash.jpg', 'luke-van-zyl-koH7IVuwRLw-unsplash.jpg', 10000, '0191928288', '2023-08-01 20:22:26', 'true'),
(7, 'sha123', 'Urban Oasis: Luxury 2-Bedroom Apartment with Spectacular City Views', 'Stylish and modern apartment featuring panoramic city views, upscale amenities, and a prime location for urban living', 'khulna,chuadanga,apartment', 13, 12, 'paul-szewczyk-nI4aC1kaTRc-unsplash.jpg', 'luke-van-zyl-koH7IVuwRLw-unsplash.jpg', 'isaac-benhesed-1SbJCq-vHpI-unsplash.jpg', 15000, '0191928288', '2023-08-01 20:26:00', 'true'),
(8, 'sha123', 'Urban Oasis: Luxury 2-Bedroom Apartment with Spectacular City Views22', 'Stylish and modern apartment featuring panoramic city views, upscale amenities, and a prime location for urban living.', 'apartment', 13, 7, 'sigmund-CwTfKH5edSk-unsplash.jpg', 'luke-van-zyl-koH7IVuwRLw-unsplash.jpg', 'isaac-benhesed-1SbJCq-vHpI-unsplash.jpg', 18300, '0191928288', '2023-08-01 21:46:07', 'true'),
(9, 'sefat123', 'SpeedX Pro: The Ultimate High-Performance Carbon Fiber Road Bike', 'Efficient, lightweight, and built for speed - our cycle is the perfect companion for your exhilarating rides', 'bike,feni', 14, 13, 'conor-luddy-HKF3K2RT0KE-unsplash.jpg', 'andrew-pons-cLHPacdtpSY-unsplash.jpg', 'conor-luddy-R2PpxA2j0pQ-unsplash.jpg', 230, '0191928288', '2023-08-01 20:40:55', 'true'),
(10, 'sefat123', 'SpeedX Pro: The Ultimate High-Performance Carbon Fiber Road Bike22', 'Efficient, lightweight, and built for speed - our cycle is the perfect companion for your exhilarating rides', 'dhaka,bike,narayanganj', 14, 14, 'andrew-pons-cLHPacdtpSY-unsplash.jpg', 'conor-luddy-HKF3K2RT0KE-unsplash.jpg', 'conor-luddy-R2PpxA2j0pQ-unsplash.jpg', 400, '12333333334', '2023-08-01 20:44:04', 'true'),
(11, 'sefat123', 'CaptureMasters Pro: The Ultimate 4K DSLR Camera for Stunning Visuals', 'Unleash your creativity with our high-resolution DSLR camera, designed to capture breathtaking moments with precision and clarity.', 'camera,dinajpur', 15, 15, 'christof-w-ItaAIuTh5Uc-unsplash.jpg', 'clement-remond-BB2G2cfdXKE-unsplash.jpg', 'hanson-lu-gGgoDJRD2WM-unsplash.jpg', 800, '0191928288', '2023-08-01 21:43:17', 'true'),
(12, 'pro123', 'Pet Sitting Services', 'Reliable and loving pet sitting services offered for all kinds of pets. Your furry friend will be in safe hands, receiving the best care during their stay with me. Contact me now to book their vacation', 'pet,dog', 16, 16, 'alan-king-KZv7w34tluA-unsplash.jpg', 'cute-stray-cat-walking-streets-rabat-morocco.jpg', 'alan-king-KZv7w34tluA-unsplash.jpg', 1000, '016348922166', '2023-08-01 23:00:27', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `receipt`
--

CREATE TABLE `receipt` (
  `user_id` int(11) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `days` int(100) NOT NULL,
  `price` int(11) NOT NULL,
  `total_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `receipt`
--

INSERT INTO `receipt` (`user_id`, `product_title`, `quantity`, `days`, `price`, `total_price`) VALUES
(1, 'Spacious Truck', 2, 2, 700, 2800),
(1, 'Sturdy Cargo Shorts with Multiple Pockets - Ideal for Outdoor Adventures', 1, 3, 1800, 8200),
(1, 'Sturdy Cargo Shorts with Multiple Pockets - Ideal for Outdoor Adventures', 2, 2, 1800, 7200),
(1, 'Powerful Drill Machine for All Your Drilling Needs', 2, 2, 200, 800),
(1, 'Powerful Drill Machine for All Your Drilling Needs', 2, 2, 200, 800),
(1, 'CaptureMasters Pro: The Ultimate 4K DSLR Camera for Stunning Visuals', 2, 5, 800, 8800);

-- --------------------------------------------------------

--
-- Table structure for table `rental_provider`
--

CREATE TABLE `rental_provider` (
  `product_id` int(11) NOT NULL,
  `provider_name` varchar(255) NOT NULL,
  `email` varchar(250) NOT NULL,
  `product_title` varchar(250) NOT NULL,
  `product_description` varchar(250) NOT NULL,
  `prod_img1` varchar(255) NOT NULL,
  `prod_img2` varchar(255) NOT NULL,
  `prod_img3` varchar(255) NOT NULL,
  `prod_price` int(200) NOT NULL,
  `mobile` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rental_provider`
--

INSERT INTO `rental_provider` (`product_id`, `provider_name`, `email`, `product_title`, `product_description`, `prod_img1`, `prod_img2`, `prod_img3`, `prod_price`, `mobile`) VALUES
(1, 'pro123', 'u1904027@student.cuet.ac.bd', 'Spacious Family Car', 'Most popular choice since 2017 with less budget', 'privatecar1.png', 'privatecar2.jpg', 'privatecar3.jpg', 600, '01634892166'),
(3, 'pro123', 'Moscutto@frogreat.com', 'Spacious Truck', 'Useable for all types of heavy transportation', 'Truck1.jpg', 'Truck2.jpg', 'Truck4.jpg', 700, '12333333334'),
(4, 'pro123', 'u1904027@student.cuet.ac.bd', 'Powerful Drill Machine for All Your Drilling Needs', 'Powerful and versatile drill machine for efficient drilling in various materials, ideal for DIY projects and professional use', 'drill2.jpg', 'drill1.jpeg', 'drill3.png', 200, '12333333334'),
(5, 'sha123', 'Moscutto@frogreat.com', 'Sturdy Cargo Shorts with Multiple Pockets - Ideal for Outdoor Adventures', 'Spacious and durable cargo bag, perfect for storing and transporting belongings on your travels', 'cargo1.jpg', 'cargo2.jpg', 'cargo3.jpg', 1800, '0191928288'),
(6, 'sha123', 'Moscutto@frogreat.com', 'Urban Oasis: Stylish & Spacious Apartment in the Heart of the City', 'Stylish and modern apartment featuring panoramic city views, upscale amenities, and a prime location for urban living', 'francesca-tosolini-tHkJAMcO3QE-unsplash.jpg', 'sigmund-CwTfKH5edSk-unsplash.jpg', 'luke-van-zyl-koH7IVuwRLw-unsplash.jpg', 10000, '0191928288'),
(7, 'sha123', 'Moscutto@frogreat.com', 'Urban Oasis: Luxury 2-Bedroom Apartment with Spectacular City Views', 'Stylish and modern apartment featuring panoramic city views, upscale amenities, and a prime location for urban living', 'paul-szewczyk-nI4aC1kaTRc-unsplash.jpg', 'luke-van-zyl-koH7IVuwRLw-unsplash.jpg', 'luke-van-zyl-koH7IVuwRLw-unsplash.jpg', 15000, '0191928288'),
(8, 'sha123', 'Moscutto@frogreat.com', 'Urban Oasis: Luxury 2-Bedroom Apartment with Spectacular City Views22', 'Stylish and modern apartment featuring panoramic city views, upscale amenities, and a prime location for urban living.', 'sigmund-CwTfKH5edSk-unsplash.jpg', 'isaac-benhesed-1SbJCq-vHpI-unsplash.jpg', 'point3d-commercial-imaging-ltd-6GruB-1L9kE-unsplash.jpg', 18300, '0191928288'),
(9, 'sefat123', 'u1904030@student.cuet.ac.bd', 'SpeedX Pro: The Ultimate High-Performance Carbon Fiber Road Bike', 'Efficient, lightweight, and built for speed - our cycle is the perfect companion for your exhilarating rides.', 'andrew-pons-cLHPacdtpSY-unsplash.jpg', 'conor-luddy-HKF3K2RT0KE-unsplash.jpg', 'conor-luddy-R2PpxA2j0pQ-unsplash.jpg', 230, '0191928288'),
(10, 'sefat123', 'u1904030@student.cuet.ac.bd', 'SpeedX Pro: The Ultimate High-Performance Carbon Fiber Road Bike', 'Efficient, lightweight, and built for speed - our cycle is the perfect companion for your exhilarating rides', 'conor-luddy-HKF3K2RT0KE-unsplash.jpg', 'andrew-pons-cLHPacdtpSY-unsplash.jpg', 'conor-luddy-R2PpxA2j0pQ-unsplash.jpg', 400, '12333333334'),
(11, 'sefat123', 'u1904030@student.cuet.ac.bd', 'CaptureMasters Pro: The Ultimate 4K DSLR Camera for Stunning Visuals.', 'Unleash your creativity with our high-resolution DSLR camera, designed to capture breathtaking moments with precision and clarity.', 'christof-w-ItaAIuTh5Uc-unsplash.jpg', 'clement-remond-BB2G2cfdXKE-unsplash.jpg', 'hanson-lu-gGgoDJRD2WM-unsplash.jpg', 800, '0191928288'),
(12, 'pro123', 'u1904027@student.cuet.ac.bd', 'Pet Sitting Services', 'Reliable and loving pet sitting services offered for all kinds of pets. Your furry friend will be in safe hands, receiving the best care during their stay with me. Contact me now to book their vacation', 'alan-king-KZv7w34tluA-unsplash.jpg', 'cute-stray-cat-walking-streets-rabat-morocco.jpg', 'cute-stray-cat-walking-streets-rabat-morocco.jpg', 1000, '01634892166');

-- --------------------------------------------------------

--
-- Table structure for table `rental_provider_registration`
--

CREATE TABLE `rental_provider_registration` (
  `provider_id` int(11) NOT NULL,
  `provider_name` varchar(255) NOT NULL,
  `provider_email` int(250) NOT NULL,
  `provider_image` varchar(255) NOT NULL,
  `password` int(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rental_provider_registration`
--

INSERT INTO `rental_provider_registration` (`provider_id`, `provider_name`, `provider_email`, `provider_image`, `password`) VALUES
(1, 'pro123', 0, 'Admin_pronob.jpeg', 123),
(2, 'sha123', 0, 'sakib.jpeg', 123),
(3, 'sefat123', 0, 'sefat.jpeg', 123);

-- --------------------------------------------------------

--
-- Table structure for table `user_orders`
--

CREATE TABLE `user_orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount_due` int(250) NOT NULL,
  `invoice_number` int(250) NOT NULL,
  `total_product` int(250) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `order_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_orders`
--

INSERT INTO `user_orders` (`order_id`, `user_id`, `amount_due`, `invoice_number`, `total_product`, `order_date`, `order_status`) VALUES
(1, 1, 8200, 1790292585, 2, '2023-08-01 17:11:53', 'Complete'),
(2, 1, 7200, 1136158574, 1, '2023-08-01 18:20:50', 'Complete'),
(3, 1, 800, 912939776, 1, '2023-08-01 22:38:29', 'Complete'),
(4, 1, 8800, 1775745452, 2, '2023-08-01 22:39:01', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `user_payments`
--

CREATE TABLE `user_payments` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `invoice_number` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `payment_mode` varchar(250) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_payments`
--

INSERT INTO `user_payments` (`payment_id`, `order_id`, `invoice_number`, `amount`, `payment_mode`, `transaction_id`, `date`) VALUES
(1, 1, 1790292585, 8200, 'Bkash', '7987849379287', '2023-08-01 17:11:53'),
(2, 2, 1136158574, 7200, 'Bkash', '7987849379287', '2023-08-01 18:20:50'),
(3, 3, 912939776, 800, 'Bkash', '54444444348', '2023-08-01 22:38:29');

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

CREATE TABLE `user_table` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_password` varchar(250) NOT NULL,
  `user_image` varchar(250) NOT NULL,
  `user_ip_address` varchar(100) NOT NULL,
  `user_address` varchar(250) NOT NULL,
  `user_mobile` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_table`
--

INSERT INTO `user_table` (`user_id`, `username`, `user_email`, `user_password`, `user_image`, `user_ip_address`, `user_address`, `user_mobile`) VALUES
(1, '1904027_pronob', 'u1904027@student.cuet.ac.bd', '123', 'Admin_pronob.jpeg', '::1', 'Cumilla', '01634892166');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `cart_details`
--
ALTER TABLE `cart_details`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `catagory`
--
ALTER TABLE `catagory`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`loc_id`);

--
-- Indexes for table `orders_pending`
--
ALTER TABLE `orders_pending`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`prod_id`);

--
-- Indexes for table `rental_provider`
--
ALTER TABLE `rental_provider`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `rental_provider_registration`
--
ALTER TABLE `rental_provider_registration`
  ADD PRIMARY KEY (`provider_id`);

--
-- Indexes for table `user_orders`
--
ALTER TABLE `user_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `user_payments`
--
ALTER TABLE `user_payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `catagory`
--
ALTER TABLE `catagory`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `loc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `orders_pending`
--
ALTER TABLE `orders_pending`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `rental_provider`
--
ALTER TABLE `rental_provider`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `rental_provider_registration`
--
ALTER TABLE `rental_provider_registration`
  MODIFY `provider_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_orders`
--
ALTER TABLE `user_orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_payments`
--
ALTER TABLE `user_payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_table`
--
ALTER TABLE `user_table`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
