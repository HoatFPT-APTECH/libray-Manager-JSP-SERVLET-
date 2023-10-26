-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 26, 2023 lúc 11:01 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

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
-- Cấu trúc bảng cho bảng `author`
--

CREATE TABLE `author` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `publication_year` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `number_off_pages` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `publisher_id` int(11) DEFAULT NULL,
  `create_day` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `book`
--

INSERT INTO `book` (`id`, `image`, `name`, `author_id`, `price`, `publication_year`, `number_off_pages`, `category_id`, `amount`, `publisher_id`, `create_day`, `deleted`) VALUES
(36, 'Dac-nhan-tam.jpg', 'Đắc Nhân Tâm', NULL, NULL, '2023-10-24 09:00:00', NULL, 22, 5, NULL, '2020-11-19 07:30:06', 0),
(37, 'dam-uoc-mo.jpg', 'Dám uoc mo', NULL, NULL, '2023-10-24 09:00:00', NULL, 22, 6, NULL, '2020-11-19 07:30:36', 0),
(38, 'nghi-lon-de-thanh-cong.jpg', 'Nghĩ Lớn Để Thành Công', NULL, NULL, '2023-10-24 09:00:00', NULL, 23, 4, NULL, '2020-11-19 07:30:49', 0),
(39, '360-dong-tu-bat-quy-tac-day-du.jpg', '360 Động Từ Bất Quy Tắc Đầy Đủ', NULL, NULL, '2023-10-24 09:00:00', NULL, 24, 5, NULL, '2020-11-19 07:31:01', 0),
(40, 'khi-nguoi-ta-tu-duy.jpg', 'Khi Người Ta Tư Duy', NULL, NULL, '2023-10-24 09:00:00', NULL, 22, 5, NULL, '2020-11-19 07:32:05', 0),
(41, 'chieu-bai-quan-ly-vang-cua-bill-gates.jpg', 'Chiêu Bài Quản Lý Vàng Của Bill Gates ', NULL, NULL, '2023-10-24 09:00:00', NULL, 23, 6, NULL, '2020-11-19 07:33:23', 0),
(42, 'tu-hoc-tieng-anh-hieu-qua.jpg', 'Tự Học Tiếng Anh Hiệu Quả', NULL, NULL, '2023-10-24 09:00:00', NULL, 24, 5, NULL, '2020-11-19 07:35:14', 0),
(43, 'hands on machine learning with scikit learn and tensorflow.jpg', 'Hands on machine learning with scikit learn and tensorflow', NULL, NULL, '2023-10-24 09:00:00', NULL, 25, 2, NULL, '2020-11-19 07:38:54', 0),
(44, 'mat-troi-va-con-nguoi.jpg', 'Mặt Trời Và Con Người', NULL, NULL, '2023-10-24 09:00:00', NULL, 22, 1, NULL, '2020-11-19 07:41:28', 0),
(45, 'tu-tot-den-vi-dai.jpg', 'Từ Tốt Đến Vĩ Đại', NULL, NULL, '2023-10-24 09:00:00', NULL, 23, 4, NULL, '2020-11-19 07:42:13', 0),
(46, 'hanh-phuc-that-gian-don.jpg', 'Hạnh Phúc Thật Giản Đơn', NULL, NULL, '2023-10-24 09:00:00', NULL, 22, 1, NULL, '2020-11-19 07:43:14', 0),
(52, 'mat-thu.jpg', 'Mật thư 2', NULL, NULL, '2023-10-26 08:59:50', NULL, 24, 4, NULL, '2020-11-26 05:34:14', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `borrow_request`
--

CREATE TABLE `borrow_request` (
  `id` int(11) NOT NULL,
  `reader_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `due_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `borrow_tracking`
--

CREATE TABLE `borrow_tracking` (
  `id` int(11) NOT NULL,
  `request_id` int(11) DEFAULT NULL,
  `return_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `return_status` int(11) DEFAULT NULL,
  `fine_amound` decimal(10,0) DEFAULT NULL,
  `Deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`, `deleted`) VALUES
(22, 'Tâm Lý - Kỹ Năng Sống 3', 0),
(23, 'Kinh Tế Quản Lý', 0),
(24, 'Ngoại Ngữ', 0),
(25, 'Lập Trình', 0),
(29, 'Khoa học kỹ thuật', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `publisher`
--

CREATE TABLE `publisher` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reader`
--

CREATE TABLE `reader` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `date_of_birth` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reader_address` text DEFAULT NULL,
  `identity_card` varchar(15) NOT NULL,
  `start_day` timestamp NOT NULL DEFAULT current_timestamp(),
  `end_day` timestamp NULL DEFAULT NULL,
  `books_borrowed` int(11) DEFAULT NULL,
  `borrowed_time` int(11) DEFAULT NULL,
  `deposit` decimal(10,0) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `status` bit(1) DEFAULT b'0',
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `reader`
--

INSERT INTO `reader` (`id`, `name`, `date_of_birth`, `reader_address`, `identity_card`, `start_day`, `end_day`, `books_borrowed`, `borrowed_time`, `deposit`, `role_id`, `status`, `deleted`) VALUES
(4, 'John Doe', '1990-05-14 17:00:00', '123 Main Street, City', '123456789012345', '2023-09-30 17:00:00', NULL, 3, 21, 50, 1, b'1', 0),
(5, 'Alice Smith', '1985-08-19 17:00:00', '456 Elm Street, Town', '987654321098765', '2023-09-14 17:00:00', NULL, 2, 14, 30, 2, b'1', 0),
(6, 'Bob Johnson', '1992-02-27 17:00:00', '789 Oak Street, Village', '543210987654321', '2023-10-04 17:00:00', NULL, 1, 7, 20, 1, b'0', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role_reader`
--

CREATE TABLE `role_reader` (
  `id` int(11) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `Deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `role_reader`
--

INSERT INTO `role_reader` (`id`, `name`, `Deleted`) VALUES
(1, 'Sinh viên ', 0),
(2, 'Giáo viên ', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(1, 'user', '1');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `book`
--
ALTER TABLE `book`
  ADD KEY `category_id` (`category_id`),
  ADD KEY `publisher_id` (`publisher_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Chỉ mục cho bảng `borrow_request`
--
ALTER TABLE `borrow_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reader_id` (`reader_id`);

--
-- Chỉ mục cho bảng `borrow_tracking`
--
ALTER TABLE `borrow_tracking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `request_id` (`request_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `reader`
--
ALTER TABLE `reader`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- Chỉ mục cho bảng `role_reader`
--
ALTER TABLE `role_reader`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `author`
--
ALTER TABLE `author`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `borrow_request`
--
ALTER TABLE `borrow_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `borrow_tracking`
--
ALTER TABLE `borrow_tracking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `publisher`
--
ALTER TABLE `publisher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `reader`
--
ALTER TABLE `reader`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `role_reader`
--
ALTER TABLE `role_reader`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`id`),
  ADD CONSTRAINT `book_ibfk_3` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`);

--
-- Các ràng buộc cho bảng `borrow_request`
--
ALTER TABLE `borrow_request`
  ADD CONSTRAINT `borrow_request_ibfk_1` FOREIGN KEY (`reader_id`) REFERENCES `reader` (`id`);

--
-- Các ràng buộc cho bảng `borrow_tracking`
--
ALTER TABLE `borrow_tracking`
  ADD CONSTRAINT `borrow_tracking_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `borrow_request` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `reader`
--
ALTER TABLE `reader`
  ADD CONSTRAINT `reader_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role_reader` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
