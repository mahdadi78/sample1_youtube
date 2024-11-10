import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_base_tools/provider_base_tools.dart';
import 'package:sample1_youtube/Provider/provider.dart';

class ActionThemeAndLangChangerButtons extends StatelessWidget {
  const ActionThemeAndLangChangerButtons({super.key});

  @override
  Widget build(BuildContext context) {
    //todo The method of calling and using the provider class
    final themeP = Provider.of<MyProvider>(context);

    var switchThemeIcon = themeP.isDarkMode()
        ? const Icon(CupertinoIcons.moon_fill)
        : const Icon(CupertinoIcons.sun_min_fill);

    var switchLangIcon = themeP.isEnglish
        ? const Icon(CupertinoIcons.textformat_abc_dottedunderline)
        : const Icon(CupertinoIcons.textformat_abc);

    return Row(
      children: [
        IconButton(
          color: Theme.of(context).unselectedWidgetColor,
          onPressed: () {
            themeP.togglrTheme();
          },
          icon: switchThemeIcon,
        ),
        IconButton(
          color: Theme.of(context).unselectedWidgetColor,
          onPressed: () {
            themeP.langeButtonClicker();
          },
          icon: switchLangIcon,
        ),
      ],
    );
  }
}
