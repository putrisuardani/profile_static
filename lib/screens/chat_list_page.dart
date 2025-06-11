import 'package:flutter/material.dart';
import 'package:profile_static/models/profile.dart';
import 'package:profile_static/screens/chat_page.dart';
import 'package:profile_static/screens/list_profile.dart';
import 'package:profile_static/screens/detail_profile.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  final List<Profile> chatFriends = [
    Profile(
      name: 'Putri 1',
      description: 'UI/UX Designer',
      imageUrl: 'https://i.pravatar.cc/150?img=1',
    ),
    Profile(
      name: 'Putri 3',
      description: 'Project Manager',
      imageUrl: 'https://i.pravatar.cc/150?img=3',
    ),
    Profile(
      name: 'Putri 5',
      description: 'Backend Developer',
      imageUrl: 'https://i.pravatar.cc/150?img=5',
    ),
  ];

  int _selectedIndex = 1; // Index 1 untuk halaman Chat

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;

    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => ListProfile()),
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => DetailProfile(
            profile: chatFriends[0], // bisa diganti dengan myProfile nanti
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat List'),
      ),
      body: ListView.builder(
        itemCount: chatFriends.length,
        itemBuilder: (context, index) {
          final friend = chatFriends[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(friend.imageUrl),
            ),
            title: Text(friend.name),
            subtitle: Text('Last message preview...'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatPage(friend: friend),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            label: 'Friends',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My Profile',
          ),
        ],
      ),
    );
  }
}
