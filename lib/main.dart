
import 'question.dart';
import 'quiz_brain.dart';
import 'package:flutter/material.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(const QuizzlerBody());
}

class QuizzlerBody extends StatelessWidget {
  const QuizzlerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Center(child: Text('Quizzler', style: TextStyle(color: Colors.white),)),
            ),
            body: QuizlerContent(),
          ),
        ),
    );
  }
}

class QuizlerContent extends StatefulWidget {
  const QuizlerContent({Key? key}) : super(key: key);

  @override
  _QuizlerContentState createState() => _QuizlerContentState();
}
List <Icon> scoreKeeper = [];

void checkAnswer(bool userPickedAnswer){
  bool correctAnswer = quizBrain.getQuestionAnswer();

  setState(() {
    
  if (userPickedAnswer == correctAnswer){
    scoreKeeper.add(Icon(Icons.check,color: Colors.green,));
  }
  else {
    scoreKeeper.add(Icon(Icons.close,color: Colors.red,));
  }


    quizBrain.nextQuestion();
  });
}

class _QuizlerContentState extends State<QuizlerContent> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Center(child: Text(quizBrain.getQuestionText(),style: TextStyle(color: Colors.white,fontSize: 15.0),)),
                color: Colors.black,
                margin: EdgeInsets.only(top:220.0,bottom: 10.0),
              ),
              FlatButton(
                height: 30.0,
                color: Colors.black,
                onPressed: () {
                    checkAnswer(true);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 50.0),
                  width:double.infinity,
                  height: 50.0,
                  color: Colors.green,
                  child: Center(child: Text('True', style: TextStyle(color: Colors.white,fontSize: 20.0),)),
                ),
              ),
              FlatButton(
                height: 30.0,
                color: Colors.black,
                onPressed: () {
                  checkAnswer(false);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20.0),
                  width:double.infinity,
                  height: 50.0,
                  color: Colors.red,
                  child: Center(child: Text('False', style: TextStyle(color: Colors.white,fontSize: 20.0),)),
                ),
              ),
              Row(
                children: [...scoreKeeper],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
