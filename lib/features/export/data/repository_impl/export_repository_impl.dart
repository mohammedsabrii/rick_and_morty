import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/core/errors/failure.dart';
import 'package:rick_and_morty/features/export/data/data_source/excel_export_service.dart';
import 'package:rick_and_morty/features/export/domain/repository/export_repository.dart';
import 'package:rick_and_morty/features/home/domain/entity/character_entity.dart';

class ExportRepositoryImpl implements ExportRepository {
  final ExcelExportService excelExportService;

  ExportRepositoryImpl({required this.excelExportService});

  @override
  Future<Either<Failure, File>> exportCharactersToExcel(
    List<CharacterEntity> characters,
  ) async {
    try {
      final file = await excelExportService.exportCharactersToExcel(characters);
      return Right(file);
    } catch (e) {
      return Left(ExcelExportFailure(e.toString()));
    }
  }
}
