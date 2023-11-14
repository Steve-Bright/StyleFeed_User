import 'package:flutter/material.dart';

import 'package:style_feed/Navigation/navigationBar.dart';
import '../HomePage/ItemWidget.dart';
import 'wishListItems.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('Wishlist', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23.0,
              color: Colors.black
          )),
        ),
        body: ListView(
          children: [
            Column(
              children: <Widget>[
                wishListItems(),
              ]
            )
          ],
        ),
        bottomNavigationBar: MyButtonNav()
    );
  }
}

