import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:intl/intl.dart';
import 'package:style_feed/Navigation/CartPage/orderSuccess/choose_address.dart';
import 'package:style_feed/Controller/cartController.dart';
import 'package:style_feed/Controller/pointController.dart';
import 'package:style_feed/Navigation/CartPage/orderSuccess/orderSuccessPage/buyersDetails.dart';


class OrderSuccessScreen extends StatefulWidget {
  final Address? selectedAddress;
  final String selectedPaymentMethod;

  OrderSuccessScreen({Key? key, this.selectedAddress, required this.selectedPaymentMethod}) : super(key: key);

  @override
  _OrderSuccessScreenState createState() => _OrderSuccessScreenState();
}

class _OrderSuccessScreenState extends State<OrderSuccessScreen> {
  final CartController cartController = Get.find<CartController>();
  final PointController pointController = Get.find<PointController>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/order_success/checked.png',
                      height: 170,
                    ),
                    Text(
                      'Order Received!',
                      style: GoogleFonts.montserrat(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),

                    Text(
                      'Order #1234335',
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(height: 20),

                    //TODO : Points Calculate
                    Text(
                      "You've Earned ${pointController.changingPoints} Points",
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(height: 15),

                    BuyersDetailsWidget(
                      name: widget.selectedAddress?.name ?? 'No Name',
                      phoneNumber: widget.selectedAddress?.phoneNumber ?? 'No Phone Number',
                      streetAddress: widget.selectedAddress?.streetAddress ?? 'No Street Address',
                      apartment: widget.selectedAddress?.apartment ?? 'No Apartment',
                      region: widget.selectedAddress?.region ?? 'No Region',
                      township: widget.selectedAddress?.township ?? 'No Township',
                    ),

                    SizedBox(height: 10),
                    OrderDetailsWidget(
                      paidBy: widget.selectedPaymentMethod,
                    ),
                    SizedBox(height: 25),
                    Padding(
                      padding: EdgeInsets.fromLTRB(33, 0, 0, 0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: ClayText(
                          "Product Details:",
                          emboss: true,
                          depth: 100,
                          style: GoogleFonts.montserrat(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
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
                                  // margin: EdgeInsets.only(bottom: 15),
                                  child: ProductDetailsWidget(
                                    productName: cartController.cartItems[index].product.title.value,
                                    productImage: cartController.cartItems[index].product.image.value,
                                    // color: 'Brown',
                                    size: cartController.cartItems[index].product.sizes[0].sizeValue.value,
                                    qty: cartController.cartItems[index].quantity,
                                    price: cartController.cartItems[index].product.price.value,
                                  ),
                                );
                                // SizedBox(height: 30),

                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 14),
                    TotalSummaryWidget(
                      subtotal: cartController.totalCartPrice.value,
                      deliveryFee: cartController.deliveryFees.value,
                      total: cartController.totalWholePrice.value,
                    ),

                    SizedBox(height: 40),
                    Text(
                      'Your order will be delivered soon.',
                      style: GoogleFonts.montserrat(
                        fontSize: 11,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Thank You! for choosing our app',
                      style: GoogleFonts.montserrat(
                        fontSize: 11,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () {
              cartController.removeAllCartItems();
              Get.offAllNamed('/userHome');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black87,
              minimumSize: Size(250, 45),
              side: BorderSide.none,
              shape: StadiumBorder(),
            ),
            child: Text(
              'OK',
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class OrderDetailsWidget extends StatelessWidget {
  final String paidBy;

  const OrderDetailsWidget({
    Key? key,
    required this.paidBy,
  }) : super(key: key);

  String getCurrentFormattedDateTime() {
    final now = DateTime.now();
    final formatter = DateFormat('dd MMM yyyy hh:mm a');
    return formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {
    String orderedDate = getCurrentFormattedDateTime();
    String paidOn = getCurrentFormattedDateTime();

    return ClayContainer(
      width: 320,
      height: 130,
      color: Colors.grey[50],
      borderRadius: 10,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClayText(
              "Order Details:",
              emboss: true,
              depth: 100,
              style: GoogleFonts.montserrat(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 6, 10, 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClayText(
                        'Ordered Date',
                        emboss: true,
                        depth: 110,
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(height: 3),
                      ClayText(
                        'Paid By',
                        emboss: true,
                        depth: 110,
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(height: 3),
                      ClayText(
                        'Paid On',
                        emboss: true,
                        depth: 110,
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(height: 5),
                      ClayText(
                        'Delivery Method',
                        emboss: true,
                        depth: 110,
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ClayText(
                        orderedDate,
                        emboss: true,
                        depth: 110,
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(height: 3),
                      ClayText(
                        paidBy,
                        emboss: true,
                        depth: 110,
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(height: 3),
                      ClayText(
                        paidOn,
                        emboss: true,
                        depth: 110,
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(height: 5),
                      ClayText(
                        'Royal Express',
                        emboss: true,
                        depth: 110,
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/////////////////////////////////////////////////////////

//TODO : Pass the product details data
class ProductDetailsWidget extends StatelessWidget {
  final String productName;
  final String productImage;
  // final String color;
  final String size;
  final int qty;
  final int price;

  ProductDetailsWidget({
    required this.productName,
    required this.productImage,
    // required this.color,
    required this.size,
    required this.qty,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      width: 360,
      color: Colors.grey[50],
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 50,
              height: 50,
              child: Image.asset(
                productImage,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ClayText(
                        productName,
                        emboss: true,
                        depth: 120,
                        color: Colors.grey[400],
                        style: GoogleFonts.montserrat(
                          fontSize: 11,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  // ClayText(
                  //   'Color : $color',
                  //   emboss: true,
                  //   depth: 110,
                  //   style: GoogleFonts.montserrat(
                  //     fontSize: 9,
                  //     letterSpacing: 1,
                  //   ),
                  // ),
                  Row(
                    children: [
                      ClayText(
                        'Size : $size',
                        emboss: true,
                        depth: 110,
                        style: GoogleFonts.montserrat(
                          fontSize: 9,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(width: 40),
                      ClayText(
                        'Qty : $qty',
                        emboss: true,
                        depth: 110,
                        style: GoogleFonts.montserrat(
                          fontSize: 9,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 30),
            ClayContainer(
              color: Colors.green[50],
              emboss: false,
              borderRadius: 5,
              width: 80,
              height: 30,
              spread: 0.5,
              child: Center(
                child: ClayText(
                  'MMK $price',
                  emboss: true,
                  color: Colors.lightGreen[100],
                  depth: 110,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



//TODO : Pass the total amount data
class TotalSummaryWidget extends StatelessWidget {
  final int subtotal;
  final int deliveryFee;
  final int total;

  TotalSummaryWidget({
    Key? key,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      width: 340,
      color: Colors.grey[50],
      borderRadius: 10,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClayText(
                  'Subtotal',
                  emboss: true,
                  depth: 110,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    letterSpacing: 1,
                  ),
                ),
                ClayText(
                  "MMK ${subtotal}",
                  color: Colors.lightGreen[100],
                  emboss: true,
                  depth: 110,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClayText(
                  'Delivery Fee',
                  emboss: true,
                  depth: 110,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    letterSpacing: 1,
                  ),
                ),
                ClayText(
                  "MMK ${deliveryFee}",
                  color: Colors.lightGreen[100],
                  emboss: true,
                  depth: 110,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            SizedBox(height: 3),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClayText(
                  'Total',
                  emboss: true,
                  depth: 100,
                  style: GoogleFonts.montserrat(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
                ClayText(
                  "MMK ${total}",
                  color: Colors.lightGreen[100],
                  emboss: true,
                  depth: 100,
                  style: GoogleFonts.montserrat(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
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

