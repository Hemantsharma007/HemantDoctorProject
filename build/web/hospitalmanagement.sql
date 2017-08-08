-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2017 at 07:14 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospitalmanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_table`
--

CREATE TABLE `admin_table` (
  `Name` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_table`
--

INSERT INTO `admin_table` (`Name`, `Password`) VALUES
('Admin', 'Admin@123');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `Fees` varchar(100) DEFAULT NULL,
  `Dname` varchar(100) DEFAULT NULL,
  `Department` varchar(100) DEFAULT NULL,
  `Degree` varchar(100) DEFAULT NULL,
  `Gender` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `Fees`, `Dname`, `Department`, `Degree`, `Gender`) VALUES
(1, '500', 'Dr. Dharmesh', 'Ayurveda', 'B.A.M.S.', 'Male'),
(2, '800', 'Dr. Smith', 'Dentist', 'D.D.S', 'Male'),
(3, '1000', 'Dr. Shashi', 'Cardiology', 'M.D.', 'Male'),
(4, '600', 'Dr. Swasti', 'Gynecologist', 'B.Sc Nursing', 'Female'),
(5, '400', 'Dr. Mehra', 'ENT Specialist', 'M.B', 'Male'),
(6, '700', 'Dr. Sharma', 'Homeopathy', 'B.H.M.S', 'Male'),
(7, '500', 'Dr. Sneha', 'Radiology', 'RADIOGRAPHY', 'Female'),
(8, '400', 'Dr. Gaurav', 'General Physician', 'B.M.B.S', 'Male'),
(9, '1200', 'Dr. Trump', 'veterinary physician', 'D.V.M', 'Male'),
(10, '1500', 'Dr. Neha', 'Physiotherapy', 'B.P.T', 'Female'),
(11, '800', 'Dr. Bansal', 'Obstetrician', 'OB-GYN', 'Male'),
(12, '1000', 'Dr. Kiran', 'Neurology', 'Neurologist', 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `dept`
--

CREATE TABLE `dept` (
  `deptid` int(11) NOT NULL,
  `deptName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dept`
--

INSERT INTO `dept` (`deptid`, `deptName`) VALUES
(1, 'Dentist'),
(2, 'Cardiology'),
(3, 'Pathologist'),
(4, 'Neurology'),
(5, 'General Physician'),
(6, 'Ayurveda'),
(7, 'ENT Specialist'),
(8, 'Homeopathy');

-- --------------------------------------------------------

--
-- Table structure for table `diseasecost`
--

CREATE TABLE `diseasecost` (
  `Disease_Name` varchar(200) DEFAULT NULL,
  `Cost` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `diseasecost`
--

INSERT INTO `diseasecost` (`Disease_Name`, `Cost`) VALUES
('Celiac Disease', '10000'),
('Liver Disease', '100000'),
('Ear, Nose and Throat Diseases', '1500'),
('Infectious Diseases', '2000'),
('Cancer', '2000000'),
('Other Diseases', '2500'),
('Heart Disease', '250000'),
('Private Diseases', '3000'),
('Normal Diseases', '500'),
('Crohn''s & Colitis', '5000'),
('Big Diseases', '5000000');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `docid` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `deptid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`docid`, `name`, `deptid`) VALUES
(1, 'Dinesh Patel', 1),
(2, 'Dharmesh Mourya', 1),
(3, 'Ashish Singh', 2),
(4, 'Swasti Singh', 2),
(5, 'Sachin Mehra', 3),
(6, 'Harshal Singh', 3),
(7, 'Dinesh Sawant', 4),
(8, 'Komal Hans', 4),
(9, 'Kamlesh Singh', 5),
(10, 'Naveen Reddy', 5),
(11, 'Kishor Patil', 6),
(12, 'Dharmesh Patel', 6),
(13, 'Ganga Bisht', 7),
(14, 'Vivek Kumar', 7),
(15, 'Fahim Sheikh', 8),
(16, 'Abdul Shah', 8);

-- --------------------------------------------------------

--
-- Table structure for table `doctorfees`
--

CREATE TABLE `doctorfees` (
  `feesid` int(11) DEFAULT NULL,
  `dfees` varchar(130) DEFAULT NULL,
  `docid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctorfees`
--

INSERT INTO `doctorfees` (`feesid`, `dfees`, `docid`) VALUES
(1, '500', 1),
(2, '500', 2),
(3, '1000', 3),
(4, '1000', 4),
(5, '1200', 5),
(6, '1200', 6),
(7, '1500', 7),
(8, '1500', 8),
(9, '500', 9),
(10, '500', 10),
(11, '1000', 11),
(12, '1000', 12),
(13, '1000', 13),
(14, '1000', 14),
(15, '1400', 15),
(15, '1400', 16);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `name` varchar(100) NOT NULL,
  `Services` varchar(100) NOT NULL,
  `Points` varchar(100) NOT NULL,
  `nature` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `feedback` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patient_bill`
--

CREATE TABLE `patient_bill` (
  `Pid` varchar(100) DEFAULT NULL,
  `Pname` varchar(100) DEFAULT NULL,
  `Dname` varchar(100) DEFAULT NULL,
  `Disease` varchar(200) DEFAULT NULL,
  `BillAmount` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_bill`
--

INSERT INTO `patient_bill` (`Pid`, `Pname`, `Dname`, `Disease`, `BillAmount`) VALUES
('PID-5TFLXT', 'Suresh Sharma', 'Dinesh Patel', 'Cancer', '2000000'),
('PID-O1UDEG', 'Manish Dube', 'Dinesh Patel', 'Normal Diseases', '500'),
('PID-7A8DJS', 'Dinsesh', 'Swasti Singh', 'Heart Disease', '250000'),
('PID-7A8DJS', 'Deepak Rai', 'Kiran Shah', 'Heart Disease', '250000'),
('PID-VSUEJQ', 'Dharmesh Mourya', 'Kiran Shah', 'Normal Diseases', '500'),
('PID-2741', 'Ddddd', 'Dharmesh Mourya', 'Normal Diseases', '500'),
('PID-4324', 'demo', 'Vivek Kumar', 'Ear, Nose and Throat Diseases', '1500');

-- --------------------------------------------------------

--
-- Table structure for table `table_appointment`
--

CREATE TABLE `table_appointment` (
  `Pid` varchar(100) DEFAULT NULL,
  `Pname` varchar(100) DEFAULT NULL,
  `Department` varchar(100) DEFAULT NULL,
  `Dname` varchar(100) DEFAULT NULL,
  `Fees` varchar(100) DEFAULT NULL,
  `App_Date` varchar(100) DEFAULT NULL,
  `App_Time` varchar(100) DEFAULT NULL,
  `Messsage` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_appointment`
--

INSERT INTO `table_appointment` (`Pid`, `Pname`, `Department`, `Dname`, `Fees`, `App_Date`, `App_Time`, `Messsage`) VALUES
('PID-O1UDEG', 'Manish Dube', 'Dentist', 'Dinesh Patel', '1000', '2017-04-23', '17:03', NULL),
('PID-TCFFGZ', 'Bhagwan', 'General Physician', 'Sachin Mehra', '1000', '2017-04-23', '04:04', NULL),
('PID-7A8DJS', 'Dinsesh', 'Cardiology', 'Swasti Singh', '1000', '2017-04-24', '21:00', 'Appointment Cancelled'),
('PID-7A8DJS', 'Dinsesh', 'Cardiology', 'Dinesh Patel', '1000', '2017-04-23', '20:30', 'Appointment Cancelled'),
('PID-7A8DJS', 'Deepak Rai', 'Pathologist', 'Kiran Shah', '1000', '2017-04-24', '19:30', NULL),
('PID-VSUEJQ', 'Dharmesh Mourya', 'General Physician', 'Kiran Shah', '1000', '2017-04-24', '19:30', 'Appointment Cancelled'),
('PID-2741', 'Ddddd', 'Dentist', 'Dharmesh Mourya', '700', '2017-06-03', '14:00', NULL),
('PID-4324', 'demo', 'ENT Specialist', 'Vivek Kumar', '1200', '2017-06-13', '21:00', NULL),
('PID-4326', 'dsdsds', 'Cardiology', 'Ashish Singh', '1000', '2017-06-14', '11:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `table_contact`
--

CREATE TABLE `table_contact` (
  `Uname` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Contact_No` varchar(100) DEFAULT NULL,
  `Comment` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_contact`
--

INSERT INTO `table_contact` (`Uname`, `Email`, `Contact_No`, `Comment`) VALUES
('Dharmesh', 'dharmeshmourya043@gmail.com', '8286847818', 'Hello\r\n'),
('Nihkil', 'nikhil45@gmail.com4', '11111111115', 'ddedfdffdfdfdf'),
('Anjali Thakoor', 'Anjali123@gmail.com', '132024541', 'Hello '),
('Hemant Thumpi', 'hemant41@gmail.com', '787841212', 'HI '),
('Hemant Kumar', 'hemant45@gmail.com', '9685551402', 'Nothing to say.'),
('Gitesh', 'gitesh12@gmail.com', '5646415121', 'Hello');

-- --------------------------------------------------------

--
-- Table structure for table `table_doctor`
--

CREATE TABLE `table_doctor` (
  `Did` varchar(100) NOT NULL,
  `Dname` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Pass` varchar(100) NOT NULL,
  `Gender` varchar(100) DEFAULT NULL,
  `Degree` varchar(100) DEFAULT NULL,
  `Department` varchar(200) DEFAULT NULL,
  `Fees` varchar(200) DEFAULT NULL,
  `Contact` varchar(100) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `Reg_Date` varchar(100) DEFAULT NULL,
  `Deptid` int(11) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_doctor`
--

INSERT INTO `table_doctor` (`Did`, `Dname`, `Email`, `Pass`, `Gender`, `Degree`, `Department`, `Fees`, `Contact`, `Address`, `Reg_Date`, `Deptid`, `Age`) VALUES
('DID-65FB', 'Kishor Patil', 'kishorp45@gmail.com', 'Kishor456', 'Male', 'B.A.M.S.', 'Ayurveda', '1000', '3697845120', 'Vikhroli', '4/29/17 11:25 PM', 6, 40),
('DID-65LK', 'Dharmesh Patel', 'dharmesh10@gmail.com', 'dharmesh789', 'Male', 'B.A.M.S.', 'Ayurveda', '1000', '3697845129', 'Nerul', '4/29/17 5.12 PM', 6, 45),
('DID-7830', 'Komal Hans', 'Komal26@gmail.com', 'Komal456', 'Male', 'Neurologist', 'Neurology', '1500', '9765843120', 'Kalyan', '4/25/17 11:06 PM', 4, 55),
('DID-7850', 'Kamlesh Singh', 'kamlesh54@gmail.com', 'Kamlesh123', 'Male', 'B.M.B.S', 'General Physician', '500', '7738981268', 'Kurla', '4/2617 11:06 AM', 5, 60),
('DID-AB30', 'Naveen Reddy', 'naveen10@hotmail.com', 'Naveen456', 'Male', 'B.M.B.S', 'General Physician', '500', '8881156950', 'Nahur', '6/21/17 12:06 PM', 5, 41),
('DID-FBCP6', 'Dharmesh Mourya\r\n', 'dharmesh23@gmail.com', 'dharmesh120', 'Male', 'D.D.S', 'Dentist', '500', '1111111111', 'Navi Mumbai', '4/21/17 11:14 PM', 1, 25),
('DID-HWE87', 'Harshal Singh', 'harsha12@gmail.com', 'Harshal23', 'Male', 'B.P.T', 'Pathologist', '1200', '9833654213', 'Bhandup', '4/21/17 11:06 PM', 3, 52),
('DID-NSEA4', 'Dinesh Sawant', 'dinesh455@gmail.com', 'Dinesh123', 'Male', 'Neurologist', 'Neurology', '1500', '123456956', 'Nashik', '4/24/17 11:43 AM', 4, 42),
('DID-NSEG8', 'Ganga Bisht', 'ganga54@gmail.com', 'ganga450', 'Male', 'M.B', 'ENT Specialist', '1000', '9821367801', 'Juhu', '5/21/17 11:06 PM', 7, 55),
('DID-NSEG9', 'Ashish Singh', 'ashish12@gmail.com', 'Ashish123', 'Male', 'M.B.B.S', 'Cardiology', '1000', '9833454521', 'Ghatkopar', '4/24/17 12:40 PM', 2, 60),
('DID-NSEH8', 'Vivek Kumar', 'vivek98@gmail.com', 'Vivek963', 'Male', 'M.B', 'ENT Specialist', '1000', '9821365402', 'Bandra', '5/5/17 11:06 PM', 7, 38),
('DID-SCE52', 'Abdul Shah', 'abdul78@gmail.com', 'Abdul120', 'Male', 'B.H.M.S', 'Homeopathy', '1400', '4561230789', 'Kasara', '4/8/17 11:06 PM', 8, 63),
('DID-SWE50', 'Fahim Sheikh', 'fahim12@gmail.com', 'Fahim123', 'Male', 'B.H.M.S', 'Homeopathy', '1400', '9632587410', 'Titwala', '6/14/17 11:55 PM', 8, 33),
('DID-SWE57', 'Sachin Mehra', 'sachin12@gmail.com', 'Sachin12345', 'Male', 'B.O.T', 'Pathologist', '1200', '1230456789', 'Thane', '4/21/17 11:02 PM', 3, 47),
('DID-SWE87', 'Swasti Singh', 'swasti120@gmail.com', 'Swasti123', 'Female', 'M.B.B.S', 'Cardiology', '1000', '6565545420', 'Mulund', '4/21/17 11:06 PM', 2, 35),
('DID-XGCPJ', 'Dinesh Patel', 'dinesh25@gmail.com', 'Dinesh456', 'Male', 'D.D.S', 'Dentist', '500', '2354454650', 'Mumbai', '4/21/17 11:09 PM', 1, 35);

-- --------------------------------------------------------

--
-- Table structure for table `table_feedback`
--

CREATE TABLE `table_feedback` (
  `Name` varchar(100) DEFAULT NULL,
  `Services` varchar(100) DEFAULT NULL,
  `Points` varchar(100) DEFAULT NULL,
  `Doc_Nature` varchar(100) DEFAULT NULL,
  `Location` varchar(100) DEFAULT NULL,
  `Feedback` varchar(1000) DEFAULT NULL,
  `Reg_Date` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_feedback`
--

INSERT INTO `table_feedback` (`Name`, `Services`, `Points`, `Doc_Nature`, `Location`, `Feedback`, `Reg_Date`) VALUES
('Suresh Sharma', 'Good', '2', 'Good', 'Thane', 'Nothing to say.', '4/22/17 12:04 AM'),
('Jeevan Seth', 'Excellent', '4', 'Excellent', 'Mulund', 'Hello', '4/22/17 12:05 AM'),
('Dharmesh Mourya', 'Excellent', '5', 'Excellent', 'Thane', 'Nothing to say its all good.', '4/24/17 12:28 PM'),
('demo', 'Excellent', '3', 'Excellent', 'Thane', 'Nothing', '6/13/17 7:06 PM');

-- --------------------------------------------------------

--
-- Table structure for table `table_patient`
--

CREATE TABLE `table_patient` (
  `Pid` varchar(10) NOT NULL,
  `Pname` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Pass` varchar(100) DEFAULT NULL,
  `Contact` varchar(100) DEFAULT NULL,
  `DOB` varchar(100) DEFAULT NULL,
  `Gender` varchar(100) DEFAULT NULL,
  `Age` varchar(100) DEFAULT NULL,
  `PStatus` varchar(100) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `Disease` varchar(100) DEFAULT NULL,
  `RoomType` varchar(100) DEFAULT NULL,
  `Reg_Date` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_patient`
--

INSERT INTO `table_patient` (`Pid`, `Pname`, `Email`, `Pass`, `Contact`, `DOB`, `Gender`, `Age`, `PStatus`, `Address`, `Disease`, `RoomType`, `Reg_Date`) VALUES
('AID-EJZ6WT', 'Vinay', 'vinay12@gmail.com', 'Vinay123', '5454841050', '1995-05-02', 'Male', '22', 'Single', 'Nerul', 'Normal Diseases', 'Medium', '4/24/17 11:33 AM'),
('AID-GYNFDK', 'Hitesh', 'hitesh10@gmail.com', 'Hitesh123', '1111111110', '1992-03-05', 'Male', '25', 'Single', 'Jaipur', 'Big Diseases', 'V.I.P', '4/24/17 11:39 AM'),
('AID-GYNFFK', 'DemoPatient', 'demop12@gmail.com', 'Demo123', '9866554220', '1995-04-25', 'Male', '22', 'Single', 'Nahur', 'Crohn''s & Colitis', 'Medium', '4/24/17 12:38 PM'),
('PID- 859', 'dsdsdsfff', 'dsdssd@dfdfd', 'Don123', '9874123500', '2017-07-10', 'Male', '25', 'Single', 'fdfdff', 'Crohn''s & Colitis', 'Normal', '7/4/17 3:50 PM'),
('PID-2741', 'Ddddd', 'Ddd45@gmail.com', 'Don123', '2125445540', '2017-06-14', 'Male', '35', 'Single', 'Thane', 'Normal Diseases', 'Medium', '6/2/17 9:54 PM'),
('PID-4324', 'demo', 'demo12@gmail.com', 'Demo123', '9876520503', '1996-05-31', 'Male', '21', 'Single', 'Thane', 'Ear, Nose and Throat Diseases', 'Medium', '6/13/17 6:51 PM'),
('PID-4326', 'dsdsds', 'sddsdd@df', 'Das120', '2551454540', '1996-06-13', 'Male', '19', 'Single', 'gfg', 'Big Diseases', 'Medium', '6/13/17 10:51 PM'),
('PID-5TFLXT', 'Suresh Sharma', 'suresh12@gmail.com', 'Suresh123', '1230456789', '1996-05-04', 'Male', '21', 'Single', 'Mulund', 'Cancer', 'Medium', '4/21/17 10:55 PM'),
('PID-7A8DJS', 'Deepak Rai', 'deepak25@gmail.com', 'Deepak123', '1454545454', '1995-05-05', 'Male', '22', 'Single', 'Nahur', 'Heart Disease', 'Medium', '4/23/17 12:55 PM'),
('PID-O1UDEG', 'Manish Dube', 'manish12@gmail.com', 'Manish123', '123566894', '1996-05-04', 'Male', '21', 'Single', 'Mulund', 'Normal Diseases', 'Normal', '4/22/17 2:59 PM'),
('PID-TCFFGZ', 'Bhagwan', 'Bhagwan78@gmail.com', 'Bhagwan123', '5145400000', '2017-04-13', 'Male', '35', 'Single', 'Mulund', 'Normal Diseases', 'Normal', '4/22/17 9:19 PM'),
('PID-VSUEJQ', 'Dharmesh Mourya', 'dharmeshmourya043@gmail.com', 'Dharmya123', '8286847818', '1996-01-04', 'Male', '21', 'Single', 'Thane', 'Normal Diseases', 'V.I.P', '4/24/17 12:19 PM');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dept`
--
ALTER TABLE `dept`
  ADD PRIMARY KEY (`deptid`);

--
-- Indexes for table `diseasecost`
--
ALTER TABLE `diseasecost`
  ADD PRIMARY KEY (`Cost`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`docid`),
  ADD KEY `ck1` (`deptid`);

--
-- Indexes for table `doctorfees`
--
ALTER TABLE `doctorfees`
  ADD KEY `ck11` (`docid`);

--
-- Indexes for table `table_doctor`
--
ALTER TABLE `table_doctor`
  ADD PRIMARY KEY (`Did`),
  ADD UNIQUE KEY `Dname` (`Dname`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `Contact` (`Contact`);

--
-- Indexes for table `table_patient`
--
ALTER TABLE `table_patient`
  ADD PRIMARY KEY (`Pid`),
  ADD UNIQUE KEY `Pname` (`Pname`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `Contact` (`Contact`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `ck1` FOREIGN KEY (`deptid`) REFERENCES `dept` (`deptid`);

--
-- Constraints for table `doctorfees`
--
ALTER TABLE `doctorfees`
  ADD CONSTRAINT `ck11` FOREIGN KEY (`docid`) REFERENCES `doctor` (`docid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
