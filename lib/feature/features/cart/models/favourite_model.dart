import 'package:json_annotation/json_annotation.dart';

part 'favourite_model.g.dart';

@JsonSerializable()
class FavouriteModel {
  int? id;
  String? userId;
  String? productName;
  String? price;
  String? image;
  int? quntity;
  num? rating;
  FavouriteModel(
      {required this.userId,this.rating,
      this.quntity,
      this.id,
      this.productName,
      this.price,
      this.image});

  factory FavouriteModel.fromJson(Map<String, dynamic> json) =>
      _$FavouriteModelFromJson(json);
  Map<String, dynamic> toJson() => _$FavouriteModelToJson(this);
}
