-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2023 at 11:23 PM
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
-- Database: `w1867165_0`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderNo` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `orderDateTime` datetime NOT NULL,
  `orderTotal` decimal(8,2) NOT NULL DEFAULT 0.00,
  `orderStatus` varchar(50) DEFAULT NULL,
  `shippingDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderNo`, `userId`, `orderDateTime`, `orderTotal`, `orderStatus`, `shippingDate`) VALUES
(1, 0, '2023-05-03 04:16:30', '0.00', 'Placed', NULL),
(2, 0, '2023-05-03 04:29:31', '0.00', 'Placed', NULL),
(3, 0, '2023-05-03 04:32:48', '9348.33', 'Placed', NULL),
(4, 0, '2023-05-03 04:40:42', '0.00', 'Placed', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_line`
--

CREATE TABLE `order_line` (
  `oderLineId` int(11) NOT NULL,
  `orderNo` int(11) NOT NULL,
  `prodId` int(11) NOT NULL,
  `quantityOrdered` int(11) NOT NULL,
  `subTotal` decimal(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_line`
--

INSERT INTO `order_line` (`oderLineId`, `orderNo`, `prodId`, `quantityOrdered`, `subTotal`) VALUES
(1, 3, 1, 2, '1399.98'),
(2, 3, 2, 2, '4948.40'),
(3, 3, 6, 5, '2999.95');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `prodid` int(4) NOT NULL,
  `prodName` varchar(30) NOT NULL,
  `prodPicNameSmall` varchar(100) NOT NULL,
  `prodPicNameLarge` varchar(100) NOT NULL,
  `prodDescripShort` varchar(1000) DEFAULT NULL,
  `prodDescripLong` varchar(3000) DEFAULT NULL,
  `prodPrice` decimal(6,2) NOT NULL,
  `prodQuantity` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`prodid`, `prodName`, `prodPicNameSmall`, `prodPicNameLarge`, `prodDescripShort`, `prodDescripLong`, `prodPrice`, `prodQuantity`) VALUES
(1, 'Acer Chromebook Spin 514', 'acercb514Small.jpg', 'acercb514Large.jpg', 'Acer’s Chromebook Spin 514 is a speedy Chromebook with durable, premium design, but its pricing will limit its appeal to ChromeOS purists.', 'The Acer Chromebook Spin 514 is powered by AMD’s Ryzen 5 5625C, a six-core, 12-thread processor that includes AMD Radeon Graphics with seven graphics cores. It’s beefy hardware for a Chromebook, and the configuration tested represents a premium model. Acer sells several less powerful versions of the Spin 514 with Ryzen 3 processors.', '699.99', 4),
(2, 'HP Dragonfly Folio G3', 'hpdrgnflyFG3Small.jpg', 'hpdrgnflyFG3Large.jpg', 'The HP Dragonfly Folio G3 laptop is a fantastic option for the on-the-go business professional', 'In the world of business PCs, few want to stand out or make waves. That’s why HP’s Dragonfly line has constantly impressed with its blend of innovative, high-quality machines that are mature. The Dragonfly Folio 2-in-1 is now a tried and true concept, which acts like a normal laptop most of the time until you pull the screen forward, either to past the keyboard or all the way flat. No detaching pieces to break or lose.\r\n\r\nThe latest in the Folio family is the HP Dragonfly Folio G3, based on Intel chips and an improved design.', '2474.20', 2),
(3, 'Acer Swift Edge', 'AcerSESmall.jpg', 'AcerSELarge.jpg', 'The Acer Swift Edge delivers a spacious 16-inch OLED display inside an enclosure that’s hardly more than 2.5 pounds and a half an inch thick.', 'Screen size and travel weight are likely at or near the top of every laptop buyer’s list of priorities, where you want the most of the former and the least of the latter. The Acer Swift Edge lets you have your display and travel weight, too, supplying a roomy and modern 16-inch 16:10 wrapped in a thin, magnesium alloy chassis that’s a mere half and inch thick and roughly two and a half pounds. We’ve not seen a laptop with a larger screen that weighs less. Although I’d happily accept an extra ounce or two of carrying weight for a more rigid lid for the display.\r\n\r\nThe 16-inch display—an OLED panel with a crisp, 4K resolution—is outstanding and worth protecting. The image quality is stellar, offering brilliant color and outstanding contrast with inky blacks and bright whites. An octa-core AMD Ryzen 7 6800U CPU and integrated Radeon graphics power the action, a duo that offers some multimedia editing ability but better suited for general home entertainment and office pursuits. If you want the biggest OLED display in the thinnest, lightest design, the Acer Swift Edge is it.', '1499.99', 6),
(4, 'Dell G16 ', 'DellG16Small.jpg', 'DellG16Large.jpg', 'The Dell G16 laptop may not offer much in terms of looks, but it\'s one heck of a performer, especially when it comes to gaming.', 'The Dell G16 is a midrange gaming PC that prioritizes function over form. It’ll serve you well if you are looking for the biggest pixel-pushing bang for your gaming buck and are willing to put up with an uninspired design to get it. Beneath the grab, gray exterior is a powerful CPU-GPU duo —  the Core i7-12700H processor and RTX 3060 graphics — that puts this laptop at the head of the midrange gaming pack. \r\n\r\nThe 16-inch display offers a QHD resolution that’s one notch above the FHD panel usually on offer at this price and gives the Dell G16 added versatility. You likely won’t run games above 1080p with the RTX 3060, but the higher resolution provides more room to multitasking on the 16:10 display and a finer picture for detailed graphics work. On the whole, the Dell G16 looks like a budget gaming laptop that delivers strong midrange gaming performance for a price that is somewhere between budget and midrange. And when it’s on sale, its price nearly dips into budget territory where it offers great value.', '1499.99', 4),
(5, 'Asus Zenbook Pro 14 Duo OLED', 'AsusZP14DSmall.jpg', 'AsusZP14DLarge.jpg', 'The Asus Zenbook Pro 14 Duo OLED is a 14-inch laptop for content creators that delivers sublime visuals and seamless cross-screen workflow.', 'Asus’ dual screen Zenbook Duo laptops are like pandora’s boxes for content creators, offering a whole new productivity experience for those brave enough to give their unique two-display configurations a try. We’ve seen some good ones since they debuted at CES back in 2019, but none that quite offer the balance of power and ergonomics available in this newly minted 14-inch Zenbook Duo model.\r\n\r\nIt wins the day because of its powerful new 12th-generation processor, a more visible ScreenPad Plus, and a taller, brighter 120Hz OLED primary display that offers superlative visuals from every angle. To cap it off, a spate of thoughtful software upgrades optimizes the ScreenPad Plus operation, making workflow more seamless than before.', '2000.00', 2),
(6, 'Asus Expert Book B3 Detachable', 'AsusExpbB3Small.jpg', 'AsusExpbbB3Large.jpg', 'The Asus ExpertBook B3 laptop has a nice display and impressive battery life, but performance is where it really struggles.', 'he new Asus Expertbook B3 seemed so intriguing. Not only is this a small computer with a kickstand and a keyboard cover, it’s a tiny device with a pen that neatly tucks away into a silo. It’s even based on a newer Qualcomm Snapdragon 7c Gen 2 processor, which promises power-sipping, fanless operation. Can this little tablet overcome its modest spec sheet and give users a decent Windows 11 experience? In a word, no.', '599.99', 6);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userId` int(11) NOT NULL,
  `userType` varchar(1) NOT NULL,
  `userFName` varchar(100) NOT NULL,
  `userSName` varchar(100) NOT NULL,
  `userAddress` varchar(200) NOT NULL,
  `userPostCode` varchar(20) NOT NULL,
  `userTelNo` varchar(20) NOT NULL,
  `userEmail` varchar(100) NOT NULL,
  `userPassword` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userId`, `userType`, `userFName`, `userSName`, `userAddress`, `userPostCode`, `userTelNo`, `userEmail`, `userPassword`) VALUES
(0, 'C', 'Thimasha', 'Thakshali', '20,colombo 05', '0005', '123444444', 'ugthimashath@gmail.com', '144'),
(1, 'A', 'Dineth', 'Sharanga', 'No.23,Gampaha.', '0025', '02228888', 'dineth@gmail.com', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderNo`),
  ADD KEY `o_uid_fk` (`userId`);

--
-- Indexes for table `order_line`
--
ALTER TABLE `order_line`
  ADD PRIMARY KEY (`oderLineId`),
  ADD KEY `ol_ordno_fk` (`orderNo`),
  ADD KEY `ol_prid_fk` (`prodId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`prodid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `userEmail` (`userEmail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_line`
--
ALTER TABLE `order_line`
  MODIFY `oderLineId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `prodid` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `o_uid_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE CASCADE;

--
-- Constraints for table `order_line`
--
ALTER TABLE `order_line`
  ADD CONSTRAINT `ol_ordno_fk` FOREIGN KEY (`orderNo`) REFERENCES `orders` (`orderNo`) ON DELETE CASCADE,
  ADD CONSTRAINT `ol_prid_fk` FOREIGN KEY (`prodId`) REFERENCES `product` (`prodid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
