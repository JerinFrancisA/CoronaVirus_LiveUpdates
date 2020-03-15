import 'dart:async';

import 'package:corona_virus/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class News extends StatefulWidget {
  static const routeName = 'joiofadshf';

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
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
            'Corona Virus News',
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
              'https://www.google.com/search?sa=X&rlz=1C1CHBD_enIN813IN813&sxsrf=ALeKk030pF5KNZ6O_jkn9fTnjGpk1ixL0A:1584282918555&q=coronavirus&tbm=nws&source=univ&tbo=u&ved=2ahUKEwi23dXk2ZzoAhUL7HMBHX0lC-IQt8YBKAF6BAgLEC4',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ),
      ),
    );
  }
}
