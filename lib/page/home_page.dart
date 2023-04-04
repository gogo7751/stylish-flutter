import 'package:flutter/material.dart';
import 'package:stylish/widget/home_page_banner.dart';
import 'package:stylish/widget/home_page_prodcut_list.dart';
import 'package:stylish/widget/app_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Column(
        children: [
          BannerList(),
          const HomePageProductList(),
        ],
      ),
    );
  }
}
