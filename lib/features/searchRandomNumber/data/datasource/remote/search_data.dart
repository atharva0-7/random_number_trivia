import 'package:dio/dio.dart';

abstract class GetSearchDataSource{
  Future<String> getSearchDataSource(int number);
}

class GetSearchData extends GetSearchDataSource{
  @override
  Future<String> getSearchDataSource(number) {
    return getSearchData(number);
  }

 Future<String> getSearchData(int number)
  async{
     try {
      Response response =
          await Dio().get("http://numbersapi.com/$number");
      print(response.data);
      return response.data;
    } catch (e) {
      print(e);
    }
    return "";
  }
  }

