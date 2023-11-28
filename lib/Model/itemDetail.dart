import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class shopName extends StatefulWidget {
  const shopName({super.key});

  @override
  State<shopName> createState() => _shopNameState();
}

class _shopNameState extends State<shopName> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Image border
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(30), // Image radius
                    child: Image.asset(
                      "assets/1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "Sisburma",
                          style: GoogleFonts.montserrat(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Container(
                        child: Text("Clothing (Brand)"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 40,
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStatePropertyAll<Color>(Colors.black12),
                ),
                child: Text(
                  "Follow",
                  style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class askQus extends StatefulWidget {
  const askQus({super.key});

  @override
  State<askQus> createState() => _askQusState();
}

class _askQusState extends State<askQus> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(Colors.black12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  child: Icon(
                    Icons.question_answer_outlined,
                    size: 25,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Text(
                    "Ask question for this product",
                    style: GoogleFonts.montserrat(
                        fontSize: 15, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.keyboard_arrow_right_sharp,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}

class bottomAppBar extends StatefulWidget {
  const bottomAppBar({super.key});

  @override
  State<bottomAppBar> createState() => _bottomAppBarState();
}

class _bottomAppBarState extends State<bottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor:
                MaterialStatePropertyAll<Color>(Colors.transparent),
              ),
              icon: Icon(
                Icons.store,
                color: Colors.black,
                size: 40,
              ),
            ),
            Container(
              child: TextButton(
                child: Text(
                  "Review",
                  style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStatePropertyAll<Color>(Colors.orange),
                ),
              )
            ),
            Container(
              child: TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Container(
                      child: Icon(
                        Icons.add_shopping_cart_sharp,
                        size: 25,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}