import 'package:bloc/bloc.dart';
import 'package:stylish/data/product.dart';
import 'package:stylish/dataProvider/repo/stylish_repository.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final StylishRepository stylishRepo;

  BannerBloc(this.stylishRepo) : super(BannerInitial()) {
    on<BannerEvent>((event, emit) async {
      emit(BannerLoadingState());
      try {
        var data = await stylishRepo.getHots();
        emit(BannerSuccessState(data));
      } catch (e) {
        emit(BannerErrorState(e.toString()));
      }
    });
  }
}
