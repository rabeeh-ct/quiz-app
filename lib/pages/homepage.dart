// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controller.dart';
import 'package:quiz_app/services/services.dart';
import 'package:quiz_app/widgets/progress_view.dart';
import 'package:quiz_app/widgets/question_widget.dart';

import '../model/question_model.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);

  Controller ctr=Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[500],
        title: const Text('Quiz App'),
        centerTitle: true,
      ),
      body: Obx(() => ctr.isLoading.value?Center(child: CircularProgressIndicator(),):
         PageView.builder(
          physics: NeverScrollableScrollPhysics(),
      controller: Constants.pgctr,
      itemCount: ctr.questionModel!.question!.length + 1,
      itemBuilder: (context, index) {
        if (index < ctr.questionModel!.question!.length) {
          //Questions Viewing Page
          return QuestionView(
            qu: Question(correctAnswer: ctr.questionModel!.question![index].correctAnswer,
            answers: ctr.questionModel!.question![index].answers,
            question: ctr.questionModel!.question![index].question),
            number: index,
          );
        } else {

          //Progress Viewing page
          return ProgressView(totalQuestions: ctr.questionModel!.question!.length);
        }
      },
    ))
    );
  }
}
/*
if (index < snapshot.data!.length) {
                      //Questions Viewing Page
                      return QuestionView(
                        qu: Question(
                            snapshot.data![index].question,
                            snapshot.data![index].options,
                            snapshot.data![index].correctans),
                        number: index,
                      );
                    } else {

                      //Progress Viewing page
                      return ProgressView(totalQuestions: snapshot.data!.length);
                    }
 */
