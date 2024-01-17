import 'package:reddit_challenge/features/home/screens/home/demain/model/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    super.name,
    super.imageUrl,
    super.isUser,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"],
      imageUrl: json["image_url"],
      isUser: json["is_user"],
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'image_url': imageUrl, 'is_user': isUser};
  }
}
