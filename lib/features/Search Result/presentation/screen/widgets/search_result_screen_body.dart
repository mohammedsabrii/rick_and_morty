import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/core/widgets/Connection%20Lost/connection_lost_state.dart';
import 'package:rick_and_morty/core/widgets/Error%20State/error_state.dart';
import 'package:rick_and_morty/core/widgets/No%20Results/no_results_state.dart';
import 'package:rick_and_morty/core/widgets/custom_text_field.dart';
import 'package:rick_and_morty/features/Search%20Result/presentation/screen/widgets/search_result_card.dart';
import 'package:rick_and_morty/features/home/presentation/screen/cubit/filter_character_cubit/filter_character_cubit.dart';
import 'package:rick_and_morty/features/home/presentation/screen/widgets/Skeleton/home_character_skeleton_list.dart';
import 'package:rick_and_morty/features/home/presentation/screen/widgets/FilterBottomSheet/filter_bottom_sheet.dart';

class SearchResultScreenBody extends StatelessWidget {
  const SearchResultScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          Row(
            children: [
              IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              ),
              Expanded(
                child: CustomTextField(
                  hintText: "Search Characters ....",
                  readOnly: true,
                  onTap: () => FilterBottomSheet.show(context),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: BlocBuilder<FilterCharacterCubit, FilterCharacterState>(
              builder: (context, state) {
                if (state is FilterCharacterLoading) {
                  return const HomeCharacterSkeletonList();
                }
                if (state is FilterCharacterError) {
                  return ErrorState(
                    onTap: () =>
                        context.read<FilterCharacterCubit>().filterCharacters(),
                  );
                }
                if (state is FilterNoInternetConnection) {
                  return ConnectionLostState(
                    onTap: () =>
                        context.read<FilterCharacterCubit>().filterCharacters(),
                  );
                }
                if (state is FilterCharacterEmpty) {
                  return const NoResultsState();
                }
                if (state is FilterCharacterSuccess) {
                  return ListView.separated(
                    padding: EdgeInsets.only(bottom: 20.h),
                    itemCount: state.characters.length,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 15.h),
                    itemBuilder: (context, index) {
                      return SearchResultCard(
                        character: state.characters[index],
                      );
                    },
                  );
                }
                return const NoResultsState();
              },
            ),
          ),
        ],
      ),
    );
  }
}
