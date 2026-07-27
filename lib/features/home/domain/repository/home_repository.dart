import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/core/errors/failure.dart';
import 'package:rick_and_morty/features/home/domain/entity/character_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<CharacterEntity>>> getCharacters();
  Future<Either<Failure, List<CharacterEntity>>> getFilterCharacters({
    String? status,
    String? gender,
  });
}
