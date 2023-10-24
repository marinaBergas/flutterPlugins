import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  static Future<Database> dataBase() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'places.dp'),
        onCreate: (db, version) => db.execute(
            'CREATE TABLE user_places(id TEXT PRIMARY KEY,title TEXT,image TEXT)'),
        version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    //if two row in table with the same id it replace el old with new one
    final db = await DBHelper.dataBase();
    db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    //get access to database
    final db = await DBHelper.dataBase();
    //to get data use query method
    return db.query(table);
  }
}
