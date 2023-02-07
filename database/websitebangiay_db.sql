-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th2 07, 2023 lúc 09:53 AM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `websitebangiay_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_list`
--

CREATE TABLE `cart_list` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `vendor_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `category_list`
--

INSERT INTO `category_list` (`id`, `vendor_id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 1, 'ADIDAS', 'Adidas AG là một tập đoàn đa quốc gia của Đức, được thành lập và có trụ sở tại Herzogenaurach, Bavaria, chuyên thiết kế và sản xuất giày dép, quần áo và phụ kiện. Đây là nhà sản xuất đồ thể thao lớn nhất ở châu Âu và lớn thứ hai trên thế giới, sau Nike.', 1, 0, '2022-12-10 20:10:36', NULL),
(2, 1, 'NIKE', 'Nike (tên đầy đủ là Nike, Inc) là một trong những nhà cung cấp lớn nhất thế giới về quần, áo thể thao và dụng cụ thể thao. Công ty được thành lập bởi Bill Bowerman và Phil Knight vào năm 1964, đặt trụ sở chính tại Oregon, Mỹ.', 1, 0, '2022-12-10 20:12:42', NULL),
(3, 1, 'JORDAN', 'Jordan Là 1 sản phẩm của ông lớn thể thao sneaker Nike, mọi người có còn biết đến cái tên quen thuộc như “Jordan Brand”,, Đây là đôi giày chỉ sản xuất riêng cho cầu thủ bóng rổ Michael Jordan bách chiến bách thắng này.', 1, 0, '2022-12-10 20:13:51', NULL),
(4, 1, 'PUMA', 'Puma SE (thương hiệu chính thức là PUMA) là một công ty đa quốc gia lớn của Đức chuyên sản xuất giày và các dụng cụ thể thao khác có trụ sở tại Herzogenaurach, Bavaria, Đức. Công ty được thành lập năm 1924 bởi Adolf và Rudolf Dassler với tên gọi ban đầu Gebrüder Dassler Schuhfabrik.', 1, 0, '2022-12-10 20:14:24', NULL),
(5, 1, 'GIÀY CAO GÓT', 'Giày cao gót là một loại giày trong đó gót chân, so với ngón chân, cao hơn đáng kể so với mặt đất. Chúng làm cho người mặc có vẻ cao hơn, làm nổi bật cơ bắp chân và chiều dài của tổng thể chân. Có nhiều loại giày cao gót, có nhiều kiểu dáng, màu sắc và chất liệu khác nhau, và có thể được tìm thấy trên khắp thế giới.', 1, 0, '2022-12-10 20:14:49', NULL),
(6, 1, 'Supreme 1', 'Logo của Supreme là có hình hộp màu đỏ đặc trưng mang tính biểu tượng với chữ \"Supreme\" màu trắng khá đơn giản. Đến nay, thương hiệu này có giá trị hơn 1 tỷ USD, sau khi công ty cổ phần tư nhân The Carlyle Group mua lại 50% cổ phần với giá 500 triệu đô la trong năm 2017', 1, 1, '2022-12-11 21:44:49', '2022-12-11 21:53:42');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `client_fb_list`
--

CREATE TABLE `client_fb_list` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created_time` int(11) DEFAULT NULL,
  `last_updated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `client_fb_list`
--

INSERT INTO `client_fb_list` (`id`, `username`, `email`, `password`, `fullname`, `birthday`, `status`, `created_time`, `last_updated`) VALUES
(1, NULL, '1409.khang@gmail.com', NULL, 'Phạm Hồng Khang', NULL, 1, 1670853524, 1670853524);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `client_list`
--

CREATE TABLE `client_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `gender` text NOT NULL,
  `contact` text NOT NULL,
  `address` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `client_list`
--

INSERT INTO `client_list` (`id`, `code`, `firstname`, `middlename`, `lastname`, `gender`, `contact`, `address`, `email`, `password`, `avatar`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, '202212-00001', 'Phạm', 'Hồng', 'Khang', 'Nam', '123456789', '12 Nguyễn Văn Bảo', 'khang@gmail.com', 'c662366a17474c4885b6a77c43eaee9b', 'uploads/clients/1.png?v=1670674689', 1, 0, '2022-12-10 19:18:09', '2022-12-12 21:41:35'),
(2, '202212-00002', 'Ngô', 'Thị', 'Thúy Hằng', 'Nữ', '123456789', '12 Nguyễn Văn Bảo', 'hang@gmail.com', 'c662366a17474c4885b6a77c43eaee9b', 'uploads/clients/2.png?v=1670895748', 1, 0, '2022-12-13 08:42:28', '2022-12-13 08:42:28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `momo`
--

CREATE TABLE `momo` (
  `id_momo` int(11) NOT NULL,
  `partner_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_info` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trans_id` int(11) NOT NULL,
  `pay_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_cart` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `momo`
--

