
import 'dbh.dart';

insertData() async {
  //Fall22
  await dbh.instance.insert({
    dbh.course: "CSE103",
    dbh.section: 7,
    dbh.credit: 4.5,
    dbh.timing: "ST 11:50AM-1:20PM",
    dbh.faculty: "Dr. Maheen Islam",
    dbh.facultyIni: "MI"
    ,dbh.facultyMail: "maheen@ewubd.edu",
    dbh.semester: "Fall22"
  });
  await dbh.instance.insert({
    dbh.course: "MAT101",
    dbh.section: 8,
    dbh.credit: 3,
    dbh.timing: "ST 8:30AM-10:00AM",
    dbh.faculty: "MR. MD. RAKIB HOSSAIN",
    dbh.facultyIni: "MRHN"
    ,dbh.facultyMail: "rakib.hossain@ewubd.edu",
    dbh.semester: "Fall22"
  });
  await dbh.instance.insert({
    dbh.course: "ENG101",
    dbh.section: 22,
    dbh.credit: 3,
    dbh.timing: "TR 3:10PM-4:40PM",
    dbh.faculty: "Ms. Ruhul Asfia",
    dbh.facultyIni: "ASFIA"
    ,dbh.facultyMail: "ruhul.asfia@ewubd.edu",
    dbh.semester: "Fall22"
  });
//Spring23
  await dbh.instance.insert({
    dbh.course: "MAT102",
    dbh.section: 5,
    dbh.credit: 3,
    dbh.timing: "TR 11:50AM-1:20PM",
    dbh.faculty: "Dr. Rabindra Nath Mondal",
    dbh.facultyIni: "DRNM"
    ,dbh.facultyMail: "rabindra.mondal@ewubd.edu",
    dbh.semester: "Spring23"
  });
  await dbh.instance.insert({
    dbh.course: "CHE109",
    dbh.section: 5,
    dbh.credit: 4,
    dbh.timing: "MW 11:50AM-1:20PM",
    dbh.faculty: "DR. THAMINA ACTER",
    dbh.facultyIni: "DTMA"
    ,dbh.facultyMail: "aktermina10@ewubd.edu",
    dbh.semester: "Spring23"
  });
  await dbh.instance.insert({
    dbh.course: "CSE106",
    dbh.section: 6,
    dbh.credit: 3,
    dbh.timing: "TR 8:30AM-10:00AM",
    dbh.faculty: "Dr. Muhammad Salah Uddin",
    dbh.facultyIni: "DSU"
    ,dbh.facultyMail: "uddin@ewubd.edu",
    dbh.semester: "Spring23"
  });
  //Summer23
  await dbh.instance.insert({
    dbh.course: "CSE110",
    dbh.section: 4,
    dbh.credit: 4.5,
    dbh.timing: "MW 1:30PM-3:00PM",
    dbh.faculty: "Tanni Mittra",
    dbh.facultyIni: "TM"
    ,dbh.facultyMail: "tanni@ewubd.edu",
    dbh.semester: "Summer23"
  });
  await dbh.instance.insert({
    dbh.course: "ENG102",
    dbh.section: 38,
    dbh.credit: 3,
    dbh.timing: "MW 8:30AM-10:00AM	",
    dbh.faculty: "Ms. Priti Paul",
    dbh.facultyIni: "PP"
    ,dbh.facultyMail: "priti.paul@ewubd.edu",
    dbh.semester: "Summer23"
  });
  await dbh.instance.insert({
    dbh.course: "PHY109",
    dbh.section: 6,
    dbh.credit: 3,
    dbh.timing: "TR 1:30PM-3:00PM",
    dbh.faculty: "Dr. MD. NURE ALAM ABDULLAH",
    dbh.facultyIni: "DMNAA"
    ,dbh.facultyMail: "nure.abdullah@ewubd.ed",
    dbh.semester: "Summer23"
  });
  //Fall23













  //Fall24
  await dbh.instance.insert({
    dbh.course: "CSE 246",
    dbh.section: 5,
    dbh.credit: 4.5,
    dbh.timing: "MW 1:40PM-2:55PM",
    dbh.faculty: "Tanni Mittra",
    dbh.facultyIni: "TM"
    ,dbh.facultyMail: "tanni@ewubd.edu",
    dbh.semester: "Fall24"
  });
  await dbh.instance.insert({
    dbh.course: "CSE 302",
    dbh.section: 6,
    dbh.credit: 4.5,
    dbh.timing: "SR 12:15PM-1:30PM",
    dbh.faculty: "Mahmuda Rawnak Jahan",
    dbh.facultyIni: "MRJ"
    ,dbh.facultyMail: "mahmuda.jahan@ewubd.edu",
    dbh.semester: "Fall24"
  });
  await dbh.instance.insert({
    dbh.course: "CSE 325",
    dbh.section: 5,
    dbh.credit: 4,
    dbh.timing: "MW 3:05PM-4:20PM",
    dbh.faculty: "Mr. Md. Mafiul Hasan Matin",
    dbh.facultyIni: "MMHM",
    dbh.facultyMail: "mafiul.matin@ewubd.edu",
    dbh.semester: "Fall24"
  });



}