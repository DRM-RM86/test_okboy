import 'package:get/get.dart';
import 'package:test_okboy/bindings/coin_bindig.dart';

import '../ui/screens/detail_coin_screen.dart';
import '../ui/screens/home_screen.dart';
import 'name_screens.dart';

class AppRoutes{
  static const initialRoute= NameScreens.home;

  static final List <GetPage>  getRoutes = [
    GetPage(name: NameScreens.home, page: () =>  HomeScreen(), binding: CoinBinding()),
    GetPage(name: NameScreens.detailCoin, page: () => const DetailCoinScreen()),
  ];
}