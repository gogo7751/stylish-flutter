import 'package:stylish/data/product.dart';
import 'package:stylish/utils/constansts.dart';
import 'package:stylish/utils/dio.dart';
import 'package:stylish/utils/http.dart';
import 'dart:convert';

class DataProvider {
  // http
  Future<List<Hots>> getHots() async {
    final response = await HttpClient().client.get(
      Uri.parse(
          'https://${Constants.apiUrl}/api/${Constants.version}/marketing/hots'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      // 解析回傳資料
      final hotsJson = jsonDecode(response.body)['data'] as List<dynamic>;
      final hots = hotsJson.map((json) => Hots.fromJson(json)).toList();

      return hots;
    } else {
      // 請求失敗
      throw Exception('Failed to load hots');
    }
  }

  // dio
  Future<List<Product>> getProductList() async {
    List<Product> allProducts = [];

    final queryParameters = {'paging': 1};
    bool hasMoreData = true;
    while (hasMoreData) {
      const productListUrl = "/products/all";
      final response = await DioClient().dio.get(
            productListUrl,
            queryParameters: queryParameters,
          );
      // 解析回傳資料
      final productsJson = response.data['data'] as List<dynamic>;
      final products =
          productsJson.map((json) => Product.fromJson(json)).toList();

      // 將資料拼接到 allProducts
      allProducts.addAll(products);

      if (response.data['next_paging'] == null) {
        // 如果已經到最後一頁，hasMoreData 設為 false
        hasMoreData = false;
      } else {
        queryParameters["paging"] = response.data['next_paging'];
      }
    }

    return allProducts;
  }

  Future<Product> getProductDetail(int id) async {
    final queryParameters = {'id': id};

    final response = await DioClient().dio.get(
          "/products/details",
          queryParameters: queryParameters,
        );

    // 解析回傳資料
    final productDetailJson = response.data['data'];
    final productDetail = Product.fromJson(productDetailJson);

    return productDetail;
  }
}
