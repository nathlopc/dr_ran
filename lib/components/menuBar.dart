import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuBar extends StatelessWidget implements PreferredSizeWidget {

  final AppBar appBar;

  const MenuBar({Key key, this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Text(
          "dr. ran",
          style: TextStyle(
            fontFamily: 'BradleyHandITC',
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 24
          ),
        )
      ),
      backgroundColor: Color.fromRGBO(51, 51, 51, 1)
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}