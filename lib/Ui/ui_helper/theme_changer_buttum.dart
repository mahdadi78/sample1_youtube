import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_base_tools/provider_base_tools.dart';
import 'package:sample1_youtube/Provider/theme_provider.dart';

class ThemeChanger extends StatelessWidget {
  const ThemeChanger({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    var switchIcon = themeProvider.isDarkMode()
        ? const Icon(CupertinoIcons.moon_fill)
        : const Icon(CupertinoIcons.sun_min_fill);

    return IconButton(
      onPressed: () {
        themeProvider.togglrTheme();
      },
      icon: switchIcon,
    );
  }
}
