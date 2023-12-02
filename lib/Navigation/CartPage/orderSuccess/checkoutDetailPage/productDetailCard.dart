import 'package:flutter/material.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailCard extends StatefulWidget {
  final String imagePath;
  final String productName;
  // final String productColor;
  final String productSize;
  final int productQuantity;
  final int productPrice;
  final String shopName;

  ProductDetailCard({
    required this.imagePath,
    required this.productName,
    // required this.productColor,
    required this.productSize,
    required this.productQuantity,
    required this.productPrice,
    required this.shopName,
  });

  @override
  State<ProductDetailCard> createState() => _ProductDetailCardState();
}

class _ProductDetailCardState extends State<ProductDetailCard> {
  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      width: double.infinity,
      height: 150,
      borderRadius: 10,
      color: Colors.grey[50],
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {

              },
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Sold by ${widget.shopName}',
                        style: GoogleFonts.montserrat(
                            fontSize: 11, letterSpacing: 1),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 12,
                      color: Colors.grey[700],
                    ),
                  ],
                ),
              ),
            ),
            Divider(color: Colors.grey, thickness: 1, indent: 0, endIndent: 0),
            SizedBox(height: 4),
            Row(
              children: [
                Image.asset(widget.imagePath,
                    width: 80, height: 80, fit: BoxFit.cover),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.productName,
                          style: GoogleFonts.montserrat(
                              fontSize: 11,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      // Text('Color: ${widget.productColor}', style: GoogleFonts.montserrat(fontSize: 9, letterSpacing: 1)),
                      // SizedBox(height: 8),
                      Text('Size: ${widget.productSize}',
                          style: GoogleFonts.montserrat(
                              fontSize: 9, letterSpacing: 1)),
                      SizedBox(height: 8),
                      Text('Qty: ${widget.productQuantity}',
                          style: GoogleFonts.montserrat(
                              fontSize: 9, letterSpacing: 1)),
                    ],
                  ),
                ),
                ClayContainer(
                  color: Colors.green[50],
                  borderRadius: 5,
                  width: 80,
                  height: 30,
                  child: Center(
                    child: Text("${widget.productPrice}",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            letterSpacing: 1)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

