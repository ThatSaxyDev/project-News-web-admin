// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:project_news_web_admin/shared/app_elements/app_texts.dart';

class NavBarItem {
  String? title;
  IconData? icon;
  NavBarItem({
    this.title,
    this.icon,
  });

  static List<NavBarItem> navBarItem = [
    NavBarItem(
     title: AppTexts.navBarText1,
     icon: Icons.upload_file,
    ),
    NavBarItem(
     title: AppTexts.navBarText2,
     icon: Icons.browse_gallery,
    ),
    NavBarItem(
     title: AppTexts.navBarText3,
     icon: Icons.settings,
    ),
  ];
}
