import 'dart:io';
import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:project_news_web_admin/features/auth/widgets/auth_centre_box.dart';
import 'package:project_news_web_admin/services/admin_services.dart';
import 'package:project_news_web_admin/shared/app_elements/app_icons.dart';
import 'package:project_news_web_admin/shared/app_elements/app_texts.dart';
import 'package:project_news_web_admin/shared/widgets/button.dart';
import 'package:project_news_web_admin/shared/widgets/spacer.dart';
import 'package:project_news_web_admin/shared/widgets/text_input_field.dart';

import '../../../shared/app_elements/app_colors.dart';

class UploadNewsScreen extends StatefulWidget {
  const UploadNewsScreen({super.key});

  @override
  State<UploadNewsScreen> createState() => _UploadNewsScreenState();
}

class _UploadNewsScreenState extends State<UploadNewsScreen> {
  File? pickedImage;
  File? pickedImage2;
  Uint8List pickedWebImage = Uint8List(8);
  Uint8List pickedWebNewsLetter = Uint8List(8);
  final _uploadKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _paragraph1Controller = TextEditingController();
  final TextEditingController _paragraph2Controller = TextEditingController();
  final TextEditingController _paragraph3Controller = TextEditingController();
  final TextEditingController _paragraph4Controller = TextEditingController();
  final TextEditingController _paragraph5Controller = TextEditingController();
  final AdminServices _adminServices = AdminServices();

  // pick image
  Future<void> chooseImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var f = await image.readAsBytes();
      setState(() {
        pickedWebImage = f;
        pickedImage = File('a');
      });
    } else {
      print('No image picked');
    }
  }

  // pick newsletter image
  Future<void> chooseNewsletterImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var f = await image.readAsBytes();
      setState(() {
        pickedWebNewsLetter = f;
        pickedImage2 = File('a');
      });
    } else {
      print('No image picked');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.someWhite,
      body: AuthCentreBox(
        left: 150.w,
        right: 30.w,
        top: 30.h,
        bottom: 30.h,
        child: SizedBox.expand(
          child: Padding(
            padding: EdgeInsets.only(
              top: 50.h,
              bottom: 50.h,
              left: 25.w,
              right: 25.w,
            ),
            child: Form(
              key: _uploadKey,
              child: Row(
                children: [
                  // column 1
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Column(
                        children: [
                          pickedImage != null
                              ? GestureDetector(
                                  onTap: () async {
                                    chooseImage();
                                  },
                                  child: Container(
                                    // width: 300.w,
                                    height: 300.h,
                                    decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(10.r),
                                      // image: DecorationImage(
                                      //   image: MemoryImage(pickedWebImage),
                                      //   fit: BoxFit.fitWidth,
                                      // ),
                                    ),
                                    child: Image.memory(pickedWebImage),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () async {
                                    chooseImage();
                                  },
                                  child: DottedBorder(
                                    strokeWidth: 3,
                                    borderType: BorderType.RRect,
                                    radius: Radius.circular(10.r),
                                    dashPattern: const [5, 4],
                                    color:
                                        const Color.fromRGBO(196, 196, 196, 1),
                                    child: Container(
                                      // width: 300.w,
                                      height: 300.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 40.h,
                                              child: Image.asset(
                                                  AppIcons.uploadImageIcon),
                                            ),
                                            Spc(h: 20.h),
                                            Text(
                                              AppTexts.uploadImage,
                                              style: TextStyle(
                                                fontSize: 30.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                          // title field
                          Spc(h: 20.h),
                          TextInputField(
                            title: AppTexts.title,
                            controller: _titleController,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return '';
                              }
                              return null;
                            },
                          ),

                          // author field
                          Spc(h: 10.h),
                          TextInputField(
                            title: AppTexts.author,
                            controller: _authorController,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return '';
                              }
                              return null;
                            },
                          ),
                          Spc(h: 30.h),

                          // upload the newsletter
                          pickedImage2 != null
                              ? GestureDetector(
                                  onTap: () async {
                                    chooseNewsletterImage();
                                  },
                                  child: Container(
                                    // width: 300.w,
                                    height: 300.h,
                                    decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(10.r),
                                      // image: DecorationImage(
                                      //   image: MemoryImage(pickedWebImage),
                                      //   fit: BoxFit.fitWidth,
                                      // ),
                                    ),
                                    child: Image.memory(pickedWebNewsLetter),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () async {
                                    chooseNewsletterImage();
                                  },
                                  child: DottedBorder(
                                    strokeWidth: 3,
                                    borderType: BorderType.RRect,
                                    radius: Radius.circular(10.r),
                                    dashPattern: const [5, 4],
                                    color:
                                        const Color.fromRGBO(196, 196, 196, 1),
                                    child: Container(
                                      // width: 300.w,
                                      height: 300.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 40.h,
                                              child: Image.asset(AppIcons
                                                  .uploadNewsLetterIcon),
                                            ),
                                            Spc(h: 20.h),
                                            Text(
                                              AppTexts.uploadNewsLetter,
                                              style: TextStyle(
                                                fontSize: 30.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                  // column 2
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Column(
                        children: [
                          // par 1
                          ParagraphField(
                            title: AppTexts.paragraph1,
                            controller: _paragraph1Controller,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return '';
                              }
                              return null;
                            },
                          ),
                          Spc(h: 30.h),
                          // par 2
                          ParagraphField(
                            title: AppTexts.paragraph2,
                            controller: _paragraph2Controller,
                          ),
                          Spc(h: 30.h),
                          // par 3
                          ParagraphField(
                            title: AppTexts.paragraph3,
                            controller: _paragraph3Controller,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // column 3
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // par 4
                          ParagraphField(
                            title: AppTexts.paragraph4,
                            controller: _paragraph4Controller,
                          ),
                          Spc(h: 30.h),
                          // par 5
                          ParagraphField(
                            title: AppTexts.paragraph5,
                            controller: _paragraph5Controller,
                          ),
                          Spc(h: 80.h),

                          // button
                          Button(
                            onTap: () {
                              if (_uploadKey.currentState!.validate()) {
                                String content =
                                    '${_paragraph1Controller.text}\n${_paragraph2Controller.text}\n${_paragraph3Controller.text}\n${_paragraph4Controller.text}\n${_paragraph5Controller.text}';

                                // upload news
                                _adminServices.uploadNews(
                                  context: context,
                                  image: File.fromRawPath(pickedWebImage),
                                  title: _titleController.text,
                                  author: _authorController.text,
                                  content: content,
                                  date: DateFormat('E, d MMM y - kk:mm')
                                      .format(DateTime.now()),
                                  imageNewsletter:
                                      File.fromRawPath(pickedWebNewsLetter),
                                );
                              }
                            },
                            item: Text(
                              AppTexts.uploadNews,
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.neutralWhite),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// image picker
// final ImagePicker picker = ImagePicker();
//       XFile? image = await picker.pickImage(source: ImageSource.gallery);
//       if (image != null) {
//         var selected = File(image.path);
//         setState(() {
//           pickedImage = selected;
//         });
//       } else {
//         print('No image picked');
//       }

// DateFormat('E, d MMM y - kk:mm').format(DateTime.now())
