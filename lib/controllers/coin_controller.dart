import 'dart:async';

import 'package:get/get.dart';
import 'package:test_okboy/model/coin_response.dart';
import 'package:test_okboy/provider/api_provider.dart';
import 'package:test_okboy/provider/db_provider.dart';

class CoinController extends GetxController with StateMixin {
/* -------------------------------------------------------------------------- */
  /*                                 CONTROLLERS                                */
  /* -------------------------------------------------------------------------- */



  /* -------------------------------------------------------------------------- */
  /*                                  VARIABLES                                 */
  /* -------------------------------------------------------------------------- */

  Timer? timer;
  RxList<Coin> list = RxList.empty();
  late Coin coinSelected;

  late final ApiProvider _provider;

  RxBool isFavorite=false.obs; 

  /* -------------------------------------------------------------------------- */
  /*                                 LIFECYCLES                                 */
  /* -------------------------------------------------------------------------- */

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _provider = Get.put(ApiProvider());

    timer = Timer.periodic(const Duration(seconds: 60), (Timer t) => {getAllData()});
  }

  @override
  void onReady() async {
    getAllData();
    super.onReady();
  }

  /* -------------------------------------------------------------------------- */
  /*                                   METHODS                                  */
  /* -------------------------------------------------------------------------- */

  void getAllData() async {
    change(list, status: RxStatus.loading());
    try {
      final obj = await _provider.getAll();
      list.value = obj;
      change(list, status: RxStatus.success());
    } catch (e) {
      change("Error", status: RxStatus.error('Error en servicio'));
    }
  }


  void sortByPrice(){
     list.sort((b, a) => a.price.compareTo(b.price));
     change(list, status: RxStatus.success());

  }

  void sortByName(){
     list.sort((a, b) => a.name.compareTo(b.name));
     change(list, status: RxStatus.success());
  }

   void sortByFavorite(){
     list.sort((b, a) => a.isFavorite!.compareTo(b.isFavorite!));
     change(list, status: RxStatus.success());
  }


  Future<bool> onLikeButtonTapped(bool isLiked , Coin coin) async{

    if(!isLiked){
        await DBProvider.db.addFavorite(coin);
    }else {
      await DBProvider.db.deleteFavoriteByID(coin.id);
    }
  
    return !isLiked;
  }

}
