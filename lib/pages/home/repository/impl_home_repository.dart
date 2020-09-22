import 'package:dio/dio.dart';
import 'package:rest_api/pages/home/repository/home_repository.dart';

class ImplemetesHomeRepository implements HomeRepository {
  @override
  Future<List<dynamic>> getApiRest() async {
    final response =
        await Dio().get('https://jsonplaceholder.typicode.com/comments');
    return response.data;
  }
}
