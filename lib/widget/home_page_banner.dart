import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:stylish/bloc/banner/banner_bloc.dart';
import 'package:stylish/widget/image.dart';
import 'package:stylish/page/detail_page.dart';

class BannerList extends StatelessWidget {
  const BannerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerBloc, BannerState>(builder: (context, state) {
      if (state is BannerLoadingState) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is BannerSuccessState) {
        final List<dynamic> productList = [];
        state.hots!.forEach((data) {
          final List<dynamic> products = data.products;
          productList.addAll(products);
        });

        return SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: productList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailPage(id: productList[index].id),
                      ));
                },
                child: Container(
                    width: 250.0,
                    margin: const EdgeInsets.only(
                        top: 20, bottom: 10, left: 10, right: 10),
                    child: MyImageWidget(
                      imageUrl: productList[index].mainImage,
                      borderRadiusTopLeft: 10,
                      borderRadiusTopRight: 10,
                      borderRadiusBottomLeft: 10,
                      borderRadiusBottomRight: 10,
                      fit: BoxFit.cover,
                    )),
              );
            },
          ),
        );
      }
      if (state is BannerErrorState) {
        return Center(
          child: Text(state.errorMsg),
        );
      }
      return Container();
    });
  }
}
