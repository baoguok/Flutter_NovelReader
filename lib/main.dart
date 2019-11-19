import 'package:app_review/app_review.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_reader/navigator/tab_navigator.dart';
import 'package:flutter_reader/tools/global_state.dart';
import 'package:overlay_support/overlay_support.dart';
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
    return OverlaySupport(
      child: MaterialApp(
        title: '爱看',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.red,
            accentColor: Color(0xffe53935),
            buttonTheme: ButtonThemeData(
              buttonColor: Color(0xffe53935),
              shape: RoundedRectangleBorder(),
            )
        ),
        home: TabNavigator(),
      ),
    );
  }
}

