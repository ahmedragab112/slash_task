import 'package:slash_task/core/api/web_service.dart';
import 'package:slash_task/feature/features/home/data/datasources/home_remote_datasource_implementation.dart';
import 'package:slash_task/feature/features/home/data/models/product_model.dart';

class HomeRemoteDataSourceImplementation implements HomeRemoteDataSource {
  final ApiManager apiManager;
  const HomeRemoteDataSourceImplementation({required this.apiManager});
  @override
  Future<ProductDataModel> getAllProduct() async => await apiManager.getAllProducts('4', '1');
}
