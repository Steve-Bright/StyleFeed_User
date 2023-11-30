import 'package:get/get.dart';
import 'package:style_feed/Model/product.dart';
import 'package:style_feed/Model/favouriteItem.dart';

class FavouriteController extends GetxController{
  var favouriteItems = <FavouriteItem>[].obs;

  void toggleFavourite(Product _product){
    _product.isFavourite.value =  !(_product.isFavourite.value);
    final favouriteProduct = FavouriteItem(
        product: _product
    );


    if(_product.isFavourite.value == true){
      favouriteItems.add(favouriteProduct);
    }
    else{
      int index = favouriteItems.indexWhere((favouriteProduct) => favouriteProduct.product.id == _product.id);

      favouriteItems.removeAt(index);
    }

  }
}