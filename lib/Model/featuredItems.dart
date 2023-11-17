import 'product.dart';

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
      product: products[1],
      featuredId: 2
    ),
    FeaturedItems(
      product: products[2],
      featuredId: 3,
    ),
    FeaturedItems(
      product: products[3],
      featuredId: 4
    )
  ];
