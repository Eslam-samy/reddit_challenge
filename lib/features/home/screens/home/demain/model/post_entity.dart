import 'package:reddit_challenge/features/home/screens/home/demain/model/user_entity.dart';

class PostEntity {
  final String? title;
  final String? imageUrl;
  final int? likes;
  final int? comments;
  final int? shares;
  final String? date;
  final UserEntity? user;
  final bool? isLiked;
  final String? body;
  const PostEntity({
    this.title,
    this.imageUrl,
    this.likes,
    this.comments,
    this.shares,
    this.date,
    this.user,
    this.isLiked,
    this.body
  });
}
