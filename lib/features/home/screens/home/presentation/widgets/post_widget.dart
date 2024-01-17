import 'package:flutter/material.dart';
import 'package:reddit_challenge/config/app_theme.dart';
import 'package:reddit_challenge/features/home/screens/home/demain/model/post_entity.dart';
import 'package:reddit_challenge/features/home/screens/home/presentation/widgets/comment_widget.dart';
import 'package:reddit_challenge/features/home/screens/home/presentation/widgets/like_widget.dart';
import 'package:reddit_challenge/features/home/screens/home/presentation/widgets/post_header_widget.dart';
import 'package:reddit_challenge/features/home/screens/home/presentation/widgets/post_image_widget.dart';
import 'package:reddit_challenge/features/home/screens/home/presentation/widgets/share_widget.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key, required this.post});

  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostHeaderWidget(
            post: post,
            showShareBottomSheet: () {},
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            post.title!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          _getPostBody(post.body),
          const SizedBox(
            height: 15,
          ),
          PostImageWidget(
            image: post.imageUrl,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  LikeWidget(
                    isLiked: post.isLiked,
                    likes: post.likes,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CommentWidget(comments: post.comments)
                ],
              ),
              ShareWidget(
                shares: post.shares,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _getPostBody(String? body) {
    if (body != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            body,
            style: const TextStyle(
              color: hintColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
