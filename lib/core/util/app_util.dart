import 'package:mim_generator/core/widgets/app_text.dart';
import 'package:flutter/material.dart';

import '../config/app_typography.dart';

class AppUtil {
  static void showSnackBar(BuildContext context, {
    String? message,
    bool isError = true,
    bool isNetworkError = false,
    VoidCallback? onPressed
  }) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: AppText(
        title: message,
        textStyle: AppTypography.bodyMedium(color: Colors.white),
      ),
      action: isNetworkError? SnackBarAction(
        label: "Retry",
        onPressed: () => onPressed?.call(),
      ) : null,
      backgroundColor: isError ? Colors.red : Colors.black,
      behavior: SnackBarBehavior.floating,
    ));
  }

  static Future showBottomSheet(BuildContext context, {Widget? child}) async {
    return showModalBottomSheet(
      context: context,
      enableDrag: true,
      isDismissible: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Material(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
        child: child,
      ),
    );
  }

  static bindingInstance(Function function) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      function.call();
    });
  }

  static showError(BuildContext context, {
    String? message,
    bool isError = true,
    bool isNetworkError = false,
    VoidCallback? onPressed
  }) {
    bindingInstance(() => showSnackBar(
      context, message: message, isError: isError,
      isNetworkError: isNetworkError, onPressed: () => onPressed?.call(),
    ));
  }
}