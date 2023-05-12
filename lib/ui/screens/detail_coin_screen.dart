import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:test_okboy/controllers/coin_controller.dart';
import 'package:test_okboy/ui/screens/line_chart_screen.dart';

import '../../utils/string.dart';

class DetailCoinScreen extends GetView<CoinController> {
  const DetailCoinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        title: Text(controller.coinSelected.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .5,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        width: MediaQuery.of(context).size.width * .65,
                        child: Column(
                          children: [
                            Text(
                              controller.coinSelected.name,
                              style: const TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.bold),
                            ),
                            Text(
                             controller.coinSelected.symbol,
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .35,
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 35,
                            backgroundImage: NetworkImage(
                                controller.coinSelected.icon),
                          ),
                        ),
                      )
                    ],
                  ),
                  const  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        elevation: 8,
                        clipBehavior: Clip.hardEdge,
                        child: SizedBox(
                          width: 120,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Icon(Icons.align_vertical_bottom_outlined),
                              const Text(
                                StringsApp.ranking,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                              Text( "#${controller.coinSelected.rank.toString()}",style: const TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        elevation: 8,
                        clipBehavior: Clip.hardEdge,
                        child: SizedBox(
                          width: 120,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                             const Icon(Icons.monetization_on_outlined),
                              const Text(StringsApp.price
                               ,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                              Text( controller.coinSelected.getPrice(), style:const TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        elevation: 8,
                        clipBehavior: Clip.hardEdge,
                        child: SizedBox(
                          width: 120,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                             const Icon(Icons.monetization_on),
                              const Text(
                                StringsApp.volumen,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                              Text(controller.coinSelected.getVolume(),style:const TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        elevation: 8,
                        clipBehavior: Clip.hardEdge,
                        child: SizedBox(
                          width: 120,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const  Icon(Icons.currency_bitcoin),
                              const Text(StringsApp.marketPrice,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center),
                              Text(controller.coinSelected.getMarketCap(), style: const TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        elevation: 8,
                        clipBehavior: Clip.hardEdge,
                        child: SizedBox(
                          width: 120,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                             const Icon(Icons.currency_exchange_sharp),
                             const Text(StringsApp.ofert,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center),
                              Text(controller.coinSelected.getAvailableSupply(),style: const  TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        elevation: 8,
                        clipBehavior: Clip.hardEdge,
                        child: SizedBox(
                          width: 120,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                             const Icon(Icons.money),
                             const Text(
                                StringsApp.totalOfert,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              ),
                              Text(controller.coinSelected.getTotalSupply(),style:const TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .5,
              child: Column(
                children: const [
                  Center(
                    child: Text(
                      StringsApp.stats,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  LineChartScreen(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
