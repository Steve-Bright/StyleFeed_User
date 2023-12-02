import 'package:get/get.dart';
import 'package:style_feed/Controller/cartController.dart';

class PointController extends GetxController{
  var totalPoints = 500.obs;
  var changingPoints = 0.obs;

  final CartController cartController = Get.find<CartController>();

  void getPoint(){
    changingPoints = RxInt((cartController.totalCartPrice / 100).round());
    totalPoints =  totalPoints + changingPoints.value;
  }
}