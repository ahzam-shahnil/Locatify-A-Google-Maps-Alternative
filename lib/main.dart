import 'package:flutter/material.dart';
import 'package:flutter_projects/screens/HomeScreen.dart';
import 'package:flutter_projects/constants.dart';
import 'package:flutter_projects/screens/SearchScreen.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Locatify',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: kHomeRoute,
      routes: {
        kHomeRoute: (context) => HomeScreen(),
        kSearchScreen: (context) => SearchScreen(),
      },
    );
  }
}
