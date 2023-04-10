import 'package:stylish/data/product.dart';

class DataProvider {
  Future<List<ImageList>> getImageList() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return bannerList;
  }

  Future<List<Product>> getProductList() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return productList;
  }

  Future<ProductDetail?> getProductDetail(String id) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return productDetail;
  }
}
