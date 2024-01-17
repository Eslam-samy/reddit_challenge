import 'package:flutter/material.dart';
import 'package:reddit_challenge/config/app_theme.dart';

class LikeWidget extends StatefulWidget {
  const LikeWidget({super.key, this.isLiked, this.likes});
  final bool? isLiked;
  final int? likes;

  @override
  State<LikeWidget> createState() => _LikeWidgetState();
}

class _LikeWidgetState extends State<LikeWidget> {
  late bool? liked = widget.isLiked!;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      height: 30,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(width: 1, color: grayColor.withOpacity(.4)),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                if (liked == true) {
                  liked = null;
                } else {
                  liked = true;
                }
              });
            },
            child: Row(
              children: [
                Icon(
                  Icons.arrow_upward,
                  color: getLikeIconColor(liked),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  formatCount(widget.likes!),
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: _getTextColor(liked)),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 2, // You can adjust the width of the line
            height: 18, // You can adjust the height of the line
            color: grayColor
                .withOpacity(.4), // You can adjust the color of the line
          ),
          const SizedBox(
            width: 6,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                if (liked == false) {
                  liked = null;
                } else {
                  liked = false;
                }
              });
            },
            child:
                Icon(Icons.arrow_downward, color: _getDislikeIconColor(liked)),
          )
        ],
      ),
    );
  }

  String formatCount(int count) {
    if (count < 1000) {
      // If count is less than 1000, no need for conversion
      return count.toString();
    } else if (count < 1000000) {
      // If count is between 1000 and 999999, convert to Xk format
      double countInK = count / 1000;
      return "${countInK.toStringAsFixed(countInK.truncateToDouble() == countInK ? 0 : 1)}k";
    } else {
      // If count is greater than or equal to 1000000, convert to Xm format
      double countInM = count / 1000000;
      return "${countInM.toStringAsFixed(countInM.truncateToDouble() == countInM ? 0 : 1)}m";
    }
  }

  Color _getTextColor(bool? liked) {
    if (liked == true) {
      return orangeColor;
    } else if (liked == false) {
      return purpleColor;
    }
    return Colors.white;
  }

  Color _getDislikeIconColor(bool? liked) {
    if (liked == false && liked != null) {
      return purpleColor;
    }
    return Colors.white;
  }

  Color getLikeIconColor(bool? liked) {
    if (liked == true && liked != null) {
      return orangeColor;
    }
    return Colors.white;
  }
}
