import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:style_feed/UserProfile/pointRewardDesign.dart';
import 'package:style_feed/Model/rewardModel.dart';

class RewardsTab extends StatefulWidget {
  const RewardsTab({super.key});

  @override
  State<RewardsTab> createState() => _RewardsTabState();
}

class _RewardsTabState extends State<RewardsTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Hot Right Now', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),

                InkWell(
                    onTap: (){
                    },
                    child: Text(
                        'More >',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)
                    )
                )
              ],
            ),
          ),

          Container(
            height: 300,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: rewardItems.length,
                    itemBuilder: (context, index) {
                      // final item = cartController.cartItems[index];
                      return RewardDesignCard(index: index);
                      // SizedBox(height: 30),

                    },
                  ),
                ),
              ],
            ),
          ),
          // for(int i = 0; i < 5; i++)
          //   SingleChildScrollView(
          //     scrollDirection: Axis.horizontal,
          //     child: RewardDesignCard(),
          //   )
        ],
      ),
    );
  }
}
