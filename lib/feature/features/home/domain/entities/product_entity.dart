class ProductEntity {
  List<ProductDataEntity>? data;

  ProductEntity({this.data});
}

class ProductDataEntity {
  int? id; //1
  String? name; //2
  String? type;
  String? description; //3
  int? subCategoryId;
  int? brandId; //4
  int? bostaSizeId;
  String? createdAt;
  String? updatedAt;
  int? productRating;
  int? estimatedDaysPreparing;
  BrandsEntity? brands; //5
  List<ProductVariationsEntity>? productVariations;

  ProductDataEntity(
      {this.bostaSizeId,
      this.brandId,
      this.brands,
      this.description,
      this.estimatedDaysPreparing,
      this.id,
      this.name,
      this.productRating,
      this.productVariations,
      this.subCategoryId,
      this.type,
      this.updatedAt,
      this.createdAt});
}

class BrandsEntity {
  int? id;
  String? brandType;
  String? brandName;
  String? brandFacebookPageLink;
  String? brandInstagramPageLink;
  String? brandWebsiteLink;
  String? brandMobileNumber;
  String? brandEmailAddress;
  String? taxIdNumber;
  String? brandDescription;
  String? brandLogoImagePath;

  BrandsEntity({
    this.id,
    this.brandType,
    this.brandName,
    this.brandFacebookPageLink,
    this.brandInstagramPageLink,
    this.brandWebsiteLink,
    this.brandMobileNumber,
    this.brandEmailAddress,
    this.taxIdNumber,
    this.brandDescription,
    this.brandLogoImagePath,
  });
}

class ProductVariationsEntity {
  int? id;
  int? productId;
  int? price;
  int? quantity;
  bool? isDefault;
  List<ProductVarientImagesEntity>? productVarientImages;

  ProductVariationsEntity(
      {this.id,
      this.productId,
      this.price,
      this.quantity,
      this.isDefault,
      this.productVarientImages});
}

class ProductVarientImagesEntity {
  int? id;
  String? imagePath;
  int? productVarientId;

  ProductVarientImagesEntity({
    this.id,
    this.imagePath,
    this.productVarientId,
  });
}
