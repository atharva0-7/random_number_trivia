import '../repository/search_data_repository.dart';

class SearchDataUseCase{
  SearchDataRepository searchDataRepository;
  SearchDataUseCase({required this.searchDataRepository});
  Future<String> getSearchDataTrivia(int number) {
    return searchDataRepository.getSearchNumberData(number);
  }
}