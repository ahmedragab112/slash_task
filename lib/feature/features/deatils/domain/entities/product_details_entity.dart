class ProductDetailsEntity {
  DataEntity? data;
 

  ProductDetailsEntity({this.data});
}

class DataEntity {
  int? id;
  String? name;
  String? type;
  String? description;
  int? brandId;
  int? productRating;
  List<VariationsEntity>? variations;
  List<AvaiablePropertiesEntity>? avaiableProperties;
  String? brandName;
  String? brandImage;
  DataEntity(
      {this.id,
      this.name,
      this.type,
      this.description,
      this.brandId,
      this.productRating,
      this.variations,
      this.avaiableProperties,
      this.brandName,
      this.brandImage});
}

class VariationsEntity {
  int? id;
  num? price;
  int? quantity;
  bool? inStock;
  List<ProductVarientImagesEntity>? productVarientImages;
  List<ProductPropertiesValuesEntity>? productPropertiesValues;
  VariationsEntity(
      {this.id,
      this.price,
      this.quantity,
      this.inStock,
      this.productVarientImages,
      this.productPropertiesValues,
      });
}

class ProductVarientImagesEntity {
  int? id;
  String? imagePath;
  int? productVarientId;
  String? createdAt;
  String? updatedAt;

  ProductVarientImagesEntity(
      {this.id,
      this.imagePath,
      this.productVarientId,
      this.createdAt,
      this.updatedAt});
}

class ProductPropertiesValuesEntity {
  String? value;
  String? property;

  ProductPropertiesValuesEntity({this.value, this.property});
}

class AvaiablePropertiesEntity {
  String? property;
  List<ValuesEntity>? values;

  AvaiablePropertiesEntity({this.property, this.values});
}

class ValuesEntity {
  String? value;
  int? id;

  ValuesEntity({this.value, this.id});
}
