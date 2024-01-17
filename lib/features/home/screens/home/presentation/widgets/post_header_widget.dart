import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reddit_challenge/config/app_theme.dart';
import 'package:reddit_challenge/core/constants.dart';
import 'package:reddit_challenge/features/home/screens/home/demain/model/post_entity.dart';

class PostHeaderWidget extends StatelessWidget {
  const PostHeaderWidget(
      {super.key, required this.post, required this.showShareBottomSheet});
  final PostEntity post;
  final Function() showShareBottomSheet;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18), color: Colors.white),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "${post.user!.isUser! ? "u" : "r"} ${post.user!.name!}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              formatDateString(post.date!),
              style: const TextStyle(
                color: grayColor,
                fontSize: 8,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: showShareBottomSheet,
          child: SvgPicture.asset(
            dotsIconSrc,
            width: 15,
            height: 15,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        )
      ],
    );
  }

  String formatDateString(String dateString) {
    // Parse the date string into a DateTime object
    DateTime parsedDate = DateTime.parse(dateString);

    // Calculate the difference in days between the current date and the parsed date
    Duration difference = DateTime.now().difference(parsedDate);
    int daysDifference = difference.inDays;

    // Convert the difference to a human-readable format (e.g., "2d", "1d", etc.)
    if (daysDifference == 0) {
      return "Today";
    } else if (daysDifference == 1) {
      return "1d";
    } else {
      return "$daysDifference d";
    }
  }
}
