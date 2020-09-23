import 'package:dio/dio.dart';
import 'package:rest_api/pages/home/repository/home_repository.dart';

class ImplemetesHomeRepository implements HomeRepository {
  @override
  Future<List<dynamic>> getApiRest() async {
    final response =
        await Dio().get('https://igti-film.herokuapp.com/api/accounts');
    return response.data;
  }
}
