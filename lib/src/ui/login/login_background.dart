import 'package:flutter/material.dart';

class LogInBackground extends StatelessWidget {
  const LogInBackground({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      decoration: new BoxDecoration(
        //color: const Color(0xff7c94b6),
        image: new DecorationImage(
          fit: BoxFit.contain,
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.2), BlendMode.dst),
          image: NetworkImage(
            'https://static.rfstat.com/renderforest/images/v2/logo-homepage/flat_3.png',
          ),
        ),
      ),
    );
  }
}
