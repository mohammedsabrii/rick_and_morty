import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';
import 'package:rick_and_morty/features/Character%20Details/presentation/screen/widgets/character_details_app_bar.dart';
import 'package:rick_and_morty/features/Character%20Details/presentation/screen/widgets/character_details_screen_body.dart';

class CharacterDetailsScreen extends StatelessWidget {
  const CharacterDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackGroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: const CharacterDetailsAppBar(),
          ),
        ),
      ),
      body: const CharacterDetailsScreenBody(),
    );
  }
}
