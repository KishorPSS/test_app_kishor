import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:eschoolapp/models/announcement_Model.dart';
import 'package:eschoolapp/models/homework_model.dart';
import 'package:eschoolapp/models/online_exam_schedule_model.dart';
import 'package:eschoolapp/models/payment_history_model.dart';
import 'package:http/http.dart' as http;
import 'models/question_model.dart';
import 'widget_helper/constants.dart' as constant;

class GlobalHelper {
  holiday(
      String studentId,String currentYear
      ) async{
   var response = await http.get(
     Uri.parse(
         '${constant.apiName}/holiday?apikey=${constant.apiKey}&txtYear=$currentYear&numStudentID=27405'),
   );
   // log(response.body);
   if (response.statusCode == 200) {
     var responseData = jsonDecode(response.body);
   return responseData;}
 }
 attendance(
     String studentId,String currentYear
     ) async{
   var response = await http.get(
     Uri.parse(
         '${constant.apiName}/attendence?apikey=${constant.apiKey}&txtYear=$currentYear&numStudentID=27405'),
   );
   // log(response.body);
   if (response.statusCode == 200) {
     var responseData = jsonDecode(response.body);
   return responseData;
   }
 }
  login(String username, String password) async {
    var response = await http.post(
      Uri.parse('${constant.apiName}/login'),
      body: {
        'apikey': '3OZNsHgGOwcGZwtEVQ4bkopWc1bSc4kh',
        'login_name': username,
        // 'nunStudentID': username,
        'password': password,
        // 'login_name': '24149180',
        // 49180
        // 'password': 'Anushree@1309',
      },
    );

    log(response.body);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
    
      return responseData;
    } else {
      throw Exception('Failed to Fetch Data: ${response.statusCode}');
    }
  }

  Future<List<AnnouncementModel>?> getAnnouncements(
      String studentId, String currentYear) async {
    var response = await http.get(
      Uri.parse(
          '${constant.apiName}/announcementsinfo?numStudentID=$studentId&&apikey=${constant.apiKey}&textYear=$currentYear'),
    );
    // log(response.body);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      var announcementData = responseData['announcements'];
      // print(announcementData[0]);
      List<AnnouncementModel>? announcementList;
      announcementList = announcementData
          .map((items) => AnnouncementModel.from(items))
          .toList()
          .cast<AnnouncementModel>();

      return announcementList;
    }
  }

   onlineExamMarks(String studentId, String currentYear, String std) async {
  var response = await http.get(
      Uri.parse(
        '${constant.apiName}/onlinetestreport?apikey=${constant.apiKey}&numStandard=2&txtYear=$currentYear&numStudentID=$studentId',
      ),
    );
  // 27405
  //   log(response.body);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      // var internalMarksData = responseData['internalMarks'];
      // print('response.runtimeType: ${response.runtimeType}');
      // print(responseData['exam_array'].runtimeType);
      // print(responseData['marks']);
      return responseData;
    } else {
      'Failed to Fetch data : ${response.statusCode}';
    }
  }

  Future<List<HomeworkModel>?> getHomeworkData(
      String studentId, String currentYear) async {
    // 49184
    var response = await http.get(
      Uri.parse(
          '${constant.apiName}/homework?numStudentID=$studentId&apikey=${constant.apiKey}&txtYear=$currentYear'),
    );
log(response.body);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      List<dynamic> homeworkData = [];
      homeworkData = responseData['homeWorkDetail'];
      // print(homeworkData[0]);
      List<HomeworkModel>? homeworkDataList;
      homeworkDataList = homeworkData.reversed
          .map((items) => HomeworkModel.from(items))
          .toList()
          .cast<HomeworkModel>();
    
      return homeworkDataList;
    }
  }

  Future<List<ExamScheduleModel>?> onlineExamSchedule(String studentId,String currentYear) async {

    var response = await http.get(Uri.parse(
      '${constant.apiName}/onlineexams?numStudentID=$studentId&apikey=${constant.apiKey}&txtYear=$currentYear',
    ));
    // 42678
    log(response.body);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      var scheduleData = responseData['onlineexams'];
      List<ExamScheduleModel> examScheduleList;
      examScheduleList = scheduleData
          .map((items) => ExamScheduleModel.formMap(items))
          .toList()
          .cast<ExamScheduleModel>();
      log(scheduleData.toString());
      return examScheduleList;
    }
  }

  Future<Map<String, dynamic>?> getStudentInfo(String studentId) async {
    var response = await http.get(Uri.parse(
      '${constant.apiName}/studentinfo?numStudentID=$studentId&&apikey=${constant.apiKey}',
    ));
    log(response.body);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      var studentData = responseData['student_info'];
     
      return studentData;
    }
  }

  getSubjectList(String std) async {
    var response = await http.post(
        Uri.parse(
            '${constant.apiName}/subjectslist'),
        body: {'numStandard': std});
    log(response.body);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      return responseData;
    }
  }

  Future<List<PaymentHistoryModel>?> feePaid(
      String studentId, String currentYear) async {
    // 42678
    var response = await http.get(
      Uri.parse(
        '${constant.apiName}/feepaid?numStudentID=$studentId&apikey=${constant.apiKey}&txtYear=$currentYear',
      ),
    );
    log(response.body);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      List<PaymentHistoryModel> paymentHistoryList;
      paymentHistoryList = responseData
          .map((items) => PaymentHistoryModel.formMap(items))
          .toList()
          .cast<PaymentHistoryModel>();
      log(responseData.toString());
      return paymentHistoryList;
    }
  }

  feedbackAnswers(
    String studentId,
    String que1,
    String que2,
    String que3,
    String que4,
    String que5,
    String que6,
    String que7,
    String que8,
    String que9_1,
    String que9_2,
    String que9_3,
    String que9_4,
    String que9_5,
    String otherConcern,
    String subjectId,
  ) async {

    var response = await http.post(
        Uri.parse(
            '${constant.apiName}/feedbackanswers'),
        body: {
          // 49180
          'apikey': constant.apiKey,
          'numStudentID': studentId,
          'question_1': que1,
          'question_2': que2,
          'question_3': que3,
          'question_4': que4,
          'question_5': que5,
          'question_6': que6,
          'question_7': que7,
          'question_8': que8,
          'question_9_1': que9_1,
          'question_9_2': que9_2,
          'question_9_3': que9_3,
          'question_9_4': que9_4,
          'question_9_5': que9_5,
          'other_concern': otherConcern,
          'subject_id': subjectId
          //   subject key
        });
    log(response.body);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
     
      return responseData;
    } else {
      return Exception('Failed to Fetch Data ${response.statusCode}');
    }
  }

  Future<List<QuestionModel>?> getFeedBackQuestion() async {
    var response = await http.get(
      Uri.parse(
          '${constant.apiName}/feedbackquestions?apikey=${constant.apiKey}'),
    );
    log(response.body);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      var dataFeedBack = responseData['feedback_questions'];

      List<QuestionModel>? questionsDataList;
      questionsDataList = dataFeedBack
          .map((items) => QuestionModel.from(items))
          .toList()
          .cast<QuestionModel>();
      return questionsDataList;
    }
  }
}
