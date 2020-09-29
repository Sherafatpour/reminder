import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder/enums.dart';
import 'package:reminder/homepage.dart';
import 'package:reminder/menu_info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider<MenuInfo>(create: (context) => MenuInfo(MenuType.clock),child: HomePage(),)
    );
  }
}


