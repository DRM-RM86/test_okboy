import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

import '../../routes/name_screens.dart';
import '../../utils/string.dart';

class SplashScreen extends StatefulWidget {
  final int? seconds;
  final Color? backgroundColor;
  const SplashScreen(
      {@required this.seconds,
      this.backgroundColor = Colors.white
     });

  @override
   _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: widget.seconds!), () {
     
     Get.offAndToNamed(NameScreens.home);
         
    
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('assets/lottie/splash.json', repeat: true),
          const SizedBox(height: 30,),
          const Text(StringsApp.title, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          const Text(StringsApp.subTitle, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),),
        
                  const SizedBox(height: 30,),
                   const Text(StringsApp.desc,),
        ],
      ),
    );
  }
}
