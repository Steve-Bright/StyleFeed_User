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
      itemCategories: [categories[0], categories[1], categories[3]],
      shop: shops[0],
      title: "MAKEITCOUNT Oversized TEE(White)",
      price: 28000,
      sizes: [sizes[1], sizes[2], sizes[3]],
      description: "Light, Clean and White Shirt",
      image: "assets/product/count_1.jpg",
      color: Colors.transparent,
      discountPercent: 10,
      discount: ((10/100) * 28000).round(),
      isFavourite: false,
  ),
  Product(
      id: 2,
      itemCategories: [categories[0], categories[1], categories[3]],
      shop: shops[0],
      title: "Reflection Logo Turtle Neck Tee",
      price: 23800,
      sizes: [sizes[4]],
      description: "Reflection Logo Turtle Neck Tee",
      image: "assets/product/count_2.jpg",
      color: Colors.transparent,
      discountPercent: 5,
      discount: ((5/100) * 23800).round(),
      isFavourite: false,
  ),
  Product(
      id: 3,
      itemCategories: [categories[0], categories[1], categories[4]],
      shop: shops[0],
      title: "Pleated Pants",
      price: 21500,
      sizes: [sizes[1], sizes[2]],
      description: "Good quality Pleated Plants",
      image: "assets/product/count_3.jpg",
      color: Colors.transparent,
      discountPercent: 0,
      discount: ((0/100) * 21500).round(),
      isFavourite: false,
  ),
  Product(
      id: 4,
      itemCategories: [categories[0], categories[1]],
      shop: shops[0],
      title: "Questions Hoodie",
      price: 54000,
      sizes: [sizes[1], sizes[2]],
      description: "Orange On Black / Pink On Black Hoodie",
      image: "assets/product/count_4.jpg",
      color: Colors.transparent,
      discountPercent: 0,
      discount: ((0/100) * 54000).round(),
      isFavourite: false
  ),

  Product(
      id: 5,
      itemCategories: [categories[0], categories[4]],
      shop: shops[0],
      title: "Short Pant",
      price: 23000,
      sizes: [sizes[0], sizes[1], sizes[2], sizes[3]],
      description: "These are Short Pants",
      image: "assets/product/count_4.jpg",
      color: Colors.transparent,
      discountPercent: 0,
      discount: ((0/100) * 23000).round(),
      isFavourite: false
  ),

  Product(
      id: 6,
      itemCategories: [categories[0], categories[3]],
      shop: shops[1],
      title: "Lapel Polo",
      price: 28000,
      sizes: [sizes[1], sizes[2], sizes[3]],
      description: "Colorful Popular Lapel Polo ",
      image: "assets/product/coco_1.jpg",
      color: Colors.transparent,
      discountPercent: 0,
      discount: ((0/100) * 28000).round(),
      isFavourite: false
  ),

  Product(
      id: 7,
      itemCategories: [categories[0], categories[3]],
      shop: shops[1],
      title: "Zip Neck Sweatshirt",
      price: 32000,
      sizes: [sizes[1], sizes[2], sizes[3]],
      description: "These are our new product - zip neck sweatshirt ",
      image: "assets/product/coco_2.jpg",
      color: Colors.transparent,
      discountPercent: 0,
      discount: ((0/100) * 32000).round(),
      isFavourite: false
  ),

  Product(
      id: 8,
      itemCategories: [categories[0],categories[1], categories[3]],
      shop: shops[1],
      title: "Half Zip Burma 1990",
      price: 33000,
      sizes: [sizes[1], sizes[2], sizes[3]],
      description: "Popular Zip Burma with different colors and sizes",
      image: "assets/product/coco_3.jpg",
      color: Colors.transparent,
      discountPercent: 0,
      discount: ((0/100) * 33000).round(),
      isFavourite: false
  ),

  Product(
      id: 9,
      itemCategories: [categories[0], categories[3]],
      shop: shops[1],
      title: "Sweat Shirt",
      price: 20000,
      sizes: [ sizes[2], sizes[3]],
      description: "These are sweat shirts",
      image: "assets/product/coco_4.jpg",
      color: Colors.transparent,
      discountPercent: 0,
      discount: ((0/100) * 20000).round(),
      isFavourite: false
  ),

  Product(
      id: 10,
      itemCategories: [categories[1]],
      shop: shops[2],
      title: "Dress",
      price: 32000,
      sizes: [ sizes[4]],
      description: "This is dress",
      image: "assets/product/shottie_hottie_1.jpg",
      color: Colors.transparent,
      discountPercent: 0,
      discount: ((0/100) * 32000).round(),
      isFavourite: false
  ),

  Product(
      id: 11,
      itemCategories: [categories[1]],
      shop: shops[2],
      title: "2-in-1 Top",
      price: 19500,
      sizes: [sizes[4]],
      description: "This is 2 in 1 Top",
      image: "assets/product/shottie_hottie_2.jpg",
      color: Colors.transparent,
      discountPercent: 0,
      discount: ((0/100) * 19500).round(),
      isFavourite: false
  ),

  Product(
      id: 12,
      itemCategories: [categories[1]],
      shop: shops[2],
      title: "Tweet Coat",
      price: 29000,
      sizes: [sizes[4]],
      description: "This is tweet coat",
      image: "assets/product/shottie_hottie_3.jpg",
      color: Colors.transparent,
      discountPercent: 0,
      discount: ((0/100) * 29000).round(),
      isFavourite: false
  ),

  Product(
      id: 13,
      itemCategories: [categories[1]],
      shop: shops[2],
      title: "Layer Dress",
      price: 39500,
      sizes: [sizes[4]],
      description: "This is layer dress",
      image: "assets/product/shottie_hottie_4.jpg",
      color: Colors.transparent,
      discountPercent: 0,
      discount: ((0/100) * 39500).round(),
      isFavourite: false
  ),

  Product(
      id: 14,
      itemCategories: [categories[1]],
      shop: shops[2],
      title: "Backless Crop Top",
      price: 13500,
      sizes: [sizes[4]],
      description: "This is backless crop top",
      image: "assets/product/shottie_hottie_5.jpg",
      color: Colors.transparent,
      discountPercent: 0,
      discount: ((0/100) * 13500).round(),
      isFavourite: false
  ),
];
