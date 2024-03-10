import 'package:slash_task/core/api/web_service.dart';
import 'package:slash_task/feature/features/deatils/data/datasources/details_data_source.dart';
import 'package:slash_task/feature/features/deatils/data/models/product_details_data_model.dart';

class DetailsDataSourceImplementation implements DetailsDataSource {
  final ApiManager apiManager;

  const DetailsDataSourceImplementation({required this.apiManager});
  @override
  Future<ProductDetailsDataModel> getProductDetails({required String id}) async => await apiManager.getProductDetails(id);
}
