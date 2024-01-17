part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeLoading extends HomeState {}

final class LoadedHomeState extends HomeState {
  final HomeEntity home;

  const LoadedHomeState({required this.home});

  @override
  List<Object> get props => [home];
}

final class ErrorHomeState extends HomeState {
  final DioException dioException;

  const ErrorHomeState({required this.dioException});

  @override
  List<Object> get props => [dioException];
}
