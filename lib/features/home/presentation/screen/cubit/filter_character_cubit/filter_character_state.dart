part of 'filter_character_cubit.dart';

@immutable
abstract class FilterCharacterState {}

class FilterCharacterInitial extends FilterCharacterState {}

class FilterCharacterLoading extends FilterCharacterState {}

class FilterCharacterSuccess extends FilterCharacterState {
  final List<CharacterEntity> characters;
  FilterCharacterSuccess(this.characters);
}

class FilterCharacterEmpty extends FilterCharacterState {}

class FilterCharacterError extends FilterCharacterState {
  final String message;
  FilterCharacterError(this.message);
}

class FilterNoInternetConnection extends FilterCharacterState {}
