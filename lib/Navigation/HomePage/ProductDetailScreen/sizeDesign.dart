import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:style_feed/Model/product.dart';

class SizeDesign extends StatefulWidget {
  final Product product;
  final int index;
  const SizeDesign({required this.product, required this.index});

  @override
  State<SizeDesign> createState() => _SizeDesignState();
}

class _SizeDesignState extends State<SizeDesign> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            widget.product.sizes[widget.index].shortcut.value,
            style: GoogleFonts.montserrat(
              fontSize: 13,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
