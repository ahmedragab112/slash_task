part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  const factory CartState.loading() = Loading;
  const factory CartState.addToCart() = AddToCart;
  const factory CartState.error(String message) = Error;

    const factory CartState.increment() = Increment;
    const factory CartState.getTotalPrice()=GetTotalPrice;
      const factory CartState.decrement() = Decrement;
}
