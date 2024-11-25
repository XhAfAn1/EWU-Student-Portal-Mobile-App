import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class dbh{
  static const dbName="myDatabase6.db";
  static const dbVersion =1;
  static const dbTable="courseList";
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

  static final dbh instance =dbh();

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
      CREATE TABLE IF NOT EXISTS $dbTable(
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
      )
      """
    );
  }


  insert(Map<String,dynamic>row) async{
    Database? db= await instance.database;
    return await db!.insert(dbTable, row);
  }

  Future<List<Map<String,dynamic>>> queryDatabase() async {
    Database? db= await instance.database;
    return await db!.query(dbTable);
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
  Future<int> deleteall() async{
    Database? db= await instance.database;
    return await db!.delete(dbTable);
  }
  // Future deleteTable() async {
  //   Database? db= await instance.database;
  //   return db!.rawQuery('''DROP TABLE $dbTable''');
  // }


}