INSERT INTO `momo` (`id_momo`, `partner_code`, `order_id`, `amount`, `order_info`, `order_type`, `trans_id`, `pay_type`, `code_cart`) VALUES
(1, 'MOMOBKUN20180529', 1670862975, '4900000', 'Thanh toán qua MoMo ATM', 'momo_wallet', 2147483647, 'napas', '5210'),
(2, 'MOMOBKUN20180529', 1670862975, '4900000', 'Thanh toán qua MoMo ATM', 'momo_wallet', 2147483647, 'napas', '3803'),
(3, 'MOMOBKUN20180529', 1670900319, '2100000', 'Thanh toán qua MoMo ATM', 'momo_wallet', 2147483647, 'napas', '5447');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `code_cart` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `order_items`
--

INSERT INTO `order_items` (`order_id`, `product_id`, `quantity`, `price`, `date_created`) VALUES
(1, 1, 1, 3600000, '2022-12-11 17:31:21'),
(2, 18, 2, 2100000, '2022-12-12 20:54:20'),
(2, 5, 4, 3519000, '2022-12-12 20:54:20'),
(3, 5, 2, 3519000, '2022-12-12 23:38:57'),
(3, 15, 2, 1955000, '2022-12-12 23:38:57'),
(4, 18, 1, 2100000, '2022-12-13 07:09:36'),
(5, 18, 6, 2100000, '2022-12-13 08:52:18'),
(5, 5, 3, 3519000, '2022-12-13 08:52:18'),
(6, 12, 1, 3220000, '2022-12-13 08:52:43'),
(7, 20, 1, 2450000, '2022-12-13 09:47:42'),
(8, 1, 1, 3600000, '2022-12-13 09:58:24'),
(9, 18, 1, 2100000, '2022-12-13 10:01:07');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `client_id` int(30) NOT NULL,
  `vendor_id` int(30) NOT NULL,
  `total_amount` double NOT NULL DEFAULT 0,
  `delivery_address` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `cart_payment` varchar(255) NOT NULL,
  `code_cart` int(11) NOT NULL,
  `cart_shipping` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `order_list`
--

