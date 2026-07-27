import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:rick_and_morty/core/utils/app_colors.dart';
import 'package:rick_and_morty/features/home/domain/entity/character_entity.dart';
import 'package:rick_and_morty/features/home/presentation/screen/widgets/Home%20Character%20Card/home_character_card_body.dart';

class HomeCharacterCard extends StatelessWidget {
  const HomeCharacterCard({super.key, required this.character});
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: _statusColor, width: 1.w),
          left: BorderSide(color: _statusColor, width: 5.w),
          right: BorderSide(color: _statusColor, width: 1.w),
          top: BorderSide(color: _statusColor, width: 1.w),
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.kShadow,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: HomeCharacterCardBody(character: character),
    );
  }
}
