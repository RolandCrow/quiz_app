import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/style/theme.dart';
import 'package:quiz_app/utils/option_tile.dart';
import 'package:quiz_app/utils/timer_element.dart';
import 'package:quiz_app/view/result_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api.dart';
import '../model/question_model.dart';


List result = [];
String currentSelectedOption = "w";

choose(String option) {
  String currentSelectedOption = option;
  return currentSelectedOption;
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}): super(key: key);

  @override
  State<StatefulWidget> createState() => _QuizScreenState();

}


class _QuizScreenState extends State<QuizScreen> {

  List<Question> listModel = [];
  List<Question> dataList = [];
  int currentIndex = 0;
  var loading = false;
  dynamic currentQuestionData;

  static const countdownDuration =
      Duration(minutes: 5, seconds: 0, milliseconds: 0);

  Duration duration = const Duration();
  Timer? timer;
  bool countdown = true;

  Future getData() async {
    SharedPreferences urlDataPref = await SharedPreferences.getInstance();

    String? selectedDifficulty =
        urlDataPref.getString("selectedDifficulty").toString().trim();
    String? selectedCategory =
        urlDataPref.getString("selectedCategory").toString().trim();

    setState(() {
      loading = true;
    });

    final responseData = await http.get(
      Uri.parse(
          "https://quizapi.io/api/v1/questions?apiKey=j24WhINsXuMG7PszLmbkLHqRiXRoFnjRZrHxkwDap&category=$selectedCategory&difficulty=$selectedDifficulty&limit=10"),
    );

    if(responseData.statusCode == 200) {
      final data = jsonDecode(responseData.body);
      for(Map<String, dynamic> i in data ) {
        dataList.add(Question.fromJson(i));
      }

      setState(() {
        listModel = dataList;
        loading = false;
        currentIndex = 0;
      });
    }
  }
  @override
  initState() {
    super.initState();

    getData();
    result = [];
    currentIndex = 0;

    reset();
    startTimer();
    
  }
  
  void reset() {
    if(countdown) {
      setState(() => duration = countdownDuration);
    } else {
      setState(() => duration = const Duration());
    }
  }
  
  void startTimer() {
    timer = Timer.periodic(const Duration(milliseconds: 1), (_) => addTime());
  }

  void addTime() {
    final addSeconds = countdown ? -1 : 1;
    final addMilliseconds = countdown ? -1: 1;

    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      final milliseconds = duration.inMilliseconds + addMilliseconds;
      final minutes = duration.inMinutes;

      if(milliseconds < 0) {
        timer?.cancel();
        finish();
      } else {
        duration = Duration(milliseconds: milliseconds);
      }
    });
  }

  void stopTimer({bool resets = true}) {
    if(resets) {
      reset();
    }
    setState(() => timer?.cancel());
  }


  void finish() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return ResultScreen(resultData: result);
    }));
  }

  Widget textToTime() {
   return const Text(
        ":",
        style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        fontFamily: 'Ubuntu'
    ));
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String threeDigits(int n) => n.toString().padLeft(3, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    final millisec = threeDigits(duration.inMilliseconds.remainder(100));

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      buildTimeCard(
          time: minutes
      ),
    textToTime(),
    buildTimeCard(
    time: seconds,
      ),
    textToTime(),
      buildTimeCard(time: millisec,),

      ]);
  }


  @override
  Widget build(BuildContext context) {

    void incrementIndex() {
      setState(() {
        currentIndex < 9 ? currentIndex++ : finish;
        Question currentQuestionData = listModel[currentIndex];
      });
    }

    Question currentQuestionData = listModel[currentIndex];
    String? optionA = currentQuestionData.answers.answerA;
    String? optionB = currentQuestionData.answers.answerB;
    String? optionC = currentQuestionData.answers.answerC;
    String? optionD = currentQuestionData.answers.answerD;
    String? optionE = currentQuestionData.answers.answerE;
    String? optionF = currentQuestionData.answers.answerF;

    void checkAnswer() {
      String currentCorrectAnswer = findCorrectAnswer(currentQuestionData.correctAnswers);
      if(currentSelectedOption == currentCorrectAnswer) {
        result.add(true);
      } else {
        result.add(false);
      }
      if(currentIndex < 9) {
        incrementIndex();
      } else {
        finish();
      }
    }
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: loading
                ? const Center(child: CircularProgressIndicator())
              : Column(
              children: [
                SizedBox(
                  height: 40,
                  child: Center(
                    child: buildTime(),
                  ),
                ),
                LinearProgressIndicator(
                  value: (currentIndex / 10),
                  semanticsLabel: 'Linear progress indicator',
                  backgroundColor: primaryColor,
                  valueColor: const AlwaysStoppedAnimation<Color>(secondaryColor),

                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          currentQuestionData.question,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Ubuntu',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          optionA != null
                            ? optionTile(checkAnswer,'a', context, optionA)
                              : Container(),
                          optionB != null
                              ? optionTile(checkAnswer,'b', context, optionB)
                              : Container(),
                          optionC != null
                              ? optionTile(checkAnswer,'c', context, optionC)
                              : Container(),
                          optionD != null
                              ? optionTile(checkAnswer,'d', context, optionD)
                              : Container(),
                          optionE != null
                              ? optionTile(checkAnswer,'e', context, optionE)
                              : Container(),
                          optionF != null
                              ? optionTile(checkAnswer,'f', context, optionF)
                              : Container(),
                        ],
                      ),
                    ],
                  ),
                )
              ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          style: const ButtonStyle(),
          onPressed: checkAnswer,
          child: Container(
            height: 50,
            child: Center(
              child: Text(
                currentIndex == 9 ? 'Finish': 'Next',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'Ubuntu'),
                ),
              ),
            ),
          ),

        ),
      );
  }


}