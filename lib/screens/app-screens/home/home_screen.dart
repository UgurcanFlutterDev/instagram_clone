import 'package:flutter/material.dart';

import 'widgets/story-section/story_avatar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 8 : 0),
            child: StoryAvatar(
              isUserStory: index == 0,
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }
}
