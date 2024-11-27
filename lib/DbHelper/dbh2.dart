import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class dbh2{
  static const dbName="myDatabase12.db";
  static const dbVersion =1;
  static const dbTable="offeredCourse";
  static const course='Cname';
  static const section='Section';
  static const faculty='Faculty';
  static const timing='Timing';
  static const roomNo='RoomNo';
  static const capacity='Capacity';
  static const department='Department';
  static const semester='Semester';

  static final dbh2 obj =dbh2();

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
      $course TEXT NOT NULL,
      $section INTEGER  NOT NULL,
      $faculty TEXT  NOT NULL,
      $timing TEXT  NOT NULL,
      $roomNo TEXT NOT NULL,
      $capacity TEXT  NOT NULL,
      $department TEXT  NOT NULL,
      $semester TEXT  NOT NULL,
      PRIMARY KEY($course,$department,$semester,$section)
      )
      """
    );
  }


  insert(Map<String,dynamic>row) async{
    Database? db= await obj.database;
    return await db!.insert(dbTable, row);
  }

  Future<List<Map<String,dynamic>>> queryDatabase() async {
    Database? db= await obj.database;
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
    Database? db= await obj.database;
    return await db!.delete(dbTable);
  }
// Future deleteTable() async {
//   Database? db= await instance.database;
//   return db!.rawQuery('''DROP TABLE $dbTable''');
// }


}
