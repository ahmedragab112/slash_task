// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavouriteModel _$FavouriteModelFromJson(Map<String, dynamic> json) =>
    FavouriteModel(
      userId: json['userId'] as String?,
      rating: json['rating'] as num?,
      quntity: json['quntity'] as int?,
      id: json['id'] as int?,
      productName: json['productName'] as String?,
      price: json['price'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$FavouriteModelToJson(FavouriteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'productName': instance.productName,
      'price': instance.price,
      'image': instance.image,
      'quntity': instance.quntity,
      'rating': instance.rating,
    };
