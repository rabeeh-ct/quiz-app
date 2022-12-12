class QuestionModel{
  List<Question>? question;

  QuestionModel({required this.question});
  QuestionModel.fromJson(Map<String,dynamic> json){
    question=List.from(json['question']).map((e) => Question.fromJson(e)).toList();
  }
}

class Question {
  String? question;
  List<String>? answers;
  int? correctAnswer;

  Question({required this.question,required this.answers,required this.correctAnswer});
  List<Question> questions=[];
  Question.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answers = json['answers'].cast<String>();
    correctAnswer = json['correctAnswer'];
  }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    data['answers'] = this.answers;
    data['correctAnswer'] = this.correctAnswer;
    return data;
  }
}