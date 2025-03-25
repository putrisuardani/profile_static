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
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: 
              [
                Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  //image: DecorationImage(image: NetworkImage('https://lh5.googleusercontent.com/proxy/V5fZ-KYp4eDzEOB6IwB_CWs0E4--3FbjgNCYmKHAqOdZWtzmB4-N1ADf7yJLdYlRYaEW-SqzFWltYq3ldtRpBxn4Esg9ZCP7qdmC2pajgV0TP75SzxlenQs_FBg2kxAYVxHzTCgjtLF7Hef_gIRbqalPa_pqeL90SLKzOc0fwbuG54x9yrxv2zKCXep2jePrj1x93XnfgQ')),
                  gradient: LinearGradient(colors: [Colors.pink, Colors.purple], begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                ),
                Positioned(
                  bottom: -80,
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                    ),
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage('assets/image/cat.png'),
                    ),
                  ),
                ),
                Positioned(
                  left: 225,
                  bottom: -80,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                    ),
                    child: Icon(Icons.camera_alt, size: 24,),
                  ),
                )
              ]
            ),
            SizedBox(height: 96,),
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
            SizedBox(
              height: 200,
              child: PageView(
                scrollDirection: Axis.horizontal,
                children: [
                  Card(
                  child: SizedBox(
                    width: double.infinity,
                    //height: 150,
                    child: Column(
                    children: [
                      Text("Biodata Saya", style: TextStyle(fontSize: 24, color: Colors.pink, decoration: TextDecoration.underline),),
                      SizedBox(height: 8,),
                      Text("Nama: $nama", style: TextStyle(fontSize: 24, color: Colors.pink),),
                      Text("NIP: $nip", style: TextStyle(fontSize: 24, color: Colors.pink),),
                      Text("Alamat: $alamat", style: TextStyle(fontSize: 24, color: Colors.pink),),
                    ],
                  ),
                  ) 
                ),
                Card(
                child: SizedBox(
                  width: double.infinity,
                  //height: 150,
                  child: Column(children: [
                  Text("Pendidikan Saya", style: TextStyle(fontSize: 24,color: Colors.pink, decoration: TextDecoration.underline),),
                  SizedBox(height: 8,),
                  Text("SMA: SMA Negeri 1 Tabanan", style: TextStyle(fontSize: 24, color: Colors.pink),),
                  Text("SMP: SMP Negeri 1 Kuta", style: TextStyle(fontSize: 24, color: Colors.pink),),
                  Text("SD: SDK Soverdi Tuban", style: TextStyle(fontSize: 24, color: Colors.pink),),
                ],),
                )
              ),
                ], 
                 
              ),
            ),
          ]
        ),
      ),
    );
  }
}