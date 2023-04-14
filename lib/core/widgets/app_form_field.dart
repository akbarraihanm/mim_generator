import 'package:flutter/material.dart';

class AppFormField extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;
  final Color? borderColor;
  final Color? bgColor;
  final String? hint;
  final bool? isEnable;
  final bool isPassword;
  final bool isPasswordHidden;
  final TextInputType? inputType;
  final bool isMultiline;
  final int? maxLength;
  final double? contentPaddingVert;
  final TextEditingController? controller;
  final Function(String v)? onChanged;
  final Function(String v)? onSubmit;
  final Function(bool a)? onTapPassword;
  final FocusNode? focusNode;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  const AppFormField(
      {Key? key,
      this.height,
      this.width,
      this.borderColor,
      this.hint,
      this.isEnable,
      this.inputType,
      this.isMultiline = false,
      this.controller,
      this.onChanged,
      this.onSubmit,
      this.bgColor,
      this.isPassword = false,
      this.onTapPassword,
      this.isPasswordHidden = false,
      this.radius = 4,
      this.maxLength,
      this.contentPaddingVert,
      this.focusNode, this.margin, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      height: height,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: bgColor ?? Colors.transparent,
        border: Border.all(color: borderColor ?? Colors.transparent),
        borderRadius: BorderRadius.circular(radius!),
      ),
      child: Row(
        crossAxisAlignment:
            isMultiline ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              enabled: isEnable,
              focusNode: focusNode,
              maxLength: maxLength,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  hintText: hint,
                  counterText: "",
                  isCollapsed: true,
                  isDense: true,
                  hintStyle:
                      const TextStyle(color: Color(0xff8d8d8d), fontSize: 14),
                  hintMaxLines: isMultiline ? null : 2,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  fillColor: Colors.transparent,
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 4)),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
              obscureText: isPassword,
              keyboardType: inputType ?? TextInputType.text,
              onChanged: onChanged,
              onFieldSubmitted: onSubmit,
              maxLines: isMultiline ? null : 1,
              textInputAction:
                  isMultiline ? TextInputAction.newline : TextInputAction.done,
            ),
          ),
        ],
      ),
    );
  }
}

class DefaultAppFormField extends StatelessWidget {
  final double? height;
  final double? width;
  final String? hint;
  final bool? isEnable;
  final TextInputType? inputType;
  final bool isMultiline;
  final int? maxLength;
  final TextEditingController? controller;
  final Function(String v)? onChanged;
  final Function(String v)? onSubmit;
  final FocusNode? focusNode;
  final double? fontSize;
  final Color? fontColor;
  final bool? obscure;
  final TextAlign? textAlign;
  final EdgeInsets? margin;

  const DefaultAppFormField(
      {Key? key,
      this.height,
      this.width,
      this.hint,
      this.isEnable,
      this.inputType,
      this.isMultiline = false,
      this.maxLength,
      this.controller,
      this.onChanged,
      this.onSubmit,
      this.focusNode,
      this.fontSize,
      this.fontColor,
      this.obscure,
      this.textAlign,
        this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextFormField(
        controller: controller,
        enabled: isEnable,
        focusNode: focusNode,
        maxLength: maxLength,
        textAlign: textAlign ?? TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            hintText: hint,
            counterText: "",
            isCollapsed: true,
            isDense: true,
            hintStyle: const TextStyle(color: Color(0xff8d8d8d), fontSize: 14),
            hintMaxLines: isMultiline ? null : 2,
            fillColor: Colors.transparent,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 4)),
        style: TextStyle(
          color: fontColor ?? Colors.black,
          fontSize: fontSize ?? 14,
        ),
        obscureText: obscure ?? false,
        keyboardType: inputType ?? TextInputType.text,
        onChanged: onChanged,
        onFieldSubmitted: onSubmit,
        maxLines: isMultiline ? null : 1,
      ),
    );
  }
}
