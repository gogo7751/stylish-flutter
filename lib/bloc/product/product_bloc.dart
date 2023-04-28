import 'package:bloc/bloc.dart';
import 'package:stylish/data/product.dart';
import 'package:stylish/dataProvider/repo/stylish_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final StylishRepository stylishRepo;

  ProductBloc(this.stylishRepo) : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async {
      emit(ProductLoadingState());
      try {
        var data = await stylishRepo.getProduct();
        emit(ProductSuccessState(data));
      } catch (e) {
        emit(ProductErrorState(e.toString()));
      }
    });
  }
}
