import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.indigoAccent,
      ),
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text("Quiz"),
        ),
        body: Quiz(),
      ),
    );
  }
}

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class Questions {
  final String title;
  final bool answer;

  Questions(this.title, this.answer);
}

class _QuizState extends State<Quiz> {
  static final questions = [
    Questions("Question 1", true),
    Questions("Question 2", false),
    Questions("Question 3", false),
    Questions("Question 4", true),
    Questions("Question 5", true),
    Questions("Question 6", true),
    Questions("Question 7", false),
    Questions("Question 8", false),
    Questions("Question 9", true),
    Questions("Question 10", true),
    Questions("Question 11", false),
    Questions("Question 12", true)
  ];
  final List<Widget> score = [];

  var indexQuestionShowed = 0;

  void addOkCheck() {
    score.add(
      Icon(
        Icons.check,
        color: Colors.green,
      ),
    );
  }

  void addWrongMark() {
    score.add(
      Icon(
        Icons.close,
        color: Colors.red,
      ),
    );
  }

  void checkAnswer(bool buttonValue) {
    if (buttonValue == questions[indexQuestionShowed].answer) {
      addOkCheck();
    } else {
      addWrongMark();
    }
    showNextQuestion();
  }

  void showNextQuestion() {
    if (indexQuestionShowed < questions.length - 1) {
      indexQuestionShowed++;
    } else {
      indexQuestionShowed = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Center(
            child: Text(
              questions[indexQuestionShowed].title,
              style: Theme.of(context).textTheme.headline5.copyWith(
                    color: Colors.indigo[700],
                  ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: RaisedButton(
            color: Colors.lightGreen,
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              "True",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: Colors.grey[300]),
            ),
            onPressed: () {
              setState(() => checkAnswer(true));
            },
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: RaisedButton(
            color: Colors.redAccent,
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text("False",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: Colors.grey[300])),
            onPressed: () {
              setState(() => checkAnswer(false));
            },
          ),
        ),
        score.length != 0
            ? Container(
                margin: EdgeInsets.only(
                    left: 16.0, bottom: 16.0, top: 8.0, right: 16.0),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 4.0,
                  runSpacing: 8.0,
                  children: score,
                ),
              )
            : Container(
                margin: EdgeInsets.only(bottom: 16.0),
              ),
      ],
    );
  }
}
