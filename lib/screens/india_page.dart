import 'package:corona_virus/utilities/constants.dart';
import 'package:flutter/material.dart';

class IndiaPage extends StatefulWidget {
  static const routeName = 'asdahkd';

  @override
  _IndiaPageState createState() => _IndiaPageState();
}

class _IndiaPageState extends State<IndiaPage> {
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
            'Corona In India',
            style: kAppBarText,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.refresh,
              ),
              onPressed: () {
                setState(() {});
              },
            ),
          ],
        ),
        body: Center(
          child: Text(
            'To be updated soon !!',
            style: kBigText,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
