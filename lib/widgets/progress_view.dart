import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../constants.dart';

class ProgressView extends StatelessWidget {
  const ProgressView({Key? key, required this.totalQuestions})
      : super(key: key);
  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * .2,
        ),
        totalQuestions / Constants.ansCount < 2
            ? const Text(
                'Congratulations',
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                    color: Colors.deepPurple),
              )
            : const SizedBox(),
        Text(totalQuestions / Constants.ansCount < 2 ? 'You Win' : 'You Lose',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(
          height: size.height * .05,
        ),
        //Progress Indicator
        CircularStepProgressIndicator(
          totalSteps: totalQuestions,
          currentStep: Constants.ansCount,
          stepSize: 15,
          selectedColor: Colors.greenAccent[400],
          unselectedColor: Colors.grey[300],
          padding: 0,
          width: 150,
          height: 150,
          selectedStepSize: 15,
          roundedCap: (_, __) => true,
          child: Center(
              child: Text(
            '${Constants.ansCount}/$totalQuestions',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
        ),
        SizedBox(
          height: size.height * .2,
        ),
        InkWell(
          onTap: () {
            Constants.ansCount=0;
            Constants.pgctr.jumpToPage(0);
          },
          child: Container(
            width: size.width * .8,
            height: size.height * .08,
            decoration: BoxDecoration(
              color: Colors.deepPurple[500],
              borderRadius: BorderRadius.circular(30)
            ),
            child: const Center(
                child: Text('Play Again',
                    style: TextStyle(color: Colors.white, fontSize: 18))),
          ),
        )
      ],
    );
  }
}
