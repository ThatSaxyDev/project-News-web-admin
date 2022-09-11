import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_news_web_admin/features/auth/widgets/auth_centre_box.dart';
import 'package:project_news_web_admin/shared/app_elements/app_colors.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.someWhite,
      body: AuthCentreBox(
        bottom: 333.h,
        top: 216.h,
        horizontal: 424.w,
        child: SizedBox.expand(
          child: Padding(
            padding: EdgeInsets.only(
              top: 50.h,
              bottom: 50.h,
              left: 21.w,
              right: 46.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
