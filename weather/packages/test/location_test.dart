import 'dart:html';

import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Location', () {
    group('fromJson', () {
      test('throws Checked FromJsonException when enum is unknown', () {
        expect(
            () => Location.fromJson(<String, dynamic>{
                  'title': 'mock_title',
                  'location_type': 'Unknown',
                  'latt_long': '-34.75,83.28',
                  'woeid': 42
                }),
            throwsA(isA<CheckedFromJsonException>()));
      });
    });
  });
}
