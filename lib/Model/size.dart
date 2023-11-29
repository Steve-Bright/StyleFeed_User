import 'package:get/get.dart';

class Size{
  RxString sizeValue;
  RxString shortcut;
  Size({required String sizeValue, required String shortcut}) :
        sizeValue =RxString(sizeValue), shortcut = RxString(shortcut);
}

List<Size> sizes = [
  Size(sizeValue: "Small", shortcut: "S"),
  Size(sizeValue: "Medium", shortcut: "M"),
  Size(sizeValue: "Large", shortcut: "L"),
  Size(sizeValue: "Extra Large", shortcut: "XL"),
  Size(sizeValue: "Free Size", shortcut: "Free"),
];
