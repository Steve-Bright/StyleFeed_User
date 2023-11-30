import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import 'package:style_feed/Model/product.dart';
import 'package:style_feed/Model/itemMessage.dart';
import 'package:style_feed/Navigation/HomePage/ProductDetailScreen/askQuestionWidget.dart';
import 'package:style_feed/Navigation/HomePage/ProductDetailScreen/shopNameBar.dart';
import 'package:style_feed/Navigation/HomePage/ProductDetailScreen/productBottomBar.dart';
import 'package:style_feed/Navigation/HomePage/ProductDetailScreen/sizeDesign.dart';
import 'package:style_feed/Controller/favouriteController.dart';

class DetailScreen extends StatefulWidget {
  final Product _product;
  DetailScreen(this._product);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 247, 247),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 247, 247, 247),
        elevation: 0,
        title: Text(
          "Product Detail",
          style: GoogleFonts.montserrat(
              fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
        actions: [
          IconButton(
            onPressed: () {
              final FavouriteController f = Get.find<FavouriteController>();
              f.toggleFavourite(widget._product);
            },
            icon: Obx(() => Icon(
              widget._product.isFavourite.value ? Icons.favorite : Icons.favorite_border,
            )),
            color: Colors.red,
          )
        ],
      ),
      body: ListView(
        children: [
          shopName(product: widget._product),
          Column(
            children: [
              Image.asset(
                widget._product.image.value,
                height: 300,
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
          Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Flexible(
                            child: Text(
                              widget._product.title.value,
                              style: GoogleFonts.montserrat(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "${widget._product.price} MMK",
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "* Only 2 Left *",
                            style: GoogleFonts.montserrat(color: Colors.red),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.star, color: Colors.orange[500]),
                                  Icon(Icons.star, color: Colors.orange[500]),
                                  Icon(Icons.star, color: Colors.orange[500]),
                                  Icon(Icons.star, color: Colors.orange[500]),
                                  Icon(Icons.star, color: Colors.black),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    askQus(),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Sizes",
                      style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          spacing: 10.0,
                          children: List.generate(
                            widget._product.sizes.length,
                                (index) => SizeDesign(product: widget._product, index: index)
                          ),
                        ),
                        ItemMessage(),

                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Product Description",
                            style: GoogleFonts.montserrat(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          child: ReadMore(widget._product),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: bottomAppBar(product: widget._product),
    );
  }
}

class ReadMore extends StatefulWidget {
  final Product _product;
  ReadMore(this._product);

  @override
  _ReadMoreState createState() => _ReadMoreState();
}

class _ReadMoreState extends State<ReadMore> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget._product.description.value
          // "The Off-White x Air Jordan 1 Retro High OG was one of the most highly anticipated footwear collaborations of 2017. It marked the first time Virgil Abloh, founder of the Milan-based fashion label and Jordan Brand had teamed up. Nicknamed \"The 10\" edition, this pair comes in the original Chicago-themed white, black and varsity red colorway. Featuring a white, red and black-based deconstructed leather upper with a Swooshless medial side branded with \"Off-White for Nike Air Jordan 1, Beaverton, Oregon, USA Â© 1985."
          // Show only 3 lines when not expanded
          ,
          style: GoogleFonts.montserrat(
              color: const Color.fromARGB(255, 94, 94, 94)),
          maxLines: isExpanded ? 2 : 20,
          overflow: TextOverflow.ellipsis,
        ),
        GestureDetector(
          onTap: () {
            setState(
                  () {
                isExpanded = !isExpanded;
              },
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              isExpanded ? 'Read More' : 'Read Less',
              style: GoogleFonts.montserrat(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}