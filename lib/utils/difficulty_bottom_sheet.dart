
import 'dart:math';

import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:flutter/material.dart';

import 'difficulty_tile.dart';



Future<dynamic> showBottomSheetDifficulty(BuildContext context) {
  return showModalBottomSheet(
      context: context, 
      backgroundColor: const Color.fromRGBO(20, 20, 20, 0.5),
      barrierColor: Colors.black45,
      builder: (context) {
        return GlassContainer(
          blur: 3,
          shadowStrength: 20,
          opacity: 0.05,
          width: max(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
          borderRadius: BorderRadius.circular(40),
          child: Center(
            child: Builder(builder: (context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const Padding(
                      padding: EdgeInsets.all(32.0),
                    child: SizedBox(
                      child: Text(  "Selected Difficulty",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,)),
                    ),


                  ),
                  difficultyTile("easy", "Easy", context),
                  difficultyTile("medium", "Medium", context),
                  difficultyTile("hard", "Hard", context),
                ],
              );
            },),
          ),
        );
      });

}