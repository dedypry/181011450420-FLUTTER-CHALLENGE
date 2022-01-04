import 'package:chalenge_dedy_priyatna_181011450420/component/bottom-context.dart';
import 'package:chalenge_dedy_priyatna_181011450420/component/listRow.dart';
import 'package:chalenge_dedy_priyatna_181011450420/component/top-content.dart';
import 'package:chalenge_dedy_priyatna_181011450420/models/users.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final Users user;
  const Details({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[TopContent(user: user), BottomContext(user: user)],
    ));
  }
}
