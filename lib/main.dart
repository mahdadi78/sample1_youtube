import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider_base_tools/provider_base_tools.dart';
import 'package:sample1_youtube/Provider/theme_provider.dart';
import 'package:sample1_youtube/Ui/home_page.dart';

void main() {
  //todo Always portrate Orientation
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        Provider(create: (context) => const MyApp()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          home: const Directionality(
              textDirection: TextDirection.ltr, child: MyHomePage()),
        );
      },
    );
  }
}
