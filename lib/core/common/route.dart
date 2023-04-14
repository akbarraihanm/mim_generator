import 'package:flutter/material.dart';
import 'package:mim_generator/feature/main/detail/param/meme_detail_param.dart';
import 'package:mim_generator/feature/main/detail/presentation/page/meme_detail_screen.dart';
import 'package:mim_generator/feature/main/grid/presentation/page/meme_screen.dart';
import 'package:mim_generator/feature/main/save_share/param/save_share_param.dart';
import 'package:mim_generator/feature/main/save_share/presentation/save_share_screen.dart';
import 'package:mim_generator/feature/splash/splash_screen.dart';

class AppRoute {
  static Map<String, WidgetBuilder> routeNames(BuildContext context) {
    return {
      SplashScreen.routeName: (context) => const SplashScreen(),
      MemeScreen.routeName: (context) => const MemeScreen(),
      MemeDetailScreen.routeName: (context) {
        final param = ModalRoute.of(context)?.settings.arguments as MemeDetailParam;
        return MemeDetailScreen(param: param);
      },
      SaveShareScreen.routeName: (context) {
        final param = ModalRoute.of(context)?.settings.arguments as SaveShareParam;
        return SaveShareScreen(param: param);
      }
    };
  }
}
