import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/core/errors/failure.dart';
import 'package:rick_and_morty/features/home/domain/entity/character_entity.dart';
import 'package:rick_and_morty/features/home/domain/repository/home_repository.dart';

class GetCharacterUseCase {
  final HomeRepository homeRepository;

  GetCharacterUseCase({required this.homeRepository});
  Future<Either<Failure, List<CharacterEntity>>> getCharacters() async {
    return await homeRepository.getCharacters();
  }
}
