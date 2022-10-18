import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/app-screens/home/widgets/story-section/user_times_button.dart';

class StoryAvatar extends StatelessWidget {
  const StoryAvatar({
    Key? key,
    this.isUserStory = false,
  }) : super(key: key);

  final bool isUserStory;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 62,
            height: 62,
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: isUserStory
                  ? null
                  : LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.purple,
                        Colors.pink,
                        Colors.orange,
                      ],
                    ),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  padding: const EdgeInsets.all(2.5),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: const ClipOval(
                    child: Image(
                      image: NetworkImage("https://i.pravatar.cc/300"),
                    ),
                  ),
                ),
                if (isUserStory) StoryUserTimesButton()
              ],
            ),
          ),
          SizedBox(height: 5),
          Text(
            isUserStory ? "Hikayen" : "gullu04",
            style: TextStyle(
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
