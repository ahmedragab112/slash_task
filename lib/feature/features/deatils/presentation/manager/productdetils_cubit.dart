import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slash_task/feature/features/deatils/domain/entities/product_details_entity.dart';
import 'package:slash_task/feature/features/deatils/domain/usecases/details_usecase.dart';

part 'productdetils_state.dart';
part 'productdetils_cubit.freezed.dart';

class ProductdetilsCubit extends Cubit<ProductdetilsState> {
  final DetailsUseCase useCase;

  ProductdetilsCubit({required this.useCase})
      : super(const ProductdetilsState.initial());

  Future<void> getProductDetails({required String id}) async {
    emit(const ProductdetilsState.getProductDetailsLoading());
    var data = await useCase.getProductDetails(id: id);
    data.when(
      data: (data) => emit(ProductdetilsState.getProductDetailsSuccess(
          productDetailsEntity: data)),
      error: (error) => emit(ProductdetilsState.getProductDetailsError(
          error: error.apiErrorModel.message!)),
    );
  }
}
