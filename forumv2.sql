-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Feb 03, 2020 at 09:47 AM
-- Server version: 10.3.21-MariaDB-1:10.3.21+maria~bionic
-- PHP Version: 7.2.24-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `forumv2`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentable_id` int(11) NOT NULL,
  `commentable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `content`, `commentable_id`, `commentable_type`, `created_at`, `updated_at`) VALUES
(1, 1, 'sdfsdfdsf', 6, 'App\\Forum', '2020-01-29 23:46:20', '2020-01-29 23:46:20'),
(2, 1, 'Komentar komenadsfasdfadfs', 1, 'App\\Forum', '2020-01-30 00:50:45', '2020-01-30 00:50:45'),
(3, 1, 'asdfasdfa', 2, 'App\\Forum', '2020-01-31 20:26:05', '2020-01-31 20:26:05'),
(4, 3, 'You will need to use the HTML character entities, for example &gt; for > and &lt; for <. Here is a reference chart for most of them: https://dev.w3.org/html5/html-author/charref', 8, 'App\\Forum', '2020-02-02 08:16:36', '2020-02-02 08:16:36'),
(5, 2, 'Probably not a good idea to store computation result as code & then import it from elsewhere. You should use a proper data format to store the results - and import it as data. Use JSON or pickle etc.  However, if you do want to shoot yourself in the foot, Python gives you the tools to do that:  Let\'s say i have some code in a file temp.txt  number3=30  def f():     return \'method\'  Then you can do this:  with open(\'temp.txt\') as f:     code = f.read()     exec(code)  print(number3) print(f())  Which outputs:  30 method', 9, 'App\\Forum', '2020-02-02 08:22:50', '2020-02-02 08:22:50'),
(6, 3, 'You should use it if your encoding does not implement the full ASCII repertoire:      C derived its repertoire from the ASCII codeset. Unfortunately the ASCII repertoire is not a subset of all other commonly used character sets, and widespread practice in Europe is not to implement all of ASCII either, but use some parts of its collating sequence for special national characters.      The solution is an internationally agreed-upon repertoire, in terms of which an international representation of C can be defined. The ISO has defined such a standard: ISO 646 describes an invariant subset of ASCII.      The characters in the ASCII repertoire used by C and absent from the ISO 646 repertoire are:          # [ ] { } \\ | ~ ^  Taken from the ANSI C Rationale, [2.2.1.1 Trigraph sequences]  As pointed out by @chqrlie, this was a important to take into consideration in the 1980s but much less relevant today.  This is also the reason trigraphs were introduced (explained further along in the same section). As such when a non-ASCII encoding is used, the macros are replaced by their trigraph versions in iso646.h.', 13, 'App\\Forum', '2020-02-02 08:29:40', '2020-02-02 08:29:40'),
(7, 2, 'Your code exposes one of the very subtle differences in C between an array and a pointer. The line:  char *A = \"This is a destination sentence\";  declares A as a pointer to a character (string) and then initialises that pointer to the address of a string literal. This string literal is a constant value, and the compiler is allowed to place this in an area of memory that is read-only. Then, when you pass that memory to the ft_strncpy function (via its address), you are attempting to modify that read-only memory.  If you, instead, use the following:  char A[] = \"This is a destination sentence\";  then you are declaring A as an array of characters and initializing that array with the data from the string literal. Thus, the compiler is now aware that the array is modifiable (you haven\'t included a const qualifier) and will place that array in memory that can be read from and written to.', 14, 'App\\Forum', '2020-02-02 08:31:54', '2020-02-02 08:31:54'),
(8, 4, 'You have a point, but I fail to detect the very subtle difference between char *A and char *A', 14, 'App\\Forum', '2020-02-02 08:35:23', '2020-02-02 08:35:23');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `forums`
--

