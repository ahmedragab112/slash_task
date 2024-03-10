import 'package:slash_task/core/api/api_response.dart';
import 'package:slash_task/feature/features/deatils/domain/entities/product_details_entity.dart';
import 'package:slash_task/feature/features/deatils/domain/repositories/deatils_repo.dart';

class DetailsUseCase {
  DeatilsRepo repo;
  DetailsUseCase({required this.repo});
  Future<ApiResponse<ProductDetailsEntity>> getProductDetails(
      {required String id}) async => await repo.getProductDetails(id: id);
}