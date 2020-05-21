import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'inheriteds/inherited_provider.dart';
import 'models/appconfig.dart';
import 'screens/appconfig.dart';
import 'screens/appdata.dart';
import 'screens/callbacks.dart';
import 'screens/databack.dart';
import 'screens/inherited.dart';
import 'screens/inherited_generic.dart';
import 'screens/inheritedstream.dart';
import 'screens/constructor.dart';
import 'screens/bloc_page.dart';
import 'singletons/bloc.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appConfig = AppConfig();

  @override
  Widget build(BuildContext context) {
    bloc.dateTime.value =
        DateFormat("dd/MM/yyyy - HH:mm:ss:S").format(DateTime.now());

    return InheritedProvider<AppConfig>(
      inheritedData: appConfig,
      child: MaterialApp(
          title: 'Data examples',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Home()),
    );
  }
}

class Home extends StatefulWidget {
  @override
  HomeState createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildButton(String title, Widget page) {
      return Container(
        height: 36.0,
        margin: EdgeInsets.only(
          bottom: 4.0,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: RaisedButton(
                child: Text(title),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => page),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Data examples'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.blueGrey[50],
        child: Column(
          children: <Widget>[
            // 通过构造方法将数据传入下一个页面
            _buildButton('Simple sending data', ConstructorPage()),
            // push.then(value)  value可以拿到上一个页面pop的数据
            _buildButton('Send and receive', DataBackPage()),
            // InheritedWidget
            _buildButton('InheritedWidget', InheritedPage()),
            // 封装了一个通用的(泛型的)的 InheritedWidget
            _buildButton('InheritedWidget generic', InheritedGenericPage()),

            // InheritedWidget + Stream
            _buildButton('InheritedWidget and streams', InheritedStreamPage()),

            // MyApp已经用InheritedProvider包围了MaterialApp, 然后在其子页面里面使用AppConfig
            _buildButton('Inherited AppConfig', AppConfigPage()),
            // 将一些数据存在一个缓存(AppData类)中
            _buildButton('Singleton', AppDataPage()),


            _buildButton('Singleton BLoC', SingletonBlocPage()),
            _buildButton('Callbacks', CallbacksPage()),                        
          ],
        ),
      ),
    );
  }
}
