import 'package:flutter/material.dart';
import 'package:sample1_youtube/home_page.dart';

void main() {
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
            seedColor: const Color.fromARGB(255, 28, 0, 100)),
        useMaterial3: true,
      ),
      home: const Directionality(
          textDirection: TextDirection.ltr, child: MyHomePage()),
    );
  }
}
