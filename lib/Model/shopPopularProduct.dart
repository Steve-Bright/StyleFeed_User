import 'package:style_feed/Model/product.dart';
import 'package:style_feed/Model/shop.dart';

class ShopPopularProduct{
  final Product product;
  final int shopProductId;

  ShopPopularProduct({
    required this.product,
    required this.shopProductId
});
}

List<ShopPopularProduct> shopFeaturedItems = [
  ShopPopularProduct(product: products[0], shopProductId: 1),
  ShopPopularProduct(product: products[1], shopProductId: 2),
  ShopPopularProduct(product: products[2], shopProductId: 3),
];

