import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<SubmitLearningBoxExamResultResponse> submitLearningBoxExamResult(SubmitLearningBoxExamResultRequest request) async {
  final response = await http.post(
    Uri.parse('http://localhost:8080/caracal-words/caracal-words/submit-learning-box-exam-result'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'userWordSource': request.userWordSource,
      'wordId': request.wordId,
      'result': request.result.toString()
    }),
  );

  if (response.statusCode >= 200 && response.statusCode < 300) {
    // If the server did return a 2xx response,
    // then parse the JSON.
    return SubmitLearningBoxExamResultResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
    
  } else {
    // If the server did not return a 200 services response,
    // then throw an exception.
    throw Exception('Failed to submit result');
  }
}

class SubmitLearningBoxExamResultRequest {
  final String userWordSource;
  final String wordId;
  final bool result;

  const SubmitLearningBoxExamResultRequest({
    required this.userWordSource,
    required this.wordId,
    required this.result,
  });
}

class SubmitLearningBoxExamResultResponse {
  final int learningBoxSize;

  const SubmitLearningBoxExamResultResponse({
    required this.learningBoxSize,
  });

  factory SubmitLearningBoxExamResultResponse.fromJson(Map<String, dynamic> json) {
    return SubmitLearningBoxExamResultResponse(
      learningBoxSize: json['learningBox'](),
    );
  }
}
