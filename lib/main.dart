import 'package:flutter/material.dart';
import 'package:mim_generator/core/common/route.dart';
import 'package:mim_generator/di/di_object.dart';
import 'package:mim_generator/feature/splash/splash_screen.dart';

void main() {
  AppLocator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        title: 'Mim Generator',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
        routes: AppRoute.routeNames(context),
      ),
    );
  }
}
