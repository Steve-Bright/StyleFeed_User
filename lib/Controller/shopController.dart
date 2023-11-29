import 'package:style_feed/Model/shopPopularProduct.dart';
import 'package:style_feed/Model/shop.dart';
import 'package:style_feed/Model/product.dart';


class ShopController{
  List<ShopPopularProduct> getShopFeaturedItemsForShop(Shop shop) {
    // Filter the list based on the condition that the shop of each product matches the received shop
    return shopFeaturedItems
        .where((item) => item.product.shop == shop)
        .toList();
  }

  List<Product> getShopProducts(Shop shop){
    return products
        .where((item) => item.shop == shop)
        .toList();
  }
}