-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2025 at 01:31 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `userdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `recommendation`
--

CREATE TABLE `recommendation` (
  `id` int(100) NOT NULL,
  `head` varchar(255) DEFAULT NULL,
  `info` longtext DEFAULT NULL,
  `image1` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `image3` varchar(255) DEFAULT NULL,
  `image4` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recommendation`
--

INSERT INTO `recommendation` (`id`, `head`, `info`, `image1`, `image2`, `image3`, `image4`) VALUES
(1, 'Punjab: The Heart of Vibrance and Heritage', 'Punjab, known as the \"Land of Five Rivers,\" is a state that blends rich history, vibrant culture, and scenic beauty. From its historical monuments to its colorful festivals and delicious food, Punjab offers something for every traveler. Whether you’re exploring its sacred shrines, enjoying its lush landscapes, or immersing yourself in the warmth of its people, Punjab will leave you with memories that last a lifetime.', 'https://next57.com/wp-content/uploads/2024/06/b8f7e3efd3386de8d1cfb6c73af2f1e2.jpg', 'https://media.assettype.com/theleaflet/import/wp-content/uploads/2021/09/120337061_gettyimages-1234943959-594x594-1.jpeg?w=1200&h=675&auto=format%2Ccompress&fit=max&enlarge=true', 'https://akm-img-a-in.tosshub.com/indiatoday/images/story/202504/the-retreat-ceremony-at-the-attari-wagah-border-started-in-1959-and-has-been-witnessed-by-millions-o-251317193-1x1.jpg?VersionId=hjXAzWeMZDgsi3XkuMNw5jg0taxawRo4', 'https://cdn.bega.com/cdn-cgi/image/fit=cover,gravity=0.29x0.43,f=auto/https://images.ctfassets.net/w2xcep4i3dcd/6ttXacv5DjbmyoByQIXDH0/2d29db665ac4396dd9ca5fd19af59e28/BE84520_M3_IS_1_18_anw.jpg'),
(2, 'Bangalore: The Silicon Valley of India', 'Discover the vibrant pulse of Bangalore — a city where cutting-edge innovation meets rich cultural heritage. From lush green parks and historic landmarks to a booming tech scene and buzzing nightlife, Bangalore offers something for everyone. Whether you\'re exploring the tranquil Cubbon Park, indulging in street food at VV Puram, or networking in the heart of India’s IT industry, Bangalore is a dynamic blend of tradition and modernity that never fails to inspire.', 'https://pohcdn.com/sites/default/files/styles/paragraph__hero_banner__hb_image__1880bp/public/hero_banner/Sultan_Tipu_Palace.jpg', 'https://bengaluruprayana.com/wp-content/uploads/2024/06/Exploring-Jawaharlal-Nehru-Planetarium.jpeg', 'https://sceneloc8.com/wp-content/uploads/2024/03/Lalbagh-Botanical-Garden-4.png', 'https://www.swantour.com/blogs/wp-content/uploads/2018/02/Tourist-Places-in-Bangalore.jpg'),
(3, 'Pune: A Perfect Blend of Tradition and Modernity', 'Pune, often referred to as the \"Oxford of the East,\" is known for its historical significance, educational institutions, and vibrant culture. Nestled at the foothills of the Sahyadri mountains, Pune offers a mix of old-world charm and modern amenities. The city has become a hub for technology and innovation while maintaining its traditional Marathi culture and festivals. Pune is an ideal destination for history enthusiasts, food lovers, and nature lovers alike.', 'https://www.savaari.com/blog/wp-content/uploads/2022/11/Shaniwaarwada_Pune_11zon.jpg', 'https://cdn1.tripoto.com/media/filter/nl/img/2380291/Image/1698081383_lal_mahal_3.jpg.webp', 'https://assets.zeezest.com/blogs/PROD_Id-1821-Pune-ganpati-dagdusheth-banner_1616946964882.jpg', 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/07/c1/e6/b3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tourist_places`
--

CREATE TABLE `tourist_places` (
  `id` int(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `tourist_place1` varchar(100) NOT NULL,
  `tourist_place2` varchar(100) NOT NULL,
  `tourist_place3` varchar(100) NOT NULL,
  `tourist_place4` varchar(100) NOT NULL,
  `tourist_place5` varchar(100) NOT NULL,
  `tourist_place6` varchar(100) NOT NULL,
  `tourist_place7` varchar(100) NOT NULL,
  `tourist_place8` varchar(100) NOT NULL,
  `tourist_place9` varchar(100) NOT NULL,
  `tourist_place10` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tourist_places`
--

INSERT INTO `tourist_places` (`id`, `place`, `tourist_place1`, `tourist_place2`, `tourist_place3`, `tourist_place4`, `tourist_place5`, `tourist_place6`, `tourist_place7`, `tourist_place8`, `tourist_place9`, `tourist_place10`) VALUES
(1, 'Pune', 'Shaniwar Wada', 'Aga Khan Palace', 'Sinhagad Fort', 'Pataleshwar Cave Temple', 'Raja Dinkar Kelkar Museum', 'Parvati Hill and Temple', 'Osho International Meditation Resort', 'Lal Mahal', 'Khadakwasla Dam', 'Shrimant Dagdusheth'),
(2, 'Pondicherry', 'Auroville', 'Promenade Beach', 'Sri Aurobindo Ashram', 'Paradise Beach', 'French Quarter (White Town)', 'Basilica of the Sacred Heart of Jesus', 'Rock Beach', 'Serenity Beach', 'Botanical Garden', 'Chunnambar Boat House'),
(3, 'Jaipur', 'Amber Fort', 'Hawa Mahal', 'City Palace', 'Jantar Mantar', 'Nahargarh Fort', 'Jal Mahal', 'Birla Mandir', 'Albert Hall Museum', 'Jaigarh Fort', 'Johari Bazaar'),
(4, 'Udaipur', 'City Palace', 'Lake Pichola', 'Jag Mandir', 'Jagdish Temple', 'Fateh Sagar Lake', 'Sajjangarh Palace (Monsoon Palace)', 'Saheliyon ki Bari', 'Bagore ki Haveli', 'Shilpgram', 'Eklingji Temple'),
(5, 'Goa', 'Baga Beach', 'Calangute Beach', 'Basilica of Bom Jesus', 'Fort Aguada', 'Chapora Fort', 'Anjuna Beach', 'Dudhsagar Waterfalls', 'Palolem Beach', 'Se Cathedral', 'Vagator Beach'),
(6, 'Shimla', 'The Ridge', 'Mall Road', 'Jakhoo Temple', 'Christ Church', 'Kufri', 'Summer Hill', 'Annandale', 'Tara Devi Temple', 'Chadwick Falls', 'Indian Institute of Advanced Study'),
(7, 'Leh', 'Pangong Lake', 'Nubra Valley', 'Magnetic Hill', 'Shanti Stupa', 'Leh Palace', 'Khardung La Pass', 'Tso Moriri Lake', 'Spituk Monastery', 'Hemis Monastery', 'Zanskar Valley'),
(8, 'Agra', 'Taj Mahal', 'Agra Fort', 'Mehtab Bagh', 'Fatehpur Sikri', 'Akbar’s Tomb (Sikandra)', 'Jama Masjid', 'Itmad-ud-Daulah’s Tomb (Baby Taj)', 'Mariam’s Tomb', 'Chini Ka Rauza', 'Moti Masjid');

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

CREATE TABLE `trips` (
  `Trip_ID` int(11) NOT NULL,
  `Trip_From` varchar(255) DEFAULT NULL,
  `Trip_To` varchar(255) DEFAULT NULL,
  `Trip_Type` varchar(255) DEFAULT NULL,
  `Trip_StartDate` date DEFAULT NULL,
  `Trip_EndDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trips`
--

INSERT INTO `trips` (`Trip_ID`, `Trip_From`, `Trip_To`, `Trip_Type`, `Trip_StartDate`, `Trip_EndDate`) VALUES
(1, 'Mumbai', 'Goa', 'Leisure', '2025-04-10', '2025-04-15'),
(2, 'Bengaluru', 'Pondicherry', 'Adventure', '2025-05-01', '2025-05-06'),
(3, 'Delhi', 'Manali', 'Honeymoon', '2025-06-12', '2025-06-20'),
(4, 'Hyderabad', 'Jaipur', 'Business', '2025-07-05', '2025-07-09'),
(5, 'Chennai', 'Kovalam', 'Family', '2025-08-14', '2025-08-20'),
(6, 'Mumbai', 'Udaipur', 'Leisure', '2025-09-10', '2025-09-15'),
(7, 'Bengaluru', 'Agra', 'Business', '2025-10-05', '2025-10-08'),
(8, 'Delhi', 'Leh', 'Adventure', '2025-11-01', '2025-11-10'),
(9, 'Hyderabad', 'Shimla', 'Honeymoon', '2025-12-15', '2025-12-25'),
(10, 'Chennai', 'Darjeeling', 'Family', '2025-12-28', '2026-01-05'),
(11, 'Kolkata', 'Kochi', 'Leisure', '2025-04-20', '2025-04-25'),
(12, 'Pune', 'Mysuru', 'Business', '2025-05-10', '2025-05-13'),
(13, 'Ahmedabad', 'Goa', 'Adventure', '2025-06-18', '2025-06-24'),
(14, 'Delhi', 'Udaipur', 'Honeymoon', '2025-07-12', '2025-07-18'),
(15, 'Bengaluru', 'Manali', 'Family', '2025-08-05', '2025-08-12'),
(16, 'Mumbai', 'Jaipur', 'Leisure', '2025-09-25', '2025-09-30'),
(17, 'Kolkata', 'Shimla', 'Adventure', '2025-10-18', '2025-10-25'),
(18, 'Hyderabad', 'Agra', 'Business', '2025-11-20', '2025-11-24'),
(19, 'Chennai', 'Leh', 'Honeymoon', '2025-12-05', '2025-12-14'),
(20, 'Pune', 'Darjeeling', 'Family', '2026-01-10', '2026-01-17'),
(21, 'Maharashtra', 'Karnataka', 'Leisure', '2025-04-10', '2025-04-17'),
(22, 'Gujarat', 'Tamil Nadu', 'Business', '2025-05-01', '2025-05-05'),
(23, 'Kerala', 'Goa', 'Family', '2025-06-10', '2025-06-20'),
(24, 'Punjab', 'Maharashtra', 'Adventure', '2025-07-01', '2025-07-08'),
(25, 'Rajasthan', 'Kerala', 'Honeymoon', '2025-08-15', '2025-08-25'),
(26, 'Haryana', 'Goa', 'Leisure', '2025-09-01', '2025-09-10'),
(27, 'Tamil Nadu', 'Karnataka', 'Business', '2025-10-05', '2025-10-10'),
(28, 'West Bengal', 'Odisha', 'Family', '2025-11-01', '2025-11-08'),
(29, 'Andhra Pradesh', 'Assam', 'Adventure', '2025-12-05', '2025-12-15'),
(30, 'Goa', 'Madhya Pradesh', 'Honeymoon', '2025-12-20', '2025-12-28'),
(31, 'Uttar Pradesh', 'Himachal Pradesh', 'Business', '2025-04-12', '2025-04-19'),
(32, 'Chhattisgarh', 'Telangana', 'Leisure', '2025-05-14', '2025-05-21'),
(33, 'Jharkhand', 'Bihar', 'Family', '2025-06-18', '2025-06-27'),
(34, 'Goa', 'Punjab', 'Adventure', '2025-07-22', '2025-07-30'),
(35, 'Maharashtra', 'Rajasthan', 'Honeymoon', '2025-08-10', '2025-08-18'),
(36, 'Telangana', 'Tamil Nadu', 'Business', '2025-09-15', '2025-09-20'),
(37, 'Karnataka', 'Odisha', 'Leisure', '2025-10-02', '2025-10-09'),
(38, 'Assam', 'Madhya Pradesh', 'Family', '2025-11-11', '2025-11-18'),
(39, 'West Bengal', 'Gujarat', 'Adventure', '2025-12-01', '2025-12-07'),
(40, 'Himachal Pradesh', 'Kerala', 'Honeymoon', '2025-12-15', '2025-12-25'),
(41, 'Madhya Pradesh', 'Haryana', 'Business', '2025-04-20', '2025-04-27'),
(42, 'Bihar', 'Andhra Pradesh', 'Leisure', '2025-05-25', '2025-06-01'),
(43, 'Odisha', 'Jharkhand', 'Family', '2025-06-30', '2025-07-07'),
(44, 'Rajasthan', 'Goa', 'Adventure', '2025-07-12', '2025-07-19'),
(45, 'Karnataka', 'Maharashtra', 'Honeymoon', '2025-08-22', '2025-08-30'),
(46, 'Mumbai', 'Udaipur', 'Honeymoon', '2025-09-10', '2025-09-13'),
(47, 'Mumbai', 'Pune', 'Adventure', '2025-07-10', '2025-07-13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `email`, `password`, `role`) VALUES
(1, 'Ajil Renji George', 'ajilrenjigeorge@gmail.com', 'ajilrenji', 'user'),
(3, 'Ajil Renji George', 'ajilrenjigeorge123@gmail.com', '12345678', 'user'),
(4, 'Administrator', 'admin@gmail.com', 'admin1234', 'user'),
(7, 'example', 'example@gmail.com', 'example', 'user'),
(10, 'Administrator', 'admin1@gmail.com', 'admin@1234', 'admin'),
(11, 'Administrator 3', 'admin3@gmail.com', 'administrator', 'admin'),
(12, 'Shreya Dhoke', 'shreya@gmail.com', 'shreya1234', 'admin'),
(13, 'Ryan DSouza', 'ryan@gmail.com', 'ryan@123', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `recommendation`
--
ALTER TABLE `recommendation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tourist_places`
--
ALTER TABLE `tourist_places`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`Trip_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `recommendation`
--
ALTER TABLE `recommendation`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tourist_places`
--
ALTER TABLE `tourist_places`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
