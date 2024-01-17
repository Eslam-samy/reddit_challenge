import 'package:flutter/material.dart';

class PostImageWidget extends StatelessWidget {
  const PostImageWidget({super.key, this.image});
  final String? image;

  @override
  Widget build(BuildContext context) {
    return image == null
        ? const SizedBox()
        : Container(
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            clipBehavior: Clip.hardEdge,
            child: Image.asset(image!, fit: BoxFit.fill),
          );
  }
}
