import 'package:flutter/material.dart';
import 'package:corona_virus/screens/home_page.dart';

main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Corona Virus Updates',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.black,
          actionsIconTheme: IconThemeData(
            color: Colors.white,
            opacity: 0.8,
            size: 32.0,
          ),
          elevation: 3.0,
        ),
        scaffoldBackgroundColor: COlors. 
      ),
      home: HomePage(),
    );
  }
}
