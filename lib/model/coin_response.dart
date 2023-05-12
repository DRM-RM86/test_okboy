// To parse this JSON data, do
//
//     final coinsResponse = coinsResponseFromJson(jsonString);

import 'dart:convert';
import 'package:intl/intl.dart';

CoinsResponse coinsResponseFromJson(String str) =>
    CoinsResponse.fromJson(json.decode(str));

String coinsResponseToJson(CoinsResponse data) => json.encode(data.toJson());

class CoinsResponse {
  List<Coin> coins;

  CoinsResponse({
    required this.coins,
  });

  factory CoinsResponse.fromJson(Map<String, dynamic> json) => CoinsResponse(
        coins: List<Coin>.from(json["coins"].map((x) => Coin.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "coins": List<dynamic>.from(coins.map((x) => x.toJson())),
      };
}

class Coin {
  String id;
  String icon;
  String name;
  String symbol;
  int rank;
  double price;
  double priceBtc;
  double volume;
  double marketCap;
  double availableSupply;
  double totalSupply;
  double priceChange1H;
  double priceChange1D;
  double priceChange1W;
  String? websiteUrl;
  String? twitterUrl;
  String? contractAddress;
  int? decimals;
  String? redditUrl;
  int? isFavorite =  0;



  getPrice() {
    return "\$ ${oCcy.format(price)}";
  }

  getVolume() {
    return "\$ ${oCcy.format(volume)}";
  }

  getMarketCap() {
    return "\$ ${oCcy.format(marketCap)}";
  }

  getAvailableSupply() {
    return "\$ ${oCcy.format(availableSupply)}";
  }

  getTotalSupply() {
    return "\$ ${oCcy.format(totalSupply)}";
  }

  Coin(
      {required this.id,
      required this.icon,
      required this.name,
      required this.symbol,
      required this.rank,
      required this.price,
      required this.priceBtc,
      required this.volume,
      required this.marketCap,
      required this.availableSupply,
      required this.totalSupply,
      required this.priceChange1H,
      required this.priceChange1D,
      required this.priceChange1W,
      this.websiteUrl,
      this.twitterUrl,
      this.contractAddress,
      this.decimals,
      this.redditUrl,
      this.isFavorite});
  final oCcy = NumberFormat("#,##0.00", "en_US");

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
        id: json["id"],
        icon: json["icon"],
        name: json["name"],
        symbol: json["symbol"],
        rank: json["rank"],
        price: json["price"]?.toDouble(),
        priceBtc: json["priceBtc"]?.toDouble(),
        volume: json["volume"]?.toDouble() ?? 0,
        marketCap: json["marketCap"]?.toDouble(),
        availableSupply: json["availableSupply"]?.toDouble(),
        totalSupply: json["totalSupply"]?.toDouble(),
        priceChange1H: json["priceChange1h"]?.toDouble(),
        priceChange1D: json["priceChange1d"]?.toDouble(),
        priceChange1W: json["priceChange1w"]?.toDouble(),
        websiteUrl: json["websiteUrl"],
        twitterUrl: json["twitterUrl"],
        contractAddress: json["contractAddress"],
        decimals: json["decimals"],
        redditUrl: json["redditUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "icon": icon,
        "name": name,
        "symbol": symbol,
        "rank": rank,
        "price": price,
        "priceBtc": priceBtc,
        "volume": volume,
        "marketCap": marketCap,
        "availableSupply": availableSupply,
        "totalSupply": totalSupply,
        "priceChange1h": priceChange1H,
        "priceChange1d": priceChange1D,
        "priceChange1w": priceChange1W,
        "websiteUrl": websiteUrl,
        "twitterUrl": twitterUrl,
        "contractAddress": contractAddress,
        "decimals": decimals,
        "redditUrl": redditUrl,
      };
}
