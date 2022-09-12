

import 'package:kiwi/kiwi.dart';
import 'package:random_number_trivia/features/getRandomNumber/domain/usecase/get_random_number_usecase.dart';
import 'package:random_number_trivia/features/searchRandomNumber/data/datasource/remote/search_data.dart';
import 'package:random_number_trivia/features/searchRandomNumber/data/repository/search_data_repositoryImpl.dart';
import 'package:random_number_trivia/features/searchRandomNumber/domain/repository/search_data_repository.dart';
import 'package:random_number_trivia/features/searchRandomNumber/domain/usecase/search_data_usecase.dart';

import '../features/getRandomNumber/data/data_source/remote/get_random_number.dart';
import '../features/getRandomNumber/data/repositories/get_random_number_repositoryIMPL.dart';
import '../features/getRandomNumber/domain/repositories/get_random_number_repository.dart';
import '../features/getRandomNumber/presentation/bloc/random_number_bloc/random_number_bloc.dart';

part 'injector_config.g.dart';

abstract class InjectorConfig {
  static KiwiContainer? container;

  static setup() {
    container = KiwiContainer();
    var injector = _$InjectorConfig();
    injector._configure();
  }

  static final resolve = container!.resolve;

  @Register.factory(GetRandomNumberUseCase)
  @Register.factory(GetRandomNumberRepository,
      from: GetRandomNumberRepositoryIMPL)
  @Register.factory(GetNumbersData, from: GetData)
  @Register.factory(RandomNumberBloc)
  @Register.factory(SearchDataUseCase)
  @Register.factory(SearchDataRepository,from: SearchDataRepositoryIMPL)
  @Register.factory(GetSearchDataSource,from: GetSearchData)


  void _configure();
}
