import 'package:style_feed/Model/product.dart';

class FeaturedItems {
  final Product product;
  final int featuredId;

  FeaturedItems({
    required this.product,
    required this.featuredId,
  });
}
  List<FeaturedItems> homepageItems = [
    FeaturedItems(
      product: products[0],
      featuredId: 1
    ),
    FeaturedItems(
      product: products[2],
      featuredId: 2
    ),
    FeaturedItems(
      product: products[3],
      featuredId: 3,
    ),
    FeaturedItems(
      product: products[6],
      featuredId: 4
    ),
    FeaturedItems(
        product: products[7],
        featuredId: 5
    ),
    FeaturedItems(
        product: products[10],
        featuredId: 6
    ),
    FeaturedItems(
        product: products[11],
        featuredId: 7
    )
  ];
