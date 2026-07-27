part of 'get_character_cubit.dart';

@immutable
abstract class GetCharactersState {}

class GetCharactersInitial extends GetCharactersState {}

class GetCharactersLoading extends GetCharactersState {}

class GetCharactersSuccess extends GetCharactersState {
  final List<CharacterEntity> characters;
  GetCharactersSuccess(this.characters);
}

class GetCharactersEmpty extends GetCharactersState {}

class GetCharactersError extends GetCharactersState {
  final String message;
  GetCharactersError(this.message);
}

class NoInterNetConaction extends GetCharactersState {}
