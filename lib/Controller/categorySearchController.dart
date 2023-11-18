import 'package:get/get.dart';
import 'package:style_feed/Model/product.dart';
import 'package:style_feed/Model/category.dart';

class CategorySearchController extends GetxController{
  var categorySearchedProducts = <Product>[].obs;
  var categoryName = ''.obs;

  void categorySearch(Category category){
    categoryName = category.name;
    categorySearchedProducts.clear();
    categorySearchedProducts.addAll(products.where((product) => product.itemCategories.contains(category)));
  }
}