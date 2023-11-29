import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:style_feed/Model/category.dart';
import 'package:style_feed/Model/shop.dart';
import 'package:style_feed/Model/size.dart';

class Product {
  final RxInt id;
  final RxList<Category> itemCategories;
  final Shop shop;
  final RxString image;
  final RxString title;
  final RxString description;
  RxInt price;
  RxList<Size> sizes;
  final Rx<Color> color;
  RxInt discountPercent;
  RxInt discount;             //direct Discount value
  RxBool isFavourite;

  Product({
    required int id,
    required List<Category> itemCategories,
    required Shop shop,
    required String image,
    required String title,
    required String description,
    required int price,
    required List<Size> sizes,
    required Color color,
    required int discountPercent,
    required int discount,
    required bool isFavourite,
  })  : id = RxInt (id),
        itemCategories = itemCategories.obs,
        shop = shop,
        image = RxString(image),
        title = RxString(title),
        description = RxString(description),
        price = RxInt(price),
        sizes = sizes.obs,
        color = Rx<Color>(color),
        discountPercent = RxInt(discountPercent),
        discount = RxInt(discount),
        isFavourite = RxBool(isFavourite);
}

List<Product> products = [
  Product(
      id: 1,
      itemCategories: [categories[0], categories[2]],
      shop: shops[0],
      title: "Dress",
      price: 32000,
      sizes: [sizes[4]],
      description: "Good Quality Dress with different Colors",
      image: "assets/product/product1.jpg",
      color: Colors.transparent,
      discountPercent: 10,
      discount: ((10/100) * 32000).round(),
      isFavourite: false,
  ),
  Product(
      id: 2,
      itemCategories: [categories[0], categories[3]],
      shop: shops[0],
      title: "Top",
      price: 19500,
      sizes: [sizes[0], sizes[1], sizes[2]],
      description: "Good quality top with different colors",
      image: "assets/product/product2.jpg",
      color: Colors.transparent,
      discountPercent: 5,
      discount: ((5/100) * 32000).round(),
      isFavourite: false,
  ),
  Product(
      id: 3,
      itemCategories: [categories[1], categories[3]],
      shop: shops[1],
      title: "Tweet Coat",
      price: 29000,
      sizes: [sizes[1], sizes[2]],
      description: "Good quality coat with different colors",
      image: "assets/product/product3.jpg",
      color: Colors.transparent,
      discountPercent: 0,
      discount: ((0/100) * 32000).round(),
      isFavourite: false,
  ),
  Product(
      id: 4,
      itemCategories: [categories[2], categories[3]],
      shop: shops[2],
      title: "Backless Crop Top-trendy Top",
      price: 13500,
      sizes: [sizes[4]],
      description: "Trendy Top with differnt Colors",
      image: "assets/product/product4.jpg",
      color: Colors.transparent,
      discountPercent: 0,
      discount: ((0/100) * 32000).round(),
      isFavourite: false
  )
];
