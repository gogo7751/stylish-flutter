import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stylish/widget/home_page_banner.dart';
import 'package:stylish/widget/home_page_prodcut_list.dart';
import 'package:stylish/widget/app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/dataProvider/repo/stylish_repository.dart';
import 'package:stylish/bloc/banner/banner_bloc.dart';
import 'package:stylish/bloc/product/product_bloc.dart';
import 'package:stylish/data/tappay.dart';
import 'dart:convert';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StylishRepository stylishRepo = StylishRepository();

    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => BannerBloc(stylishRepo)..add(BannerLoadEvent()),
          ),
          BlocProvider(
            create: (_) => ProductBloc(stylishRepo)..add(ProductLoadEvent()),
          ),
        ],
        child: (Scaffold(
          appBar: const MyAppBar(),
          body: Column(
            children: [
              BannerList(),
              // PlatformChannel(),
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
  String _prime = '';

  @override
  void initState() {
    super.initState();
    _setupTappay();
  }

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

  Future<void> _setupTappay() async {
    await platform.invokeMethod(
      'setupTappay',
      {
        'appId': 130312,
        'appKey':
            "app_Dip159xUHDkRJsnmKlFTfYxWxngTp2AmYeRCbUmgyBNwJZS8DURtHppyWm4e",
        'serverType': "sandBox",
      },
    );
  }

  Future<void> _isCardValid() async {
    await platform.invokeMethod(
      'isCardValid',
      {
        'cardNumber': '4242424242424242',
        'dueMonth': '01',
        'dueYear': '26',
        'ccv': '123',
      },
    );
  }

  Future<void> _getPrime() async {
    String prime;
    try {
      final String result = await platform.invokeMethod(
        'getPrime',
        {
          'cardNumber': '4242424242424242',
          'dueMonth': '01',
          'dueYear': '26',
          'ccv': '123',
        },
      );
      prime = 'Get prime: ${Prime.fromJson(json.decode(result)).prime}';
    } on PlatformException catch (e) {
      prime = 'Error: ${e.message}';
    }

    setState(() {
      _prime = prime;
    });
  }

  //GooglePay prepare payment data
  static Future<void> _preparePaymentData() async {
    await platform.invokeMethod(
      'preparePaymentData',
      {
        'allowedNetworks': [3],
        'allowedAuthMethods': [0],
        'merchantName': 'TEST MERCHANT',
        'isPhoneNumberRequired': false,
        'isShippingAddressRequired': false,
        'isEmailRequired': false,
      },
    );
  }

  //request google pay payment data
  static Future<void> _requestPaymentData() async {
    await platform.invokeMethod(
      'requestPaymentData',
      {
        'totalPrice': "1",
        'currencyCode': "TWD",
      },
    );
  }

  // //Get google pay prime
  static Future<void> _getGooglePayPrime() async {
    await platform.invokeMethod('getGooglePayPrime');
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
        ElevatedButton(
          child: const Text('Direct pay is card valid'),
          onPressed: () => _isCardValid(),
        ),
        ElevatedButton(
          child: const Text('Direct pay get prime'),
          onPressed: () => _getPrime(),
        ),
        Text(_prime),
        ElevatedButton(
          child: const Text('Google pay set payment info'),
          onPressed: () => _preparePaymentData(),
        ),
        ElevatedButton(
          child: const Text('Google pay set price'),
          onPressed: () => _requestPaymentData(),
        ),
        ElevatedButton(
          child: const Text('Google pay get prime'),
          onPressed: () => _getGooglePayPrime(),
        ),
      ],
    );
  }
}
