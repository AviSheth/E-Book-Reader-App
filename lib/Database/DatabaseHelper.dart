import 'dart:async';
import 'package:e_book_reader/Database/Model/ebook.dart';
import 'package:e_book_reader/Database/Model/favorites_model.dart';
import 'package:e_book_reader/Database/Model/lastopened.dart';
import 'package:e_book_reader/Database/Model/userDB.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database? _database;
  DatabaseHelper._instance(); // Private constructor

  static const String TABLE_USER = 'users';
  static const String TABLE_EBOOK = 'ebook';
  static const String TABLE_SUBSCRIPTION ='subscription';
  static const String TABLE_LASTREAD ='lastread';
  static const String TABLE_FAVORITES = 'favorites';

  Future<Database> getDB() async {
    _database ??= await _openDB();
    return _database!;
  }

  Future<Database> _openDB() async {
    final databasePath = await getApplicationDocumentsDirectory();
    String path = join(databasePath.path, 'EBookApp.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('PRAGMA foreign_keys = ON');

        await db.execute('''
          CREATE TABLE $TABLE_USER(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            contact INTEGER,
            email TEXT UNIQUE,   
            password TEXT,
            profileimage TEXT
          )
        ''');

         await db.execute('''
         CREATE TABLE $TABLE_EBOOK(
            bookid INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            author TEXT NOT NULL,
            category TEXT NOT NULL,
            description TEXT,
            ebookurl TEXT NOT NULL,
            coverpage TEXT,
            downloadUrl TEXT,
            language TEXT,
            pagecount INTEGER
          )
          ''');

        await db.execute(''' 
        CREATE TABLE $TABLE_SUBSCRIPTION (
         id INTEGER PRIMARY KEY AUTOINCREMENT,
         userId INTEGER,
          isActive INTEGER DEFAULT 0,
          plan TEXT,
          expiryDate TEXT,
          FOREIGN KEY(userId) REFERENCES $TABLE_USER(id)
          )
          ''');

        await db.execute('''
        CREATE TABLE $TABLE_LASTREAD (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        userId INTEGER,
        bookId INTEGER,
         lastOpened TEXT,
         FOREIGN KEY(userId) REFERENCES $TABLE_USER(id),
         FOREIGN KEY(bookId) REFERENCES $TABLE_EBOOK(bookid)
         )
         ''');

        await db.execute('''
        CREATE TABLE $TABLE_FAVORITES (
         id INTEGER PRIMARY KEY AUTOINCREMENT,
          userId INTEGER,
          bookId INTEGER,
          FOREIGN KEY(userId) REFERENCES $TABLE_USER(id),
          FOREIGN KEY(bookId) REFERENCES $TABLE_EBOOK(bookid)
          )
        ''');


      },
    );
  }

  /// Registers a new user in the database.
  /// USER TABLE STRUCTURE

  Future<dynamic> registerUser({required String name,required int contact,required String email,required String password})async{
    var db = await  getDB();
    return await db.insert(TABLE_USER,{
      'name':name,
      'contact':contact,
      'email':email,
      'password':password
    });
  }

  Future<Map<String, dynamic>?> loginUser(String email, String password) async {
    try {
      var db = await getDB();
      List<Map<String, dynamic>> result = await db.query(
        TABLE_USER,
        where: 'email = ? AND password = ?',
        whereArgs: [email, password],
      );

      return result.isNotEmpty ? result.first : null;
    } catch (e) {
      print('Login error: $e');
      return null;
    }
  }

  Future<int> insertUser(Map<String, dynamic> user) async {
    final db = await getDB();
    return await db.insert(
      TABLE_USER,
      user,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

 /* Future<int> insertUser(Map<String, dynamic> userData) async {
    final db = await getDB();
    return await db.insert(TABLE_USER, userData);
  }*/


  Future<int> updatePassword({required String email, required String newPassword}) async
  {
    final db = await getDB();
    return await db.update(
      TABLE_USER,
      {'password': newPassword}, // Consider hashing the new password
      where: 'email = ?',
      whereArgs: [email],
    );

  }


  Future<User?> getCurrentUser(String email) async {
    final db = await getDB();
    final result = await db.query(
      TABLE_USER,
      where: 'email = ? ',
      whereArgs: [email],
    );
    if (result.isNotEmpty){
      return User.fromMap(result.first);
    }
    return null;
  }

  Future<void> updateProfileImage(String email, String imagePath) async {
    final db = await getDB();
    await db.update(
      'users',
      {'profilepic': imagePath},
      where: 'email = ?',
      whereArgs: [email],
    );
  }



  Future<int> updateUser(User user) async {
    final db = await getDB();
    return await db.update(
      TABLE_USER,
      user.toUpdateMap(),
      where: 'email = ?',
      whereArgs: [user.email],
    );
  }



  Future<List<Map<String, dynamic>>> fetchUserData() async {
    var db = await getDB();
    List<Map<String, dynamic>> result = await db.query(TABLE_USER);
    return result;
  }

  Future<int> deleteUser(int id) async {
    var db = await getDB();
    return await db.delete(TABLE_USER, where: 'id = ?', whereArgs: [id]);
  }


  ///
  ///  EBOOK TABLE STRUCTURE ///
///

  Future<int> insertEbook(Ebook ebook) async {
    final db = await getDB();
    return await db.insert(TABLE_EBOOK, ebook.toMapInsert());
  }

  Future<int> updateEbook(Ebook ebook) async {
    final db = await getDB();
    return await db.update(
      TABLE_EBOOK,
      ebook.toMapUpdate(),
      where: 'bookid = ?',
      whereArgs: [ebook.bookid],
    );
  }


  Future<List<Map<String, dynamic>>> getAllEbooks() async {
    var db = await getDB();
    List<Map<String, dynamic>> result = await db.query(TABLE_EBOOK);
    return result;
  }

  Future<int> deleteEbook(int bookid) async {
    final db = await getDB();
    return await db.delete(
      TABLE_EBOOK,
      where: 'bookid = ?',
      whereArgs: [bookid],
    );
  }

/// add Favorite Table
  ///
  Future<void> setFavorite(int userId, int bookId, bool isFavorite) async {
    final db = await getDB();
    if (isFavorite) {
      // Add to favorites
      await db.insert(
        TABLE_FAVORITES,
        {
          'userId': userId,
          'bookId': bookId,
        },
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
    } else {
      await db.delete(
        TABLE_FAVORITES,
        where: 'userId = ? AND bookId = ?',
        whereArgs: [userId, bookId],
      );
    }
  }


  Future<List<Map<String, dynamic>>> getFavoriteBooksForUser(int userId) async {
    final db = await getDB();
    return await db.rawQuery('''
    SELECT $TABLE_EBOOK.*
    FROM $TABLE_EBOOK
    INNER JOIN favorites ON $TABLE_EBOOK.bookid = favorites.bookId
    WHERE favorites.userId = ?
  ''', [userId]);
  }

  Future<bool> isFavorite(int userId, int bookId) async {
    final db = await getDB();
    final result = await db.query(
      TABLE_FAVORITES,
      where: 'userid = ? AND bookId = ?',
      whereArgs: [userId,bookId],
    );
    return result.isNotEmpty;
  }

  Future<void> updateLastOpened(LastRead lastRead) async {
    final db = await getDB();

    await db.insert(
      TABLE_LASTREAD,
      lastRead.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }


  /// for ebook filter
  Future<List<String>> getAllCategories() async {
    final db = await instance.getDB();
    final result = await db.query(TABLE_EBOOK, columns: ['category']);

    final Set<String> categorySet = {};

    for (var row in result) {
      final rawCategory = row['category']?.toString() ?? '';
      final splitCategories = rawCategory
          .split(',')
          .map((cat) => cat.trim().toUpperCase())
          .where((cat) => cat.isNotEmpty);
      categorySet.addAll(splitCategories);
    }
    return categorySet.toList()..sort(); // Sorted list
  }

  Future<List<String>> getAllLanguages() async {
    final db = await instance.getDB();
    final result = await db.rawQuery('SELECT DISTINCT language FROM $TABLE_EBOOK');
    return result.map((e) => e['language'].toString()).toList();
  }

//// NEW E-BOOK

  Future<List<Map<String, dynamic>>> newEbooks() async {
    final db = await getDB();
    return await db.query(
      TABLE_EBOOK,
      orderBy: 'bookid DESC',
    );
  }



  Future<void> removeDownload(int bookId) async {
    final db = await instance.getDB();
    await db.update(
      'TABLE_EBOOK', // Make sure this matches your table name
      {'downloadUrl': null},
      where: 'bookid = ?',
      whereArgs: [bookId],
    );
  }

  ///// SUBSCRIPTION

  Future<bool> isUserSubscribed(String email) async {
    final db = await getDB();

    // Get user by email
    final userResult = await db.query(
      TABLE_USER,
      where: 'email = ?',
      whereArgs: [email],
    );

    if (userResult.isEmpty) return false;

    final userId = userResult.first['id'] as int;
    final subResult = await db.query(
      TABLE_SUBSCRIPTION,
      where: 'userId = ? AND isActive = 1',
      whereArgs: [userId],
      orderBy: 'expiryDate DESC',
      limit: 1,
    );

    if (subResult.isEmpty) return false;

    final expiryDateStr = subResult.first['expiryDate'] as String;
    final expiryDate = DateTime.tryParse(expiryDateStr);
    if (expiryDate == null) return false;
    return expiryDate.isAfter(DateTime.now());
  }



  Future<void> updateSubscription({
    required String email,
    required bool isSubscribed,
    required String subscriptionPlan,
    required DateTime subscriptionExpiry,
  }) async {
    final db = await getDB();
    final user = await getCurrentUser(email);
    if (user == null) return;

    // Check if subscription exists
    final existing = await db.query(TABLE_SUBSCRIPTION, where: 'userId = ?', whereArgs: [user.id]);

    final values = {
      'isActive': isSubscribed ? 1 : 0,
      'plan': subscriptionPlan,
      'expiryDate': subscriptionExpiry.toIso8601String(),
      'userId': user.id,
    };

    if (existing.isEmpty) {
      await db.insert(TABLE_SUBSCRIPTION, values);
    } else {
      await db.update(
        TABLE_SUBSCRIPTION,
        values,
        where: 'userId = ?',
        whereArgs: [user.id],
      );
    }
  }



}






