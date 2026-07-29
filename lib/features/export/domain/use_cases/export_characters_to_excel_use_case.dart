import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/core/errors/failure.dart';
import 'package:rick_and_morty/features/export/domain/repository/export_repository.dart';
import 'package:rick_and_morty/features/home/domain/entity/character_entity.dart';

class ExportCharactersToExcelUseCase {
  final ExportRepository exportRepository;

  ExportCharactersToExcelUseCase({required this.exportRepository});

  Future<Either<Failure, File>> call(
    List<CharacterEntity> characters,
  ) async {
    return await exportRepository.exportCharactersToExcel(characters);
  }
}
