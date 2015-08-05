# MySQL-Front Dump 2.5
#
# Host: localhost   Database: finalyearproject
# --------------------------------------------------------
# Server version 5.1.22-rc-community


#
# Table structure for table 'announcement'
#

CREATE TABLE IF NOT EXISTS announcement (
  annID int(10) unsigned NOT NULL auto_increment,
  annTitle varchar(255) NOT NULL DEFAULT '' ,
  annDesc text NOT NULL DEFAULT '' ,
  annShow varchar(45) NOT NULL DEFAULT '' ,
  PRIMARY KEY (annID)
);



#
# Dumping data for table 'announcement'
#

INSERT INTO announcement VALUES("3", "PSM Presentaion Seminar", "Seminar Place: CICT D07", "Y");
INSERT INTO announcement VALUES("9", "PSM", "Pre test", "Y");
INSERT INTO announcement VALUES("11", "PSM 121", "ABCEDEEEEE", "Y");
INSERT INTO announcement VALUES("12", "PSM Presentation ", "Please check your schedule", "Y");


#
# Table structure for table 'demo_room'
#

CREATE TABLE IF NOT EXISTS demo_room (
  room_name varchar(50) NOT NULL DEFAULT '' ,
  roomID int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY (roomID)
);



#
# Dumping data for table 'demo_room'
#

INSERT INTO demo_room VALUES("Case Lab", "17");
INSERT INTO demo_room VALUES("PSM Lab", "18");


#
# Table structure for table 'engapply'
#

CREATE TABLE IF NOT EXISTS engapply (
  metricNo varchar(20) NOT NULL DEFAULT '' ,
  reason text NOT NULL DEFAULT '' ,
  svSuppReason text ,
  status varchar(45) ,
  proID int(10) unsigned NOT NULL DEFAULT '' ,
  PRIMARY KEY (metricNo)
);



#
# Dumping data for table 'engapply'
#



#
# Table structure for table 'expertisefield'
#

CREATE TABLE IF NOT EXISTS expertisefield (
  staffNo varchar(50) NOT NULL DEFAULT '' ,
  expertised varchar(100) NOT NULL DEFAULT '' ,
  description text NOT NULL DEFAULT '' ,
  expertised_ID int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY (expertised_ID)
);



#
# Dumping data for table 'expertisefield'
#

INSERT INTO expertisefield VALUES("S001", "SED01", "Web developement, sheduling system.", "27");
INSERT INTO expertisefield VALUES("S002", "SED03", "Expert System", "28");
INSERT INTO expertisefield VALUES("S004", "SED03", "Component based software engineering", "30");
INSERT INTO expertisefield VALUES("S002", "SED01", "Web Developtment", "31");
INSERT INTO expertisefield VALUES("S002", "SED02", "Genetic Algoritm", "32");
INSERT INTO expertisefield VALUES("S004", "SED02", "fefef", "33");
INSERT INTO expertisefield VALUES("S006", "SED01", "Web Development", "34");
INSERT INTO expertisefield VALUES("S006", "SED02", "Genetic algoritm", "35");
INSERT INTO expertisefield VALUES("S003", "SED01", "Web Developtment", "36");
INSERT INTO expertisefield VALUES("4724", "SED02", "Intelligent System\r\nSpeech recognition and verification", "37");
INSERT INTO expertisefield VALUES("7331", "SED01", "Compotent based software engineering\r\n,Software reuse", "38");
INSERT INTO expertisefield VALUES("7351", "SED02", "Planning and schedulling", "39");
INSERT INTO expertisefield VALUES("7351", "SED01", "Web based software developement", "40");
INSERT INTO expertisefield VALUES("6838", "SED01", "Web based application", "41");
INSERT INTO expertisefield VALUES("6838", "SED03", "", "42");
INSERT INTO expertisefield VALUES("10054", "SED02", "Data/ Text mining", "43");
INSERT INTO expertisefield VALUES("2135", "SED01", "Web Development", "44");
INSERT INTO expertisefield VALUES("7019", "SED01", "Real Time Software", "45");
INSERT INTO expertisefield VALUES("5809", "SED02", "Computational Peteomic, computation genomic", "46");
INSERT INTO expertisefield VALUES("1898", "SED01", "Computer science education/ elearning", "47");
INSERT INTO expertisefield VALUES("1898", "SED03", "Expert System", "48");
INSERT INTO expertisefield VALUES("5160", "SED01", "Intelligent System, elearning algorithm", "49");
INSERT INTO expertisefield VALUES("S008", "SED01", "Intelligent learning system", "50");
INSERT INTO expertisefield VALUES("S009", "SED01", "Web development", "51");
INSERT INTO expertisefield VALUES("2157", "SED02", "Fuzzy logic, neural network, genetic algorithm", "52");
INSERT INTO expertisefield VALUES("S010", "SED01", "Agent oriented software engineering", "53");
INSERT INTO expertisefield VALUES("1234", "SED01", "Software engineering", "54");
INSERT INTO expertisefield VALUES("1234", "SED02", "Genetic algorithm, case base reasoning, neural network, support vector machine", "55");
INSERT INTO expertisefield VALUES("4298", "SED01", "Software engineering", "56");
INSERT INTO expertisefield VALUES("S011", "SED01", "Web based System", "57");
INSERT INTO expertisefield VALUES("6749", "SED01", "Software engineering", "58");
INSERT INTO expertisefield VALUES("6749", "SED02", "Soft computing, techniques and applications", "59");
INSERT INTO expertisefield VALUES("7352", "SED01", "Software design / architechture", "60");


