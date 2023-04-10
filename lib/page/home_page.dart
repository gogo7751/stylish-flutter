import 'package:flutter/material.dart';
import 'package:stylish/widget/home_page_banner.dart';
import 'package:stylish/widget/home_page_prodcut_list.dart';
import 'package:stylish/widget/app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/repo/product_repository.dart';
import 'package:stylish/bloc/banner/banner_bloc.dart';
import 'package:stylish/bloc/product/product_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductRepository productRepo = ProductRepository();

    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => BannerBloc(productRepo)..add(BannerLoadEvent()),
          ),
          BlocProvider(
            create: (_) => ProductBloc(productRepo)..add(ProductLoadEvent()),
          ),
        ],
        child: (const Scaffold(
          appBar: MyAppBar(),
          body: Column(
            children: [
              BannerList(),
              HomePageProductList(),
            ],
          ),
        )));
  }
}
