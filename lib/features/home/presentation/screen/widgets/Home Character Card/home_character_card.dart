import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/core/routes/app_routes.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';
import 'package:rick_and_morty/features/home/presentation/screen/widgets/Home%20Character%20Card/home_character_card_body.dart';

class HomeCharacterCard extends StatelessWidget {
  const HomeCharacterCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(AppRoutes.kCharacterDetailsScreen),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: AppColors.kLightGreen, width: 1.w),
            left: BorderSide(color: AppColors.kLightGreen, width: 5.w),
            right: BorderSide(color: AppColors.kLightGreen, width: 1.w),
            top: BorderSide(color: AppColors.kLightGreen, width: 1.w),
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
        child: const HomeCharacterCardBody(),
      ),
    );
  }
}
