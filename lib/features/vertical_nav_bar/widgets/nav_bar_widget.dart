// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:project_news_web_admin/features/vertical_nav_bar/widgets/nav_bar_items.dart';

class NavBarWidget extends StatelessWidget {
  final Color color;
  final double iconSize;
  final double textSize;
  final Gradient? gradient;
  final BoxBorder border;
  final NavBarItem navBarItem;
  final void Function()? onTap;
  const NavBarWidget(
    this.navBarItem,{
    Key? key,
    required this.color,
    required this.iconSize,
    required this.textSize,
    this.gradient,
    required this.border,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 100.h,
        width: double.infinity,
        child: AnimatedContainer(
          padding: EdgeInsets.all(10.h),
          duration: const Duration(milliseconds: 250),
          width: 35.w,
          decoration: BoxDecoration(border: border, gradient: gradient),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                navBarItem.icon,
                size: iconSize,
                color: color,
              ),
              Text(
                navBarItem.title!,
                style: TextStyle(
                  fontSize: textSize,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// decoration: BoxDecoration(
//             border: Border(
//               right: BorderSide(
//                 width: 3.w,
//                 color: Colors.white,
//               ),
//             ),
//             gradient: const LinearGradient(
//               colors: [
//                 AppColors.primaryBlue,
//                 AppColors.primaryBlue,
//                 AppColors.primaryBlue,
//                 AppColors.primaryBlue,
//                 AppColors.primaryBlue,
//                 AppColors.someWhite,
//               ],
//               begin: Alignment.centerLeft,
//               end: Alignment.centerRight,
//             ),
//           ),