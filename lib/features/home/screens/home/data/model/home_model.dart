import 'package:reddit_challenge/features/home/screens/home/data/model/post_model.dart';
import 'package:reddit_challenge/features/home/screens/home/demain/model/home_entity.dart';

class HomeModel extends HomeEntity {
  const HomeModel({
    super.posts,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      posts: json["posts"] == null
          ? null
          : (json["categories"] as List)
              .map((e) => PostModel.fromJson(e))
              .toList(),
    );
  }
}
