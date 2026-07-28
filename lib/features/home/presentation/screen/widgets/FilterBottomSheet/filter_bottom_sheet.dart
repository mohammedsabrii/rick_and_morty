import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/core/routes/app_routes.dart';
import 'package:rick_and_morty/features/home/presentation/screen/cubit/filter_character_cubit/filter_character_cubit.dart';
import 'package:rick_and_morty/features/home/presentation/screen/widgets/FilterBottomSheet/filter_bottom_sheet_state.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key, this.onApplyFilters});

  final VoidCallback? onApplyFilters;

  static Future<void> show(BuildContext context) {
    final filterCubit = context.read<FilterCharacterCubit>();
    final navigator = Navigator.of(context);
    final router = GoRouter.of(context);
    final currentRoute = GoRouterState.of(context).uri.toString();

    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (bottomSheetContext) => BlocProvider.value(
        value: filterCubit,
        child: FilterBottomSheet(
          onApplyFilters: () {
            navigator.pop();
            if (currentRoute != AppRoutes.kSearchResultScreen) {
              router.push(AppRoutes.kSearchResultScreen);
            }
          },
        ),
      ),
    );
  }

  @override
  State<FilterBottomSheet> createState() => FilterBottomSheetState();
}
