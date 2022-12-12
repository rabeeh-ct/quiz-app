// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/services/services.dart';
import 'package:quiz_app/widgets/progress_view.dart';
import 'package:quiz_app/widgets/question_widget.dart';

import '../model/question_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[500],
          title: const Text('Quiz App'),
          centerTitle: true,
        ),
        body: FutureBuilder<List<Question>>(
            future: Services.getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: Constants.pgctr,
                  itemCount: snapshot.data!.length + 1,
                  itemBuilder: (context, index) {
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
                  },
                );
              }
            }));
  }
}
