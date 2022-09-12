import 'package:random_number_trivia/features/getRandomNumber/domain/repositories/get_random_number_repository.dart';

import '../data_source/remote/get_random_number.dart';

class GetRandomNumberRepositoryIMPL extends GetRandomNumberRepository {
  GetNumbersData getNumbersData;
  GetRandomNumberRepositoryIMPL({required this.getNumbersData});
  @override
  Future<String> getRandomNumberTriviaRepository() {
    return getNumbersData.getNumberData();
  }
}
