import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../model/expence_model.dart';

class DB_Helper {

  static DB_Helper db_helper = DB_Helper();

  Database? database;

  String dbName = "Expense.db";
  String tName = "expenseTable";

  Future<Database?> checkDB() async {
    if (database != null)
      {
        return database;
      }
    else{
      return await initDB();
    }
  }

  Future<Database> initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, dbName);

    String query =
        "CREATE TABLE $tName (id INTEGER PRIMARY KEY AUTOINCREMENT , name TEXT ,location TEXT ,contact TEXT , reference_id TEXT)";

    return await openDatabase(path,
      version: 1,
      onCreate: (db, version) async {
        return await db.execute(query);
      },);
  }

  Future<void> insertDB(UserModel userModel)
  async {
    database = await checkDB();
    database?.insert(tName, {
      'name' : userModel.name,
      'location': userModel.location,
      'contact': userModel.contact,
      'reference_id':userModel.reference_id,
    });
  }

  Future<List<Map>> redDB() async {
    database = await checkDB();
    String query = "SELECT * FROM $tName";
    List<Map> list = await database!.rawQuery(query);
    return list;
  }

  Future<void> updateDB(UserModel userModel) async {
    database = await checkDB();
    database!.update(tName, {
      'name' : userModel.name,
      'location' : userModel.location,
      'contact': userModel.contact,
      'reference_id':userModel.reference_id,
    },where: "id=?",whereArgs: [userModel.id]);
  }

  Future<void> deleteDB(int selid) async {
    database = await checkDB();
    database!.delete(tName,where: "id=?",whereArgs: [selid]);
  }


}
