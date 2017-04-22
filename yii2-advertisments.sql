-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 22 2017 г., 08:41
-- Версия сервера: 5.5.48
-- Версия PHP: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `yii2-advertisments`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL,
  `text` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comment`
--

INSERT INTO `comment` (`id`, `text`, `user_id`, `profile_id`, `created_at`, `updated_at`) VALUES
(3, 'Коммент от юзера 1', 1, 3, '2017-03-21 22:42:48', '2017-03-21 22:42:48'),
(6, 'Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s.', 3, 1, '2017-03-22 03:23:14', '2017-03-22 03:23:14'),
(7, 'Ещё коммент', 3, 2, '2017-03-22 14:34:09', '2017-03-22 14:34:09'),
(23, 'sdgsgdhgfh', 1, 1, '2017-03-24 22:01:49', '2017-03-24 22:01:49'),
(26, 'dfhfh', 1, 1, '2017-03-24 22:05:03', '2017-03-24 22:05:03'),
(28, 'dfhfh', 1, 1, '2017-03-24 22:05:25', '2017-03-24 22:05:25'),
(44, 'Тестовый комментарий', 1, 2, '2017-03-27 15:57:15', '2017-03-27 15:57:15');

-- --------------------------------------------------------

--
-- Структура таблицы `image`
--

CREATE TABLE IF NOT EXISTS `image` (
  `id` int(11) NOT NULL,
  `filePath` varchar(400) NOT NULL,
  `itemId` int(11) DEFAULT NULL,
  `isMain` tinyint(1) DEFAULT NULL,
  `modelName` varchar(150) NOT NULL,
  `urlAlias` varchar(400) NOT NULL,
  `name` varchar(80) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `image`
--

INSERT INTO `image` (`id`, `filePath`, `itemId`, `isMain`, `modelName`, `urlAlias`, `name`) VALUES
(1, 'Profiles/Profile1/ebf8ba.png', 1, 1, 'Profile', '65638aec2e-1', ''),
(3, 'Products/Product2/a32b57.jpg', 2, 1, 'Product', 'f807dbc6e1-1', ''),
(4, 'Products/Product3/4cf01b.jpg', 3, 0, 'Product', '62b052e529-2', ''),
(7, 'Products/Product5/f5ea84.jpg', 5, 0, 'Product', '7b83f801d3-3', ''),
(8, 'Products/Product5/56131d.jpg', 5, 0, 'Product', 'b2660d6356-2', ''),
(9, 'Products/Product5/18a0ed.jpg', 5, 1, 'Product', '9ab598da95-1', ''),
(10, 'Products/Product6/c47542.jpg', 6, 0, 'Product', 'da41bea840-2', ''),
(11, 'Products/Product6/5a7b04.jpg', 6, 0, 'Product', 'f13803eb8c-3', ''),
(12, 'Products/Product6/5e0a1f.jpg', 6, 0, 'Product', '5fcc1fde98-4', ''),
(13, 'Products/Product6/b301df.jpg', 6, 0, 'Product', 'b8746fedbe-5', ''),
(14, 'Products/Product6/ec1996.jpg', 6, 0, 'Product', 'c5d734c1d6-6', ''),
(15, 'Products/Product6/f713e3.jpg', 6, 0, 'Product', '2a35435504-7', ''),
(18, 'Products/Product7/245250.jpg', 7, 1, 'Product', 'a46e3ef153-1', ''),
(19, 'Products/Product8/341078.jpg', 8, 1, 'Product', '2ddc07846a-1', ''),
(21, 'Products/Product12/230272.png', 12, 1, 'Product', '0af184a6f6-1', ''),
(23, 'Products/Product20/83a5ca.jpg', 20, 1, 'Product', '64dc081864-1', ''),
(25, 'Products/Product22/670d69.jpg', 22, 1, 'Product', '2a41d60b44-1', ''),
(26, 'Profiles/Profile3/1e8165.png', 3, 0, 'Profile', '753707e60a-2', ''),
(27, 'Profiles/Profile3/705c72.png', 3, 0, 'Profile', '07753a168c-3', ''),
(29, 'Profiles/Profile3/174167.png', 3, 0, 'Profile', 'f110597ab6-4', ''),
(31, 'Profiles/Profile3/68303a.png', 3, 0, 'Profile', '0325c12faf-5', ''),
(36, 'Profiles/Profile3/8436a3.png', 3, 1, 'Profile', 'fad107adca-1', ''),
(37, 'Products/Product23/1231c7.png', 23, 1, 'Product', 'd2fbc171e8-1', ''),
(39, 'Products/Product21/dcaad3.jpg', 21, 1, 'Product', '93b991636e-1', ''),
(40, 'Products/Product6/b1ccbc.jpg', 6, 1, 'Product', '214911ab80-1', '');

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1490023877),
('m130524_201442_init', 1490023880),
('m140622_111540_create_image_table', 1490030847),
('m140622_111545_add_name_to_image_table', 1490030847),
('m160801_052335_rating', 1490059634);

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `price` float NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `user_id`, `name`, `created_at`, `updated_at`, `price`, `description`) VALUES
(1, 1, 'User1 Product1', '2017-03-21 20:54:31', '2017-03-21 20:54:56', 100, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s'),
(2, 1, 'User1 Product2', '2017-03-21 20:57:39', '2017-03-21 20:57:39', 200, 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).'),
(3, 1, 'User1 Product3', '2017-03-21 20:58:21', '2017-03-21 21:30:58', 300, 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).'),
(4, 2, 'User2 Product 4', '2017-03-21 21:39:49', '2017-03-21 21:39:49', 500, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lore'),
(5, 2, 'User2 Product 5', '2017-03-21 21:40:15', '2017-03-21 21:42:15', 450, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a '),
(7, 2, 'User2 Product 7', '2017-03-21 22:27:21', '2017-03-21 22:27:21', 700, 'adasfasf'),
(8, 3, 'user3 product 8', '2017-03-21 22:31:53', '2017-03-21 22:31:53', 444, 'dfsdgsgsdg'),
(10, 3, 'User3 Product 10', '2017-03-21 22:37:49', '2017-03-21 22:37:49', 777, 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.'),
(11, 3, 'User3 Product 11', '2017-03-21 22:38:26', '2017-03-21 22:38:26', 789, 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.'),
(12, 3, 'User3 Product 12', '2017-03-21 22:39:02', '2017-03-21 22:39:02', 833, 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.'),
(13, 3, 'User3 Product 13', '2017-03-21 22:39:23', '2017-03-21 22:39:23', 433, 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.'),
(14, 3, 'User3 Product14', '2017-03-21 22:39:40', '2017-03-21 22:39:40', 255, 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.'),
(15, 3, 'User3 Product15', '2017-03-21 22:39:55', '2017-03-21 22:39:55', 545, 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.'),
(16, 3, 'User3 Product16', '2017-03-21 22:40:16', '2017-03-21 22:40:16', 322, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.'),
(17, 3, 'User3 Product 16', '2017-03-21 22:40:29', '2017-03-21 22:40:29', 677, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.'),
(18, 3, 'user3 product 17', '2017-03-21 22:40:45', '2017-03-21 22:40:51', 433, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.'),
(19, 3, 'User3 Product18', '2017-03-21 22:41:03', '2017-03-21 22:41:03', 90, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.'),
(21, 1, 'User1 Product20', '2017-03-21 22:41:47', '2017-03-24 22:20:37', 555, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.'),
(22, 1, 'User1 Product21', '2017-03-21 22:42:05', '2017-03-21 22:42:05', 788, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.'),
(23, 3, 'test', '2017-03-22 22:39:48', '2017-03-22 22:39:48', 111, 'sddsg'),
(24, 2, 'TEST2', '2017-04-22 08:36:51', '2017-04-22 08:36:51', 555, 'dasdasd');

-- --------------------------------------------------------

--
-- Структура таблицы `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci,
  `rating` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `profile`
