import 'package:flutter/material.dart';

import 'package:style_feed/Model/shop.dart';
import 'package:style_feed/Controller/shopController.dart';
import 'package:style_feed/Navigation/Shop/shopItemDesign.dart';

class ShopAllProductsPage extends StatefulWidget {
  final Shop seller;
  const ShopAllProductsPage({required this.seller});

  @override
  State<ShopAllProductsPage> createState() => _ShopAllProductsPageState();
}

class _ShopAllProductsPageState extends State<ShopAllProductsPage> {
  ShopController shopC = ShopController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.68,
          ),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: shopC.getShopProducts(widget.seller).length,
          itemBuilder: (context, index) {
            return ShopItemGridDesign(product: shopC.getShopProducts(widget.seller)[index]);
          },
        )
      ]
    );
  }
}
