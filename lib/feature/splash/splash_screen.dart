import 'package:flutter/material.dart';
import 'package:mim_generator/core/common/navigation.dart';
import 'package:mim_generator/core/config/app_color.dart';
import 'package:mim_generator/core/config/app_typography.dart';
import 'package:mim_generator/core/const/app_string.dart';
import 'package:mim_generator/core/widgets/app_text.dart';
import 'package:mim_generator/feature/main/grid/presentation/page/meme_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/splash";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      AppNav.pushReplacement(context, MemeScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.biruGelap,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: AppText(
            title: AppString.name,
            textStyle: AppTypography.headLine(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
