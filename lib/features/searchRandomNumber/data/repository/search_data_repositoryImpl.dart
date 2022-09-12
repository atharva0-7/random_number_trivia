import '../../domain/repository/search_data_repository.dart';
import '../datasource/remote/search_data.dart';

class SearchDataRepositoryIMPL extends SearchDataRepository{
  GetSearchDataSource getSearchDataSource;
  SearchDataRepositoryIMPL({required this.getSearchDataSource});
  @override
  Future<String> getSearchNumberData(int number) {
   return getSearchDataSource.getSearchDataSource(number);
  }

}