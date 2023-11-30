import 'package:style_feed/Model/product.dart';

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
  ShopPopularProduct(product: products[5], shopProductId: 3),
  ShopPopularProduct(product: products[6], shopProductId: 4),
  ShopPopularProduct(product: products[9], shopProductId: 5),
  ShopPopularProduct(product: products[10], shopProductId: 6),
];

