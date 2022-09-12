abstract class RandomNumberEvent{}

class GetRandomNumberEvent extends RandomNumberEvent{}
class GetSearchingRandomEvent extends RandomNumberEvent{
int number;
GetSearchingRandomEvent({required this.number});

}