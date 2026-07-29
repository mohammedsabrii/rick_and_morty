import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/export/domain/use_cases/export_characters_to_excel_use_case.dart';
import 'package:rick_and_morty/features/export/presentation/cubit/export_excel_state.dart';
import 'package:rick_and_morty/features/home/domain/entity/character_entity.dart';

class ExportExcelCubit extends Cubit<ExportExcelState> {
  final ExportCharactersToExcelUseCase exportCharactersToExcelUseCase;

  ExportExcelCubit(this.exportCharactersToExcelUseCase)
    : super(ExportExcelInitial());

  Future<void> exportCharacters(List<CharacterEntity> characters) async {
    if (characters.isEmpty) {
      emit(ExportExcelFailure('No characters available to export.'));
      return;
    }
    emit(ExportExcelLoading());

    final result = await exportCharactersToExcelUseCase(characters);

    result.fold((failure) {
      emit(ExportExcelFailure(failure.message));
    }, (file) => emit(ExportExcelSuccess(file.path)));
  }
}
