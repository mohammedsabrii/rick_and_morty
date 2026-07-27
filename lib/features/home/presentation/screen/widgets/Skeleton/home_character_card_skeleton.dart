import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';
import 'package:rick_and_morty/features/home/presentation/screen/widgets/Skeleton/skeleton_widget.dart';

class HomeCharacterCardSkeleton extends StatelessWidget {
  const HomeCharacterCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200, width: 1.w),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.kShadow,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          SkeletonWidget(
            width: 80.w,
            height: 80.h,
            borderRadius: BorderRadius.circular(20.r),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SkeletonWidget(
                width: 140.w,
                height: 14.h,
                borderRadius: BorderRadius.circular(4.r),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  SkeletonWidget(
                    width: 8.w,
                    height: 8.h,
                    borderRadius: BorderRadius.circular(9999),
                  ),
                  SizedBox(width: 4.w),
                  SkeletonWidget(
                    width: 90.w,
                    height: 10.h,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              SkeletonWidget(
                width: 70.w,
                height: 8.h,
                borderRadius: BorderRadius.circular(4.r),
              ),
              SizedBox(height: 4.h),
              SkeletonWidget(
                width: 120.w,
                height: 12.h,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ],
          ),
          const Spacer(),
          SkeletonWidget(
            width: 12.w,
            height: 24.h,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ],
      ),
    );
  }
}
