// ignore_for_file: void_checks

import 'package:slash_task/feature/features/home/domain/entities/product_entity.dart';

class ProductDataModel extends ProductEntity {
  int? statusCode;
  String? message;
  Pagination? pagination;
  ProductDataModel(
      {this.statusCode, this.message, this.pagination, super.data});

  ProductDataModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Pagination {
  void pages;

  Pagination({this.pages});

  Pagination.fromJson(Map<String, dynamic> json) {
    pages = json['pages'];
  }
}

class Data extends ProductDataEntity {
  void deletedAt;

  SubCategories? subCategories;
  void sizeChart;
  int? notApprovedVariants;

  Data(
      {super.id,
      super.name,
      super.type,
      super.description,
      super.subCategoryId,
      super.brandId,
      super.bostaSizeId,
      super.createdAt,
      super.updatedAt,
      this.deletedAt,
      super.productRating,
      super.estimatedDaysPreparing,
      super.brands,
      super.productVariations,
      this.subCategories,
      this.sizeChart,
      this.notApprovedVariants});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    description = json['description'];
    subCategoryId = json['sub_category_id'];
    brandId = json['brand_id'];
    bostaSizeId = json['bosta_size_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    productRating = json['product_rating'];
    estimatedDaysPreparing = json['estimated_days_preparing'];
    brands = json['Brands'] != null ? Brands.fromJson(json['Brands']) : null;
    if (json['ProductVariations'] != null) {
      productVariations = <ProductVariations>[];
      json['ProductVariations'].forEach((v) {
        productVariations!.add(ProductVariations.fromJson(v));
      });
    }
    subCategories = json['SubCategories'] != null
        ? SubCategories.fromJson(json['SubCategories'])
        : null;
    sizeChart = json['SizeChart'];
    notApprovedVariants = json['notApprovedVariants'];
  }
}

class Brands extends BrandsEntity {
  int? brandStatusId;
  void brandStoreAddressId;
  int? brandCategoryId;
  void deletedAt;
  String? createdAt;
  String? updatedAt;
  int? brandSellerId;
  void brandId;
  void slashContractPath;
  int? brandRating;
  int? daysLimitToReturn;
  void planId;

  Brands(
      {super.id,
      super.brandType,
      super.brandName,
      super.brandFacebookPageLink,
      super.brandInstagramPageLink,
      super.brandWebsiteLink,
      super.brandMobileNumber,
      super.brandEmailAddress,
      super.taxIdNumber,
      super.brandDescription,
      super.brandLogoImagePath,
      this.brandStatusId,
      this.brandStoreAddressId,
      this.brandCategoryId,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.brandSellerId,
      this.brandId,
      this.slashContractPath,
      this.brandRating,
      this.daysLimitToReturn,
      this.planId});

  Brands.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandType = json['brand_type'];
    brandName = json['brand_name'];
    brandFacebookPageLink = json['brand_facebook_page_link'];
    brandInstagramPageLink = json['brand_instagram_page_link'];
    brandWebsiteLink = json['brand_website_link'];
    brandMobileNumber = json['brand_mobile_number'];
    brandEmailAddress = json['brand_email_address'];
    taxIdNumber = json['tax_id_number'];
    brandDescription = json['brand_description'];
    brandLogoImagePath = json['brand_logo_image_path'];
    brandStatusId = json['brand_status_id'];
    brandStoreAddressId = json['brand_store_address_id'];
    brandCategoryId = json['brand_category_id'];
    deletedAt = json['deletedAt'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    brandSellerId = json['brand_seller_id'];
    brandId = json['brand_id'];
    slashContractPath = json['slash_contract_path'];
    brandRating = json['brand_rating'];
    daysLimitToReturn = json['days_limit_to_return'];
    planId = json['planId'];
  }
}

class ProductVariations extends ProductVariationsEntity {
  void warehouseId;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  int? productVariationStatusId;
  int? acceptedBy;
  ProductStatusLookups? productStatusLookups;

  ProductVariations(
      {super.id,
      super.productId,
      super.price,
      super.quantity,
      this.warehouseId,
      super.isDefault,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.productVariationStatusId,
      this.acceptedBy,
      this.productStatusLookups,
      super.productVarientImages});

  ProductVariations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    price = json['price'];
    quantity = json['quantity'];
    warehouseId = json['warehouse_id'];
    isDefault = json['is_default'];
    deletedAt = json['deletedAt'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    productVariationStatusId = json['product_variation_status_id'];
    acceptedBy = json['accepted_by'];
    productStatusLookups = json['ProductStatusLookups'] != null
        ? ProductStatusLookups.fromJson(json['ProductStatusLookups'])
        : null;
    if (json['ProductVarientImages'] != null) {
      productVarientImages = <ProductVarientImages>[];
      json['ProductVarientImages'].forEach((v) {
        productVarientImages!.add(ProductVarientImages.fromJson(v));
      });
    }
  }
}

class ProductStatusLookups {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  ProductStatusLookups({this.id, this.name, this.createdAt, this.updatedAt});

  ProductStatusLookups.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}

class ProductVarientImages extends ProductVarientImagesEntity {
  String? createdAt;
  String? updatedAt;

  ProductVarientImages(
      {super.id,
      super.imagePath,
      super.productVarientId,
      this.createdAt,
      this.updatedAt});

  ProductVarientImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imagePath = json['image_path'];
    productVarientId = json['product_varient_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}

class SubCategories {
  int? id;
  String? name;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  int? categoryId;
  String? imagePath;

  SubCategories(
      {this.id,
      this.name,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.categoryId,
      this.imagePath});

  SubCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    deletedAt = json['deletedAt'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    categoryId = json['category_id'];
    imagePath = json['image_path'];
  }
}
