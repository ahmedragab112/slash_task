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

  num totalPrice = 0;
  DetailsUseCase useCase;

  int cartCount = 0;
  int favouriteCount = 0;

  CartCubit({required this.useCase}) : super(const CartState.initial());

  void addProductToCart({required int productId}) async {
    emit(const CartState.loading());
    var data = await useCase.getProductDetails(id: productId);
    data.when(
      data: (data) {
        for (var i = 0; i < cartData.length; i++) {
          if (cartData[i].data!.id == data.data!.id) {
            return;
          }
        }
        cartCount++;
        cartData.add(data);
        totalPrice += data.data?.variations?[0].price ?? 0;

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

    for (var i = 0; i < favouriteList.length; i++) {
      if (favouriteList[i].id == model.id) {
        return;
      }
    }
    favouriteCount++;
    favouriteList.add(model);
    emit(const CartState.addToFavourite());
  }

  void removeFavourite(FavouriteModel model) {
    emit(const CartState.initial());
    favouriteList.remove(model);
    emit(const CartState.removeFavourite());
  }
}
