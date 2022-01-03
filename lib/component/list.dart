import 'package:flutter/material.dart';

class MyList extends StatelessWidget {
  final String avatar;
  final String login;
  final String type;
  const MyList(
      {Key? key, required this.avatar, required this.login, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(avatar),
                ),
                title: Text(login),
                subtitle: Text(type),
              ),
            )
          ],
        ));
  }
}
