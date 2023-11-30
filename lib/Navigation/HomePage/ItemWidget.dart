import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_feed/Controller/favouriteController.dart';
import 'DetailScreen.dart';
import 'package:style_feed/Controller/cartController.dart';
import 'package:style_feed/Model/featuredItems.dart';
import 'package:style_feed/Navigation/Shop/sellerprofile.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({super.key});

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {


  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.68,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for(int i=0; i<homepageItems.length; i++)
          Container(
            padding: EdgeInsets.only(left: 15, right: 7),
            margin: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: homepageItems[i].product.discountPercent.value != 0,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "- ${homepageItems[i].product.discountPercent} %",
                          style: TextStyle(
                              fontSize: 10,
                              color: Color(0xFFEDECF2),
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Obx(() => Icon(
                        homepageItems[i].product.isFavourite.value ? Icons.favorite : Icons.favorite_border,
                      )),
                      onPressed: (){
                        final FavouriteController f = Get.find<FavouriteController>();
                        f.toggleFavourite(homepageItems[i].product);
                      },
                      color: Colors.red,
                    ),
                  ],
                ),
                InkWell(
                  onTap: (){
                    Get.to(DetailScreen(homepageItems[i].product));
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(homepageItems[i].product)));
                  },
                  child: Container(
                    margin: EdgeInsets.all(1),
                    child: Image.asset(homepageItems[i].product.image.value,
                      width: 120,
                      height: 120,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  height: 45,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 5),
                          alignment: Alignment.centerLeft,
                          child: Text(homepageItems[i].product.title.value,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),),
                        ),
                        InkWell(
                          onTap: (){
                            Get.to(SellerProfilePage(shop: homepageItems[i].product.shop));
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>SellerProfilePage(shop: homepageItems[i].product.shop)));
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(homepageItems[i].product.shop.name.value,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black
                                )),
                          ),
                        )
                      ]
                    )
                  ),
                ),
                Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${homepageItems[i].product.price} MMK",
                        style: TextStyle(fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.shopping_cart_checkout),
                        color: Colors.black,
                        onPressed: (){
                          final CartController cartController = Get.find<CartController>();
                          // Add item to cart
                          bool condition = cartController.addToCart(homepageItems[i].product);
                          if(condition == true) {
                            Get.snackbar('Product Added', 'You have added ${homepageItems[i].product.title} to the cart!',
                                snackPosition: SnackPosition.BOTTOM);
                          }
                          else{
                            Get.snackbar('Duplicate', 'You already have added ${homepageItems[i].product.title} to the cart!',
                                snackPosition: SnackPosition.BOTTOM);
                          }
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          )
      ],
    );
  }
}