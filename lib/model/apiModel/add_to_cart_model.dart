// class CartItem {
//   String? productTitle;
//   num? productPrice; // Price of the product
//   int? quantity; // Quantity of the product in the cart
//   num? totalPrice; // Total price for the specific quantity
//   String? pImage;
//   String? userId;
//
//   CartItem({
//     this.productTitle="",
//     this.productPrice=0,
//     this.pImage="",
//     this.userId="",
//     this.quantity = 1, // Default quantity is 1
//   }) : totalPrice = (productPrice??0) * (quantity??0);
//
//   CartItem.fromJson(Map<String, dynamic> json) {
//     productTitle=json['productTitle'];
//     productPrice=json['productPrice'];
//     pImage=json['pImage'];
//     userId=json['userId'];
//     quantity=json['quantity'];
//   }
//
//   Map<String,dynamic> toJson()=>{
//     "productTitle":productTitle,
//     "productPrice":productPrice,
//     "pImage":pImage,
//     "userId":userId,
//     "quantity":quantity,
//   };
//
// // Other methods or properties can be added here as needed
// }
