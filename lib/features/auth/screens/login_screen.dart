// import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_news_web_admin/features/auth/services/auth_services.dart';
import 'package:project_news_web_admin/features/auth/widgets/auth_centre_box.dart';
import 'package:project_news_web_admin/shared/app_elements/app_colors.dart';
import 'package:project_news_web_admin/shared/app_elements/app_texts.dart';
import 'package:project_news_web_admin/shared/widgets/button.dart';
import 'package:project_news_web_admin/shared/widgets/spacer.dart';
import 'package:project_news_web_admin/shared/widgets/text_input.dart';
// import 'package:email_auth/email_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();
  bool isPasswordInvisible = true;
  final AuthServices authServices = AuthServices();
  // final EmailAuth emailAuth = EmailAuth(sessionName: 'Test');

  // void sendOTP() async {
  //   var res = await emailAuth.sendOtp(recipientMail: _emailController.text);
  //   if (res) {
  //     print('OTP sent');
  //   } else {
  //     print('We could not send OTP');
  //   }
  // }
 
  void loginUser() {
    authServices.signInAdmin(
      context: context,
      // name: 'adminPRO',
      email: _emailController.text,
      password: _passwordController.text,
      // school: 'BUSA',
      // type: AppTexts.type,
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void passwordVisibility() {
    setState(() {
      isPasswordInvisible = !isPasswordInvisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.someWhite,
      body: AuthCentreBox(
        bottom: 216.h,
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
            child: Form(
              key: _loginFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppTexts.welcome,
                    style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Spc(h: 17.h),
                  Text(
                    AppTexts.welcomeMessage,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Spc(h: 90.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 46.w),
                    child: TextInputBox(
                      hintText: AppTexts.emailHintText2,
                      controller: _emailController,
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: AppColors.grey,
                        ),
                        onPressed: () => _emailController.clear(),
                      ),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return AppTexts.emailError2;
                        }
                        if (val != AppTexts.adminEmailValidator) {
                          return AppTexts.emailErrorValidate;
                        }
                        // if (!val.toString().contains(AppTexts.emailValidator)) {
                        //   return AppTexts.emailErrorValidate;
                        // }
                        return null;
                      },
                    ),
                  ),
                  Spc(h: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 46.w),
                    child: TextInputBox(
                      hintText: AppTexts.passwordHintText,
                      controller: _passwordController,
                      obscuretext: isPasswordInvisible,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return AppTexts.passwordError;
                        }
                        return null;
                      },
                      suffixIcon: GestureDetector(
                        onTap: passwordVisibility,
                        child: Icon(
                          Icons.remove_red_eye,
                          color: isPasswordInvisible == true
                              ? AppColors.grey
                              : AppColors.primaryBlue,
                        ),
                      ),
                    ),
                  ),
                  Spc(h: 50.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 150.w),
                    child: SizedBox(
                      child: Button(
                        onTap: () {
                          if (_loginFormKey.currentState!.validate()) {
                            // sign in user
                            loginUser();
                            // sendOTP();
                          }
                        },
                        item: Text(
                          AppTexts.requestOTP,
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.neutralWhite),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
