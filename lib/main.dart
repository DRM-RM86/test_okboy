import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:test_okboy/routes/app_routes.dart';
import 'package:test_okboy/ui/screens/splash_screen.dart';

import 'provider/db_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    DBProvider.db.initDB();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
          getPages: AppRoutes.getRoutes,
          home: const SplashScreen(seconds: 7, backgroundColor: Colors.transparent,),
    );
  }
}










