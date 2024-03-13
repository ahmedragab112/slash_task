part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = Loading;
  const factory HomeState.loaded({required ProductEntity data}) = Success;
  const factory HomeState.failed({required String error}) = Fail;

  const factory HomeState.incrementCart() = IncrementCart;
}
