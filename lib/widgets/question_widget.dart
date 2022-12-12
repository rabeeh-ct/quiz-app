import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/model/question_model.dart';

import '../services/services.dart';

class QuestionView extends StatefulWidget {
  QuestionView({Key? key, required Question this.qu, required int this.number})
      : super(key: key);
  final Question qu;
  final int number;

  @override
  State<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  Color clr = Colors.deepPurple[400]!;
  bool isClickable = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      color: Colors.deepPurple[100],
      child: Column(
        children: [
          SizedBox(
            height: size.height * .08,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * .1,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Question number
                Text('Question: ${widget.number + 1}',
                    style:
                       const TextStyle(fontSize: 17, fontWeight: FontWeight.w400)),
                //Points Earned
                Text('Points: ${Constants.ansCount}',
                    style:
                       const TextStyle(fontSize: 17, fontWeight: FontWeight.w400)),
                // Text('')
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .05),
            child: const Divider(color: Colors.black, thickness: 0.5),
          ),

          //Question Container
          SizedBox(
            height: size.height * .2,
            width: double.infinity,
            // color: Colors.blue[100],
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * .05),
                //Question
                child: Text(
                  widget.qu.question!,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      wordSpacing: 1.5,
                      letterSpacing: .5),
                ),
              ),
            ),
          ),
          //options section
          Expanded(
            child: ListView.separated(
              itemCount: widget.qu.answers!.length,
              separatorBuilder: (context, index) => SizedBox(
                height: size.height * .01,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * .05),
                  child: InkWell(
                    onTap: () => optionfn(index),
                    //options card
                    child: Container(
                      // width: size.width * .,
                      height: size.height * .1,
                      decoration: BoxDecoration(
                        color: clr,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      //options
                      child: Center(
                        child: Text(widget.qu.answers![index],
                            style: const TextStyle(color: Colors.white,fontSize: 18)),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  //function that trigger when a option is select
  optionfn(int index) async {
    if (isClickable == true) {
      if (widget.qu.correctAnswer == index) {
        // print('correct');
        clr = Colors.green;
        Constants.ansCount++;
      } else {
        clr = Colors.red;
        // print('not correct');
      }
      isClickable = false;
      setState(() {});
    }
    await Future.delayed(const Duration(milliseconds: 500));
    Constants.pgctr.jumpToPage(widget.number + 1);
  }
}
