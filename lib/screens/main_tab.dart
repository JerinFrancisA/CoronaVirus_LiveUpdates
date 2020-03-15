import 'package:flutter/material.dart';
import 'package:corona_virus/utilities/constants.dart';
import 'package:corona_virus/screens/home_page.dart';

class MainTab extends StatefulWidget {
  static const routeName = 'oisutodnn';

  @override
  _MainTabState createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
