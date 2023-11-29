import 'package:flutter/material.dart';
import 'package:style_feed/Controller/shopController.dart';

import 'package:style_feed/Model/shop.dart';
import 'package:style_feed/Navigation/HomePage/DetailScreen.dart';
import 'package:style_feed/Navigation/Shop/shopItemDesign.dart';

class ShopHomePage extends StatefulWidget {
  final Shop seller;
  const ShopHomePage({required this.seller});

  @override
  State<ShopHomePage> createState() => _ShopHomePageState();
}

class _ShopHomePageState extends State<ShopHomePage> {
  ShopController shopC = ShopController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(widget.seller.image.value),
                ),
                SizedBox(height: 20),
                Text(
                  widget.seller.name.value,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Rating: ${widget.seller.rating}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  widget.seller.description.value,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Most Famous Items:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]
            ),
          ),
          SizedBox(height: 10),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.68,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: shopC.getShopFeaturedItemsForShop(widget.seller).length,
            itemBuilder: (context, index) {
              return ShopItemGridDesign(product: shopC.getShopFeaturedItemsForShop(widget.seller)[index].product);
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(shopC.getShopProducts(widget.seller)[index])));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    shopC.getShopFeaturedItemsForShop(widget.seller)[index].product.image.value,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ]
    );
  }
}
