import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:style_feed/Model/product.dart';
import 'package:style_feed/Navigation/HomePage/DetailScreen.dart';
import 'package:style_feed/Controller/favouriteController.dart';
import 'package:style_feed/Controller/cartController.dart';


class SearchResultDesign extends StatefulWidget {
  final Product product;
  SearchResultDesign({
    required this.product
  });

  @override
  State<SearchResultDesign> createState() => _SearchResultDesignState();
}

class _SearchResultDesignState extends State<SearchResultDesign> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                visible: widget.product.discountPercent.value != 0,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "- ${widget.product.discountPercent} %",
                    style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFFEDECF2),
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Obx(() =>
                IconButton(
                  icon: Icon(
                    widget.product.isFavourite.value ? Icons.favorite : Icons.favorite_border,
                  ),
                  onPressed: (){
                    final FavouriteController f = Get.find<FavouriteController>();
                    f.toggleFavourite(widget.product);
                  },
                  color: Colors.red,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: (){
              Get.to(DetailScreen(widget.product));
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(widget.product)));
            },
            child: Container(
              margin: EdgeInsets.all(1),
              child: Image.asset(widget.product.image.value,
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
                        child: Text(widget.product.title.value,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(widget.product.shop.name.value,
                            style: TextStyle(
                                fontSize: 14, color: Colors.black
                            )),
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
                Text("${widget.product.price} MMK",
                  style: TextStyle(fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.shopping_cart_checkout),
                  color: Colors.black,
                  onPressed: (){
                    // Get.to(NextPage() , arguments: {'itemName': products[i].title});
                    // Find the cart controller
                    final CartController cartController = Get.find<CartController>();
                    // Add item to cart
                    bool condition = cartController.addToCart(widget.product);
                    if(condition == true) {
                      Get.snackbar('Product Added', 'You have added ${widget.product.title} to the cart!',
                          snackPosition: SnackPosition.BOTTOM);
                    }
                    else{
                      Get.snackbar('Duplicate', 'You already have added ${widget.product.title} to the cart!',
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
