

import 'package:flutter/material.dart';
import 'package:quiz_app/api/url_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'difficulty_bottom_sheet.dart';

Padding categoryTile(
  String category, String title, BuildContext context, String imageUrl) {

  return Padding(
      padding: const EdgeInsets.all(25.0),
    child: InkWell(
      onTap: () {
        urlDataCategory(category);
        Navigator.pop(context);
        showBottomSheetDifficulty(context);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration:   BoxDecoration(

          color: const Color.fromRGBO(200, 200, 200, 0.12),
          image: const DecorationImage(
          image: CachedNetworkImageProvider(
              'https://img.icons8.com/dotty/160/000000/question-mark.png'),
          fit: BoxFit.scaleDown,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(title,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: 'Ubuntu',
          ),),
        ),
      ),

    ),


  );

}