import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  static const dbName="myDatabase.db";
  static const dbVersion =1;
  static const dbTable="courses";
  static const columnId='id';
  static const course='Cname';
  static const section='Cname';
  static const credit='Cname';

  static final DatabaseHelper instance =DatabaseHelper();

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
      '''
      CREATE TABLE $dbTable(
      $columnId INTEGER PRIMARY KEY,
      $course TEXT ,
      $section TEXT ,
      $credit TEXT ,
      )
      '''
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

  Future<int> update(Map<String,dynamic>row) async {
    Database? db= await instance.database;
    int id= row[columnId];
    return await db!.update(dbTable,row,where: '$columnId=?',whereArgs: [id]);
  }

  Future<int> deleteRecord(int id) async{
    Database? db= await instance.database;
    return await db!.delete(dbTable,where: '$columnId=?',whereArgs: [id] );
  }
  Future<int> deleteall() async{
    Database? db= await instance.database;
    return await db!.delete(dbTable);
  }
   Future deleteTable() async {
    Database? db= await instance.database;
    return db!.rawQuery('DELETE FROM $dbTable');
  }


}