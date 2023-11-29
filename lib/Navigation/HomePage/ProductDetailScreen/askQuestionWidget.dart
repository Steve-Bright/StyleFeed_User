import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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