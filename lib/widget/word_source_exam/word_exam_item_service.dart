import 'dart:async';
import 'dart:convert';

import 'package:caracal_words/utility/id_repository.dart';
import 'package:http/http.dart' as http;

Future<WordExamItem> fetchWordFromLearningBox(
  String userWordSourceId,
  int index,
) async {
  print('going to call fetch service...');
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': await getToken()
  };
  print('going to call fetch service... step 2');
  final response = await http.get(
      headers: requestHeaders,
      Uri.parse(
          'http://localhost:8080/caracal-words/fetch-from-learning-box/$userWordSourceId?index=$index'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return parseWordExamItem(response.body);
  // return compute(parseWordExamItem, response.body);
}

// A function that converts a response body into a List<Photo>.
WordExamItem parseWordExamItem(String responseBody) {
  try {
    Map<String, dynamic> map = jsonDecode(responseBody) as Map<String, dynamic>;
    return WordExamItem.fromJson(map);
  } catch (e) {
    return const WordExamItem(
        sourceId: '1',
        wordId: '1',
        originalWord: '1',
        sourceLanguageMeaning: '1',
        destinationLanguageMeaning: '1',
        examples: '1',
        pronunciation: '1',
        score: 1,
        learningBoxSize: 1,
        choices: ['a', 'b', 'c', 'd']);
  }
}

class WordExamItem {
  final String sourceId;
  final String wordId;
  final String originalWord;
  final String sourceLanguageMeaning;
  final String destinationLanguageMeaning;
  final String examples;
  final String pronunciation;
  final int score;
  final int learningBoxSize;
  final List<String> choices;

  const WordExamItem({
    required this.sourceId,
    required this.wordId,
    required this.originalWord,
    required this.sourceLanguageMeaning,
    required this.destinationLanguageMeaning,
    required this.examples,
    required this.pronunciation,
    required this.score,
    required this.learningBoxSize,
    required this.choices,
  });

  factory WordExamItem.fromJson(Map<String, dynamic> json) {
    return WordExamItem(
      sourceId: json['sourceId'] as String,
      wordId: json['wordId'] as String,
      originalWord: json['originalWord'] as String,
      sourceLanguageMeaning: json['sourceLanguageMeaning'] as String,
      destinationLanguageMeaning: json['destinationLanguageMeaning'] as String,
      examples: json['examples'].toString(),
      pronunciation: (json['pronunciation'] ?? '').toString(),
      score: json['score'] as int,
      learningBoxSize: json['learningBoxSize'] as int,
      choices: List<String>.from(json['choices']),
    );
  }
}
