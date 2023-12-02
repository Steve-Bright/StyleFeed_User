import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import 'package:style_feed/Model/rewardModel.dart';
import 'package:style_feed/Controller/cartController.dart';

class RewardDesignCard extends StatelessWidget {
  final int index;

  const RewardDesignCard({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
        height: 130,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 2.0)
        ),
        child: Row(
            children: [
              Container(
                child: Image.asset(rewardItems[index].product.image.value),
                margin: EdgeInsets.all(10),
                width: 90,
                height: 100,
              ),
              Container(
                width: 140,
                margin: EdgeInsets.all(2),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                          child: Text(rewardItems[index].product.title.value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17,))),
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemSize: 15,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      SizedBox(height: 30),
                      Text(rewardItems[index].product.shop.name.value)
                    ]
                ),
              ),
              Container(
                  margin: EdgeInsets.all(2),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text("${rewardItems[index].product.price}", style: TextStyle(color: Colors.white)),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        TextButton(
                            child: Text('Redeem'),
                            onPressed: (){
                              final CartController cartController = Get.find<CartController>();
                              bool condition = cartController.addToCart(rewardItems[index].product);
                              if(condition == true) {
                                Get.snackbar('Product Added', 'You have added ${rewardItems[index].product.title} to the cart!',
                                    snackPosition: SnackPosition.BOTTOM);
                              }
                              else{
                                Get.snackbar('Duplicate', 'You already have added ${rewardItems[index].product.title} to the cart!',
                                    snackPosition: SnackPosition.BOTTOM);
                              }
                            }
                        )
                      ]
                  )
              )
            ]
        )
    );
  }
}
