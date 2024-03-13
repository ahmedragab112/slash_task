part of 'productdetils_cubit.dart';

@freezed
class ProductdetilsState with _$ProductdetilsState {
  const factory ProductdetilsState.initial() = _Initial;


  const factory ProductdetilsState.getProductDetailsSuccess({required ProductDetailsEntity productDetailsEntity})= GetProductDetailsSuccess;


  const factory ProductdetilsState.getProductDetailsError({required String error})= GetProductDetailsError;


  const factory ProductdetilsState.getProductDetailsLoading()= GetProductDetailsLoading;


const factory ProductdetilsState.changeSliderIndex()= ChangeSliderIndex;

const factory ProductdetilsState.decrement()= Decrement;

const factory ProductdetilsState.increment()= Increment;
}
