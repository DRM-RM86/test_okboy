import 'package:flutter_test/flutter_test.dart';

import 'package:test_okboy/model/coin_response.dart';
import 'package:test_okboy/repository/api_provider_repository.dart';

import 'mocks/coins_repository_mock.dart';

void main() {

  test('test when the service has coins' , () async {
    ApiProviderRepository repository = CoinsRepositoryMock(withValues: true);
    List<Coin> coins= await repository.getAll();
    expect(coins.length, 3);
  });



   test('test when the service has not coins' , () async {
    ApiProviderRepository repository = CoinsRepositoryMock(withValues: false);
    List<Coin> coins= await repository.getAll();
    expect(coins.length, 0);
  });
  
  
}