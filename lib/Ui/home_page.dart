import 'package:flutter/material.dart';
import 'package:provider_base_tools/provider_base_tools.dart';
import 'package:sample1_youtube/Provider/theme_provider.dart';
import 'package:sample1_youtube/Ui/ui_helper/theme_changer_buttum.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final themeP = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('haddadi'),
        actions: const [ThemeChanger()],
      ),
      body: Center(
        child: Text(
          AppLocalizations.of(context)!.txt,
          style: TextStyle(
              fontSize: 20,
              color: themeP.isDarkMode() ? Colors.white : Colors.black54),
        ),
      ),
    );
  }
}
