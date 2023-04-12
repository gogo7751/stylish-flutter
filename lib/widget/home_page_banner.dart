import 'package:flutter/material.dart';
import 'package:stylish/bloc/banner/banner_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/widget/image.dart';

class BannerList extends StatelessWidget {
  const BannerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerBloc, BannerState>(builder: (context, state) {
      if (state is BannerLoadingState) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is BannerSuccessState) {
        return SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.hots![0].products.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  width: 250.0,
                  margin: const EdgeInsets.only(
                      top: 20, bottom: 10, left: 10, right: 10),
                  child: MyImageWidget(
                    imageUrl: state.hots![0].products[index].mainImage,
                    borderRadiusTopLeft: 10,
                    borderRadiusTopRight: 10,
                    borderRadiusBottomLeft: 10,
                    borderRadiusBottomRight: 10,
                    fit: BoxFit.cover,
                  ));
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
