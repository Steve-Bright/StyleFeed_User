import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                size: 30,
              ),
            ),
            Container(
                child: TextButton(
                  child: Text(
                    "Review",
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,),
                  ),
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStatePropertyAll<Color>(Colors.white),
                  ),
                )
            ),
            Container(
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.black)
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    Container(
                      child: Icon(
                          Icons.add_shopping_cart_sharp,
                          size: 25,
                          color: Colors.white
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(fontSize: 16, color: Colors.white),
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