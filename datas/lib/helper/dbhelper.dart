import 'package:datas/dbf/data.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteService {
  Future<Database> initdb() async {
    return openDatabase(
      'database.db',
      version: 1,
      onCreate: (Database database, int version) async {
        await database.execute(
            "CREATE TABLE notes(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, description TEXT NOT NULL)");
      },
    );
  }

  Future<int> createItem(String title, String detl) async {
    final db = await initdb();
    final data = {'title': title, 'description': detl};
    final id = await db.insert('notes', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  Future<List<Map<String, dynamic>>> getItems() async {
    final db = await initdb();
    return db.query('notes', orderBy: "id");
  }

  Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await initdb();
    return db.query('notes', where: "id = ?", whereArgs: [id], limit: 1);
  }

  Future<List<Note>> notes() async {
    final db = await initdb();
    final List<Map<String, dynamic>> maps = await db.query('notes');
    return List.generate(maps.length, (i) {
      return Note(
          id: maps[i]['id'],
          title: maps[i]['title'],
          description: maps[i]['description']);
    });
  }

  Future<void> updateNote(Note note) async {
    final db = await initdb();
    await db
        .update('notes', note.toMap(), where: 'id = ?', whereArgs: [note.id]);
  }

  Future<void> delteNote(int id) async {
    final db = await initdb();
    await db.delete('notes', where: 'id=?', whereArgs: [id]);
  }
}
