import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/Search%20Result/presentation/screen/widgets/search_result_card_content.dart';
import 'package:rick_and_morty/features/home/domain/entity/character_entity.dart';

class SearchResultCardBody extends StatelessWidget {
  const SearchResultCardBody({super.key, required this.character});

  final CharacterEntity character;

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
        SearchResultCardContent(character: character),
        const Spacer(),
        Icon(Icons.more_vert, size: 24.sp, color: Colors.grey),
      ],
    );
  }
}
