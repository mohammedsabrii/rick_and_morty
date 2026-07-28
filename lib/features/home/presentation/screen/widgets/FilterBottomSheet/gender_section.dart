import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/home/presentation/screen/widgets/FilterBottomSheet/custom_filter_chip.dart';
import 'package:rick_and_morty/features/home/presentation/screen/widgets/FilterBottomSheet/section_title.dart';

// ignore: must_be_immutable
class GenderSection extends StatefulWidget {
  GenderSection({super.key, required this.genderOptions, this.selectedGender});
  final List<String> genderOptions;
  String? selectedGender;
  @override
  State<GenderSection> createState() => _GenderSectionState();
}

class _GenderSectionState extends State<GenderSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Gender'),
        SizedBox(height: 12.h),
        Wrap(
          spacing: 12.w,
          runSpacing: 10.h,
          children: widget.genderOptions.map((gender) {
            final isSelected = widget.selectedGender == gender;
            return CustomFilterChip(
              label: gender,
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  widget.selectedGender = isSelected ? null : gender;
                });
              },
            );
          }).toList(),
        ),

        SizedBox(height: 24.h),
      ],
    );
  }
}
