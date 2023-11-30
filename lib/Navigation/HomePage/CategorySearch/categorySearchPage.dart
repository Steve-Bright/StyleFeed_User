import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:style_feed/Navigation/HomePage/CategorySearch/categorySearchResultDesign.dart';
import 'package:style_feed/Navigation/HomePage/CategorySearch/selectedCategory.dart';
import 'package:style_feed/Controller/categorySearchController.dart';

class CategorySearchPage extends StatefulWidget {
  const CategorySearchPage({super.key});

  @override
  State<CategorySearchPage> createState() => _CategorySearchPageState();
}

class _CategorySearchPageState extends State<CategorySearchPage> {
  @override
  Widget build(BuildContext context) {
    final CategorySearchController categoryC = Get.find<CategorySearchController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEDECF2),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          color: Colors.black,
          onPressed: (){
            Get.offAllNamed('/userHome');
          },
        ),
      ),

      body: Container(
          color: Color(0xFFEDECF2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 10,
                ),
                child: Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SelectedCategory(categoryName: categoryC.categoryName.value),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    childAspectRatio: 0.68,
                  ),
                  itemCount: categoryC.categorySearchedProducts.length,
                  itemBuilder: (context, index) {
                    return CategorySearchResultDesign(product: categoryC.categorySearchedProducts[index]);
                  },
                ),
              ),
            ],
          )
      )


    );
  }
}
