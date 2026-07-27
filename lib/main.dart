import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/core/routes/app_routes.dart';
import 'package:rick_and_morty/core/services/service_locator.dart';
import 'package:rick_and_morty/core/widgets/my_custom_scroll_behavior.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServiceLocator();
  runApp(const RickAndMortyApp());
}

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 884),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        scrollBehavior: MyCustomScrollBehavior(),
        routerConfig: AppRoutes.route,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
