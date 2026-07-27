import 'package:rick_and_morty/core/services/api_service.dart';
import 'package:rick_and_morty/features/home/data/model/rick_and_morty/result.dart';

abstract class HomeRemoteDataSource {
  Future<List<Result>> getCharacters();
  Future<List<Result>> getFilterCharacters({String? status, String? gender});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<Result>> getCharacters() async {
    final response = await apiService.get(
      endPoint: 'character',
    );
    final data = response['results'] as List;
    return data.map((e) => Result.fromJson(e)).toList();
  }

  @override
  Future<List<Result>> getFilterCharacters({
    String? status,
    String? gender,
  }) async {
    String endPoint = 'character';
    final List<String> queryParams = [];
    if (status != null && status.isNotEmpty) {
      queryParams.add('status=$status');
    }
    if (gender != null && gender.isNotEmpty) {
      queryParams.add('gender=$gender');
    }
    if (queryParams.isNotEmpty) {
      endPoint += '?${queryParams.join('&')}';
    }

    final response = await apiService.get(
      endPoint: endPoint,
    );
    final data = response['results'] as List;
    return data.map((e) => Result.fromJson(e)).toList();
  }
}
