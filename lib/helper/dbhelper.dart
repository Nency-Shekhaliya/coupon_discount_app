import 'package:coupon_discount_app/models/couponcode_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Databasehelper {
  Databasehelper._();
  static final Databasehelper databasehelper = Databasehelper._();

  Database? db;
  int code;
  int discount;
  Future<void> initdb() async {
    String directory = await getDatabasesPath();

    String path = join(directory, "Coupon.db");
    db = await openDatabase(path, version: 1, onCreate: (Database db, int ver) {
      String Qurey =
          "CREATE TABLE IF NOT EXISTS Coupon_code(Id INTEGER PRIMARY KEY AUTOINCREMENT,$code INTEGER NOT NULL,$discount INTEGER NOT NULL );";
      db.execute(Qurey);
    });
  }

  Future<int> insertdata({required Couponcode couponcode}) async {
    await initdb();
    String Query = "INSERT INTO Coupon_code (code,discount) VALUES(?,?);";
    List arguments = [couponcode.code, couponcode.discount];
    return db!.rawInsert(Query, arguments);
  }

  Future<List<Couponcode>> fetchdata({required Couponcode couponcode}) async {
    await initdb();
    String Query = " SELECT * FROM Coupon_code ";
    List<Map<String, dynamic>> alldata = await db!.rawQuery(Query);

    List<Couponcode> onedata =
        alldata.map((e) => Couponcode.frommap(data: e)).toList();
    return onedata;
  }
}
