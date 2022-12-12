// import 'dart:convert';
//
// import 'package:http/http.dart';
// import 'package:quiz_app/model/question_model.dart';
//
// class Services {
//
//   static Future<List<Question>> getData() async {
//
//      List<Question> questions=[];
//     var response = await get(Uri.parse(
//         'https://run.mocky.io/v3/5121498d-aadd-471d-afc6-701ea6392fda'));
//     var jsonData=jsonDecode(response.body);
//     for (var i in jsonData){
//       // print(i['answers']);
//       var a=Question(i['question'], i['answers'], i['correctAnswer']);
//       // print(a.options);
//       questions.add(a);
//     }
//     return questions;
//   }
// }
