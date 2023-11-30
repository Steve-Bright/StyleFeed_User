import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import 'package:style_feed/Model/product.dart';
import 'package:style_feed/Navigation/shop/sellerprofile.dart';

class shopName extends StatefulWidget {
  final Product product;
  const shopName({required this.product});

  @override
  State<shopName> createState() => _shopNameState();
}

class _shopNameState extends State<shopName> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: (){
                    Get.to(SellerProfilePage(shop: widget.product.shop));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20), // Image border
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(30), // Image radius
                      child: Image.asset(
                        widget.product.shop.image.value,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          widget.product.shop.name.value,
                          style: GoogleFonts.montserrat(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Container(
                        child: Text("Clothing (Brand)"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 40,
              child: TextButton(
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>SellerProfilePage(shop: widget.product.shop)));
                },
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStatePropertyAll<Color>(Colors.black12),
                ),
                child: Text(
                  "Follow",
                  style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}