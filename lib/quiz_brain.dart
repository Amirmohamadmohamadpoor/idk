import 'question.dart';

class QuizBrain{
  int _questionNumber = 0;

  List <Question> _QuestionLists = [

    Question(q: 'Some cats are actually allergic to humans',a: true),
    Question(q: 'You can lead a cow down stairs but not up stairs.',a: false),
    Question(q:'Approximately one quarter of human bones are in the feet.',a: true),
    Question(q:'A slug\'s blood is green.',a: true),
    Question(q:'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',a: true),
    Question(q:'It is illegal to pee in the Ocean in Portugal.',a: true),

  ];
  void nextQuestion(){
    if (_questionNumber < _QuestionLists.length - 1){
      _questionNumber++;
    }
    print(_questionNumber);
    print(_QuestionLists.length);
  }

  String getQuestionText(){
  return _QuestionLists[_questionNumber].q;
  }

  bool getQuestionAnswer(){
    return _QuestionLists[_questionNumber].a;
  }

}