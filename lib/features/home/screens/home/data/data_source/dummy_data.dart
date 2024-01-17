// dummy_data.dart

import 'package:reddit_challenge/features/home/screens/home/data/model/home_model.dart';
import 'package:reddit_challenge/features/home/screens/home/data/model/post_model.dart';
import 'package:reddit_challenge/features/home/screens/home/data/model/user_model.dart';

final List<PostModel> dummyPosts = [
  const PostModel(
      title: "Post 1",
      imageUrl: "assets/images/post_1_image.jpeg",
      likes: 20000,
      comments: 10,
      shares: 5,
      date: "2024-01-01",
      isLiked: true,
      user: UserModel(
        name: "User 1",
        imageUrl: "https://example.com/user1.jpg",
        isUser: true,
      ),
      body: "Hello from body of first"),
  const PostModel(
    title: "Hala madrid",
    imageUrl: "assets/images/post_2_image.jpg",
    likes: 1500,
    comments: 8,
    shares: 3,
    date: "2024-01-02",
    isLiked: true,
    user: UserModel(
      name: "User 2",
      imageUrl: "https://example.com/user2.jpg",
      isUser: true,
    ),
  ),
  const PostModel(
    title: "Elon mask become one of the ",
    imageUrl: "assets/images/post_3_image.jpeg",
    likes: 25002,
    comments: 12,
    shares: 7,
    date: "2024-01-03",
    isLiked: null,
    user: UserModel(
      name: "User 3",
      imageUrl: "https://example.com/user3.jpg",
      isUser: true,
    ),
  ),
  const PostModel(
    title: "Post 4",
    imageUrl: "https://example.com/image4.jpg",
    likes: 1800,
    comments: 15,
    shares: 6,
    date: "2024-01-04",
    isLiked: null,
    user: UserModel(
      name: "User 4",
      imageUrl: "https://example.com/user4.jpg",
      isUser: true,
    ),
  ),
  const PostModel(
    title: "Post 5",
    imageUrl: "https://example.com/image5.jpg",
    likes: 30,
    comments: 20,
    shares: 8,
    date: "2024-01-05",
    isLiked: true,
    user: UserModel(
      name: "User 5",
      imageUrl: "https://example.com/user5.jpg",
      isUser: true,
    ),
  ),
  const PostModel(
    title: "Post 6",
    imageUrl: "https://example.com/image6.jpg",
    likes: 22,
    comments: 18,
    shares: 9,
    date: "2024-01-06",
    isLiked: null,
    user: UserModel(
      name: "User 6",
      imageUrl: "https://example.com/user6.jpg",
      isUser: true,
    ),
  ),
  const PostModel(
    title: "Post 7",
    imageUrl: "https://example.com/image7.jpg",
    likes: 17,
    comments: 14,
    shares: 4,
    date: "2024-01-07",
    isLiked: null,
    user: UserModel(
      name: "User 7",
      imageUrl: "https://example.com/user7.jpg",
      isUser: true,
    ),
  ),
  const PostModel(
    title: "Post 8",
    imageUrl: "https://example.com/image8.jpg",
    likes: 28,
    comments: 16,
    shares: 5,
    date: "2024-01-08",
    isLiked: null,
    user: UserModel(
      name: "User 8",
      imageUrl: "https://example.com/user8.jpg",
      isUser: true,
    ),
  ),
  const PostModel(
    title: "Post 9",
    imageUrl: "https://example.com/image9.jpg",
    likes: 25,
    comments: 22,
    shares: 11,
    date: "2024-01-09",
    isLiked: false,
    user: UserModel(
      name: "User 9",
      imageUrl: "https://example.com/user9.jpg",
      isUser: true,
    ),
  ),
  const PostModel(
    title: "Post 10",
    imageUrl: "https://example.com/image10.jpg",
    likes: 21,
    comments: 19,
    shares: 7,
    date: "2024-01-10",
    isLiked: null,
    user: UserModel(
      name: "User 10",
      imageUrl: "https://example.com/user10.jpg",
      isUser: true,
    ),
  ),
];

final HomeModel dummyHomeModel = HomeModel(posts: dummyPosts);
