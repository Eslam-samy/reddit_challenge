part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetHomeEvent extends HomeEvent {
  const GetHomeEvent();
}

class CheckIfNeedMoreDataEvent extends HomeEvent {
  final int index;
  const CheckIfNeedMoreDataEvent({required this.index});

  @override
  List<Object> get props => [index];
}
