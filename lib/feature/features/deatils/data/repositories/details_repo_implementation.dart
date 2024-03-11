import 'package:slash_task/core/api/api_response.dart';
import 'package:slash_task/core/error/api_error_handler.dart';
import 'package:slash_task/feature/features/deatils/data/datasources/details_data_source.dart';
import 'package:slash_task/feature/features/deatils/domain/entities/product_details_entity.dart';
import 'package:slash_task/feature/features/deatils/domain/repositories/deatils_repo.dart';

class DeatilsRepoImplementation implements DeatilsRepo {
  DetailsDataSource detailsDataSource;
  DeatilsRepoImplementation({required this.detailsDataSource});
  @override
  Future<ApiResponse<ProductDetailsEntity>> getProductDetails(
      {required int id}) async {
    try {
      var data = await detailsDataSource.getProductDetails(id: id);
      return ApiResponse.data(data);
    } catch (e) {
      return ApiResponse.error(errorHandler: ErrorHandler.handle(e));
    }
  }
}
