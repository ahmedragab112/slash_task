import 'package:slash_task/core/api/api_response.dart';
import 'package:slash_task/feature/features/deatils/domain/entities/product_details_entity.dart';

abstract class DeatilsRepo {
  Future<ApiResponse<ProductDetailsEntity>> getProductDetails({required int id});
}
