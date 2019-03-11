import 'package:flutter/material.dart';

class TabBody extends StatelessWidget {
  final String title;
  TabBody({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title),
    );
  }
}
