import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/home/presentation/screen/widgets/Skeleton/home_character_card_skeleton.dart';

class HomeCharacterSkeletonList extends StatelessWidget {
  const HomeCharacterSkeletonList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemBuilder: (context, index) => const HomeCharacterCardSkeleton(),
    );
  }
}
