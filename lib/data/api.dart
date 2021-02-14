import 'package:dio/dio.dart';

class TrelloApi {
  Dio _dio;
  Response _response;

  TrelloApi() {
    _dio = Dio();
    _dio.options.baseUrl = "https://trello.backend.tests.nekidaem.ru/api/v1";
  }

  Future<String> login(String username, String password) async {
    FormData formData =
        FormData.fromMap({"username": username, "password": password});
    try {
      _response = await _dio.post(
        "/users/login/",
        data: formData,
      );
      return _response.data["token"];
    } catch (e) {
      throw e.response.data["non_field_errors"][0];
    }
  }

  getCards(String token) async {
    try {
      Options options = Options(headers: {"Authorization": "JWT $token"});
      _response = await _dio.get("/cards/", options: options);
      print(_response);
    } catch (e) {
      print(e.response.data);
    }
  }
}
