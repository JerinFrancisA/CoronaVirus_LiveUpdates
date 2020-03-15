import 'package:corona_virus/screens/india_page.dart';
import 'package:corona_virus/screens/main_tab.dart';
import 'package:corona_virus/screens/news.dart';
import 'package:corona_virus/screens/twitter.dart';
import 'package:corona_virus/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:corona_virus/screens/home_page.dart';

main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Corona Virus Updates',
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          color: kAppBarColor,
          actionsIconTheme: IconThemeData(
            color: Colors.white,
            opacity: 0.8,
            size: 32.0,
          ),
          elevation: 3.0,
        ),
        scaffoldBackgroundColor: kAppBarColor,
      ),
      themeMode: ThemeMode.dark,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        HomePage.routeName: (context) => HomePage(),
        MainTab.routeName: (context) => MainTab(),
        IndiaPage.routeName: (context) => IndiaPage(),
        Twitter.routeName: (context) => Twitter(),
        News.routeName: (context) => News(),
      },
    );
  }
}
