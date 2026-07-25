import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/home/presentation/screen/widgets/Home%20Character%20Card/home_character_card_content.dart';

class HomeCharacterCardBody extends StatelessWidget {
  const HomeCharacterCardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 80.h,
          width: 80.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            image: const DecorationImage(
              image: NetworkImage(
                "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 12.w),
        const HomeCharacterCardContent(),
        const Spacer(),
        Icon(Icons.more_vert, size: 24.sp),
      ],
    );
  }
}
