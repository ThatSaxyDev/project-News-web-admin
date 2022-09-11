// import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_news_web_admin/features/auth/widgets/auth_centre_box.dart';
import 'package:project_news_web_admin/features/auth/widgets/otp_field.dart';
import 'package:project_news_web_admin/providers/user_provider.dart';
import 'package:project_news_web_admin/shared/app_elements/app_colors.dart';
import 'package:project_news_web_admin/shared/app_elements/app_texts.dart';
import 'package:project_news_web_admin/shared/widgets/button.dart';
import 'package:project_news_web_admin/shared/widgets/spacer.dart';
import 'package:provider/provider.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _pin1 = TextEditingController();
  final TextEditingController _pin2 = TextEditingController();
  final TextEditingController _pin3 = TextEditingController();
  final TextEditingController _pin4 = TextEditingController();
  final TextEditingController _pin5 = TextEditingController();
  final TextEditingController _pin6 = TextEditingController();
  final _otpKey = GlobalKey<FormState>();
  // final EmailAuth emailAuth = EmailAuth(sessionName: 'Test');

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      backgroundColor: AppColors.someWhite,
      body: AuthCentreBox(
        bottom: 333.h,
        top: 216.h,
        horizontal: 424.w,
        child: SizedBox.expand(
          child: Padding(
            padding: EdgeInsets.only(
              top: 40.h,
              bottom: 50.h,
              left: 21.w,
              right: 46.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // title
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppTexts.otpVeri,
                    style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),

                Spc(h: 27.h),
                // send mail to
                Text(
                  AppTexts.enterCode,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  user.email,
                  style: TextStyle(
                    color: AppColors.primaryBlue,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spc(h: 40.h),

                // otp field
                Form(
                  key: _otpKey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // 1
                      OTPField(
                        controller: _pin1,
                      ),
                      // 2
                      OTPField(
                        controller: _pin2,
                      ),
                      // 3
                      OTPField(
                        controller: _pin3,
                      ),
                      // 4
                      OTPField(
                        controller: _pin4,
                      ),
                      // 5
                      OTPField(
                        controller: _pin5,
                      ),
                      // 6
                      OTPField(
                        controller: _pin6,
                      ),
                    ],
                  ),
                ),
                Spc(h: 40.h),

                // verify button
                SizedBox(
                  width: 290.w,
                  child: Button(
                    onTap: () async {
                      // String _pin =
                      //     '${_pin1.text}${_pin2.text}${_pin3.text}${_pin4.text}';
                      // if (_otpKey.currentState!.validate()) {
                      //   // verify OTP
                      //   var res = emailAuth.validateOtp(
                      //     recipientMail: user.email,
                      //     userOtp: _pin,
                      //   );
                      //   if (res) {
                      //     print('OTP verified');
                      //   } else {
                      //     print('Invalid OTP');
                      //   }
                      // }
                    },
                    item: Text(
                      AppTexts.verifyButton,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.neutralWhite,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
