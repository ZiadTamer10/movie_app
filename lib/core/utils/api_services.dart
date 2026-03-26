import 'package:dio/dio.dart';

class ApiServices {
  final _baseUrl = 'https://api.themoviedb.org/3/';
  final _apiKey = 'ccbeda306196327075ba8b8d42ce5ca5';
  final Dio _dio;
  ApiServices(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint?api_key=$_apiKey');
    return response.data;
  }
}
