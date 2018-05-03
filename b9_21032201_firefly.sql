-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Host: sql202.byethost9.com
-- Generation Time: Feb 01, 2018 at 12:13 PM
-- Server version: 5.6.35-81.0
-- PHP Version: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `b9_21032201_firefly`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_body` text NOT NULL,
  `posted_by` varchar(60) NOT NULL,
  `posted_to` varchar(60) NOT NULL,
  `date_added` datetime NOT NULL,
  `removed` varchar(3) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_body`, `posted_by`, `posted_to`, `date_added`, `removed`, `post_id`) VALUES
(1, 'Yes! I''m defintely waiting for it!', 'robbie_jones', 'bob_smith', '2017-10-27 01:48:08', 'no', 1),
(2, 'Yep, Sure is.', 'john_smith', 'robbie_jones', '2017-10-27 02:05:26', 'no', 2),
(3, 'Hey Robbie, long time no see.', 'test_user', 'robbie_jones', '2017-10-27 02:09:13', 'no', 2),
(4, 'Nice!', 'ahmed_faisal', 'john_smith', '2017-10-27 02:12:27', 'no', 4),
(5, 'How much is the monthly pass now?', 'ahmed_faisal', 'test_user', '2017-10-27 02:13:56', 'no', 3),
(6, 'Just under $140. But it''s not too bad. It''s still cheaper than owning a car.', 'test_user', 'test_user', '2017-10-27 02:14:56', 'no', 3),
(7, 'That''s true. Expenses for a car just keep on rising.', 'ahmed_faisal', 'test_user', '2017-10-27 02:16:04', 'no', 3),
(8, 'That''s why I keep on telling everyone to sell their car and use public transit.', 'test_user', 'test_user', '2017-10-27 02:17:07', 'no', 3),
(9, 'Wow! That''s a really nice video Ahmed.', 'john_smith', 'ahmed_faisal', '2017-10-27 02:26:01', 'no', 6),
(10, 'Are you currently learning machine learning?', 'john_smith', 'ahmed_faisal', '2017-10-27 02:26:39', 'no', 6),
(11, 'Thanks. No, but I am planning on learning machine learning soon.', 'ahmed_faisal', 'ahmed_faisal', '2017-10-27 02:27:10', 'no', 6),
(12, 'I wish I could learn programming, but I just don''t know how. There''s just so many things you can create using programming.', 'robbie_jones', 'ahmed_faisal', '2017-10-27 02:29:17', 'no', 6),
(13, 'Hey Robbie, if you want, I can message you a couple links to websites that teach programming to beginners.', 'bob_smith', 'ahmed_faisal', '2017-10-27 02:30:29', 'no', 6),
(14, 'That would be great Bob!', 'robbie_jones', 'ahmed_faisal', '2017-10-27 02:31:25', 'no', 6),
(15, 'Machine learning and artificial intelligence is very interesting.', 'test_user', 'ahmed_faisal', '2017-10-27 02:32:07', 'no', 6),
(16, 'Looking Good Rose!', 'test_user', 'rose_monroe', '2017-10-27 02:38:13', 'no', 7),
(17, 'Thanks!', 'rose_monroe', 'rose_monroe', '2017-10-27 02:38:46', 'no', 7),
(18, 'Nice picture Rose!', 'ahmed_faisal', 'rose_monroe', '2017-10-27 02:39:28', 'no', 7),
(19, 'Nice.', 'ahmed_faisal', 'test_user', '2017-10-27 02:40:09', 'no', 3),
(20, 'Thanks Ahmed. Just noticed you changed your profile picture too. You''re looking better than me!!!!', 'rose_monroe', 'rose_monroe', '2017-10-27 02:46:20', 'no', 7),
(21, 'Thanks Rose.', 'ahmed_faisal', 'rose_monroe', '2017-10-27 02:46:34', 'no', 7),
(22, 'Hey Rose, how are you doing?', 'ahmed_faisal', 'rose_monroe', '2017-10-27 18:01:28', 'no', 8),
(23, 'I''m doing good, thanks for asking. What about you?', 'rose_monroe', 'rose_monroe', '2017-10-27 18:02:35', 'no', 8),
(24, 'I''m doing well. Thanks for asking Rose.', 'ahmed_faisal', 'rose_monroe', '2017-10-27 18:03:08', 'no', 8);

