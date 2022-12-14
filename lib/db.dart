import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartHelper {
  // 데이터베이스를 시작한다.
  Future _openDb() async {  
    final databasePath = await getDatabasesPath();
    String path = join(databasePath, 'my_database.db');
  
    final db = await openDatabase(
      path,
      version: 1,
      onConfigure: (Database db) => {},
      onCreate: _onCreate,
      onUpgrade: (Database db, int oldVersion, int newVersion) => {},
    );
  }

  // 데이터베이스 테이블을 생성한다.
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS posts (
        id INTEGER PRIMARY KEY,
        title TEXT NOT NULL,
        content TEXT NOT NULL,
        created_at TEXT NOT NULL
      )
    ''');
  }
  
  // 새로운 데이터를 추가한다.
  Future add(item) async {
    final db = await _openDb();
    item.id = await db.insert(
      'posts',  // table name
      {           
        'title': 'new post ...',
        'content': 'this is add method',
        'created_at': '2022-01-01 00:00:00',
      },  // new post row data	
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return item;
  }
  
  // 변경된 데이터를 업데이트한다.
  Future update(item) async {
    final db = await _openDb();
    await db.update(
      'posts',  // table name
      {
        'title': 'changed post title ...',
        'content': 'changed post content ...',
      },  // update post row data
      where: 'id = ?',
      whereArgs: [item.id],
    );
    return item;
  }
  
  // 데이터를 삭제한다.
  Future<int> remove(int id) async {
    final db = await _openDb();
    await db.delete(
      'posts', // table name
      where: 'id = ?',
      whereArgs: [id],
    );
    return id;
  }
}