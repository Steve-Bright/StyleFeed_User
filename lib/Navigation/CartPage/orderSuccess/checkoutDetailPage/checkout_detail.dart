import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:style_feed/Navigation/CartPage/orderSuccess/confirm_order_cod.dart';
import 'package:style_feed/Controller/cartController.dart';
import 'package:style_feed/Navigation/CartPage/orderSuccess/checkoutDetailPage/productDetailCard.dart';
import 'package:style_feed/Navigation/CartPage/orderSuccess/checkoutDetailPage/totalSummary.dart';

class CheckoutDetail extends StatefulWidget {
  @override
  State<CheckoutDetail> createState() => _CheckoutDetailState();
}

class _CheckoutDetailState extends State<CheckoutDetail> {
  final CartController cartController = Get.find<CartController>();

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
      body: Obx(() =>
        SingleChildScrollView(
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
              Container(
                height: 350,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: cartController.cartItems.length,
                        itemBuilder: (context, index) {
                          // final item = cartController.cartItems[index];
                          return Container(
                            margin: EdgeInsets.only(bottom: 15),
                            child: ProductDetailCard(
                              imagePath: cartController.cartItems[index].product.image.value,
                              productName: cartController.cartItems[index].product.title.value,
                              // productColor: 'Brown',
                              productSize: cartController.cartItems[index].product.sizes[0].sizeValue.value,
                              productQuantity: cartController.cartItems[index].quantity,
                              productPrice: cartController.cartItems[index].product.price.value,
                              shopName: cartController.cartItems[index].product.shop.name.value,
                            ),
                          );
                          // SizedBox(height: 30),

                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
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
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: (){
            Get.to(ConfirmOrder());
          },
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


