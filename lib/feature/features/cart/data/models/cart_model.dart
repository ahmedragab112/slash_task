class CartModel {
  final int id;
  final String productName;
  final String? productColor;
  final String? productSize;
  final String price;
  final String? productImage;
  final int? color;
  final String quantity;


  const CartModel( 
      {required this.quantity,required this.id,
      required this.productName,
      this.productColor,
      this.productSize,
      required this.price,
      this.productImage,
      this.color});
}
