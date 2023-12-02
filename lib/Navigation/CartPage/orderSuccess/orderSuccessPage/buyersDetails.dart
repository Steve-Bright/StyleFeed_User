import 'package:flutter/material.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:google_fonts/google_fonts.dart';

class BuyersDetailsWidget extends StatefulWidget {
  final String name;
  final String phoneNumber;
  final String streetAddress;
  final String apartment;
  final String region;
  final String township;

  const BuyersDetailsWidget({
    Key? key,
    required this.name,
    required this.phoneNumber,
    required this.streetAddress,
    required this.apartment,
    required this.region,
    required this.township,
  }) : super(key: key);

  @override
  State<BuyersDetailsWidget> createState() => _BuyersDetailsWidgetState();
}

class _BuyersDetailsWidgetState extends State<BuyersDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      width: 320,
      height: 160,
      color: Colors.grey[50],
      borderRadius: 10,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClayText(
              "Buyer's Details:",
              emboss: true,
              depth: 100,
              style: GoogleFonts.montserrat(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 6, 10, 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClayText(
                    'Name        :       ${widget.name}',
                    emboss: true,
                    depth: 110,
                    style: GoogleFonts.montserrat(fontSize: 10, letterSpacing: 1),
                  ),
                  SizedBox(height: 3),
                  ClayText(
                    'Phone       :       ${widget.phoneNumber}',
                    emboss: true,
                    depth: 110,
                    style: GoogleFonts.montserrat(fontSize: 10, letterSpacing: 1),
                  ),
                  SizedBox(height: 3),
                  ClayText(
                    'Address    :       ${widget.streetAddress}, ${widget.apartment}',
                    emboss: true,
                    depth: 110,
                    style: GoogleFonts.montserrat(fontSize: 10, letterSpacing: 1),
                  ),
                  SizedBox(height: 3),
                  ClayText(
                    'Township  :       ${widget.township}',
                    emboss: true,
                    depth: 110,
                    style: GoogleFonts.montserrat(fontSize: 10, letterSpacing: 1),
                  ),
                  SizedBox(height: 3),
                  ClayText(
                    'Region      :       ${widget.region}',
                    emboss: true,
                    depth: 110,
                    style: GoogleFonts.montserrat(fontSize: 10, letterSpacing: 1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}