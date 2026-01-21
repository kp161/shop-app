import 'package:flutter/foundation.dart';

class IsolateParser {
  static Future<T> parse<T>(
    T Function(Map<String, dynamic>) parser,
    Map<String, dynamic> json,
  ) async {
    return compute<_IsolateInput<T>, T>(
      _runParser,
      _IsolateInput(parser, json),
    );
  }

  static Future<List<T>> parseList<T>(
    T Function(Map<String, dynamic>) parser,
    List<dynamic> listJson,
  ) async {
    return compute<_IsolateListInput<T>, List<T>>(_runListParser,
        _IsolateListInput(parser, List<Map<String, dynamic>>.from(listJson)));
  }
}

class _IsolateInput<T> {
  final T Function(Map<String, dynamic>) parser;
  final Map<String, dynamic> json;

  _IsolateInput(this.parser, this.json);
}

class _IsolateListInput<T> {
  final T Function(Map<String, dynamic>) parser;
  final List<Map<String, dynamic>> listJson;

  _IsolateListInput(this.parser, this.listJson);
}

T _runParser<T>(_IsolateInput<T> input) {
  return input.parser(input.json);
}

List<T> _runListParser<T>(_IsolateListInput<T> input) {
  return input.listJson.map(input.parser).toList();
}
