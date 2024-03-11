import 'package:slash_task/feature/features/deatils/data/models/product_details_data_model.dart';

abstract class DetailsDataSource {
  Future<ProductDetailsDataModel> getProductDetails({required int id});
}
