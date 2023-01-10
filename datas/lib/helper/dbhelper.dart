import 'package:datas/dbf/data.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart';

class SqliteService {
  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'database.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await database.execute(
            "CREATE TABLE notes(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, description TEXT NOT NULL)");
      },
    );
  }

  static Future<int> createItem(String title, String detl) async {
    final db = await SqliteService.db();
    final data = {'title': title, 'description': detl};
    final id = await db.insert('notes', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SqliteService.db();
    return db.query('notes', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SqliteService.db();
    return db.query('notes', where: "id = ?", whereArgs: [id], limit: 1);
  }
/*
static Future<int> updateItem(
      int id, String title, String? descrption) async {
    final db = await SQLHelper.db();

    final data = {
      'title': title,
      'description': descrption,
      'createdAt': DateTime.now().toString()
    };

    final result =
        await db.update('items', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("items", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }

*/
}
