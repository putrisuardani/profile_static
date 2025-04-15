import 'package:flutter/material.dart';

class ListProfile extends StatelessWidget {
  const ListProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Profile"),),
      body: ElevatedButton(onPressed: () {
        Navigator.pop(context);
      },child: Text("Kembali ke halaman detail profil")),      
    );
  }
}