import 'package:flutter/material.dart';
import 'package:profile_static/models/profile.dart';
import 'package:profile_static/screens/list_profile.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:profile_static/screens/edit_profile.dart';

class DetailProfile extends StatefulWidget {
  final Profile profile;
  const DetailProfile({super.key, required this.profile});

  @override
  State<DetailProfile> createState() => _DetailProfileState();
}

class _DetailProfileState extends State<DetailProfile> {
  String nip = "199404112022032022";

  String alamat = "Denpasar";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Profil"),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    //image: DecorationImage(image: NetworkImage('https://lh5.googleusercontent.com/proxy/V5fZ-KYp4eDzEOB6IwB_CWs0E4--3FbjgNCYmKHAqOdZWtzmB4-N1ADf7yJLdYlRYaEW-SqzFWltYq3ldtRpBxn4Esg9ZCP7qdmC2pajgV0TP75SzxlenQs_FBg2kxAYVxHzTCgjtLF7Hef_gIRbqalPa_pqeL90SLKzOc0fwbuG54x9yrxv2zKCXep2jePrj1x93XnfgQ')),
                    gradient: LinearGradient(
                        colors: [Colors.pink, Colors.purple],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                  ),
                ),
                Positioned(
                  bottom: -80,
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(widget.profile.imageUrl),
                    ),
                  ),
                ),
                Positioned(
                  left: 225,
                  bottom: -80,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Icon(
                      Icons.camera_alt,
                      size: 24,
                    ),
                  ),
                )
              ]),
          SizedBox(
            height: 96,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    final Uri telUri =
                        Uri(scheme: 'tel', path: '+6281337136811');
                    launchUrl(telUri);
                  },
                  icon: Icon(
                    Icons.call,
                    size: 48,
                    color: Colors.pink[200],
                  )),
              SizedBox(
                width: 16,
              ),
              Icon(Icons.email, size: 48, color: Colors.pink[200]),
              SizedBox(
                width: 16,
              ),
              Icon(Icons.share, size: 48, color: Colors.pink[200]),
            ],
          ),
          SizedBox(
            height: 48,
          ),
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
                      Text(
                        "${widget.profile.description}",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.pink,
                            decoration: TextDecoration.underline),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Nama: ${widget.profile.name}",
                        style: TextStyle(fontSize: 24, color: Colors.pink),
                      ),
                      Text(
                        "NIP: $nip",
                        style: TextStyle(fontSize: 24, color: Colors.pink),
                      ),
                      Text(
                        "Alamat: $alamat",
                        style: TextStyle(fontSize: 24, color: Colors.pink),
                      ),
                    ],
                  ),
                )),
                Card(
                    child: SizedBox(
                  width: double.infinity,
                  //height: 150,
                  child: Column(
                    children: [
                      Text(
                        "Pendidikan Saya",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.pink,
                            decoration: TextDecoration.underline),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "SMA: SMA Negeri 1 Tabanan",
                        style: TextStyle(fontSize: 24, color: Colors.pink),
                      ),
                      Text(
                        "SMP: SMP Negeri 1 Kuta",
                        style: TextStyle(fontSize: 24, color: Colors.pink),
                      ),
                      Text(
                        "SD: SDK Soverdi Tuban",
                        style: TextStyle(fontSize: 24, color: Colors.pink),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          Center(
            child: TextButton.icon(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context); // pop DetailProfile

                  // Tunggu sejenak sebelum pop kedua
                  Future.delayed(Duration(milliseconds: 50), () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(
                          context, true); // pop ChatPage, kirim sinyal
                    }
                  });
                } else {
                  // fallback ke ListProfile langsung
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => ListProfile()),
                  );
                }
              },
              icon: Icon(Icons.arrow_back),
              label: Text("Kembali ke Daftar"),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                final newName = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EditProfile(name: widget.profile.name),
                  ),
                );

                if (newName != null) {
                  setState(() {
                    widget.profile.name = newName;
                  });
                }
              },
              child: Text("Berpindah ke Layar Edit Profil"),
            ),
          ),
        ]),
      ),
    );
  }
}
