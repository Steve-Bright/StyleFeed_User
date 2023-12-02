import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_feed/Controller/cartController.dart';
import 'cartItemDesign.dart';
import 'package:style_feed/Navigation/navigationBar.dart';
import 'orderSuccess/checkoutDetailPage/checkout_detail.dart';


class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    // Access the cart controller
    final CartController cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          color: Colors.black,
          onPressed: (){
            Get.offAllNamed('/userHome');
          },
        ),
        title: Obx(() => Text('Shopping Cart (${cartController.cartItems.length})', style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23.0,
            color: Colors.black
        ))),
        actions: [
          IconButton(
              onPressed: cartController.removeAllCartItems,
              icon: const Icon(Icons.delete_forever, color: Colors.black, size: 30)
          )
        ],
      ),
      body: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  // final item = cartController.cartItems[index];
                  return CartItemCard(
                      product: cartController.cartItems[index].product,
                      quantity: cartController.cartItems[index].quantity,
                      cartId: cartController.cartItems[index].cartId,
                      subTotal: cartController.cartItems[index].subTotal
                  );

                },
              ),
            ),
            Divider(
              thickness: 3,
            ),
            Container(
              width: double.infinity,
              height: 150,
              child: Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Discount:',
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          '${cartController.totalDiscount}',
                          style: TextStyle(fontSize: 15)
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            ' Total:',
                            style: TextStyle(fontSize: 15)
                        ),
                        Text(
                          ' ${cartController.totalCartPrice}',
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: TextButton(
                        onPressed: (){
                          Get.to(() => CheckoutDetail());
                          // Navigator.pushNamed(context, '/checkoutDetail');
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.black,
                          ),
                          child: Center(child: Text('Check Out', style: TextStyle(color: Colors.white))),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        );
      }),

      bottomNavigationBar: MyButtonNav()
    );
  }
}

