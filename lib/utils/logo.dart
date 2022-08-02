
import 'package:flutter/material.dart';
import 'package:quiz_app/style/theme.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key
}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
          Text(
            'Q',
            style: TextStyle(
              color: primaryColor,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
        Text(
          'uiz',
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'App',
          style: TextStyle(
            color: secondaryColor,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }




}