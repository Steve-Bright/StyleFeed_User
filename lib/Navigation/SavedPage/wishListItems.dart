import 'package:flutter/material.dart';

class wishListItems extends StatefulWidget {
  const wishListItems({super.key});

  @override
  State<wishListItems> createState() => _wishListItemsState();
}

class _wishListItemsState extends State<wishListItems> {

  List descritpion = [
    ".","Shoe","Dress","ShiTrt","Jacket", "Cap", "Dress", "Jeans", "Hat"
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.68,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for(int i=1; i<descritpion.length; i++)
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 10),
            margin: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "-50%",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFEDECF2),
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Icon(Icons.favorite,
                      color: Colors.red,
                    ),
                  ],
                ),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/itemDetail');
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Image.asset("assets/$i.png",
                      width: 120,
                      height: 120,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 8),
                  alignment: Alignment.centerLeft,
                  child: Text("Product Title",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("${descritpion[i]}",
                      style: TextStyle(
                          fontSize: 15, color: Colors.black
                      )),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$55",
                        style: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      ),
                      Icon(Icons.shopping_cart_checkout,
                          color: Colors.black
                      )
                    ],
                  ),
                )
              ],
            ),
          )
      ],
    );
  }
}
