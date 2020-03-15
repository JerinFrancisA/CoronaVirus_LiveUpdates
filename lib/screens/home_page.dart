import 'package:corona_virus/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:html/parser.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String cases = '';
  String deaths = '';
  String recovered = '';
  String activeCases = '';
  String closedCases = '';
  String indiaTotal = '';

  Future getData() async {
    var client = Client();
    Response response =
        await client.get('https://www.worldometers.info/coronavirus/');

    // Use html parser and query selector
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

  @override
  void initState() {
    super.initState();
    getData();
  }

  List<bool> isSelected = List.filled(5, false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Corona Virus Live Updates',
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
                  if (cases.length == 0) getData();
                });
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: kAppBarColor,
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
                                style: isSelected[0] ? kSelectedText : kBigText,
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
                            color: kAppBarColor,
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
                                style: isSelected[1] ? kSelectedText : kBigText,
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: kAppBarColor,
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
                              ? kSelectedText.copyWith(fontSize: 72.0)
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: kAppBarColor,
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
                                style: isSelected[3] ? kSelectedText : kBigText,
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
                            color: kAppBarColor,
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
                                style: isSelected[4] ? kSelectedText : kBigText,
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              for (int i = 0; i < isSelected.length; i++) {
                isSelected[i] = !isSelected[i];
              }
              if (cases.length == 0) getData();
            });
          },
          child: Icon(
            Icons.refresh,
          ),
        ),
      ),
    );
  }
}
