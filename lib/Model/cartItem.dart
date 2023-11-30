import 'package:style_feed/Model/product.dart';

class CartItem {
  final Product product;
  final int cartId;
  int quantity;
  int subTotal;
  int subDiscount;

  CartItem({
    required this.product,
    required this.cartId,
    this.quantity = 1,
    this.subTotal = 0,
    this.subDiscount = 0,
  });
}

