import 'package:slash_task/feature/features/home/data/models/product_model.dart';

abstract class HomeRemoteDataSource {
  Future<ProductDataModel> getAllProduct();
}
