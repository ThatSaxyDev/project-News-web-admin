import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_news_web_admin/features/upload/screens/upload_news_screen.dart';
import 'package:project_news_web_admin/features/vertical_nav_bar/widgets/nav_bar_items.dart';
import 'package:project_news_web_admin/features/vertical_nav_bar/widgets/nav_bar_widget.dart';
import 'package:project_news_web_admin/shared/app_elements/app_colors.dart';
import 'package:project_news_web_admin/shared/app_elements/app_texts.dart';

class VerticalNavBar extends StatefulWidget {
  static const String routeName = '/nav-bar';
  const VerticalNavBar({super.key});

  @override
  State<VerticalNavBar> createState() => _VerticalNavBarState();
}

class _VerticalNavBarState extends State<VerticalNavBar> {
  final int _page = 0;

  final PageController controller = PageController();

  void _scrollToIndex(int index) {
    controller.animateToPage(index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.someWhite,
      body: SafeArea(
        child: Stack(
          children: [
            // page switchung
            PageView(
              controller: controller,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                UploadNewsScreen(),
                Expanded(child: Container(color: Colors.green)),
                Expanded(child: Container(color: Colors.red))
              ],
            ),

            // nav bar
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.07,
                margin: EdgeInsets.only(left: 24.w),
                padding: EdgeInsets.symmetric(vertical: 30.h),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue,
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
                child: Column(
                  children: NavBarItem.navBarItem
                      .map(
                        (e) => NavBarWidget(
                          e,
                          onTap: () {
                             _page == NavBarItem.navBarItem.indexOf(e);
                            _scrollToIndex(NavBarItem.navBarItem.indexOf(e));
                           
                          },
                          color: AppColors.neutralWhite,
                          iconSize: 35.w,
                          textSize: 15.sp,
                          border: Border(
                            right: BorderSide(
                              width: 3.w,
                              color: _page == NavBarItem.navBarItem.indexOf(e) ?
                              Colors.white : Colors.transparent,
                            ), 
                          ),
                          gradient: _page == NavBarItem.navBarItem.indexOf(e)
                              ? const LinearGradient(
                                  colors: [
                                    AppColors.primaryBlue,
                                    AppColors.primaryBlue,
                                    AppColors.primaryBlue,
                                    AppColors.primaryBlue,
                                    AppColors.primaryBlue,
                                    AppColors.someWhite,
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                )
                              : null,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),

            //
          ],
        ),
      ),
    );
  }
}

// InkWell(
//                       onTap: () {},
//                       child: SizedBox(
//                         height: 100.h,
//                         width: double.infinity,
//                         child: AnimatedContainer(
//                           padding: EdgeInsets.all(10.h),
//                           duration: const Duration(milliseconds: 250),
//                           width: 35,
//                           // decoration: BoxDecoration(
//                           //   border: Border(
//                           //     right: BorderSide(
//                           //       width: 3.w,
//                           //       color: Colors.white,
//                           //     ),
//                           //   ),
                            // gradient: const LinearGradient(
                            //   colors: [
                            //     AppColors.primaryBlue,
                            //     AppColors.primaryBlue,
                            //     AppColors.primaryBlue,
                            //     AppColors.primaryBlue,
                            //     AppColors.primaryBlue,
                            //     AppColors.someWhite,
                            //   ],
                            //   begin: Alignment.centerLeft,
                            //   end: Alignment.centerRight,
                            // ),
//                           // ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Icon(
//                                 Icons.upload_file,
//                                 size: 29.w,
//                                 color: AppColors.grey,
//                               ),
//                               Text(
//                                 'Upload',
//                                 style: TextStyle(
//                                   fontSize: 13.sp,
//                                   fontWeight: FontWeight.w600,
//                                   color: AppColors.grey,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     )
