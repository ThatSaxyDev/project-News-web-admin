// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:project_news_web_admin/shared/app_elements/app_colors.dart';

class OTPField extends StatelessWidget {
  final TextEditingController controller;
  const OTPField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      width: 68.w,
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.black,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        decoration: InputDecoration(
          helperText: " ",
          helperStyle: const TextStyle(fontSize: 0.0005),
          errorStyle: const TextStyle(fontSize: 0.0005),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.grey),
            borderRadius: BorderRadius.circular(6.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.grey),
            borderRadius: BorderRadius.circular(6.r),
          ),
        ),
        style: Theme.of(context).textTheme.headline4,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        validator: (val) {
          if (val == null || val.isEmpty) {
            return '';
          }
          return null;
        },
      ),
    );
  }
}
