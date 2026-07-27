import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';
import 'package:rick_and_morty/core/utils/app_text_styles.dart';
import 'package:rick_and_morty/features/home/domain/entity/character_entity.dart';

class HomeCharacterCardContent extends StatelessWidget {
  const HomeCharacterCardContent({super.key, required this.character});
  final CharacterEntity character;
  Color get _statusColor {
    switch (character.characterState.toLowerCase()) {
      case 'alive':
        return AppColors.kLightGreen;
      case 'dead':
        return AppColors.kDarkCrimsonRed;
      default:
        return AppColors.kMainColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 197.w,
          child: Text(
            character.characterName,
            style: AppTextStyles.stylePlusJakartaSansRegular15(),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Row(
          children: [
            Container(
              width: 8.w,
              height: 8.h,
              decoration: ShapeDecoration(
                color: _statusColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9999),
                ),
              ),
            ),
            const SizedBox(width: 4),
            Text(
              '${character.characterState} - ${character.characterStatic}',
              style: AppTextStyles.stylePlusJakartaSansMedium12().copyWith(
                color: AppColors.kDarkGrayPurple,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        SizedBox(
          width: 197.w,
          child: Text(
            'LAST LOCATION',
            style: AppTextStyles.stylePlusJakartaSansBold10().copyWith(
              color: AppColors.kDarkGrayPurple,
            ),
          ),
        ),
        SizedBox(
          width: 197.w,
          child: Text(
            character.characterLocation,
            style: AppTextStyles.stylePlusJakartaSansRegular14().copyWith(
              color: AppColors.kDarkGrayPurple,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