#
# Table structure for table 'lec_ev_timetable'
#

CREATE TABLE IF NOT EXISTS lec_ev_timetable (
  ev1 varchar(10) NOT NULL DEFAULT '' ,
  ev2 varchar(10) NOT NULL DEFAULT '' ,
  slot varchar(45) NOT NULL DEFAULT '' ,
  room varchar(100) NOT NULL DEFAULT '' 
);



#
# Dumping data for table 'lec_ev_timetable'
#

INSERT INTO lec_ev_timetable VALUES("6838", "2135", "tt0102", "17");
INSERT INTO lec_ev_timetable VALUES("4724", "6838", "tt0202", "17");
INSERT INTO lec_ev_timetable VALUES("6838", "4724", "tt0302", "17");
INSERT INTO lec_ev_timetable VALUES("4724", "2135", "tt0103", "17");
INSERT INTO lec_ev_timetable VALUES("4724", "7019", "tt0102", "18");
INSERT INTO lec_ev_timetable VALUES("5809", "2135", "tt0202", "18");
INSERT INTO lec_ev_timetable VALUES("7331", "2135", "tt0203", "18");


#
# Table structure for table 'lec_timetable'
#

CREATE TABLE IF NOT EXISTS lec_timetable (
  staffNo varchar(10) NOT NULL DEFAULT '' ,
  free_period varchar(6) NOT NULL DEFAULT '' 
);



#
# Dumping data for table 'lec_timetable'
#

