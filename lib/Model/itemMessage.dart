import 'package:flutter/material.dart';

class ItemMessage extends StatefulWidget {
  const ItemMessage({super.key});

  @override
  State<ItemMessage> createState() => _ItemMessageState();
}

class _ItemMessageState extends State<ItemMessage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 60,
      child: ElevatedButton(
        onPressed: () {},
        child: Icon(
          Icons.message_outlined,
          size: 25,
        ),
      ),
    );
  }
}