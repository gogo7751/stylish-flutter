import 'package:stylish/data/product.dart';

abstract class BaseRepository {
  Future<List<ImageList>> getImageList();

  Future<List<Product>> getProduct();

  Future<ProductDetail?> getProductDetail(String id);
}