INSERT INTO lec_timetable VALUES("4724", "tt0102");
INSERT INTO lec_timetable VALUES("4724", "tt0103");
INSERT INTO lec_timetable VALUES("4724", "tt0104");
INSERT INTO lec_timetable VALUES("4724", "tt0202");
INSERT INTO lec_timetable VALUES("4724", "tt0203");
INSERT INTO lec_timetable VALUES("4724", "tt0204");
INSERT INTO lec_timetable VALUES("4724", "tt0302");
INSERT INTO lec_timetable VALUES("4724", "tt0303");
INSERT INTO lec_timetable VALUES("4724", "tt0304");
INSERT INTO lec_timetable VALUES("4724", "tt0402");
INSERT INTO lec_timetable VALUES("4724", "tt0403");
INSERT INTO lec_timetable VALUES("4724", "tt0404");
INSERT INTO lec_timetable VALUES("4724", "tt0502");
INSERT INTO lec_timetable VALUES("4724", "tt0503");
INSERT INTO lec_timetable VALUES("4724", "tt0504");
INSERT INTO lec_timetable VALUES("6838", "tt0102");
INSERT INTO lec_timetable VALUES("6838", "tt0109");
INSERT INTO lec_timetable VALUES("6838", "tt0202");
INSERT INTO lec_timetable VALUES("6838", "tt0203");
INSERT INTO lec_timetable VALUES("6838", "tt0205");
INSERT INTO lec_timetable VALUES("6838", "tt0208");
INSERT INTO lec_timetable VALUES("6838", "tt0302");
INSERT INTO lec_timetable VALUES("6838", "tt0308");
INSERT INTO lec_timetable VALUES("6838", "tt0403");
INSERT INTO lec_timetable VALUES("6838", "tt0404");
INSERT INTO lec_timetable VALUES("6838", "tt0503");
INSERT INTO lec_timetable VALUES("6838", "tt0504");
INSERT INTO lec_timetable VALUES("6838", "tt0505");
INSERT INTO lec_timetable VALUES("6838", "tt0507");
INSERT INTO lec_timetable VALUES("2135", "tt0102");
INSERT INTO lec_timetable VALUES("2135", "tt0103");
INSERT INTO lec_timetable VALUES("2135", "tt0108");
INSERT INTO lec_timetable VALUES("2135", "tt0109");
INSERT INTO lec_timetable VALUES("2135", "tt0202");
INSERT INTO lec_timetable VALUES("2135", "tt0203");
INSERT INTO lec_timetable VALUES("2135", "tt0205");
INSERT INTO lec_timetable VALUES("2135", "tt0303");
INSERT INTO lec_timetable VALUES("2135", "tt0305");
INSERT INTO lec_timetable VALUES("2135", "tt0308");
INSERT INTO lec_timetable VALUES("2135", "tt0402");
INSERT INTO lec_timetable VALUES("2135", "tt0403");
INSERT INTO lec_timetable VALUES("2135", "tt0404");
INSERT INTO lec_timetable VALUES("2135", "tt0506");
INSERT INTO lec_timetable VALUES("2135", "tt0509");
INSERT INTO lec_timetable VALUES("7019", "tt0102");
INSERT INTO lec_timetable VALUES("7019", "tt0104");
INSERT INTO lec_timetable VALUES("7019", "tt0105");
INSERT INTO lec_timetable VALUES("7019", "tt0108");
INSERT INTO lec_timetable VALUES("7019", "tt0307");
INSERT INTO lec_timetable VALUES("7019", "tt0309");
INSERT INTO lec_timetable VALUES("7019", "tt0407");
INSERT INTO lec_timetable VALUES("7019", "tt0408");
INSERT INTO lec_timetable VALUES("7019", "tt0409");
INSERT INTO lec_timetable VALUES("7019", "tt0507");
INSERT INTO lec_timetable VALUES("7019", "tt0508");
INSERT INTO lec_timetable VALUES("7019", "tt0509");
INSERT INTO lec_timetable VALUES("5809", "tt0103");
INSERT INTO lec_timetable VALUES("5809", "tt0104");
INSERT INTO lec_timetable VALUES("5809", "tt0202");
INSERT INTO lec_timetable VALUES("5809", "tt0203");
INSERT INTO lec_timetable VALUES("5809", "tt0303");
INSERT INTO lec_timetable VALUES("5809", "tt0304");
INSERT INTO lec_timetable VALUES("5809", "tt0402");
INSERT INTO lec_timetable VALUES("5809", "tt0403");
INSERT INTO lec_timetable VALUES("5809", "tt0405");
INSERT INTO lec_timetable VALUES("5809", "tt0505");
INSERT INTO lec_timetable VALUES("5809", "tt0507");
INSERT INTO lec_timetable VALUES("7331", "tt0102");
INSERT INTO lec_timetable VALUES("7331", "tt0103");
INSERT INTO lec_timetable VALUES("7331", "tt0202");
INSERT INTO lec_timetable VALUES("7331", "tt0203");
INSERT INTO lec_timetable VALUES("7331", "tt0206");
INSERT INTO lec_timetable VALUES("7331", "tt0302");
INSERT INTO lec_timetable VALUES("7331", "tt0303");
INSERT INTO lec_timetable VALUES("7331", "tt0307");
INSERT INTO lec_timetable VALUES("7331", "tt0405");
INSERT INTO lec_timetable VALUES("7331", "tt0407");


