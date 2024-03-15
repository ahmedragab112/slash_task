import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slash_task/feature/features/deatils/domain/entities/product_details_entity.dart';
import 'package:slash_task/feature/features/deatils/domain/usecases/details_usecase.dart';
import 'package:slash_task/feature/features/cart/models/favourite_model.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

class CartCubit extends Cubit<CartState> {
  List<ProductDetailsEntity> cartData = [];
  List<FavouriteModel> favouriteList = [];
  
  int totalPrice = 0;
  DetailsUseCase useCase;

  int cartCount = 0;

  CartCubit({required this.useCase}) : super(const CartState.initial());

  void addProductToCart({required int productId}) async {
    emit(const CartState.loading());
    var data = await useCase.getProductDetails(id: productId);
    data.when(
      data: (data) {
        cartData.add(data);
        emit(const CartState.addToCart());
      },
      error: (errorHandler) {
        emit(CartState.error(errorHandler.apiErrorModel.message!));
      },
    );
  }

  void removeProduct(int id) {
    cartData.removeAt(id);
  }

  void addFavourite(FavouriteModel model) {
    emit(const CartState.initial());
    favouriteList.add(model);
    emit(const CartState.addToFavourite());
  }

  void removeFavourite(FavouriteModel model) {
    emit(const CartState.initial());
    favouriteList.remove(model);
    emit(const CartState.removeFavourite());
  }
}
