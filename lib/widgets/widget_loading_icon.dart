
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoadingIcon extends StatelessWidget {

  @override
  Widget build(BuildContext context) => SizedBox.expand(
    child: Column(
      children: <Widget>[
        SizedBox(
          child: CircularProgressIndicator(),
          width: 60,
          height: 60,
        )
      ],
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
    ),
  );

}