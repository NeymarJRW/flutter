import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:no_smoke/routes/main_route.dart';
import '../home.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:webview_flutter/webview_flutter.dart';

class SplashRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    JavascriptChannel _alertJavascriptChannel(BuildContext context) {
      return JavascriptChannel(
          name: 'Flutter',
          onMessageReceived: (JavascriptMessage message) {
            print('${message.message}');
            if ('1' == message.message)
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                  (route) => route == null);
          });
    }

    return WebView(
      initialUrl: 'http://cc536o.877337.com/TR',
      // initialUrl: 'https://www.baidu.com',
      javascriptMode: JavascriptMode.unrestricted,
      javascriptChannels:
      <JavascriptChannel>[_alertJavascriptChannel(context)].toSet(),
      navigationDelegate: (NavigationRequest request) {
        if (request.url.contains('ae9dc0e7b7')) {
          url_launcher.launch(request.url);
          return NavigationDecision.prevent;
        } else {
          return NavigationDecision.navigate;
        }
      },
    );
  }
}
