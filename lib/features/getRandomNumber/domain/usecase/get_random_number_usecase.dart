import 'package:random_number_trivia/features/getRandomNumber/domain/repositories/get_random_number_repository.dart';

class GetRandomNumberUseCase {
  GetRandomNumberRepository getRandomNumberRepository;
  GetRandomNumberUseCase({required this.getRandomNumberRepository});

  Future<String> getRandomNumberTrivia() {
    return getRandomNumberRepository.getRandomNumberTriviaRepository();
  }
}
