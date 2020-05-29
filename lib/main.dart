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

class _QuizState extends State<Quiz> {
  final List<Widget> score = [];

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

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Center(
            child: Text(
              "Esta es la pregunta",
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
            onPressed: () {},
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
            onPressed: () {},
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
