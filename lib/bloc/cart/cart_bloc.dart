import 'package:bloc/bloc.dart';
import 'package:stylish/data/db_product.dart';
import 'package:stylish/dataProvider/repo/stylish_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final StylishRepository stylishRepo;
  CartBloc(this.stylishRepo) : super(CartInitial()) {
    on<CartEvent>((event, emit) async {
      emit(CartLoadingState());
      try {
        var data = await stylishRepo.getProductsFromCart();
        emit(CartSuccessState(data));
      } catch (e) {
        emit(CartErrorState(e.toString()));
      }
    });
    on<DeleteEvent>((event, emit) async {
      try {
        await stylishRepo.deleteFromCart(event.id);
        var data = await stylishRepo.getProductsFromCart();
        emit(CartSuccessState(data));
      } catch (e) {
        emit(CartErrorState(e.toString()));
      }
    });
  }
}
