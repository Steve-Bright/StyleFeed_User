import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:style_feed/Controller/cartController.dart';

class TotalSummary extends StatefulWidget {
  @override
  State<TotalSummary> createState() => _TotalSummaryState();
}

class _TotalSummaryState extends State<TotalSummary> {
  final CartController c = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSummaryRow('Sub-Total', 'MMK ${c.totalCartPrice}'),
        SizedBox(height: 15),
        _buildSummaryRow('Delivery Fee', 'MMK ${c.deliveryFees}'),
        SizedBox(height: 15),
        _buildSummaryRow('Couple Discount', 'MMK 0'),
        Divider(height: 30, color: Colors.black),
        _buildSummaryRow('Total Payment', 'MMK ${c.totalCartPrice.value + c.deliveryFees.value}', isTotal: true),
      ],
    );
  }

  Widget _buildSummaryRow(String title, String amount, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: GoogleFonts.montserrat(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.black)),
        Text(amount,
            style: GoogleFonts.montserrat(
                fontSize: 13,
                fontWeight: isTotal ? FontWeight.w700 : FontWeight.w600,
                color: isTotal ? Colors.green : Colors.black)),
      ],
    );
  }
}