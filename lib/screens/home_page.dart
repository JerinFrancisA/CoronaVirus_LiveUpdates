import 'package:corona_virus/screens/india_page.dart';
import 'package:corona_virus/screens/main_tab.dart';
import 'package:corona_virus/screens/news.dart';
import 'package:corona_virus/screens/twitter.dart';
import 'package:corona_virus/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:html/parser.dart';
import 'package:marquee/marquee.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'asdkajsbfkjsab';
  @override
  _HomePageState createState() => _HomePageState();
}

String cases = '-';
String deaths = '-';
String recovered = '-';
String activeCases = '-';
String closedCases = '-';
String indiaTotal = '-';
String newsText = '-';
List<bool> isSelected = List.filled(5, true);

Future getData() async {
  var client = Client();
  Response response =
      await client.get('https://www.worldometers.info/coronavirus/');
  var document = parse(response.body);
  cases = document.getElementsByClassName('maincounter-number')[0].text;
  deaths = document.getElementsByClassName('maincounter-number')[1].text;
  recovered = document.getElementsByClassName('maincounter-number')[2].text;
  activeCases = document.getElementsByClassName('number-table-main')[0].text;
  closedCases = document.getElementsByClassName('number-table-main')[1].text;
  print(cases + " " + deaths + " " + recovered);
  print(document.getElementsByClassName('number-table-main')[0].text);
  print(document.getElementsByClassName('number-table-main')[1].text);
}

Future getData2() async {
  var client = Client();
  Response response = await client.get(
      'https://timesofindia.indiatimes.com/india/coronavirus-live-news-updates-total-coronavirus-cases-in-india-rise-to-83/liveblog/74620072.cms');
  var document = parse(response.body);
  newsText = document.getElementsByClassName('_3MQQ_')[0].text;
  print(newsText);
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getData();
    getData2();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 15.0,
          brightness: Brightness.dark,
          actionsIconTheme: IconThemeData(
            color: Colors.redAccent,
            size: 40.0,
          ),
          title: Text(
            'Corona Live Updates',
            style: kAppBarText,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.refresh,
              ),
              onPressed: () {
                setState(() {
                  for (int i = 0; i < isSelected.length; i++) {
                    isSelected[i] = !isSelected[i];
                  }
                  if (cases.length == 1) getData();
                  if (newsText.length == 1) getData2();
                  // getData();
                });
              },
            ),
          ],
        ),
        body: cases == '-'
            ? Center(
                child: Text(
                  'PRESS REFRESH BUTTON',
                  style: kBigText,
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: kContainerColor,
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Deaths',
                                      style: kText,
                                    ),
                                    AnimatedDefaultTextStyle(
                                      duration: Duration(milliseconds: 200),
                                      style: isSelected[0]
                                          ? kSelectedText
                                          : kBigText,
                                      child: Text(
                                        deaths,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: kContainerColor,
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Recovered',
                                      style: kText,
                                    ),
                                    AnimatedDefaultTextStyle(
                                      duration: Duration(milliseconds: 200),
                                      style: isSelected[1]
                                          ? kSelectedText
                                          : kBigText,
                                      child: Text(
                                        recovered,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: kContainerColor,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Cases',
                                style: kText,
                              ),
                              AnimatedDefaultTextStyle(
                                duration: Duration(milliseconds: 200),
                                style: isSelected[2]
                                    ? kSelectedText.copyWith(fontSize: 52.0)
                                    : kBigText.copyWith(fontSize: 42.0),
                                child: Text(
                                  cases,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: kContainerColor,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  'News',
                                  style: kText,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12.0, right: 12.0),
                                  child: Marquee(
                                    text: newsText == '-'
                                        ? 'Corona gets the better of China. Reports suggest that the condition will only get worse.'
                                        : newsText,
                                    style: kNewsText,
                                    scrollAxis: Axis.horizontal,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    blankSpace: 20.0,
                                    velocity: 140.0,
                                    startPadding: 20.0,
                                    accelerationCurve: Curves.easeIn,
                                    decelerationCurve: Curves.easeInOut,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: kContainerColor,
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Active Cases',
                                      style: kText,
                                    ),
                                    AnimatedDefaultTextStyle(
                                      duration: Duration(milliseconds: 200),
                                      style: isSelected[3]
                                          ? kSelectedText
                                          : kBigText,
                                      child: Text(
                                        activeCases,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: kContainerColor,
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Closed Cases',
                                      style: kText,
                                    ),
                                    AnimatedDefaultTextStyle(
                                      duration: Duration(milliseconds: 200),
                                      style: isSelected[4]
                                          ? kSelectedText
                                          : kBigText,
                                      child: Text(
                                        closedCases,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
        drawer: Drawer(
          child: Container(
            decoration: BoxDecoration(
              color: kContainerColor,
            ),
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  child: Text(
                    'COVID-19',
                    style: kBigText,
                    textAlign: TextAlign.right,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, IndiaPage.routeName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Text(
                      'India Updates',
                      style: kAppBarText,
                    ),
                  ),
                ),
                Divider(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Twitter.routeName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Text(
                      'Twitter News',
                      style: kAppBarText,
                    ),
                  ),
                ),
                Divider(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, News.routeName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Text(
                      'Google News',
                      style: kAppBarText,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
