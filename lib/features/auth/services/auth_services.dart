import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_news_web_admin/features/auth/screens/login_screen.dart';
import 'package:project_news_web_admin/features/auth/screens/otp_screen.dart';
import 'package:project_news_web_admin/features/auth/screens/temp_home_screen.dart';
import 'package:project_news_web_admin/features/upload/screens/upload_news_screen.dart';
import 'package:project_news_web_admin/features/vertical_nav_bar/screens/vertical_nav_bar.dart';
import 'package:project_news_web_admin/models/user.dart';
import 'package:project_news_web_admin/providers/user_provider.dart';
import 'package:project_news_web_admin/shared/app_elements/app_constants.dart';
import 'package:project_news_web_admin/shared/utils/alert.dart';
import 'package:project_news_web_admin/shared/utils/error_handling.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  // sign up user
  void signUpAdmin(
      {required BuildContext context,
      required String name,
      required String email,
      required String password,
      required String school,
      required String type,
      d}) async {
    try {
      User user = User(
        id: '',
        name: name,
        email: email,
        school: school,
        password: password,
        token: '',
        type: type,
      );
      // final navigator = Navigator.of(context);
      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showAlert(
            context,
            'Account Created',
          );
        },
      );
    } catch (e) {
      showAlert(
        context,
        e.toString(),
      );
    }
  }

  //! sign in user
  void signInAdmin({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      final navigator = Navigator.of(context);
      http.Response res =
          await http.post(Uri.parse('${Constants.uri}/api/signin'),
              body: jsonEncode({
                'email': email,
                'password': password,
              }),
              headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          userProvider.setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          navigator.pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const VerticalNavBar(),
              ),
              (route) => false);
        },
      );
    } catch (e) {
      showAlert(
        context,
        e.toString(),
      );
    }
  }

  //! get user data
  void getAdminData(BuildContext context) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('${Constants.uri}/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!,
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('${Constants.uri}/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token,
          },
        );

        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showAlert(
        context,
        e.toString(),
      );
    }
  }

  // sign out user
  void signOut(BuildContext context) async {
    final navigator = Navigator.of(context);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('x-auth-token', '');
    navigator.pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
        (route) => false);
  }
}
