import 'package:stylish/data/product.dart';
import 'package:stylish/data/db_product.dart';
import 'package:stylish/dataProvider/repo/base_repository.dart';
import 'package:stylish/dataProvider/dataSource/local_data_source.dart';
import 'package:stylish/dataProvider/dataSource/remote_data_source.dart';

class StylishRepository extends BaseRepository {
  final RemoteDataSource _remoteDataSource = RemoteDataSource();
  final LocalDataSource _localDataSource = LocalDataSource();

  @override
  Future<List<Hots>> getHots() => _remoteDataSource.getHots();

  @override
  Future<List<Product>> getProduct() => _remoteDataSource.getProductList();

  @override
  Future<Product> getProductDetail(int id) =>
      _remoteDataSource.getProductDetail(id);

  @override
  Future addToCart(DBProduct product) => _localDataSource.addToCart(product);

  @override
  Future<List<DBProduct>> getProductsFromCart() =>
      _localDataSource.getProductsFromCart();

  @override
  Future<void> deleteFromCart(int id) => _localDataSource.deleteFromCart(id);
}
