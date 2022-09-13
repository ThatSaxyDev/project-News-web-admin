// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:project_news_web_admin/shared/app_elements/app_colors.dart';

class AuthCentreBox extends StatelessWidget {
  final double left;
  final double right;
  final double top;
  final double bottom;
  final Widget child;
  const AuthCentreBox({
    Key? key,
    required this.left,
    required this.right,
    required this.top,
    required this.bottom,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: left,
        right: right,
        top: top,
        bottom: bottom,
      ),
      decoration: BoxDecoration(
        color: AppColors.neutralWhite,
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(2, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: child,
    );
  }
}
