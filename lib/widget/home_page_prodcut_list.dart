import 'package:flutter/material.dart';
import 'package:stylish/widget/home_page_product_phone.dart';
import 'package:stylish/widget/home_page_product_web.dart';

class HomePageProductList extends StatelessWidget {
  const HomePageProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    const double minScreenWidth = 800.0;

    if (screenWidth < minScreenWidth) {
      return ProductListPhone();
    } else {
      return ProductListWeb();
    }
  }
}
