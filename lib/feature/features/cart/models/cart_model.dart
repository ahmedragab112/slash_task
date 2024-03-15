import 'package:slash_task/feature/features/deatils/domain/entities/product_details_entity.dart';

class CartModel {
  int id;
  String productName;

  num price;
  String? productImage;

  int quantity;
  List<ProductPropertiesValuesEntity>? productPropertiesValues;

  CartModel(
      {required this.quantity,
      required this.id,
      required this.productName,
      
      required this.price,
      this.productImage,
      
      this.productPropertiesValues});
}
