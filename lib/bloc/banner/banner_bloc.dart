import 'package:bloc/bloc.dart';
import 'package:stylish/data/product.dart';
import 'package:stylish/repo/product_repository.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final ProductRepository productRepo;

  BannerBloc(this.productRepo) : super(BannerInitial()) {
    on<BannerEvent>((event, emit) async {
      emit(BannerLoadingState());
      try {
        var data = await productRepo.getHots();
        emit(BannerSuccessState(data));
      } catch (e) {
        emit(BannerErrorState(e.toString()));
      }
    });
  }
}
