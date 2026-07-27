import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/core/errors/failure.dart';
import 'package:rick_and_morty/features/home/domain/entity/character_entity.dart';
import 'package:rick_and_morty/features/home/domain/repository/home_repository.dart';

class FilterCharacterUseCase {
  final HomeRepository homeRepository;

  FilterCharacterUseCase({required this.homeRepository});

  Future<Either<Failure, List<CharacterEntity>>> filterCharacters({
    String? status,
    String? gender,
  }) async {
    return await homeRepository.getFilterCharacters(
      status: status,
      gender: gender,
    );
  }
}
