import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'productdetils_state.dart';
part 'productdetils_cubit.freezed.dart';

class ProductdetilsCubit extends Cubit<ProductdetilsState> {
  ProductdetilsCubit() : super(const ProductdetilsState.initial());
}
