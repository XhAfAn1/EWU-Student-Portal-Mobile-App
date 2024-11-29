import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class databasTest3{

  static const dbName="myDatabase1.db";
  static const dbVersion =1;
  static const dbTable1="courseList";
  static const columnId='id';
  static const course='Cname';
  static const section='Section';
  static const credit='Credit';
  static const timing='Timing';
  static const drop='dropS';
  static const faculty='Faculty';
  static const facultyIni='FacultyInitial';
  static const facultyMail='FacultyMail';
  static const semester='Semester';

  static const dbTable2="offeredCourse";
  static const roomNo='RoomNo';
  static const capacity='Capacity';
  static const department='Department';

  static const dbTable3="fac";

  static final databasTest3 instance =databasTest3();

  static Database? _database;

  Future<Database?> get database async{
    _database??= await initDB();
    return _database;
  }
  initDB() async{
    Directory directory= await getApplicationDocumentsDirectory();
    String path=join(directory.path,dbName);
    return await openDatabase(path,version: dbVersion,onCreate: onCreate);
  }

  Future onCreate(Database db,int version) async{
    db.execute(
        """
      
      CREATE TABLE $dbTable1(
      $columnId INTEGER ,
      $course TEXT PRIMARY KEY,
      $section INTEGER  NO NULL,
      $credit INTEGER  NO NULL,
      $timing TEXT  NO NULL,
      $drop TEXT,
      $faculty TEXT  NO NULL,
      $facultyIni TEXT  NO NULL,
      $facultyMail TEXT  NO NULL,
      $semester TEXT  NO NULL
      );
    
     
      """
    );
  }


  insert1(Map<String,dynamic>row) async{
    Database? db= await instance.database;
    return await db!.insert(dbTable1, row);
  }
  insert2(Map<String,dynamic>row) async{
    Database? db= await instance.database;
    return await db!.insert(dbTable2, row);
  }
  insert3(Map<String,dynamic>row) async{
    Database? db= await instance.database;
    return await db!.insert(dbTable3, row);
  }


  Future<List<Map<String,dynamic>>> queryDatabase1() async {
    Database? db= await instance.database;
    return await db!.query(dbTable1);
  }

  Future<List<Map<String,dynamic>>> queryDatabase2() async {
    Database? db= await instance.database;
    return await db!.query(dbTable2);
  }
  Future<List<Map<String,dynamic>>> queryDatabase3() async {
    Database? db= await instance.database;
    return await db!.query(dbTable3);
  }



  // Future<int> update(Map<String,dynamic>row) async {
  //   Database? db= await instance.database;
  //   int id= row[columnId];
  //   return await db!.update(dbTable,row,where: '$columnId=?',whereArgs: [id]);
  // }
  //
  // Future<int> deleteRecord(int id) async{
  //   Database? db= await instance.database;
  //   return await db!.delete(dbTable,where: '$columnId=?',whereArgs: [id] );
  // }
  Future<int> deleteall1() async{
    Database? db= await instance.database;
    return await db!.delete(dbTable1);
  }
  Future<int> deleteall2() async{
    Database? db= await instance.database;
    return await db!.delete(dbTable2);
  }
  Future<int> deleteall3() async{
    Database? db= await instance.database;
    return await db!.delete(dbTable3);
  }
Future rawRun1() async {
  Database? db= await instance.database;
  return db!.rawQuery("""   
        
     
      
       CREATE TABLE $dbTable2(
      $course TEXT NOT NULL,
      $section INTEGER  NOT NULL,
      $faculty TEXT  NOT NULL,
      $timing TEXT  NOT NULL,
      $roomNo TEXT NOT NULL,
      $capacity TEXT  NOT NULL,
      $department TEXT  NOT NULL,
      $semester TEXT  NOT NULL,
      PRIMARY KEY($course,$department,$semester,$section)
      );
       
  
     """);
}
  Future rawRun2() async {
    Database? db= await instance.database;
    return db!.rawQuery('''    
  
  
  
   
        CREATE TABLE $dbTable3(
      $course TEXT NOT NULL,
      $faculty TEXT  NOT NULL,
      $department TEXT  NOT NULL);
       
     
      
     ''');
  }


}
