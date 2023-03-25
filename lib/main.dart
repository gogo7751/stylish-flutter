import 'package:flutter/material.dart';
import 'package:stylish/widget/home_page_banner.dart';
import 'package:stylish/widget/home_page_prodcut_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'stylish',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(241, 244, 248, 10),
        elevation: 4.0,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          background: Image.asset(
            'assets/images/app_bar_logo.png',
            scale: 3.0,
            fit: BoxFit.none,
          ),
        ),
      ),
      body: Column(children: [
        BannerList(),
        HomePageProductList(),
      ]),
    );
  }
}
