import 'package:flutter/material.dart';
import 'package:sample1_youtube/Models/CryptoModel/all_crypto_model.dart';
import 'package:sample1_youtube/NetWork/api_provider.dart';
import 'package:sample1_youtube/NetWork/respons_model.dart';

class CryptoDataProvider extends ChangeNotifier {
  ApiProvider apiProvider = ApiProvider();
  //todo get topMarket Cap data

  late AllCryptoModel dataFuture;
  late ResponseModel state;
  // ignore: prefer_typing_uninitialized_variables
  var response;

  getTopMarketCapData() async {
    state = ResponseModel.loading("is Loading...");
    notifyListeners();

    try {
      response = await apiProvider.getTopMarketCapData();

      if (response.statusCode == 200) {
        dataFuture = AllCryptoModel.fromJson(response.data);
        state = ResponseModel.completed(dataFuture);
      } else {
        state = ResponseModel.error("something wrong...");
      }

      notifyListeners();
    } catch (e) {
      state = ResponseModel.error(e.toString());
      notifyListeners();
    }
  }
}
