import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditProfile extends StatelessWidget {
  int angka;
  String name;
  EditProfile({super.key, required this.angka, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Profile"),),
      body: Column(
        children: [
          Text(name, style: TextStyle(fontSize: 36),),
          Text('$angka', style: TextStyle(fontSize: 36),),
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
          },child: Text("Kembali ke halaman detail profil")),
        ],
      ),      
    );
  }
}