import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
String url = 'https://it.wikipedia.org/wiki/Pagina_principale';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Weview',
      theme: ThemeData(
        primarySwatch: Colors.green, 
      ),
      home: MyHomePage(title: 'Webview'),
      routes: {
        "/webview": (_) => WebviewScaffold(
          url: url,
          appBar: AppBar(
            title: Text("Webview"),
          ),
          withJavascript: true,
          withLocalStorage: true,
          withZoom: true,
        )
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  NewWeb createState() => NewWeb();
}

class NewWeb extends State<MyHomePage> {

  final webview = FlutterWebviewPlugin();

  TextEditingController controller = TextEditingController(text: url);

  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Webview"),
      ),

      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: controller,
              ),
            ),
            RaisedButton(
              child: Text("Open Webview"),
              onPressed: () {
                Navigator.of(context).pushNamed("/webview");
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
// TODO: implement initState
    super.initState();
    webview.close();
    controller.addListener(() {
      url = controller.text;
    });
  }

  @override
  void dispose() {
// TODO: implement dispose
    webview.dispose();
    controller.dispose();
    super.dispose();
  }
}
