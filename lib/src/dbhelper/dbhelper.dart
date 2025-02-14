import 'dart:core';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbClass{

  DbClass._privateConstructor();
  static final instance=DbClass._privateConstructor();
  Database? _database;

  Future<Database> get database async {
    if (_database == null) {
      _database = await _initDatabase();
    }
    return _database!;
  }
  _initDatabase() async {
    Directory document=await getApplicationDocumentsDirectory();
    String path=join(document.path,'mudassir');
    return await  openDatabase(path,version: 1,onCreate: _onCreate);

  }

  _onCreate(Database db, int version)
  {
    db.execute(
      '''
      create table tractor
      (
       id integer primary key,
       customar_name text,
       time  text,
       price integer,
       total_price integer
      )
      '''
    ); 
  }

}
