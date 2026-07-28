import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';
import 'package:rick_and_morty/core/utils/app_text_styles.dart';
import 'package:rick_and_morty/features/home/domain/entity/character_entity.dart';

class SearchResultCardContent extends StatelessWidget {
  const SearchResultCardContent({super.key, required this.character});

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
          width: 170.w,
          child: Text(
            character.characterName,
            style: AppTextStyles.stylePlusJakartaSansRegular15().copyWith(
              fontWeight: FontWeight.w600,
              color: const Color(0xFF141B2B),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(height: 4.h),
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
            SizedBox(width: 6.w),
            Text(
              '${character.characterState} - ${character.characterGender}',
              style: AppTextStyles.stylePlusJakartaSansMedium12().copyWith(
                color: AppColors.kDarkGrayPurple,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        SizedBox(
          width: 170.w,
          child: Text(
            'LAST LOCATION',
            style: AppTextStyles.stylePlusJakartaSansBold10().copyWith(
              color: AppColors.kDarkGrayPurple,
            ),
          ),
        ),
        SizedBox(height: 2.h),
        SizedBox(
          width: 170.w,
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
