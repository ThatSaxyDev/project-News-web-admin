import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_news_web_admin/shared/app_elements/app_colors.dart';

class TextInputBox extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscuretext;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  const TextInputBox({
    Key? key,
    required this.hintText,
    required this.controller,
    this.obscuretext = false,
    this.validator,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscuretext,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        isDense: true,
        errorStyle: TextStyle(
          fontSize: 12.sp
        ),
        suffixIcon: suffixIcon,
        // labelText: hintText,
        // labelStyle: TextStyle(
        //   fontSize: 16.sp,
        //   fontWeight: FontWeight.w400,
        //   color: AppColors.primaryBlue,
        // ),
        hintText: hintText,
        fillColor: AppColors.someWhite,
        filled: true,
        hintStyle: TextStyle(
          fontSize: 17.sp,
          fontWeight: FontWeight.w400,
          color: const Color.fromRGBO(125, 127, 129, 1),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
          borderRadius: BorderRadius.circular(6.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
          borderRadius: BorderRadius.circular(6.r),
        ),
      ),
      validator: validator,
    );
  }
}