-- --------------------------------------------------------

--
-- Table structure for table `friend_requests`
--

CREATE TABLE IF NOT EXISTS `friend_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_to` varchar(50) NOT NULL,
  `user_from` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE IF NOT EXISTS `likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(60) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `username`, `post_id`) VALUES
(1, 'robbie_jones', 1),
(2, 'john_smith', 2),
(3, 'john_smith', 1),
(4, 'test_user', 2),
(5, 'test_user', 1),
(6, 'john_smith', 3),
(7, 'ahmed_faisal', 4),
(8, 'ahmed_faisal', 3),
(9, 'ahmed_faisal', 2),
(10, 'test_user', 4),
(11, 'test_user', 3),
(12, 'ahmed_faisal', 1),
(13, 'ahmed_faisal', 6),
(14, 'john_smith', 6),
(15, 'robbie_jones', 6),
(16, 'robbie_jones', 4),
(17, 'bob_smith', 6),
(18, 'test_user', 6),
(19, 'ahmed_faisal', 7),
(20, 'test_user', 7),
(21, 'john_smith', 7),
(22, 'ahmed_faisal', 8);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_to` varchar(50) NOT NULL,
  `user_from` varchar(50) NOT NULL,
  `body` text NOT NULL,
  `date` datetime NOT NULL,
  `opened` varchar(3) NOT NULL,
  `viewed` varchar(3) NOT NULL,
  `deleted` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_to`, `user_from`, `body`, `date`, `opened`, `viewed`, `deleted`) VALUES
(1, 'ahmed_faisal', 'test_user', 'Hey Ahmed, how are you?', '2017-10-27 02:15:17', 'yes', 'yes', 'no'),
(2, 'test_user', 'ahmed_faisal', 'I''m doing well, thanks for asking. What about you?', '2017-10-27 02:15:38', 'yes', 'yes', 'no'),
(3, 'ahmed_faisal', 'test_user', 'I''m just about to get on the bus. Just finished work.', '2017-10-27 02:17:53', 'yes', 'yes', 'no'),
(4, 'test_user', 'ahmed_faisal', 'Nice. Same here. How was your day?', '2017-10-27 02:18:23', 'yes', 'yes', 'no'),
(5, 'ahmed_faisal', 'test_user', 'It was pretty good. I had a productive day today and my boss was very pleased with me.', '2017-10-27 02:19:27', 'yes', 'yes', 'no'),
(6, 'test_user', 'ahmed_faisal', 'That''s good to hear. I''m just on my break right now. I signed up for overtime.', '2017-10-27 02:20:13', 'yes', 'yes', 'no'),
(7, 'test_user', 'ahmed_faisal', 'Looks like I only have a few minutes left on my break, so I will talk to you later.', '2017-10-27 02:20:29', 'yes', 'yes', 'no'),
(8, 'test_user', 'ahmed_faisal', 'Bye now.', '2017-10-27 02:20:37', 'yes', 'yes', 'no'),
(9, 'ahmed_faisal', 'test_user', 'It was nice talking to you. ', '2017-10-27 02:20:52', 'yes', 'yes', 'no'),
(10, 'ahmed_faisal', 'test_user', 'Bye.', '2017-10-27 02:20:57', 'yes', 'yes', 'no'),
(11, 'robbie_jones', 'bob_smith', 'Hey Robbie, did you want to know more about programming? I could send you a few links.', '2017-10-27 02:30:58', 'yes', 'yes', 'no'),
(12, 'bob_smith', 'robbie_jones', 'That would be great Bob!', '2017-10-27 02:31:35', 'yes', 'yes', 'no'),
(13, 'rose_monroe', 'test_user', 'Hey Rose, just saw your profile picture. It looked really good.', '2017-10-27 02:47:57', 'yes', 'yes', 'no'),
(14, 'test_user', 'rose_monroe', 'Thanks!', '2017-10-27 02:48:15', 'yes', 'no', 'no'),
(15, 'test_user', 'john_smith', 'Hey, how are you doing?', '2017-10-27 02:48:51', 'yes', 'no', 'no'),
(16, 'test_user', 'john_smith', 'Hey.', '2017-12-04 11:46:27', 'no', 'no', 'no'),
(17, 'ahmed_faisal', 'john_smith', 'hey cutie\r\n', '2018-01-23 13:41:39', 'no', 'no', 'no'),
(18, 'ahmed_faisal', 'john_smith', 'hey cutie\r\n', '2018-01-23 13:41:39', 'no', 'no', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_to` varchar(50) NOT NULL,
  `user_from` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `link` varchar(100) NOT NULL,
  `datetime` datetime NOT NULL,
  `opened` varchar(3) NOT NULL,
  `viewed` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=59 ;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_to`, `user_from`, `message`, `link`, `datetime`, `opened`, `viewed`) VALUES
(1, 'bob_smith', 'robbie_jones', 'Robbie Jones commented on your post', 'post.php?id=1', '2017-10-27 01:48:08', 'yes', 'yes'),
(2, 'bob_smith', 'robbie_jones', 'Robbie Jones liked your post', 'post.php?id=1', '2017-10-27 01:48:10', 'yes', 'yes'),
(3, 'robbie_jones', 'john_smith', 'John Smith liked your post', 'post.php?id=2', '2017-10-27 02:05:12', 'yes', 'yes'),
(4, 'bob_smith', 'john_smith', 'John Smith liked your post', 'post.php?id=1', '2017-10-27 02:05:13', 'yes', 'yes'),
(5, 'robbie_jones', 'john_smith', 'John Smith commented on your post', 'post.php?id=2', '2017-10-27 02:05:26', 'yes', 'yes'),
(6, 'robbie_jones', 'test_user', 'Test User liked your post', 'post.php?id=2', '2017-10-27 02:08:59', 'yes', 'yes'),
(7, 'bob_smith', 'test_user', 'Test User liked your post', 'post.php?id=1', '2017-10-27 02:09:01', 'yes', 'yes'),
(8, 'robbie_jones', 'test_user', 'Test User commented on your post', 'post.php?id=2', '2017-10-27 02:09:13', 'yes', 'yes'),
(9, 'john_smith', 'test_user', 'Test User commented on a post you commented on', 'post.php?id=2', '2017-10-27 02:09:13', 'yes', 'yes'),
(10, 'test_user', 'john_smith', 'John Smith liked your post', 'post.php?id=3', '2017-10-27 02:10:18', 'yes', 'yes'),
(11, 'john_smith', 'ahmed_faisal', 'Ahmed Faisal liked your post', 'post.php?id=4', '2017-10-27 02:12:04', 'no', 'yes'),
(12, 'test_user', 'ahmed_faisal', 'Ahmed Faisal liked your post', 'post.php?id=3', '2017-10-27 02:12:05', 'yes', 'yes'),
(13, 'robbie_jones', 'ahmed_faisal', 'Ahmed Faisal liked your post', 'post.php?id=2', '2017-10-27 02:12:06', 'yes', 'yes'),
(14, 'john_smith', 'ahmed_faisal', 'Ahmed Faisal commented on your post', 'post.php?id=4', '2017-10-27 02:12:27', 'no', 'yes'),
(15, 'test_user', 'ahmed_faisal', 'Ahmed Faisal commented on your post', 'post.php?id=3', '2017-10-27 02:13:56', 'yes', 'yes'),
(16, 'john_smith', 'test_user', 'Test User liked your post', 'post.php?id=4', '2017-10-27 02:14:11', 'no', 'yes'),
(17, 'ahmed_faisal', 'test_user', 'Test User commented on a post you commented on', 'post.php?id=3', '2017-10-27 02:14:56', 'yes', 'yes'),
(18, 'test_user', 'ahmed_faisal', 'Ahmed Faisal commented on your post', 'post.php?id=3', '2017-10-27 02:16:04', 'yes', 'yes'),
(19, 'bob_smith', 'ahmed_faisal', 'Ahmed Faisal liked your post', 'post.php?id=1', '2017-10-27 02:16:10', 'yes', 'yes'),
(20, 'ahmed_faisal', 'test_user', 'Test User commented on a post you commented on', 'post.php?id=3', '2017-10-27 02:17:07', 'no', 'yes'),
(21, 'ahmed_faisal', 'john_smith', 'John Smith liked your post', 'post.php?id=6', '2017-10-27 02:25:46', 'yes', 'yes'),
(22, 'ahmed_faisal', 'john_smith', 'John Smith commented on your post', 'post.php?id=6', '2017-10-27 02:26:01', 'yes', 'yes'),
(23, 'ahmed_faisal', 'john_smith', 'John Smith commented on your post', 'post.php?id=6', '2017-10-27 02:26:39', 'yes', 'yes'),
(24, 'john_smith', 'ahmed_faisal', 'Ahmed Faisal commented on a post you commented on', 'post.php?id=6', '2017-10-27 02:27:10', 'yes', 'yes'),
(25, 'ahmed_faisal', 'robbie_jones', 'Robbie Jones liked your post', 'post.php?id=6', '2017-10-27 02:28:30', 'yes', 'yes'),
(26, 'john_smith', 'robbie_jones', 'Robbie Jones liked your post', 'post.php?id=4', '2017-10-27 02:28:32', 'no', 'yes'),
(27, 'ahmed_faisal', 'robbie_jones', 'Robbie Jones commented on your post', 'post.php?id=6', '2017-10-27 02:29:17', 'yes', 'yes'),
(28, 'john_smith', 'robbie_jones', 'Robbie Jones commented on a post you commented on', 'post.php?id=6', '2017-10-27 02:29:17', 'yes', 'yes'),
(29, 'ahmed_faisal', 'bob_smith', 'Bob Smith liked your post', 'post.php?id=6', '2017-10-27 02:29:47', 'yes', 'yes'),
(30, 'ahmed_faisal', 'bob_smith', 'Bob Smith commented on your post', 'post.php?id=6', '2017-10-27 02:30:29', 'yes', 'yes'),
(31, 'john_smith', 'bob_smith', 'Bob Smith commented on a post you commented on', 'post.php?id=6', '2017-10-27 02:30:29', 'yes', 'yes'),
(32, 'robbie_jones', 'bob_smith', 'Bob Smith commented on a post you commented on', 'post.php?id=6', '2017-10-27 02:30:29', 'yes', 'yes'),
(33, 'ahmed_faisal', 'robbie_jones', 'Robbie Jones commented on your post', 'post.php?id=6', '2017-10-27 02:31:25', 'yes', 'yes'),
(34, 'john_smith', 'robbie_jones', 'Robbie Jones commented on a post you commented on', 'post.php?id=6', '2017-10-27 02:31:25', 'yes', 'yes'),
(35, 'bob_smith', 'robbie_jones', 'Robbie Jones commented on a post you commented on', 'post.php?id=6', '2017-10-27 02:31:25', 'yes', 'yes'),
(36, 'ahmed_faisal', 'test_user', 'Test User liked your post', 'post.php?id=6', '2017-10-27 02:31:44', 'yes', 'yes'),
(37, 'ahmed_faisal', 'test_user', 'Test User commented on your post', 'post.php?id=6', '2017-10-27 02:32:07', 'yes', 'yes'),
(38, 'john_smith', 'test_user', 'Test User commented on a post you commented on', 'post.php?id=6', '2017-10-27 02:32:07', 'yes', 'yes'),
(39, 'robbie_jones', 'test_user', 'Test User commented on a post you commented on', 'post.php?id=6', '2017-10-27 02:32:07', 'yes', 'yes'),
(40, 'bob_smith', 'test_user', 'Test User commented on a post you commented on', 'post.php?id=6', '2017-10-27 02:32:07', 'yes', 'yes'),
(41, 'rose_monroe', 'ahmed_faisal', 'Ahmed Faisal liked your post', 'post.php?id=7', '2017-10-27 02:36:45', 'no', 'yes'),
(42, 'rose_monroe', 'test_user', 'Test User liked your post', 'post.php?id=7', '2017-10-27 02:38:05', 'no', 'yes'),
(43, 'rose_monroe', 'test_user', 'Test User commented on your post', 'post.php?id=7', '2017-10-27 02:38:13', 'no', 'yes'),
(44, 'rose_monroe', 'john_smith', 'John Smith liked your post', 'post.php?id=7', '2017-10-27 02:38:31', 'no', 'yes'),
(45, 'test_user', 'rose_monroe', 'Rose Monroe commented on a post you commented on', 'post.php?id=7', '2017-10-27 02:38:46', 'no', 'yes'),
(46, 'rose_monroe', 'ahmed_faisal', 'Ahmed Faisal commented on your post', 'post.php?id=7', '2017-10-27 02:39:28', 'no', 'no'),
(47, 'test_user', 'ahmed_faisal', 'Ahmed Faisal commented on a post you commented on', 'post.php?id=7', '2017-10-27 02:39:28', 'no', 'no'),
(48, 'test_user', 'ahmed_faisal', 'Ahmed Faisal commented on your post', 'post.php?id=3', '2017-10-27 02:40:09', 'no', 'no'),
(49, 'test_user', 'rose_monroe', 'Rose Monroe commented on a post you commented on', 'post.php?id=7', '2017-10-27 02:46:20', 'no', 'no'),
(50, 'ahmed_faisal', 'rose_monroe', 'Rose Monroe commented on a post you commented on', 'post.php?id=7', '2017-10-27 02:46:20', 'yes', 'yes'),
(51, 'rose_monroe', 'ahmed_faisal', 'Ahmed Faisal commented on your post', 'post.php?id=7', '2017-10-27 02:46:34', 'no', 'no'),
(52, 'test_user', 'ahmed_faisal', 'Ahmed Faisal commented on a post you commented on', 'post.php?id=7', '2017-10-27 02:46:34', 'no', 'no'),
(53, 'ahmed_faisal', 'rose_monroe', 'Rose Monroe liked your post', 'post.php?id=0', '2017-10-27 17:52:35', 'yes', 'yes'),
(54, 'ahmed_faisal', 'rose_monroe', 'Rose Monroe liked your post', 'post.php?id=8', '2017-10-27 17:58:35', 'yes', 'yes'),
(55, 'rose_monroe', 'ahmed_faisal', 'Ahmed Faisal liked your post', 'post.php?id=8', '2017-10-27 18:01:21', 'no', 'no'),
(56, 'rose_monroe', 'ahmed_faisal', 'Ahmed Faisal commented on your post', 'post.php?id=8', '2017-10-27 18:01:28', 'no', 'no'),
(57, 'ahmed_faisal', 'rose_monroe', 'Rose Monroe commented on your profile post', 'post.php?id=8', '2017-10-27 18:02:35', 'yes', 'yes'),
(58, 'rose_monroe', 'ahmed_faisal', 'Ahmed Faisal commented on your post', 'post.php?id=8', '2017-10-27 18:03:08', 'no', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body` text NOT NULL,
  `added_by` varchar(60) NOT NULL,
  `user_to` varchar(60) NOT NULL,
  `date_added` datetime NOT NULL,
  `user_closed` varchar(3) NOT NULL,
  `deleted` varchar(3) NOT NULL,
  `likes` int(11) NOT NULL,
  `image` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `body`, `added_by`, `user_to`, `date_added`, `user_closed`, `deleted`, `likes`, `image`) VALUES
