import 'package:test_okboy/model/coin_response.dart';
import 'package:test_okboy/repository/api_provider_repository.dart';

class CoinsRepositoryMock implements ApiProviderRepository{
  CoinsRepositoryMock({required this.withValues});
  final bool withValues;
  
  @override
  Future<List<Coin>> getAll() {
    if(withValues){

      return Future.value([
         Coin(
          id:"bitcoin",
      icon:"icon.png",
      name:"Bitcoin",
      symbol:"BTC",
      rank:0,
      price:0,
      priceBtc:0,
      volume:0,
      marketCap:0,
      availableSupply:0,
      totalSupply:0,
      priceChange1H:0,
      priceChange1D:0,
      priceChange1W:0,

         ),
         Coin(
          id:"ethereum",
      icon:"ethereum.png",
      name:"Ethereum",
      symbol:"ETH",
      rank:0,
      price:0,
      priceBtc:0,
      volume:0,
      marketCap:0,
      availableSupply:0,
      totalSupply:0,
      priceChange1H:0,
      priceChange1D:0,
      priceChange1W:0,

         )
         ,
         Coin(
          id:"tether",
      icon:"tether.png",
      name:"Tether",
      symbol:"USDT",
      rank:0,
      price:0,
      priceBtc:0,
      volume:0,
      marketCap:0,
      availableSupply:0,
      totalSupply:0,
      priceChange1H:0,
      priceChange1D:0,
      priceChange1W:0,

         )

      ]
        ,
      );

    }

    return Future.value([]);
  }

}