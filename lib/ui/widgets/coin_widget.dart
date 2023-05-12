import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:like_button/like_button.dart';
import 'package:test_okboy/controllers/coin_controller.dart';
import 'package:test_okboy/model/coin_response.dart';

import '../../routes/name_screens.dart';

class CoinWidget extends GetView<CoinController> {
  const CoinWidget({Key? key, required this.coin}) : super(key: key);
  final Coin coin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.coinSelected = coin;
        Get.toNamed(NameScreens.detailCoin);
      },
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        elevation: 8,
        clipBehavior: Clip.hardEdge,
        child: Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        LikeButton (
                          onTap: (isLiked) => controller.onLikeButtonTapped(isLiked , coin) ,
                          isLiked: coin.isFavorite==1? true : false ,
                          size: 20,
                          circleColor: const CircleColor(
                              start: Color.fromARGB(255, 255, 0, 0),
                              end: Color.fromARGB(255, 236, 25, 71)),
                          bubblesColor: const BubblesColor(
                            dotPrimaryColor: Color.fromARGB(255, 246, 23, 15),
                            dotSecondaryColor: Color.fromARGB(255, 204, 0, 0),
                          ),
                          likeBuilder: (bool isLiked) {
                            return Icon(
                              Icons.favorite,
                              color: isLiked ? Colors.pink : Colors.grey,
                              size: 20,
                            );
                          },
                        ),
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: NetworkImage(coin.icon),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 120,
                                  child: Text(
                                  
                                    coin.name,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                               const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  coin.symbol,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                            Row(
                            
                              
                              
                              children: [
                                SizedBox(width: 80, child: Text('#${coin.rank}',  textAlign: TextAlign.start,)),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text(coin.getPrice(), style:const TextStyle(color: Colors.green),),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                 SizedBox(
                  width: 80,
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(coin.getPrice(),  style:const TextStyle(color: Colors.green)),
                    Text(coin.getVolume(), style:const TextStyle(color: Colors.pink)),
                  ],
                ))
              ],
            )),
      ),
    );
  }
}