#
# Table structure for table 'lecturer'
#

CREATE TABLE IF NOT EXISTS lecturer (
  lectName varchar(200) NOT NULL DEFAULT '' ,
  staffNo varchar(45) NOT NULL DEFAULT '' ,
  emailAdd varchar(100) NOT NULL DEFAULT '' ,
  phoneNo varchar(45) NOT NULL DEFAULT '' ,
  pass varchar(250) NOT NULL DEFAULT '' ,
  roomNo varchar(100) NOT NULL DEFAULT '' ,
  PRIMARY KEY (staffNo)
);



#
# Dumping data for table 'lecturer'
#

INSERT INTO lecturer VALUES("Ito Wasito", "10054", "ito@utm.my", "075532225", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "D07-447-01");
INSERT INTO lecturer VALUES("Safaai Deris", "1234", "safaai@utm.my", "075532343", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "N28-305-05");
INSERT INTO lecturer VALUES("Noraniah Mohd Yassin", "1898", "noraniah@utm.my", "075532346", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "N28-305-09 ");
INSERT INTO lecturer VALUES("Mabeni Mapoh", "2135", "mabeni@utm.my", "075532232", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "D07-354-01");
INSERT INTO lecturer VALUES("Puteh Saad", "2157", "puteh@utm.my", "075532344", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "N28-305-06");
INSERT INTO lecturer VALUES("Safie Mat Yatim", "4298", "safiematyatim@utm.my", "075532347", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "N28-305-10");
INSERT INTO lecturer VALUES("Abdul Manan Ahmad", "4724", "manan@utm.my", "075532201", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "N28-305-04");
INSERT INTO lecturer VALUES("Norazah Yusof", "5160", "norazah@utm.my", "075532344", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "N28-305-12");
INSERT INTO lecturer VALUES("Muhammad Razib Othman", "5809", "razib@utm.my", "075532258", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "N28-306-04 ");
INSERT INTO lecturer VALUES("Siti Zaiton Mohd Hashim", "6749", "sitizaiton@utm.my", "075532439", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "N28-306-18");
INSERT INTO lecturer VALUES("Ismail Mat Amin", "6838", "ismailma@utm.my", "075532345", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "N28-305-08");
INSERT INTO lecturer VALUES("Mohd Yazid Idris", "7019", "yazid@utm.my", "075532309", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "N28-306-14 ");
INSERT INTO lecturer VALUES("Dayang Norhayati Abg Jawawi", "7331", "dayang@utm.my", "075532354", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "N28-306-06");
INSERT INTO lecturer VALUES("Hishammuddin Asmuni", "7351", "hishammuddin@utm.my", "075532353", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "N28-306-05");
INSERT INTO lecturer VALUES("Wan Mohd Nasir Wan Kadir", "7352", "wnasir@utm.my", "075532348", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "N28-305-11");
INSERT INTO lecturer VALUES("Norbahiah Ahmad", "S008", "bahiah@utm.my", "012345678", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "-");
INSERT INTO lecturer VALUES("Paridah Samsuri", "S009", "paridah@fsksm.utm.my", "075532042", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "N28-306-15");
INSERT INTO lecturer VALUES("Radziah Mohamad", "S010", "radziahm@utm.my", "075532013", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "N28-306-17");
INSERT INTO lecturer VALUES("Sazali Abd Manaf", "S011", "sazali@utm.my", "075532432", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "N28-306-20");


