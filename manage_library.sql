-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 12, 2023 lúc 03:50 AM
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

--
-- Đang đổ dữ liệu cho bảng `author`
--

INSERT INTO `author` (`id`, `name`, `deleted`) VALUES
(1, 'Dale Carnegie 2', 0),
(2, 'Florence Littauer', 0),
(3, 'Donald J.Trump', 0),
(4, 'Lan Hương', 0),
(5, 'James Allen', 0),
(6, 'Thương Mỗ', 0),
(7, 'Nguyễn Thị Hà Bắc', 0),
(8, 'Aurélien Géron', 0),
(9, 'Eric Jubelaker', 0),
(10, 'Jim Collins', 0),
(11, 'Nguyễn Mạnh Hùng', 1),
(12, 'Trần Thời', 1),
(13, 'Nguyễn Tiến Đạt', 1),
(14, 'Nguyen Tien Dat', 1);

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
(36, 'Dac-nhan-tam.jpg', 'Đắc Nhân Tam', 1, 200000, '2023-11-02 17:00:00', 100, 22, 4, 19, '2020-11-19 07:30:06', 0),
(37, 'dam-uoc-mo.jpg', 'Dám uoc mo', 1, 200000, '2023-11-11 09:59:40', 100, 22, 6, 19, '2020-11-19 07:30:36', 0),
(38, 'nghi-lon-de-thanh-cong.jpg', 'Nghĩ Lớn Để Thành Công', 1, 200000, '2023-11-11 14:28:33', 100, 22, 4, 19, '2020-11-19 07:30:49', 0),
(39, '360-dong-tu-bat-quy-tac-day-du.jpg', '360 Động Từ Bất Quy Tắc Đầy Đủ', 1, 200000, '2023-11-11 09:59:40', 100, 24, 5, 19, '2020-11-19 07:31:01', 0),
(40, 'khi-nguoi-ta-tu-duy.jpg', 'Khi Người Ta Tư Duy', 1, 200000, '2023-11-11 09:59:40', 100, 22, 5, 19, '2020-11-19 07:32:05', 0),
(41, 'chieu-bai-quan-ly-vang-cua-bill-gates.jpg', 'Chiêu Bài Quản Lý Vàng Của Bill Gates ', 1, 200000, '2023-11-11 09:59:40', 100, 23, 6, 19, '2020-11-19 07:33:23', 0),
(42, 'tu-hoc-tieng-anh-hieu-qua.jpg', 'Tự Học Tiếng Anh Hiệu Quả', 1, 200000, '2023-11-11 09:59:40', 100, 24, 5, 19, '2020-11-19 07:35:14', 0),
(43, 'R.jfif', 'Tuyển sinh HV', 1, 200000, '2023-11-10 17:00:00', 100, 31, 2, 19, '2020-11-19 07:38:54', 0),
(44, 'mat-troi-va-con-nguoi.jpg', 'Mặt Trời Và Con Người', 1, 200000, '2023-11-11 09:59:40', 100, 22, 1, 19, '2020-11-19 07:41:28', 0),
(45, 'tu-tot-den-vi-dai.jpg', 'Từ Tốt Đến Vĩ Đại', 1, 200000, '2023-11-11 09:59:40', 100, 23, 4, 19, '2020-11-19 07:42:13', 0),
(46, 'hanh-phuc-that-gian-don.jpg', 'Hạnh Phúc Thật Giản Đơn', 1, 200000, '2023-11-11 09:59:40', 100, 22, 1, 19, '2020-11-19 07:43:14', 0),
(52, 'mat-thu.jpg', 'Mật thư 2', 1, 200000, '2023-11-10 17:00:00', 100, 29, 4, 19, '2020-11-26 05:34:14', 0),
(61, 'uocmovakhatvong.jfif', 'Ước mơ và khát vọng', 9, 100000, '2023-11-12 17:00:00', 100, 22, 3, 19, '2023-11-04 15:38:42', 0),
(62, 'R.jfif', 'Long Vương', 1, 10892828, '2023-09-25 17:00:00', 245, 30, 6, 34, '2023-11-11 14:58:04', 0),
(63, 'OIP (2).jfif', 'Tình yêu màu nhiệm', 1, 38999222, '2023-11-11 15:41:53', 233, 22, 24, 19, '2023-11-11 15:01:14', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `borrow_request`
--

CREATE TABLE `borrow_request` (
  `id` int(11) NOT NULL,
  `reader_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `due_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 0,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `borrow_request`
--

INSERT INTO `borrow_request` (`id`, `reader_id`, `book_id`, `due_date`, `status`, `updated_at`, `deleted`) VALUES
(1, 5, 37, '2023-11-07 17:00:00', 1, '2023-11-02 16:39:51', 0),
(2, 4, 37, '2023-11-08 14:43:04', 0, '2023-11-02 16:39:51', 0),
(3, 8, 40, '2023-12-08 17:00:00', 1, '2023-11-08 14:39:30', 0),
(4, 8, 45, '2023-11-01 17:00:00', 1, '2023-11-11 03:44:51', 0),
(5, 10, 39, '2023-11-08 17:00:00', 1, '2023-11-11 03:47:06', 0),
(6, 8, 62, '2023-11-10 17:00:00', 0, '2023-11-11 15:51:56', 0),
(7, 8, 37, '2023-11-11 17:00:00', 0, '2023-11-12 02:05:14', 0),
(8, 8, 61, '2023-11-12 17:00:00', 1, '2023-11-12 02:08:05', 0),
(9, 8, 36, '2023-11-25 17:00:00', 0, '2023-11-12 02:15:12', 0),
(10, 8, 61, '2023-11-09 17:00:00', 1, '2023-11-12 02:16:03', 0),
(11, 8, 61, '2023-11-10 17:00:00', 1, '2023-11-12 02:38:38', 0);

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
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `borrow_tracking`
--

INSERT INTO `borrow_tracking` (`id`, `request_id`, `return_date`, `return_status`, `fine_amound`, `updated_at`, `deleted`) VALUES
(1, 1, '2023-11-06 17:00:00', 1, 100000, '2023-11-06 08:38:38', 0),
(2, 1, '2023-11-05 17:00:00', 1, 80000, '2023-11-06 08:40:21', 0),
(4, 3, '2023-11-07 17:00:00', 3, 200000, '2023-11-08 14:40:11', 0),
(5, 4, '2023-10-31 17:00:00', 1, 0, '2023-11-11 03:45:06', 0),
(6, 5, '2023-11-03 17:00:00', 1, 0, '2023-11-11 03:47:35', 0),
(7, 1, '2023-11-03 17:00:00', 1, 0, '2023-11-11 15:52:25', 0),
(8, 8, '2023-11-14 17:00:00', 1, 20000, '2023-11-12 02:10:50', 0),
(9, 10, '2023-11-10 17:00:00', 3, 100000, '2023-11-12 02:16:21', 0),
(10, 11, '2023-11-09 17:00:00', 1, 0, '2023-11-12 02:39:30', 0);

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
(22, 'Tâm Lý - Kỹ Năng Sống ', 0),
(23, 'Kinh Tế Quản Lý', 0),
(24, 'Ngoại Ngữ', 0),
(25, 'Lập Trình', 0),
(29, 'Khoa học kỹ thuật', 0),
(30, 'Thiên Văn học', 0),
(31, 'Sinh học', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `publisher`
--

CREATE TABLE `publisher` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `publisher`
--

INSERT INTO `publisher` (`id`, `name`, `deleted`) VALUES
(19, 'NXB Thế Giới', 0),
(21, 'NXB Tổng hợp TPHCM', 0),
(26, 'NXB Lao Động', 0),
(27, 'NXB Thanh Niên', 0),
(28, 'NXB Báo', 0),
(29, 'FUNIX', 0),
(31, 'NXB Trẻ', 1),
(32, 'janey', 1),
(33, 'Đạt đẹp đần', 1),
(34, 'NXB Trí Tuệ', 0);

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
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `reader`
--

INSERT INTO `reader` (`id`, `name`, `date_of_birth`, `reader_address`, `identity_card`, `start_day`, `end_day`, `books_borrowed`, `borrowed_time`, `deposit`, `role_id`, `deleted`) VALUES
(4, 'John Doe 3', '2023-11-11 15:49:40', '123 Main Street, City', '123456789012345', '2023-09-30 17:00:00', '2024-02-29 17:00:00', 3, 21, 50, 1, 1),
(5, 'Alice Smith ', '1985-08-19 17:00:00', '456 Elm Street, Town', '987654321098765', '2023-09-14 17:00:00', '2024-01-19 17:00:00', 2, 14, 30, 2, 0),
(6, 'Bob Johnson', '1992-02-27 17:00:00', '789 Oak Street, Village', '543210987654321', '2023-10-04 17:00:00', NULL, 1, 7, 20, 1, 0),
(8, 'Mai Huy Hoat', '2023-11-22 17:00:00', 'Nam Định', '036201011604', '2023-11-05 17:00:00', '2024-01-25 17:00:00', 20, 31, 200000, 1, 0),
(10, 'Mai Huy Hoat', '2023-11-11 15:49:12', 'Nam Định', '03620101 1604', '2023-11-16 17:00:00', '2024-02-03 17:00:00', 32, 123, 2333, 1, 0);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `publisher_id` (`publisher_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Chỉ mục cho bảng `borrow_request`
--
ALTER TABLE `borrow_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reader_id` (`reader_id`),
  ADD KEY `book_id` (`book_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT cho bảng `borrow_request`
--
ALTER TABLE `borrow_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `borrow_tracking`
--
ALTER TABLE `borrow_tracking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `publisher`
--
ALTER TABLE `publisher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `reader`
--
ALTER TABLE `reader`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  ADD CONSTRAINT `borrow_request_ibfk_1` FOREIGN KEY (`reader_id`) REFERENCES `reader` (`id`),
  ADD CONSTRAINT `borrow_request_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`);

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
