import 'package:flutter/material.dart';


class RoundOption extends StatelessWidget {
  final String title;
  const RoundOption({ Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 38,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), // Round the corners
          border: Border.all(
            color: Colors.black54,  // Border color
            width: 1,            // Border width
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: Colors.black54),
          ),
        ),
      )

    );
  }
}
