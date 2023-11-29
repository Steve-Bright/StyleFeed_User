import 'package:get/get.dart';

class Shop{
  final RxString name;
  final RxString location;
  final RxString phone;
  final RxString owner;
  final RxString image;
  final RxString description;
  final RxInt rating;

  Shop({
    required String name,
    required String location,
    required String phone,
    required String owner,
    required String image,
    required String description,
    required int rating,
  }): name = RxString(name),
      location = RxString(location),
      phone = RxString(phone),
      owner = RxString(owner),
      image = RxString(image),
      description = RxString(description),
      rating = RxInt(rating);
}

List<Shop> shops = [
  Shop(name: 'Count', location: "Yangon", phone: "09-44444444", owner: "Swam Htet", image: "assets/shop/shop1.png", description: "This is description 1", rating: 5),
  Shop(name: 'Coco Original', location: "Mandalay", phone: "09-44444444", owner: "Moe Yan Htun", image: "assets/shop/shop2.jpg", description: "This is description 2", rating: 4),
  Shop(name: 'Attractive', location: "Pyin Oo Lwin", phone: "09-44444444", owner: "Lin Htet Lwin", image: "assets/shop/shop3.png", description: "This is description 3", rating: 4,),
  Shop(name: "Tina's Fashion Bar", location: "Pyin Oo Lwin", phone: "09-44444444", owner: "Lin Htet Lwin", image: "assets/shop/shop3.png", description: "This is description 3", rating: 4,),
  Shop(name: "Rilly Shine", location: "Pyin Oo Lwin", phone: "09-44444444", owner: "Lin Htet Lwin", image: "assets/shop/shop3.png", description: "This is description 3", rating: 4,),
  Shop(name: "SisBurma", location: "Pyin Oo Lwin", phone: "09-44444444", owner: "Lin Htet Lwin", image: "assets/shop/shop3.png", description: "This is description 3", rating: 4,),
  Shop(name: "High Cultured", location: "Pyin Oo Lwin", phone: "09-44444444", owner: "Lin Htet Lwin", image: "assets/shop/shop3.png", description: "This is description 3", rating: 4,),
  Shop(name: "La Hemera", location: "Pyin Oo Lwin", phone: "09-44444444", owner: "Lin Htet Lwin", image: "assets/shop/shop3.png", description: "This is description 3", rating: 4,),
];