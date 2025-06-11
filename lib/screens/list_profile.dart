import 'package:flutter/material.dart';
import 'package:profile_static/screens/chat_list_page.dart';
import 'package:profile_static/screens/chat_page.dart';
import 'package:profile_static/screens/detail_profile.dart';
import '../models/profile.dart';

class ListProfile extends StatefulWidget {
  ListProfile({super.key});

  @override
  State<ListProfile> createState() => _ListProfileState();
}

class _ListProfileState extends State<ListProfile> {
  final Profile myProfile = Profile(
    name: 'Putri 0',
    description: "UI/UX Designer",
    imageUrl: "https://i.pravatar.cc/150?img=1",
  );

  final List<Profile> listProfile = [
    Profile(
      name: 'Putri 1',
      description: "UI/UX Designer",
      imageUrl: "https://i.pravatar.cc/150?img=1",
    ),
    Profile(
      name: 'Putri 2',
      description: "Team Lead",
      imageUrl: "https://i.pravatar.cc/150?img=2",
    ),
    Profile(
      name: 'Putri 3',
      description: "Project Manager",
      imageUrl: "https://i.pravatar.cc/150?img=3",
    ),
    Profile(
      name: 'Putri 4',
      description: "QA Engineer",
      imageUrl: "https://i.pravatar.cc/150?img=4",
    ),
    Profile(
      name: 'Putri 5',
      description: "Backend",
      imageUrl: "https://i.pravatar.cc/150?img=5",
    ),
  ];

  void deleteItem(int indexItem) {
    listProfile.removeAt(indexItem);
    setState(() {});
  }

  void addItem() {
    int lastIndex = listProfile.length;
    listProfile.add(Profile(
        name: 'Putri' + '${lastIndex + 1}',
        description: "dosen" + '${lastIndex + 1}',
        imageUrl: "https://i.pravatar.cc/150?img=" + "${lastIndex + 1}"));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Contacts"),
      ),
      body: ListView.builder(
        itemCount: listProfile.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(listProfile[index].imageUrl),
            ),
            title: Text(listProfile[index].name),
            trailing: IconButton(
                onPressed: () => deleteItem(index),
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatPage(friend: listProfile[index]),
                ),
              );
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
          BottomNavigationBarItem(
              icon: Icon(Icons.people), label: "List Contacts"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chats"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "My Profile"),
        ],
        onTap: (index) async {
          if (index == 0) {
            // tetap di halaman sekarang
            return;
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ChatListPage()),
            );
          } else if (index == 2) {
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
