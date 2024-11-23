import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sample1_youtube/decimal_rounder.dart';
import '../../../NetWork/respons_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _choicesList = [
    'Top MarketCaps',
    'Top Gainers',
    'Top Losers'
  ];

  int tag = 0;

  @override
  void initState() {
    super.initState();
    final cryptoProvider =
        Provider.of<CryptoDataProvider>(context, listen: false);
    cryptoProvider.getTopMarketCapData();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
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
              Padding(
                padding: const EdgeInsets.only(right: 5.0, left: 5),
                child: Row(
                  children: [
                    Consumer<CryptoDataProvider>(
                      builder: (context, cryptoDataProvider, child) {
                        return Wrap(
                          spacing: 8,
                          children: List.generate(_choicesList.length, (index) {
                            return ChoiceChip(
                                label: Text(_choicesList[index],
                                    style: textTheme.titleSmall),
                                selected:
                                    cryptoDataProvider.defaultChoiceIndex ==
                                        index,
                                selectedColor: Colors.blue,
                                onSelected: (value) {
                                  switch (index) {
                                    case 0:
                                      cryptoDataProvider.getTopMarketCapData();
                                      break;
                                    case 1:
                                      cryptoDataProvider.getTopGainersData();
                                      break;
                                    case 2:
                                      cryptoDataProvider.getTopLosersData();
                                      break;
                                  }
                                });
                          }),
                        );
                      },
                    )
                  ],
                ),
              ),
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
                            itemBuilder: (context, index) {
                              var number = index + 1;
                              var tokenId = model![index].id;

                              MaterialColor filterColor =
                                  DecimalRounder.setColorFilter(
                                      model[index].quotes![0].percentChange24h);

                              var finalPrice =
                                  DecimalRounder.removePriceDecimals(
                                      model[index].quotes![0].price);

                              // percent change setup decimals and colors
                              var percentChange =
                                  DecimalRounder.removePercentDecimals(
                                      model[index].quotes![0].percentChange24h);

                              Color percentColor =
                                  DecimalRounder.setPercentChangesColor(
                                      model[index].quotes![0].percentChange24h);
                              Icon percentIcon =
                                  DecimalRounder.setPercentChangesIcon(
                                      model[index].quotes![0].percentChange24h);

                              return SizedBox(
                                height: height * 0.075,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        number.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 15),
                                      child: CachedNetworkImage(
                                          fadeInDuration:
                                              const Duration(milliseconds: 500),
                                          height: 32,
                                          width: 32,
                                          imageUrl:
                                              "https://s2.coinmarketcap.com/static/img/coins/32x32/$tokenId.png",
                                          placeholder: (context, url) =>
                                              const CircularProgressIndicator(),
                                          errorWidget: (context, url, error) {
                                            return const Icon(Icons.error);
                                          }),
                                    ),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            model[index].name!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                          Text(
                                            model[index].symbol!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: ColorFiltered(
                                          colorFilter: ColorFilter.mode(
                                              filterColor, BlendMode.srcATop),
                                          child: SvgPicture.network(
                                              "https://s3.coinmarketcap.com/generated/sparklines/web/1d/2781/$tokenId.svg")),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "\$$finalPrice",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                percentIcon,
                                                Text(
                                                  "$percentChange%",
                                                  style: GoogleFonts.ubuntu(
                                                      color: percentColor,
                                                      fontSize: 13),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider();
                            },
                            itemCount: 10);
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
