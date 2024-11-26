
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
    ,dbh.facultyMail: "nure.abdullah@ewubd.edu",
    dbh.semester: "Summer23"
  });
  //Fall23
  await dbh.instance.insert({
    dbh.course: "CSE200",
    dbh.section: 6,
    dbh.credit: 1,
    dbh.timing: "S 1:30PM-3:30PM",
    dbh.faculty: "Mahamudul Hasan",
    dbh.facultyIni: "MDH"
    ,dbh.facultyMail: "mahamudul@ewubd.edu",
    dbh.semester: "Fall23"
  });
  await dbh.instance.insert({
    dbh.course: "CSE209",
    dbh.section: 1,
    dbh.credit: 4,
    dbh.timing: "SR 10:10AM-11:40AM",
    dbh.faculty: "Rashedul Amin Tuhin",
    dbh.facultyIni: "RDA"
    ,dbh.facultyMail: "mcctuhin@ewubd.edu",
    dbh.semester: "Fall23"
  });
  await dbh.instance.insert({
    dbh.course: "MAT104",
    dbh.section: 8,
    dbh.credit: 3,
    dbh.timing: "ST 8:30AM-10:00AM",
    dbh.faculty: "DR. ANUP KUMER DATTA",
    dbh.facultyIni: "DAKD"
    ,dbh.facultyMail: "anup.datta@ewubd.edu",
    dbh.semester: "Fall23"
  });
  await dbh.instance.insert({
    dbh.course: "STA102",
    dbh.section: 2,
    dbh.credit: 3,
    dbh.timing: "MW 10:10AM-11:40AM",
    dbh.faculty: "DR. MD. SOHEL RANA",
    dbh.facultyIni: "DSR"
    ,dbh.facultyMail: "srana@ewubd.edu",
    dbh.semester: "Fall23"
  });
// spring24
  await dbh.instance.insert({
    dbh.course: "CSE207",
    dbh.section: 9,
    dbh.credit: 4,
    dbh.timing: "ST 12:15PM-1:30PM",
    dbh.faculty: "Tanni Mittra",
    dbh.facultyIni: "TM"
    ,dbh.facultyMail: "tanni@ewubd.edu",
    dbh.semester: "Spring24"
  });
  await dbh.instance.insert({
    dbh.course: "CSE251",
    dbh.section: 1,
    dbh.credit: 4,
    dbh.timing: "MW 8:00AM-9:15AM",
    dbh.faculty: "DR. MD. HABIBUR RAHMAN",
    dbh.facultyIni: "MHR"
    ,dbh.facultyMail: "habib.rahman@ewubd.edu",
    dbh.semester: "Spring24"
  });
  await dbh.instance.insert({
    dbh.course: "MAT205",
    dbh.section: 1,
    dbh.credit: 3,
    dbh.timing: "ST 9:25AM-10:40AM",
    dbh.faculty: "DR. FAZLUL KARIM",
    dbh.facultyIni: "DFK"
    ,dbh.facultyMail: "fkarim@ewubd.edu",
    dbh.semester: "Spring24"
  });
  await dbh.instance.insert({
    dbh.course: "PHY209",
    dbh.section: 4,
    dbh.credit: 3,
    dbh.timing: "MW 1:40PM-2:55PM",
    dbh.faculty: "DR. JAHIRUL ISLAM KHANDAKER",
    dbh.facultyIni: "DJIK"
    ,dbh.facultyMail: "jahirul.islam@ewubd.edu",
    dbh.semester: "Spring24"
  });
//Summer24
  await dbh.instance.insert({
    dbh.course: "ECO101",
    dbh.section: 7,
    dbh.credit: 3,
    dbh.timing: "SR 8:00AM-10:30AM",
    dbh.faculty: "Ms. Kazi Maneeha Muzib",
    dbh.facultyIni: "KMM"
    ,dbh.facultyMail: "kazi.Muzib@ewubd.edu",
    dbh.semester: "Summer24"
  });
  await dbh.instance.insert({
    dbh.course: "GEN226",
    dbh.section: 3,
    dbh.credit: 3,
    dbh.timing: "MW 8:00AM-10:30AM",
    dbh.faculty: "Nishat Anjum Bini",
    dbh.facultyIni: "NAB"
    ,dbh.facultyMail: "nishat.bini@ewubd.edu",
    dbh.semester: "Summer24"
  });
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