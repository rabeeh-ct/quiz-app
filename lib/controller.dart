import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:quiz_app/model/question_model.dart';

class Controller extends GetxController {
  var isLoading = false.obs;
  QuestionModel? questionModel;

  Future<void> onInit()async {
    super.onInit();
    getData();
  }

  getData() async {
    try {
      isLoading.value = true;
      String url =
          'https://run.mocky.io/v3/5121498d-aadd-471d-afc6-701ea6392fda';
      var response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsondata = jsonDecode(response.body);
        questionModel = QuestionModel.fromJson(jsondata);
      } else {
        print('error');
      }
    } catch (e) {
      print(e.toString());
    } finally{
      isLoading.value=false;
    }
  }
}
