import 'package:flutter/material.dart';
import 'package:profile_static/screens/detail_profile.dart';
import '../models/profile.dart';

class ListProfile extends StatefulWidget {
  ListProfile({super.key});

  @override
  State<ListProfile> createState() => _ListProfileState();
}

class _ListProfileState extends State<ListProfile> {
  final Profile myProfile = Profile(
    name: 'Luh Gede Putri',
    quote:
        '“Jangan jadi orang lucu karena ujung-ujungnya cuma enak dijadiin temen.”',
    phone: '+6281337136811',
    profilePhoto: 'https://i.pravatar.cc/150?img=25',
    coverPhoto: 'https://picsum.photos/600/200?xrandom=25',
  );

  final List<Profile> listProfile = [
    Profile(
      name: 'Putri Anjani',
      quote:
          '“Kalau kamu merasa hidup ini tidak adil, coba deh jadi tanaman. Setiap hari disiram, dipupuk, tapi tetep aja gak bisa jalan-jalan."',
      phone: '+6281234567890',
      profilePhoto: 'https://i.pravatar.cc/150?img=11',
      coverPhoto: 'https://picsum.photos/600/200?random=11',
    ),
    Profile(
      name: 'Dewi Saraswati',
      quote:
          '“Biarpun katanya nggak higienis, tapi makan di pinggir jalan masih jauh lebih sehat daripada makan di tengah jalan.”',
      phone: '+6282234567891',
      profilePhoto: 'https://i.pravatar.cc/150?img=12',
      coverPhoto: 'https://picsum.photos/600/200?random=12',
    ),
    Profile(
      name: 'Ayu Kartika',
      quote:
          '“Sebenarnya pelajaran matematika di Amerika lebih susah karena dicampur bahasa Inggris.”',
      phone: '+6283234567892',
      profilePhoto: 'https://i.pravatar.cc/150?img=13',
      coverPhoto: 'https://picsum.photos/600/200?random=13',
    ),
    Profile(
      name: 'Mega Wulandari',
      quote: '“Hidup itu harus seperti kopi, kuat, hangat, dan bikin melek.”',
      phone: '+6284234567893',
      profilePhoto: 'https://i.pravatar.cc/150?img=14',
      coverPhoto: 'https://picsum.photos/600/200?random=14',
    ),
    Profile(
      name: 'Sinta Rahayu',
      quote: '"Cintaku padamu seperti WiFi publik—lemah tapi nyambung."',
      phone: '+6285234567894',
      profilePhoto: 'https://i.pravatar.cc/150?img=15',
      coverPhoto: 'https://picsum.photos/600/200?random=15',
    ),
  ];

  final List<String> quotes = [
    "“Kamu tuh kayak password, susah ditebak tapi gampang dilupakan.”",
    "“Ngopi dulu biar hidup nggak se-pahit kenyataan.",
    "“Sarapan dulu, biar kuat ngehadapin kenyataan.”",
    "“Laptop boleh panas, asal hubungan kita tetap adem.”",
    "“Nggak apa-apa nyasar dulu, yang penting jangan berhenti jalan.”"
  ];

  void deleteItem(int indexItem) {
    listProfile.removeAt(indexItem);
    setState(() {});
  }

  void addItem() {
    int lastIndex = listProfile.length;
    int phoneSuffix = 1000 + lastIndex;
    listProfile.add(Profile(
        name: 'Putri' + '${lastIndex + 1}',
        quote: quotes[DateTime.now().day % quotes.length],
        phone: '+62812$phoneSuffix',
        profilePhoto: "https://i.pravatar.cc/150?img=" + "${lastIndex + 1}",
        coverPhoto:
            'https://picsum.photos/600/200?random=' + '${lastIndex + 1}'));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Friends"),
      ),
      body: ListView.builder(
        itemCount: listProfile.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(listProfile[index].profilePhoto),
            ),
            title: Text(listProfile[index].name),
            trailing: IconButton(
                onPressed: () => deleteItem(index),
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
            onTap: () async {
              final updatedProfile = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailProfile(profile: listProfile[index]),
                ),
              );
              if (updatedProfile != null) {
                setState(() {
                  listProfile[index] = updatedProfile;
                });
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addItem(),
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Friends"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "My Profile"),
        ],
        onTap: (index) async {
          if (index == 0) {
            // tetap di halaman sekarang
            return;
          } else if (index == 1) {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailProfile(profile: myProfile),
              ),
            );
            if (result == true) {
              setState(() {}); // Refresh jika profil telah diubah
            }
          }
        },
      ),
    );
  }
}
