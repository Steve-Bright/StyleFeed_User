import 'package:get/get.dart';
import '../Model/product.dart';

class FavouriteController extends GetxController{

  void toggleFavourite(Product _product){
    _product.isFavourite.value =  !(_product.isFavourite.value);
  }
}