INSERT INTO `order_list` (`id`, `code`, `client_id`, `vendor_id`, `total_amount`, `delivery_address`, `status`, `date_created`, `date_updated`, `cart_payment`, `code_cart`, `cart_shipping`) VALUES
(1, '202212-00001', 1, 1, 3600000, '12 Nguyễn Văn Bảo', 4, '2022-12-11 17:31:21', '2022-12-12 20:13:36', '', 0, 0),
(2, '202212-00002', 1, 1, 18276000, '12 Nguyễn Văn Bảo', 5, '2022-12-12 20:54:20', '2022-12-12 20:56:08', '', 0, 0),
(3, '202212-00003', 1, 1, 10948000, '12 Nguyễn Văn Bảo', 5, '2022-12-12 23:38:57', '2022-12-12 23:39:09', '', 0, 0),
(4, '202212-00004', 1, 1, 2100000, '12 Nguyễn Văn Bảo', 5, '2022-12-13 07:09:36', '2022-12-13 08:39:51', '', 0, 0),
(5, '202212-00005', 1, 1, 23157000, '12 Nguyễn Văn Bảo', 0, '2022-12-13 08:52:18', '2022-12-13 08:52:18', '', 0, 0),
(6, '202212-00006', 1, 1, 3220000, '12 Nguyễn Văn Bảo', 5, '2022-12-13 08:52:43', '2022-12-13 08:53:28', '', 0, 0),
(7, '202212-00007', 2, 1, 2450000, '12 Nguyễn Văn Bảo', 0, '2022-12-13 09:47:42', '2022-12-13 09:47:42', '', 0, 0),
(8, '202212-00008', 1, 1, 3600000, '12 Nguyễn Văn Bảo', 0, '2022-12-13 09:58:24', '2022-12-13 09:58:24', '', 0, 0),
(9, '202212-00009', 1, 1, 2100000, '12 Nguyễn Văn Bảo', 5, '2022-12-13 10:01:07', '2022-12-13 10:04:12', '', 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_list`
--

CREATE TABLE `product_list` (
  `id` int(30) NOT NULL,
  `vendor_id` int(30) DEFAULT NULL,
  `category_id` int(30) DEFAULT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `product_list`
--

INSERT INTO `product_list` (`id`, `vendor_id`, `category_id`, `name`, `description`, `price`, `image_path`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 1, 1, 'ADIDAS NMD R1', '&lt;p&gt;&lt;span style=&quot;color: rgb(54, 54, 54); font-family: Poppins, sans-serif; font-size: 15px;&quot;&gt;Phong c&aacute;ch gi&agrave;y chạy bộ d&agrave;nh cho h&agrave;nh tr&igrave;nh kh&aacute;m ph&aacute; mỗi ng&agrave;y. Phi&ecirc;n bản cải tiến n&agrave;y của đ&ocirc;i gi&agrave;y adidas NMD R1 l&agrave; bước tiến đột ph&aacute; dựa tr&ecirc;n đ&ocirc;i gi&agrave;y nguy&ecirc;n bản phong c&aacute;ch thập ni&ecirc;n 80, với c&aacute;c miếng bịt đế giữa c&oacute; t&ocirc; viền v&agrave; đầu bọc d&acirc;y gi&agrave;y sặc sỡ mang đến n&eacute;t mới mẻ cho thiết kế. Th&acirc;n gi&agrave;y bằng vải dệt kim co gi&atilde;n &ocirc;m ch&acirc;n cho cảm gi&aacute;c thoải m&aacute;i khi di chuyển. Qu&atilde;ng đường d&agrave;i di chuyển mỗi ng&agrave;y hay lề đường trơn trượt đều l&agrave; chuyện nhỏ, nhờ c&oacute; đệm BOOST v&agrave; đế ngo&agrave;i bằng cao su si&ecirc;u b&aacute;m. Th&acirc;n gi&agrave;y l&agrave;m từ loại sợi hiệu năng cao c&oacute; chứa tối thiểu 50% chất liệu Parley Ocean Plastic &mdash; r&aacute;c thải nhựa t&aacute;i chế thu gom từ c&aacute;c v&ugrave;ng đảo xa, b&atilde;i biển, khu d&acirc;n cư ven biển v&agrave; đường bờ biển, nhằm ngăn chặn &ocirc; nhiễm đại dương. 50% th&agrave;nh phần c&ograve;n lại của sợi dệt l&agrave; polyester t&aacute;i chế&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 3600000, 'uploads/products/1.png?v=1670678184', 1, 0, '2022-12-10 20:16:24', '2022-12-10 20:16:24'),
(2, 1, 1, 'ADISTAR CS', '&lt;p&gt;&lt;span style=&quot;color: rgb(54, 54, 54); font-family: Poppins, sans-serif; font-size: 15px;&quot;&gt;Lấy cảm hứng từ chuyển động vĩnh cửu, gi&agrave;y ADISTAR CS hỗ trợ c&aacute;c runner chinh phục kỷ lục c&aacute; nh&acirc;n cự ly d&agrave;i v&agrave; hơn thế nữa. Nhằm mang lại cảm gi&aacute;c thoải m&aacute;i v&agrave; n&acirc;ng đỡ, đ&ocirc;i gi&agrave;y n&agrave;y c&oacute; đường cong d&agrave;i &ocirc;m dọc mũi gi&agrave;y, tạo chuyển động nhịp nh&agrave;ng, mượt m&agrave; v&agrave; đều đặn gi&uacute;p bạn sải bước tiếp theo. Thiết kế ch&uacute; trọng khả năng bảo vệ g&oacute;t ch&acirc;n v&agrave; n&acirc;ng đỡ th&acirc;n gi&agrave;y.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 4200000, 'uploads/products/2.png?v=1670848992', 1, 0, '2022-12-12 19:43:12', '2022-12-12 19:43:12'),
(3, 1, 1, 'ADIDAS FORUM LOW CL', '&lt;p&gt;&lt;span style=&quot;color: rgb(54, 54, 54); font-family: Poppins, sans-serif; font-size: 15px;&quot;&gt;Khi dạo bước qua c&aacute;c gian h&agrave;ng trong khu chợ flea market tấp nập, bạn kh&ocirc;ng bao giờ biết được m&igrave;nh sẽ t&igrave;m thấy những m&oacute;n đồ th&uacute; vị n&agrave;o. V&agrave; d&ugrave; cho bạn đ&atilde; biết chắc rằng gi&agrave;y adidas Forum l&agrave; item mới toanh v&agrave; đậm chất b&oacute;ng rổ, nhưng phi&ecirc;n bản n&agrave;y cũng ngập tr&agrave;n ho&agrave;i niệm v&agrave; gợi nhớ những trải nghiệm săn đồ thrift. Đ&ocirc;i gi&agrave;y n&agrave;y c&oacute; c&aacute;c điểm nhấn m&agrave;u sắc vintage, chất liệu da mịn v&agrave; đế gi&agrave;y trắng ng&agrave;.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 2500000, 'uploads/products/3.png?v=1670849048', 1, 0, '2022-12-12 19:44:07', '2022-12-12 19:44:08'),
(4, 1, 1, 'ADIDAS HARDEN STEPBACK 3', '&lt;p&gt;&lt;span style=&quot;color: rgb(54, 54, 54); font-family: Poppins, sans-serif; font-size: 15px;&quot;&gt;Kh&ocirc;ng c&oacute; thứ vũ kh&iacute; n&agrave;o đ&aacute;ng sợ hơn c&uacute; step-back trong những trận đấu b&oacute;ng rổ hiện đại, v&agrave; kh&ocirc;ng một ai l&agrave;m được điều n&agrave;y tốt hơn James Harden. Đ&ocirc;i gi&agrave;y signature adidas n&agrave;y t&ocirc;n vinh lối chơi s&aacute;ng tạo của anh tr&ecirc;n s&acirc;n b&oacute;ng rổ. Đế giữa Bounce đ&agrave;n hồi mang đến cảm gi&aacute;c thoải m&aacute;i tr&ecirc;n từng sải bước, bất kể bạn đang r&egrave;n luyện kỹ năng xử l&yacute; b&oacute;ng hay n&eacute;m b&oacute;ng từ khoảng c&aacute;ch xa. Lỗ xỏ d&acirc;y gi&agrave;y bố tr&iacute; hợp l&yacute; kết hợp c&ugrave;ng d&acirc;y buộc v&agrave; g&oacute;t gi&agrave;y đ&uacute;c cho cảm gi&aacute;c cố định.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 2300000, 'uploads/products/4.png?v=1670849249', 1, 0, '2022-12-12 19:45:39', '2022-12-12 19:47:29'),
(5, 1, 2, 'NIKE Air 1 Mid', '&lt;p&gt;&lt;span style=&quot;color: rgb(54, 54, 54); font-family: Poppins, sans-serif; font-size: 15px;&quot;&gt;Thật dễ d&agrave;ng với m&agrave;u xanh l&aacute; c&acirc;y. Air Jordan 1 m&ugrave;a h&egrave; n&agrave;y được trang tr&iacute; với sắc th&aacute;i tươi m&aacute;t của xanh v&agrave; bạc h&agrave;, được thiết kế với h&igrave;nh d&aacute;ng cổ điển. Da cao cấp v&agrave; đệm Air nhẹ ho&agrave;n thiện g&oacute;i sản phẩm với cảm gi&aacute;c thoải m&aacute;i sẵn s&agrave;ng tr&ecirc;n đường phố k&eacute;o d&agrave;i cả ng&agrave;y.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 3519000, 'uploads/products/5.png?v=1670849190', 1, 0, '2022-12-12 19:46:30', '2022-12-12 19:46:30'),
(6, 1, 2, 'NIKE Air Zoom Pegasus', '&lt;p&gt;&lt;span style=&quot;color: rgb(54, 54, 54); font-family: Poppins, sans-serif; font-size: 15px;&quot;&gt;Chạy l&agrave; hoạt động h&agrave;ng ng&agrave;y của bạn, với mỗi bước sẽ đưa bạn đến gần hơn với mục ti&ecirc;u c&aacute; nh&acirc;n của m&igrave;nh. H&atilde;y để Nike Air Zoom Pegasus 39 gi&uacute;p bạn n&acirc;ng l&ecirc;n tầm cao mới &mdash; cho d&ugrave; bạn đang tập luyện hay chạy bộ &mdash; với thiết kế trực quan của n&oacute;. Trọng lượng nhẹ hơn Pegasus 38 v&agrave; l&yacute; tưởng để đeo v&agrave;o bất kỳ m&ugrave;a n&agrave;o, n&oacute; c&oacute; cảm gi&aacute;c hỗ trợ để gi&uacute;p giữ ch&acirc;n bạn, trong khi đệm dưới ch&acirc;n v&agrave; c&aacute;c bộ phận Zoom Air gấp đ&ocirc;i (nhiều hơn 1 chiếc so với Peg 38) cho bạn th&ecirc;m cảm gi&aacute;c thoải m&aacute;i bước của bạn. Ch&uacute; ngựa &ocirc; đ&aacute;ng tin cậy với đ&ocirc;i c&aacute;nh của bạn đ&atilde; trở lại. Đ&atilde; đến giờ cất c&aacute;nh.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 3519000, 'uploads/products/6.png?v=1670849224', 1, 0, '2022-12-12 19:47:03', '2022-12-12 19:47:04'),
(7, 1, 2, 'NIKE Air Zoom Pegasus 38 Ekiden', '&lt;p&gt;&lt;span style=&quot;color: rgb(54, 54, 54); font-family: Poppins, sans-serif; font-size: 15px;&quot;&gt;L&agrave; một con ngựa được chế tạo để gi&uacute;p bạn tiếp th&ecirc;m sức mạnh qua từng dặm đường đua, Nike Air Zoom Pegasus 38 Ekiden tiếp tục tạo ra một l&ograve; xo trong bước đi của bạn, sử dụng c&ugrave;ng một loại bọt phản hồi như người tiền nhiệm của n&oacute;. Lưới ở ph&iacute;a tr&ecirc;n kết hợp sự thoải m&aacute;i v&agrave; độ bền m&agrave; bạn muốn với sự vừa vặn quay trở lại với Kiểu d&aacute;ng cổ điển.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 3063000, 'uploads/products/7.png?v=1670849326', 1, 0, '2022-12-12 19:48:46', '2022-12-12 19:48:46'),
(8, 1, 2, 'NIKE Go FlyEase', '&lt;p&gt;&lt;span style=&quot;color: rgb(54, 54, 54); font-family: Poppins, sans-serif; font-size: 15px;&quot;&gt;Ngay khi bạn nghĩ rằng bạn đ&atilde; xem tất cả, Nike đ&atilde; đưa ra một c&aacute;ch ho&agrave;n to&agrave;n mới để mang v&agrave;o gi&agrave;y của bạn một c&aacute;ch nhanh ch&oacute;ng v&agrave; dễ d&agrave;ng. Tuyệt vời cho những người bị hạn chế về khả năng di chuyển t&igrave;m kiếm sự dễ d&agrave;ng mang v&agrave;o hoặc bất kỳ ai muốn c&oacute; một c&aacute;ch nhanh hơn để mang v&agrave; cởi ra! To&agrave;n bộ g&oacute;t ch&acirc;n (bao gồm cả đế) của trục Nike Go FlyEase mở ra để bạn c&oacute; thể sử dụng ho&agrave;n to&agrave;n rảnh tay.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 3510000, 'uploads/products/8.png?v=1670849394', 1, 0, '2022-12-12 19:49:54', '2022-12-12 19:49:54'),
(9, 1, 3, 'Jordan Delta 3 SP', '&lt;p&gt;&lt;span style=&quot;color: rgb(54, 54, 54); font-family: Poppins, sans-serif; font-size: 15px;&quot;&gt;Kết hợp giữa thủ c&ocirc;ng cao cấp với c&aacute;c t&iacute;nh năng c&ocirc;ng nghệ cao, những c&uacute; đ&aacute; n&agrave;y l&agrave; hiện th&acirc;n của sự ngầu. Đường viền tho&aacute;ng m&aacute;t v&agrave; đ&ocirc;i da lộn mềm mại với nội thất liền mạch cho vẻ ngo&agrave;i cổ điển v&agrave; sự thoải m&aacute;i của Thương hiệu Jordan cao cấp.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 4100000, 'uploads/products/9.png?v=1670849444', 1, 0, '2022-12-12 19:50:44', '2022-12-12 19:50:44'),
(10, 1, 3, 'Air Jordan XXXVI GC PF', '&lt;p&gt;&lt;span style=&quot;color: rgb(54, 54, 54); font-family: Poppins, sans-serif; font-size: 15px;&quot;&gt;Từ chu vi đến v&ograve;ng bo, tự tin chiếm lấy t&ograve;a &aacute;n. Đ&acirc;y l&agrave; một trong những chiếc Air Jordans nhẹ nhất cho đến nay, với phần tr&ecirc;n tối giản nhưng bền bỉ được gia cố bằng c&aacute;c chi tiết nhựa cứng. Đệm Zoom Air mang lại khả năng hồi phục năng lượng tốt nhất trong ph&acirc;n kh&uacute;c v&agrave; khả năng phản hồi ưu việt, cho d&ugrave; bạn đang chơi trong nh&agrave; hay ngo&agrave;i trời. Phi&ecirc;n bản n&agrave;y c&oacute; cấu h&igrave;nh rộng hơn v&agrave; m&agrave;u sắc phi&ecirc;n bản đặc biệt mừng Tết Nguy&ecirc;n Đ&aacute;n.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 4800000, 'uploads/products/10.png?v=1670849492', 1, 0, '2022-12-12 19:51:31', '2022-12-12 19:51:32'),
(11, 1, 3, 'Jordan Zoom Separate', '&lt;p&gt;&lt;span style=&quot;color: rgb(54, 54, 54); font-family: Poppins, sans-serif; font-size: 15px;&quot;&gt;C&uacute; đ&aacute;nh l&ugrave;i l&agrave; n&agrave;ng thơ cho Jordan Zoom Separate, một đ&ocirc;i gi&agrave;y đế thấp nhẹ được thiết kế để gi&uacute;p bạn kiểm so&aacute;t tr&ecirc;n s&acirc;n. Đệm chắc chắn hơn dọc theo b&ecirc;n ngo&agrave;i của b&agrave;n ch&acirc;n v&agrave; mềm hơn dọc theo b&ecirc;n trong, v&igrave; vậy bạn c&oacute; thể tựa mạnh khi vận động v&agrave; thay đổi hướng. Một bộ phận Zoom Air gi&uacute;p bạn tho&aacute;t khỏi hậu vệ v&agrave; nh&igrave;n r&otilde; rổ.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 2530000, 'uploads/products/11.png?v=1670849525', 1, 0, '2022-12-12 19:52:05', '2022-12-12 19:52:05'),
(12, 1, 3, 'Jordan Delta 2 SE', '&lt;p&gt;&lt;span style=&quot;color: rgb(54, 54, 54); font-family: Poppins, sans-serif; font-size: 15px;&quot;&gt;Jordan Delta 2 mang đến sự mới mẻ, kh&ocirc;ng sợ h&atilde;i với c&aacute;c t&iacute;nh năng bạn muốn: độ bền, sự thoải m&aacute;i v&agrave; th&aacute;i độ cốt l&otilde;i l&agrave; Jordan. Ch&uacute;ng t&ocirc;i đ&atilde; cập nhật c&aacute;c đường n&eacute;t thiết kế v&agrave; n&acirc;ng cấp một số th&agrave;nh phần, trong khi vẫn giữ nguy&ecirc;n c&aacute;c nguy&ecirc;n tắc cơ bản m&agrave; bạn y&ecirc;u th&iacute;ch từ chiếc Delta đầu ti&ecirc;n. Tận hưởng sự kết hợp tương tự giữa c&aacute;c vật liệu hỗ trợ, s&aacute;ng tạo, với kết cấu mới v&agrave; đường kh&acirc;u d&agrave;y để tạo ra một c&aacute;i nh&igrave;n vừa mạo hiểm vừa mang t&iacute;nh biểu tượng.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 3220000, 'uploads/products/12.png?v=1670849573', 1, 0, '2022-12-12 19:52:53', '2022-12-12 19:52:53'),
(13, 1, 4, 'PUMA Fusion Nitro Basketball', '&lt;p&gt;&lt;span style=&quot;color: rgb(54, 54, 54); font-family: Poppins, sans-serif; font-size: 15px;&quot;&gt;Mẫu Hoops s&aacute;ng tạo nhất cho đến nay kết hợp tất cả c&aacute;c t&iacute;nh năng c&ocirc;ng nghệ ch&iacute;nh của PUMA v&agrave;o một đ&ocirc;i gi&agrave;y đ&aacute;ng ch&uacute; &yacute;. Nitro Foam kết hợp vật liệu mềm, nhẹ với lớp đệm đặc biệt v&agrave; khả năng phục hồi bất bại cho độ nảy lớn nhất của ch&uacute;ng t&ocirc;i. Ch&acirc;n được kh&oacute;a an to&agrave;n v&agrave;o Fusion Nitro với dải n&eacute;n th&iacute;ch ứng c&oacute; trong phần tr&ecirc;n được thiết kế linh hoạt. Đế ngo&agrave;i bằng cao su chứa hợp chất cao su d&iacute;nh, m&agrave;i m&ograve;n cao của PUMA để tạo ra lực k&eacute;o to&agrave;n bộ khi ch&acirc;n bạn chạm s&agrave;n.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 2977000, 'uploads/products/13.png?v=1670849681', 1, 0, '2022-12-12 19:54:40', '2022-12-12 19:54:41'),
(14, 1, 4, 'PUMA Speedcat OG + Sparco Driving', '&lt;p&gt;&lt;span style=&quot;color: rgb(54, 54, 54); font-family: Poppins, sans-serif; font-size: 15px;&quot;&gt;H&atilde;y sẵn s&agrave;ng cho một số tốc độ thực sự trong Speedcat OG + Sparco Motorsport Shoes. Với thiết kế đẹp mắt v&agrave; logo nổi bật, đ&ocirc;i gi&agrave;y n&agrave;y sẽ đảm bảo bạn lu&ocirc;n bắt kịp tốc độ tr&ecirc;n đường đua theo phong c&aacute;ch đua xe thể thao PUMA đ&iacute;ch thực.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 2330000, 'uploads/products/14.png?v=1670849731', 1, 0, '2022-12-12 19:55:30', '2022-12-12 19:55:31'),
(15, 1, 4, 'PUMA H.ST.20 Men Training', '&lt;p&gt;&lt;span style=&quot;color: rgb(54, 54, 54); font-family: Poppins, sans-serif; font-size: 15px;&quot;&gt;Ch&uacute;ng t&ocirc;i đ&atilde; truy cập v&agrave;o kho lưu trữ cho c&aacute;i n&agrave;y. Đ&aacute;nh v&agrave;o những con phố v&agrave;o đầu những năm 2000 như một h&igrave;nh b&oacute;ng thấp b&eacute; với nguồn gốc từ thời kỳ tăng vọt về khoảng c&aacute;ch tối giản, H.ST.20 đang tiến thẳng đến tương lai. Được ph&aacute;t triển với đế ngo&agrave;i bằng cao su năng động, h&igrave;nh ảnh b&ecirc;n h&ocirc;ng t&aacute;o bạo v&agrave; đệm ổn định LQDCELL, c&uacute; đ&aacute; lấy cảm hứng từ đường chạy n&agrave;y đ&atilde; trở lại trong một v&ograve;ng lịch sử kh&aacute;c&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1955000, 'uploads/products/15.png?v=1670849765', 1, 0, '2022-12-12 19:56:05', '2022-12-12 19:56:05'),
(16, 1, 4, 'PUMA RS-X Galaxy Sneakers', '&lt;p&gt;&lt;span style=&quot;color: rgb(54, 54, 54); font-family: Poppins, sans-serif; font-size: 15px;&quot;&gt;Lamelo Ball l&agrave; h&igrave;nh ảnh thu nhỏ của thế giới kh&aacute;c v&agrave; Bộ sưu tập Galaxy mới của anh ấy củng cố sự thật rằng anh ấy kh&ocirc;ng đến từ đ&acirc;y. Sự bổ sung mới nhất cho bộ sưu tập mang lại năng lượng n&agrave;y cho c&aacute;c đường phố. RS-X Galaxy nắm bắt được sự rung cảm n&agrave;y bằng c&aacute;c vệt m&agrave;u huỳnh quang l&agrave;m nổi bật h&igrave;nh ảnh thi&ecirc;n h&agrave;. Thẩm mỹ thi&ecirc;n văn học xung đột với phong c&aacute;ch đồng thương hiệu v&agrave; kh&ocirc;ng gian thời đại t&aacute;o bạo. H&atilde;y chứng minh bạn Kh&ocirc;ng phải Từ Đ&acirc;y v&agrave; ngo&agrave;i t&ograve;a &aacute;n.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 2880000, 'uploads/products/16.png?v=1670849803', 1, 0, '2022-12-12 19:56:43', '2022-12-12 19:56:43'),
(17, 1, 5, 'Giày Cao Gót SN001', '&lt;p style=&quot;margin-bottom: 0px; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; color: rgb(37, 36, 37); font-size: 15px;&quot;&gt;Gi&agrave;y cao g&oacute;t mũi nhọn cực thanh lịch của nh&agrave; Dily, nếu n&agrave;ng đang t&igrave;m một đ&ocirc;i cao g&oacute;t vừa thanh tho&aacute;t m&agrave; lại dễ mang th&igrave; em gi&agrave;y cao g&oacute;t SN001 n&agrave;y ch&iacute;nh l&agrave; sự lựa chọn tốt nhất. Thiết kế g&oacute;t trụ vững chắc k&egrave;m mũi nhọn thời thượng, em cao g&oacute;t n&agrave;y sẽ cho n&agrave;ng từng bước đi tự tin v&agrave; xinh đẹp hơn.&lt;/p&gt;', 2230000, 'uploads/products/17.png?v=1670850687', 1, 0, '2022-12-12 20:11:27', '2022-12-12 20:11:27'),
(18, 1, 5, 'Giày Cao Gót SN002', '&lt;p style=&quot;margin-bottom: 0px; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; color: rgb(37, 36, 37); font-size: 15px;&quot;&gt;Gi&agrave;y cao g&oacute;t mũi nhọn cực thanh lịch của nh&agrave; Dily, Nếu n&agrave;ng đang t&igrave;m một đ&ocirc;i cao g&oacute;t vừa thanh tho&aacute;t m&agrave; lại dễ mang th&igrave; em gi&agrave;y cao g&oacute;t SN002 n&agrave;y ch&iacute;nh l&agrave; sự lựa chọn tốt nhất. Thiết kế g&oacute;t trụ vững chắc k&egrave;m mũi nhọn thời thượng, em cao g&oacute;t n&agrave;y sẽ cho n&agrave;ng từng bước đi tự tin v&agrave; xinh đẹp hơn.&lt;/p&gt;', 2100000, 'uploads/products/18.png?v=1670850722', 1, 0, '2022-12-12 20:12:02', '2022-12-12 20:12:02'),
(19, 1, 5, 'Giày Cao Gót SN003', '&lt;p style=&quot;margin-bottom: 0px; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; color: rgb(37, 36, 37); font-size: 15px;&quot;&gt;Gi&agrave;y cao g&oacute;t kh&ocirc;ng chỉ gi&uacute;p n&agrave;ng ăn gian chiều cao m&agrave; c&ograve;n l&agrave;m cho đ&ocirc;i ch&acirc;n tr&ocirc;ng d&agrave;i v&agrave; thanh tho&aacute;t hơn. Chưa dừng lại ở đ&oacute;, chi tiết mũi b&iacute;t v&agrave; quai thanh mảnh lại đảm bảo độ thanh lịch, sang trọng tuyệt đối. Đ&acirc;y thật sự l&agrave; đ&ocirc;i gi&agrave;y rất đ&aacute;ng để đầu tư, chưa kể kiểu d&aacute;ng c&oacute; thể dễ d&agrave;ng biến h&oacute;a mang đi l&agrave;m, đi tiệc hay đi chơi.&lt;/p&gt;', 2150000, 'uploads/products/19.png?v=1670850747', 1, 0, '2022-12-12 20:12:27', '2022-12-12 20:12:27'),
(20, 1, 5, 'Giày Cao Gót SN004', '&lt;p style=&quot;margin-bottom: 0px; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; color: rgb(37, 36, 37); font-size: 15px;&quot;&gt;Gi&agrave;y cao g&oacute;t kh&ocirc;ng chỉ gi&uacute;p n&agrave;ng ăn gian chiều cao m&agrave; c&ograve;n l&agrave;m cho đ&ocirc;i ch&acirc;n tr&ocirc;ng d&agrave;i v&agrave; thanh tho&aacute;t hơn. Chưa dừng lại ở đ&oacute;, chi tiết mũi b&iacute;t v&agrave; quai thanh mảnh lại đảm bảo độ thanh lịch, sang trọng tuyệt đối. Đ&acirc;y thật sự l&agrave; đ&ocirc;i gi&agrave;y rất đ&aacute;ng để đầu tư, chưa kể kiểu d&aacute;ng c&oacute; thể dễ d&agrave;ng biến h&oacute;a mang đi l&agrave;m, đi tiệc hay đi chơi.&lt;/p&gt;', 2450000, 'uploads/products/20.png?v=1670850776', 1, 0, '2022-12-12 20:12:56', '2022-12-12 20:12:56'),
(22, 1, 1, 'test', '&lt;p&gt;1234&lt;/p&gt;', 123, 'uploads/products/22.png?v=1670896820', 1, 1, '2022-12-13 09:00:19', '2022-12-13 09:00:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shipping`
--

CREATE TABLE `shipping` (
  `id_shipping` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shop_type_list`
--

CREATE TABLE `shop_type_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `shop_type_list`
--

INSERT INTO `shop_type_list` (`id`, `name`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(6, 'test', 1, 0, '2022-09-28 20:51:41', '2022-10-08 16:05:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'HỆ THỐNG BÁN GIÀY TRỰC TUYẾN'),
(6, 'short_name', 'SHOESTORE'),
(11, 'logo', 'uploads/logo-1664294452.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1664294452.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/avatar-1.png?v=1644472635', NULL, 1, '2021-01-20 14:02:37', '2022-12-10 19:26:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vendor_list`
--

CREATE TABLE `vendor_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `shop_type_id` int(30) NOT NULL,
  `shop_name` text NOT NULL,
  `shop_owner` text NOT NULL,
  `contact` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `vendor_list`
--

INSERT INTO `vendor_list` (`id`, `code`, `shop_type_id`, `shop_name`, `shop_owner`, `contact`, `username`, `password`, `avatar`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, '202212-00001', 6, 'Khang', '12 Nguyễn Văn Bảo', '123456789', 'nv001', 'c662366a17474c4885b6a77c43eaee9b', 'uploads/vendors/1.png?v=1670675267', 1, 0, '2022-12-10 19:27:47', '2022-12-10 19:27:47'),
(2, '202212-00002', 6, 'abc', '123', '123', '123', 'c662366a17474c4885b6a77c43eaee9b', 'uploads/vendors/2.png?v=1670854429', 1, 1, '2022-12-12 21:13:49', '2022-12-12 21:13:54'),
(3, '202212-00003', 6, 'Ngô Thị Thúy Hằng', '12 Nguyễn Văn Bảo', '123456', 'nv002', 'c662366a17474c4885b6a77c43eaee9b', 'uploads/vendors/3.png?v=1670895845', 1, 0, '2022-12-13 08:44:05', '2022-12-13 08:44:05');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart_list`
--
ALTER TABLE `cart_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Chỉ mục cho bảng `client_fb_list`
--
ALTER TABLE `client_fb_list`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `client_list`
--
ALTER TABLE `client_list`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `momo`
--
ALTER TABLE `momo`
  ADD PRIMARY KEY (`id_momo`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Chỉ mục cho bảng `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`),
  ADD KEY `category_id` (`category_id`) USING BTREE;

--
-- Chỉ mục cho bảng `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`id_shipping`);

--
-- Chỉ mục cho bảng `shop_type_list`
--
ALTER TABLE `shop_type_list`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `vendor_list`
--
ALTER TABLE `vendor_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_type_id` (`shop_type_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cart_list`
--
ALTER TABLE `cart_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `client_fb_list`
--
ALTER TABLE `client_fb_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `client_list`
--
ALTER TABLE `client_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `momo`
--
ALTER TABLE `momo`
  MODIFY `id_momo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `shipping`
--
ALTER TABLE `shipping`
  MODIFY `id_shipping` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `shop_type_list`
--
ALTER TABLE `shop_type_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `vendor_list`
--
ALTER TABLE `vendor_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart_list`
--
ALTER TABLE `cart_list`
  ADD CONSTRAINT `cart_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_list_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `category_list`
--
ALTER TABLE `category_list`
  ADD CONSTRAINT `category_list_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `order_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_list_ibfk_2` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `product_list`
--
ALTER TABLE `product_list`
  ADD CONSTRAINT `product_list_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_list_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `vendor_list`
--
ALTER TABLE `vendor_list`
  ADD CONSTRAINT `vendor_list_ibfk_1` FOREIGN KEY (`shop_type_id`) REFERENCES `shop_type_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
