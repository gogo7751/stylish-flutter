part of 'cart_bloc.dart';

abstract class CartEvent {}

class DeleteEvent extends CartEvent {
  int id;
  DeleteEvent({required this.id});
}

class CartLoadEvent extends CartEvent {}
