import 'package:reddit_challenge/core/resources/data_state.dart';
import 'package:reddit_challenge/core/usecases/usecase.dart';
import 'package:reddit_challenge/features/home/screens/home/demain/model/home_entity.dart';
import 'package:reddit_challenge/features/home/screens/home/demain/repository/home_repository.dart';

class GetHomeUseCase implements UseCase<DataState<HomeEntity>, int> {
  final HomeRepository _singleProductRepository;

  GetHomeUseCase(this._singleProductRepository);

  @override
  Future<DataState<HomeEntity>> call({int? params}) async {
    return _singleProductRepository.getHome(params!);
  }
}
