import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  DB._();

  static final DB instance = DB._();

  initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'database.db'),
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE tokens(
            id INTEGER PRIMARY KEY,
            token TEXT
          );
        ''');
      },
      version: 1,
    );
  }

  insertToken(String token) async {
    Database db = await initDatabase();
    await db.insert('tokens', {'token': token});
  }
}
