import 'package:style_feed/Model/product.dart';

class RewardItem{
  final Product product;
  final int rewardId;

  RewardItem({required this.product, required this.rewardId});
}

List<RewardItem> rewardItems = [
  RewardItem(product: products[13], rewardId: 1),
  RewardItem(product: products[12], rewardId: 2),
  RewardItem(product: products[10], rewardId: 3),
];