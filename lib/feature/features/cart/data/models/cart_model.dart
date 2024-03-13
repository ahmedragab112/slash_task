class CartModel {
   int id;
   String productName;
   String? productColor;
   String? productSize;
   int price;
   String? productImage;
   int? color;
   int quantity;


   CartModel( 
      {required this.quantity,required this.id,
      required this.productName,
      this.productColor,
      this.productSize,
      required this.price,
      this.productImage,
      this.color});
}