#
# Table structure for table 'presentation_table'
#

CREATE TABLE IF NOT EXISTS presentation_table (
  staffNo varchar(10) NOT NULL DEFAULT '' ,
  slot varchar(10) NOT NULL DEFAULT '' ,
  evaluator varchar(10) NOT NULL DEFAULT '' ,
  room varchar(10) NOT NULL DEFAULT '' 
);



#
# Dumping data for table 'presentation_table'
#



#
# Table structure for table 'project_evaluation'
#

CREATE TABLE IF NOT EXISTS project_evaluation (
  slot varchar(10) NOT NULL DEFAULT '' ,
  roomID varchar(10) NOT NULL DEFAULT '' ,
  marks_ev1 varchar(45) ,
  marks_ev2 varchar(45) ,
  comment_ev1 text ,
  comment_ev2 text ,
  metricNo varchar(20) NOT NULL DEFAULT '' ,
  session varchar(5) NOT NULL DEFAULT '' ,
  PRIMARY KEY (metricNo)
);



#
# Dumping data for table 'project_evaluation'
#

INSERT INTO project_evaluation VALUES("tt0102", "17", NULL, NULL, NULL, NULL, "AC060117", "1");
INSERT INTO project_evaluation VALUES("tt0102", "17", NULL, NULL, NULL, NULL, "BC070095", "2");


#
# Table structure for table 'projectfield'
#

CREATE TABLE IF NOT EXISTS projectfield (
  ID varchar(20) NOT NULL DEFAULT '' ,
  proField varchar(255) NOT NULL DEFAULT '' ,
  PRIMARY KEY (ID)
);



#
# Dumping data for table 'projectfield'
#

INSERT INTO projectfield VALUES("SED01", "Software Engineering");
INSERT INTO projectfield VALUES("SED02", "Computational Intelligent");
INSERT INTO projectfield VALUES("SED03", "Expert System");
INSERT INTO projectfield VALUES("SED04", "Agent Based Project");
INSERT INTO projectfield VALUES("SED05", "Mobile Application");
INSERT INTO projectfield VALUES("SED06", "Web Development");


#
# Table structure for table 'quota_lecturer'
#

CREATE TABLE IF NOT EXISTS quota_lecturer (
  ev1 int(10) unsigned ,
  ev2 int(10) unsigned ,
  supervision int(10) unsigned ,
  semester varchar(10) NOT NULL DEFAULT '' ,
  ev_title int(10) unsigned ,
  PRIMARY KEY (semester)
);



#
# Dumping data for table 'quota_lecturer'
#

INSERT INTO quota_lecturer VALUES("10", "10", "20", "200820092", "10");


#
# Table structure for table 'student'
#

CREATE TABLE IF NOT EXISTS student (
  studName varchar(100) NOT NULL DEFAULT '' ,
  metricNo varchar(20) NOT NULL DEFAULT '' ,
  icNo varchar(12) NOT NULL DEFAULT '' ,
  emailAdd varchar(50) NOT NULL DEFAULT '' ,
  pass varchar(50) NOT NULL DEFAULT '' ,
  phoneNo varchar(45) NOT NULL DEFAULT '' ,
  semester varchar(10) NOT NULL DEFAULT '' ,
  PRIMARY KEY (metricNo)
);



#
# Dumping data for table 'student'
#

INSERT INTO student VALUES("Kwan Lai Pheng", "AC060106", "850521075288", "lpkwan@hotmail.com", "*E9D057131C22A0D76B4AAD2C61655BDFA706E637", "0164972445", "200820092");
INSERT INTO student VALUES("Lee Yih Rou", "AC060117", "860922406072", "bluelyrou@hotmail.com", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "0124263568", "200820092");
INSERT INTO student VALUES("Siew Huey Ing", "AC060237", "850701135436", "angeline_hi@hotmail.com", "*31D2CAC6513D1CD15CA1512E7131DC3D8ADAC778", "0168729270", "200820092");
INSERT INTO student VALUES("Sim Hiew Moi", "AC060286", "860817355288", "sim@hotmail.com", "*FD571203974BA9AFE270FE62151AE967ECA5E0AA", "01685576411", "200820092");
INSERT INTO student VALUES("Saw Jin Keat", "BC070095", "861124097899", "sawjk@hotmail.com", "*E6CC90B878B948C35E92B003C792C46C58C4AF40", "0172217017", "200820092");


