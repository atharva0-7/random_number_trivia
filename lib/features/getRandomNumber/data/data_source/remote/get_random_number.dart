import 'package:dio/dio.dart';

abstract class GetNumbersData {
  Future<String> getNumberData();
}

class GetData extends GetNumbersData {
  @override
  Future<String> getNumberData() {
    return getData();
  }

  Future<String> getData() async {
    try {
      Response response =
          await Dio().get("http://numbersapi.com/random/trivia");
      print(response.data);
      return response.data;
    } catch (e) {
      print(e);
    }
    return "";
  }
}
