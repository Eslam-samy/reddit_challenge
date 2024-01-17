import 'package:get_it/get_it.dart';
import 'package:reddit_challenge/features/home/screens/home/data/repository/home_repository_impl.dart';
import 'package:reddit_challenge/features/home/screens/home/demain/repository/home_repository.dart';
import 'package:reddit_challenge/features/home/screens/home/demain/use_cases/get_home_usecase.dart';
import 'package:reddit_challenge/features/home/screens/home/presentation/bloc/home_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependancies() async {
  //___ for home feature
  sl.registerSingleton<HomeRepository>(HomeRepositoryImpl());

  //usecase
  sl.registerSingleton<GetHomeUseCase>(GetHomeUseCase(sl()));

  //blocs
  sl.registerFactory<HomeBloc>(() => HomeBloc(sl()));
}
