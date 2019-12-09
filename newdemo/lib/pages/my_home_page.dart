import 'package:flutter/widgets.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:jaguar/jaguar.dart';
import 'package:jaguar_flutter_asset/jaguar_flutter_asset.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    _initServer();
  }

  _initServer() async {
    final server = Jaguar(address: "127.0.0.1",port: 8080);
    server.addRoute(serveFlutterAssets());
    await server.serve(logRequests: true);
    server.log.onRecord.listen((r) => debugPrint("==serve-log：$r"));
    setState(() {
        
    });
  }

  @override
  Widget build(BuildContext context) {

    return WebviewScaffold(
      withJavascript: true,
      url: 'http://127.0.0.1:8080/game/index.html',
    );
  }
}
