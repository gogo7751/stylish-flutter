import 'package:stylish/data/product.dart';
import 'package:stylish/repo/base_repository.dart';
import 'package:stylish/repo/data_provider.dart';

class ProductRepository extends BaseRepository {
  final DataProvider _dataProvider = DataProvider();

  @override
  Future<List<Hots>> getHots() => _dataProvider.getHots();

  @override
  Future<List<Product>> getProduct() => _dataProvider.getProductList();

  @override
  Future<Product> getProductDetail(int id) =>
      _dataProvider.getProductDetail(id);
}
