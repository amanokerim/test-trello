import 'package:dio/dio.dart';
import 'package:testtrello/data/models/trello_card.dart';

class TrelloApi {
  Dio _dio;
  Response _response;

  TrelloApi() {
    _dio = Dio();
    _dio.options.baseUrl = "https://trello.backend.tests.nekidaem.ru/api/v1";
    _dio.options.connectTimeout = 5000;
    _dio.options.receiveTimeout = 5000;
    _dio.options.sendTimeout = 5000;
  }

  Future<String> login(String username, String password) async {
    FormData formData =
        FormData.fromMap({"username": username, "password": password});
    try {
      _response = await _dio.post(
        "/users/login/",
        data: formData,
      );
      print(_response.statusCode);
      return _response.data["token"];
    } on DioError catch (e) {
      // wrong credentials
      if (e.type == DioErrorType.RESPONSE)
        throw e.response.data["non_field_errors"][0];
      throw "Check your connection";
    }
  }

  Future<List<TrelloCard>> getCards(String token) async {
    try {
      Options options = Options(headers: {"Authorization": "JWT $token"});
      _response = await _dio.get("/cards/", options: options);
      return _response.data
          .map<TrelloCard>((json) => TrelloCard.fromJson(json))
          .toList();
    } catch (e) {
      throw "Check your connection";
    }
  }
}
