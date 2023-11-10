import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'DetailScreen.dart';
import '../../Controller/cartController.dart';
import '../../Model/product.dart';

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
        for(int i=0; i<products.length; i++)
          Container(
            padding: EdgeInsets.only(left: 15, right: 7, top: 10),
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
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "-50%",
                        style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFFEDECF2),
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    const Icon(Icons.favorite_border,
                      color: Colors.red,
                    ),
                  ],
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(products[i])));
                  },
                  child: Container(
                    margin: EdgeInsets.all(1),
                    child: Image.asset(products[i].image.value,
                      width: 120,
                      height: 120,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 5),
                  alignment: Alignment.centerLeft,
                  child: Text(products[i].title.value,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(products[i].description.value,
                      style: TextStyle(
                          fontSize: 14, color: Colors.black
                      )),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$55",
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
                          bool condition = cartController.addToCart(products[i]);
                          if(condition == true) {
                            Get.snackbar('Product Added', 'You have added ${products[i].title} to the cart!',
                                snackPosition: SnackPosition.BOTTOM);
                          }
                          else{
                            Get.snackbar('Duplicate', 'You already have added ${products[i].title} to the cart!',
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