CREATE TABLE `forums` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forums`
--

INSERT INTO `forums` (`id`, `user_id`, `title`, `slug`, `description`, `image`, `created_at`, `updated_at`) VALUES
(7, 2, 'min-height: 100% doesn\'t seem to work, div does not take full height', 'min-height-100-doesnt-seem-to-work-div-does-not-take-full-height', '<div class=\"post-text\">\r\n<p>I have a <a href=\"https://codepen.io/Ciwan/pen/yLymbNb\" rel=\"nofollow noreferrer\">codepen</a> to make things easier.</p>\r\n<p><strong>HTML</strong></p>\r\n<pre class=\"default prettyprint prettyprinted\"><code><span class=\"tag\">&lt;div</span> <span class=\"atn\">class</span><span class=\"pun\">=</span><span class=\"atv\">\"main-app\"</span><span class=\"tag\">&gt;</span>\r\n  <span class=\"tag\">&lt;header&gt;</span><span class=\"pln\">Header</span><span class=\"tag\">&lt;/header&gt;</span>\r\n  <span class=\"tag\">&lt;main&gt;</span><span class=\"pln\">Main</span><span class=\"tag\">&lt;/main&gt;</span>\r\n  <span class=\"tag\">&lt;footer&gt;</span><span class=\"pln\">Footer</span><span class=\"tag\">&lt;/footer&gt;</span>\r\n<span class=\"tag\">&lt;/div&gt;</span></code></pre>\r\n<p><strong>CSS</strong></p>\r\n<pre class=\"default prettyprint prettyprinted\"><code><span class=\"pln\">html </span><span class=\"pun\">{</span><span class=\"pln\">\r\n  height</span><span class=\"pun\">:</span> <span class=\"lit\">100</span><span class=\"pun\">%;</span>\r\n<span class=\"pun\">}</span><span class=\"pln\">\r\n\r\nbody </span><span class=\"pun\">{</span><span class=\"pln\">\r\n  min</span><span class=\"pun\">-</span><span class=\"pln\">height</span><span class=\"pun\">:</span> <span class=\"lit\">100</span><span class=\"pun\">%;</span><span class=\"pln\">\r\n  padding</span><span class=\"pun\">:</span> <span class=\"lit\">1.25em</span><span class=\"pun\">;</span><span class=\"pln\">\r\n  background</span><span class=\"pun\">-</span><span class=\"pln\">color</span><span class=\"pun\">:</span> <span class=\"com\">#292c37;</span><span class=\"pln\">\r\n  border</span><span class=\"pun\">:</span> <span class=\"lit\">1px</span><span class=\"pln\"> solid red</span><span class=\"pun\">;</span>\r\n<span class=\"pun\">}</span>\r\n\r\n<span class=\"pun\">.</span><span class=\"pln\">main</span><span class=\"pun\">-</span><span class=\"pln\">app </span><span class=\"pun\">{</span><span class=\"pln\">\r\n  min</span><span class=\"pun\">-</span><span class=\"pln\">height</span><span class=\"pun\">:</span> <span class=\"lit\">100</span><span class=\"pun\">%;</span><span class=\"pln\">\r\n  display</span><span class=\"pun\">:</span><span class=\"pln\"> grid</span><span class=\"pun\">;</span><span class=\"pln\">\r\n  grid</span><span class=\"pun\">-</span><span class=\"kwd\">template</span><span class=\"pun\">-</span><span class=\"pln\">rows</span><span class=\"pun\">:</span> <span class=\"kwd\">auto</span> <span class=\"lit\">1fr</span> <span class=\"kwd\">auto</span><span class=\"pun\">;</span><span class=\"pln\">\r\n  border</span><span class=\"pun\">:</span> <span class=\"lit\">1px</span><span class=\"pln\"> solid green</span><span class=\"pun\">;</span>\r\n<span class=\"pun\">}</span><span class=\"pln\">\r\n\r\nheader </span><span class=\"pun\">{</span><span class=\"pln\">\r\n  background</span><span class=\"pun\">-</span><span class=\"pln\">color</span><span class=\"pun\">:</span><span class=\"pln\"> wheat</span><span class=\"pun\">;</span>\r\n<span class=\"pun\">}</span><span class=\"pln\">\r\n\r\nmain </span><span class=\"pun\">{</span><span class=\"pln\">\r\n  background</span><span class=\"pun\">-</span><span class=\"pln\">color</span><span class=\"pun\">:</span><span class=\"pln\"> firebrick</span><span class=\"pun\">;</span>\r\n<span class=\"pun\">}</span><span class=\"pln\">\r\n\r\nfooter </span><span class=\"pun\">{</span><span class=\"pln\">\r\n  background</span><span class=\"pun\">-</span><span class=\"pln\">color</span><span class=\"pun\">:</span><span class=\"pln\"> skyblue</span><span class=\"pun\">;</span>\r\n<span class=\"pun\">}</span><span class=\"pln\">\r\n\r\nheader</span><span class=\"pun\">,</span><span class=\"pln\"> main</span><span class=\"pun\">,</span><span class=\"pln\"> footer </span><span class=\"pun\">{</span><span class=\"pln\">\r\n  padding</span><span class=\"pun\">:</span> <span class=\"lit\">1.25em</span><span class=\"pun\">;</span>\r\n<span class=\"pun\">}</span></code></pre>\r\n<p>I would like <code>.main-app</code> to take the full available height but as you can see it doesn\'t do it for some reason.</p>\r\n<p>What am I doing wrong?</p>\r\n</div>', NULL, '2020-02-02 08:11:40', '2020-02-02 08:11:40'),
(8, 2, 'How do you break out of HTML Syntax?', 'how-do-you-break-out-of-html-syntax', '<p>I am trying to write a programming tutorial for the C programming language. I want to show a code example that imports. I have used the <code>&lt;code&gt;</code> tag to denote code, however HTML treats the import statements in the code itself as tags due to the &lt;&gt; characters.</p>\r\n<p><strong>HTML Fragment</strong></p>\r\n<pre class=\"default prettyprint prettyprinted\"><code><span class=\"tag\">&lt;code&gt;</span><span class=\"pln\">\r\n#include </span><span class=\"tag\">&lt;stdlib.h&gt;</span><span class=\"pln\">\r\n#include </span><span class=\"tag\">&lt;stdio.h&gt;</span>\r\n<span class=\"tag\">&lt;/code&gt;</span></code></pre>', '1580656446.png', '2020-02-02 08:14:06', '2020-02-02 08:14:06'),
(9, 4, 'Python 3.7 - Save and import a file holding Python variables', 'python-37-save-and-import-a-file-holding-python-variables', '<div class=\"post-text\">\r\n<p>This seems like a pretty obvious/dumb question, but there are a few specifications that make this a bit harder.</p>\r\n<p>Let\'s say I have a program that takes 3 numbers from a user and does mathematical processes to them to get outputs. Then I <code>open(\"file\", \"r\")</code> to write those variables to a file.</p>\r\n<p>Then, let\'s say another program then <code>import</code>s them and uses them for other processes. I need to be able to import that <code>file</code> as Python code. To be clear: <strong>I am not saving text, I am saving python code to a file that is not a .py file.</strong></p>\r\n<p>Is there any way to save and import Python code to and from a non-<code>.py</code> file? And how?</p>\r\n<p><strong>EDIT:</strong> In the file I\'m saving and importing, I\'m also saving Python functions. I cannot simply save the variables themselves; I need the variable names, values, and python functions to be saved as normal text in a file, but when I import the file, it should be parsed as Python code.</p>\r\n</div>', NULL, '2020-02-02 08:19:05', '2020-02-02 08:19:05'),
(10, 2, 'how to install numpy for already installed python 3.8.1 on ubuntu 18.04', 'how-to-install-numpy-for-already-installed-python-381-on-ubuntu-1804', '<div class=\"post-text\">\r\n<p>I have three versions of python 2.7 , 3.6 and 3.8. I installed \"numpy\" on 3.8 many times but does not work on jupyter notebook. Any thing will be great help because i have a task to submit tonight</p>\r\n<pre class=\"lang-py prettyprint prettyprinted\"><code><span class=\"pln\">linux commands \r\n</span><span class=\"pun\">&gt;</span><span class=\"pln\"> sudo apt update\r\n</span><span class=\"pun\">&gt;</span><span class=\"pln\"> sudo </span><span class=\"pun\">-</span><span class=\"pln\">H pip3 install </span><span class=\"pun\">--</span><span class=\"pln\">upgrade pip\r\n</span><span class=\"pun\">&gt;</span><span class=\"pln\"> sudo </span><span class=\"pun\">-</span><span class=\"pln\">H pip3 install virtualenv\r\n</span><span class=\"pun\">&gt;</span><span class=\"pln\"> mkdir </span><span class=\"pun\">~/</span><span class=\"pln\">my_project_dir\r\n</span><span class=\"pun\">&gt;</span><span class=\"pln\"> cd </span><span class=\"pun\">~/</span><span class=\"pln\">my_project_dir</span></code></pre>\r\n<blockquote>\r\n<p>and here i ran a single command to install jupyter notebook , which i forgot but it was suggested to me by the terminal</p>\r\n</blockquote>\r\n</div>', NULL, '2020-02-02 08:24:35', '2020-02-02 08:24:35'),
(11, 2, 'Linux Scripting using .sh. How to capture users passwords?', 'linux-scripting-using-sh-how-to-capture-users-passwords', '<p>i have trying to create a simple app using Linux Scripting language with the file type .sh. The app is required to capture the passwords of users from the keyboard immediately the sign in to any website or system that requires a password. As the user completes signing in his/her are password is automatically saved in the .sh app.</p>', NULL, '2020-02-02 08:26:23', '2020-02-02 08:26:23'),
(12, 2, 'ESP32 - Light Sleep Mode (Extended Battery Life)', 'esp32-light-sleep-mode-extended-battery-life', '<div class=\"post-text\">\r\n<p>I have been attempting to put the ESP32 device into sleep mode when it\'s not being used. Wake up from <strong>GPIO</strong> pins once a button is pressed. I have got a deep sleep function to work but having trouble with the <strong>Light Sleep</strong> mode in <strong>javascript</strong>. As I would like the device to wakeup in intervals to check the system and to accept any commands through WiFi.</p>\r\n<p>I would like to test this in Mongoose OS.</p>\r\n</div>', NULL, '2020-02-02 08:26:57', '2020-02-02 08:26:57'),
(13, 2, 'When do I need to use the alternative macros for bitwise and logical operators inside the header file of iso646.h?', 'when-do-i-need-to-use-the-alternative-macros-for-bitwise-and-logical-operators-inside-the-header-file-of-iso646h', '<div class=\"post-text\">\r\n<p>I know that in the header of <code>iso646.h</code>, the following eleven marco constants are defined to provide alternative descriptions of the bitwise and logical operators:</p>\r\n<p><code>and</code> is a macro for <code>&amp;&amp;</code>.</p>\r\n<p><code>and_eq</code> is a macro for <code>&amp;=</code>.</p>\r\n<p><code>bitand</code> is a macro for <code>&amp;</code>.</p>\r\n<p><code>bitor</code> is a macro for <code>|</code>.</p>\r\n<p><code>compl</code> is a macro for <code>~</code>.</p>\r\n<p><code>not</code> is a macro for <code>!</code>.</p>\r\n<p><code>not_eq</code> is a macro for <code>!=</code>.</p>\r\n<p><code>or</code> is a macro for <code>||</code>.</p>\r\n<p><code>or_eq</code> is a macro for <code>|=</code></p>\r\n<p><code>xor</code> is a macro for <code>^</code>.</p>\r\n<p><code>xor_eq</code> is a macro for <code>^=</code>.</p>\r\n<hr />\r\n<p>But when do I need to use these alternative macros?</p>\r\n<ul>\r\n<li>Under which circumstances do I need to use the alternative macros for bitwise and logical operators inside of the header file of <code>iso646.h</code>?</li>\r\n</ul>\r\n</div>', NULL, '2020-02-02 08:28:25', '2020-02-02 08:28:25'),
(14, 3, 'I wanna make strncpy function directly, can you review my code? There is bus Error', 'i-wanna-make-strncpy-function-directly-can-you-review-my-code-there-is-bus-error', '<div class=\"post-text\">\r\n<p>I wanna Make <code>strncpy</code> function by code, not by using Library or Header</p>\r\n<p>but There is zsh bus error..... What\'s wrong with my code? What\'s the zsh bus error??</p>\r\n<pre class=\"lang-c prettyprint prettyprinted\"><code><span class=\"com\">#include</span> <span class=\"str\">&lt;stdio.h&gt;</span>\r\n<span class=\"com\">#include</span> <span class=\"str\">&lt;string.h&gt;</span>\r\n\r\n<span class=\"kwd\">char</span>    <span class=\"pun\">*</span><span class=\"pln\">ft_strncpy</span><span class=\"pun\">(</span><span class=\"kwd\">char</span> <span class=\"pun\">*</span><span class=\"pln\">dest</span><span class=\"pun\">,</span> <span class=\"kwd\">char</span> <span class=\"pun\">*</span><span class=\"pln\">src</span><span class=\"pun\">,</span> <span class=\"kwd\">unsigned</span> <span class=\"typ\">int</span><span class=\"pln\"> n</span><span class=\"pun\">)</span>\r\n<span class=\"pun\">{</span>\r\n    <span class=\"kwd\">unsigned</span> <span class=\"typ\">int</span><span class=\"pln\">    i</span><span class=\"pun\">;</span><span class=\"pln\">\r\n\r\n    i </span><span class=\"pun\">=</span> <span class=\"lit\">0</span><span class=\"pun\">;</span>\r\n    <span class=\"kwd\">while</span> <span class=\"pun\">(</span><span class=\"pln\">i </span><span class=\"pun\">&lt;</span><span class=\"pln\"> n </span><span class=\"pun\">&amp;&amp;</span><span class=\"pln\"> src</span><span class=\"pun\">[</span><span class=\"pln\">i</span><span class=\"pun\">])</span>\r\n    <span class=\"pun\">{</span><span class=\"pln\">\r\n        dest</span><span class=\"pun\">[</span><span class=\"pln\">i</span><span class=\"pun\">]</span> <span class=\"pun\">=</span><span class=\"pln\"> src</span><span class=\"pun\">[</span><span class=\"pln\">i</span><span class=\"pun\">];</span><span class=\"pln\">\r\n        i</span><span class=\"pun\">++;</span>\r\n    <span class=\"pun\">}</span>\r\n    <span class=\"kwd\">while</span> <span class=\"pun\">(</span><span class=\"pln\">i </span><span class=\"pun\">&lt;</span><span class=\"pln\"> n</span><span class=\"pun\">)</span>\r\n    <span class=\"pun\">{</span><span class=\"pln\">\r\n        dest</span><span class=\"pun\">[</span><span class=\"pln\">i</span><span class=\"pun\">]</span> <span class=\"pun\">=</span> <span class=\"str\">\'\\0\'</span><span class=\"pun\">;</span><span class=\"pln\">\r\n        i</span><span class=\"pun\">++;</span>\r\n    <span class=\"pun\">}</span>\r\n    <span class=\"kwd\">return</span> <span class=\"pun\">(</span><span class=\"pln\">dest</span><span class=\"pun\">);</span>\r\n<span class=\"pun\">}</span>\r\n\r\n<span class=\"typ\">int</span><span class=\"pln\"> main</span><span class=\"pun\">()</span>\r\n<span class=\"pun\">{</span>\r\n    <span class=\"kwd\">char</span>         <span class=\"pun\">*</span><span class=\"pln\">A </span><span class=\"pun\">=</span> <span class=\"str\">\"This is a destination sentence\"</span><span class=\"pun\">;</span>\r\n    <span class=\"kwd\">char</span>         <span class=\"pun\">*</span><span class=\"pln\">B </span><span class=\"pun\">=</span> <span class=\"str\">\"abcd\"</span><span class=\"pun\">;</span>\r\n    <span class=\"kwd\">unsigned</span> <span class=\"typ\">int</span><span class=\"pln\">  n </span><span class=\"pun\">=</span> <span class=\"lit\">3</span><span class=\"pun\">;</span><span class=\"pln\">\r\n\r\n    printf</span><span class=\"pun\">(</span><span class=\"str\">\"%s\"</span><span class=\"pun\">,</span><span class=\"pln\"> ft_strncpy</span><span class=\"pun\">(</span><span class=\"pln\">A</span><span class=\"pun\">,</span><span class=\"pln\"> B</span><span class=\"pun\">,</span><span class=\"pln\"> n</span><span class=\"pun\">));</span>\r\n<span class=\"pun\">}</span></code></pre>\r\n</div>', NULL, '2020-02-02 08:30:36', '2020-02-02 08:30:36');

-- --------------------------------------------------------

--
-- Table structure for table `forum_tag`
--

CREATE TABLE `forum_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `forum_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forum_tag`
--

