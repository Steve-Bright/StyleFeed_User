import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Product {
  final RxInt id;
  final RxString image;
  final RxString title;
  final RxString description;
  RxInt price;
  final RxInt size;
  final Rx<Color> color;
  RxInt discount;

  Product({
    required int id,
    required String image,
    required String title,
    required String description,
    required int price,
    required int size,
    required Color color,
    required int discount,
  })  : id = RxInt (id),
        image = RxString(image),
        title = RxString(title),
        description = RxString(description),
        price = RxInt(price),
        size = RxInt(size),
        color = Rx<Color>(color),
        discount = RxInt(discount);
}



List<Product> products = [
  Product(
      id: 1,
      title: "Shoe",
      price: 1200,
      size: 12,
      description: "These are shoes",
      image: "assets/product/1.png",
      color: Colors.transparent,
      discount: 0,
  ),
  Product(
      id: 2,
      title: "Dress",
      price: 234,
      size: 8,
      description: "This is a dress",
      image: "assets/product/2.png",
      color: Colors.transparent,
      discount: 0,
  ),
  Product(
      id: 3,
      title: "Shirt",
      price: 234,
      size: 10,
      description: "This is a shirt",
      image: "assets/product/3.png",
      color: Colors.transparent,
      discount: 0,
  ),
  Product(
      id: 4,
      title: "Jacket",
      price: 234,
      size: 11,
      description: "This is a jacket",
      image: "assets/product/4.png",
      color: Colors.transparent,
    discount: 0,
  )
];
