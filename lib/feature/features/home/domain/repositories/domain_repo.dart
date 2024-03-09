import 'package:slash_task/core/api/api_response.dart';
import 'package:slash_task/feature/features/home/domain/entities/product_entity.dart';

abstract class HomeRepo{
Future<ApiResponse<ProductEntity>> getAllProducts();
}