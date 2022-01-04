import 'package:chalenge_dedy_priyatna_181011450420/services/apiUser.dart';
import 'package:chalenge_dedy_priyatna_181011450420/view/details.dart';
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
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
            child: CircleAvatar(
              backgroundImage: NetworkImage(avatar),
              radius: 30.0,
            ),
          ),
          title: Text(
            login,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(type, style: TextStyle(color: Colors.white))),
              )
            ],
          ),
          trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          onTap: () {
            ApiUser.detailUser(login).then((value) => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Details(user: value)))
                });
          },
        ),
      ),
    );
  }
}
