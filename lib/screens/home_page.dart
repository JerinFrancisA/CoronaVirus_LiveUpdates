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

  @override
  Widget build(BuildContext context) {
    getData();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Corona Virus Live Updates',
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    deaths,
                    style: kBigText,
                  ),
                  Text(
                    recovered,
                    style: kBigText,
                  ),
                ],
              ),
              Center(
                child: Text(
                  cases,
                  style: kBigText,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    activeCases,
                    style: kBigText,
                  ),
                  Text(
                    closedCases,
                    style: kBigText,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
