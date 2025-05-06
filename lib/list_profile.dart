import 'package:flutter/material.dart';

class ListProfile extends StatelessWidget {
  ListProfile({super.key});

  final List<String> listProfile =
      List.generate(100, (index) => 'Profile ke - ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List Profile"),
        ),
        body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: listProfile.length,
          itemBuilder: (context, index) {
            return Text(listProfile[index]);
          },
        )

        // ListView.builder(
        //   //scrollDirection: Axis.horizontal,
        //   itemCount: listProfile.length,
        //   itemBuilder: (context, index) {
        //     return ListTile(
        //       leading: CircleAvatar(),
        //       title: Text(listProfile[index]),
        //     );
        //   },
        // ),
        );
  }
}
