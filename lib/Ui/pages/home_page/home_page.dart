import 'package:flutter/material.dart';
import 'package:provider_base_tools/provider_base_tools.dart';
import 'package:sample1_youtube/Models/CryptoModel/crypto_data.dart';
import 'package:sample1_youtube/Provider/data_provider.dart';
import 'package:sample1_youtube/Ui/pages/home_page/home_page_helper/home_page_banner.dart';
import 'package:sample1_youtube/Ui/pages/home_page/home_page_helper/home_page_drawer.dart';
import 'package:sample1_youtube/Ui/pages/home_page/home_page_helper/listview_shimmer.dart';
import 'package:sample1_youtube/Ui/pages/home_page/home_page_helper/marquee.dart';
import 'package:sample1_youtube/Ui/pages/home_page/home_page_helper/sell_buy_bottons.dart';
import 'package:sample1_youtube/Ui/ui_helper/actions_button.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../NetWork/respons_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tag = 0;
  List<String> options = [
    'Top Market Caps',
    'Top Gainers',
    'Top Losers',
  ];

  @override
  void initState() {
    super.initState();
    final cryptoProvider =
        Provider.of<CryptoDataProvider>(context, listen: false);
    cryptoProvider.getTopMarketCapData();
  }

  @override
  Widget build(BuildContext context) {
    var primareColor = Theme.of(context).primaryColor;
    var height = MediaQuery.of(context).size.height;
    PageController controller = PageController(initialPage: 2);
    return Scaffold(
        drawer: const HomePageDrawer(),
        appBar: AppBar(
          backgroundColor: primareColor,
          elevation: 0.0,
          actions: const [ActionThemeAndLangChangerButtons()],
          leading: leading(),
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              HomePageBanner(controller: controller),
              const Marquee1(),
              const SellBuyButton(),
              Expanded(
                child: Consumer<CryptoDataProvider>(
                  builder: (contex, cryptoProvider, childe) {
                    switch (cryptoProvider.state.status) {
                      case ResponsStatus.LOADING:
                        return const HomePageShimmerListEffect();
                      case ResponsStatus.COMPLETED:
                        List<CryptoData>? model =
                            cryptoProvider.dataFuture.data!.cryptoCurrencyList;
                        return ListView.separated(
                          itemBuilder: (context, index) => SizedBox(
                            height: 70,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                children: [
                                  Text("${index + 1}"),
                                  const SizedBox(width: 10),
                                  CachedNetworkImage(
                                    imageUrl:
                                        "https://s2.coinmarketcap.com/static/img/coins/64x64/${model![index].id}.png",
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(
                                      color: Colors.grey,
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: 10,
                        );
                      case ResponsStatus.ERROR:
                        return Text(cryptoProvider.state.message);
                      default:
                        return const Text(
                            'Please check your internet connection!');
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }

  Widget leading() {
    return Builder(
      builder: (context) => IconButton(
        icon: Icon(
          Icons.menu,
          color: Theme.of(context).unselectedWidgetColor,
        ),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
    );
  }
}
