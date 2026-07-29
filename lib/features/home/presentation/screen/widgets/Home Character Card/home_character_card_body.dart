import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/home/domain/entity/character_entity.dart';
import 'package:rick_and_morty/features/home/presentation/screen/widgets/Home%20Character%20Card/home_character_card_content.dart';

class HomeCharacterCardBody extends StatelessWidget {
  final CharacterEntity character;
  const HomeCharacterCardBody({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 80.h,
          width: 80.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            image: DecorationImage(
              image: NetworkImage(character.characterImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 12.w),
        HomeCharacterCardContent(character: character),
      ],
    );
  }
}
