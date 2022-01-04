import 'package:chalenge_dedy_priyatna_181011450420/component/coursePrice.dart';
import 'package:chalenge_dedy_priyatna_181011450420/component/levelIndicator.dart';
import 'package:chalenge_dedy_priyatna_181011450420/models/users.dart';
import 'package:flutter/material.dart';

class TopContextText extends StatelessWidget {
  final Users? user;
  const TopContextText({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 120.0),
        Icon(
          Icons.directions_car,
          color: Colors.white,
          size: 40.0,
        ),
        Container(
          width: 90.0,
          child: Divider(color: Colors.green),
        ),
        SizedBox(height: 10.0),
        Text(
          user!.login,
          style: TextStyle(color: Colors.white, fontSize: 45.0),
        ),
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(flex: 1, child: LevelIndicator()),
            Expanded(
                flex: 6,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      user!.htmlUrl,
                      style: TextStyle(color: Colors.white),
                    ))),
            Expanded(
                flex: 1,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(user!.avatarUrl),
                  radius: 20.0,
                ))
          ],
        ),
      ],
    );
  }
}
