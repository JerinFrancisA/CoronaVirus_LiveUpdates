import 'dart:async';

import 'package:corona_virus/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Twitter extends StatefulWidget {
  static const routeName = 'joiofshf';

  @override
  _TwitterState createState() => _TwitterState();
}

class _TwitterState extends State<Twitter> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
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
            'Twitter News',
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
        body: WebView(
          initialUrl:
              'https://twitter.com/search?q=%23Coronaindia&src=trend_click',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ),
      ),
    );
  }
}
