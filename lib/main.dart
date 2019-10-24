import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_reader/navigator/tab_navigator.dart';
import 'package:flutter_reader/tools/global_state.dart';
import 'package:provider/provider.dart';

void main() {
  final hasLogin = GlobalModel();

  runApp(
    Provider<bool>.value(
    child: ChangeNotifierProvider.value(value: hasLogin,
    child: MyApp(),),
    )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '爱看',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.redAccent,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.redAccent,
          shape: RoundedRectangleBorder(),
        )
      ),
      home: TabNavigator(),
    );
  }
}

