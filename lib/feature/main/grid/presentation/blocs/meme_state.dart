import 'package:flutter/material.dart';

abstract class MemeState {
  Widget when({
    Widget Function(Init state)? onInit,
    Widget Function(ShowLoading state)? onLoading,
    Widget Function(ShowError state)? onError,
  }) {
    final state = this;
    const defaultWidget = SizedBox();

    if (state is Init) {
      return onInit?.call(state) ?? defaultWidget;
    } else if (state is ShowLoading) {
      return onLoading?.call(state) ?? defaultWidget;
    } else if (state is ShowError) {
      return onError?.call(state) ?? defaultWidget;
    }
    return onInit?.call(Init()) ?? defaultWidget ;
  }
}

class Init extends MemeState {}

class ShowLoading extends MemeState {}

class ShowError extends MemeState {
  String message;

  ShowError(this.message);
}