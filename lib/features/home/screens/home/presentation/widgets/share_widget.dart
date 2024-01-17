import 'package:flutter/material.dart';
import 'package:reddit_challenge/config/app_theme.dart';

class ShareWidget extends StatelessWidget {
  const ShareWidget({super.key, this.shares});
  final int? shares;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 70,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(width: 1, color: grayColor.withOpacity(.4)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.ios_share_sharp,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(
            width: 8,
          ),
          Text("$shares",
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
