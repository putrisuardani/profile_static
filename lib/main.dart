import 'package:flutter/material.dart';
import 'package:profile_static/screens/list_profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListProfile(),
    );
  }
}
