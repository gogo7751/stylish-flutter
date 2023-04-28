part of 'banner_bloc.dart';

abstract class BannerState {
  List<Hots>? hots;

  BannerState(this.hots);
}

class BannerInitial extends BannerState {
  BannerInitial() : super(null);
}

class BannerLoadingState extends BannerState {
  BannerLoadingState() : super(null);
}

class BannerSuccessState extends BannerState {
  BannerSuccessState(List<Hots> hots) : super(hots);
}

class BannerErrorState extends BannerState {
  String errorMsg = "Nooooooooooooooooooooooooo";

  BannerErrorState(this.errorMsg) : super(null);
}
