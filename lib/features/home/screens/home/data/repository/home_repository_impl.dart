import 'package:dio/dio.dart';
import 'package:reddit_challenge/core/resources/data_state.dart';
import 'package:reddit_challenge/features/home/screens/home/data/data_source/dummy_data.dart';
import 'package:reddit_challenge/features/home/screens/home/data/model/home_model.dart';
import 'package:reddit_challenge/features/home/screens/home/demain/model/home_entity.dart';
import 'package:reddit_challenge/features/home/screens/home/demain/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  @override
  Future<DataState<HomeEntity>> getHome(int page) async {
    try {
      // Simulate a delay of 2 seconds
      await Future.delayed(const Duration(seconds: 2));

      // Use dummy data from the imported file
      final HomeModel homeModel = dummyHomeModel;

      // Return a SuccessState with the HomeModel
      return DataSuccess(homeModel);
    } catch (e) {
      // Return an ErrorState if an exception occurs
      return DataFailed(DioException(
          requestOptions: RequestOptions(),
          message: "Failed to fetch home data"));
    }
  }
}
