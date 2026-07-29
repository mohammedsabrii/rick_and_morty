class CharacterEntity {
  final int? id;
  final String characterName;
  final String characterState;
  final String characterStatic;
  final String characterImage;
  final String characterGender;
  final String characterOrigin;
  final String characterLocation;
  final String? species;
  final int? episodesCount;

  CharacterEntity({
    this.id,
    required this.characterName,
    required this.characterStatic,
    required this.characterImage,
    required this.characterGender,
    required this.characterOrigin,
    required this.characterLocation,
    required this.characterState,
    this.species,
    this.episodesCount,
  });
}

