import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';
import 'package:rick_and_morty/features/Search%20Result/presentation/screen/widgets/search_result_card_body.dart';
import 'package:rick_and_morty/features/home/domain/entity/character_entity.dart';

class SearchResultCard extends StatelessWidget {
  const SearchResultCard({super.key, required this.character});

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
      child: SearchResultCardBody(character: character),
    );
  }
}
