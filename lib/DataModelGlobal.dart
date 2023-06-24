import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'DataModelRecords.dart';

class DataModelGlobal {
  static final DataModelGlobal instance = DataModelGlobal._init();

  static Database? _database;

  DataModelGlobal._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('golf.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE ${DataModelRecords.tableNameRecords} ( 
  ${DataModelRecords.columnId} $idType, 
  ${DataModelRecords.columnExerciseId} $integerType,
  ${DataModelRecords.columnRepetitions} $integerType,
  ${DataModelRecords.columnShotsMade} $integerType,
  ${DataModelRecords.columnDateTime} $textType,
  ${DataModelRecords.columnGrade} $textType
  )
''');

    await db.execute('''
CREATE TABLE ${DataModelRecords.tableNameUsers} ( 
  ${DataModelRecords.columnId} $idType, 
  ${DataModelRecords.columnUserName} $textType,
  ${DataModelRecords.columnLanguage} $textType
  )
''');
  }

  Future<void> create(DataModelRecords dataModelRecords) async {
    final db = await instance.database;
    await db.insert(
        DataModelRecords.tableNameRecords, dataModelRecords.toMap());
  }

  Future<List<DataModelRecords>> readAllRecords() async {
    final db = await instance.database;

    const orderBy = '${DataModelRecords.columnDateTime} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result =
        await db.query(DataModelRecords.tableNameRecords, orderBy: orderBy);

    return result.map((json) => DataModelRecords.fromMap(json)).toList();
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
