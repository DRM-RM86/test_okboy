import '../model/coin_response.dart';

abstract class DBProviderRepository{

  Future<int> addFavorite(Coin favorite);
  Future<int > isFavorite(String id);
  Future<int > deleteFavoriteByID(String id);

} 