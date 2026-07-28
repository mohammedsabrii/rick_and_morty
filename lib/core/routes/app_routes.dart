import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/features/Search%20Result/presentation/screen/search_result_screen.dart';
import 'package:rick_and_morty/features/Splash/presentation/screen/splash_screen.dart';
import 'package:rick_and_morty/features/home/presentation/screen/home_screen.dart';

class AppRoutes {
  static const kSplashScreen = '/';
  static const kHomeScreen = '/HomeScreen';
  static const kSearchResultScreen = '/SearchResultScreen';

  static final route = GoRouter(
    routes: [
      GoRoute(
        path: kSplashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: kHomeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: kSearchResultScreen,
        builder: (context, state) => const SearchResultScreen(),
      ),
    ],
  );
}
