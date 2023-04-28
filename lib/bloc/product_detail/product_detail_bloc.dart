import 'package:bloc/bloc.dart';
import 'package:stylish/data/product.dart';
import 'package:stylish/dataProvider/repo/stylish_repository.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final StylishRepository stylishRepo;

  ProductDetailBloc(this.stylishRepo) : super(ProductDetailInitial()) {
    on<ProductDetailLoadEvent>((event, emit) async {
      emit(ProductDetailLoadingState());
      try {
        var data = await stylishRepo.getProductDetail(event.productId);
        emit(ProductDetailSuccessState(data));
      } catch (e) {
        emit(ProductDetailErrorState(e.toString()));
      }
    });
  }
}
