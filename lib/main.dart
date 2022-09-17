import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_news_web_admin/features/auth/screens/login_screen.dart';
import 'package:project_news_web_admin/features/auth/screens/temp_home_screen.dart';
import 'package:project_news_web_admin/features/auth/services/auth_services.dart';
import 'package:project_news_web_admin/features/upload/screens/upload_news_screen.dart';
import 'package:project_news_web_admin/features/vertical_nav_bar/screens/vertical_nav_bar.dart';
import 'package:project_news_web_admin/providers/user_provider.dart';
import 'package:project_news_web_admin/shared/app_elements/app_colors.dart';
import 'package:project_news_web_admin/shared/app_elements/app_texts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final AuthServices authServices = AuthServices();

  // @override
  // void initState() {
  //   super.initState();
  //   authServices.getUserData(context);
  // }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 1029),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return MaterialApp(
          title: AppTexts.appName,
          theme: ThemeData(
            primaryColor: AppColors.primaryBlue,
            textTheme: GoogleFonts.poppinsTextTheme(),
          ),
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child:
       Provider.of<UserProvider>(context).user.token.isEmpty
          ? const LoginScreen()
          : 
          const VerticalNavBar(),
    );
  }
}
