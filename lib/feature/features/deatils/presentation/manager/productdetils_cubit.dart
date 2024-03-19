import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slash_task/feature/features/deatils/domain/entities/product_details_entity.dart';
import 'package:slash_task/feature/features/deatils/domain/usecases/details_usecase.dart';

part 'productdetils_state.dart';
part 'productdetils_cubit.freezed.dart';

class ProductDetailsCubit extends Cubit<ProductdetilsState> {
  final DetailsUseCase useCase;
  ProductDetailsEntity? productDetailsEntity;
  int productVarientImagesIndex = 0;
  int variationsIndex = 0;
  int selectedInde = 0;
  int quantity = 1;
  bool selected = false;
  int price = 0;

  ProductDetailsCubit({required this.useCase})
      : super(const ProductdetilsState.initial());

  Future<void> getProductDetails({required int id}) async {
    emit(const ProductdetilsState.getProductDetailsLoading());
    var data = await useCase.getProductDetails(id: id);
    data.when(
      data: (data) {
        emit(ProductdetilsState.getProductDetailsSuccess(
            productDetailsEntity: data));
        productDetailsEntity = data;
      },
      error: (error) => emit(ProductdetilsState.getProductDetailsError(
          error: error.apiErrorModel.message!)),
    );
  }

  void decrementPrice() {
    emit(const ProductdetilsState.initial());
    if (quantity > 1) {
      quantity--;
    }
    emit(const Increment());
  }

  void incrementPrice(int avaliable) {
    emit(const ProductdetilsState.initial());
    if (quantity < avaliable) {
      quantity++;
    }
    emit(const Decrement());
  }

  void changeSliderIndex(int index) {
    emit(const ProductdetilsState.initial());
    productVarientImagesIndex = index;
    emit(const ChangeSliderIndex());
  }
  void selectIndex(int index){
    emit(const ProductdetilsState.initial());
    selectedInde = index;
    emit(const SelectIndex());
  }
}
