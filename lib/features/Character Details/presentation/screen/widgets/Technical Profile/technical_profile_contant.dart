import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/Character%20Details/presentation/screen/widgets/Technical%20Profile/technical_profile_card.dart';

class TechnicalProfileContant extends StatelessWidget {
  const TechnicalProfileContant({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 25.h),
        Row(
          spacing: 16.w,
          children: const [
            Expanded(child: TechnicalProfileCard()),
            Expanded(child: TechnicalProfileCard()),
          ],
        ),
        SizedBox(height: 20.h),
        Row(
          spacing: 16.w,
          children: const [
            Expanded(child: TechnicalProfileCard()),
            Expanded(child: TechnicalProfileCard()),
          ],
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
