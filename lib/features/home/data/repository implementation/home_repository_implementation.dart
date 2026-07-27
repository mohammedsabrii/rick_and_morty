import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rick_and_morty/core/errors/failure.dart';
import 'package:rick_and_morty/features/home/data/data_source/home_remote_data_source.dart';
import 'package:rick_and_morty/features/home/domain/entity/character_entity.dart';
import 'package:rick_and_morty/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImplementation implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImplementation({required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, List<CharacterEntity>>> getCharacters() async {
    try {
      final data = await homeRemoteDataSource.getCharacters();
      return Right(data);
    } catch (e) {
      if (e is DioException) return Left(ServerFailure.fromDiorError(e));
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CharacterEntity>>> getFilterCharacters({
    String? status,
    String? gender,
  }) async {
    try {
      final data = await homeRemoteDataSource.getFilterCharacters(
        status: status,
        gender: gender,
      );
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 404) {
          return const Right([]);
        }
        return Left(ServerFailure.fromDiorError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
