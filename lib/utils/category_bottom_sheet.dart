import 'dart:math';

import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/utils/category_tile.dart';

Future<dynamic> showBottomSheetCategory( {required BuildContext context}) {
  return showModalBottomSheet(
      context: context,
      backgroundColor: Color.fromRGBO(20, 20, 20, 0.5),
      barrierColor: Colors.black45,
      builder: (context) {
        return GlassContainer(
          blur: 3,
          shadowStrength: 20,
          opacity: 0.05,
          width: max(MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.height
          ),
          borderRadius: BorderRadius.circular(40),
          child:  Center(
            child: GridView.count(
                crossAxisCount: 2,
            children: [
              categoryTile(
                  'linux', 'Linux', context, "assets/images/linux.png"
              ),
              categoryTile(
                  'bash', 'Bash', context, "assets/images/linux.png"
              ),
              categoryTile(
                  'docker', 'Docker', context, "assets/images/docker.png"
              ),
              categoryTile(
                  'sql', 'MySQL', context, "assets/images/mysql.png"
              ),
              categoryTile(
                  'cms', 'CMS', context,"assets/images/laravel.png"
              ),
              categoryTile(
                  'code', 'Code', context, "assets/images/laravel.png"
              ),
              categoryTile(
                  'devops', 'DevOps', context,  "assets/images/laravel.png"
              ),
              categoryTile(
                  "uncategorized", "Un Categorized", context,  "assets/images/js.png"
              ),


            ],

            ),
          ),
        );
      });
}