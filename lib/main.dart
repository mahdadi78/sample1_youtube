import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample1_youtube/Ui/home_page.dart';

void main() {
  //todo Always portrate Orientation
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 10, 28, 70)),
        useMaterial3: false,
      ),
      home: const Directionality(
          textDirection: TextDirection.ltr, child: MyHomePage()),
    );
  }
}
