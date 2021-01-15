import 'package:flutter/material.dart';

class TopNavigation extends StatefulWidget implements PreferredSizeWidget {
  const TopNavigation({Key key}) : super(key: key);

  @override
  _TopNavigationState createState() => _TopNavigationState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _TopNavigationState extends State<TopNavigation> {
  bool flagBtn = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                flagBtn = !flagBtn;
              });
            },
            icon: Icon(flagBtn ? Icons.view_list : Icons.location_on,
                color: Colors.black),
          ),
        ],
      ),
    );
  }
}
