abstract class RandomNumberState {}

class InitialRandomNumberState extends RandomNumberState {}

class LoadedRandomNumberState extends RandomNumberState {
  String numberData;

  LoadedRandomNumberState({required this.numberData});
}

class SearchLoadedNumberState extends RandomNumberState {
  String searchedData;
  SearchLoadedNumberState({required this.searchedData});
}
