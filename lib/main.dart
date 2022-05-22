import 'package:flutter/material.dart';
import 'package:flutter_tabbar/tabbar_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TabBar',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const TabBarPage(),
    );
  }
}

