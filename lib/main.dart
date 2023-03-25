import 'package:flutter/material.dart';

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
  List<String> images = [
    'https://picsum.photos/200',
    'https://picsum.photos/201',
    'https://picsum.photos/202',
    'https://picsum.photos/203',
    'https://picsum.photos/204',
    'https://picsum.photos/205',
    'https://picsum.photos/206',
    'https://picsum.photos/207',
    'https://picsum.photos/208',
    'https://picsum.photos/209'
  ];

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
        BannerListView(images: images),
      ]),
    );
  }
}

class BannerListView extends StatelessWidget {
  const BannerListView({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 200.0,
            margin:
                const EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(images[index]),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
          );
        },
      ),
    );
  }
}
