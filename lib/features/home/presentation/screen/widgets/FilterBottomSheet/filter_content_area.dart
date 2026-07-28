import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/core/widgets/custom_text_field.dart';
import 'package:rick_and_morty/features/home/presentation/screen/widgets/FilterBottomSheet/custom_filter_chip.dart';
import 'package:rick_and_morty/features/home/presentation/screen/widgets/FilterBottomSheet/gender_section.dart';
import 'package:rick_and_morty/features/home/presentation/screen/widgets/FilterBottomSheet/section_title.dart';
import 'package:rick_and_morty/features/home/presentation/screen/widgets/FilterBottomSheet/species_section.dart';

// ignore: must_be_immutable
class FilterContentArea extends StatefulWidget {
  FilterContentArea({
    super.key,
    required this.genderOptions,
    required this.speciesOptions,
    this.selectedGender,
    this.selectedSpecies,
    required this.statusOptions,
    this.selectedStatus,
    required this.controller,
  });
  final List<String> genderOptions;
  String? selectedGender;
  final List<String> speciesOptions;
  String? selectedSpecies;
  final List<String> statusOptions;
  String? selectedStatus;
  final TextEditingController controller;
  @override
  State<FilterContentArea> createState() => _FilterContentAreaState();
}

class _FilterContentAreaState extends State<FilterContentArea> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: 'Character Name'),
            SizedBox(height: 12.h),
            CustomTextField(
              controller: widget.controller,
              hintText: 'Search character name...',
            ),

            SizedBox(height: 24.h),

            const SectionTitle(title: 'Status'),
            SizedBox(height: 12.h),
            Wrap(
              spacing: 12.w,
              runSpacing: 10.h,
              children: widget.statusOptions.map((status) {
                final isSelected = widget.selectedStatus == status;
                return CustomFilterChip(
                  label: status,
                  isSelected: isSelected,
                  onTap: () {
                    setState(() {
                      widget.selectedStatus = isSelected ? null : status;
                    });
                  },
                );
              }).toList(),
            ),

            SizedBox(height: 24.h),

            GenderSection(
              genderOptions: widget.genderOptions,
              selectedGender: widget.selectedGender,
            ),
            SpeciesSection(
              speciesOptions: widget.speciesOptions,
              selectedSpecies: widget.selectedSpecies,
            ),
          ],
        ),
      ),
    );
  }
}
