-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 18, 2022 lúc 03:36 PM
-- Phiên bản máy phục vụ: 10.4.22-MariaDB
-- Phiên bản PHP: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `manage_library`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `category_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `create_day` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `book`
--

INSERT INTO `book` (`id`, `name`, `category_id`, `amount`, `image`, `create_day`) VALUES
(36, 'Đắc Nhân Tâm', 22, 5, 'Dac-nhan-tam.jpg', '2022-06-17 17:00:00'),
(37, 'Dám uoc mo', 22, 6, 'dam-uoc-mo.jpg', '2022-06-17 17:00:00'),
(38, 'Nghĩ Lớn Để Thành Công', 23, 4, 'nghi-lon-de-thanh-cong.jpg', '2022-06-17 17:00:00'),
(39, '360 Động Từ Bất Quy Tắc Đầy Đủ', 24, 5, '360-dong-tu-bat-quy-tac-day-du.jpg', '2022-06-17 17:00:00'),
(40, 'Khi Người Ta Tư Duy', 22, 5, 'khi-nguoi-ta-tu-duy.jpg', '2022-06-17 17:00:00'),
(41, 'Chiêu Bài Quản Lý Vàng Của Bill Gates ', 23, 6, 'chieu-bai-quan-ly-vang-cua-bill-gates.jpg', '2022-06-17 17:00:00'),
(42, 'Tự Học Tiếng Anh Hiệu Quả', 24, 5, 'tu-hoc-tieng-anh-hieu-qua.jpg', '2022-06-17 17:00:00'),
(43, 'Hands on machine learning with scikit learn and tensorflow', 25, 2, 'hands on machine learning with scikit learn and tensorflow.jpg', '2022-06-17 17:00:00'),
(44, 'Mặt Trời Và Con Người', 22, 1, 'mat-troi-va-con-nguoi.jpg', '2022-06-17 17:00:00'),
(45, 'Từ Tốt Đến Vĩ Đại', 23, 4, 'tu-tot-den-vi-dai.jpg', '2022-06-17 17:00:00'),
(46, 'Hạnh Phúc Thật Giản Đơn', 22, 1, 'hanh-phuc-that-gian-don.jpg', '2022-06-17 17:00:00'),
(52, 'Mật thư', 29, 7, 'mat-thu.jpg', '2022-06-17 17:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(22, 'Tâm Lý - Kỹ Năng Sống'),
(23, 'Kinh Tế Quản Lý'),
(24, 'Ngoại Ngữ'),
(25, 'Lập Trình'),
(29, 'Khoa học kỹ thuật');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reader`
--

CREATE TABLE `reader` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `book_id` int(11) NOT NULL,
  `identity_card` varchar(15) NOT NULL,
  `start_day` timestamp NULL DEFAULT current_timestamp(),
  `end_day` timestamp NULL DEFAULT NULL,
  `status` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `reader`
--

INSERT INTO `reader` (`id`, `name`, `book_id`, `identity_card`, `start_day`, `end_day`, `status`) VALUES
(17, 'Nguyễn Văn A', 46, '12213231', '2020-11-19 14:45:32', '2020-11-18 17:00:00', b'1'),
(18, 'Nguyễn Văn B', 45, '12345678', '2020-11-19 14:45:54', '2020-11-18 17:00:00', b'1'),
(19, 'Lê Thị C', 44, '12213231', '2020-11-19 14:46:25', '2020-11-18 17:00:00', b'1'),
(20, 'Lê Minh Đức', 43, '22312313', '2020-11-19 14:46:47', '2020-11-18 17:00:00', b'1'),
(21, 'Nguyễn Văn D', 38, '121345446', '2020-11-19 14:47:46', '2020-11-27 17:00:00', b'1'),
(22, 'Lê Đức Anh', 43, '244443242', '2020-11-19 14:48:34', '2020-11-27 17:00:00', b'1'),
(23, 'Phương', 45, '01002017', '2022-05-29 08:16:13', '2022-05-03 17:00:00', b'0');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(1, 'nobita', 'doraemon');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `reader`
--
ALTER TABLE `reader`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_id` (`book_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `reader`
--
ALTER TABLE `reader`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Các ràng buộc cho bảng `reader`
--
ALTER TABLE `reader`
  ADD CONSTRAINT `reader_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
