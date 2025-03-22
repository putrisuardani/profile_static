import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  String nama = "Putri";
  String nip = "199404112022032022";
  String alamat = "Denpasar";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 48,),
            Center(
              child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/image/cat.png'),
                  
              ),
            ),
            SizedBox(height: 48,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.call, size: 48, color: Colors.pink[200],),
                SizedBox(width: 16,),
                Icon(Icons.email, size: 48, color: Colors.pink[200]),
                SizedBox(width: 16,),
                Icon(Icons.share, size: 48, color: Colors.pink[200]),
              ],
            ),
            SizedBox(height: 48,),
            Text("Biodata Saya", style: TextStyle(
            fontSize: 24, 
            color: Colors.pink, decoration: TextDecoration.underline),),
            SizedBox(height: 8,),
            Text("Nama: $nama", style: TextStyle(
            fontSize: 24, 
            color: Colors.pink),),
            Text("NIP: $nip", style: TextStyle(
            fontSize: 24, 
            color: Colors.pink),),
            Text("Alamat: $alamat", style: TextStyle(
            fontSize: 24, 
            color: Colors.pink),),
            SizedBox(height: 48,),
            Text("Pendidikan Saya", style: TextStyle(
            fontSize: 24, 
            color: Colors.pink, decoration: TextDecoration.underline),),
            SizedBox(height: 8,),
            Text("SMA: SMA Negeri 1 Tabanan", style: TextStyle(
            fontSize: 24, 
            color: Colors.pink),),
            Text("SMP: SMP Negeri 1 Kuta", style: TextStyle(
            fontSize: 24, 
            color: Colors.pink),),
            Text("SD: SDK Soverdi Tuban", style: TextStyle(
            fontSize: 24, 
            color: Colors.pink),),
            SizedBox(height: 48,),
          ]
        ),
      ),
    );
  }
}