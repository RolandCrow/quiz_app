import 'dart:convert';

List<Question> modelUserFromJson(String str) =>
    List<Question>.from(json.decode(str).map((x) => Question.fromJson(x)));

String modelUserToJson(List<Question> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Question {
  String question;
  Answers answers;
  CorrectAnswers correctAnswers;
  String? correctAnswer;

  Question({
    required this.question,
    required this.answers,
    required this.correctAnswer,
    required this.correctAnswers,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    question: json["question"],
    answers: Answers.fromJson(json["answers"]),
    correctAnswers: CorrectAnswers.fromJson(json["correct_answers"]),
    correctAnswer: json["correct_answer"],
  );

  Map<String, dynamic> toJson() => {
    "question": question,
    "answers": answers.toJson(),
    "correctAnswer": correctAnswer,
  };
}

class Answers {
  String? answerA;
  String? answerB;
  String? answerC;
  String? answerD;
  String? answerE;
  String? answerF;

  Answers({
    required this.answerA,
    required this.answerB,
    required this.answerC,
    required this.answerD,
    required this.answerE,
    required this.answerF,
  });

  factory Answers.fromJson(Map<String, dynamic> json) => Answers(
    answerA: json["answer_a"],
    answerB: json["answer_b"],
    answerC: json["answer_c"],
    answerD: json["answer_d"],
    answerE: json["answer_e"],
    answerF: json["answer_f"],
  );

  Map<String, dynamic> toJson() => {
    "answer_a": answerA,
    "answer_b": answerB,
    "answer_c": answerC,
    "answer_d": answerD,
    "answer_e": answerE,
    "answer_f": answerF,
  };
}

class CorrectAnswers {
  String answerACorrect;
  String answerBCorrect;
  String answerCCorrect;
  String answerDCorrect;
  String answerECorrect;
  String answerFCorrect;

  CorrectAnswers({
    required this.answerACorrect,
    required this.answerBCorrect,
    required this.answerCCorrect,
    required this.answerDCorrect,
    required this.answerECorrect,
    required this.answerFCorrect,
  });

  factory CorrectAnswers.fromJson(Map<String, dynamic> json) => CorrectAnswers(
    answerACorrect: json["answerACorrect"],
    answerBCorrect: json["answerBCorrect"],
    answerCCorrect: json["answerCCorrect"],
    answerDCorrect: json["answerDCorrect"],
    answerECorrect: json["answerECorrect"],
    answerFCorrect: json["answerFCorrect"],
  );

  Map<String, dynamic> toJson() => {
    "answerACorrect":  answerACorrect,
    "answerBCorrect": answerBCorrect,
    "answerCCorrect": answerCCorrect,
    "answerDCorrect":  answerDCorrect,
    "answerECorrect": answerECorrect,
    "answerFCorrect":  answerFCorrect,
  };
}