INSERT INTO `forum_tag` (`id`, `forum_id`, `tag_id`) VALUES
(1, 2, 1),
(2, 3, 1),
(3, 3, 2),
(4, 4, 1),
(5, 4, 2),
(6, 5, 1),
(7, 5, 2),
(8, 6, 1),
(9, 7, 4),
(10, 7, 5),
(11, 8, 4),
(12, 9, 9),
(13, 10, 9),
(14, 11, 10),
(15, 12, 2),
(16, 13, 7),
(17, 14, 7);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_01_19_000828_create_forums_table', 2),
(5, '2020_01_20_092730_create_tags_table', 3),
(6, '2020_01_20_092815_create_forum_tag_table', 3),
(7, '2020_01_27_134617_create_comments_table', 4),
(8, '2020_01_30_070516_create_views_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'PHP', 'php', NULL, NULL),
(2, 'Javascript', 'javascript', NULL, NULL),
(4, 'HTML', 'html', NULL, NULL),
(5, 'CSS', 'css', NULL, NULL),
(6, 'Laravel', 'laravel', NULL, NULL),
(7, 'C', 'c', NULL, NULL),
(8, 'C++', 'cplus', NULL, NULL),
(9, 'Python 3', 'python3', NULL, NULL),
(10, 'Linux', 'linux', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'User1', 'user1@user.com', NULL, '$2y$10$a7coj4xUWlkXyTkiSZVkTujKVvrGmGPSxbORBrY5CDvBgn9hkbUPK', NULL, '2020-02-01 03:09:50', '2020-02-01 03:09:50'),
(3, 'User 2', 'user2@user.com', NULL, '$2y$10$wc64pod1/8fX8w14/Xcngu0WCTvQ0ZU6wIfLwurqosov7Z3fK26sS', NULL, '2020-02-02 08:15:20', '2020-02-02 08:15:20'),
(4, 'User 3', 'user3@user.com', NULL, '$2y$10$mYwtQcPfWz2etvG0E4LXeuIdpAiawfYmpps06jTpl8BLIkQ3p7sWm', NULL, '2020-02-02 08:17:13', '2020-02-02 08:17:13'),
(5, 'User 4', 'user4@user.com', NULL, '$2y$10$xGezrdzTqk4PbnB9SFPEa.DfZJESXMQcIreplUFYtYNFlaqC5Z60q', NULL, '2020-02-02 18:32:09', '2020-02-02 18:32:09');

-- --------------------------------------------------------

--
-- Table structure for table `views`
--

CREATE TABLE `views` (
  `id` int(10) UNSIGNED NOT NULL,
  `viewable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `viewable_id` bigint(20) UNSIGNED NOT NULL,
  `visitor` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `viewed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `views`
--

INSERT INTO `views` (`id`, `viewable_type`, `viewable_id`, `visitor`, `collection`, `viewed_at`) VALUES
(1, 'App\\Forum', 6, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-01-30 00:29:58'),
(2, 'App\\Forum', 1, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-01-30 00:30:28'),
(3, 'App\\Forum', 5, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-01-30 00:31:02'),
(4, 'App\\Forum', 1, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-01-30 00:31:12'),
(5, 'App\\Forum', 1, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-01-30 00:42:30'),
(6, 'App\\Forum', 1, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-01-30 00:42:30'),
(7, 'App\\Forum', 1, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-01-30 00:42:37'),
(8, 'App\\Forum', 1, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-01-30 00:42:37'),
(9, 'App\\Forum', 1, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-01-30 00:43:03'),
(10, 'App\\Forum', 1, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-01-30 00:43:08'),
(11, 'App\\Forum', 1, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-01-30 00:47:05'),
(12, 'App\\Forum', 6, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-01-30 00:47:10'),
(13, 'App\\Forum', 1, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-01-30 00:47:42'),
(14, 'App\\Forum', 1, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-01-30 00:50:20'),
(15, 'App\\Forum', 1, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-01-30 00:50:35'),
(16, 'App\\Forum', 1, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-01-30 00:50:45'),
(17, 'App\\Forum', 3, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-01-30 00:54:07'),
(18, 'App\\Forum', 2, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-01-31 20:25:41'),
(19, 'App\\Forum', 2, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-01-31 20:26:01'),
(20, 'App\\Forum', 2, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-01-31 20:26:05'),
(21, 'App\\Forum', 2, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-01-31 20:27:57'),
(22, 'App\\Forum', 2, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-01-31 20:28:20'),
(23, 'App\\Forum', 2, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-01-31 20:29:55'),
(24, 'App\\Forum', 2, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-01-31 20:43:36'),
(25, 'App\\Forum', 2, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-01-31 20:43:45'),
(26, 'App\\Forum', 1, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-01-31 21:00:38'),
(27, 'App\\Forum', 1, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-01-31 21:01:07'),
(28, 'App\\Forum', 1, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-01-31 21:01:12'),
(29, 'App\\Forum', 1, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-01-31 21:22:38'),
(30, 'App\\Forum', 1, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-01-31 21:22:54'),
(31, 'App\\Forum', 1, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-01-31 21:23:36'),
(32, 'App\\Forum', 1, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-01-31 21:24:32'),
(33, 'App\\Forum', 1, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-01-31 21:25:45'),
(34, 'App\\Forum', 3, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-02-01 02:55:46'),
(35, 'App\\Forum', 1, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-02-02 01:37:31'),
(36, 'App\\Forum', 1, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-02-02 01:38:34'),
(37, 'App\\Forum', 8, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-02-02 08:14:17'),
(38, 'App\\Forum', 8, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-02-02 08:16:17'),
(39, 'App\\Forum', 8, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-02-02 08:16:37'),
(40, 'App\\Forum', 9, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-02-02 08:19:16'),
(41, 'App\\Forum', 9, '5HxQM7H6Hp9xESlOrVrtAlxRK8dvV45Ddnr324LRo78cgYtKzEPC4VKUnp3RxQUJIEhQZH1d1YSCeYzb', NULL, '2020-02-02 08:20:26'),
(42, 'App\\Forum', 9, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-02-02 08:21:36'),
(43, 'App\\Forum', 9, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-02-02 08:22:45'),
(44, 'App\\Forum', 9, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-02-02 08:22:50'),
(45, 'App\\Forum', 10, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-02-02 08:24:49'),
(46, 'App\\Forum', 13, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-02-02 08:29:24'),
(47, 'App\\Forum', 13, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-02-02 08:29:25'),
(48, 'App\\Forum', 13, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-02-02 08:29:40'),
(49, 'App\\Forum', 14, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-02-02 08:31:33'),
(50, 'App\\Forum', 14, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-02-02 08:31:54'),
(51, 'App\\Forum', 7, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-02-02 08:32:20'),
(52, 'App\\Forum', 14, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-02-02 08:34:07'),
(53, 'App\\Forum', 14, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-02-02 08:35:00'),
(54, 'App\\Forum', 14, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-02-02 08:35:23'),
(55, 'App\\Forum', 14, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-02-02 08:37:02'),
(56, 'App\\Forum', 8, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-02-02 19:03:09'),
(57, 'App\\Forum', 7, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-02-02 19:07:21'),
(58, 'App\\Forum', 11, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-02-02 19:08:23'),
(59, 'App\\Forum', 11, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-02-02 19:08:40'),
(60, 'App\\Forum', 11, 'Ab4WFEB4NkKxo42OtdVAmNO0u8I5arX78XdmuqyofIPayCVm1h8j01dEyOfG8TcYFdQJlrjhR5C5Z3Gc', NULL, '2020-02-02 19:10:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forums`
--
ALTER TABLE `forums`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forum_tag`
--
ALTER TABLE `forum_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `views`
--
ALTER TABLE `views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `views_viewable_type_viewable_id_index` (`viewable_type`,`viewable_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `forums`
--
ALTER TABLE `forums`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `forum_tag`
--
ALTER TABLE `forum_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `views`
--
ALTER TABLE `views`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
