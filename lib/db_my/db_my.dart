
import 'package:get/get.dart';
import 'package:my_diary/db_my/my_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DBMy extends GetxService {
  late Database dbBase;

  Future<DBMy> init() async {
    await createMyDB();
    return this;
  }

  createMyDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'my.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createMyTable(db);
        });
  }

  createMyTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS my (id INTEGER PRIMARY KEY, createdTime TEXT, type INTEGER, pinned INTEGER, pinnedTime TEXT, content TEXT)');
  }

  insertMy(MyEntity entity) async {
    final id = await dbBase.insert('my', {
      'createdTime': entity.createdTime.toIso8601String(),
      'type':entity.type,
      'pinned':entity.pinned,
      'pinnedTime':entity.pinnedTime.toIso8601String(),
      'content':entity.content
    });
    return id;
  }

  updateMy(MyEntity entity) async {
    await dbBase.update(
        'my',
        {
          'pinned':entity.pinned,
          'pinnedTime':entity.pinnedTime.toIso8601String(),
        },
        where: 'id = ?',
        whereArgs: [entity.id]);
  }

  deleteMy(MyEntity entity) async {
    await dbBase.delete('my', where: 'id = ?', whereArgs: [entity.id]);
  }

  cleanMyData() async {
    await dbBase.delete('my');
  }

  Future<List<MyEntity>> getMyAllData() async {
    var result = await dbBase.query('my', orderBy: 'createdTime DESC');
    var here = result.map((e) => MyEntity.fromJson(e)).toList();
    here.sort((a, b) {
      if (a.pinned != b.pinned) {
       return b.pinned.compareTo(a.pinned);
      } else {
        return b.pinnedTime.compareTo(a.pinnedTime);
      }
    });
    return here;
  }
}
