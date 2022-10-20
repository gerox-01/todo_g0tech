

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static const storage = FlutterSecureStorage();

  // Singleton pattern
  static final DatabaseService _databaseService = DatabaseService._internal();
  factory DatabaseService() => _databaseService;
  DatabaseService._internal();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    // Initialize the DB first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    final path = '$databasePath/todo.db';

    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    return await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
      onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
    );
  }

  // When the database is first created, create a table to store breeds
  // and a table to store dogs.
  Future<void> _onCreate(Database db, int version) async {
    // Persona
    await db.execute(
      '''
          CREATE TABLE persona (
            "nid_persona" varchar(50) primary key,
            "name" varchar(255),
            "last_persona" varchar(20),
            "email" varchar(255),
            "age" varchar(20),
            "gender" varchar(20),
            "number_document" varchar(20),
            "type_document" varchar(20),
            "user" varchar(20),
            "password" varchar(20),
          );''',
    );
    // Tarea
    await db.execute(
      '''
          CREATE TABLE tarea (
            "nid_tarea" varchar(50) primary key,
            "name_task" varchar(100),
            "description_task" varchar(255),
            "status" varchar(20),
            "date" varchar(30),
            "nid_persona" varchar(50),
          );''',
    );
  }

  static Future<void> cleanDB() async {
    final db = await _databaseService.database;
    await db.execute("DELETE FROM persona");
    _database = null;
  }

  /*
   * Eliminar DB
   */
  static Future<void> deleteDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = '$databasePath/todo.db';
    databaseFactory.deleteDatabase(path);
  }


  /*
   * Insertar Persona
   */
  static Future<void> insertPersona(Map<String, dynamic> persona) async {
    final db = await _databaseService.database;
    await db.insert(
      'persona',
      persona,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /*
   * Obtener Persona
   */
  static Future<Map<String, dynamic>> getPersona() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('persona', whereArgs: [
      await storage.read(key: 'user'),
    ], where: 'user = ?');
    return maps.first;
  }


}