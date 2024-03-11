// ignore_for_file: void_checks

import 'package:slash_task/feature/features/deatils/domain/entities/product_details_entity.dart';

class ProductDetailsDataModel extends ProductDetailsEntity {
  ProductDetailsDataModel({super.data, this.message, this.statusCode});
 String? message;
  int? statusCode;
  ProductDetailsDataModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    statusCode = json['statusCode'];
  }
}

class Data extends DataEntity {
  void bostaSizeId;

  int? estimatedDaysPreparing;
  Count? cCount;
  void sizeChart;
  SubCategory? subCategory;

  Data(
      {super.id,
      super.name,
      super.type,
      super.description,
      super.brandId,
      this.bostaSizeId,
      super.productRating,
      this.estimatedDaysPreparing,
      this.cCount,
      this.sizeChart,
      this.subCategory,
      super.variations,
      super.avaiableProperties,
      super.brandName,
      super.brandImage});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    description = json['description'];
    brandId = json['brand_id'];
    bostaSizeId = json['bosta_size_id'];
    productRating = json['product_rating'];
    estimatedDaysPreparing = json['estimated_days_preparing'];
    cCount = json['_count'] != null ? Count.fromJson(json['_count']) : null;
    sizeChart = json['SizeChart'];
    subCategory = json['subCategory'] != null
        ? SubCategory.fromJson(json['subCategory'])
        : null;
    if (json['variations'] != null) {
      variations = <Variations>[];
      json['variations'].forEach((v) {
        variations!.add(Variations.fromJson(v));
      });
    }
    if (json['avaiableProperties'] != null) {
      avaiableProperties = <AvaiableProperties>[];
      json['avaiableProperties'].forEach((v) {
        avaiableProperties!.add(AvaiableProperties.fromJson(v));
      });
    }
    brandName = json['brandName'];
    brandImage = json['brandImage'];
  }
}

class Count {
  int? productVariations;

  Count({this.productVariations});

  Count.fromJson(Map<String, dynamic> json) {
    productVariations = json['ProductVariations'];
  }
}

class SubCategory {
  int? id;
  String? name;

  SubCategory({this.id, this.name});

  SubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class Variations extends VariationsEntity {
  String? productStatus;
  bool? isDefault;
  int? productVariationStatusId;

  Variations(
      {super.id,
      super.price,
      super.quantity,
      super.inStock,
      super.productVarientImages,
      super.productPropertiesValues,
      this.productStatus,
      this.isDefault,
      this.productVariationStatusId});

  Variations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    quantity = json['quantity'];
    inStock = json['inStock'];
    if (json['ProductVarientImages'] != null) {
      productVarientImages = <ProductVarientImages>[];
      json['ProductVarientImages'].forEach((v) {
        productVarientImages!.add(ProductVarientImages.fromJson(v));
      });
    }
    if (json['productPropertiesValues'] != null) {
      productPropertiesValues = <ProductPropertiesValues>[];
      json['productPropertiesValues'].forEach((v) {
        productPropertiesValues!.add(ProductPropertiesValues.fromJson(v));
      });
    }
    productStatus = json['productStatus'];
    isDefault = json['isDefault'];
    productVariationStatusId = json['product_variation_status_id'];
  }
}

class ProductVarientImages extends ProductVarientImagesEntity {
  ProductVarientImages(
      {super.id,
      super.imagePath,
      super.productVarientId,
      super.createdAt,
      super.updatedAt});

  ProductVarientImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imagePath = json['image_path'];
    productVarientId = json['product_varient_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}

class ProductPropertiesValues extends ProductPropertiesValuesEntity {
  ProductPropertiesValues({super.value, super.property});

  ProductPropertiesValues.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    property = json['property'];
  }
}

class AvaiableProperties extends AvaiablePropertiesEntity {
  AvaiableProperties({super.property, super.values});

  AvaiableProperties.fromJson(Map<String, dynamic> json) {
    property = json['property'];
    if (json['values'] != null) {
      values = <Values>[];
      json['values'].forEach((v) {
        values!.add(Values.fromJson(v));
      });
    }
  }
}

class Values extends ValuesEntity {
  Values({super.value, super.id});

  Values.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    id = json['id'];
  }
}
