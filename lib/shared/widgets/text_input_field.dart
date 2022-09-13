// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:project_news_web_admin/shared/app_elements/app_colors.dart';
import 'package:project_news_web_admin/shared/app_elements/app_texts.dart';
import 'package:project_news_web_admin/shared/widgets/spacer.dart';

class TextInputField extends StatelessWidget {
  final double? height;
  final double? width;
  final String title;
  final int? maxLength;
  final Widget? icon;
  final Widget? label;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final TextInputType? keyboardType;
  const TextInputField({
    Key? key,
    this.height,
    this.width,
    required this.title,
    this.maxLength,
    this.icon,
    this.label,
    this.obscureText = false,
    required this.controller,
    this.validator,
    this.onSaved,
    this.keyboardType = TextInputType.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //! title
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 17.sp,
          ),
        ),
        Spc(h: 7.h),

        //! input
        SizedBox(
          height: height,
          width: width,
          child: TextFormField(
            maxLength: maxLength,
            cursorColor: Colors.black,
            obscureText: obscureText,
            controller: controller,
            decoration: InputDecoration(
              helperText: " ",
              helperStyle: const TextStyle(fontSize: 0.0005),
              errorStyle: const TextStyle(fontSize: 0.0005),
              // isDense: true,
              label: label,
              prefixIcon: icon,

              // fillColor: AppColors.grey.withOpacity(0.3),
              // filled: true,

              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.grey.withOpacity(0.1),
                ),
                borderRadius: BorderRadius.circular(5.65.r),
              ),
              // enabledBorder: OutlineInputBorder(
              //   borderSide: BorderSide(
              //     color: AppColors.grey.withOpacity(0.5),
              //   ),
              //   borderRadius: BorderRadius.circular(5.65.r),
              // ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryBlue,
                ),
                borderRadius: BorderRadius.circular(5.65.r),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryRed,
                ),
                borderRadius: BorderRadius.circular(5.65.r),
              ),
            ),
            keyboardType: keyboardType,
            validator: validator,
            onSaved: onSaved,
          ),
        ),
      ],
    );
  }
}

class ParagraphField extends StatelessWidget {
  final String title;
  final double? height;
  final double? width;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const ParagraphField({
    Key? key,
    required this.title,
    this.height,
    this.width,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //! title
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 17.sp,
          ),
        ),
        Spc(h: 7.h),

        //input
        SizedBox(
          height: 230.h,
          width: width,
          child: TextFormField(
            controller: controller,
            maxLines: 12,
            keyboardType: TextInputType.multiline,
            cursorColor: AppColors.grey,
            decoration: InputDecoration(
              helperText: " ",
              helperStyle: const TextStyle(fontSize: 0.0005),
              errorStyle: const TextStyle(fontSize: 0.0005),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 17.h,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: AppColors.primaryBlue,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: AppColors.primaryBlue,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: AppColors.primaryBlue,
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: AppColors.primaryRed,
                ),
              ),
            ),
            validator: validator,
          ),
        ),
      ],
    );
  }
}
