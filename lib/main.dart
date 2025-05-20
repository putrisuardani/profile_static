import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/list_profile.dart';

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
