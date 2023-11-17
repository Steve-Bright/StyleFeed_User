import 'package:get/get.dart';

class Shop{
  final RxString name;
  final RxString location;
  final RxString phone;
  final RxString owner;

  Shop({
    required String name,
    required String location,
    required String phone,
    required String owner
  }): name = RxString(name),
      location = RxString(location),
      phone = RxString(phone),
      owner = RxString(owner);
}

List<Shop> shops = [
  Shop(name: 'Shop - 1', location: "Yangon", phone: "09-44444444", owner: "Swam Htet"),
  Shop(name: 'Shop - 2', location: "Mandalay", phone: "09-44444444", owner: "Moe Yan Htun"),
  Shop(name: 'Shop - 3', location: "Pyin Oo Lwin", phone: "09-44444444", owner: "Lin Htet Lwin")
];