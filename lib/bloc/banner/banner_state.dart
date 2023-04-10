part of 'banner_bloc.dart';

abstract class BannerState {
  List<ImageList>? imageList;

  BannerState(this.imageList);
}

class BannerInitial extends BannerState {
  BannerInitial() : super(null);
}

class BannerLoadingState extends BannerState {
  BannerLoadingState() : super(null);
}

class BannerSuccessState extends BannerState {
  @override
  List<ImageList>? imageList;

  BannerSuccessState(this.imageList) : super(imageList);
}

class BannerErrorState extends BannerState {
  String errorMsg = "";

  BannerErrorState(this.errorMsg) : super(null);
}
