// import 'dart:convert';


// class OrderItem {
//   final Product product;
//   int quantity;
//   OrderItem({
//     required this.product,
//     required this.quantity,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'product': product.toMap(),
//       'quantity': quantity,
//     };
//   }

//   // id INTEGER PRIMARY KEY AUTOINCREMENT,
//   //     id_order INTEGER,
//   //     id_product INTEGER,
//   //     quantity INTEGER,
//   //     price INTEGER

//   Map<String, dynamic> toMapForLocal(int orderId) {
//     return {
//       'id_order': orderId,
//       'id_product': product.productId,
//       'quantity': quantity,
//       'price': product.price,
//     };
//   }

//   static OrderItemModel fromMapLocal(Map<String, dynamic> map) {
//     return OrderItemModel(
//       productId: map['id_product']?.toInt() ?? 0,
//       quantity: map['quantity']?.toInt() ?? 0,
//       totalPrice: map['price']?.toInt() ?? 0 * (map['quantity']?.toInt() ?? 0),
//     );
//   }

//   factory OrderItem.fromMap(Map<String, dynamic> map) {
//     return OrderItem(
//       product: Product.fromMap(map['product']),
//       quantity: map['quantity']?.toInt() ?? 0,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory OrderItem.fromJson(String source) =>
//       OrderItem.fromMap(json.decode(source));
// }

class Product {
  final String name;
  final String? image;
  final int price;

  Product({
    required this.name,
    this.image,
    required this.price,
  });
}

class OrderItem {
  final Product product;
  int quantity;

  OrderItem({
    required this.product,
    required this.quantity,
  });
}

