import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:style_feed/Controller/cartController.dart';
import 'package:style_feed/Model/product.dart';

import 'package:style_feed/Navigation/Shop/sellerprofile.dart';

class bottomAppBar extends StatefulWidget {
  final Product product;
  const bottomAppBar({required this.product});

  @override
  State<bottomAppBar> createState() => _bottomAppBarState();
}

class _bottomAppBarState extends State<bottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                Get.to(SellerProfilePage(shop: widget.product.shop));
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>SellerProfilePage(shop: widget.product.shop)));
              },
              style: ButtonStyle(
                backgroundColor:
                MaterialStatePropertyAll<Color>(Colors.transparent),
              ),
              icon: Icon(
                Icons.store,
                color: Colors.black,
                size: 30,
              ),
            ),
            Container(
                child: TextButton(
                  child: Text(
                    "Review",
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,),
                  ),
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStatePropertyAll<Color>(Colors.white),
                  ),
                )
            ),
            Container(
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.black)
                ),
                onPressed: () {
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
                child: Row(
                  children: [
                    Container(
                      child: Icon(
                          Icons.add_shopping_cart_sharp,
                          size: 25,
                          color: Colors.white
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}