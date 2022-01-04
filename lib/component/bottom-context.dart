import 'package:chalenge_dedy_priyatna_181011450420/models/users.dart';
import 'package:flutter/material.dart';

class BottomContext extends StatelessWidget {
  final Users? user;
  const BottomContext({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.people_alt),
            title: Text("Name"),
            subtitle: Text(user!.name),
          ),
          ListTile(
            leading: Icon(Icons.people_alt),
            title: Text("Company"),
            subtitle: Text(user!.company),
          ),
          ListTile(
            leading: Icon(Icons.people_alt),
            title: Text("blog"),
            subtitle: Text(user!.blog),
          ),
          ListTile(
            leading: Icon(Icons.people_alt),
            title: Text("Bio"),
            subtitle: Text(user!.bio),
          ),
          ListTile(
            leading: Icon(Icons.people_alt),
            title: Text("Location"),
            subtitle: Text(user!.location),
          ),
        ],
      ),
    );
  }
}
