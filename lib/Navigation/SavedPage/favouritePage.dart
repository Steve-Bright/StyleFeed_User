import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_feed/Controller/favouriteController.dart';
import 'package:style_feed/Navigation/navigationBar.dart';
import 'package:style_feed/Navigation/SavedPage/favouriteItemDesign.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    final FavouriteController favC = Get.find<FavouriteController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEDECF2),
        elevation: 0,
        title: Text('Wishlist', style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23.0,
            color: Colors.black
        )),
      ),

      body: Obx(() {
        return Container(
          color: Color(0xFFEDECF2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns
                        childAspectRatio: 0.68,
                      ),
                    itemCount: favC.favouriteItems.length,
                      itemBuilder: (context, index) {
                        return FavouriteItemDesign(product: favC.favouriteItems[index].product);
                      },
                    ))
            ]
          ),
        );
      }),
        bottomNavigationBar: MyButtonNav()
    );
  }
}
