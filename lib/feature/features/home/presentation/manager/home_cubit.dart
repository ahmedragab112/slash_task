import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slash_task/feature/features/home/domain/entities/product_entity.dart';
import 'package:slash_task/feature/features/home/domain/usecases/home_usecase.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeUseCase useCase;
  HomeCubit({required this.useCase}) : super(const HomeState.initial());

  Future<void> getAllProducts() async {
    emit(const HomeState.loading());
    final data = await useCase.getAllProduct();
    data.when(
        data: (data) {
          log(data.data![0].id.toString());
         return emit(HomeState.loaded(data: data));
        },
        error: (error) =>
            emit(HomeState.failed(error: error.apiErrorModel.message!)));
  }
}
