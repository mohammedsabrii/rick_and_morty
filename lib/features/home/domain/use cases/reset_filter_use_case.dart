import 'package:rick_and_morty/features/home/domain/repository/home_repository.dart';

class ResetFilterUseCase {
  final HomeRepository homeRepository;

  ResetFilterUseCase({required this.homeRepository});

  void resetFilter() {
    homeRepository.resetFilter();
  }
}
