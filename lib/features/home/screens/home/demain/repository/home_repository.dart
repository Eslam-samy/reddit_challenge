import 'package:reddit_challenge/core/resources/data_state.dart';
import 'package:reddit_challenge/features/home/screens/home/demain/model/home_entity.dart';

abstract class HomeRepository {
  Future<DataState<HomeEntity>> getHome(
    int page
  );
}