#
# Table structure for table 'supervisor'
#

CREATE TABLE IF NOT EXISTS supervisor (
  staffNo varchar(50) NOT NULL DEFAULT '' ,
  metricNo varchar(20) NOT NULL DEFAULT '' ,
  status varchar(50) ,
  semester varchar(10) NOT NULL DEFAULT '' 
);



#
# Dumping data for table 'supervisor'
#

INSERT INTO supervisor VALUES("4724", "AC060117", "Approved", "200820092");
INSERT INTO supervisor VALUES("2135", "AC060106", "Approved", "200820092");
INSERT INTO supervisor VALUES("7331", "BC070095", "Approved", "200820092");


#
# Table structure for table 'title'
#

CREATE TABLE IF NOT EXISTS title (
  proTitle varchar(255) NOT NULL DEFAULT '' ,
  bgProblem text NOT NULL DEFAULT '' ,
  objective text NOT NULL DEFAULT '' ,
  scope text NOT NULL DEFAULT '' ,
  proType text NOT NULL DEFAULT '' ,
  proField text NOT NULL DEFAULT '' ,
  softSpecification text NOT NULL DEFAULT '' ,
  hardware text NOT NULL DEFAULT '' ,
  technology text NOT NULL DEFAULT '' ,
  metricNo varchar(20) NOT NULL DEFAULT '' ,
  status varchar(60) NOT NULL DEFAULT '' ,
  semester varchar(45) NOT NULL DEFAULT '' ,
  proID int(10) unsigned NOT NULL auto_increment,
  evaluator varchar(45) ,
  comment text ,
  title_flag varchar(1) NOT NULL DEFAULT '' ,
  PRIMARY KEY (proID)
);



#
# Dumping data for table 'title'
#

INSERT INTO title VALUES("PSM ", "abc", "def", "gf", "softDev", "SED01", "  fef", "efef", "effef", "AC060117", "Full Approval", "200820092", "1", "S009", NULL, "Y");
INSERT INTO title VALUES("Vevarry System", "fefiohh", "h", "hihihih", "softDev", "SED01", "joojjiojojo", "jojojojo", "jojojjojo", "AC060106", "Full Approval", "200820092", "2", "S011", NULL, "Y");
INSERT INTO title VALUES("Web-Based Video Conferencing For Cooperative Learning in FSKSM", "egeg", "gege", "gegg", "softDev", "SED01", "fefef", "fefefefefefefefe", "fefefefe", "BC070095", "Full Approval", "200820092", "3", "1234", "fefefef", "Y");


#
# Table structure for table 'users_login'
#

CREATE TABLE IF NOT EXISTS users_login (
  psw varchar(50) NOT NULL DEFAULT '' ,
  userID varchar(20) NOT NULL DEFAULT '' ,
  usertype int(11) ,
  PRIMARY KEY (userID)
);



#
# Dumping data for table 'users_login'
#

INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "10054", "2");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "1234", "2");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "1898", "2");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "2135", "2");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "2157", "2");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "4298", "2");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "4724", "2");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "5160", "2");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "5809", "2");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "6749", "2");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "6838", "2");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "7019", "2");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "7331", "2");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "7351", "2");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "7352", "2");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "AC060106", "1");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "AC060117", "1");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "AC060237", "1");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "AC060286", "1");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "admin", "3");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "BC070095", "1");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "S008", "2");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "S009", "2");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "S010", "2");
INSERT INTO users_login VALUES("*E6CC90B878B948C35E92B003C792C46C58C4AF40", "S011", "2");
