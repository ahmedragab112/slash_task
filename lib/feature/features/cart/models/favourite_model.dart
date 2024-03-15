class FavouriteModel {
  int? id;
  String? productName;
  String? price;
  String? image;
  int? quntity;
  num? rating;
  FavouriteModel(
      {this.rating,
      this.quntity,
      this.id,
      this.productName,
      this.price,
      this.image});
}
