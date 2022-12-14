import 'package:flutter/material.dart';
import 'package:pdp_ui3_intro/pages/intro_page.dart';
import 'package:pdp_ui3_intro/pages/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IntroPage(),
      routes: {
        HomePage.id: (context)=> HomePage(),
        IntroPage.id: (context) => IntroPage(),
      },
    );
  }
}
