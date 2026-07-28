import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';
import 'package:rick_and_morty/features/home/presentation/screen/cubit/filter_character_cubit/filter_character_cubit.dart';
import 'package:rick_and_morty/features/home/presentation/screen/widgets/FilterBottomSheet/apply_filters_button.dart';
import 'package:rick_and_morty/features/home/presentation/screen/widgets/FilterBottomSheet/filter_bottom_sheet.dart';
import 'package:rick_and_morty/features/home/presentation/screen/widgets/FilterBottomSheet/filter_bottom_sheet_header.dart';
import 'package:rick_and_morty/features/home/presentation/screen/widgets/FilterBottomSheet/filter_content_area.dart';

class FilterBottomSheetState extends State<FilterBottomSheet> {
  final TextEditingController _nameController = TextEditingController();

  String? _selectedStatus;
  String? _selectedGender;
  String? _selectedSpecies;

  final List<String> _statusOptions = ['Alive', 'Dead', 'Unknown'];
  final List<String> _genderOptions = [
    'Female',
    'Male',
    'Genderless',
    'Unknown',
  ];
  final List<String> _speciesOptions = [
    'Human',
    'Alien',
    'Humanoid',
    'Poopybutthole',
    'Mythological',
  ];

  void _resetFilters() {
    setState(() {
      _nameController.clear();
      _selectedStatus = null;
      _selectedGender = null;
      _selectedSpecies = null;
    });
  }

  void _applyFilters() {
    final name = _nameController.text.trim();
    final status = _selectedStatus?.toLowerCase();
    final gender = _selectedGender?.toLowerCase();
    final species = _selectedSpecies?.toLowerCase();

    context.read<FilterCharacterCubit>().filterCharacters(
      name: name.isEmpty ? null : name,
      status: status,
      gender: gender,
      species: species,
    );

    if (widget.onApplyFilters != null) {
      widget.onApplyFilters!();
    } else {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 640.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.r),
          topRight: Radius.circular(32.r),
        ),
        border: Border(
          top: BorderSide(
            color: AppColors.kBorderColor.withValues(alpha: 0.3),
            width: 1.w,
          ),
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.kShadow,
            blurRadius: 40,
            offset: Offset(0, -10),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 14.h),
            child: Container(
              width: 40.w,
              height: 6.h,
              decoration: BoxDecoration(
                color: AppColors.kBorderColor,
                borderRadius: BorderRadius.circular(9999.r),
              ),
            ),
          ),

          FilterBottomSheetHeader(onTap: _resetFilters),
          FilterContentArea(
            genderOptions: _genderOptions,
            speciesOptions: _speciesOptions,
            selectedGender: _selectedGender,
            selectedSpecies: _selectedSpecies,
            statusOptions: _statusOptions,
            selectedStatus: _selectedStatus,
            controller: _nameController,
          ),

          ApplyFiltersButton(onTap: _applyFilters),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
