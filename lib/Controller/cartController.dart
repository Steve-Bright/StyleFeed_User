import 'package:get/get.dart';
import 'package:style_feed/Model/product.dart';
import 'package:style_feed/Model/cartItem.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs; // List of cart items as an observable
  //cartItems need to be external source, like json, so that the data won't lose when the use navigates to the another page.

  var _qty = 1.obs;
  var deliveryFees = 2500.obs;
  var _cartIdCounter = 1.obs;
  var totalDiscount = 0.obs;
  var subTotalCartItem;
  var totalCartPrice = 0.obs;
  var totalWholePrice = 0.obs;

  bool addToCart(Product product) {

    final cartProduct = CartItem(
      product: product,
      cartId: _cartIdCounter.value,
      quantity: _qty.value,
      subTotal: (product.price.value - product.discount.value), //subtotal is price value because the quantity is already is defined as 1
      subDiscount: product.discount.value,
    );

    if (cartItems.isEmpty){
      _cartIdCounter.value++;
      cartItems.add(cartProduct);
      totalDiscount = totalDiscount + cartItems[0].subDiscount;
      totalCartPrice = RxInt(cartItems[0].subTotal); // add the first digit to the subtotal
      totalWholePrice = RxInt(cartItems[0].subTotal) + deliveryFees.value;
      return true;
    }
    else{
      int index = cartItems.indexWhere((cartProduct) => cartProduct.product.id == product.id);

      if (index == -1) {
        _cartIdCounter.value++;
        cartItems.add(cartProduct);
        totalDiscount = totalDiscount + cartProduct.subDiscount;
        totalCartPrice = totalCartPrice + cartProduct.subTotal;
        totalWholePrice = totalWholePrice + cartProduct.subTotal;
        return true;
      }
      return false;
    }
  }

  void increaseQty(int cartProductId) {
    // Find the product in the cart by its id
    var index = cartItems.indexWhere((cartProduct) => cartProduct.cartId == cartProductId);
    // If found, increment the quantity
    if (cartProductId != -1) {
      totalDiscount = totalDiscount - cartItems[index].subDiscount;
      cartItems[index].quantity++;
      cartItems[index].subDiscount = cartItems[index].product.discount.value * cartItems[index].quantity;
      totalDiscount = totalDiscount + cartItems[index].subDiscount;
      totalWholePrice = totalWholePrice - cartItems[index].subTotal;
      totalCartPrice = totalCartPrice - cartItems[index].subTotal; //subtract the current sub total of the item in the cart.
      cartItems[index].subTotal = ((cartItems[index].product.price.value - cartItems[index].product.discount.value) * cartItems[index].quantity);
      totalCartPrice = totalCartPrice + cartItems[index].subTotal; // combine the sub total of the item in the cart.
      totalWholePrice = totalWholePrice + cartItems[index].subTotal;
      // Update the cartItems list to trigger the observers
      cartItems[index] = cartItems[index];
    }
  }

  void decreaseQty(int cartProductId) {
    // Find the product in the cart by its id
    var index = cartItems.indexWhere((cartProduct) => cartProduct.cartId == cartProductId);
    // If found, increment the quantity
    if (cartProductId != -1 && cartItems[index].quantity > 1) {
      totalDiscount = totalDiscount - cartItems[index].subDiscount;
      cartItems[index].quantity--;
      cartItems[index].subDiscount = cartItems[index].product.discount.value * cartItems[index].quantity;
      totalDiscount = totalDiscount + cartItems[index].subDiscount;
      totalWholePrice = totalWholePrice - cartItems[index].subTotal;
      totalCartPrice = totalCartPrice - cartItems[index].subTotal; //subtract the current sub total of the item in the cart.
      cartItems[index].subTotal = ((cartItems[index].product.price.value - cartItems[index].product.discount.value) * cartItems[index].quantity);
      totalCartPrice = totalCartPrice + cartItems[index].subTotal; // combine the sub total of the item in the cart.
      totalWholePrice = totalWholePrice + cartItems[index].subTotal;
      // Update the cartItems list to trigger the observers
      cartItems[index] = cartItems[index];
    }
  }

  void deleteCartItem(int cartProductId){
    var index = cartItems.indexWhere((cartProduct) => cartProduct.cartId == cartProductId);
    totalDiscount = totalDiscount - cartItems[index].subDiscount;
    totalCartPrice = totalCartPrice - cartItems[index].subTotal; //totally remove the sub total from the total cart price
    totalWholePrice = totalWholePrice - cartItems[index].subTotal;
    cartItems.removeAt(index);
  }

  void removeAllCartItems(){
    cartItems.clear();
    totalDiscount = 0.obs;
    totalCartPrice = 0.obs;
  }

}
