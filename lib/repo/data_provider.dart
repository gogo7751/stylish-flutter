import 'package:stylish/data/product.dart';
import 'package:dio/dio.dart';
import 'package:stylish/utils/constansts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

const baseUrl = 'https://${Constants.apiUrl}/api/${Constants.version}';

class DataProvider {
  final Dio _dio = Dio();
  final options = Options(
    headers: {'Content-Type': 'application/json'},
    responseType: ResponseType.json,
  );

  Future<List<Hots>> getHots() async {
    final response = await http.get(
      Uri.parse('$baseUrl/marketing/hots'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      // 解析回傳資料
      final hotsJson = jsonDecode(response.body)['data'] as List<dynamic>;
      final hots = hotsJson.map((json) => Hots.fromJson(json)).toList();

      return hots;
    } else {
      // 請求失敗
      throw Exception('Failed to load products');
    }
  }

  Future<List<Product>> getProductList() async {
    List<Product> allProducts = [];

    final queryParameters = {'paging': 1};
    bool hasMoreData = true;
    while (hasMoreData) {
      const productListUrl = "$baseUrl/products/all";
      final response = await _dio.get(
        productListUrl,
        queryParameters: queryParameters,
        options: options,
      );

      if (response.statusCode == 200) {
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
      } else {
        // 請求失敗
        throw Exception('Failed to load products');
      }
    }

    return allProducts;
  }

  Future<Product> getProductDetail(int id) async {
    final queryParameters = {'id': id};
    final options = Options(
      headers: {'Content-Type': 'application/json'},
      responseType: ResponseType.json,
    );

    final response = await _dio.get(
      "$baseUrl/products/details",
      queryParameters: queryParameters,
      options: options,
    );
    if (response.statusCode == 200) {
      // 解析回傳資料
      final productDetailJson = response.data['data'];
      final productDetail = Product.fromJson(productDetailJson);
      print(response.data);
      return productDetail;
    } else {
      // 請求失敗
      throw Exception('Failed to load products');
    }
  }
}
