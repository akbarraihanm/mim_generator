import 'package:flutter/material.dart';

class AppTypography {
  static TextStyle display({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? Colors.black,
      fontSize: 36,
      fontWeight: FontWeight.w400,
      fontStyle: style ?? FontStyle.normal);

  static TextStyle headLine({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.w500,
      fontStyle: style ?? FontStyle.normal);

  static TextStyle titleLarge({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? Colors.black,
      fontSize: 22,
      fontWeight: FontWeight.normal,
      fontStyle: style ?? FontStyle.normal);

  static TextStyle titleMedium({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontStyle: style ?? FontStyle.normal);

  static TextStyle titleSmall({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontStyle: style ?? FontStyle.normal);

  static TextStyle titleCustom({
    Color? color,
    FontStyle? style,
    double? size,
    FontWeight? weight,
  }) => TextStyle(
    color: color ?? Colors.black,
    fontSize: size ?? 14,
    fontWeight: weight ?? FontWeight.w600,
    fontStyle: style ?? FontStyle.normal,
  );

  static TextStyle bodyLarge(
          {Color? color, FontStyle? style, FontWeight? fontWeight}) =>
      TextStyle(
          color: color ?? Colors.black,
          fontSize: 16,
          fontWeight: fontWeight ?? FontWeight.normal,
          fontStyle: style ?? FontStyle.normal);

  static TextStyle bodyMedium({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? Colors.black,
      fontSize: 14,
      fontStyle: style ?? FontStyle.normal);

  static TextStyle body13({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? Colors.black,
      fontSize: 13,
      fontStyle: style ?? FontStyle.normal);

  static TextStyle bodySmall({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? Colors.black,
      fontSize: 12,
      fontStyle: style ?? FontStyle.normal);

  static TextStyle body11({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? Colors.black,
      fontSize: 11,
      fontStyle: style ?? FontStyle.normal);

  static TextStyle body10({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? Colors.black,
      fontSize: 10,
      fontStyle: style ?? FontStyle.normal);

  static TextStyle body8({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? Colors.black,
      fontSize: 8,
      fontStyle: style ?? FontStyle.normal);

  static TextStyle action({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 14,
      fontStyle: style ?? FontStyle.normal);

  static TextStyle actionSmall({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 12,
      fontStyle: style ?? FontStyle.normal);

  static TextStyle action13({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 13,
      fontStyle: style ?? FontStyle.normal);

  static TextStyle action10({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 10,
      fontStyle: style ?? FontStyle.normal);
}
