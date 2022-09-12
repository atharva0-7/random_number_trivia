import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_number_trivia/features/getRandomNumber/domain/usecase/get_random_number_usecase.dart';
import 'package:random_number_trivia/features/getRandomNumber/presentation/bloc/random_number_bloc/random_number_event.dart';
import 'package:random_number_trivia/features/getRandomNumber/presentation/bloc/random_number_bloc/random_number_state.dart';
import 'package:random_number_trivia/features/searchRandomNumber/domain/usecase/search_data_usecase.dart';

class RandomNumberBloc extends Bloc<RandomNumberEvent, RandomNumberState> {
  GetRandomNumberUseCase getRandomNumberUseCase;
  SearchDataUseCase searchDataUseCase;
  RandomNumberBloc(this.getRandomNumberUseCase, this.searchDataUseCase)
      : super(InitialRandomNumberState()) {
    on<GetRandomNumberEvent>((event, emit) async {
      String numberData = await getRandomNumberUseCase.getRandomNumberTrivia();
      emit(LoadedRandomNumberState(numberData: numberData));
    });
    on<GetSearchingRandomEvent>((event, emit) async {
      String searchedData =
          await searchDataUseCase.getSearchDataTrivia(event.number);
      emit(SearchLoadedNumberState(searchedData: searchedData));
    });
  }
}
