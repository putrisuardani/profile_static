import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/detail_profile.dart';
import '../models/profile.dart';

class ListProfile extends StatelessWidget {
  ListProfile({super.key});

  final List<Profile> listProfile = [
    Profile(
      name: 'Putri 1',
      description: "UI/UX Designer",
      imageUrl: "https://i.pravatar.cc/150?img=1",
    ),
    Profile(
      name: 'Putri 2',
      description: "UI/UX Designer",
      imageUrl: "https://i.pravatar.cc/150?img=2",
    ),
    Profile(
      name: 'Putri 3',
      description: "UI/UX Designer",
      imageUrl: "https://i.pravatar.cc/150?img=3",
    ),
    Profile(
      name: 'Putri 4',
      description: "UI/UX Designer",
      imageUrl: "https://i.pravatar.cc/150?img=4",
    ),
    Profile(
      name: 'Putri 5',
      description: "UI/UX Designer",
      imageUrl: "https://i.pravatar.cc/150?img=5",
    ),
    Profile(
      name: 'Putri 6',
      description: "UI/UX Designer",
      imageUrl: "https://i.pravatar.cc/150?img=6",
    ),
    Profile(
      name: 'Putri 7',
      description: "UI/UX Designer",
      imageUrl: "https://i.pravatar.cc/150?img=7",
    ),
    Profile(
      name: 'Putri 8',
      description: "UI/UX Designer",
      imageUrl: "https://i.pravatar.cc/150?img=8",
    ),
    Profile(
      name: 'Putri 9',
      description: "UI/UX Designer",
      imageUrl: "https://i.pravatar.cc/150?img=9",
    ),
    Profile(
      name: 'Putri 10',
      description: "UI/UX Designer",
      imageUrl: "https://i.pravatar.cc/150?img=10",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Profile"),
      ),
      body:

          // GridView.builder(
          //   gridDelegate:
          //       SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          //   itemCount: listProfile.length,
          //   itemBuilder: (context, index) {
          //     return Text(listProfile[index]);
          //   },
          // )

          ListView.builder(
        //scrollDirection: Axis.horizontal,
        itemCount: listProfile.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(listProfile[index].imageUrl),
            ),
            title: Text(listProfile[index].name),
            onTap: () {
              debugPrint('listProfile[index]');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailProfile(profile: listProfile[index]),
                  ));
            },
          );
        },
      ),
    );
  }
}
