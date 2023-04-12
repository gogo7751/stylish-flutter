import 'package:stylish/data/product.dart';

abstract class BaseRepository {
  Future<List<Hots>> getHots();

  Future<List<Product>> getProduct();

  Future<Product> getProductDetail(int id);
}
