import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/core/errors/failure.dart';
import 'package:rick_and_morty/features/home/domain/entity/character_entity.dart';

abstract class ExportRepository {
  Future<Either<Failure, File>> exportCharactersToExcel(
    List<CharacterEntity> characters,
  );
}
