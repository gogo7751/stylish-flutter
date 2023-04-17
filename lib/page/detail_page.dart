import 'package:flutter/material.dart';
import 'package:stylish/widget/app_bar.dart';
import 'package:stylish/data/product.dart';
import 'package:stylish/widget/detail_top.dart';
import 'package:stylish/widget/detail_middle.dart';
import 'package:stylish/widget/detail_bottom.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/repo/product_repository.dart';
import 'package:stylish/bloc/product_detail/product_detail_bloc.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.id});

  final int id;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    bool isLargeScreen = MediaQuery.of(context).size.width > 800;
    ProductRepository productRepo = ProductRepository();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ProductDetailBloc(productRepo)
            ..add(ProductDetailLoadEvent(productId: widget.id)),
        ),
      ],
      child: Scaffold(
          appBar: const MyAppBar(),
          body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
              builder: (context, state) {
            if (state is ProductDetailLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ProductDetailSuccessState) {
              return Center(
                child: Container(
                  width:
                      isLargeScreen ? 800 : MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Expanded(
                        child: ScrollConfiguration(
                          behavior: ScrollConfiguration.of(context)
                              .copyWith(scrollbars: false),
                          child: ListView(children: [
                            isLargeScreen
                                ? DetailPageWeb(
                                    productDetail: state.productDetail!,
                                    widget: widget)
                                : DetailPagePhone(
                                    productDetail: state.productDetail!,
                                    widget: widget),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            if (state is ProductDetailErrorState) {
              return Center(
                child: Text(state.errorMsg),
              );
            }
            return Container();
          })),
    );
  }
}

class DetailPagePhone extends StatelessWidget {
  const DetailPagePhone({
    super.key,
    required this.productDetail,
    required this.widget,
  });

  final Product productDetail;
  final DetailPage widget;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      DetailTop(productDetail: productDetail),
      DetailMiddle(
        productDetail: productDetail,
        widget: widget,
      ),
      DetailBottom(productDetail: productDetail),
    ]);
  }
}

class DetailPageWeb extends StatelessWidget {
  const DetailPageWeb({
    super.key,
    required this.productDetail,
    required this.widget,
  });

  final Product productDetail;
  final DetailPage widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Center(
                child: DetailTop(productDetail: productDetail),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: DetailMiddle(
                productDetail: productDetail,
                widget: widget,
              ),
            ),
          ],
        ),
        DetailBottom(productDetail: productDetail),
      ],
    );
  }
}
