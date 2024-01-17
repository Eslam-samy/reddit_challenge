import 'package:reddit_challenge/features/home/screens/home/data/model/user_model.dart';
import 'package:reddit_challenge/features/home/screens/home/demain/model/post_entity.dart';

class PostModel extends PostEntity {
  const PostModel(
      {super.title,
      super.imageUrl,
      super.likes,
      super.comments,
      super.shares,
      super.date,
      super.user,
      super.isLiked,
      super.body});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      title: json["title"],
      imageUrl: json["image_url"],
      likes: json["likes"],
      comments: json["comments"],
      shares: json["shares"],
      date: json["date"],
      isLiked: json["is_liked"],
      body: json["body"],
      user: UserModel.fromJson(json["user"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'image_url': imageUrl,
      'likes': likes,
      'comments': comments,
      'shares': shares,
      'date': date,
      'user': user,
      "is_liked": isLiked
    };
  }
}
