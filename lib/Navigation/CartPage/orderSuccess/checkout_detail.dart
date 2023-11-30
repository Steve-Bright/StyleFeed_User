import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clay_containers/clay_containers.dart';
import 'confirm_order_cod.dart';

class CheckoutDetail extends StatefulWidget {
  @override
  State<CheckoutDetail> createState() => _CheckoutDetailState();
}

class _CheckoutDetailState extends State<CheckoutDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Check Out Details',
          style: GoogleFonts.montserrat(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 21),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: ClayContainer(
                height: 35,
                width: 180,
                borderRadius: 3,
                child: Center(
                  child: Text('Product Details',
                      style: GoogleFonts.montserrat(fontSize: 16)),
                ),
              ),
            ),
            SizedBox(height: 20),
            ProductDetailCard(
              imagePath: 'assets/images/pants.jpg',
              productName: 'Pleated Pants',
              productColor: 'Brown',
              productSize: 'Free',
              productQuantity: 1,
              productPrice: 'MMK 21500',
              shopName: 'Hi Beauty',
            ),
            SizedBox(height: 30),
            ProductDetailCard(
              imagePath: 'assets/images/two-in-one-top.jpg',
              productName: '2-in-1 Top',
              productColor: 'Red',
              productSize: 'M',
              productQuantity: 1,
              productPrice: 'MMK 19500',
              shopName: 'Hi Beauty',
            ),
            SizedBox(height: 30),
            ProductDetailCard(
              imagePath: 'assets/order_success/order2.jpg',
              productName: 'Tweet Coat',
              productColor: 'Red',
              productSize: 'M',
              productQuantity: 1,
              productPrice: 'MMK 29000',
              shopName: 'Hi Beauty',
            ),
            SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 180,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.grey[200]),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Coupon Code',
                          hintStyle: GoogleFonts.montserrat(
                              color: Colors.grey[350], fontSize: 12),
                          border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black87,
                      minimumSize: Size(25, 35),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6))),
                  child: Text('Enter',
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 13)),
                ),
              ],
            ),
            SizedBox(height: 20),
            TotalSummary(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: (){},
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black87,
              minimumSize: Size(250, 45),
              shape: StadiumBorder()),
          child: Text('Confirm',
              style: GoogleFonts.montserrat(color: Colors.white, fontSize: 14)),
        ),
      ),
    );
  }
}

class ProductDetailCard extends StatefulWidget {
  final String imagePath;
  final String productName;
  final String productColor;
  final String productSize;
  final int productQuantity;
  final String productPrice;
  final String shopName;

  ProductDetailCard({
    required this.imagePath,
    required this.productName,
    required this.productColor,
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
                // TODO: Define action for tapping on the shop name
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
                      Text('Color: ${widget.productColor}',
                          style: GoogleFonts.montserrat(
                              fontSize: 9, letterSpacing: 1)),
                      SizedBox(height: 8),
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
                    child: Text(widget.productPrice,
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

class TotalSummary extends StatefulWidget {
  @override
  State<TotalSummary> createState() => _TotalSummaryState();
}

class _TotalSummaryState extends State<TotalSummary> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSummaryRow('Sub-Total', 'MMK 70000'),
        SizedBox(height: 15),
        _buildSummaryRow('Delivery Fee', 'MMK 2500'),
        Divider(height: 30, color: Colors.black),
        _buildSummaryRow('Total Payment', 'MMK 72500', isTotal: true),
      ],
    );
  }

  Widget _buildSummaryRow(String title, String amount, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: GoogleFonts.montserrat(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.black)),
        Text(amount,
            style: GoogleFonts.montserrat(
                fontSize: 13,
                fontWeight: isTotal ? FontWeight.w700 : FontWeight.w600,
                color: isTotal ? Colors.green : Colors.black)),
      ],
    );
  }
}