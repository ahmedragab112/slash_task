import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slash_task/feature/features/cart/data/models/cart_model.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

class CartCubit extends Cubit<CartState> {
  List<CartModel>? cartData;
  int totalPrice = 0;
  int cartCount = 0;

  CartCubit() : super(const CartState.initial());

  void addProductToCart({required CartModel product}) {
    emit(const CartState.initial());
    cartCount++;
    cartData?.add(product);
    emit(const CartState.addToCart());
  }

  void decrementPrice({required CartModel product}) {
    emit(const CartState.initial());
    if (product.quantity > 1) {
      product.quantity--;
    }
    emit(const Increment());
  }

  void incrementPrice(CartModel product, int avaliable) {
    emit(const CartState.initial());
    if (product.quantity < avaliable) {
      product.quantity++;
    }
    emit(const Decrement());
  }

  void getTotalPrice() {
    emit(const CartState.initial());
    for (var product in cartData ?? []) {
      totalPrice += cartData?[product].price ?? 0;
    }
    emit(const CartState.getTotalPrice());
  }

  void removeProduct(int id) {
    cartData!.removeAt(id);
  }
}
