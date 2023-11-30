import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_feed/Model/shop.dart';

import 'package:style_feed/Controller/shopController.dart';
import 'package:style_feed/Navigation/Shop/shopHomePage.dart';
import 'package:style_feed/Navigation/Shop/shopAllProducts.dart';

class SellerProfilePage extends StatefulWidget {
  final Shop shop;
  SellerProfilePage({required this.shop});

  @override
  _SellerProfilePageState createState() => _SellerProfilePageState();
}

class _SellerProfilePageState extends State<SellerProfilePage> {

  final ShopController shopControl = ShopController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFEDECF2),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
              // Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Color(0xFFEDECF2),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TabBar(
                      tabs: [
                        Tab(
                            child: Center(child: Text('Home Page', style: TextStyle(color: Colors.black)))
                        ),
                        Tab(
                            child: Center(child: Text('Products', style: TextStyle(color: Colors.black)))
                        ),
                      ]
                  ),
                  Container(
                    height: 650,
                    child: TabBarView(
                        children: [
                          ShopHomePage(seller: widget.shop),
                          ShopAllProductsPage(seller: widget.shop)
                        ]
                    ),
                  ),
                ],
              ),
          )
        ),
      ),
    );
  }
}