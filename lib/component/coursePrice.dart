import 'package:flutter/material.dart';

class CoursePrice extends StatelessWidget {
  const CoursePrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7.0),
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: new Text(
        // "\$20",
        "\$" + "2",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
