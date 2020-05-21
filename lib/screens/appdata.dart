import 'package:flutter/material.dart';

import '../singletons/appdata.dart';

class AppDataPage extends StatefulWidget {
  @override
  AppDataPageState createState() {
    return new AppDataPageState();
  }
}

class AppDataPageState extends State<AppDataPage> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    // 拿到缓存中的数据
    textController.text = appData.text;

    return Scaffold(
      appBar: AppBar(
        title: Text('AppData PageOne'),
      ),
      body: Container(
        padding: EdgeInsets.all(12.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            TextField(
              controller: textController,
              decoration: InputDecoration(
                  labelText: 'Text',
                  hintText: 'Insert some text',
                  border: OutlineInputBorder()),
              onChanged: (text) {
                // 修改缓存数据
                appData.text = text;
              },
            ),
            Divider(),
            RaisedButton(
              child: Text('PageTwo'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  @override
  SecondPageState createState() {
    return new SecondPageState();
  }
}

class SecondPageState extends State<SecondPage> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    // 新页面继续拿缓存数据
    textController.text = appData.text;

    return Scaffold(
      appBar: AppBar(
        title: Text('PageTwo'),
      ),
      body: Container(
        padding: EdgeInsets.all(12.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            TextField(
              controller: textController,
              decoration: InputDecoration(
                  labelText: 'Text',
                  hintText: 'Insert some text',
                  border: OutlineInputBorder()),
              onChanged: (text) {
                appData.text = text;
              },
            ),
          ],
        ),
      ),
    );
  }
}
