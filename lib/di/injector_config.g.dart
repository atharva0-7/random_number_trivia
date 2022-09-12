// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector_config.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$InjectorConfig extends InjectorConfig {
  @override
  void _configure() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory((c) => GetRandomNumberUseCase(
          getRandomNumberRepository: c<GetRandomNumberRepository>()))
      ..registerFactory<GetRandomNumberRepository>((c) =>
          GetRandomNumberRepositoryIMPL(getNumbersData: c<GetNumbersData>()))
      ..registerFactory<GetNumbersData>((c) => GetData())
      ..registerFactory((c) =>
          RandomNumberBloc(c<GetRandomNumberUseCase>(), c<SearchDataUseCase>()))
      ..registerFactory((c) =>
          SearchDataUseCase(searchDataRepository: c<SearchDataRepository>()))
      ..registerFactory<SearchDataRepository>((c) => SearchDataRepositoryIMPL(
          getSearchDataSource: c<GetSearchDataSource>()))
      ..registerFactory<GetSearchDataSource>((c) => GetSearchData());
  }
}
