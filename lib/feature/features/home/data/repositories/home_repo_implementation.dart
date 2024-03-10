import 'package:slash_task/core/api/api_response.dart';
import 'package:slash_task/core/error/api_error_handler.dart';
import 'package:slash_task/feature/features/home/data/datasources/home_remote_datasource.dart';
import 'package:slash_task/feature/features/home/domain/entities/product_entity.dart';
import 'package:slash_task/feature/features/home/domain/repositories/domain_repo.dart';

class HomeRepoImplementation implements HomeRepo {
  final HomeRemoteDataSource dataSource;
  const HomeRepoImplementation({required this.dataSource});
 
  @override
  Future<ApiResponse<ProductEntity>> getAllProducts()async {
    try {
      final data = await dataSource.getAllProduct();
      return ApiResponse.data(data);
    } catch (e) {
      return ApiResponse.error(errorHandler: ErrorHandler.handle(e));
    }
  }
}