(1, 'Hey Everyone! Halloween is right around the corner. Hope Everyone Enjoys!', 'bob_smith', 'none', '2017-10-27 01:47:24', 'no', 'no', 4, 'assets/images/posts/59f2c86c6a079halo.jpg'),
(2, 'Life is great.', 'robbie_jones', 'none', '2017-10-27 02:05:05', 'no', 'no', 3, ''),
(3, 'How is everyone? I''m on my way to work right now. Just boarding the train!', 'test_user', 'none', '2017-10-27 02:08:42', 'no', 'no', 3, 'assets/images/posts/59f2cd6aef500ttc.jpg'),
(4, 'Love my office!!!!', 'john_smith', 'none', '2017-10-27 02:10:41', 'no', 'no', 3, 'assets/images/posts/59f2cde125a7doffice.jpeg'),
(5, 'Hey everyone, just found this video on artificial intelligence. It''s actually really interesting to see how our world is changing and we have the ability to teach machines how to solve problems. Do watch it on your free <br><iframe width=''420'' height=''315'' src=''time.\r\n\r\nhttps://www.youtube.com/embed/cwBAOjCVfxg''></iframe><br>', 'ahmed_faisal', 'none', '2017-10-27 02:24:04', 'no', 'yes', 0, ''),
(6, '<br><iframe width=''420'' height=''315'' src=''https://www.youtube.com/embed/cwBAOjCVfxg''></iframe><br>', 'ahmed_faisal', 'none', '2017-10-27 02:25:15', 'no', 'no', 5, ''),
(7, 'My new Profile Picture!', 'rose_monroe', 'none', '2017-10-27 02:36:28', 'no', 'no', 3, 'assets/images/posts/59f2d3ece5cc4girl.png'),
(8, 'Hey Ahmed!', 'rose_monroe', 'ahmed_faisal', '2017-10-27 17:58:35', 'no', 'no', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `trends`
--

CREATE TABLE IF NOT EXISTS `trends` (
  `title` varchar(50) NOT NULL,
  `hits` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trends`
--

INSERT INTO `trends` (`title`, `hits`) VALUES
('Halloween', 1),
('Corner', 1),
('Hope', 1),
('Enjoys', 1),
('Life', 1),
('Boarding', 1),
('Train', 1),
('Love', 1),
('Office', 1),
('Profile', 1),
('Picture', 1),
('Ahmed', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `signup_date` date NOT NULL,
  `profile_pic` varchar(255) NOT NULL,
  `num_posts` int(11) NOT NULL,
  `num_likes` int(11) NOT NULL,
  `user_closed` varchar(3) NOT NULL,
  `friend_array` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `user_name`, `email`, `password`, `signup_date`, `profile_pic`, `num_posts`, `num_likes`, `user_closed`, `friend_array`) VALUES
(1, 'Test', 'User', 'test_user', 'Testuser@hotmail.com', '5d9c68c6c50ed3d02a2fcf54f63993b6', '2017-10-27', 'assets/images/profile_pics/test_userabbe61cbf420f8d7784703b2569bcd3fn.jpeg', 1, 3, 'no', ',ahmed_faisal,john_smith,bob_smith,robbie_jones,rose_monroe,'),
(2, 'Ahmed', 'Faisal', 'ahmed_faisal', 'Ahmed.46@hotmail.com', '05b8c74cbd96fbf2de4c1a352702fbf4', '2017-10-27', 'assets/images/profile_pics/ahmed_faisal171ef7c928e4af659cbc8034beb83b19n.jpeg', 2, 5, 'no', ',test_user,john_smith,robbie_jones,bob_smith,rose_monroe,'),
(3, 'John', 'Smith', 'john_smith', 'Johnsmith@hotmail.com', '05b8c74cbd96fbf2de4c1a352702fbf4', '2017-10-27', 'assets/images/profile_pics/john_smithd48c64444fa539092e33d352b62b4c3an.jpeg', 1, 3, 'no', ',ahmed_faisal,bob_smith,robbie_jones,test_user,rose_monroe,'),
(4, 'Bob', 'Smith', 'bob_smith', 'Bobsmith@hotmail.com', '05b8c74cbd96fbf2de4c1a352702fbf4', '2017-10-27', 'assets/images/profile_pics/bob_smithdcc342d3d665eb952debc99d895b87bbn.jpeg', 1, 4, 'no', ',ahmed_faisal,john_smith,test_user,robbie_jones,rose_monroe,'),
(5, 'Robbie', 'Jones', 'robbie_jones', 'Robbiejones@hotmail.com', '05b8c74cbd96fbf2de4c1a352702fbf4', '2017-10-27', 'assets/images/profile_pics/robbie_jones184afad60bc960ff886e9d61ef2491d6n.jpeg', 1, 3, 'no', ',ahmed_faisal,john_smith,test_user,bob_smith,rose_monroe,'),
(6, 'Rose', 'Monroe', 'rose_monroe', 'Rosemonroe@hotmail.com', '05b8c74cbd96fbf2de4c1a352702fbf4', '2017-10-27', 'assets/images/profile_pics/rose_monroe6dc8a8283e862b933eaba76cfdb60c00n.jpeg', 3, 4, 'no', ',ahmed_faisal,test_user,john_smith,robbie_jones,bob_smith,');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
