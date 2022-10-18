import 'package:flutter/material.dart';

class StoryUserTimesButton extends StatelessWidget {
  const StoryUserTimesButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: -1,
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
        child: Icon(
          Icons.add,
          size: 11,
        ),
      ),
    );
  }
}