--

INSERT INTO `profile` (`id`, `name`, `bio`, `rating`) VALUES
(1, 'Name of user1', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s.s', '3.0'),
(2, 'user2 Name', NULL, '3.3'),
(3, 'user 3 nameф', 'Инфа о себе юзера 3', '3.3'),
(4, 'asdahsd', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `rating`
--

CREATE TABLE IF NOT EXISTS `rating` (
  `id` int(10) NOT NULL,
  `profile_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `value` int(5) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `rating`
--

INSERT INTO `rating` (`id`, `profile_id`, `user_id`, `value`) VALUES
(1, 2, 3, 4),
(2, 2, 1, 1),
(3, 3, 1, 3),
(4, 1, 3, 5),
(5, 3, 3, 3),
(6, 3, 4, 4),
(7, 2, 4, 5),
(8, 1, 4, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bio` text COLLATE utf8_unicode_ci,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `bio`, `status`, `created_at`, `updated_at`) VALUES
(1, 'user1', '7Xd4R_zlQD1Po-QnTJhKeydoZgT-YjDF', '$2y$13$i/rQC60xJHdBRf20zcWy8eTlJ9eGGFGk1/2hwUG2Psnoiqno2T19u', NULL, 'user1@mail.m', NULL, 10, 1490122311, 1490122311),
(2, 'user2', '_Izl55JD4B86konQDf9TbpOssdyneYug', '$2y$13$9X2TzbXvuLTZO9EvlwYCpuBA3q6eviPN4sIlivkOARzoEdPgPRhNu', NULL, 'user2@m.s', NULL, 10, 1490125154, 1490125154),
(3, 'user3', 'mY0IxlPkKFtTXJJuzvDkw2q30KiYANDP', '$2y$13$GZ3kUYRv8GfkEmCIvJcHRO7OzU8iIbw81L81ZichyA9bMnGmArRVO', NULL, 'user3@m.s', NULL, 10, 1490128282, 1490128282),
(4, 'user4', '1LOJD0Ec3hzm_PJayF1Y8GEC6E2kPdDQ', '$2y$13$.peTpatWrVXVuw2u6hXlKOu2naIf1JNojAcF7pNgTqtsIMsFSNNii', NULL, 'asd@d.d', NULL, 10, 1490617744, 1490617744);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `profile_id` (`profile_id`,`user_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT для таблицы `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT для таблицы `profile`
--
ALTER TABLE `profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
