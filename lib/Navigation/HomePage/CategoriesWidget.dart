import 'package:flutter/material.dart';
import 'package:style_feed/Model/category.dart';
import 'package:get/get.dart';
import 'package:style_feed/Controller/categorySearchController.dart';
import 'package:style_feed/Navigation/HomePage/CategorySearch/categorySearchPage.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
   return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(padding: EdgeInsets.only(top: 1),
      child: Row(children: [
        for(int i = 0; i < categories.length; i++)
          GestureDetector(
            onTap: (){
              final CategorySearchController categoryC = Get.find<CategorySearchController>();
              categoryC.categorySearch(categories[i]);
              Get.toNamed('/categorySearchPage');
              // Navigator.push(context, MaterialPageRoute(builder: (context)=> CategorySearchPage()));
            },
          child: Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.symmetric(
              vertical: 10, horizontal: 18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18)
              ),
              child: Text(
                categories[i].name.value,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
        ),
      ]),
      ),
    );
  }
}