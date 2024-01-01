import 'dart:async';
import 'dart:convert';

import 'package:caracal_words/service/id_repository.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

Future<WordExamItem> fetchRandomWordExamItem(
    String userWordSourceId, int index) async {
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': getToken()
  };

  final response = await http.get(
      headers: requestHeaders,
      Uri.parse(
          'http://localhost:8080/caracal-words/fetch-from-learning-box/$userWordSourceId?index=$index'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseWordExamItem, response.body);
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
        score: '1',
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
  final String score;
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
      score: json['score'].toString(),
      choices: List<String>.from(json['choices']),
    );
  }
}
