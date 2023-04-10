import 'package:stylish/data/product.dart';
import 'package:stylish/repo/base_repository.dart';
import 'package:stylish/repo/data_provider.dart';

class ProductRepository extends BaseRepository {
  final DataProvider _dataProvider = DataProvider();

  @override
  Future<List<ImageList>> getImageList() => _dataProvider.getImageList();

  @override
  Future<List<Product>> getProduct() => _dataProvider.getProductList();

  @override
  Future<ProductDetail?> getProductDetail(String id) =>
      _dataProvider.getProductDetail(id);
}
