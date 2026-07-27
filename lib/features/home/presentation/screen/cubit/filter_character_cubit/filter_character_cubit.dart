import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:rick_and_morty/core/errors/failure.dart';
import 'package:rick_and_morty/features/home/domain/entity/character_entity.dart';
import 'package:rick_and_morty/features/home/domain/use%20cases/filter_character_use_case.dart';

part 'filter_character_state.dart';

class FilterCharacterCubit extends Cubit<FilterCharacterState> {
  FilterCharacterCubit(this.filterCharacterUseCase)
      : super(FilterCharacterInitial());

  final FilterCharacterUseCase filterCharacterUseCase;

  Future<void> filterCharacters({String? status, String? gender}) async {
    emit(FilterCharacterLoading());

    final result = await filterCharacterUseCase.filterCharacters(
      status: status,
      gender: gender,
    );

    _handleResult(result);
  }

  void _handleResult(Either<Failure, List<CharacterEntity>> result) {
    result.fold(
      (failure) {
        if (failure is ServerFailure) {
          emit(FilterCharacterError(failure.message));
          return;
        }
        emit(FilterNoInternetConnection());
      },
      (characters) {
        if (characters.isEmpty) {
          emit(FilterCharacterEmpty());
        } else {
          emit(FilterCharacterSuccess(characters));
        }
      },
    );
  }
}
