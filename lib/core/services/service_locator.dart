import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/core/services/api_service.dart';
import 'package:rick_and_morty/features/home/data/data_source/home_remote_data_source.dart';
import 'package:rick_and_morty/features/home/data/repository%20implementation/home_repository_implementation.dart';
import 'package:rick_and_morty/features/home/domain/repository/home_repository.dart';
import 'package:rick_and_morty/features/home/domain/use%20cases/filter_character_use_case.dart';
import 'package:rick_and_morty/features/home/domain/use%20cases/get_character_use_case.dart';
import 'package:rick_and_morty/features/home/domain/use%20cases/reset_filter_use_case.dart';
import 'package:rick_and_morty/features/home/presentation/screen/cubit/filter_character_cubit/filter_character_cubit.dart';
import 'package:rick_and_morty/features/home/presentation/screen/cubit/get_character_cubit/get_character_cubit.dart';

final getIt = GetIt.instance;
Future<void> initServiceLocator() async {
  _initCore();
  _initCharacters();
}

void _initCore() {
  getIt.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    ),
  );

  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));
}

void _initCharacters() {
  //dataSource//
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );
  //repo//
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImplementation(
      homeRemoteDataSource: getIt<HomeRemoteDataSource>(),
    ),
  );
  //use cases//
  getIt.registerLazySingleton(
    () => GetCharacterUseCase(homeRepository: getIt<HomeRepository>()),
  );
  getIt.registerLazySingleton(
    () => FilterCharacterUseCase(homeRepository: getIt<HomeRepository>()),
  );
  getIt.registerLazySingleton(
    () => ResetFilterUseCase(homeRepository: getIt<HomeRepository>()),
  );

  //cubit//
  getIt.registerFactory(() => GetCharactersCubit(getIt<GetCharacterUseCase>()));
  getIt.registerLazySingleton(
    () => FilterCharacterCubit(
      getIt<FilterCharacterUseCase>(),
      getIt<ResetFilterUseCase>(),
    ),
  );
}
