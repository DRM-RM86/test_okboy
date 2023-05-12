import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_okboy/controllers/coin_controller.dart';
import 'package:test_okboy/ui/widgets/coin_widget.dart';
import 'package:get/get.dart';
import '../../utils/string.dart';


class HomeScreen extends GetView<CoinController> {
   HomeScreen({Key? key}) : super(key: key);
  final info= Get.find <CoinController>();
 
  @override
  Widget build(BuildContext context) {
  
   final appBarHeigh = AppBar().preferredSize.height;
    final screenHeightAvailable = MediaQuery.of(context).size.height - appBarHeigh;


    return Scaffold(
      appBar: AppBar(
        title:const  Text( StringsApp.desc ),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            icon: const Icon(
              Icons.tune,
              color: Colors.white,
            ), 

            itemBuilder: (context) => [
              PopupMenuItem<int>(
                value: 0,
                child: Row(
                  children:const [
                    Icon(
                      Icons.monetization_on_outlined,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(StringsApp.orderByPrice),
                  ],
                ),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Row(
                  children:const[
                    Icon(
                      Icons.currency_bitcoin_rounded,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(StringsApp.orderByName),
                  ],
                ),
              ),

              PopupMenuItem<int>(
                value: 2,
                child: Row(
                  children: const[
                    Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(StringsApp.orderByFavorite),
                  ],
                ),
              )


            ],
            onSelected: (value) async {
              if (value == 0) {
               controller.sortByPrice();
               
              } else if (value == 1) {
                controller.sortByName();
              
              } else if (value == 2) {
                controller.sortByFavorite();
              }
            },
          ),
          
        ]

      ),
      body: info.obx((state) =>   
      ListView.builder(
         padding: const EdgeInsets.all(20),
         itemCount: controller.list.length,
         itemBuilder: (BuildContext context, int index) {
           return CoinWidget(coin: controller.list[index],);
         }),

       onError: (error) => Text('Error'),

       onLoading: Container(
         height: MediaQuery.of(context).size.height * .8 - appBarHeigh,
         width: MediaQuery.of(context).size.width,
         child: const Center(child: CircularProgressIndicator()),)

       

      ),
    );
  }
}