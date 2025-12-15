import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database? _database;

  DatabaseHelper._instance();

  Future<Database> get db async {
    _database ??= await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'product.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE product (
        id INTEGER PRIMARY KEY,
        title TEXT,
        price  REAL,
         rating REAL,
        shippingInformation TEXT, 
        reviews INTEGER,
        image  TEXT
      )
    ''');
  }

  Future<int> insert(Map<String, dynamic> data, String tableName) async {
    Database db = await instance.db;
    try {
      return await db.insert(tableName, data);
    } catch (e) {
      print(e.toString());
    }
    return Future.value(0);
  }

  Future<List<Map<String, dynamic>>> queryAll(String tableName) async {
    Database db = await instance.db;
    return await db.query(tableName);
  }

  Future<int> delete(int id, String tableName) async {
    Database db = await instance.db;
    return await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
