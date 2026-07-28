import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:rick_and_morty/core/errors/failure.dart';
import 'package:rick_and_morty/features/home/domain/entity/character_entity.dart';
import 'package:rick_and_morty/features/home/domain/use%20cases/filter_character_use_case.dart';
import 'package:rick_and_morty/features/home/domain/use%20cases/reset_filter_use_case.dart';

part 'filter_character_state.dart';

class FilterCharacterCubit extends Cubit<FilterCharacterState> {
  FilterCharacterCubit(
    this.filterCharacterUseCase,
    this.resetFilterUseCase,
  ) : super(FilterCharacterInitial());

  final FilterCharacterUseCase filterCharacterUseCase;
  final ResetFilterUseCase resetFilterUseCase;

  void resetFilter() {
    resetFilterUseCase.resetFilter();
    emit(FilterCharacterInitial());
  }

  Future<void> filterCharacters({
    String? name,
    String? status,
    String? gender,
    String? species,
  }) async {
    emit(FilterCharacterLoading());

    final result = await filterCharacterUseCase.filterCharacters(
      name: name,
      status: status,
      gender: gender,
      species: species,
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
