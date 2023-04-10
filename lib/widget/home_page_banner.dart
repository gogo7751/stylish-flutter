import 'package:flutter/material.dart';
import 'package:stylish/bloc/banner/banner_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.imageList!.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  width: 250.0,
                  margin: const EdgeInsets.only(
                      top: 20, bottom: 10, left: 10, right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: state.imageList?[index].image ?? Container(),
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
