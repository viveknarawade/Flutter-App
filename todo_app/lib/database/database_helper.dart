// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:developer';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  /// Singleton
  DatabaseHelper._();

  static final DatabaseHelper instance = DatabaseHelper._();

  // Constants
  static const String DB_NAME = "TodoListDB.db";
  static const String TODO_TABLE = "Todo";
  static const String COLUMN_TODO_SNO = "s_no";
  static const String COLUMN_TODO_TITLE = "title";
  static const String COLUMN_TODO_DESCRIPTION = "description";
  static const String COLUMN_TODO_DATE = "date";

  Database? _database;

  // Get the database instance
  Future<Database> getDatabase() async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _openDatabase();
      return _database!;
    }
  }

  // Open the database
  Future<Database> _openDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), DB_NAME),
      version: 1,
      onCreate: (db, version) async {
        // Create the table if it does not exist
        log('Creating table...');
        await db.execute('''
          CREATE TABLE $TODO_TABLE(
            $COLUMN_TODO_SNO INTEGER PRIMARY KEY AUTOINCREMENT, 
            $COLUMN_TODO_TITLE TEXT, 
            $COLUMN_TODO_DESCRIPTION TEXT, 
            $COLUMN_TODO_DATE TEXT
          )
        ''');
      },
    );
  }

  // Insert data into Todo table
  Future<bool> insertTodoListData({
    required String todoTitle,
    required String todoDescription,
    required String todoDate,
  }) async {
    Database localDB = await getDatabase();
    int rowsAffected = await localDB.insert(
      TODO_TABLE,
      {
        COLUMN_TODO_TITLE: todoTitle,
        COLUMN_TODO_DESCRIPTION: todoDescription,
        COLUMN_TODO_DATE: todoDate
      },
      conflictAlgorithm: ConflictAlgorithm.replace, // handle conflict
    );
    return rowsAffected > 0;
  }

  /// fetch data from Todo table
  Future<List<Map<String, dynamic>>> fetchTodoListData() async {
    Database localDB = await getDatabase();
    List<Map<String, dynamic>> todoData = await localDB.query(TODO_TABLE);

    // Check if the result is empty
    if (todoData == null || todoData.isEmpty) {
      return [];
    }

    return todoData;
  }

  /// update data from Todo table
  Future<bool> updateTodoListData({
    required String todoTitle,
    required String todoDescription,
    required String todoDate,
    required int todoSno,
  }) async {
    Database localDB = await getDatabase();
    int rowsAffected = await localDB.update(
      TODO_TABLE,
      {
        COLUMN_TODO_TITLE: todoTitle,
        COLUMN_TODO_DESCRIPTION: todoDescription,
        COLUMN_TODO_DATE: todoDate,
      },
      where: '$COLUMN_TODO_SNO = ?',
      whereArgs: [todoSno],
    );
    return rowsAffected > 0;
  }

  /// delete data from Todo table
  Future<bool> deleteTodoListData({required int todoSno}) async {
    Database? localDB = await getDatabase();
    int rowsAffected = await localDB.delete(TODO_TABLE,
        where: "$COLUMN_TODO_SNO = ?", whereArgs: ["$todoSno"]);

    return rowsAffected > 0;
  }
}
