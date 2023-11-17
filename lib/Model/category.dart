import 'package:get/get.dart';

class Category{
  final RxInt id;
  final RxString name;

  Category({
    required int id,
    required String name,
  }): id = RxInt(id),
      name = RxString(name);
}

List<Category> categories = [
  Category(id: 1, name: "Man"),
  Category(id: 2, name: "Woman"),
  Category(id: 3, name: "Child"),
  Category(id: 4, name: "Shirt"),
  Category(id: 5, name: "Pants")
];