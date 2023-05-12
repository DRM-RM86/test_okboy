import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:test_okboy/model/coin_response.dart';

import '../repository/db_provider_repository.dart';



class DBProvider extends DBProviderRepository{
   static  Database? _dataBase;

  static final DBProvider db = DBProvider._();


  DBProvider._();

  Future<Database> get databse async{
    if(_dataBase!=null) return _dataBase!;

    _dataBase= await initDB();

    return _dataBase!;

    
  }

Future<Database>  initDB() async{

  Directory documentDirectory =await getApplicationDocumentsDirectory();
  final path= join(documentDirectory.path,'favorites.db');

  //Crear DB

return await openDatabase(path, version: 1,
onOpen: (db){},
onCreate: (Database db, int version) async {
    await db.execute('''
CREATE TABLE Favorite(
  idFavorite INTEGER PRIMARY KEY,
  id TEXT,
  icon TEXT,
  name TEXT,
  symbol TEXT,
  rank INTEGER,
  price REAL,
  priceBtc REAL,
  volume REAL, 
  marketCap REAL,
  availableSupply REAL,
  totalSupply REAL,
  priceChange1H REAL,
  priceChange1D REAL,
  priceChange1W REAL,
  websiteUrl TEXT,
  twitterUrl TEXT,
  contractAddress TEXT,
  decimals INTEGER,
  redditUrl TEXT,
  isFavorite INTEGER
);
''');
}
);
}

  @override
  Future<int> addFavorite(Coin favorite) async{
    final db= await databse;
  final res= await db.insert("Favorite", favorite.toJson());
  return res;
  }

  @override
  Future<int> deleteFavoriteByID(String id) async{
    final db= await databse;
  final res= await db.delete('Favorite', where: 'id=?', whereArgs: [id]);
  return  res;
  }

  @override
  Future<int> isFavorite(String id) async{
    final db= await databse;
  final res= await db.query('Favorite', where: 'id =? ',whereArgs: [id]);
  return res.isNotEmpty?1 : 0;
  }

}
