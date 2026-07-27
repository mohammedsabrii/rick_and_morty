import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:rick_and_morty/features/home/domain/entity/character_entity.dart';
import 'package:rick_and_morty/features/home/domain/use%20cases/get_character_use_case.dart';

part 'get_character_state.dart';

class GetCharactersCubit extends Cubit<GetCharactersState> {
  GetCharactersCubit(this.getCharacterUseCase) : super(GetCharactersInitial());

  final GetCharacterUseCase getCharacterUseCase;

  Future<void> getCharacters() async {
    emit(GetCharactersLoading());

    final result = await getCharacterUseCase.getCharacters();

    result.fold(
      (failure) {
        if (failure is NoInterNetConaction) {
          emit(NoInterNetConaction());
          return;
        }
        emit(GetCharactersError(failure.message));
      },
      (characters) {
        if (characters.isEmpty) {
          emit(GetCharactersEmpty());
        } else {
          emit(GetCharactersSuccess(characters));
        }
      },
    );
  }
}
