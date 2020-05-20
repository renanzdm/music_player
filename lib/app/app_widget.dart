import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Slidy',
      theme: ThemeData(
          backgroundColor: Color(0xFF1c0436),
          textSelectionColor: Colors.white,
          accentColor: Colors.pink,
          disabledColor: Colors.white24),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
