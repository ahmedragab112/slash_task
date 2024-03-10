import 'package:slash_task/core/api/api_response.dart';
import 'package:slash_task/feature/features/home/domain/entities/product_entity.dart';
import 'package:slash_task/feature/features/home/domain/repositories/domain_repo.dart';

class HomeUseCase {
  final HomeRepo homeRepo;
  const HomeUseCase({required this.homeRepo});

  Future<ApiResponse<ProductEntity>> getAllProduct() async =>
      await homeRepo.getAllProducts();
}
