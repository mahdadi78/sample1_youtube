import 'package:flutter/material.dart';
import 'package:provider_base_tools/provider_base_tools.dart';
import 'package:sample1_youtube/Provider/data_provider.dart';
import 'package:sample1_youtube/Ui/pages/home_page/home_page_helper/home_page_banner.dart';
import 'package:sample1_youtube/Ui/pages/home_page/home_page_helper/home_page_drawer.dart';
import 'package:sample1_youtube/Ui/pages/home_page/home_page_helper/marquee.dart';
import 'package:sample1_youtube/Ui/pages/home_page/home_page_helper/sell_buy_bottons.dart';
import 'package:sample1_youtube/Ui/ui_helper/actions_button.dart';

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
              // HomePageBanner(controller: controller),
              //  const Marquee1(),
              const SellBuyButton(),
              Expanded(
                child: Consumer<CryptoDataProvider>(
                  builder: (contex, cryptoProvider, childe) {
                    switch (cryptoProvider.state.status) {
                      case ResponsStatus.LOADING:
                        return Text(cryptoProvider.state.message);

                      case ResponsStatus.COMPLETED:
                        return const Text('Don!.');
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
