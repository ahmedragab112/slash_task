import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:slash_task/core/api/end_points.dart';
import 'package:slash_task/core/utils/constant/app_constant.dart';
import 'package:slash_task/feature/features/deatils/data/models/product_details_data_model.dart';
import 'package:slash_task/feature/features/home/data/models/product_model.dart';

part 'web_service.g.dart';

@RestApi(baseUrl: AppConstant.baseUrl)
abstract class ApiManager {
  factory ApiManager(Dio dio, {String baseUrl}) = _ApiManager;

  @GET(AppEndPoint.getAllProducts)
  Future<ProductDataModel> getAllProducts(
      @Query('limit') String limit, @Query('page') String page);

  @GET('${AppEndPoint.getProductDetails}/{id}')
  Future<ProductDetailsDataModel> getProductDetails(@Path('id') String id);
}
