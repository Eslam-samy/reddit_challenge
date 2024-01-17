import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:reddit_challenge/core/resources/data_state.dart';
import 'package:reddit_challenge/features/home/screens/home/data/model/post_model.dart';
import 'package:reddit_challenge/features/home/screens/home/demain/model/home_entity.dart';
import 'package:reddit_challenge/features/home/screens/home/demain/model/post_entity.dart';
import 'package:reddit_challenge/features/home/screens/home/demain/use_cases/get_home_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeUseCase _getHomeUseCase;

  bool isLastPage = false;
  final int numberOfPostsPerRequest = 10;
  final int nextPageTrigger = 3;
  List<PostEntity> products = [];
  int currentPage = 1;

  HomeBloc(this._getHomeUseCase) : super(HomeLoading()) {
    on<GetHomeEvent>(onGetHome);
    on<CheckIfNeedMoreDataEvent>(checkIfNeedMoreDataEvent);
  }
  void onGetHome(GetHomeEvent event, Emitter<HomeState> emit) async {
    //check if there changes in search model then clear the list

    if (products.isEmpty) {
      emit(HomeLoading());
    }
    final dataState = await _getHomeUseCase(params: currentPage);

    if (dataState is DataSuccess && dataState.data != null) {
      isLastPage = dataState.data!.posts!.length < numberOfPostsPerRequest;
      _incrementPagenumber();
      products.addAll(dataState.data!.posts!);
      emit(LoadedHomeState(home: dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(ErrorHomeState(dioException: dataState.error!));
    }
  }

  void checkIfNeedMoreDataEvent(
      CheckIfNeedMoreDataEvent event, Emitter<HomeState> emit) {
    if (event.index == products.length - nextPageTrigger) {
      add(const GetHomeEvent());
    }
  }

  void _incrementPagenumber() {
    currentPage++;
  }
}
