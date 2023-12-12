import 'package:flutter_flashcards/Users/User.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/word.dart';
import '../Users/Userc.dart';

class DatabaseManager {
  // Singleton
  DatabaseManager._internal();

  static final _instance = DatabaseManager._internal();

  factory DatabaseManager() => _instance;

  // Database
  final String _database = 'flashcards.db',
      _wordsTable = 'words',
      _usersTable = 'users';

  Future<Database> initDatabase() async {
    final devicesPath = await getDatabasesPath();
    final path = join(devicesPath, _database);

    return await openDatabase(path, onCreate: (db, version) async {
      // Create words table
      await db.execute('''
        CREATE TABLE $_wordsTable (
          topic TEXT, 
          english TEXT PRIMARY KEY, 
          pinyin TEXT
        )
      ''');

      // Create users table
      await db.execute('''
        CREATE TABLE $_usersTable (
          fullName TEXT, 
          email TEXT PRIMARY KEY, 
          password TEXT, 
          role TEXT
        )
      ''');
    }, version: 1);
  }

  // Word management methods
  Future<void> insertWord({required Word word}) async {
    final db = await initDatabase();
    await db.insert(_wordsTable, word.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Word>> selectWords({int? limit}) async {
    final db = await initDatabase();
    List<Map<String, dynamic>> maps = await db.query(_wordsTable, limit: limit, orderBy: 'RANDOM()');
    return List.generate(maps.length, (index) => Word.fromMap(map: maps[index]));
  }

  Future<void> removeWord({required Word word}) async {
    final db = await initDatabase();
    await db.delete(_wordsTable, where: 'english = ?', whereArgs: [word.chapter]);
  }

  Future<void> removeAllWords() async {
    final db = await initDatabase();
    await db.delete(_wordsTable);
  }

  // User management methods
  Future<void> insertUser(Userc user) async {
    final db = await initDatabase();
    await db.insert(_usersTable, user.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Userc>> selectUsers() async {
    final db = await initDatabase();
    final List<Map<String, dynamic>> maps = await db.query(_usersTable);
    return List.generate(maps.length, (index) => Userc.fromMap(maps[index]));
  }

  Future<void> removeUser(String email) async {
    final db = await initDatabase();
    await db.delete(_usersTable, where: 'email = ?', whereArgs: [email]);
  }

  Future<void> removeDatabase() async {
    final devicesPath = await getDatabasesPath();
    final path = join(devicesPath, _database);
    await deleteDatabase(path);
  }





  Future<Userc?> authenticateUser(String email, String password) async {
  final db = await initDatabase();
  final List<Map<String, dynamic>> maps = await db.query(
  _usersTable,
  where: 'email = ? AND password = ?',
  whereArgs: [email, password],
  );

  if (maps.isNotEmpty) {
  return Userc.fromMap(maps.first);
  }
  return null;
  }




}
