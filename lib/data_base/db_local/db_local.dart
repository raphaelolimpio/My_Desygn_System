import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
// exemplo de db local onde uma tabela depende da outra; verifica se a tab1 existe, para depois iniciar a tab2
// caso a tab1 não exista, a tab2 não será criada
// e não será possível inserir dados nela. Isso é útil para garantir a integridade referencial entre as tabelas.
// Isso significa que a tabela 2 só pode ser criada se a tabela 1 já existir no banco de dados.
// Isso é útil para garantir a integridade referencial entre as tabelas.
//no caso, caso a tab1 não exista, ela ira criar uma nova tab1, para que a tab2 seja criada

class DatabaseHelper {
  static Database? _database;
  final String _dbName = 'database.db';
  final String _Table1 = 'db1';
  final String _Table2 = 'db2';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE $_Table1 (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            driverName TEXT,
            vanModel TEXT,
            seatCount INTEGER
          )
        ''');
        db.execute('''
          CREATE TABLE $_Table2 (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            gender INTEGER,
            address TEXT,
            phone TEXT,
            creditAmount REAL,
            depositedAmount REAL,
            vanId INTEGER,
            FOREIGN KEY(tab1Id) REFERENCES $_Table1(id)
          )
        ''');
      },
      version: 1,
    );
  }

  Future<int> addUserTab1(String name, String model, int seatCount) async {
    final db = await database;
    return await db.insert(_Table1, {
      'name': name,
      'model': model,
      'seatCount': seatCount,
    });
  }

  Future<List<Map<String, dynamic>>> getUserTab1() async {
    final db = await database;
    return await db.query(_Table1);
  }

  Future<void> openDatabaseForTab1(String dbName) async {
    join(await getDatabasesPath(),
        dbName); // Adjust this method to handle different databases if needed
    // For simplicity, this example assumes a single database
    _database = await openDatabase(
      join(await getDatabasesPath(), dbName),
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE $_Table2 (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            gender INTEGER,
            address TEXT,
            phone TEXT,
            creditAmount REAL,
            depositedAmount REAL,
            vanId INTEGER,
            FOREIGN KEY(tab1Id) REFERENCES $_Table1(id)
          )
        ''');
      },
    );
  }

  Future<int> addTab2(
    String name,
    bool isMale,
    String address,
    String phone,
    double creditAmount,
    double depositedAmount,
    int tab1Id,
  ) async {
    final db = await database;
    return await db.insert(_Table2, {
      'name': name,
      'gender': isMale ? 1 : 0,
      'address': address,
      'phone': phone,
      'creditAmount': creditAmount,
      'depositedAmount': depositedAmount,
      'vanId': tab1Id,
    });
  }

  Future<List<Map<String, dynamic>>> getTab2(int tab1Id) async {
    final db = await database;
    return await db.query(
      _Table2,
      where: 'vanId = ?',
      whereArgs: [tab1Id],
    );
  }
}
