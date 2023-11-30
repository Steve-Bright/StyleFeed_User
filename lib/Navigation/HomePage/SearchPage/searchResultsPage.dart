import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_feed/Navigation/HomePage/SearchPage/searchResultDesign.dart';
import 'package:style_feed/Controller/searchController.dart';

class SearchResultsPage extends StatefulWidget {
  const SearchResultsPage({super.key});

  @override
  State<SearchResultsPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  String? searchResult;

  @override
  Widget build(BuildContext context) {
    final SearchingController searchC = Get.find<SearchingController>();

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFFEDECF2),
          elevation: 0,
          leading: IconButton(
              onPressed: (){
                Navigator.pushNamedAndRemoveUntil(context, '/userHome', (Route<dynamic> route) => false);
                // Navigator.of(context).popUntil((route) => route.isFirst);
              },
              icon: Icon(Icons.arrow_back, color: Colors.black)
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              padding: EdgeInsets.only(left: 5),
              width: 270,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30)
              ),
              child: TextField(
                onChanged: (value) => searchResult = value,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Here."
                ),
              ),
            ),
            IconButton(
                onPressed: (){
                  if(searchResult != null){
                    searchC.searchProduct(searchResult!);
                  }
                  Navigator.pushNamedAndRemoveUntil(context, '/searchResults', (Route<dynamic> route) => false);
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 27,
                )
            )
          ]
      ),
      body: Obx((){
        return Container(
          color: Color(0xFFEDECF2),
          padding: EdgeInsets.only(top: 5),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Text("Search Results for ${searchC.wordEntered}",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns
                        childAspectRatio: 0.68,
                      ),
                      itemCount: searchC.searchResults.length,
                      itemBuilder: (context, index) {
                        // return FavouriteItemDesign(product: favC.favouriteItems[index].product);
                        return SearchResultDesign(product: searchC.searchResults[index].product);
                      },
                    ))
              ]
          ),
        );
      })
    );
  }
}
