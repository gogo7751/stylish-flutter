import 'package:stylish/data/product.dart';
import 'package:stylish/data/db_product.dart';

abstract class BaseDataSource {
  Future<List<Hots>> getHots();

  Future<List<Product>> getProductList();

  Future<Product> getProductDetail(int id);

  Future addToCart(DBProduct product);

  Future<List<DBProduct>> getProductsFromCart();

  Future<void> deleteFromCart(int id);
}
