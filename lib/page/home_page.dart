import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        child: (Scaffold(
          appBar: MyAppBar(),
          body: Column(
            children: [
              BannerList(),
              PlatformChannel(),
              HomePageProductList(),
            ],
          ),
        )));
  }
}

class PlatformChannel extends StatefulWidget {
  const PlatformChannel({Key? key}) : super(key: key);

  @override
  PlatformChannelState createState() => PlatformChannelState();
}

class PlatformChannelState extends State<PlatformChannel> {
  static const platform = MethodChannel('com.example.stylish');
  String _message = 'No message received.';

  Future<void> _helloFromNative(String name) async {
    String message;
    try {
      final String result =
          await platform.invokeMethod('helloFromNative', {'name': name});
      message = 'Native message: $result';
    } on PlatformException catch (e) {
      message = 'Error: ${e.message}';
    }

    setState(() {
      _message = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ElevatedButton(
          child: const Text('Say hello from Native!'),
          onPressed: () => _helloFromNative('Flutter'),
        ),
        Text(_message),
      ],
    );
  }
}
