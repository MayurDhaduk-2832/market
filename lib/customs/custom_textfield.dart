import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomSearchView extends StatelessWidget {
  CustomSearchView(
      {this.shape,
      this.padding,
      this.variant,
      this.inputType,
      this.fontStyle,
      this.alignment,
      this.width,
      this.margin,
      this.controller,
      this.focusNode,
      this.textCapitalization,
      this.hintText,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints,
      this.maxLength,
      this.onChanged,
      this.onSubmitted,
      this.obsecureText});

  Function(String)? onChanged;

  Function(String)? onSubmitted;

  SearchViewShape? shape;

  SearchViewPadding? padding;

  SearchViewVariant? variant;

  SearchViewFontStyle? fontStyle;

  Alignment? alignment;

  double? width;

  EdgeInsetsGeometry? margin;

  TextInputType? inputType;

  TextCapitalization? textCapitalization;

  TextEditingController? controller;

  FocusNode? focusNode;

  String? hintText;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

  Widget? suffix;

  bool? obsecureText;

  BoxConstraints? suffixConstraints;
  int? maxLength = 50;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildSearchViewWidget(),
          )
        : _buildSearchViewWidget();
  }

  _buildSearchViewWidget() {
    return Container(
      width: 375,
      margin: margin,
      child: TextFormField(
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        keyboardType: inputType ?? TextInputType.streetAddress,
        controller: controller,
        focusNode: focusNode,
        obscureText: obsecureText ?? false,
        style: _setFontStyle(),
        maxLength: maxLength,
        decoration: _buildDecoration(),
        onChanged: (value) {
          onChanged!(value.toString());
        },
        onFieldSubmitted: (value) {
          onSubmitted!(value.toString());
        },
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: _setFontStyle(),
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(),
      focusedBorder: _setBorderStyle(),
      disabledBorder: _setBorderStyle(),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
      filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      case SearchViewFontStyle.RobotoRomanRegular18:
        return TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        );

      default:
        return TextStyle(
          color: Colors.grey.shade500,
          fontSize: 18,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        );
    }
  }

  _setOutlineBorderRadius() {
    switch (shape) {
      default:
        return BorderRadius.circular(
          6.00,
        );
    }
  }

  _setBorderStyle() {
    switch (variant) {
      case SearchViewVariant.None:
        return InputBorder.none;
      case SearchViewVariant.OutlinrGrayDark:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: Colors.grey.shade200,
            width: 1.5,
          ),
        );
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1.5,
          ),
        );
    }
  }

  _setFilled() {
    switch (variant) {
      case SearchViewVariant.OutlineGray300:
        return false;
      case SearchViewVariant.OutlinrGrayDark:
        return false;
      case SearchViewVariant.None:
        return false;
      default:
        return false;
    }
  }

  _setPadding() {
    switch (padding) {
      default:
        return EdgeInsets.only(
          top: 11,
          right: 11,
          bottom: 11,
        );
    }
  }
}

enum SearchViewShape {
  RoundedBorder6,
}

enum SearchViewPadding {
  PaddingT11,
}

enum SearchViewVariant {
  None,
  OutlinrGrayDark,
  OutlineGray300,
}

enum SearchViewFontStyle {
  RobotoRomanRegular18,
}
