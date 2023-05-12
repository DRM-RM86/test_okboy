import 'package:get/get.dart';
import 'package:test_okboy/model/coin_response.dart';
import 'package:test_okboy/provider/db_provider.dart';
import '../repository/api_provider_repository.dart';

class ApiProvider extends GetConnect implements ApiProviderRepository{
  @override
  Future<List<Coin>> getAll() async{
   List<Coin> list;
    String url = 'https://api.coinstats.app/public/v1/coins?skip=0&limit=250&currency=USD';
    var response = await get(url);
    list = CoinsResponse.fromJson(response.body).coins;
    for (int i=0 ; i<list.length; i++) {
      list[i].isFavorite = await DBProvider.db.isFavorite(list[i].id); 
    }
    return list ;
  }


}