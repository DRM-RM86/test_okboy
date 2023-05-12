import '../model/coin_response.dart';

abstract class ApiProviderRepository{
  Future<List<Coin>> getAll();
  
}