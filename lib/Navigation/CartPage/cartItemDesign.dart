import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/cartController.dart';
import '../../Model/product.dart';

class CartItemCard extends StatefulWidget {
  final Product product;
  var quantity;
  var cartId;
  var subTotal;

  CartItemCard({
    required this.product,
    required this.quantity,
    required this.cartId,
    required this.subTotal
  });

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  @override
  Widget build(BuildContext context) {
    // ${widget.product.price}
    final CartController cartController = Get.find<CartController>();
    return Container(
      height: 180,
      child: Card(
        margin: EdgeInsets.all(16.0),
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Image.asset(
                widget.product.image.value,
                width: 130,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${widget.product.title}',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      )),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: (){
                          cartController.deleteCartItem(widget.cartId);
                        }
                      )
                    ],
                  ),
                  Flexible(child: Container(child: Text('${widget.product.shop}', overflow: TextOverflow.ellipsis,))),
                  Row(
                    children: [
                      Text('${widget.product.price}'),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove_circle),
                            onPressed: (){
                              cartController.decreaseQty(widget.cartId);
                            }
                          ),
                          Text('${widget.quantity}'),
                          IconButton(
                            icon: Icon(Icons.add_circle),
                            onPressed: (){
                              cartController.increaseQty(widget.cartId);
                            }
                          )
                        ]
                      )
                    ],
                  ),
                ]
              )
            ]
          ),
        )
      ),
    );
  }
}
