import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:project_news_web_admin/models/news.dart';
import 'package:project_news_web_admin/providers/user_provider.dart';
import 'package:project_news_web_admin/shared/app_elements/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:project_news_web_admin/shared/utils/alert.dart';
import 'package:project_news_web_admin/shared/utils/error_handling.dart';
import 'package:provider/provider.dart';

class AdminServices {
  //! upload images
  void uploadNews(
      {required BuildContext context,
      required File image,
      required String title,
      required String author,
      required String content,
      required String date,
      required File imageNewsletter}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloudinary = CloudinaryPublic('kiishi', 'iz9lvawr');
      String imageUrl;
      String imageNewsletterUrl;
      CloudinaryResponse resp = await cloudinary
          .uploadFile(CloudinaryFile.fromFile(image.path, folder: title));
      CloudinaryResponse resp2 = await cloudinary
          .uploadFile(CloudinaryFile.fromFile(image.path, folder: title));
      imageUrl = resp.secureUrl;
      imageNewsletterUrl = resp2.secureUrl;

      News newsUpload = News(
        title: title,
        author: author,
        content: content,
        image: imageUrl,
        date: date,
        imageNewsletter: imageNewsletterUrl,
      );

      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/admin/upload-news'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: newsUpload.toJson(),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showAlert(context, 'Image Uploaded successfully');
        },
      );
    } catch (e) {
      showAlert(context, e.toString());
      print(e.toString());
    }
  }
}
