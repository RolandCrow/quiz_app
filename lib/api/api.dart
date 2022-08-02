import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz_app/model/question_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const apiKey = 'j24WhINsXuMG7PszLmbkLHqRiXRoFnjRZrHxkwDa';

Future fetchData(listModel) async {
  SharedPreferences  urlDataPref =  await SharedPreferences.getInstance();

  String? selectedDifficulty =
      urlDataPref.getString('selectedDifficulty').toString().trim();

  String? selectedCategory =
      urlDataPref.getString('selectedCategory').toString().trim();

  List<Question> dataList = [];

  http.Response response;

  response = await http.get(
    Uri.parse(
      'https://quizapi.io/api/v1/questions?apiKey=j24WhINsXuMG7PszLmbkLHqRiXRoFnjRZrHxkwDa&category=linux&difficulty=easy&limit=20'),
      headers: {"Accept": "application/json"},
    );
    if(response.statusCode == 200) {
      var data =  json.decode(response.body);
      for(Map<String, dynamic> i in data){
        dataList.add(Question.fromJson(i));
      }
      listModel = dataList;
    }

}

String findCorrectAnswer(CorrectAnswers correctAnswers) {

  String correctOption = '';

  if(correctAnswers.answerACorrect == "true") {
    correctOption = 'a';
  } else if(correctAnswers.answerBCorrect == "true") {
    correctOption = "b";
  } else if(correctAnswers.answerCCorrect == "true") {
    correctOption = "c";
  }  else if(correctAnswers.answerDCorrect == "true") {
    correctOption = "d";
  }  else if(correctAnswers.answerECorrect == "true") {
    correctOption = "e";
  } else if(correctAnswers.answerFCorrect == "true") {
    correctOption = "f";
  }
  return correctOption;


}



