import 'package:flutter/material.dart';
import './utils/constants.dart';

import 'screens/home.dart';

void main() => runApp( MyApp() );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: kGoldColor, fontFamily: 'Changa'),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
