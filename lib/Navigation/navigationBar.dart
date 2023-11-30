import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class MyButtonNav extends StatelessWidget {
  const MyButtonNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: GNav(
          iconSize: 25,
          onTabChange: (index) {
            print(index);
          },
          color: Colors.black,
          activeColor: Colors.black,
          padding: EdgeInsets.all(20),
          tabs: [
            GButton(
                icon: Icons.home,
                onPressed: () {
                  Get.offAllNamed('/userHome');
                  // Navigator.pushReplacementNamed(context, '/userHome');
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> Myhome()));
                }),
            GButton(
                icon: Icons.favorite,
                onPressed: () {
                  Get.offAllNamed('/favouritePage');
                  // Navigator.pushReplacementNamed(context, '/favouritePage');
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> SavedPage()));
                }),
            GButton(
                icon: Icons.shopping_cart,
                onPressed: () {
                  Get.toNamed('/cart');
                  // Navigator.pushReplacementNamed(context, '/cart');
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> Cart_Items(newQty: 1)));
                }),
            GButton(
              icon: Icons.message,
              onPressed: (){
                Get.offAllNamed('/chatHome');
                // Navigator.pushReplacementNamed(context, '/chatHome');
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatHome()));
              }
            ),
          ],
        ),
      ),
    );
  }
}
