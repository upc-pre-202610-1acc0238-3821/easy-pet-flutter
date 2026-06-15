import 'package:sqflite/sqflite.dart';

class AppDatabase {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database as Database;

    _database = await _initDb('easy_vet.db');
    return _database!;
  }

  Future<Database> _initDb(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = '$dbPath/$filePath';

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
        CREATE TABLE products(
          id INTEGER PRIMARY KEY,
          name TEXT,
          price REAL,
          image TEXT,
          description TEXT
        )
      ''');
      },
    );
  }
}
