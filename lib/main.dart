import 'package:flutter/material.dart';
import 'questionsBrain.dart';
import 'question.dart';

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
  final List<Question> questions = QuestionsBrain().questions;
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
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
    if (buttonValue == widget.questions[indexQuestionShowed].answer) {
      addOkCheck();
    } else {
      addWrongMark();
    }
    showNextQuestion();
  }

  void showNextQuestion() {
    if (indexQuestionShowed < widget.questions.length - 1) {
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
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            child: Center(
              child: Text(
                widget.questions[indexQuestionShowed].title,
                style: Theme.of(context).textTheme.headline5.copyWith(
                      color: Colors.indigo[700],
                    ),
                textAlign: TextAlign.justify,
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
