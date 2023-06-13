import 'package:flutter/material.dart';
import 'package:sparks/Screens/on_boardingScreen.dart';
import 'package:sparks/Screens/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var prefs = await SharedPreferences.getInstance();
  var boolKey = 'Opened';
  var Opened = prefs.getBool(boolKey) ?? false;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Opened?HomeScreen():OnBoardScreen(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  // var prefs = await SharedPreferences.getInstance();
  // var boolKey = 'isFirstTime';
  // var isFirstTime = prefs.getBool(boolKey) ?? true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: OnBoardScreen(),
    );
  }
}
