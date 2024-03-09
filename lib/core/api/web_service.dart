import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:slash_task/core/utils/constant/app_constant.dart';

part 'web_service.g.dart';

@RestApi(baseUrl: AppConstant.baseUrl)
abstract class ApiManager {
  factory ApiManager(Dio dio, {String baseUrl}) = _ApiManager;
  
}
