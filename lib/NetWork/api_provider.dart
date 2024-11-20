import 'package:dio/dio.dart';

class ApiProvider {
  getTopMarketCapData() async {
    Response respons;
    //-----------------------------------------------------------------------------------------------------------
    //! https://stackoverflow.com/questions/65630743/how-to-solve-flutter-web-api-cors-error-only-with-dart-code
    //todo How to solve flutter web api cors error only with dart code?
    //------------------------------------------------------------------------------------------------------------
    respons = await Dio().get(
        "https://api.coinmarketcap.com/data-api/v3/cryptocurrency/listing?start=1&limit=10&sortBy=market_cap&sortType=desc&convert=USD&cryptoType=all&tagType=all&audited=false&aux=ath,atl,high24h,low24h,num_market_pairs,cmc_rank,date_added,max_supply,circulating_supply,total_supply,volume_7d,volume_30d,self_reported_circulating_supply,self_reported_market_cap");
    return respons;
  }
}
