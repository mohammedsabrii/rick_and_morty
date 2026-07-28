import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/home/presentation/screen/widgets/FilterBottomSheet/custom_filter_chip.dart';
import 'package:rick_and_morty/features/home/presentation/screen/widgets/FilterBottomSheet/section_title.dart';

// ignore: must_be_immutable
class SpeciesSection extends StatefulWidget {
  SpeciesSection({
    super.key,
    required this.speciesOptions,
    this.selectedSpecies,
  });
  final List<String> speciesOptions;
  String? selectedSpecies;

  @override
  State<SpeciesSection> createState() => _SpeciesSectionState();
}

class _SpeciesSectionState extends State<SpeciesSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Species'),
        SizedBox(height: 12.h),
        Wrap(
          spacing: 12.w,
          runSpacing: 10.h,
          children: widget.speciesOptions.map((species) {
            final isSelected = widget.selectedSpecies == species;
            return CustomFilterChip(
              label: species,
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  widget.selectedSpecies = isSelected ? null : species;
                });
              },
            );
          }).toList(),
        ),

        SizedBox(height: 16.h),
      ],
    );
  }
}
