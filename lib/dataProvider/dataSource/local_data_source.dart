import 'package:sqflite/sqflite.dart';
import 'package:stylish/data/db_product.dart';
import 'package:stylish/data/product.dart';
import 'package:stylish/dataProvider/dataSource/base_data_source.dart';
import 'package:stylish/dataprovider/local_db.dart';

class LocalDataSource extends BaseDataSource {
  static const String CART_TABLE = 'cart';
  final LocalDB _localDB = LocalDB();

  @override
  Future<List<Hots>> getHots() async {
    // TODO: implement getHots
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getProductList() async {
    // TODO: implement getProductList
    throw UnimplementedError();
  }

  @override
  Future<Product> getProductDetail(int id) async {
    // TODO: implement getProductDetail
    throw UnimplementedError();
  }

  @override
  Future<void> deleteFromCart(int id) async {
    final db = await _localDB.getDB();

    await db.delete(
      CART_TABLE,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future addToCart(DBProduct product) async {
    final db = await _localDB.getDB();

    await db.insert(
      CART_TABLE,
      product.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<DBProduct>> getProductsFromCart() async {
    final db = await _localDB.getDB();

    final List<Map<String, dynamic>> maps = await db.query(CART_TABLE);

    return List.generate(maps.length, (i) {
      return DBProduct(
        id: maps[i]['id'],
        productId: maps[i]['productId'],
        imageUrl: maps[i]['imageUrl'],
        name: maps[i]['name'],
        colorCode: maps[i]['colorCode'],
        size: maps[i]['size'],
        count: maps[i]['count'],
        price: maps[i]['price'],
      );
    });
  }
}
