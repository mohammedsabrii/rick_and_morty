import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/core/errors/failure.dart';
import 'package:rick_and_morty/features/home/domain/entity/character_entity.dart';
import 'package:rick_and_morty/features/home/domain/repository/home_repository.dart';

class FilterCharacterUseCase {
  final HomeRepository homeRepository;

  FilterCharacterUseCase({required this.homeRepository});

  Future<Either<Failure, List<CharacterEntity>>> filterCharacters({
    String? name,
    String? status,
    String? gender,
    String? species,
  }) async {
    return await homeRepository.getFilterCharacters(
      name: name,
      status: status,
      gender: gender,
      species: species,
    );
  }
}
