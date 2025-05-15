import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    return await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'mydata.db');

    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE data (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          text TEXT
        )
      ''');
    });
  }

  Future<void> insertData(String text) async {
    final db = await database;
    await db.insert('data', {'text': text});
  }

  Future<List<Map<String, dynamic>>> getAllData() async {
    final db = await database;
    return await db.query('data');
  }
}
