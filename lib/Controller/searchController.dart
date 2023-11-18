import 'package:get/get.dart';
import 'package:style_feed/Model/searchedItems.dart';
import 'package:style_feed/Model/product.dart';

class SearchingController extends GetxController{
  var searchResults = <SearchedItem>[].obs;
  RxString wordEntered = RxString('');

  void searchProduct(String enteredKeyword){
    searchResults.clear();
    wordEntered.value = enteredKeyword;

    if(enteredKeyword.isNotEmpty){

      var _tempSearch = <Product>[];
      _tempSearch.addAll(products.where((product) => product.title.value.toLowerCase().contains(enteredKeyword.toLowerCase())));

      for(int i = 0; i < _tempSearch.length; i++){
        searchResults.add(SearchedItem(product: _tempSearch[i]));
      }
    }
  }
}