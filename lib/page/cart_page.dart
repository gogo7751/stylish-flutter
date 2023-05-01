import 'package:flutter/material.dart';
import 'package:stylish/widget/app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/bloc/cart/cart_bloc.dart';
import 'package:stylish/widget/text_style.dart';
import 'package:stylish/dataProvider/repo/stylish_repository.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLargeScreen = MediaQuery.of(context).size.width > 800;
    StylishRepository stylishRepo = StylishRepository();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CartBloc(stylishRepo)..add(CartLoadEvent()),
        ),
      ],
      child: Scaffold(
        appBar: const MyAppBar(),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CartSuccessState) {
              return Center(
                  child: Container(
                      width: isLargeScreen
                          ? 800
                          : MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          TextWithStyle(
                            text: "購物車",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ],
                      )));
            }
            if (state is CartErrorState) {
              return Center(
                child: Text(state.errorMsg),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
