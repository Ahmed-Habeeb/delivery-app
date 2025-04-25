import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class OrderDatabase {
  static final OrderDatabase instance = OrderDatabase._init();
  static Database? _database;

  OrderDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('orders.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE delivery_bills (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        bill_srl TEXT NOT NULL UNIQUE,
        bill_type TEXT,
        bill_no TEXT,
        bill_date TEXT,
        bill_time TEXT,
        bill_amt TEXT,
        tax_amt TEXT,
        dlvry_amt TEXT,
        mobile_no TEXT,
        cstmr_nm TEXT,
        rgn_nm TEXT,
        cstmr_build_no TEXT,
        cstmr_floor_no TEXT,
        cstmr_aprtmnt_no TEXT,
        cstmr_addrss TEXT,
        latitude TEXT,
        longitude TEXT,
        dlvry_status_flg TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE result (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        err_no INTEGER,
        err_msg TEXT
      )
    ''');
  }

  Future<void> insertDeliveryBills(List<Map<String, dynamic>> bills) async {
    final db = await instance.database;
    final batch = db.batch();
    for (var bill in bills) {
      batch.insert('delivery_bills', bill,
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await batch.commit();
  }

  Future<void> insertResult(Map<String, dynamic> result) async {
    final db = await instance.database;
    await db.insert('result', result,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getDeliveryBills() async {
    final db = await instance.database;
    return await db.query('delivery_bills');
  }

  Future<Map<String, dynamic>?> getResult() async {
    final db = await instance.database;
    final results = await db.query('result', limit: 1);
    return results.isNotEmpty ? results.first : null;
  }

  Future<void> clearCache() async {
    final db = await instance.database;
    await db.delete('delivery_bills');
    await db.delete('result');
  }

  Future<void> close() async {
    final db = await instance.database;
    await db.close();
  }
}