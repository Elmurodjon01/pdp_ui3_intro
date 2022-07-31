import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
static String id = 'homepage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: const Center(
        child: Text('Welcome to Home Page of the Appp', style: TextStyle(fontSize: 30),),
      ),
    );
  }
}
