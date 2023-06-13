import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class sharedprf extends StatelessWidget {
  final SharedPreferences?prefs;
  final String ?boolKey;
  const sharedprf({this.prefs, this.boolKey});

  @override
  Widget build(BuildContext context) {
    prefs?.setBool(boolKey!, false);
    return const Placeholder() ;
  }
}
