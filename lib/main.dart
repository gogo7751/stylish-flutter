import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/page/home_page.dart';
import 'package:stylish/repo/product_repository.dart';
import 'package:stylish/bloc/banner/banner_bloc.dart';
import 'package:stylish/bloc/product/product_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
      child: MaterialApp(
        title: 'stylish',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
